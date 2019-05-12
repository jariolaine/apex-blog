CREATE OR REPLACE PACKAGE  "BLOG_UTIL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for public application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure set_items_from_param(
    p_app_id      in number
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_year_month(
    p_year_month  in number,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_UTIL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name in varchar2
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return value from parameter table
    select param_value
    into l_value
    from blog_params
    where param_name = p_param_name
    ;
    --apex_debug.info( 'Fetch param name %s. Param value is: %s', p_param_name, l_value );
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Try fetch param name %s. Parameter not found.', coalesce( p_param_name, 'null' ) );
    raise_application_error( -20001,  'Parameter not exists.' );
    raise;
  when others then
    apex_debug.error( 'Fetch param name %s.', p_param_name );
    raise;
  end get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_items_from_param(
    p_app_id in number
  )
  as
  begin
    -- loop materialized view and set items values
    apex_debug.info( 'Executing set_items_from_param: p_app_id => %s', p_app_id );
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_items_init i
      where i.application_id = p_app_id
    ) loop
      apex_util.set_session_state( c1.item_name, c1.item_value, false );
    end loop;
  exception when others then
    apex_debug.error( 'Set items from param. p_app_id is %s.', p_app_id );
    raise;
  end set_items_from_param;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id  in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return post title
    select v1.post_title
    into l_value
    from blog_v_posts v1
    where v1.post_id = p_post_id
    ;
    --apex_debug.info( 'Fetch post %s. Title is: %s', p_post_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    apex_debug.error( 'Try fetch post id %s. Not found.', coalesce( to_char( p_post_id ), 'null' ) );
    raise_application_error( -20001,  'Post not exists.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching post id %s.', p_post_id );
    raise;
  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id   in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return category name
    select v1.category_title
    into l_value
    from blog_v_categories v1
    where v1.category_id = p_category_id
    ;
    --apex_debug.info( 'Fetch category %s. category name is: %s', p_category_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    raise_application_error( -20001,  'Category not exists.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching category id %s.', p_category_id );
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return tag name
    select t1.tag
    into l_value
    from blog_tags t1
    where 1 = 1
    and t1.is_disabled = 0
    and t1.id = p_tag_id
    ;
    --apex_debug.info( 'Fetch tag %s. tag name is: %s', p_tag_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    raise_application_error( -20001,  'Tag not exists.' );
    apex_debug.error( 'Try fetch tag id %s. Tag not found.', coalesce( to_char( p_tag_id ), 'null' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching tag id %s.', coalesce( to_char( p_tag_id ), 'null' ) );
    raise;
  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_year_month(
    p_year_month  in number,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2
  as
  begin
    -- format year month number and return string
    return apex_escape.html(
      to_char(
        to_date(
          p_year_month
         ,'YYYYMM'
        )
      ,p_date_format
         || case
          when p_posts_count is not null
          then ' "(' || p_posts_count || ')"'
          end
      )
    );
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/

CREATE OR REPLACE PACKAGE  "BLOG_URL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Generate URL or redirect
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_home(
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.home_page
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post(
    p_post_id         in number,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.post_page,
    p_page_item       in varchar2 default blog_globals.post_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category(
    p_category_id     in number,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.category_page,
    p_page_item       in varchar2 default blog_globals.category_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_archive(
    p_year_month      in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.archive_page,
    p_page_item       in varchar2 default blog_globals.archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_app_id      in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id in varchar2 default blog_globals.tag_page,
    p_page_item   in varchar2 default blog_globals.tag_page_item
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.search_page,
    p_page_item       in varchar2 default blog_globals.search_item
  );
--------------------------------------------------------------------------------
end "BLOG_URL";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_URL" as
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_home(
    p_app_id        in varchar2 default null,
    p_session       in number   default null,
    p_app_page_id   in varchar2 default blog_globals.home_page
  ) return varchar2
  as
  begin

    return
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_clear_cache => 'RP'
      );

  end get_home;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id       in number,
    p_app_id        in varchar2 default null,
    p_session       in number   default null,
    p_app_page_id   in varchar2 default blog_globals.post_page,
    p_page_item     in varchar2 default blog_globals.post_item
  ) return varchar2
  as
  begin

    return
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_session     => p_session
       ,p_items       => p_page_item
       ,p_values      => p_post_id
       ,p_clear_cache => 'RP'
      );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in number,
    p_app_id      in varchar2 default null,
    p_session     in number   default null,
    p_app_page_id in varchar2 default blog_globals.category_page,
    p_page_item   in varchar2 default blog_globals.category_item
  ) return varchar2
  as
  begin
    return
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_session     => p_session
       ,p_items       => p_page_item
       ,p_values      => p_category_id
       ,p_clear_cache => 'RP'
      );
  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_year_month      in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.archive_page,
    p_page_item       in varchar2 default blog_globals.archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2
  as
  begin
    return case
      when p_current_page_id = p_app_page_id
      or p_current_page_id is null
      then
        apex_page.get_url(
           p_application => p_app_id
          ,p_page        => p_app_page_id
          ,p_session     => p_session
          ,p_items       => p_page_item
          ,p_values      => p_year_month
          ,p_clear_cache => 'RP'
        )
      end;
  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_app_id      in varchar2 default null,
    p_session     in number   default null,
    p_app_page_id in varchar2 default blog_globals.tag_page,
    p_page_item   in varchar2 default blog_globals.tag_page_item
  ) return varchar2
  as
  begin
    return apex_page.get_url(
         p_application => p_app_id
        ,p_page        => p_app_page_id
        ,p_session     => p_session
        ,p_items       => p_page_item
        ,p_values      => p_tag_id
        ,p_clear_cache => 'RP'
      );
  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in number   default null,
    p_app_page_id     in varchar2 default blog_globals.search_page,
    p_page_item       in varchar2 default blog_globals.search_item
  )
  as
  begin
    -- Get page URL and redirect if there there is string to search
    if p_value is not null then
      apex_util.redirect_url (
        apex_page.get_url(
            p_application => p_app_id
           ,p_page        => p_app_page_id
           ,p_session     => p_session
           ,p_items       => p_page_item
           ,p_values      => p_value
           ,p_clear_cache => 'RP'
         )
      );
    end if;
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/

CREATE OR REPLACE PACKAGE  "BLOG_REST"
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
--  TO DO:
--    #1 - add atom:link to RSS feed URL
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
    p_app_alias in varchar2,
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
CREATE OR REPLACE PACKAGE BODY  "BLOG_REST"
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
    l_alias varchar2(255);
  begin
    select t1.alias
    into l_alias
    from apex_applications t1
    where 1 = 1
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
  procedure create_rss(
    p_app_alias in varchar2,
    p_lang      in varchar2,
    p_rss       out nocopy blob
  )
  as
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


    select xmlelement(
      "rss", xmlattributes(
         l_rss_version as "version"
        ,'http://purl.org/dc/elements/1.1/' as "xmlns:dc"
-- TO DO: #1
--        ,'http://www.w3.org/2005/Atom' as "xmlns:atom"
      )
      ,xmlelement(
        "channel"
-- TO DO: #1
--        ,xmlelement(
--           "atom:link"
--          ,xmlattributes(
--             'self'                 as "rel"
--            ,l_rss_url              as "href"
--            ,'application/rss+xml'  as "type"
--          )
--        )
        ,xmlforest(
           l_blog_name  as "title"
          ,l_home_url   as "link"
          ,l_rss_desc   as "description"
          ,p_lang       as "language"
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
            ,xmlelement( "guid", xmlattributes('false' as "isPermaLink"), 'apex-blog.post_id.' || posts.post_id)
          ) order by created_on desc
        )
      )
    ).getblobval(nls_charset_id('AL32UTF8'))
    into p_rss
    from blog_posts_last20 posts
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
    p_app_alias in varchar2,
    p_lang      in varchar2
  ) return blob
  as
    l_xml   blob;
    l_lang  varchar2(5);
  begin

    l_lang := coalesce(p_lang, 'en');

    blog_rest.create_rss(
       p_app_alias => p_app_alias
      ,p_lang      => l_lang
      ,p_rss       => l_xml
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

CREATE OR REPLACE PACKAGE  "BLOG_HTML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Generate HTML code
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_rss_anchor(
      p_app_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss_link(
      p_app_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_search_button(
    p_request     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post_tags(
    p_app_id      in varchar2,
    p_post_id     in number,
    p_button      in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_tag_anchor(
    p_tag_id  in number,
    p_app_id  in varchar2,
    p_tag     in varchar2,
    p_button  in varchar2,
    p_tags    in out nocopy varchar2
  )
  as
    l_tag varchar2(4000);
    l_url varchar2(4000);
  begin

    if p_tag is null then
      p_tags := p_tags;
    else
      l_tag := apex_escape.html( p_tag );

      if p_tag_id is null then
        l_url := '#';
      else
        l_url :=
          blog_url.get_tag(
             p_tag_id => p_tag_id
            ,p_app_id => p_app_id
          )
        ;
      end if;

      if p_button = 'YES' then
        p_tags := p_tags
          || '<a href="'
          || l_url
          || '"'
          || ' class="t-Button'
          || ' t-Button--icon'
          || ' t-Button--small'
          || ' t-Button--primary'
          || ' t-Button--simple'
          || ' t-Button--gapRight'
          || ' t-Button--gapTop'
          || ' t-Button--iconLeft'
          || '">'
          || '<span class="t-Icon fa fa-tag" aria-hidden="true"></span>'
          || l_tag
          || '</a>'
        ;
      else
        p_tags := p_tags
          || case when p_tags is not null then ',' end
          || '<a href="'
          || l_url
          || '"'
          || ' class="margin-bottom-md'
          ||  case when p_tags is not null
              then
             ' margin-left-sm'
              end
          || '">'
          || l_tag
          || '</a>'
        ;
      end if;
    end if;
  end get_tag_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_description_meta(
    p_desc in varchar2
  ) return varchar2
  as
  begin
    return case when p_desc is not null then
      '<meta name="description" content="'
      || apex_escape.html( p_desc )
      || '"/>'
    end;
  end get_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name in varchar2
  ) return varchar2
  as
    l_rss_url   varchar2(255);
    l_rss_title varchar2(255);
  begin

    l_rss_url   := blog_util.get_param_value( 'RSS_URL' );
    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );

    return '<a href="'
      || l_rss_url
      || '" rel="alternate" type="application/rss+xml" aria-label="'
      || apex_escape.html( l_rss_title )
      || '" class="t-Button t-Button--noLabel t-Button--icon t-Button--link">'
      || '<span aria-hidden="true" class="fa fa-rss-square fa-3x fa-lg u-color-8-text"></span>'
      || '</a>'
    ;
  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_name in varchar2
  ) return varchar2
  as
    l_rss_url   varchar2(255);
    l_rss_title varchar2(255);
  begin

    l_rss_url   := blog_util.get_param_value( 'RSS_URL' );
    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );

    return '<link rel="alternate" type="application/rss+xml" href="'
      || l_rss_url
      || '" title="'
      || l_rss_title
      || '"/>'
    ;
  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_search_button(
    p_request in varchar2
  ) return varchar2
  as
  begin
    return '<button'
      || ' type="button" title="Search" aria-label="Search"'
      || ' class="t-Button t-Button--noLabel t-Button--icon t-Button--small t-Button--hot"'
      || ' onclick="apex.submit({request:'''|| p_request || '''});"'
      || '>'
      || '<span class="t-Icon fa fa-search" aria-hidden="true"></span>'
      || '</button>'
      ;
  end get_search_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_app_id  in varchar2,
    p_post_id in number,
    p_button  in varchar2 default 'YES'
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin
    -- Loop tags to generate tags links
    for c1 in(
      select tag_id
        ,tag
      from blog_v_posts_tags
      where 1 = 1
      and post_id = p_post_id
      order by display_seq
    ) loop
      blog_html.get_tag_anchor(
         p_tag_id => c1.tag_id
        ,p_app_id => p_app_id
        ,p_tag    => c1.tag
        ,p_button => p_button
        ,p_tags   => l_tags
      );
    end loop;

    return l_tags;

  end get_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags in varchar2
  ) return varchar2
  as
    l_tags varchar2(32700);
    l_tags_array apex_application_global.vc_arr2;
  begin

    l_tags_array := apex_string.string_to_table( p_tags, ',' );
    -- Loop tags to generate tags links
    for i in 1 .. l_tags_array.count
    loop
      blog_html.get_tag_anchor(
         p_tag_id => null
        ,p_app_id => null
        ,p_tag    => trim(l_tags_array(i))
        ,p_button => 'YES'
        ,p_tags   => l_tags
      );
    end loop;

    return l_tags;

  end get_preview_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/

CREATE OR REPLACE PACKAGE  "BLOG_GLOBALS"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Global constant and variables
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  home_page     constant varchar2(40) := 'HOME';

  post_page     constant varchar2(40) := 'POST';
  post_item     constant varchar2(40) := 'P2_POST_ID';

  search_page   constant varchar2(40) := 'SEARCH';
  search_item   constant varchar2(40) := 'P0_SEARCH';

  category_page constant varchar2(40) := 'CATEGORY';
  category_item constant varchar2(40) := 'P4_CATEGORY_ID';

  archive_page  constant varchar2(40) := 'ARCHIVE';
  archive_item  constant varchar2(40) := 'P5_YEAR_MONTH';

  tag_page      constant varchar2(40) := 'TAG';
  tag_page_item constant varchar2(40) := 'P6_TAG_ID';

end "BLOG_GLOBALS";
/
CREATE OR REPLACE PACKAGE  "BLOG_ERR"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Error handling
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
end "BLOG_ERR";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_ERR"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function apex_error_handler(
    p_error in apex_error.t_error
  ) return apex_error.t_error_result
  as
    l_genereric_error constant varchar2(255) := 'BLOG_GENERIC_ERROR';

    l_result          apex_error.t_error_result;
    l_reference_id    pls_integer;
    l_constraint_name varchar2(255);
    l_err_msg         varchar2(32700);

  begin

    -- This function must be used to ensure initialization is compatible
    -- with future changes to t_error_result.
    l_result :=
      apex_error.init_error_result(
        p_error => p_error
      );

    -- log error to application debug information
    apex_debug.error(
       p_message => 'Error id: %0 | session: %1 | user: %2 | %3 | %4 | %5 | %6 | %7 | %8 | %9'
      ,p0 => blog_seq.nextval
      ,p1 => sys_context( 'APEX$SESSION', 'APP_SESSION' )
      ,p2 => sys_context( 'APEX$SESSION', 'APP_USER' )
      ,p3 => p_error.apex_error_code
      ,p4 => l_result.message
      ,p5 => l_result.additional_info
      ,p6 => p_error.ora_sqlcode
      ,p7 => p_error.ora_sqlerrm
      ,p8 => sqlcode
      ,p9 => apex_error.extract_constraint_name(
            p_error => p_error
          )
    );

    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then

      -- Access Denied errors raised by application or page authorization should
      -- still show up with the original error message as some others listed below
      if not p_error.apex_error_code like 'APEX.SESSION_STATE.%'
      and not p_error.apex_error_code = 'WWV_FLOW.FIND_ITEM_ID_ERR'
      and not p_error.apex_error_code = 'APEX.SESSION.EXPIRED'
      and not p_error.apex_error_code = 'APEX.PAGE.DUPLICATE_SUBMIT'
      and not p_error.apex_error_code = 'APEX.AUTHORIZATION.ACCESS_DENIED'
      --and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
      --and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
      then

        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.

        l_result.message := apex_lang.message(l_genereric_error);
        l_result.additional_info := null;

      end if;

    else
      -- Always show the error as inline error
      -- Note: If you have created manual tabular forms (using the package
      --       apex_item/htmldb_item in the SQL statement) you should still
      --       use "On error page" on that pages to avoid loosing entered data
      /*
      l_result.display_location := case
        when l_result.display_location = apex_error.c_on_error_page
        then apex_error.c_inline_in_notification
        else l_result.display_location
        end
      ;
      */

      -- If it's a constraint violation like
      --
      --   -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated
      --   -) : transaction rolled back (-> can hide a deferred constraint)
      --   -) : check constraint violated
      --   -) : integrity constraint violated - parent key not found
      --   -) : integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from our constraint lookup configuration.
      -- If we don't find the constraint in our lookup table we fallback to
      -- the original ORA error message.

      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then

        l_constraint_name :=
          apex_error.extract_constraint_name(
            p_error => p_error
          );

        l_err_msg := apex_lang.message(l_constraint_name);

        -- not every constraint has to be in our lookup table
        if not l_err_msg = l_constraint_name then
          l_result.message := l_err_msg;
        end if;

      end if;

      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
      -- in a table trigger or in a PL/SQL package called by a process and we
      -- haven't found the error in our lookup table, then we just want to see
      -- the actual error text and not the full error stack with all the ORA error numbers.
      if p_error.ora_sqlcode is not null
      and l_result.message = p_error.message
      then

        l_result.message :=
          apex_error.get_first_ora_error_text (
            p_error => p_error
          );

      end if;

      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      if l_result.page_item_name is null
      and l_result.column_alias is null then

        apex_error.auto_set_associated_item (
           p_error => p_error
          ,p_error_result => l_result
        );

      end if;

    end if;

    return l_result;

  end apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ERR";
/

CREATE OR REPLACE PACKAGE  "BLOG_CONF"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Configure application features
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--    Jari Laine 26.04.2019 - Procedure purge_region_cache
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  procedure update_feature_config(
    p_app_id        in number
  );
--------------------------------------------------------------------------------
  procedure purge_region_cache(
    p_app_id        in number,
    p_static_id     in varchar2 default null,
    p_build_option  in varchar2 default null
  );
--------------------------------------------------------------------------------
end "BLOG_CONF";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_CONF" as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature_config(
    p_app_id in number
  ) as
  begin

    -- set build option status
    for i in 1..apex_application.g_f01.count
    loop

      -- loop all build options and update those where status is changed
      for c1 in(
        select build_option_id
          ,build_option_name
        from apex_application_build_options
        where 1 = 1
        and application_id = p_app_id
        and build_option_name like 'BLOG\_FEATURE\_%' escape '\'
        and build_option_id = to_number( apex_application.g_f01( i ) )
        and build_option_status != apex_application.g_f02( i )
      ) loop
        -- set new build option status
        apex_util.set_build_option_status(
           p_application_id => p_app_id
          ,p_id => c1.build_option_id
          ,p_build_status => upper( apex_application.g_f02( i ) )
        );

        -- purge region cache
        blog_conf.purge_region_cache(
           p_app_id       => p_app_id
          ,p_build_option => c1.build_option_name
        );

      end loop;

    end loop;

  end update_feature_config;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure purge_region_cache(
    p_app_id        in number,
    p_static_id     in varchar2 default null,
    p_build_option  in varchar2 default null
  )
  as
  begin

    -- if build option affects region, check if region is cache
    for c1 in(
      select page_id
        ,region_id
      from apex_application_page_regions
      where 1 = 1
      and application_id  = p_app_id
      and region_caching != 'Not Cached'
      and (
        build_option = p_build_option
        or
        p_build_option is null
      )
      and (
        static_id = p_static_id
        or
        p_static_id is null
      )
    ) loop
      -- clear region cache
      apex_region.purge_cache(
         p_application_id => p_app_id
        ,p_page_id        => c1.page_id
        ,p_region_id      => c1.region_id
      );
    end loop;

  end purge_region_cache;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CONF";
/

CREATE OR REPLACE PACKAGE  "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Content management API
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--
--  TO DO
--    #1 - check constraint name that raised dup_val_on_index error
--    #2 - get parameter strings dynamically
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  function get_category_seq
  return number;
--------------------------------------------------------------------------------
  function get_link_seq
  return number;
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return number;
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id     in number,
    p_sep         in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_link_grp_title(
    p_link_grp_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  );
--------------------------------------------------------------------------------
  procedure add_link_grp(
    p_title       in varchar2,
    p_link_grp_id out nocopy number
  );
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id     in number,
    p_tags        in varchar2,
    p_sep         in varchar2 default ','
  );
--------------------------------------------------------------------------------
  procedure save_post_preview(
    p_id            in number,
    p_tags          in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
  procedure after_post_edit(
    p_app_id      in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_CM";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_CM"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag(
    p_tag     in varchar2,
    p_tag_id  out nocopy number
  )
  as
    l_tag_val varchar2(4000);
  begin

    p_tag_id  := null;
    l_tag_val := trim( p_tag );

    -- if tag is not null then insert to table and return id
    if l_tag_val is not null then

      begin

        insert into blog_tags( is_disabled, tag )
        values ( 0, l_tag_val )
        returning id into p_tag_id
        ;

      -- if unique constraint violation, tag exists.
      -- find id for tag in exception handler
      exception when dup_val_on_index then
        -- TO DO: #1
        select id
        into p_tag_id
        from blog_tags
        where 1 = 1
        and tag = l_tag_val
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_cats
    ;
    return l_max;
  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_links
    ;
    return l_max;
  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_links_grp
    ;
    return l_max;
  end get_link_grp_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id in number,
    p_sep     in varchar2 default ','
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin
    select listagg( v1.tag, p_sep) within group( order by v1.display_seq ) as tags
    into l_tags
    from blog_v_all_posts_tags v1
    where 1 = 1
    and v1.post_id = p_post_id
    ;
    return l_tags;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number
  ) return varchar2
  as
    l_category_title varchar2(4000);
  begin
    -- fetch and return category name
    select t1.title
    into l_category_title
    from blog_cats t1
    where t1.id = p_category_id
    ;
    -- return string
    return l_category_title;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_title(
    p_link_grp_id in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return resource group name
    select title
    into l_value
    from blog_links_grp
    where id = p_link_grp_id
    ;
    -- Espace html and return string */
    return apex_escape.html( l_value );
  exception when no_data_found then
    return null;
  end get_link_grp_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html in varchar2
  ) return varchar2
  as
    l_first_p       varchar2(32700);
    l_first_p_start number;
    l_first_p_end   number;
  begin

    -- get first paragraph ending position
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>' );

    if l_first_p_start = 0 or l_first_p_end = 0 then
      raise_application_error( -20001,  'Post must habe at least one paragraph.' );
    end if;

    l_first_p_start := l_first_p_start - 1;
    l_first_p_end   := l_first_p_end + 3;

    -- get first paragraph
    l_first_p := substr( p_body_html, l_first_p_start, l_first_p_end );

    -- remove whitespace
    l_first_p := replace( regexp_replace( l_first_p, '\s+', ' ' ), '  ', ' ' );

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_tags
  as
  begin
    -- cleanup tags that aren't linked to any post
    delete from blog_tags t1
    where 1 = 1
    and not exists(
      select 1
      from blog_posts_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  )
  as
    l_seq   number;
    l_title varchar2(256);
  begin

    p_category_id := null;

    -- get next sequence value
    l_seq   := blog_cm.get_category_seq;
    l_title := trim( p_title );

    -- try insert category and return id for out parameter.
    -- if unique constraint violation raised, category exists.
    -- then find category id for out parameter in exception handler
    insert into blog_cats ( is_disabled, display_seq, title )
    values( 0, l_seq, l_title )
    returning id into p_category_id
    ;
  exception when dup_val_on_index then
    -- TO DO: #1
    l_title := upper( l_title );
    select v1.id
    into p_category_id
    from blog_cats v1
    where 1 = 1
    and v1.title_unique = l_title
    ;
  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_link_grp(
    p_title       in varchar2,
    p_link_grp_id out nocopy number
  )
  as
    l_seq   number;
    l_title varchar2(512);
  begin

    p_link_grp_id := null;

    -- get next sequence value
    l_seq := blog_cm.get_link_grp_seq;
    --
    l_title := trim( p_title );

    -- try insert resource group to tabe and return id for out parameter.
    -- if unique constraint violation raised, resource group exists.
    -- then find id for out paramete in exception handler
    insert into blog_links_grp( is_disabled, display_seq, title )
    values( 0, l_seq, l_title )
    returning id into p_link_grp_id
    ;

  exception when dup_val_on_index then
    -- TO DO: #1
    l_title := upper( l_title );
    select id
    into p_link_grp_id
    from blog_links_grp
    where 1 = 1
    and title_unique = l_title
    ;
  end add_link_grp;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id in number,
    p_tags    in varchar2,
    p_sep     in varchar2 default ','
  )
  as
    l_tag_id  number;
    l_arr_cnt number;
    l_tag_arr apex_t_varchar2;
    l_tag_tab blog_t_tag_ids := blog_t_tag_ids();
  begin

    -- split tags string to array and loop all values
    l_tag_arr := apex_string.split(
       p_str => p_tags
      ,p_sep => p_sep
    );

    for i in 1 .. l_tag_arr.count
    loop

      -- add tag to repository
      l_tag_id := null;

      blog_cm.add_tag(
         p_tag    => l_tag_arr(i)
        ,p_tag_id => l_tag_id
      );

      if l_tag_id is not null then

        -- collect tag id to array.
        -- array is used at end of procedure
        -- to check not existing relationships between tag and posts
        l_tag_tab.extend;

        -- get array last index.
        -- it is also usedfor tag display sequence
        l_arr_cnt := l_tag_tab.last;

        l_tag_tab( l_arr_cnt ) := blog_t_tag_id( l_tag_id );

        -- insert post id, tag id and display sequency to table.
        -- use unique constraint violation to skip existing records.
        begin
          insert into blog_posts_tags( is_disabled, post_id, tag_id, display_seq )
          values ( 0, p_post_id, l_tag_id, l_arr_cnt )
          ;
        exception when dup_val_on_index then
          -- TO DO: #1
          -- update display sequence if it changed
          update blog_posts_tags
          set display_seq = l_arr_cnt
          where 1 = 1
          and post_id = p_post_id
          and tag_id = l_tag_id
          and display_seq != l_arr_cnt
          ;
        end;

      end if;

    end loop;

    -- cleanup relationship from tags that aren't belong to post
    delete from blog_posts_tags t1
    where 1 = 1
    and post_id = p_post_id
    and not exists(
      select 1
      from table( l_tag_tab ) x1
      where 1 = 1
      and x1.tag_id = t1.tag_id
    );

    -- if any relationship was removed, remove unused tags
    if sql%rowcount > 0 then
      blog_cm.remove_unused_tags;
    end if;

  end add_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure save_post_preview(
    p_id              in number,
    p_tags            in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  )
  as
  begin

    delete from blog_post_preview
    where id = p_id
    ;

    insert into blog_post_preview(
       id
      ,tags
      ,post_title
      ,category_title
      ,body_html
    )
    values(
       p_id
      ,p_tags
      ,p_post_title
      ,p_category_title
      ,p_body_html
    )
    ;
  end save_post_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure after_post_edit(
    p_app_id in varchar2
  )
  as
  begin

    -- TO DO: #2

    -- refresh materialized views
    dbms_mview.refresh( 'BLOG_ARCHIVE_LOV,BLOG_POSTS_LAST20', 'CC' );

    -- clear public application region cache
    blog_conf.purge_region_cache(
       p_app_id    => p_app_id
      ,p_static_id => 'LATEST_POSTS_LIST'
    );

    blog_conf.purge_region_cache(
       p_app_id    => p_app_id
      ,p_static_id => 'CATEGORIES_LIST'
    );

  end after_post_edit;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
end "BLOG_CM";
/

CREATE OR REPLACE PACKAGE  "BLOG_AUTH"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Authentication and authorization
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function login(
    p_username  in varchar2,
    p_password  in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  function get_blogger_id(
    p_app_user  in varchar2
  ) return number;
--------------------------------------------------------------------------------
  procedure set_password (
    p_id        in number,
    p_passwd    in varchar2
  );
--------------------------------------------------------------------------------
  function check_password(
    p_app_user  in varchar2,
    p_id        in number,
    p_passwd    in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
end "BLOG_AUTH";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_AUTH"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function blog_pw_hash (
    p_username in varchar2,
    p_password in varchar2
  ) return varchar2
  as

  --    This function should be wrapped, as the hash algorhythm for password is exposed.
    l_password varchar2(4000);
    l_salt     varchar2(255) := 'awcKuelNHGCyXFwfWTOgqLvhpwUbyEjCTdVIulHK';
  begin
    l_password  :=
          substr(l_salt, 8, 13)
      ||  sys.utl_raw.cast_to_raw(p_password)
      ||  substr(l_salt, 4, 10)
      ||  substr(l_salt, 22, 28)
      ||  sys.utl_raw.cast_to_raw(p_username)
      ||  substr(l_salt, 18, 26)
    ;
    l_password := sys.utl_raw.cast_to_raw(l_password);
    l_password := sys.dbms_obfuscation_toolkit.md5(input_string => l_password);
    return l_password;
  end blog_pw_hash;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function login(
    p_username in varchar2,
    p_password in varchar2
  ) return boolean
  as
    auth_success            constant integer      := 0;
    auth_unknown_user       constant integer      := 1;
    auth_account_locked     constant integer      := 2;
    auth_account_expired    constant integer      := 3;
    auth_password_incorrect constant integer      := 4;
    auth_password_first_use constant integer      := 5;
    auth_attempts_exceeded  constant integer      := 6;
    auth_internal_error     constant integer      := 7;
    l_blogger_id             number;
  begin
    -- First, check to see if the user is in the user table and have password
    begin
      select id
      into l_blogger_id
      from blog_bloggers
      where username = p_username
      ;
    exception when no_data_found then
      -- if user not exists set authentication status and return false
      apex_util.set_authentication_result(auth_unknown_user);
      return false;
    end;
    -- user exists. check if password is valid
    if
      blog_auth.check_password(
         p_app_user => p_username
        ,p_id       => l_blogger_id
        ,p_passwd   => p_password
      )
    then
      -- password is valid. set authentication status and return true
      apex_util.set_authentication_result(auth_success);
      return true;
    end if;
    -- password is not valid. set authentication status and return false
    apex_util.set_authentication_result(auth_password_incorrect);
    return false;
  end login;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_blogger_id(
    p_app_user  in varchar2
  ) return number
  as
    l_blogger_id number;
  begin

    -- get blogger id
    select id
      into l_blogger_id
      from blog_bloggers
     where username = p_app_user
    ;
    return l_blogger_id;
  end get_blogger_id;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function check_password(
    p_app_user  in varchar2,
    p_id        in number,
    p_passwd    in varchar2
  ) return boolean
  as
    l_password        varchar2(4000);
    l_stored_password varchar2(4000);
  begin
    -- First, check to see if the user is in the user table and have password
    begin
      select passwd
      into l_stored_password
      from blog_bloggers
      where 1 = 1
      and username = p_app_user
      and id = p_id
      ;
    exception when no_data_found then
      return false;
    end;
    -- Apply the custom hash function to the password
    l_password := blog_pw_hash(p_id, p_passwd);
    -- Compare them to see if they are the same and return either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    end if;
    return false;
  end check_password;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_password (
    p_id      in number,
    p_passwd  in varchar2
  )
  as
    l_passwd varchar2(4000);
  begin
    -- get password hash
    l_passwd := blog_pw_hash(p_id, p_passwd);
    -- update password if it changed
    for c1 in(
      select id
      from blog_bloggers
      where 1 = 1
      and id = p_id
      and passwd != l_passwd
    ) loop
      update blog_bloggers
        set passwd = l_passwd
        where id = c1.id
        ;
    end loop;
  end set_password;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_AUTH";
/
