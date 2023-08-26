create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions to generate and output RSS feed and sitemap
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 07.05.2019 - Created
--    Jari Laine 08.01.2020 - Removed categories sitemap
--    Jari Laine 08.01.2020 - Modified use ORDS and blog version 4
--    Jari Laine 09.04.2020 - Utilize blog_url functions parameter p_canonical
--    Jari Laine 17.05.2020 - Removed private function get_app_alias and constant c_pub_app_id
--                          - Moved private function get_ords_service to blog_ords package
--    Jari Laine 23.05.2020 - Changed procedure sitemap_main to use table blog_pages
--                          - Modifications to remove ORDS depency
--                          - New procedures:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_tags
--    Jari Laine 30.10.2021 - Changed procedure sitemap_main to use view apex_application_pages
--    Jari Laine 13.11.2021 - Changed procedure rss
--    Jari Laine 30.12.2021 - Changed procedure rss_xsl. CSS file name moved to application settings
--    Jari Laine 05.01.2021 - Added parameter p_css_file to procedure rss_xsl
--    Jari Laine 13.03.2022 - Added parameter p_process_nae to procedure sitemap_index
--                          - Removed build option check from query producing XML in procedure sitemap_index
--    Jari Laine 19.04.2022 - Changes relating procedure blog_util.download_file
--    Jari Laine 26.04.2022 - Added element lastmod to XML to functions:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_tags
--    Jari Laine 28.04.2020 - Changed rss_xsl
--    Jari Laine 29.11.2022 - Removed parameter p_lang from procedure rss
--                          - Added exception handler that raise also HTTP error to procedures
--                          - Other minor changes
--    Jari Laine 19.01.2023 - Repved parameter p_ws_images from procedure rss_xsl
--                          - Removed parameter p_page_group from procedure sitemap_main
--                          - Replaced private constant c_pubdate_lang with blog.util.g_nls_date_lang
--                          - Replaced private constant c_lastmod_format with blog_util.g_iso_8601_date
--                          - Replaced private constant c_pubdate_format with blog_util.g_rfc_2822_date
--    Jari Laine 30.07.2023 - Replaced apex_util.get_build_option_status with apex_application_admin.get_build_option_status
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xml"
  procedure rss(
    p_app_name      in varchar2,
    p_app_desc      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xsl"
  procedure rss_xsl(
    p_css_file      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-index.xml"
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-main.xml"
  procedure sitemap_main(
    p_app_id        in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-posts.xml"
  procedure sitemap_posts;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-categories.xml"
  procedure sitemap_categories;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-archives.xml"
  procedure sitemap_archives;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-tags.xml"
  procedure sitemap_tags;
--------------------------------------------------------------------------------
end "BLOG_XML";
/

create or replace package body "BLOG_XML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_app_name  in varchar2,
    p_app_desc  in varchar2
  )
  as
    l_xml           xmltype;
    l_rss           blob;
    l_lang          varchar2(256);
    l_app_id        varchar2(256);
    l_rss_url       varchar2(4000);
    l_xsl_url       varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_name      varchar2(4000);
    l_app_desc      varchar2(4000);
    l_cache_control varchar2(256);
    l_last_modified varchar2(256);
    l_max_published timestamp;

    l_rss_version   constant varchar2(5)  := '2.0';

  begin

    l_lang := apex_application.g_browser_language;

    -- RSS feed URL
    l_rss_url   := blog_url.get_rss;
    -- blog name
    l_app_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'G_APP_NAME' )
    );
    -- rss feed description
    l_app_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'G_APP_DESC' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_page       => 'HOME'
      ,p_canonical  => 'YES'
    );
    -- rss transformations (XSLT)
    l_xsl_url := blog_url.get_rss_xsl;

    -- generate RSS
    select xmlserialize(
      content xmlconcat(
        case when l_xsl_url is not null
          then xmlpi( "xml-stylesheet",
            apex_string.format(
               p_message => 'type="text/xsl" href="%s" media="screen"'
              ,p0 => l_xsl_url
            )
          )
        end,
        xmlelement(
          "rss", xmlattributes(
             l_rss_version                      as "version"
            ,'http://purl.org/dc/elements/1.1/' as "xmlns:dc"
            ,'http://www.w3.org/2005/Atom'      as "xmlns:atom"
          )
          ,xmlelement(
            "channel"
            ,xmlelement(
              "atom:link"
              ,xmlattributes(
                'self'                  as "rel"
                ,l_rss_url              as "href"
                ,'application/rss+xml'  as "type"
              )
            )
            ,xmlforest(
              l_app_name  as "title"
              ,l_home_url as "link"
              ,l_app_desc as "description"
              ,l_lang     as "language"
            )
            ,xmlagg(
              xmlelement(
                "item"
                ,xmlelement( "title",       posts.post_title )
                ,xmlelement( "dc:creator",  posts.blogger_name )
                ,xmlelement( "category",    posts.category_title )
                ,xmlelement( "link",
                  blog_url.get_post(
                     p_post_id    => posts.post_id
                    ,p_canonical  => 'YES'
                  )
                )
                ,xmlelement( "description", posts.post_desc )
                ,xmlelement( "pubDate",
                  to_char(
                     sys_extract_utc( posts.published_on )
                    ,blog_util.g_rfc_2822_date
                    ,blog_util.g_nls_date_lang
                  )
                )
                ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id )
              ) order by posts.published_on desc
            )
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    ,max( posts.published_on ) as max_published
    into l_rss, l_max_published
    from blog_v_posts_last20 posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS' )
      )
    ;

    l_last_modified :=
      to_char(
         sys_extract_utc( l_max_published )
        ,blog_util.g_rfc_2822_date
        ,blog_util.g_nls_date_lang
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_rss
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control',  'Content-Disposition',        'Last-Modified' )
      ,p_header_values  => apex_t_varchar2( l_cache_control,  'inline; filename="rss.xml"', l_last_modified  )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_css_file in varchar2
  )
  as
    l_xml           xmltype;
    l_xsl           blob;
    l_css_url       varchar2(1024);
    l_cache_control varchar2(256);
  begin

    -- Generate relaive URL for CSS file
    l_css_url := apex_util.host_url( 'APEX_PATH' );
    l_css_url := substr( l_css_url, instr( l_css_url, '/', 1, 3 ) );
    l_css_url := l_css_url || p_css_file;

    l_xml :=
      xmltype(
        apex_string.format(
          p_message => '
            <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
              <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. -->
              <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />
              <!-- Start matching at the Channel node within the XML RSS feed. -->
              <xsl:template match="/rss/channel">
                <html lang="%s">
                <head>
                  <meta charset="utf-8" />
                  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                  <title>
                    <xsl:value-of select="title" />
                  </title>
                  <link rel="stylesheet" type="text/css" href="%s" />
                </head>
                <body>
                  <h1><a class="z-rss--title" href="{ link }"><xsl:value-of select="title" /></a></h1>
                  <h2 class="z-rss--description"><xsl:value-of select="description" /></h2>
                  <xsl:for-each select="./item">
                    <article class="z-rss--post">
                      <header>
                        <h3 class="z-rss--postHeader"><a href="{ link }"><xsl:value-of select="title" /></a></h3>
                      </header>
                      <p class="z-rss--postBody"><xsl:value-of select="description" /></p>
                    </article>
                  </xsl:for-each>
                </body>
                </html>
              </xsl:template>
            </xsl:stylesheet>'
          ,p0 => apex_application.g_browser_language
          ,p1 => l_css_url
        )
      )
    ;

    select
      xmlserialize(
        content l_xml as blob encoding 'UTF-8' indent size = 2
      ) xsl
    into l_xsl
    from dual
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS_XSL' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xsl
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="rss.xsl"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  )
  as
    l_url           varchar2(4000);
    l_xml           blob;
    l_cache_control varchar2(256);
    l_build_option  constant varchar2(256) := 'BLOG_FEATURE_SITEMAP';
  begin

    -- get url to call sitemaps process
    l_url := blog_url.get_process;

    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "sitemap"
              ,xmlelement( "loc", l_url || t1.process_name
              )
            ) order by t1.execution_sequence
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from apex_application_page_proc t1
    where 1 = 1
      and t1.process_name != p_process_name
      and t1.application_id = p_app_id
      and t1.page_id = p_app_page_id
      and t1.build_option = l_build_option
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-index.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main(
    p_app_id in varchar2
  )
  as
    l_xml   blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tab(
                   p_page       => v1.page_alias
                  ,p_canonical  => 'YES'
                )
              )
            ) order by v1.page_id
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from apex_application_pages v1
    where 1 = 1
      and v1.application_id = p_app_id
      and v1.page_alias in ( 'HOME', 'LINKS', 'REPOSITORY', 'ABOUT' )
      and case
        when v1.build_option is null
        then apex_application_admin.c_build_option_status_include
        else
          apex_application_admin.get_build_option_status(
             p_application_id    => p_app_id
            ,p_build_option_name => v1.build_option
          )
      end = apex_application_admin.c_build_option_status_include
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-main.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_post(
                   p_post_id    => posts.post_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc(
                    greatest( posts.published_on, posts.changed_on )
                  )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by posts.published_on desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_posts posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-posts.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_categories
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_category(
                   p_category_id  => cat.category_id
                  ,p_canonical    => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( cat.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by cat.display_seq desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_categories cat
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-categories.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_archives
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_archive(
                   p_archive_id => arc.archive_year
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( arc.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by arc.archive_year desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_archive_year arc
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-archives.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_archives;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_tags
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tag(
                   p_tag_id     => tags.tag_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( tags.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by tags.changed_on
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_tags tags
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-tags.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
