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
--    Jari Laine 18.12.2021 - Procedure redirect_search
--    Jari Laine 24.03.2022 - Parameter names to apex_debug procedure calls
--                          - Changes to procedure get_post_pagination and render_dynamic_content
--    Jari Laine 25.03.2022 - Added more comments
--                          - Changed variable names to more descriptive
--                          - Removed obsolete procedure check_archive_exists
--    Jari Laine 19.04.2022 - Changes to procedures download_file
--    Jari Laine 26.04.2022 - Parameter p_escape to function get_tag
--    Jari Laine 03.08.2022 - Changed procedure render_dynamic_content to use apex_util.prn
--    Jari Laine 16.11.2022 - Removed obsolete function get_post_title
--    Jari Laine 21.11.2022 - Added DETERMINISTIC caluse to function int_to_vc2
--    Jari Laine 23.11.2022 - Changed procedures exception handling and removed some unnecessary calls to apex_debug
--                          - Renamed procedure get_post_pagination to get_post_details and added more out parameters
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application definition Error Handling Function
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
-- Called from:
--  inside package and from other packages
  function int_to_vc2(
    p_value           in number
  ) return varchar2 deterministic;
--------------------------------------------------------------------------------
-- Called from:
--  other packages, public and admin application
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application process Initialize Items
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure get_post_details(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_post_desc       out nocopy varchar2,
    p_post_category   out nocopy varchar2,
    p_post_author     out nocopy varchar2,
    p_post_published  out nocopy varchar2,
    p_post_modified   out nocopy varchar2,
    p_next_id         out nocopy varchar2,
    p_next_title      out nocopy varchar2,
    p_prev_id         out nocopy varchar2,
    p_prev_title       out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 14 Pre-Rendering Computations
  function get_category_title(
    p_category_id     in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 6 Pre-Rendering Computations
  function get_tag(
    p_tag_id          in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1002 PL/SQL Dynamic Content Region "Content"
  procedure render_dynamic_content(
    p_content_id      in varchar2,
    p_date_format     in varchar2,
    p_content_title   out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  inside package and package BLOG_XML
  procedure download_file (
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "download"
  procedure download_file (
    p_file_name       in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app application process Redirect to search page
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null
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
  procedure raise_http_error(
    p_error_code  in number
  )
  as
  begin
    -- output HTTP status
    owa_util.status_line( p_error_code );
    -- stop APEX
    apex_application.stop_apex_engine;
  end raise_http_error;
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
        l_result.message := apex_lang.message(
          p_name => l_genereric_error
        );
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

        l_err_mesg := apex_lang.message(
          p_name => l_constraint_name
        );

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
    -- convert number to string without decimals
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
      p_routine_name  => 'blog_util.get_attribute_value'
      ,p_name01       => 'p_attribute_name'
      ,p_value01      => p_attribute_name
    );

    -- raise no data found error if parameter p_attribute_name is null
    if p_attribute_name is null then
      raise no_data_found;
    end if;

    -- fetch and return value from settings table
    select attribute_value
    into l_value
    from blog_settings
    where attribute_name = p_attribute_name
    ;

    apex_debug.info(
      p_message => 'Fetch attribute %s return: %s'
      ,p0 => p_attribute_name
      ,p1 => l_value
    );

    -- return attribute value
    return l_value;

  -- Handle error cases
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_attribute_name'
      ,p3 => coalesce( p_attribute_name, '(null)' )
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

    -- raise no data found error if parameter p_app_id_name is null
    if p_app_id is null then
      raise no_data_found;
    end if;

    -- conver application id string to number
    l_app_id := to_number( p_app_id );

    -- set items session state
    -- fetch items and values that session state need to be set
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_v_init_items i
      where i.application_id = l_app_id
    ) loop

      -- set item session state and no commit
      apex_util.set_session_state(
        p_name    => c1.item_name
        ,p_value  => c1.item_value
        ,p_commit => false
      );

    end loop;

  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s. %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_app_id'
      ,p3 => coalesce( p_app_id, '(null)' )
    );

    raise;

  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_post_details(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_post_desc       out nocopy varchar2,
    p_post_category   out nocopy varchar2,
    p_post_author     out nocopy varchar2,
    p_post_published  out nocopy varchar2,
    p_post_modified   out nocopy varchar2,
    p_next_id         out nocopy varchar2,
    p_next_title      out nocopy varchar2,
    p_prev_id         out nocopy varchar2,
    p_prev_title      out nocopy varchar2
  )
  as
    l_post_id     number;
    l_next       blog_t_post;
    l_prev       blog_t_post;
    l_published   timestamp with local time zone;
    l_modified    timestamp with local time zone;
  begin

    -- raise no data found error if parameter p_post_id is null
    if p_post_id is null then
      raise no_data_found;
    end if;

    -- conver post id string to number
    l_post_id := to_number( p_post_id );

    -- fetch post title and description by post id
    -- also fetch prev and next post id and title
    select
      v1.post_title
      ,v1.post_desc
      ,v1.category_title
      ,v1.blogger_name
      ,v1.published_on
      ,v1.changed_on
      ,(
        select blog_t_post( lkp1.post_id, lkp1.post_title )
        from blog_v_posts lkp1
        where 1 = 1
          and lkp1.published_on > v1.published_on
        order by lkp1.published_on asc
        fetch first 1 rows only
      ) as next_post
      ,(
        select blog_t_post( lkp2.post_id, lkp2.post_title )
        from blog_v_posts lkp2
        where 1 = 1
          and lkp2.published_on < v1.published_on
        order by lkp2.published_on desc
        fetch first 1 rows only
      ) as prev_post
    into p_post_title
      ,p_post_desc
      ,p_post_category
      ,p_post_author
      ,l_published
      ,l_modified
      ,l_next
      ,l_prev
    from blog_v_posts v1
    where 1 = 1
      and post_id = l_post_id
    ;

    -- set procedure out parameters
    p_next_id     := int_to_vc2( l_next.post_id );
    p_next_title  := l_next.post_title;
    p_prev_id     := int_to_vc2( l_prev.post_id );
    p_prev_title  := l_prev.post_title;
    -- Get post published and modified UTC time
    p_post_published := to_char(
       sys_extract_utc( l_published )
      ,'YYYY-MM-DD"T"HH24:MI:SS.FF3"+00:00"'
    );
    p_post_modified := to_char(
       sys_extract_utc( l_modified )
      ,'YYYY-MM-DD"T"HH24:MI:SS.FF3"+00:00"'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_post_id'
      ,p3 => coalesce( p_post_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_post_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2,
    p_escape      in boolean
  ) return varchar2
  as
    l_category_id   number;
    l_category_name varchar2(4000);
  begin

    -- raise no data found error if parameter p_category_id is null
    if p_category_id is null then
      raise no_data_found;
    end if;

    -- conver category id string to number
    l_category_id := to_number( p_category_id );

    -- fetch category name
    select v1.category_title
    into l_category_name
    from blog_v_categories v1
    where v1.category_id = l_category_id
    ;

    -- espace html from category name if parameter p_escape is true
    -- return category name
    return case when p_escape
      then apex_escape.html( l_category_name )
      else l_category_name
      end
    ;

  -- handle errors
  exception
  when others then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s, %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_category_id'
      ,p3 => coalesce( p_category_id, '(null)' )
      ,p4 => 'p_escape'
      ,p5 => apex_debug.tochar( p_escape )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in varchar2,
    p_escape in boolean
  ) return varchar2
  as
    l_tag_id    number;
    l_tag_name  varchar2(4000);
  begin

    -- raise no data found error if parameter p_tag_id is null
    if p_tag_id is null then
      raise no_data_found;
    end if;

    -- conver tag id string to number
    l_tag_id := to_number( p_tag_id );

    -- fetch tag name
    select t1.tag
    into l_tag_name
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = l_tag_id
    ;

    -- espace html from tag name if parameter p_escape is true
    -- return category name
    return case when p_escape
      then apex_escape.html( l_tag_name )
      else l_tag_name
      end
    ;

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_tag_id'
      ,p3 => coalesce( p_tag_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_dynamic_content(
    p_content_id    in varchar2,
    p_date_format   in varchar2,
    p_content_title out nocopy varchar2
  )
  as
  begin

    -- fetch content
    for c1 in(
      select v1.content_desc
        ,v1.content_html
        ,v1.changed_on
        ,v1.show_changed_on
      from blog_v_dynamic_content v1
      where 1 = 1
      and v1.content_id = p_content_id
    ) loop

      -- set content description to procedure out parameter
      p_content_title := c1.content_desc;

      -- output content HTML
      apex_util.prn( c1.content_html, false );

      -- output when content is changed if show_changed_on column value is 1
      if c1.show_changed_on = 1
      then
        sys.htp.p(
            apex_string.format(
              p_message => '<p>%s</p>'
              ,p0 =>
                apex_lang.message(
                  p_name => 'BLOG_MSG_LAST_UPDATED'
                  ,p0 => to_char( c1.changed_on, p_date_format )
                )
            )
          );
      end if;

    end loop;

  end render_dynamic_content;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file (
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  )
  as
  begin

    -- init HTTP buffer
    sys.htp.init;

    -- open HTTP header
    sys.owa_util.mime_header(
      ccontent_type   => coalesce ( p_mime_type, 'application/octet' )
      ,bclose_header  => false
      ,ccharset       => p_charset
    );

    apex_debug.info(
      p_message => 'Set response headers'
    );

    -- set response headers
    for i in 1 .. p_header_names.count
    loop

      apex_debug.info(
         p_message => 'Header name: %s , header value: %s'
        ,p0 => p_header_names(i)
        ,p1 => p_header_values(i)
      );
      -- output HTTP header
      sys.htp.p(
        apex_string.format(
           p_message => '%s: %s'
          ,p0 => p_header_names(i)
          ,p1 => p_header_values(i)
        )
      );

    end loop;

    -- close HTTP header
    sys.owa_util.http_header_close;

    -- output file
    sys.wpg_docload.download_file ( p_blob_content );

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file (
    p_file_name in varchar2
  )
  as
    l_file_t        blog_v_files%rowtype;
    l_header_names  apex_t_varchar2;
    l_header_values apex_t_varchar2;
  begin

    -- fetch file
    select *
    into l_file_t
    from blog_v_files t1
    where 1 = 1
    --and t1.is_download = 0
    and t1.file_name = p_file_name
    ;

    apex_debug.info(
      p_message => 'File name: %s, file size: %s, mime type: %s'
      ,p0 => l_file_t.file_name
      ,p1 => l_file_t.file_size
      ,p2 => l_file_t.mime_type
      ,p3 => l_file_t.file_charset
    );

    -- Add Last-Modified header
    apex_string.push(
        p_table => l_header_names
       ,p_value => 'Last-Modified'
    );
    apex_string.push(
       p_table => l_header_values
      ,p_value =>
        to_char(
          sys_extract_utc( l_file_t.changed_on )
          ,'Dy, DD Mon YYYY HH24:MI:SS "GMT"'
          ,'NLS_DATE_LANGUAGE=ENGLISH'
        )
    );

    -- Compare request If-Modified-Since header to Last-Modified
    -- If values are equal then set status header and exit from procedure
    if sys.owa_util.get_cgi_env('HTTP_IF_MODIFIED_SINCE') = l_header_values(1)
    then
      sys.owa_util.status_line( 304 );
      apex_debug.info(
         p_message => 'File not sent. If-Modified-Since: %s'
        ,p0 => l_header_values(1)
      );
      return;
    end if;

    -- Add Cache-Control header
    apex_string.push(
        p_table => l_header_names
       ,p_value => 'Cache-Control'
    );
    apex_string.push(
       p_table => l_header_values
      ,p_value =>
        apex_string.format(
           p_message => 'max-age=%s'
          ,p0 =>
            case l_file_t.is_download
              when 1
              then get_attribute_value( 'G_MAX_AGE_DOWNLOAD' )
              else get_attribute_value( 'G_MAX_AGE_FILE' )
            end
        )
    );

    -- add Content-Disposition header
    apex_string.push(
      p_table => l_header_names
     ,p_value => 'Content-Disposition'
    );
    apex_string.push(
      p_table => l_header_values
     ,p_value =>
        apex_string.format(
           p_message => '%s; filename="%s"'
          ,p0 =>
            case l_file_t.is_download
              when 1
              then 'attachment'
              else 'inline'
            end
          ,p1 => l_file_t.file_name
        )
    );

    -- download file
    download_file(
      p_blob_content    => l_file_t.blob_content
      ,p_mime_type      => l_file_t.mime_type
      ,p_header_names   => l_header_names
      ,p_header_values  => l_header_values
    );

  -- handle errors
  exception
  when no_data_found
  then

    raise_http_error( 404 );
    raise;

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value         in varchar2,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null
  )
  as
  begin
    -- Get search page URL and redirect
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
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
