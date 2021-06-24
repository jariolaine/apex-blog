create or replace package "BLOG_UTIL"
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
--                            Removed function get_item_init_value
--    Jari Laine 18.05.2020 - Moved ORDS specific global constants
--    Jari Laine 19.05.2020 - Changed apex_debug to warn in no_data_found exception handlers
--                            Changed apex_error_handler honor error display position when
--                            ORA error is between -20999 and 20901
--                            Changed procedure get_post_pagination to raises ORA -20901 when no data found
--    Jari Laine 19.05.2020 - Removed global constants
--    Jari Laine 23.05.2020 - Modifications to remove ORDS depency
--    Jari Laine 05.11.2020 - Procedure render_dynamic_content
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
-- Called from:
--
  function int_to_vc2(
    p_value           in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--
  function get_post_title(
    p_post_id         in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_newer_id        out nocopy varchar2,
    p_newer_title     out nocopy varchar2,
    p_older_id        out nocopy varchar2,
    p_older_title     out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--
  function get_category_title(
    p_category_id     in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  function get_tag(
    p_tag_id          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--
  procedure check_archive_exists(
    p_archive_id      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1002 PL/SQL Dynamic Content Region "Content
  procedure render_dynamic_content(
    p_content_id      in varchar2,
    p_date_format     in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "download"
  procedure download_file (
    p_file_name   in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/


create or replace package body "BLOG_UTIL"
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
    l_err_mesg        varchar2(32700);

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

      -- Don't change display position for specific ORA eror codes
      if not p_error.ora_sqlcode between -20999 and -20901
      then
        -- Always show the error as inline error
        l_result.display_location := case
          when l_result.display_location = apex_error.c_on_error_page
          then apex_error.c_inline_in_notification
          else l_result.display_location
          end
       ;
      end if;

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

        l_err_mesg := apex_lang.message(l_constraint_name);

        -- not every constraint has to be in our lookup table
        if not l_err_mesg = l_constraint_name then
          l_result.message := l_err_mesg;
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
        l_result.additional_info := null;
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
  function int_to_vc2(
    p_value in number
  ) return varchar2
  as
  begin
    return to_char( p_value,  'fm99999999999999999999999999999999999999' );
  end int_to_vc2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name in varchar2
  ) return varchar2
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

    apex_debug.warn(
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
    -- Set items session state
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

    apex_debug.warn(
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

    apex_debug.warn(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
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

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
    raise;

  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_newer_id        out nocopy varchar2,
    p_newer_title     out nocopy varchar2,
    p_older_id        out nocopy varchar2,
    p_older_title     out nocopy varchar2
  )
  as
    l_post_id     number;
    l_post_title  varchar2(512);
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

    with q1 as(
      select --+ inline
        v1.post_id
        ,v1.post_title
        ,(
          select --+ first_rows(1)
            lkp1.post_id
          from blog_v_posts lkp1
          where 1 = 1
          and lkp1.published_on > v1.published_on
          order by lkp1.published_on asc
          fetch first 1 rows only
        ) as newer_id
        ,(
          select --+ first_rows(1)
            lkp2.post_id
          from blog_v_posts lkp2
          where 1 = 1
          and lkp2.published_on < v1.published_on
          order by lkp2.published_on desc
          fetch first 1 rows only
        ) as older_id
      from blog_v_posts v1
      where 1 = 1
      and v1.post_id = l_post_id
    )
    select q1.post_title
      ,q1.newer_id
      ,(
        select lkp3.title
        from blog_posts lkp3
        where 1 = 1
        and lkp3.id = q1.newer_id
      ) as newer_title
      ,q1.older_id
      ,(
        select lkp4.title
        from blog_posts lkp4
        where 1 = 1
        and lkp4.id = q1.older_id
      ) as older_title
    into l_post_title, l_newer_id, l_newer_title, l_older_id, l_older_title
    from q1
    where 1 = 1
    ;

    p_post_title  := l_post_title;
    p_newer_id    := int_to_vc2( l_newer_id );
    p_newer_title := l_newer_title;
    p_older_id    := int_to_vc2( l_older_id );
    p_older_title := l_older_title;

    apex_debug.info( 'Fetch post: %s next_id: %s prev_id: %s', p_post_id, p_newer_id, p_older_id );

  exception when no_data_found
  then

    apex_debug.warn(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
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

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
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

    apex_debug.warn(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_category_id'
      ,p2 => coalesce( p_category_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
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

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
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

    apex_debug.warn(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure check_archive_exists(
    p_archive_id  in varchar2
  )
  as
    l_archive_id  number;
    l_value       number;
  begin

    apex_debug.enter(
      'blog_util.check_archive_exists'
      ,'p_archive_id'
      ,p_archive_id
    );

    if p_archive_id is null then
      raise no_data_found;
    end if;

    l_archive_id := to_number( p_archive_id );

    -- fetch and return tag name
    select t1.archive_year
    into l_value
    from blog_v_archive_year t1
    where 1 = 1
    and t1.archive_year = l_archive_id
    ;
    apex_debug.info( 'Fetch archive: %s return: %s', p_archive_id, l_value );

  exception when no_data_found
  then

    apex_debug.warn(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_archive_id'
      ,p2 => coalesce( p_archive_id, '(null)' )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_archive_id'
      ,p2 => coalesce( p_archive_id, '(null)' )
    );

    -- show http error
    owa_util.status_line( 404 );
    apex_application.stop_apex_engine;
    raise;

  end check_archive_exists;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_dynamic_content(
    p_content_id  in varchar2,
    p_date_format in varchar2
  )
  as
  begin

    for c1 in(
      select v1.content_desc
        ,v1.content_html
        ,v1.changed_on
      from blog_v_dynamic_content v1
      where 1 = 1
      and v1.content_id = p_content_id
    ) loop

      sys.htp.p( c1.content_html );

      sys.htp.p(
          apex_lang.message(
             'BLOG_INFO_LAST_UPDATED'
            ,to_char( c1.changed_on, p_date_format )
          )
        );

    end loop;

  end render_dynamic_content;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file (
    p_file_name   in varchar2
  )
  as
    l_file_t blog_v_files%rowtype;
  begin

    select *
    into l_file_t
    from blog_v_files t1
    where 1 = 1
    and t1.is_download = 0
    and t1.file_name = p_file_name
    ;

    sys.owa_util.mime_header( coalesce ( l_file_t.mime_type, 'application/octet' ), false );
    sys.htp.p( 'Cache-Control: public, max-age=3600' );
    sys.owa_util.http_header_close;

    sys.wpg_docload.download_file ( l_file_t.blob_content );

  exception when no_data_found
  then
    owa_util.status_line( 404 );
  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
