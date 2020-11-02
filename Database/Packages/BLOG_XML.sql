create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions to generate e.g. RSS feed and sitemap
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 07.05.2019 - Created
--    Jari Laine 08.01.2020 - Removed categories sitemap
--    Jari Laine 08.01.2020 - Modified use ORDS and blog version 4
--    Jari Laine 09.04.2020 - Utilize blog_url functions parameter p_canonical
--    Jari Laine 17.05.2020 - Removed private function get_app_alias
--                            and constant c_pub_app_id
--                            Moved private function get_ords_service to blog_ords package
--    Jari Laine 23.05.2020 - Changed procedure sitemap_main to use table blog_pages
--                            New procedures:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_atags
--    Jari Laine 25.10.2020   XSL for RSS feed
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_lang      in varchar2 default 'en',
    p_rss_url   in varchar2 default null,
    p_app_name  in varchar2 default null,
    p_app_desc  in varchar2 default null,
    p_app_id    in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_css_file  in varchar2
  );
--------------------------------------------------------------------------------
  procedure sitemap_index;
--------------------------------------------------------------------------------
  procedure sitemap_main;
--------------------------------------------------------------------------------
  procedure sitemap_posts;
--------------------------------------------------------------------------------
  procedure sitemap_categories;
--------------------------------------------------------------------------------
  procedure sitemap_archives;
