create or replace package "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions for admin application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 10.01.2020 - Added procedure merge_files and file_upload
--    Jari Laine 12.01.2020 - Added function prepare_file_path
--    Jari Laine 09.04.2020 - Handling tags case insensitive
--    Jari Laine 09.05.2020 - Procedures and functions number input parameters changed to varchar2
--                          - New functions get_comment_post_id and is_email
--    Jari Laine 10.05.2020 - Procedure send_reply_notify to send notify on reply to comment
--    Jari Laine 12.05.2020 - Removed function prepare_file_path
--    Jari Laine 17.05.2020 - Removed parameter p_err_mesg from function get_first_paragraph
--    Jari Laine 19.05.2020 - Removed obsolete function get_post_title
--    Jari Laine 24.05.2020 - Added procedures:
--                              run_settings_post_expression
--                              run_feature_post_expression
--                              update_feature
--    Jari Laine 22.06.2020 - Bug fix to function is_integer
--                          - Added parameters p_min and p_max to function is_integer
--    Jari Laine 30.09.2020 - Added procedure google_post_authentication
--    Jari Laine 28.11.2020 - Removed obsolete function get_comment_post_id
--                          - Renamed function google_post_authentication to post_authentication
--    Jari Laine 28.02.2020 - New function get_footer_link_seq
--    Jari Laine 23.05.2020 - Modifications to remove ORDS depency
--    Jari Laine 21.03.2021 - Changed procedure get_blogger_details fetch authorization group name stored to BLOG_SETTINGS table
--                          - Added trim to function remove_whitespace
--                          - Changed procedures add_category and add_tag use function remove_whitespace
--    Jari Laine 11.04.2021 - Procedure send_reply_notify moved to package BLOG_COMM
--    Jari Laine 13.04.2021 - Changes to procedure post_authentication
--                          - Function get_footer_link_seq renamed to get_modal_page_seq
--                          - Removed procedure run_feature_post_expression
--    Jari Laine 18.04.2021 - Function is_email moved to package BLOG_COMM
--    Jari Laine 05.01.2022 - Removed unused parameters and variables from procedures: post_authentication, update_feature, get_blogger_details and add_blogger
--    Jari Laine 27.03.2022 - Fixed bug on function get_first_paragraph when search nested elements
--                          - Removed obsolete procedures remove_unused_tags, purge_post_preview, purge_post_preview_job and save_post_preview
--    Jari Laine 13.04.2022 - Bug fix to functions is_integer, is_url and is_date_format error message handling
--    Jari Laine 01.05.2022 - Simple logic to function request_to_post_status
--    Jari Laine 07.05.2022 - Added procedure remove_unused_tags and remove_unused_categories
--                          - Chenged private procedure add_tag to public
--                          - Removed obsolete functions get_post_tags and get_category_title
--                          - New procedures:
--                              resequence_link_groups
--                              resequence_links
--                              resequence_categories
--                              resequence_tags
--    Jari Laine 09.05.2022 - Removed obsolete procedure run_settings_post_expression
--    Jari Laine 08.03.2023 - Changed function is_date_format validate as date instead of timestamp
--    Jari Laine 03.04.2023 - Changed function file_upload to procedure with out parameter
--    Jari Laine 28.05.2023 - New function request_to_post_success_message
--    Jari Laine 01.06.2023 - Removed procedure file_upload
--                          - New function file_exists
--                          - Changed procedure merge_files
--    Jari Laine 30.07.2023 - Added check is workspace user locked to procedure post_authentication
--                          - Replaced apex_util.set_build_option_status with apex_application_admin.set_build_option_status
--    Jari Laine 10.03.2024 - Bug fix post_authentication procedure to check only current workspace
--    Jari Laine 08.04.2024 - Removed functions:
--                              request_to_post_success_message
--                              request_to_link_success_message
--    Jari Laine 11.04.2024 - New procedure resequence_dynamic_content
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
    p_app_id          in varchar2,
    p_username        in varchar2,
    p_user_id         out nocopy number,
    p_name            out nocopy varchar2
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
    p_link_group_id   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function request_to_post_status(
    p_request         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
--  inside procedudre blog_cm.get_first_paragraph
  function remove_whitespace(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_first_paragraph(
    p_body_html       in clob
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 72 processing
  function file_exists(
    p_file_name       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 72 and 73
  procedure merge_files(
    p_file_name       in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12 Processing process "Process Category"
  procedure add_category(
    p_category_title  in varchar2,
    p_category_id     out nocopy number
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
    p_tag             in varchar2,
    p_tag_id          out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  procedure add_post_tags(
    p_post_id         in varchar2,
    p_tags            in varchar2,
    p_sep             in varchar2 default ','
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 15
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 16
  procedure resequence_tags(
    p_post_id         in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is Integer"
  function is_integer(
    p_value           in varchar2,
    p_min             in number,
    p_max             in number,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is URL"
  function is_url(
    p_value           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is date format"
  function is_date_format(
    p_value           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20011 Processing process "Features - Save Interactive Grid Data"
  procedure update_feature(
    p_app_id          in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20014
  procedure update_text_messages(
    p_attribute_name  in varchar2 default null
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_link_groups;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_links(
    p_link_group_id in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 80
  procedure resequence_dynamic_content;
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
    p_username  in varchar2,
    p_user_id   out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max   blog_bloggers.display_seq%type;
    l_email blog_bloggers.email%type;
  begin

    -- fetch next display_seq
    select max( t1.display_seq ) as display_seq
    into l_max
    from blog_bloggers t1
    ;

    l_max := next_seq( l_max );

    -- get APEX user email
    l_email := apex_util.get_email( p_username => p_username );

    -- get APEX user first and last name for blogger name
    p_name := apex_string.format(
       p_message  => '%s %s'
      ,p0 => apex_util.get_first_name( p_username => p_username )
      ,p1 => apex_util.get_last_name( p_username => p_username )
    );

    -- add new blogger
    insert into blog_bloggers
      ( is_active, publish_desc, display_seq, apex_username, blogger_name, email )
    values
      ( 1, 0, l_max, p_username, p_name, l_email )
    returning id into p_user_id
    ;

  end add_blogger;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure post_authentication
  as
    l_group_names   apex_t_varchar2;
    l_user_name     apex_workspace_apex_users.user_name%type;
    l_workspace_id  apex_workspace_apex_users.workspace_id%type;
  begin

    l_user_name     := sys_context( 'APEX$SESSION', 'APP_USER' );
    l_workspace_id  := sys_context( 'APEX$SESSION', 'WORKSPACE_ID' );

    -- collect user groups to PL/SQL table
    for c1 in(
      select g.group_name
      from apex_workspace_group_users g
      where 1 = 1
        and exists(
          select 1
          from apex_workspace_apex_users u
          where 1 = 1
            and u.user_name = g.user_name
            and u.workspace_id = l_workspace_id
            and u.account_locked = 'No'
            and u.workspace_id = g.workspace_id
            and u.user_name = l_user_name
        )
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
    l_app_id    apex_applications.application_id%type;
    l_authz_grp apex_applications.authorization_scheme%type;
  begin

    -- fetch user id and name
    select id
      ,blogger_name
    into p_user_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;

  -- if user not found, check is user authorized use blog
  exception
  when no_data_found
  then

    -- conver application id string to number
    l_app_id := to_number( p_app_id );

    -- fetch application authorization scheme name
    select authorization_scheme
    into l_authz_grp
    from apex_applications
    where 1 = 1
    and application_id = l_app_id
    ;

    -- verify user is authorized
    if apex_util.current_user_in_group( l_authz_grp )
    then
      -- if user is authorized add user to blog_bloggers table
      add_blogger(
         p_username => p_username
        ,p_user_id  => p_user_id
        ,p_name     => p_name
      );

    end if;

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
  function remove_whitespace(
    p_string  in varchar2
  ) return varchar2
  as
  begin
    -- remove whitespace characters from string
    return trim( regexp_replace( p_string, '\s+', ' ' ) );
  end remove_whitespace;
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
      l_first_p := remove_whitespace( l_first_p );

    end if;

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function file_exists(
    p_file_name in varchar2
  ) return varchar2
  as
    l_file_exists varchar2(6);
    l_file_names  apex_t_varchar2;
  begin

    -- Get file names
    l_file_names := apex_string.split (
      p_str => p_file_name
      ,p_sep => ':'
    );

    -- check if any of files already exists
    select
      case
        when count(1) = 0
        then 'NO'
        else 'YES'
      end as file_exists
    into l_file_exists
    from blog_v_all_files t1
    where 1 = 1
      and exists(
        select 1
        from apex_application_temp_files x1
        join table( l_file_names ) x2
          on x1.name = x2.column_value
        where 1 = 1
          and x1.filename = t1.file_name
      )
    ;

    return l_file_exists;

  end file_exists;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_files(
    p_file_name in varchar2
  )
  as
    l_file_names apex_t_varchar2;
  begin

    -- Get file names
    l_file_names := apex_string.split (
      p_str => p_file_name
      ,p_sep => ':'
    );

    -- insert new files and overwrite existing
    merge into blog_files t1 using (
      select
        t2.id             as id
        ,t2.is_active     as is_active
        ,t2.is_download   as is_download
        ,t1.filename      as file_name
        ,t2.file_desc     as file_desc
        ,t1.mime_type     as mime_type
        ,t1.blob_content  as blob_content
      from apex_application_temp_files t1
      left join blog_v_all_files t2 on t1.filename = t2.file_name
      where 1 = 1
        and exists(
          select 1
          from table( l_file_names ) x1
          where 1 = 1
            and x1.column_value = t1.name
        )
    ) new_files
    on ( t1.id = new_files.id )
    when matched then
      update
        set t1.blob_content = new_files.blob_content
    when not matched then
      insert (
        is_active
        ,is_download
        ,file_name
        ,mime_type
        ,blob_content
        ,file_desc
      )
      values (
        coalesce( new_files.is_active, 1)
        ,coalesce( new_files.is_download, 0 )
        ,new_files.file_name
        ,new_files.mime_type
        ,new_files.blob_content
        ,new_files.file_desc
      );

    -- cleanup. delete files from temp table.
    delete from apex_application_temp_files t1
    where 1 = 1
    and exists(
      select 1
      from table( l_file_names ) x1
      where 1 = 1
        and x1.column_value = t1.name
    );

  end merge_files;
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
    l_title := remove_whitespace( p_category_title );
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
    l_value   := remove_whitespace( p_tag );

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
  procedure update_text_messages(
    p_attribute_name  in varchar2 default null
  )
  as
  begin

    for c1 in(
      select
        t1.translation_entry_id
      , t2.attribute_value
      from apex_application_translations t1
      join blog_settings t2 on t1.translatable_message = t2.attribute_name
      where 1 = 1
        and exists(
          select 1
          from blog_settings x1
          where 1 = 1
            and x1.attribute_name in( 'G_PUB_APP_ID', 'G_ADMIN_APP_ID' )
            and to_number( x1.attribute_value ) = t1.application_id
        )
        and(
          p_attribute_name is null or
          t2.attribute_name = p_attribute_name
        )
      order by 1
    ) loop

      apex_lang.update_message (
        p_id => c1.translation_entry_id
      , p_message_text => c1.attribute_value
      );

    end loop;

  end update_text_messages;
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
    -- update dynamic content seq if it different than new
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
end "BLOG_CM";
/
