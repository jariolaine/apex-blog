CREATE OR REPLACE package  "BLOG_URL"
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
--    Jari Laine 09.05.2020 - Functions that are called only from APEX
--                            number return value and number input parameters changed to varchar2.
--                            Functions that are also used in query
--                            another signature with varchar2 input and return values created for APEX
--                            Added parameter p_canonical to functions returning URL
--    Jari Laine 10.05.2020 - New function get_unsubscribe
--    Jari Laine 19.05.2020 - Changed page and items name to "hard coded" values
--                            and removed global constants from blog_util package
--    Jari Laine 23.05.2020 - Removed default from function get_tab parameter p_app_page_id
--
--------------------------------------------------------------------------------
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
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null
  );
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
      then blog_util.get_attribute_value( 'G_CANONICAL_URL' )
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
      then blog_util.get_attribute_value( 'G_CANONICAL_URL' )
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
      then blog_util.get_attribute_value( 'G_CANONICAL_URL' )
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
      then blog_util.get_attribute_value( 'G_CANONICAL_URL' )
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
      then blog_util.get_attribute_value( 'G_CANONICAL_URL' )
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

    return blog_util.get_attribute_value( 'G_CANONICAL_URL' ) || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value         in varchar2,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null
  )
  as
  begin
    -- Get search page URL and redirect if there there is string for search
    --if p_value is not null then
      apex_util.redirect_url (
        apex_page.get_url(
           p_application => p_app_id
          ,p_page        => 'SEARCH'
          ,p_session     => p_session
--          ,p_clear_cache => 'RP'
          ,p_items       => 'P0_SEARCH'
          ,p_values      => p_value
          ,p_plain_url   => true
        )
      );
    --end if;
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