--------------------------------------------------------------------------------
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
    p_lang      in varchar2 default 'en',
    p_rss_url   in varchar2 default null,
    p_app_name  in varchar2 default null,
    p_app_desc  in varchar2 default null,
    p_app_id    in varchar2 default null
  )
  as
    l_xml           xmltype;
    l_rss           blob;
    l_app_id        varchar2(256);
    l_rss_url       varchar2(4000);
    l_xsl_url       varchar2(4000);
    l_rss_desc      varchar2(4000);
    l_home_url      varchar2(4000);
    l_blog_name     varchar2(4000);
    l_rss_version   constant varchar2(5) := '2.0';
  begin

    -- RSS feed URL
    l_rss_url   := coalesce(
       p_rss_url
      ,blog_util.get_attribute_value( 'G_RSS_URL' )
    );
    -- blog name
    l_blog_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'G_APP_NAME' )
    );
    -- rss feed description
    l_rss_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'G_APP_DESC' )
    );
    -- blog application id
    l_app_id    := coalesce(
       p_app_id
      ,blog_util.get_attribute_value( 'G_PUB_APP_ID' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_app_page_id => 'HOME'
      ,p_app_id => l_app_id
      ,p_canonical => 'YES'
    );

    l_xsl_url := blog_url.get_tab(
       p_app_page_id => 'HOME'
      ,p_app_id => l_app_id
      ,p_request => 'APPLICATION_PROCESS=RSS_XSL'
      ,p_canonical => 'YES'
    );

    -- generate RSS
    select xmlserialize( content xmlconcat(
      xmlpi("xml-stylesheet",'type="text/xsl" href="' || l_xsl_url ||'" media="screen"'),
      xmlelement(
        "rss", xmlattributes(
           l_rss_version as "version"
          ,'http://purl.org/dc/elements/1.1/' as "xmlns:dc"
          ,'http://www.w3.org/2005/Atom'      as "xmlns:atom"
        )
        ,xmlelement(
          "channel"
          ,xmlelement(
             "atom:link"
            ,xmlattributes(
               'self'                         as "rel"
              ,l_rss_url                      as "href"
              ,'application/rss+xml'          as "type"
            )
          )
          ,xmlforest(
             l_blog_name                      as "title"
            ,l_home_url                       as "link"
            ,l_rss_desc                       as "description"
            ,p_lang                           as "language"
          )
          ,xmlagg(
            xmlelement(
               "item"
              ,xmlelement( "title",       posts.post_title )
              ,xmlelement( "dc:creator",  posts.blogger_name )
              ,xmlelement( "category",    posts.category_title )
              ,xmlelement( "link",        blog_url.get_post(
                                             p_app_id     => l_app_id
                                            ,p_post_id    => posts.post_id
                                            ,p_canonical  => 'YES'
                                          )
              )
              ,xmlelement( "description", posts.post_desc )
              ,xmlelement( "pubDate", to_char( sys_extract_utc( posts.published_on ), 'Dy, DD Mon YYYY HH24:MI:SS "GMT"' ) )
              ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id )
            ) order by posts.published_on desc
          )
        )
      )
    )
    as blob encoding 'UTF-8' indent size=2)
    into l_rss
    from blog_v_posts_last20 posts
    ;

    owa_util.mime_header( 'application/xml', false, 'UTF-8' );
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_rss );

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_css_file in varchar2
  )
  as
    l_xml     xmltype;
    l_xsl     blob;
  begin

    l_xml :=
      sys.xmltype.createxml('
        <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
          <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. -->
          <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />
          <!-- Start matching at the Channel node within the XML RSS feed. -->
          <xsl:template match="/rss/channel">
            <html lang="en">
            <head>
              <meta charset="utf-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>
                <xsl:value-of select="title" />
              </title>
              <link rel="stylesheet" type="text/css" href="' || p_css_file || '" />
            </head>
            <body>
              <h1 class="title"><a href="{ link }"><xsl:value-of select="title" /></a></h1>
              <p class="description"><xsl:value-of select="description" /></p>
              <xsl:for-each select="./item">
                <article class="z-post">
                  <header class="z-post--header">
                    <h2><a href="{ link }"><xsl:value-of select="title" /></a></h2>
                  </header>
                  <p class="z-post--body"><xsl:value-of select="description" /></p>
                </article>
              </xsl:for-each>
            </body>
            </html>
          </xsl:template>
        </xsl:stylesheet>
      ')
    ;

    select xmlserialize( content l_xml
    as blob encoding 'UTF-8' indent size=2)
    into l_xsl
    from dual
    ;

    owa_util.mime_header( 'application/xml', false, 'UTF-8' );
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xsl );

  end rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index
  as
    l_xml     blob;
    l_app_id  number;
    l_url     varchar2(4000);
  begin

    l_app_id := to_number( blog_util.get_attribute_value ( 'G_PUB_APP_ID' ) );

    l_url := blog_ords.get_module_path(
      p_canonical => 'YES'
    );

    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "sitemap"
              ,xmlelement( "loc", l_url || t1.uri_template )
            ) order by t1.display_seq
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_ords_templates t1
    where 1 = 1
    and t1.is_active = 1
    and t1.template_group = 'SITEMAP'
    and not exists(
      select 1
      from apex_application_build_options bo
      where 1 = 1
      and bo.application_id = l_app_id
      and bo.build_option_status = 'Exclude'
      and bo.build_option_name = t1.build_option
    );

    owa_util.mime_header( 'application/xml', false, 'UTF-8' );
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xml );

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main
  as
    l_xml     blob;
    l_app_id  varchar2(256);
    l_pub_id  number;
  begin

    l_app_id := blog_util.get_attribute_value( 'G_PUB_APP_ID' );
    l_pub_id := to_number( l_app_id );

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",  blog_url.get_tab(
                                   p_app_id  => l_app_id
                                  ,p_app_page_id => t1.page_alias
                                  ,p_canonical => 'YES'
                                )
              )
            ) order by t1.display_seq
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_pages t1
    where 1 = 1
      and t1.is_active = 1
      and t1.page_type = 'TAB'
      and not exists(
        select 1
        from apex_application_build_options bo
        where 1 = 1
          and bo.application_id = l_pub_id
          and bo.build_option_name = t1.build_option
          and bo.build_option_status = 'Exclude'
      )
    ;

    owa_util.mime_header( 'application/xml', false, 'UTF-8' );
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xml );

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml     blob;
    l_app_id  varchar2(256);
  begin

    l_app_id := blog_util.get_attribute_value( 'G_PUB_APP_ID' );

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_post(
                                     p_app_id     => l_app_id
                                    ,p_post_id    => posts.post_id
                                    ,p_canonical  => 'YES'
                                  )
              )
              ,XMLElement( "lastmod", to_char( sys_extract_utc( greatest( posts.published_on, posts.changed_on ) ), 'YYYY-MM-DD"T"HH24:MI:SS"+00:00""' ) )
            ) order by posts.published_on desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_posts posts
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p('Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file(l_xml);

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_categories
  as
    l_xml     blob;
    l_app_id  varchar2(256);
  begin

    l_app_id := blog_util.get_attribute_value( 'G_PUB_APP_ID' );

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_category(
                                     p_app_id       => l_app_id
                                    ,p_category_id  => cat.category_id
                                    ,p_canonical    => 'YES'
                                  )
              )
            ) order by cat.display_seq desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_categories cat
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xml );

  end sitemap_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_archives
  as
    l_xml     blob;
    l_app_id  varchar2(256);
  begin

    l_app_id := blog_util.get_attribute_value( 'G_PUB_APP_ID' );

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_archive(
                                     p_app_id     => l_app_id
                                    ,p_archive_id => arc.archive_year
                                    ,p_canonical  => 'YES'
                                  )
              )
            ) order by arc.archive_year desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_archive_year arc
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xml );

  end sitemap_archives;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_tags
  as
    l_xml     blob;
    l_app_id  varchar2(256);
  begin

    l_app_id := blog_util.get_attribute_value( 'G_PUB_APP_ID' );

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_tag(
                                     p_app_id     => l_app_id
                                    ,p_tag_id     => tags.tag_id
                                    ,p_canonical  => 'YES'
                                  )
              )
            )
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_tags tags
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p( 'Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file( l_xml );

  end sitemap_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
