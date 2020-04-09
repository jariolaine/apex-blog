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
  function get_attribute_value(
    p_attribute_name    in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name      in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id        in number
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id       in number,
    p_escape        in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id   in number,
    p_escape        in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id        in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month    in number,
    p_date_format   in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_archive_date  in timestamp with local time zone,
    p_date_format   in varchar2,
    p_posts_count   in number default null
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/


create or replace package body "BLOG_UTIL"
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
  function get_attribute_value(
    p_attribute_name in varchar2
  ) return varchar2 result_cache
  as
    l_value varchar2(4000);
  begin
  
    apex_debug.enter(
      'blog_util.get_attribute_value'
      ,'p_attribute_name'
      ,p_attribute_name
    );
  
    if p_attribute_name is null then
      raise no_data_found;
    end if;
    
    -- fetch and return value from settings table
    select attribute_value
    into l_value
    from blog_settings
    where attribute_name = p_attribute_name
    ;
    apex_debug.info( 'Fetch attribute %s return: %s', p_attribute_name, l_value );
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Not found. Attribute: %s', coalesce( p_attribute_name, '(null)' ) );
    raise_application_error( -20001,  'Attribute not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching attribute: %s', p_attribute_name );
    raise;
  end get_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name in varchar2
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
  
    apex_debug.enter(
      'blog_util.get_item_init_value'
      ,'p_item_name'
      ,p_item_name
    );
    
    if p_item_name is null then
      raise no_data_found;
    end if;
    
    -- fetch and return value from settings table
    select item_value
    into l_value
    from blog_items_init
    where 1 = 1
    and item_name = p_item_name
    ;
    apex_debug.info( 'Fetc item %s return: %s', p_item_name, l_value );
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Not found. Item: %s', coalesce( p_item_name, '(null)' ) );
    raise_application_error( -20001,  'Item not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching item: %s', p_item_name );
    raise;
  end get_item_init_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in number
  )
  as
  begin
  
    apex_debug.enter(
      'blog_util.initialize_items'
      ,'p_app_id'
      ,p_app_id
    );
    
    if p_app_id is null then
      raise no_data_found;
    end if;
    
    -- loop materialized view and set items values
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_items_init i
      where i.application_id = p_app_id
    ) loop
      apex_debug.info( 'Initialize application id: %s item: %s value: %s', p_app_id, c1.item_name, c1.item_value );
      apex_util.set_session_state( c1.item_name, c1.item_value, false );
    end loop;
    
  exception when no_data_found then
    apex_debug.error( 'Not found. Application: %s', coalesce( p_app_id, '(null)' ) );
    raise_application_error( -20001,  'Application not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when initialize application: %s', to_char( p_app_id ) );
    raise;
  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in number,
    p_escape      in boolean default false
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
  
    apex_debug.enter(
      'blog_util.get_post_title'
      ,'p_post_id'
      ,p_post_id
      ,'p_escape'
      ,apex_debug.tochar(p_escape)
    );
    
    if p_post_id is null then
      raise no_data_found;
    end if;
  
    -- fetch and return post title
    select v1.post_title
    into l_value
    from blog_v_posts v1
    where v1.post_id = p_post_id
    ;
    apex_debug.info( 'Fetch post: %s return: %s', p_post_id, l_value );
    -- Espace html and return string
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Not found. Post: %s', coalesce( to_char( p_post_id ), '(null)' ) );
    raise_application_error( -20001,  'Post not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching post: %s', to_char( p_post_id ) );
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
  
    apex_debug.enter(
      'blog_util.get_category_title'
      ,'p_category_id'
      ,p_category_id
      ,'p_escape'
      ,apex_debug.tochar(p_escape)
    );
    
    if p_category_id is null then
      raise no_data_found;
    end if;
    
    -- fetch and return category name
    select v1.category_title
    into l_value
    from blog_v_categories v1
    where v1.category_id = p_category_id
    ;
    apex_debug.info( 'Fetch category: %s return: %s', p_category_id, l_value );
    -- Espace html and return string
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Not found. Category: %s', coalesce( to_char( p_category_id ), '(null)' ) );
    raise_application_error( -20001,  'Category not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching category: %s', to_char( p_category_id ) );
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
  
    apex_debug.enter(
      'blog_util.get_tag'
      ,'p_tag_id'
      ,p_tag_id
    );
  
    if p_tag_id is null then
      raise no_data_found;
    end if;
    
    -- fetch and return tag name
    select t1.tag
    into l_value
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = p_tag_id
    ;
    apex_debug.info( 'Fetch tag: %s return: %s', p_tag_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    apex_debug.error( 'Not found. Tag: %s', coalesce( to_char( p_tag_id ), '(null)' ) );
    raise_application_error( -20001,  'Tag not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching tag: %s', to_char( p_tag_id ) );
    raise;
  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month  in number,
    p_date_format in varchar2
  ) return varchar2 result_cache
  as
    l_value varchar2(256);
  begin
  
    apex_debug.enter(
      'blog_util.get_year_month'
      ,'p_year_month'
      ,p_year_month
      ,'p_date_format'
      ,p_date_format
    );
  
    if p_year_month is null then
      raise no_data_found;
    end if;
  
    -- query that passed year month number actually exists
    select blog_util.get_year_month(
      p_archive_date => archive_date
      ,p_date_format => p_date_format
    )
    into l_value
    from blog_v_archive_lov
    where 1 = 1
    and year_month = p_year_month
    ;
    
    apex_debug.info( 'Fetch archive %s return: %s', p_year_month, l_value );
    return l_value;

  exception when no_data_found then
    apex_debug.error( 'Not found. Archive: %s', coalesce( to_char( p_year_month ), '(null)' ) );
    raise_application_error( -20001,  'Archive not found.' );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching archive: %s', to_char( p_year_month ) );
    raise;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_archive_date  in timestamp with local time zone,
    p_date_format   in varchar2,
    p_posts_count   in number default null
  ) return varchar2
  as
    l_value varchar2(256);
  begin
  
    apex_debug.enter(
      'blog_util.get_year_month'
      ,'p_archive_date'
      ,p_archive_date
      ,'p_date_format'
      ,p_date_format
      ,'p_posts_count'
      ,p_posts_count
    );
    
    -- format archive date and return string
    return case when p_archive_date is not null then
      to_char(
         p_archive_date
        ,p_date_format || case when p_posts_count is not null then ' "(' || p_posts_count || ')"' end
      )
    end;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
