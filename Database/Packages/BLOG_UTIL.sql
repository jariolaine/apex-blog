CREATE OR REPLACE package  "BLOG_UTIL"
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
--    Jari Laine 28.03.2020 - Signature 2 of get_year_month function
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_app_id(
    p_app_name in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure set_items_from_param(
    p_app_id      in number
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in number,
    p_escape      in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number,
    p_escape      in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month  in number,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_published   in timestamp with local time zone,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/


CREATE OR REPLACE package body "BLOG_UTIL"
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
    from blog_settings
    where param_name = p_param_name
    ;
    --apex_debug.info( 'Fetch param name %s. Param value is: %s', p_param_name, l_value );
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Try fetch param name %s. Parameter not found.', coalesce( p_param_name, '(null)' ) );
    raise_application_error( -20001,  'Parameter not exists.' );
    raise;
  when others then
    apex_debug.error( 'Fetch param name %s.', coalesce( p_param_name, '(null)' ) );
    raise;
  end get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_app_id(
    p_app_name in varchar2
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return value from parameter table
    select item_value
    into l_value
    from blog_items_init
    where 1 = 1
    and item_name = p_app_name
    ;
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Try fetch param name %s. Parameter not found.', coalesce( p_app_name, '(null)' ) );
    raise_application_error( -20001,  'Parameter not exists.' );
    raise;
  when others then
    apex_debug.error( 'Fetch param name %s.', coalesce( p_app_name, '(null)' ) );
    raise;
  end get_app_id;
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
    apex_debug.error( 'Set items from param. p_app_id is %s.', coalesce( to_char( p_app_id ), '(null)' ) );
    raise;
  end set_items_from_param;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in number,
    p_escape      in boolean default false
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
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Try fetch post id %s. Not found.', coalesce( to_char( p_post_id ), '(null)' ) );
    raise_application_error( -20001,  'Post not exists.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching post id %s.', coalesce( to_char( p_post_id ), '(null)' ) );
    raise;
  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number,
    p_escape      in boolean default false
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
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Try fetch category id %s. Not found.', coalesce( to_char( p_category_id ), '(null)' ) );
    raise_application_error( -20001,  'Category not exists.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching category id %s.', coalesce( to_char( p_category_id ), '(null)' ) );
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
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = p_tag_id
    ;
    --apex_debug.info( 'Fetch tag %s. tag name is: %s', p_tag_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    raise_application_error( -20001,  'Tag not exists.' );
    apex_debug.error( 'Try fetch tag id %s. Tag not found.', coalesce( to_char( p_tag_id ), '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching tag id %s.', coalesce( to_char( p_tag_id ), '(null)' ) );
    raise;
  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month  in number,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2
  as
  begin
    -- format year month number and return string
    return case when p_year_month is not null then
      to_char(
         to_date( p_year_month, 'YYYYMM' )
        ,p_date_format || case when p_posts_count is not null then ' "(' || p_posts_count || ')"' end
      )
    end;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_published   in timestamp with local time zone,
    p_posts_count in number default null,
    p_date_format in varchar2 default 'fmMonth, YYYY'
  ) return varchar2
  as
  begin
    -- format published date and return string
    return case when p_published is not null then
      to_char(
         p_published
        ,p_date_format || case when p_posts_count is not null then ' "(' || p_posts_count || ')"' end
      )
    end;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
