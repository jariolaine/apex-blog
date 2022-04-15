CREATE OR REPLACE package  "BLOG_URL"
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
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function get_canonical_host return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_tab(
    p_app_page_id     in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_request         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_post(
    p_post_id         in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_post(
    p_post_id         in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_category(
    p_category_id     in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_category(
    p_category_id     in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_archive(
    p_archive_id      in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_archive(
    p_archive_id      in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_tag(
    p_tag_id          in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_clear_cache     in varchar2 default null,
    p_canonical       in varchar2 default 'NO',
    p_plain_url       in varchar2 default 'YES',
    p_encode_url      in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_unsubscribe(
    p_app_id          in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_rss(
    p_app_id          in varchar2 default null,
    p_app_page_id     in varchar2 default 'PGM'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_rss_xsl(
    p_app_id          in varchar2 default null,
    p_app_page_id     in varchar2 default 'PGM'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_sitemap_index(
    p_app_id          in varchar2 default null,
    p_app_page_id     in varchar2 default 'PGM'
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_URL";
/


CREATE OR REPLACE package body "BLOG_URL"
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
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_canonical_host
  return varchar2
  as
    l_url varchar2(4000);
  begin

    -- get canonical host from blog settings
    l_url :=  blog_util.get_attribute_value( 'G_CANONICAL_HOST' );

    -- if host not found from settings, use APEX provided value
    if l_url is null
    then
      l_url := apex_util.host_url();
    end if;

    return l_url;

  end get_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab(
    p_app_page_id in varchar2,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_request     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
      when 'YES'
      then blog_url.get_canonical_host
      end
      ||
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_session     => p_session
       ,p_request     => p_request
       ,p_clear_cache => p_clear_cache
       ,p_plain_url   => true
      );

  end get_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in number,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
    l_post_id varchar2(256);
  begin

    l_post_id := blog_util.int_to_vc2( p_post_id );
    return
      get_post(
         p_post_id      => l_post_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_clear_cache  => p_clear_cache
        ,p_canonical    => p_canonical
        ,p_plain_url    => p_plain_url
        ,p_encode_url   => p_encode_url
      );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in varchar2,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
    l_url varchar2(4000);
  begin

    l_url := apex_page.get_url(
      p_application => p_app_id
     ,p_page        => 'POST'
     ,p_session     => p_session
     ,p_clear_cache => p_clear_cache
     ,p_items       => 'P2_POST_ID'
     ,p_values      => p_post_id
     ,p_plain_url   => case p_plain_url when 'YES' then true else false end
   );

    return
      case p_canonical
      when 'YES'
      then blog_url.get_canonical_host
      end
      ||
      case p_encode_url
      when 'YES'
      then apex_util.url_encode( l_url )
      else l_url
      end
    ;

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in number,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
    l_category_id varchar2(256);
  begin

    l_category_id := blog_util.int_to_vc2( p_category_id );
    return
      get_category(
         p_category_id  => l_category_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_canonical    => p_canonical
        ,p_clear_cache  => p_clear_cache
        ,p_plain_url    => p_plain_url
        ,p_encode_url   => p_encode_url
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
      when 'YES'
      then blog_url.get_canonical_host
      end
      ||
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => 'CATEGORY'
       ,p_session     => p_session
       ,p_clear_cache => p_clear_cache
       ,p_items       => 'P14_CATEGORY_ID'
       ,p_values      => p_category_id
       ,p_plain_url   => case p_plain_url when 'YES' then true else false end
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in number,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
    l_archive_id varchar2(256);
  begin

    l_archive_id := blog_util.int_to_vc2( p_archive_id );
    return
      get_archive(
         p_archive_id   => l_archive_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_canonical    => p_canonical
        ,p_clear_cache  => p_clear_cache
        ,p_plain_url    => p_plain_url
        ,p_encode_url   => p_encode_url
      );

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in varchar2,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
      when 'YES'
      then blog_url.get_canonical_host
      end
      ||
      apex_page.get_url(
         p_application => p_app_id
        ,p_page        => 'ARCHIVES'
        ,p_session     => p_session
        ,p_clear_cache => p_clear_cache
        ,p_items       => 'P15_ARCHIVE_ID'
        ,p_values      => p_archive_id
        ,p_plain_url   => case p_plain_url when 'YES' then true else false end
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_canonical   in varchar2 default 'NO',
    p_plain_url   in varchar2 default 'YES',
    p_encode_url  in varchar2 default 'NO'
  ) return varchar2
  as
    l_tag_id varchar2(256);
  begin

    l_tag_id := blog_util.int_to_vc2( p_tag_id );

    return
      case p_canonical
      when 'YES'
      then blog_url.get_canonical_host
      end
      ||
      apex_page.get_url(
         p_application => p_app_id
        ,p_page        => 'TAG'
        ,p_session     => p_session
        ,p_clear_cache => p_clear_cache
        ,p_items       => 'P6_TAG_ID'
        ,p_values      => l_tag_id
        ,p_plain_url   => case p_plain_url when 'YES' then true else false end
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_unsubscribe(
    p_app_id          in varchar2,
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
      || p_app_id
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
         p_url => l_url
        ,p_checksum_type => 'PUBLIC_BOOKMARK'
        ,p_plain_url => true
      );

    return blog_url.get_canonical_host || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_app_id      in varchar2 default null,
    p_app_page_id in varchar2 default 'PGM'
  ) return varchar2
  as
    l_rss_url varchar2(4000);
  begin

    -- Fetch RSS URL override from settings
    l_rss_url := blog_util.get_attribute_value( 'G_RSS_URL' );
    -- If there isn't override custruct URL
    if l_rss_url is null
    then
      l_rss_url := blog_url.get_canonical_host
        || apex_page.get_url(
          p_application => p_app_id
          ,p_page => p_app_page_id
          ,p_session => null
          ,p_request => 'application_process=rss.xml'
        );
    end if;

    return l_rss_url;

  end get_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_xsl(
    p_app_id      in varchar2 default null,
    p_app_page_id in varchar2 default 'PGM'
  ) return varchar2
  as
    l_xsl_url varchar2(4000);
  begin

    -- Fetch XSL URL override from settings
    l_xsl_url := blog_util.get_attribute_value( 'G_RSS_XSL_URL' );
    -- If there isn't override custruct XSL
    if l_xsl_url is null
    then
      l_xsl_url := blog_url.get_canonical_host
        || apex_page.get_url(
          p_application => p_app_id
          ,p_page => p_app_page_id
          ,p_session => null
          ,p_request => 'application_process=rss.xsl'
        );
    end if;

    return l_xsl_url;

  end get_rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_sitemap_index(
    p_app_id      in varchar2 default null,
    p_app_page_id in varchar2 default 'PGM'
  ) return varchar2
  as
    l_sitemap_url varchar2(4000);
  begin

    l_sitemap_url := blog_url.get_canonical_host
      || apex_page.get_url(
        p_application => p_app_id
        ,p_page => p_app_page_id
        ,p_session => null
        ,p_request => 'application_process=sitemap-index.xml'
      );

    return l_sitemap_url;

  end get_sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
