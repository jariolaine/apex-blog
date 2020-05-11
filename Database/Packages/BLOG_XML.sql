CREATE OR REPLACE package "BLOG_XML"
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
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_lang in varchar2 default 'en'
  );
--------------------------------------------------------------------------------
  procedure sitemap_index;
--------------------------------------------------------------------------------
  procedure sitemap_main;
--------------------------------------------------------------------------------
  procedure sitemap_posts;
--------------------------------------------------------------------------------
end "BLOG_XML";
/


CREATE OR REPLACE package body "BLOG_XML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_pub_app_id  constant number := to_number( blog_util.get_item_init_value( 'G_PUB_APP_ID' ) );
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_app_alias
  return varchar2
  as
    l_app_alias varchar2(255);
  begin

    begin
      -- query APEX metadata to get blog puplic application alias
      select t1.alias
      into l_app_alias
      from apex_applications t1
      where 1 = 1
        and t1.owner = blog_util.g_owner
        and t1.application_id = c_pub_app_id
      ;
    exception when no_data_found then
      raise_application_error( -20001,  'Configuration not exists.' );
      l_app_alias := null;
    end;

    return l_app_alias;

  end get_app_alias;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_ords_service(
    p_uri_template in varchar2
  ) return varchar2
  as
    l_url     varchar2(4000);
  begin

    begin
      -- query ORDS metadata to get resource url
      select t1.pattern || t2.uri_prefix || t3.uri_template as url
      into l_url
      from user_ords_schemas t1
      join user_ords_modules t2
        on t1.id = t2.schema_id
      join user_ords_templates t3
        on t1.id = t3.schema_id
        and t2.id = t3.module_id
      where 1 = 1
        and t1.parsing_schema = blog_util.g_owner
        and t2.name = blog_util.g_ords_module
        and t3.uri_template = p_uri_template
      ;
    exception when no_data_found then
      raise_application_error( -20002,  'Configuration not exists.' );
      l_url := null;
    end;

    return l_url;

  end get_ords_service;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_lang in varchar2 default 'en'
  )
  as
    l_rss           blob;
    l_last_modifier timestamp with local time zone;
    l_rss_url       varchar2(4000);
    l_rss_desc      varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_alias     varchar2(4000);
    l_blog_name     varchar2(4000);
    l_rss_version   constant varchar2(5) := '2.0';
  begin

    l_rss_url := blog_util.get_attribute_value( 'RSS_URL' );

    -- blog application alias
    l_app_alias := get_app_alias;

    -- blog home page relative urlg_ords_rss_feed;
    l_home_url  := blog_url.get_tab(
       p_app_id => l_app_alias
      ,p_canonical => 'YES'
    );

    -- blog name
    l_blog_name := blog_util.get_attribute_value( 'G_APP_NAME' );

    -- rss feed description
    l_rss_desc  := blog_util.get_attribute_value( 'G_APP_DESC' );

    -- generate RSS
    select xmlserialize( document
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
               'self'                 as "rel"
              ,l_rss_url as "href"
              ,'application/rss+xml'  as "type"
            )
          )
          ,xmlforest(
             l_blog_name              as "title"
            ,l_home_url               as "link"
            ,l_rss_desc               as "description"
            ,p_lang                   as "language"
          )
          ,xmlagg(
            xmlelement(
               "item"
              ,xmlelement( "title",       posts.post_title )
              ,xmlelement( "dc:creator",  posts.blogger_name )
              ,xmlelement( "category",    posts.category_title )
              ,xmlelement( "link",        blog_url.get_post(
                                             p_app_id     => l_app_alias
                                            ,p_post_id    => posts.post_id
                                            ,p_canonical  => 'YES'
                                          )
              )
              ,xmlelement( "description", posts.post_desc )
              ,xmlelement( "pubDate",     to_char( sys_extract_utc( posts.published_on ), 'Dy, DD Mon YYYY HH24:MI:SS "GMT"' ) )
              ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id)
            ) order by posts.published_on desc
          )
        )
      --).getclobval()
      --).getblobval(nls_charset_id('AL32UTF8'))
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_rss
    from blog_v_posts_last20 posts
    ;

    owa_util.mime_header('application/rss+xml', false, 'UTF-8' );
--    owa_util.mime_header('application/xml', false, 'UTF-8' );
    sys.htp.p('Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file(l_rss);

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index
  as
    l_xml   blob;
    l_url   varchar2(4000);
    l_main  varchar2(255);
    l_posts varchar2(255);
  begin

    l_url :=  blog_util.get_attribute_value( 'CANONICAL_URL' );

    l_main := l_url
      || get_ords_service(
        blog_util.g_ords_sitemap_main
      );
    l_posts := l_url
      || get_ords_service(
        blog_util.g_ords_sitemap_posts
      );

    with si as (
      select 1 as grp
        ,l_main as loc
      from dual
      union all
        select 2 as grp
        ,l_posts as loc
      from dual
    )
    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
              xmlelement("sitemap"
              ,xmlelement("loc", loc )
            ) order by grp
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from si
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p('Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file(l_xml);

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main
  as
    l_xml blob;
    l_app_alias varchar2(256);
  begin

    l_app_alias := get_app_alias;

    with sitemap_query as (
      select
         row_number() over(order by li.display_sequence) as rnum
        ,blog_url.get_tab(
           p_app_id  => l_app_alias
          ,p_app_page_id => li.entry_attribute_10
          ,p_canonical => 'YES'
        ) as loc
      from apex_application_list_entries li
      where 1 = 1
        and li.list_name = blog_util.g_pub_app_tab_list
        and li.application_id = c_pub_app_id
      and not exists(
        select 1
        from apex_application_build_options bo
        where 1 = 1
          and bo.application_id = c_pub_app_id
          and bo.build_option_name = li.build_option
          and bo.build_option_status = 'Exclude'
      )
    )
    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
              xmlelement("url"
              ,xmlelement("loc", loc)
--              ,XMLElement("lastmod", TO_CHAR(sysdate, 'YYYY-MM-DD'))
--              ,XMLElement("changefreq", 'monthly')
--              ,XMLElement("priority", '0.5')
            ) order by rnum
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from sitemap_query
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p('Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file(l_xml);

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml blob;
    l_app_alias varchar2(256);
  begin

    l_app_alias := get_app_alias;

    with sitemap_query as (
      select
         posts.published_on
        ,posts.changed_on
        ,blog_url.get_post(
           p_app_id     => l_app_alias
          ,p_post_id    => posts.post_id
          ,p_canonical  => 'YES'
        ) as loc
--        ,a.changed_on AS lastmod
      from blog_v_posts posts
    )
    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
              xmlelement( "url"
                ,xmlelement( "loc", loc )
                ,XMLElement( "lastmod", to_char( sys_extract_utc( changed_on ), 'YYYY-MM-DD"T"HH24:MI:SS"+00:00""' ) )
--              ,XMLElement("changefreq", 'monthly')
--              ,XMLElement("priority", '0.5')
              ) order by published_on desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from sitemap_query
    ;

    owa_util.mime_header('application/xml', false, 'UTF-8');
    sys.htp.p('Cache-Control: max-age=3600, public' );
    sys.owa_util.http_header_close;

    wpg_docload.download_file(l_xml);

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
