create or replace package "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures and functions for the Admin application,
--    including operations content handling, and utility functions.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  26.04.2019   Jari Laine     Created package.
--  10.01.2020   Jari Laine     Added procedures:
--                                - merge_files
--                                - file_upload
--  12.01.2020   Jari Laine     Added function prepare_file_path.
--  09.04.2020   Jari Laine     Updated procedures for case-insensitive tag handling.
--  09.05.2020   Jari Laine     Changed input parameters from NUMBER to VARCHAR2.
--                              Added functions:
--                                - get_comment_post_id
--                                - is_email
--  10.05.2020   Jari Laine     Added procedure send_reply_notify to notify replies.
--  12.05.2020   Jari Laine     Removed function prepare_file_path.
--  17.05.2020   Jari Laine     Removed parameter `p_err_mesg` from function get_first_paragraph.
--  19.05.2020   Jari Laine     Removed obsolete function get_post_title.
--  24.05.2020   Jari Laine     Added procedures:
--                                - run_settings_post_expression
--                                - run_feature_post_expression
--                                - update_feature
--  22.06.2020   Jari Laine     Fixed bug in function is_integer.
--                              Added parameters `p_min` and `p_max` to function is_integer.
--  30.09.2020   Jari Laine     Added procedure google_post_authentication.
--  28.11.2020   Jari Laine     Renamed google_post_authentication to post_authentication.
--                              Removed obsolete function get_comment_post_id.
--  28.02.2021   Jari Laine     Added function get_footer_link_seq.
--  23.05.2021   Jari Laine     Updated package to remove ORDS dependency.
--  21.03.2021   Jari Laine     Updated procedure get_blogger_details:
--                                - Fetch authorization group name from BLOG_SETTINGS table.
--                              Enhanced function remove_whitespace by adding TRIM.
--                              Updated add_category and add_tag to use remove_whitespace.
--  11.04.2021   Jari Laine     Moved send_reply_notify to package BLOG_COMM.
--  13.04.2021   Jari Laine     Renamed function get_footer_link_seq to get_modal_page_seq.
--                              Removed procedure run_feature_post_expression.
--                              Updated procedure post_authentication.
--  18.04.2021   Jari Laine     Moved function is_email to package BLOG_COMM.
--  05.01.2022   Jari Laine     Removed unused parameters/variables from:
--                                - post_authentication
--                                - update_feature
--                                - get_blogger_details
--                                - add_blogger
--  27.03.2022   Jari Laine     Fixed bug in get_first_paragraph for nested elements.
--                              Removed obsolete procedures:
--                                - remove_unused_tags
--                                - purge_post_preview
--                                - purge_post_preview_job
--                                - save_post_preview
--  13.04.2022   Jari Laine     Fixed error message handling in functions:
--                                - is_integer
--                                - is_url
--                                - is_date_format
--  01.05.2022   Jari Laine     Simplified logic in function request_to_post_status.
--  07.05.2022   Jari Laine     Added procedures:
--                                - remove_unused_tags
--                                - remove_unused_categories
--                              Changed add_tag from private to public.
--                              Removed obsolete functions:
--                                - get_post_tags
--                                - get_category_title
--                              Added procedures:
--                                - resequence_link_groups
--                                - resequence_links
--                                - resequence_categories
--                                - resequence_tags
--  09.05.2022   Jari Laine     Removed obsolete procedure run_settings_post_expression.
--  08.03.2023   Jari Laine     Updated function is_date_format to validate as DATE instead of TIMESTAMP.
--  03.04.2023   Jari Laine     Converted function file_upload to procedure with OUT parameter.
--  28.05.2023   Jari Laine     Added function request_to_post_success_message.
--  01.06.2023   Jari Laine     Removed procedure file_upload.
--                              Added function file_exists.
--                              Updated procedure merge_files.
--  30.07.2023   Jari Laine     Updated procedure post_authentication:
--                                - Check if workspace user is locked.
--                                - Replaced apex_util.set_build_option_status with
--                                  apex_application_admin.set_build_option_status.
--  10.03.2024   Jari Laine     Bug fix in post_authentication to check only the current workspace.
--  08.04.2024   Jari Laine     Removed functions:
--                                - request_to_post_success_message
--                                - request_to_link_success_message
--  11.04.2024   Jari Laine     Added procedure resequence_dynamic_content.
--  21.07.2024   Jari Laine     Added procedures:
--                                - update_feature (accepts build option name as parameter)
--                                - set_attribute_value
--                              Moved file repository-related procedures/functions to BLOG_FILE package.
--                              Removed procedure update_text_messages.
--  25.08.2024   Jari Laine     Moved function remove_whitespace to package BLOG_UTIL.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  admin app application authentication scheme Google
  procedure post_authentication;
