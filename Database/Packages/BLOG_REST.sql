CREATE OR REPLACE package "BLOG_REST" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for ORDS to produce RSS feed and sitemap
--
--  MODIFIED   (DD.MM.YYYY)
--    Jari Laine 07.05.2019 - Created
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function show_entry(
    p_build_option_id         in varchar2,
    p_authorization_scheme_id in varchar2,
    p_condition_type_code     in varchar2,
    p_condition_expression1   in varchar2,
    p_condition_expression2   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss(
    p_lang      in varchar2
  ) return blob;
--------------------------------------------------------------------------------
  procedure sitemap(
    p_app_id    in number,
    p_app_alias in varchar2,
    p_tab_list  in varchar2
  );
--------------------------------------------------------------------------------
  procedure index_sitemap(
    p_app_alias in varchar2
  );
--------------------------------------------------------------------------------
  procedure main_sitemap (
    p_app_id    in number,
    p_app_alias in varchar2,
    p_tab_list  in varchar2
  );
--------------------------------------------------------------------------------
  procedure article_sitemap (
    p_app_alias in varchar2
  );
--------------------------------------------------------------------------------
  procedure category_sitemap (
    p_app_alias in varchar2
  );
--------------------------------------------------------------------------------
  procedure rss_fb_socialize(
    p_app_alias in varchar2,
    p_blog_name in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_REST";
/


CREATE OR REPLACE package body "BLOG_REST" 
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_app_alias
  return varchar2
  as
    l_alias   varchar2(255);
    l_app_id  varchar2(255);
    l_app_grp varchar2(255);
  begin
  
    --l_app_id  := 
    l_app_grp := blog_util.get_param_value( 'APP_GROUP' );
    
    select t1.alias
    into l_alias
    from apex_applications t1
    where 1 = 1
    and t1.application_group = l_app_grp
    and exists(
      select 1
      from blog_items_init x1
      where 1 = 1
      and x1.item_name = 'G_PUB_APP_ID'
      and x1.item_value = t1.application_id
    );
    return l_alias;
  end get_app_alias;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_template_url(
    p_template  in varchar2
  ) return varchar2
  as
    l_url     varchar2(255);
    l_app_grp varchar2(255);
  begin
  
    l_app_grp := blog_util.get_param_value( 'APP_GROUP' );
    
    select t1.pattern || t2.uri_prefix || t3.uri_template as url
    into l_url
    from user_ords_schemas t1
    join user_ords_modules t2 on t1.id = t2.schema_id
    join user_ords_templates t3 on t1.id = t3.schema_id
      and t2.id = t3.module_id
    where 1 = 1
    and t2.name = l_app_grp
    and t3.uri_template = p_template
    ;
    
    return l_url;
    
  end get_template_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_rss(
    p_lang      in varchar2,
    p_rss       out nocopy blob   
  ) 
  as
    l_rss_url       varchar2(255);
    l_rss_desc      varchar2(255);
    l_home_url      varchar2(255);
    l_app_alias     varchar2(255);
    l_canonical_url varchar2(255);
    l_blog_name     varchar2(4000);
    l_rss_version   constant varchar2(5) := '2.0';
  begin
  
    l_app_alias     := blog_rest.get_app_alias;
    l_home_url      := blog_url.get_home( l_app_alias );
    l_blog_name     := blog_util.get_param_value( 'G_APP_NAME' );
    l_rss_desc      := blog_util.get_param_value( 'G_APP_DESC' );
    l_canonical_url := blog_util.get_param_value( 'CANONICAL_URL' );
    l_home_url      := l_canonical_url || l_home_url;
    l_rss_url       := l_canonical_url || blog_rest.get_template_url( 'feed' );

    select xmlelement(
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
            ,l_rss_url              as "href"
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
            ,xmlelement( "title",       posts.rss_title )
            ,xmlelement( "dc:creator",  posts.blogger_name )
            ,xmlelement( "category",    posts.rss_category )
            ,xmlelement( "link",        l_canonical_url 
                                        || blog_url.get_post(
                                           p_app_id  => l_app_alias
                                          ,p_post_id => posts.post_id
                                        )
            )
            ,xmlelement( "description", posts.rss_desc )
            ,xmlelement( "pubDate",     posts.pubdate )
            ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), 'apex-blog.post_id.' || posts.post_id )
          ) order by created_on desc
        )
      )
    ).getblobval( nls_charset_id( 'AL32UTF8' ) )
    into p_rss
    from blog_v_posts_last20 posts
    ;

  end create_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function show_entry(
    p_build_option_id         in varchar2,
    p_authorization_scheme_id in varchar2,
    p_condition_type_code     in varchar2,
    p_condition_expression1   in varchar2,
    p_condition_expression2   in varchar2
  ) return varchar2
  as
    l_retval  boolean;
    pragma autonomous_transaction;
  begin
    l_retval := apex_plugin_util.is_component_used (
      p_build_option_id         => p_build_option_id,
      p_authorization_scheme_id => p_authorization_scheme_id,
      p_condition_type          => p_condition_type_code,
      p_condition_expression1   => p_condition_expression1,
      p_condition_expression2   => p_condition_expression2
    );
    return case when l_retval then 'true' else 'false' end;
  end show_entry;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_lang      in varchar2
  ) return blob
  as
    l_xml   blob;
    l_lang  varchar2(5);
  begin
  
    l_lang := coalesce(p_lang, 'en');
    
    blog_rest.create_rss(
       p_lang => l_lang
      ,p_rss  => l_xml
    );
    
    return l_xml;
    
  end get_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap(
    p_app_id    in number,
    p_app_alias in varchar2,
    p_tab_list  in varchar2
  )
  as
    l_xml           blob;
  begin

