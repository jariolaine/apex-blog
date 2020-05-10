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
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_tab(
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_home_page,
    p_session       in varchar2 default null,
    p_debug         in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post(
    p_post_id         in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_post_page,
    p_page_item       in varchar2 default blog_globals.g_post_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post(
    p_post_id         in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_post_page,
    p_page_item       in varchar2 default blog_globals.g_post_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category(
    p_category_id     in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_category_page,
    p_page_item       in varchar2 default blog_globals.g_category_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category(
    p_category_id     in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_category_page,
    p_page_item       in varchar2 default blog_globals.g_category_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id      in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_archive_page,
    p_page_item       in varchar2 default blog_globals.g_archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id      in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_archive_page,
    p_page_item       in varchar2 default blog_globals.g_archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id          in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_tag_page,
    p_page_item       in varchar2 default blog_globals.g_tag_item
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_search_page,
    p_page_item       in varchar2 default blog_globals.g_search_item
  );
--------------------------------------------------------------------------------
end "BLOG_URL";
/


CREATE OR REPLACE package body blog_url as
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
  function get_tab(
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_home_page,
    p_session       in varchar2 default null,
    p_debug         in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_session     => p_session
       ,p_debug       => p_debug
       ,p_clear_cache => 'RP'
      );

  end get_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id       in number,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_post_page,
    p_page_item     in varchar2 default blog_globals.g_post_item
  ) return varchar2
  as
    l_post_id varchar2(256);
  begin

    l_post_id := to_char( p_post_id, blog_globals.g_number_format );
    return
      blog_url.get_post(
         p_post_id      => l_post_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_app_page_id  => p_app_page_id
        ,p_page_item    => p_page_item
      );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id       in varchar2,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_post_page,
    p_page_item     in varchar2 default blog_globals.g_post_item
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
    p_session     in varchar2 default null,
    p_app_page_id in varchar2 default blog_globals.g_category_page,
    p_page_item   in varchar2 default blog_globals.g_category_item
  ) return varchar2
  as
    l_category_id varchar2(256);
  begin

    l_category_id := to_char( p_category_id, blog_globals.g_number_format );
    return
      blog_url.get_category(
         p_category_id  => l_category_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_app_page_id  => p_app_page_id
        ,p_page_item    => p_page_item
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_app_page_id in varchar2 default blog_globals.g_category_page,
    p_page_item   in varchar2 default blog_globals.g_category_item
  ) return varchar2
  as
  begin

    return
      apex_page.get_url(
        p_application => p_app_id
       ,p_page        => p_app_page_id
       ,p_session     => p_session
       ,p_items       => case when p_category_id is not null then p_page_item end
       ,p_values      => p_category_id
       ,p_clear_cache => 'RP'
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id      in number,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_archive_page,
    p_page_item       in varchar2 default blog_globals.g_archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2
  as
    l_archive_id varchar2(256);
  begin

    l_archive_id := to_char( p_archive_id, blog_globals.g_number_format );
    return
      blog_url.get_archive(
         p_archive_id   => l_archive_id
        ,p_app_id       => p_app_id
        ,p_session      => p_session
        ,p_app_page_id  => p_app_page_id
        ,p_page_item    => p_page_item
      );

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id      in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_archive_page,
    p_page_item       in varchar2 default blog_globals.g_archive_item,
    p_current_page_id in varchar2 default null
  ) return varchar2
  as
  begin

    return
      case
      when p_current_page_id = p_app_page_id
      or p_current_page_id is null
      then
        apex_page.get_url(
           p_application => p_app_id
          ,p_page        => p_app_page_id
          ,p_session     => p_session
          ,p_items       => case when p_archive_id is not null then p_page_item end
          ,p_values      => p_archive_id
          ,p_clear_cache => 'RP'
        )
      end;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_app_id      in varchar2 default null,
    p_session     in varchar2 default null,
    p_app_page_id in varchar2 default blog_globals.g_tag_page,
    p_page_item   in varchar2 default blog_globals.g_tag_item
  ) return varchar2
  as
  begin

    return
      apex_page.get_url(
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
    p_value         in varchar2,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_search_page,
    p_page_item     in varchar2 default blog_globals.g_search_item
  )
  as
  begin
    -- Get search page URL and redirect if there there is string for search
    if p_value is not null then
      apex_util.redirect_url (
        apex_page.get_url(
           p_application => p_app_id
          ,p_page        => p_app_page_id
          ,p_session     => p_session
          ,p_clear_cache => 'RP'
          ,p_items       => p_page_item
          ,p_values      => p_value
        )
      );
    end if;
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
