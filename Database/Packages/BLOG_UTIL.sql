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
--    Jari Laine 15.04.2020 - function validate_comment
--    Jari Laine 26.04.2020 - Changed validate_comment us apex_util.savekey_vc2
--                            and removed custom functions that was doing same thing
--    Jari Laine 08.05.2020 - Functions get_year_month are obsolete
--                            application changed to group archives by year
--    Jari Laine 10.05.2020 - Procedure new_comment_notify to notify blogger about new comments
--                            Procedure subscribe to subscribe comment reply
--                            Procedure unsubscribe for unsubscribe comment reply
--    Jari Laine 11.05.2020 - Procedures and functions relating comments moved to package blog_comm
--    Jari Laine 17.05.2020 - Added out parameters p_older_title and p_newer_title to procedure get_post_pagination
--                            Materialized view blog_items_init changed to view
--
--  TO DO:
--    #1  Package contains hard coded values
--        e.g. public application tabs should be converted to dynamic list
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  g_owner               constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  g_number_format       constant varchar2(40)   := 'fm99999999999999999999999999999999999999';

  -- ORDS
  g_ords_module         constant varchar2(256)  := 'BLOG_PUBLIC_FILES';

  g_ords_public_files   constant varchar2(256)  := 'files/';

  g_ords_rss_feed       constant varchar2(256)  := 'feed/rss';
  g_ords_sitemap_index  constant varchar2(256)  := 'sitemap/index';
  g_ords_sitemap_main   constant varchar2(256)  := 'sitemap/main';
  g_ords_sitemap_posts  constant varchar2(256)  := 'sitemap/posts';

  -- URL
  g_home_page           constant varchar2(40)   := 'HOME';

  g_post_page           constant varchar2(40)   := 'POST';
  g_post_item           constant varchar2(40)   := 'P2_POST_ID';

  g_unsubscribe_item    constant varchar2(40)   := 'P2_SUBSCRIPTION_ID';

  g_search_page         constant varchar2(40)   := 'SEARCH';
  g_search_item         constant varchar2(40)   := 'P0_SEARCH';

  g_category_page       constant varchar2(40)   := 'CATEGORY';
  g_category_item       constant varchar2(40)   := 'P14_CATEGORY_ID';

  g_archive_page        constant varchar2(40)   := 'ARCHIVES';
  g_archive_item        constant varchar2(40)   := 'P15_ARCHIVE_ID';

  g_tag_page            constant varchar2(40)   := 'TAG';
  g_tag_item            constant varchar2(40)   := 'P6_TAG_ID';

  -- XML
  g_pub_app_tab_list    constant varchar2(256)  := 'Desktop Navigation Menu';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id         in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_newer_id        out nocopy varchar2,
    p_newer_title     out nocopy varchar2,
    p_older_id        out nocopy varchar2,
    p_older_title     out nocopy varchar2
  );
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id     in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/


