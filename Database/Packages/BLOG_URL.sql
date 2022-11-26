create or replace package "BLOG_URL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Generate URL
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 09.05.2020 - Functions that are called only from APEX
--                            number return value and number input parameters changed to varchar2.
--                            Functions that are also used in query
--                            another signature with varchar2 input and return values created for APEX
--                            Added parameter p_canonical to functions returning URL
--    Jari Laine 10.05.2020 - New function get_unsubscribe
--    Jari Laine 19.05.2020 - Changed page and items name to "hard coded" values
--                            and removed global constants from blog_util package
--    Jari Laine 23.05.2020 - Removed default from function get_tab parameter p_app_page_id
--    Jari Laine 13.11.2021 - New funtions get_sitemap_index, get_rss and get get_rss_xsl
--    Jari Laine 18.12.2021 - Moved procedure redirect_search to package blog_util.
--    Jari Laine 14.03.2022 - New function get_canonical_host
--    Jari Laine 24.11.2022 - Hard coded values to package private constants
--                          - Removed not used parammeters from functions
--                          - New function get_dynamic_page
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function get_canonical_host return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_html
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
    p_process         in varchar2 default null
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
end "BLOG_URL";
/


create or replace package body "BLOG_URL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  type t_page_item is record(
    page_alias  varchar2(256),
    item_name   varchar2(256)
  );

  c_post_page     constant t_page_item := t_page_item( 'POST',      'P2_POST_ID' );
  c_category_page constant t_page_item := t_page_item( 'CATEGORY',  'P14_CATEGORY_ID' );
  c_archive_page  constant t_page_item := t_page_item( 'ARCHIVES',  'P15_ARCHIVE_ID' );
  c_tags_page     constant t_page_item := t_page_item( 'TAG',       'P6_TAG_ID' );

  g_canonical_url varchar2(256);

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
    if g_canonical_url is null
    then

      g_canonical_url := blog_util.get_attribute_value( 'G_CANONICAL_HOST' );
      -- if host not found from settings, use APEX provided value
      if g_canonical_url is null
      then
        g_canonical_url := apex_util.host_url();
      end if;
      -- remove trailing slash
      g_canonical_url := rtrim( g_canonical_url, '/' );

    end if;

    return g_canonical_url;

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
         p_application  => p_application
        ,p_page         => p_page
        ,p_session      => ''
        ,p_plain_url    => true
      );

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
         p_post_id      => l_post_id
        ,p_application  => p_application
        ,p_canonical    => p_canonical
      );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in varchar2,
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
     ,p_page        => c_post_page.page_alias
     ,p_session     => ''
     ,p_items       => c_post_page.item_name
     ,p_values      => p_post_id
     ,p_plain_url   => true
   );

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
         p_category_id  => l_category_id
        ,p_canonical    => p_canonical
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
         p_page       => c_category_page.page_alias
        ,p_session    => ''
        ,p_items      => c_category_page.item_name
        ,p_values     => p_category_id
        ,p_plain_url  => true
      );

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
         p_archive_id => l_archive_id
        ,p_canonical  => p_canonical
      );

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end  ||
      apex_page.get_url(
         p_page       => c_archive_page.page_alias
        ,p_session    => ''
        ,p_items      => c_archive_page.item_name
        ,p_values     => p_archive_id
        ,p_plain_url  => true
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
         p_tag_id     => l_tag_id
        ,p_canonical  => p_canonical
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
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
         p_page       => c_tags_page.page_alias
        ,p_session    => ''
        ,p_items      => c_tags_page.item_name
        ,p_values     => p_tag_id
        ,p_plain_url  => true
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
         p_page     => 'information'
        ,p_request  => l_content_id
      )
    ;

  end get_dynamic_page;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_process(
    p_application in varchar2 default null,
    p_process     in varchar2 default null
  ) return varchar2
  as
  begin

    return get_canonical_host ||
      apex_page.get_url(
         p_application  => p_application
        ,p_page         => 'pgm'
        ,p_session      => ''
        ,p_request      => 'application_process=' || p_process
        ,p_plain_url    => true
      );

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
  begin

    l_subs_id := blog_util.int_to_vc2( p_subscription_id );
    -- workaround because APEX 19.2
    -- apex_page.get_url don't have parameter p_plain_url
    l_url := 'f?p='
      || p_application
      || ':POST:::NO::'
      || 'P2_POST_ID'
      || ','
      || 'P2_SUBSCRIPTION_ID'
      || ':'
      || p_post_id
      || ','
      || l_subs_id
    ;

    l_url :=
      apex_util.prepare_url(
         p_url            => l_url
        ,p_checksum_type  => 'PUBLIC_BOOKMARK'
        ,p_plain_url      => true
      );

    return get_canonical_host || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_application in varchar2 default null
  ) return varchar2
  as
    l_rss_url varchar2(4000);
  begin

    -- Fetch RSS URL override from settings
    l_rss_url := blog_util.get_attribute_value( 'G_RSS_URL' );
    -- If there isn't override custruct URL
    if l_rss_url is null
    then
      l_rss_url :=
        get_process(
           p_application  => p_application
          ,p_process      => 'rss.xml'
        );
    end if;

    return l_rss_url;

  end get_rss;
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
    -- If there isn't override custruct XSL
    if l_xsl_url is null
    then
      l_xsl_url :=
        get_process(
           p_application  => p_application
          ,p_process      => 'rss.xsl'
        );
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
         p_application  => p_application
        ,p_process      => 'sitemap-index.xml'
      );

    return l_sitemap_url;

  end get_sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
