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
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 

--------------------------------------------------------------------------------
  function get_tab(
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.home_page,
    p_session       in number   default null,
    p_debug         in varchar2 default 'NO'
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
    p_page_item   in varchar2 default blog_globals.tag_item
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
    p_app_page_id   in varchar2 default blog_globals.home_page,
    p_session       in number   default null,
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
    p_page_item   in varchar2 default blog_globals.tag_item
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