--    with sitemap_query as (
--      select 1 as grp
--        ,row_number() over(order by e.display_sequence) as rnum
--        ,c_canonical_url || apex_util.prepare_url( 
--          apex_plugin_util.replace_substitutions(e.entry_target)
--        ) as loc
--      from apex_application_list_entries e
--      where e.application_id = p_app_id
--        and e.list_name      = p_tab_list
--        and
--          blog_xml.show_entry(
--            (
--              select o.build_option_id 
--              from apex_application_build_options o 
--              where o.build_option_name = e.build_option
--            ),
--            e.authorization_scheme_id,
--            e.condition_type_code,
--            e.condition_expression1,
--            e.condition_expression2
--           ) = 'true'
--      union all
--      select 2 as grp
--        ,row_number() over(order by a.created_on) as rnum
--        ,blog_util.get_canonical_url(
--           p_app_alias  => p_app_alias
--          ,p_page_alias => blog_util.g_article_page
--          ,p_item_name  => blog_util.g_article_item
--          ,p_item_value => a.article_id
--          ,p_host_url   => c_canonical_url
--        ) as loc
--      from blog_v_posts posts
--      union all
--      select 3 as grp
--        ,row_number() over(order by c.category_seq) as rnum
--        ,blog_util.get_canonical_url(
--           p_app_alias  => p_app_alias
--          ,p_page_alias => blog_util.g_category_page
--          ,p_item_name  => blog_util.g_category_item
--          ,p_item_value => c.category_id
--          ,p_host_url   => c_canonical_url
--        )
--      from blog_v$categories c
--    )
--    select xmlelement("urlset", xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
--        (
--          xmlagg(
--              xmlelement("url"
--              ,xmlelement("loc", loc)
--            ) order by grp,rnum
--          )
--        )
--      ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from sitemap_query
--    ;
    owa_util.mime_header('application/xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure index_sitemap(
    p_app_alias in varchar2
  )
  as
    l_xml           blob;
    l_main_sitemap_url       varchar2(255);
    l_article_sitemap_url   varchar2(255);
    l_category_sitemap_url  varchar2(255);
  begin
--    l_main_sitemap_url := blog_util.get_canonical_url(
--       p_app_alias  => p_app_alias
--      ,p_page_alias => blog_util.g_home_page
--      ,p_request    => 'APPLICATION_PROCESS=MAIN_SITEMAP'
--      ,p_host_url   => c_canonical_url
--    );
--
--    l_article_sitemap_url := blog_util.get_canonical_url(
--       p_app_alias  => p_app_alias
--      ,p_page_alias => blog_util.g_home_page
--      ,p_request    => 'APPLICATION_PROCESS=ARTICLE_SITEMAP'
--      ,p_host_url   => c_canonical_url
--    );
--
--    l_category_sitemap_url := blog_util.get_canonical_url(
--       p_app_alias  => p_app_alias
--      ,p_page_alias => blog_util.g_home_page
--      ,p_request    => 'APPLICATION_PROCESS=CATEGORY_SITEMAP'
--      ,p_host_url   => c_canonical_url
--    );
--
--    with index_sitemap_query as (
--      select 1 as grp
--        ,l_main_sitemap_url as loc
--      from dual
--      union all
--        select 2 as grp
--        ,l_article_sitemap_url as loc
--      from dual
--      union all
--        select 3 as grp
--        ,l_category_sitemap_url as loc
--      from dual
--    )
--    select xmlelement("sitemapindex", xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
--        (
--          xmlagg(
--              xmlelement("sitemap"
--              ,xmlelement("loc", loc )
--            ) order by grp
--          )
--        )
--      ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from index_sitemap_query
--    ;
    owa_util.mime_header('application/xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end index_sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure main_sitemap (
    p_app_id    in number,
    p_app_alias in varchar2,
    p_tab_list  in varchar2
  )
  as
    l_xml blob;
  begin

--    with sitemap_query as (
--      select
--         row_number() over(order by e.display_sequence) as rnum
--        ,c_canonical_url || apex_util.prepare_url(
--            apex_plugin_util.replace_substitutions(e.entry_target)
--         ) as loc
--      from apex_application_list_entries e
--      where e.application_id = p_app_id
--        and e.list_name      = p_tab_list
--        and
--          blog_xml.show_entry(
--            (
--              select o.build_option_id 
--              from apex_application_build_options o 
--              where o.build_option_name = e.build_option
--            ),
--            e.authorization_scheme_id,
--            e.condition_type_code,
--            e.condition_expression1,
--            e.condition_expression2
--           ) = 'true'
--    )
--    select xmlelement("urlset", xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
--        (
--          xmlagg(
--              xmlelement("url"
--              ,xmlelement("loc", loc)
----              ,XMLElement("lastmod", TO_CHAR(sysdate, 'YYYY-MM-DD'))
----              ,XMLElement("changefreq", 'monthly')
----              ,XMLElement("priority", '0.5')
--            ) order by rnum
--          )
--        )
--      ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from sitemap_query
--    ;
    owa_util.mime_header('application/xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end main_sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure article_sitemap (
    p_app_alias in varchar2
  )
  as
    l_xml           blob;
  begin

--    with sitemap_query as (
--      select
--         row_number() over(order by a.created_on) as rnum
--        ,blog_util.get_canonical_url(
--           p_app_alias  => p_app_alias
--          ,p_page_alias => blog_util.g_article_page
--          ,p_item_name  => blog_util.g_article_item
--          ,p_item_value => a.article_id
--          ,p_host_url   => c_canonical_url
--        ) as loc
----        ,a.changed_on AS lastmod
--      from blog_v$articles a
--    )
--    select xmlelement("urlset", xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
--        (
--          xmlagg(
--              xmlelement("url"
--              ,xmlelement("loc", loc)
----              ,XMLElement("lastmod", TO_CHAR(lastmod, 'YYYY-MM-DD'))
----              ,XMLElement("changefreq", 'monthly')
----              ,XMLElement("priority", '0.5')
--            ) order by rnum
--          )
--        )
--      ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from sitemap_query
--    ;
    owa_util.mime_header('application/xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end article_sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure category_sitemap (
    p_app_alias in varchar2
  )
  as
    l_xml           blob;
  begin

--    with sitemap_query as (
--      select
--         row_number() over(order by c.created_on) as rnum
--        ,blog_util.get_canonical_url(
--           p_app_alias  => p_app_alias
--          ,p_page_alias => blog_util.g_category_page
--          ,p_item_name  => blog_util.g_category_item
--          ,p_item_value => c.category_id
--          ,p_host_url   => c_canonical_url
--        ) as loc
----        ,c.changed_on AS lastmod
--      from blog_v$categories c
--    )
--    select xmlelement("urlset", xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
--        (
--          xmlagg(
--              xmlelement("url"
--              ,xmlelement("loc", loc)
----              ,XMLElement("lastmod", TO_CHAR(lastmod, 'YYYY-MM-DD'))
----              ,XMLElement("changefreq", 'monthly')
----              ,XMLElement("priority", '0.5')
--            ) order by rnum
--          )
--        )
--      ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from sitemap_query
--    ;
    owa_util.mime_header('application/xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end category_sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_fb_socialize(
    p_app_alias in varchar2,
    p_blog_name in varchar2
  )
  as
    l_xml           blob;
    l_rss_lang      varchar2(5);
    l_rss_desc      varchar2(255);
    l_rss_url       varchar2(255);
    l_home_url      varchar2(255);
    l_blog_name     varchar2(4000);
  begin

    l_rss_lang    := apex_application.g_browser_language;
    l_blog_name   := coalesce( p_blog_name, blog_util.get_param_value( 'G_BLOG_NAME' ) );
    l_rss_desc    := apex_lang.message( 'RSS_DESCRIPTION', l_blog_name );

--    l_rss_url := blog_util.get_canonical_url(
--       p_app_alias  => p_app_alias
--      ,p_page_alias => blog_util.g_home_page
--      ,p_request    => 'APPLICATION_PROCESS=TWEET'
--      ,p_host_url   => c_canonical_url
--    );
--
--    l_home_url := blog_util.get_canonical_url(
--       p_app_alias  => p_app_alias
--      ,p_page_alias => blog_util.g_home_page
--      ,p_host_url   => c_canonical_url
--    );
--
--    select xmlelement("rss", xmlattributes(c_rss_version as "version", 'http://www.w3.org/2005/Atom' as "xmlns:atom", 'http://purl.org/dc/elements/1.1/' as "xmlns:dc"),
--      xmlelement("channel",
--        xmlelement("atom:link", xmlattributes(l_rss_url as "href", 'self' as "rel", 'application/rss+xml' as "type")),
--        xmlforest(
--          l_blog_name as "title"
--          ,l_home_url as "link"
--          ,l_rss_desc as "description"
--          ,l_rss_lang as "language"
--        ),
--        xmlagg(
--          xmlelement("item",
--            xmlelement("title", l.rss_title),
--            xmlelement("dc:creator", l.posted_by),
--            (
--              select xmlagg(xmlelement("category", trim(regexp_substr (h.hashtags, '[^,]+', 1, rownum))))
--              from blog_article_last20 h
--              where h.article_id = l.article_id
--              and regexp_substr (h.hashtags, '[^,]+', 1, rownum) is not null
--              connect by level <= length (regexp_replace (h.hashtags, '[^,]+')) + 1
--            ),
--            xmlelement("link", blog_util.get_canonical_url(
--                 p_app_alias  => p_app_alias
--                ,p_page_alias => blog_util.g_article_page
--                ,p_item_name  => blog_util.g_article_item
--                ,p_item_value => l.article_id
--                ,p_host_url   => c_canonical_url
--              )
--            ),
--            xmlelement("description", l.rss_description),
--            xmlelement("pubDate", l.rss_pubdate),
--            xmlelement("guid", xmlattributes('false' as "isPermaLink"), l.rss_guid)
--          ) order by latest_article_seq
--        )
--      )
--    ).getblobval(nls_charset_id('AL32UTF8'))
--    into l_xml
--    from blog_article_last20 l
--    where 1 = 1
--      and l.created_on >= sysdate -5
--    ;
    owa_util.mime_header('application/rss+xml', true);
    wpg_docload.download_file(l_xml);
    --apex_application.stop_apex_engine;
  end rss_fb_socialize;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_REST";
/
