create or replace package "BLOG_URL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    This package contains functions to generate various types of URLs
--    for the blog application. The URLs support different content types,
--    such as posts, categories, archives, tags, and dynamic pages,
--    while offering flexibility with canonical options and APEX integrations.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.04.2019   Jari Laine     Created package.
--  09.05.2020   Jari Laine     Changed number input/output parameters to VARCHAR2 for APEX usage.
--                              Added canonical URL parameter to functions.
--                              Created additional signatures for APEX usage.
--  10.05.2020   Jari Laine     Added new function get_unsubscribe.
--  19.05.2020   Jari Laine     Hardcoded page and item names.
--                              Removed global constants from BLOG_UTIL package.
--  23.05.2020   Jari Laine     Removed default value for get_tab parameter p_app_page_id.
--  13.11.2021   Jari Laine     Added functions get_sitemap_index, get_rss, and get_rss_xsl.
--  18.12.2021   Jari Laine     Moved procedure redirect_search to BLOG_UTIL.
--  14.03.2022   Jari Laine     Added new function get_canonical_host.
--  24.11.2022   Jari Laine     Added new function get_dynamic_page.
--                              Removed unused parameters from functions.
--                              Hardcoded values moved to package private constants.
--  18.11.2023   Jari Laine     Added new function get_atom.
--  01.04.2024   Jari Laine     Changed private constants to a JSON object.
--  23.07.2024   Jari Laine     Added new function get_file.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function get_canonical_host return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
  function get_tab(
    p_page            in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_comm, blog_xml
-- view blog_v_posts
  function get_post(
    p_post_id         in number,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_post(
    p_post_id         in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_categories
  function get_category(
    p_category_id     in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_category(
    p_category_id     in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_archive_year
  function get_archive(
    p_archive_id      in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_archive(
    p_archive_id      in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_post_tags
  function get_tag(
    p_tag_id          in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_tag(
    p_tag_id          in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- view blog_v_dynamic_content
  function get_dynamic_page(
    p_content_id      in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_url, blog_xml
  function get_process(
    p_application     in varchar2 default null,
    p_process         in varchar2 default null,
    p_items           in varchar2 default null,
    p_values          in varchar2 default null,
    p_canonical       in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_comm
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
-- Blog Administration > Lists > Public Application Links
  function get_rss(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
-- Blog Administration > Lists > Public Application Links
  function get_atom(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_xml
  function get_rss_xsl(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  Blog Administration > Lists > Public Application Links
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  Blog Administration abd Public Application
  function get_file(
    p_file_path       in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/


create or replace package body "BLOG_URL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- json for pages and items
  c_page_and_items constant json_object_t := json_object_t.parse( '{
    "post": {"page": "POST", "items": "P2_POST_ID"},
    "category": {"page": "CATEGORY", "items": "P14_CATEGORY_ID"},
    "archive": {"page": "ARCHIVES", "items": "P15_ARCHIVE_ID"},
    "tag": {"page": "TAG", "items": "P6_TAG_ID"},
    "unsubscribe": {"page": "POST", "items": "P2_POST_ID,P2_SUBSCRIPTION_ID"},
    "download": {"page": "PGM", "items": "P1003_FILE_NAME", "process": "download"}
  }' );

-- cache rss and atom url
  g_rss_url             varchar2(1024);
  g_atom_url            varchar2(1024);
-- cache canonical host url
  g_canonical_host_url  varchar2(1024);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_canonical_host
  return varchar2
  as
  begin

    -- get canonical host from blog settings or use APEX provided value
    -- cache value to package private variable
    if g_canonical_host_url is null
    then

      g_canonical_host_url := blog_util.get_attribute_value( 'G_CANONICAL_HOST' );
      -- if host not found from settings, use APEX provided value
      if g_canonical_host_url is null
      then
        g_canonical_host_url := apex_util.host_url();
      end if;
      -- remove trailing slash
      g_canonical_host_url := rtrim( g_canonical_host_url, '/' );

    end if;

    return g_canonical_host_url;

  end get_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab(
    p_page        in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_url varchar2(4000);
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
        p_application => p_application
      , p_page        => p_page
      , p_session     => ''
      , p_plain_url   => true
      )
    ;

  end get_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in number,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_post_id varchar2(256);
  begin

    l_post_id := blog_util.int_to_vc2( p_post_id );

    return
      get_post(
        p_post_id     => l_post_id
      , p_application => p_application
      , p_canonical   => p_canonical
      )
    ;

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

  l_json := c_page_and_items.get_object( 'post' );

  return
    case p_canonical
      when 'YES' then get_canonical_host
    end ||
    apex_page.get_url(
      p_application => p_application
    , p_page        => l_json.get_string( 'page' )
    , p_session     => ''
    , p_items       => l_json.get_string( 'items' )
    , p_values      => p_post_id
    , p_plain_url   => true
    )
  ;

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_category_id varchar2(256);
  begin

    l_category_id := blog_util.int_to_vc2( p_category_id );

    return
      get_category(
        p_category_id => l_category_id
      , p_canonical   => p_canonical
      )
    ;

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

  l_json := c_page_and_items.get_object( 'category' );

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_category_id
      , p_plain_url => true
      )
    ;

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_archive_id varchar2(256);
  begin

    l_archive_id := blog_util.int_to_vc2( p_archive_id );

    return
      get_archive(
        p_archive_id  => l_archive_id
      , p_canonical   => p_canonical
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'archive' );

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end  ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_archive_id
      , p_plain_url => true
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_tag_id varchar2(256);
  begin

    l_tag_id := blog_util.int_to_vc2( p_tag_id );

    return
      get_tag(
        p_tag_id    => l_tag_id
      , p_canonical => p_canonical
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'tag' );

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_tag_id
      , p_plain_url => true
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_dynamic_page(
    p_content_id in number
  ) return varchar2
  as
    l_content_id varchar(256);
  begin

    l_content_id := blog_util.int_to_vc2( p_content_id );

    return
      apex_page.get_url(
        p_page    => 'information'
      , p_request => l_content_id
      )
    ;

  end get_dynamic_page;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_process(
    p_application in varchar2 default null,
    p_process     in varchar2 default null,
    p_items       in varchar2 default null,
    p_values      in varchar2 default null,
    p_canonical   in varchar2 default 'YES'
  ) return varchar2
  as
    l_request varchar2(256);
  begin

    l_request :=
      apex_string.format(
        p_message => 'application_process=%s'
      , p0 => p_process
      )
    ;
    return
      case p_canonical
      when 'YES'
      then get_canonical_host end ||
      apex_page.get_url(
        p_application => p_application
      , p_page        => 'pgm'
      , p_session     => ''
      , p_request     => l_request
      , p_items       => p_items
      , p_values      => p_values
      , p_plain_url   => true
      )
    ;

  end get_process;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2
  as
    l_url     varchar2(4000);
    l_subs_id varchar2(256);
    l_json    json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'unsubscribe' );

    l_subs_id := blog_util.int_to_vc2( p_subscription_id );

    l_url :=
      apex_page.get_url(
        p_application => p_application
      , p_page        => l_json.get_string( 'page' )
      , p_session     => ''
      , p_items       => l_json.get_string( 'items' )
      , p_values      => p_post_id || ',' || l_subs_id
      , p_plain_url   => true
      )
    ;

    return get_canonical_host || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_application in varchar2 default null
  ) return varchar2
  as
  begin
    -- get rss url from blog settings or use default value
    -- cache value to package private variable
    if g_rss_url is null
    then
      -- Fetch RSS URL override from settings
      g_rss_url := blog_util.get_attribute_value( 'G_RSS_URL' );
      -- If there isn't override custruct URL
      if g_rss_url is null
      then
        g_rss_url :=
          get_process(
            p_application => p_application
          , p_process     => 'rss.xml'
          )
        ;
      end if;
    end if;

    return g_rss_url;

  end get_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_atom(
    p_application in varchar2 default null
  ) return varchar2
  as
  begin

    -- cache value to package private variable
    if g_atom_url is null
    then
      g_atom_url :=
        get_process(
          p_application => p_application
        , p_process     => 'atom.xml'
        )
      ;
    end if;

    return g_atom_url;

  end get_atom;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_xsl(
    p_application in varchar2 default null
  ) return varchar2
  as
    l_xsl_url varchar2(4000);
  begin

    -- Fetch XSL URL override from settings
    l_xsl_url := blog_util.get_attribute_value( 'G_RSS_XSL_URL' );
    -- If there isn't override use default XSL
    if l_xsl_url is null
    then
      l_xsl_url :=
        get_process(
          p_application => p_application
        , p_process     => 'rss.xsl'
        )
      ;
    end if;

    return l_xsl_url;

  end get_rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2
  as
    l_sitemap_url varchar2(4000);
  begin

    l_sitemap_url :=
      get_process(
        p_application => p_application
      , p_process     => 'sitemap-index.xml'
      )
    ;

    return l_sitemap_url;

  end get_sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_file(
    p_file_path       in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'download' );

    return
      get_process(
        p_application => p_application
      , p_process     => l_json.get_string( 'process' )
      , p_items       => l_json.get_string( 'items' )
      , p_values      => p_file_path
      , p_canonical   => p_canonical
      )
    ;

  end get_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