CREATE OR REPLACE package body "BLOG_UTIL"
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

    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then

      if not p_error.is_common_runtime_error then
        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.
        l_result.message := apex_lang.message(l_genereric_error);
        l_result.additional_info := null;
      end if;

    else
      -- Always show the error as inline error
      l_result.display_location := case
        when l_result.display_location = apex_error.c_on_error_page
        then apex_error.c_inline_in_notification
        else l_result.display_location
        end
      ;

      -- If it's a constraint violation like
      --
      --   -) ORA-02292 ORA-02291 ORA-02290 ORA-02091 ORA-00001: unique constraint violated
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
          l_result.additional_info := null;
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

    exception when no_data_found
    then

      apex_debug.error(
         p_message => 'No data found. %s( %s => %s )'
        ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
        ,p1 => 'p_attribute_name'
        ,p2 => coalesce( p_attribute_name, '(null)' )
      );
      raise;

    when others
    then

      apex_debug.error(
         p_message => 'Unhandled error. %s( %s => %s )'
        ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
        ,p1 => 'p_attribute_name'
        ,p2 => coalesce( p_attribute_name, '(null)' )
      );
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
    from blog_v_init_items
    where 1 = 1
    and item_name = p_item_name
    ;
    apex_debug.info( 'Fetc item %s return: %s', p_item_name, l_value );
    return l_value;

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_attribute_name'
      ,p2 => coalesce( p_item_name, '(null)' )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_attribute_name'
      ,p2 => coalesce( p_item_name, '(null)' )
    );
    raise;

  end get_item_init_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in varchar2
  )
  as
    l_app_id number;
  begin

    apex_debug.enter(
      'blog_util.initialize_items'
      ,'p_app_id'
      ,p_app_id
    );

    if p_app_id is null then
      raise no_data_found;
    end if;

    l_app_id := to_number( p_app_id );
    -- loop materialized view and set items values
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_v_init_items i
      where i.application_id = l_app_id
    ) loop

      apex_debug.info( 'Initialize application id: %s item: %s value: %s', p_app_id, c1.item_name, c1.item_value );
      apex_util.set_session_state( c1.item_name, c1.item_value, false );

    end loop;

  exception when no_data_found then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_app_id'
      ,p2 => coalesce( p_app_id, '(null)' )
    );
    raise;

  when others then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_app_id'
      ,p2 => coalesce( p_app_id, '(null)' )
    );
    raise;

  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in varchar2,
    p_escape      in boolean
  ) return varchar2
  as
    l_value   varchar2(4000);
    l_post_id number;
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

    l_post_id := to_number( p_post_id );

    -- fetch and return post title
    select v1.post_title
    into l_value
    from blog_v_posts v1
    where v1.post_id = l_post_id
    ;
    apex_debug.info( 'Fetch post: %s return: %s', p_post_id, l_value );
    -- espace html and return string
    return case when p_escape
      then apex_escape.html(l_value)
      else l_value
      end
    ;

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_newer_id        out nocopy varchar2,
    p_newer_title     out nocopy varchar2,
    p_older_id        out nocopy varchar2,
    p_older_title     out nocopy varchar2
  )
  as
    l_post_id     number;
    l_newer_id    number;
    l_newer_title varchar2(512);
    l_older_id    number;
    l_older_title varchar2(512);
  begin

    apex_debug.enter(
      'blog_util.pagination'
      ,'p_post_id'
      ,p_post_id
    );

    if p_post_id is null then
      raise no_data_found;
    end if;

    l_post_id := to_number( p_post_id );

    select
       q1.newer_id
      ,q1.newer_title
      ,q1.older_id
      ,q1.older_title
    into l_newer_id, l_newer_title, l_older_id, l_older_title
    from (
      select
         v1.post_id
        ,lag( v1.post_id ) over(order by v1.published_on desc) as newer_id
        ,lag( v1.post_title ) over(order by v1.published_on desc) as newer_title
        ,lead( v1.post_id ) over(order by v1.published_on desc) as older_id
        ,lead( v1.post_title ) over(order by v1.published_on desc) as older_title
      from blog_v_posts v1
      where 1 = 1
    ) q1
    where 1 = 1
    and q1.post_id = l_post_id
    ;

    p_newer_id  := to_char( l_newer_id, g_number_format );
    p_newer_title := l_newer_title;
    p_older_id  := to_char( l_older_id, g_number_format );
    p_older_title := l_older_title;

    apex_debug.info( 'Fetch post: %s next_id: %s prev_id: %s', p_post_id, p_newer_id, p_older_id );

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_newer_id'
      ,p4 => p_newer_id
      ,p5 => 'p_older_id'
      ,p6 => p_older_id
    );
    raise;

  end get_post_pagination;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2,
    p_escape      in boolean
  ) return varchar2
  as
    l_category_id number;
    l_title       varchar2(4000);
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

    l_category_id := to_number( p_category_id );

    -- fetch and return category name
    select v1.category_title
    into l_title
    from blog_v_categories v1
    where v1.category_id = l_category_id
    ;
    apex_debug.info( 'Fetch category: %s return: %s', p_category_id, l_title );
    -- espace html and return string
    return case when p_escape
      then apex_escape.html(l_title)
      else l_title
      end
    ;

  exception when no_data_found then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_category_id'
      ,p2 => coalesce( p_category_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  when others then
    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_category_id'
      ,p2 => coalesce( p_category_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_tag_id  number;
    l_value   varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_tag'
      ,'p_tag_id'
      ,p_tag_id
    );

    if p_tag_id is null then
      raise no_data_found;
    end if;

    l_tag_id := to_number( p_tag_id );

    -- fetch and return tag name
    select t1.tag
    into l_value
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = l_tag_id
    ;
    apex_debug.info( 'Fetch tag: %s return: %s', p_tag_id, l_value );
    -- espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