--------------------------------------------------------------------------------
-- Called from:
--  admin app application processes
  procedure get_blogger_details(
    p_app_id            in varchar2,
    p_username          in varchar2,
    p_user_id           out nocopy number,
    p_name              out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  function get_category_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 52
  function get_link_grp_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 81
  function get_modal_page_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 51
  function get_link_seq(
    p_link_group_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function request_to_post_status(
    p_request           in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_first_paragraph(
    p_body_html         in clob
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12 Processing process "Process Category"
  procedure add_category(
    p_category_title    in varchar2,
    p_category_id       out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure remove_unused_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure resequence_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 16 and inside this package
  procedure add_tag(
    p_tag               in varchar2,
    p_tag_id            out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  procedure add_post_tags(
    p_post_id           in varchar2,
    p_tags              in varchar2,
    p_sep               in varchar2 default ','
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 15
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 16
  procedure resequence_tags(
    p_post_id           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is Integer"
  function is_integer(
    p_value             in varchar2,
    p_min               in number,
    p_max               in number,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is URL"
  function is_url(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is date format"
  function is_date_format(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20011 Processing process "Features - Save Interactive Grid Data"
  procedure update_feature(
    p_app_id            in number,
    p_build_option_id   in number,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20013
  procedure update_feature(
    p_build_option_name in varchar2,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_link_groups;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_links(
    p_link_group_id     in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 80
  procedure resequence_dynamic_content;
--------------------------------------------------------------------------------
-- Called from:
--
  procedure set_attribute_value(
    p_attribute_list    in apex_t_varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_CM";
/


create or replace package body "BLOG_CM"
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
  function next_seq(
    p_max in number
  ) return number
  as
  begin
    return ceil( coalesce( p_max + 1, 1 ) / 10 ) * 10;
  end next_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag_to_post(
    p_post_id     in number,
    p_tag_id      in number,
    p_display_seq in number
  )
  as
  begin

    -- merge tag
    merge into blog_post_tags t1
    using dual on (
      t1.post_id  = p_post_id
      and t1.tag_id  = p_tag_id
    )
    when matched then
    -- update display sequence if it changed
      update
        set t1.display_seq = p_display_seq
      where t1.display_seq != p_display_seq
    -- insert post id, tag id and display sequency to table
    when not matched then
      insert
        ( is_active, post_id, tag_id, display_seq )
      values
        ( 1, p_post_id, p_tag_id, p_display_seq )
    ;

  end add_tag_to_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure cleanup_post_tags(
    p_post_id in number,
    p_tag_tab in apex_t_number
  )
  as
  begin

    -- delete relationship from tags that aren't belong to post anymore
    delete
    from blog_post_tags t1
    where 1 = 1
    and post_id = p_post_id
    and not exists(
      select 1
      from table( p_tag_tab ) x1
      where 1 = 1
      and x1.column_value = t1.tag_id
    );

  end cleanup_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_blogger(
    p_app_id    in varchar2,
    p_username  in varchar2,
    p_user_id   out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max     blog_bloggers.display_seq%type;
    l_email   blog_bloggers.email%type;
    l_app_id  apex_applications.application_id%type;
    l_authz   apex_applications.authorization_scheme%type;
  begin

    -- convert application id string to number
    l_app_id := to_number( p_app_id );

    -- fetch application authorization scheme name.
    select authorization_scheme
    into l_authz
    from apex_applications
    where 1 = 1
    and application_id = l_app_id
    ;

    apex_debug.info( 'Check is user in group: %s.', l_authz );

    -- verify user is authorized
    if apex_authorization.is_authorized( l_authz )
    then

      -- if user is authorized add user to blog_bloggers table
      apex_debug.info( 'User %s is authorized and added to bloggers.', p_username );

      -- fetch next display_seq
      select
        max( t1.display_seq ) as display_seq
      into l_max
      from blog_bloggers t1
      ;

      l_max := next_seq( l_max );

      -- get APEX user email
      l_email := apex_util.get_email( p_username => p_username );

      -- get APEX user first and last name for blogger name
      p_name := apex_string.format(
        p_message  => '%s %s'
      , p0 => apex_util.get_first_name( p_username => p_username )
      , p1 => apex_util.get_last_name( p_username => p_username )
      );

      -- add new blogger
      insert into blog_bloggers
        ( is_active, publish_desc, display_seq, apex_username, blogger_name, email )
      values
        ( 1, 0, l_max, p_username, p_name, l_email )
      returning id into p_user_id
      ;

    else
      apex_debug.info( 'User %s is not authorized.', p_username );
    end if;

  end add_blogger;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_attribute_value(
    p_attribute_name  in varchar2,
    p_attribute_value in varchar2
  )
  as
  begin

    apex_debug.info( 'Set parameter %s: %s', p_attribute_name, p_attribute_value );

    update blog_settings
      set attribute_value = p_attribute_value
    where 1 = 1
      and attribute_name = p_attribute_name
      and (
        attribute_value != p_attribute_value
        or( attribute_value is null and p_attribute_value is not null )
        or( attribute_value is not null and p_attribute_value is null )
      )
    ;

  end set_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure post_authentication
  as
    l_group_names apex_t_varchar2;
    l_user_name   apex_workspace_apex_users.user_name%type;
  begin

    l_user_name := sys_context( 'APEX$SESSION', 'APP_USER' );

    -- collect user groups to PL/SQL table
    for c1 in(
      select distinct
        g.group_name
      from apex_workspace_groups g
      left join apex_workspace_group_groups gg on g.group_name = gg.grantee_name
      left join apex_workspace_group_users gu on g.group_name = gu.group_name
        and gu.user_name = l_user_name
      left join apex_workspace_apex_users u on gu.user_name = u.user_name
        and u.account_locked  = 'No'
        and u.user_name = l_user_name
        start with u.user_name = l_user_name
      connect by nocycle prior gg.group_name = g.group_name
    ) loop
      apex_string.push( l_group_names, c1.group_name );
    end loop;

    -- Enable user groups
    apex_authorization.enable_dynamic_groups (
      p_group_names => l_group_names
    );

  exception
  when others
  then
    apex_debug.error( 'Unhandled post authentication procedure error: %s: ', sqlerrm );
    raise;
  end post_authentication;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_app_id      in varchar2,
    p_username    in varchar2,
    p_user_id     out nocopy number,
    p_name        out nocopy varchar2
  )
  as
  begin

    apex_debug.info( 'Fetch user id and name for username: %s', p_username );

    -- fetch user id and name
    select id
      ,blogger_name
    into p_user_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;

  -- if user not found, try add user
  exception
  when no_data_found
  then

    apex_debug.info( 'User %s not found from bloggers.', p_username );

    add_blogger(
      p_app_id    => p_app_id
    , p_username  => p_username
    , p_user_id   => p_user_id
    , p_name      => p_name
    );

  end get_blogger_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return varchar2
  as
    l_max_seq   blog_v_all_categories.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max category display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_categories v1
    ;
    -- get next category display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next category display sequence
    return l_next_seq;

  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return varchar2
  as
    l_max_seq   blog_v_all_link_groups.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_link_groups v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_link_grp_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_modal_page_seq
  return varchar2
  as
    l_max_seq   blog_v_all_dynamic_content.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_dynamic_content v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_modal_page_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id in varchar2
  ) return varchar2
  as
    l_link_group_id number;
    l_max_seq       blog_v_all_links.display_seq%type;
    l_next_seq      varchar2(256);
  begin

    -- conver link group id string to number
    l_link_group_id := to_number( p_link_group_id );

    -- fetch max link display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_links v1
    where 1 = 1
    and link_group_id = l_link_group_id
    ;
    -- get next link display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link display sequence
    return l_next_seq;

  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request in varchar2
  ) return varchar2
  as
  begin

    -- conver APEX request to post status (blog_posts.is_active)
    return case p_request
      when 'CREATE'
      then '1'
      when 'SAVE'
      then '1'
      when 'SAVE_AND_PUBLISH'
      then '1'
      else '0'
    end;

  end request_to_post_status;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html in clob
  ) return varchar2
  as
    l_first_p       clob;
    l_first_p_start number;
    l_first_p_end   number;
    l_length        number;
    l_next_p        number;
    l_cnt           number;
  begin

    l_cnt := 1;
    l_next_p := 1;

    -- get first opening and closing tag positions
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>', l_first_p_start ) + 4;

    -- check if there nested tags
    while l_next_p > 0
    loop
      l_cnt := l_cnt + 1;

      -- get string length between opening and closing tag
      l_length  := l_first_p_end - l_first_p_start;
      -- select contect between opening and closing tag
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- check if there is more opening tags inside selection
      l_next_p := instr( l_first_p, '<p', 1, l_cnt );

      if l_next_p > 0
      then
        -- if another opening tag found, find next closing tag
        l_first_p_end := instr( p_body_html, '</p>', 1, l_cnt ) + 4;
      end if;

      l_first_p := null;

    end loop;


    -- post must have at least one paragraph
    if l_first_p_start > 0 and l_first_p_end > 0 then

      l_length := l_first_p_end - l_first_p_start;

      -- get first paragraph
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- remove whitespace
      l_first_p := blog_util.remove_whitespace( l_first_p );

    end if;

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_category_title  in varchar2,
    p_category_id out nocopy number
  )
  as
    l_next_seq      number;
    l_title         varchar2(512);
    l_title_unique  varchar2(512);
  begin

    -- remove whitespace from category title
    l_title := blog_util.remove_whitespace( p_category_title );
    l_title_unique := upper( l_title );

    -- check if category already exists and fetch id
    begin
      select v1.id
      into p_category_id
      from blog_v_all_categories v1
      where 1 = 1
      and v1.title_unique = l_title_unique
      ;
    -- if category not exists insert and return id
    exception
    when no_data_found
    then
      -- get next sequence value
      l_next_seq := get_category_seq;
      -- insert category and return id for out parameter.
      insert into blog_categories
        ( is_active, display_seq, title )
      values
        ( 1, l_next_seq, l_title )
      returning id into p_category_id
      ;
    end;
  -- fetch category id if it was inserted in other session but not commited
  exception
  when dup_val_on_index
  then
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
      and v1.title_unique = l_title_unique
    ;
  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_categories
  as
  begin
    -- cleanup categories that aren't linked to any post
    delete from blog_categories t1
    where 1 = 1
    and not exists(
      select 1
      from blog_posts x1
      where 1 = 1
      and x1.category_id = t1.id
    );

  end remove_unused_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_categories
  as
  begin

    -- update categories display_seq if it different than new
    merge into blog_categories t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_categories
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag(
    p_tag     in varchar2,
    p_tag_id  out nocopy number
  )
  as
    l_value varchar2(256);
  begin

    p_tag_id  := null;
    l_value   := blog_util.remove_whitespace( p_tag );

    -- if tag is not null then fetch id
    if l_value is not null then

      begin
        select id
        into p_tag_id
        from blog_v_all_tags
        where 1 = 1
        and tag_unique = upper( l_value )
        ;
      -- if tag not exists insert and return id
      exception when no_data_found then
        insert into blog_tags
          ( is_active, tag )
        values
          ( 1, l_value )
        returning id into p_tag_id
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id in varchar2,
    p_tags    in varchar2,
    p_sep     in varchar2 default ','
  )
  as
    l_post_id     number;
    l_tag_id      number;
    l_display_seq number;
    l_tag_tab     apex_t_varchar2;
    l_tag_id_tab  apex_t_number;
  begin

    l_post_id := to_number( p_post_id );

    -- split tags string to table and loop all values
    l_tag_tab := apex_string.split(
       p_str => p_tags
      ,p_sep => p_sep
    );

    for i in 1 .. l_tag_tab.count
    loop

      -- add tag to repository and return id
      add_tag(
         p_tag    => l_tag_tab(i)
        ,p_tag_id => l_tag_id
      );

      -- if the tag has been added or is already in the repository
      -- create relationships to post
      if l_tag_id is not null
      then

        -- collect tag id to table.
        -- table is used at end of procedure
        -- for checking relationships that should be removed
        apex_string.push( l_tag_id_tab, l_tag_id );

        -- get table record count for tag display sequence
        l_display_seq:= l_tag_id_tab.count * 10;

        -- add tag relationships to post
        add_tag_to_post(
           p_post_id     => l_post_id
          ,p_tag_id      => l_tag_id
          ,p_display_seq => l_display_seq
        );

      end if;

    end loop;

    -- delete removed tags relationships
    cleanup_post_tags(
       p_post_id => l_post_id
      ,p_tag_tab => l_tag_id_tab
    );

  end add_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_tags
  as
  begin
    -- cleanup tags that aren't linked to any post
    delete from blog_tags t1
    where 1 = 1
    and not exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_tags(
    p_post_id in varchar2
  )
  as
    l_post_id number;
  begin

    l_post_id := to_number( p_post_id );

    -- update post tags display_seq if it different than new
    merge into blog_post_tags t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_post_tags
      where 1 = 1
      and post_id = l_post_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_integer(
    p_value     in varchar2,
    p_min       in number,
    p_max       in number,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_value     number;
    l_err_mesg  varchar2(32700);
  begin

    if p_value is not null
    then

      -- prepare validation error message for exception handler
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
        ,p0 => p_min
        ,p1 => p_max
      );

      l_value := to_number( p_value );

      -- check value is integer and between range
      if round( l_value ) = l_value
      and l_value between p_min and p_max
      then
        -- if validation passes, clear error meassage
        l_err_mesg := null;
      end if;

    end if;

    return l_err_mesg;

  exception
  when invalid_number
  or value_error
  then
    -- return error message
    return l_err_mesg;
  end is_integer;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_url(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin

    if not regexp_like(p_value, '^https?\:\/\/.*$')
    then
      -- if validation fails prepare error message
      l_err_mesg := p_err_mesg;

    end if;

    return l_err_mesg;

  end is_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_date_format(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg          varchar2(32700);
    invalid_date_format exception;
    pragma              exception_init(invalid_date_format, -1821);
  begin

    -- prepare validation error message
    l_err_mesg := p_err_mesg;

    -- try convert timestamp to string
    if to_char( sysdate, p_value ) is not null
    then
      -- if validation passes, clear error meassage
      l_err_mesg := null;
    end if;

    return l_err_mesg;

  exception
  when invalid_date_format
  then
    -- return error message
    return l_err_mesg;
  end is_date_format;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_app_id          in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  )
  as
  begin

    -- update build option value
    apex_application_admin.set_build_option_status(
       p_application_id => p_app_id
      ,p_id => p_build_option_id
      ,p_build_status => upper( p_build_status )
    );

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_build_option_name in varchar2,
    p_build_status      in varchar2
  )
  as
  begin
    -- get build option id by build option name for both applications
    for c1 in(
      select
        t1.application_id
      , t1.build_option_id
      from apex_application_build_options t1
      where 1 = 1
        and t1.build_option_name  = p_build_option_name
        and exists(
          select 1
          from blog_settings x1
          where 1 = 1
            and x1.attribute_name in( 'G_PUB_APP_ID', 'G_ADMIN_APP_ID' )
            and to_number( x1.attribute_value ) = t1.application_id
        )
    ) loop

      -- update build option value
      update_feature(
        p_app_id          => c1.application_id
      , p_build_option_id => c1.build_option_id
      , p_build_status    => p_build_status
      );

    end loop;

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_link_groups
  as
  begin

    -- update link groups display_seq if it different than new
    merge into blog_link_groups t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_link_groups
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_link_groups;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_links(
    p_link_group_id in varchar2
  )
  as
    l_link_group_id number;
  begin

    -- convert link group id to number
    l_link_group_id := to_number( p_link_group_id );

    -- update links display_seq if it different than new
    merge into blog_links t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_links
      where 1 = 1
      and link_group_id = l_link_group_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_links;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_dynamic_content
  as
  begin
    -- Update dynamic content seq if it different than new
    merge into blog_dynamic_content t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_dynamic_content
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;
  end resequence_dynamic_content;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_attribute_value(
    p_attribute_list in apex_t_varchar2
  )
  as
    l_values  json_object_t;
    l_keys    json_key_list;
  begin

    l_values :=
      json_object_t.parse(
        apex_string.plist_to_json_clob( p_attribute_list )
      )
    ;

    l_keys := l_values.get_keys;

    for i in 1 .. l_keys.count
    loop

      set_attribute_value(
        p_attribute_name  => l_keys(i)
      , p_attribute_value => l_values.get_string( l_keys(i) )
      );

    end loop;

  end set_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CM";
/
