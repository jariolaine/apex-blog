CREATE OR REPLACE package "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Content and configuration management API
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 10.01.2020 - Added procedure merge_files and file_upload
--    Jari Laine 12.01.2020 - Added function prepare_file_path
--    Jari Laine 09.04.2020 - Handling tags case insensitive
--    Jari Laine 09.05.2020 - Procedures and functions number input parameters changed to varchar2
--                            New functions get_comment_post_id and is_email
--    Jari Laine 10.05.2020 - Procedure send_reply_notify to send notify on reply to comment
--    Jari Laine 12.05.2020 - Removed function prepare_file_path
--    Jari Laine 17.05.2020 - Removed parameter p_err_mesg from function get_first_paragraph,
--                            function is called now from APEX application conputation
--    Jari Laine 19.05.2020 - Removed obsolete function get_post_title
--    Jari Laine 24.05.2020 - Added procedures:
--                            run_settings_post_expression
--                            run_feature_post_expression
--                            update_feature
--    Jari Laine 22.06.2020 - Bug fix to function is_integer
--                            Added parameters p_min and p_max to function is_integer
--    Jari Laine 30.09.2020 - Added procedure google_post_authentication
--    Jari Laine 28.11.2020 - Removed obsolete function get_comment_post_id
--                            Renamed function google_post_authentication to post_authentication
--    Jari Laine 28.02.2020 - New function get_footer_link_seq
--    Jari Laine 23.05.2020 - Modifications to remove ORDS depency
--    Jari Laine 21.03.2021 - Changed procedure get_blogger_details fetch authorization group name stored to BLOG_SETTINGS table
--                            Added trim to function remove_whitespace
--                            Changed procedures add_category and add_tag use function remove_whitespace
--    Jari Laine 11.04.2021 - Procedure send_reply_notify moved to package BLOG_COMM
--    Jari Laine 13.04.2021 - Changes to procedure post_authentication
--                            Function get_footer_link_seq renamed to get_modal_page_seq
--                            Removed procedure run_feature_post_expression
--    Jari Laine 18.04.2021 - Function is_email moved to package BLOG_COMM
--    Jari Laine 14.11.2021 - New function get_help_link
--
--  TO DO:
--    #1  check constraint name that raised dup_val_on_index error
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  this function is not used
  procedure post_authentication(
    p_user_email      in varchar2 default null
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app application processes
  procedure get_blogger_details(
    p_app_id          in varchar2,
    p_username        in varchar2,
    p_id              out nocopy number,
    p_name            out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  function get_category_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20
  function get_link_grp_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page xx
  function get_modal_page_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 18
  function get_link_seq(
    p_link_group_id   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_post_tags(
    p_post_id         in varchar2,
    p_sep             in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_category_title(
    p_category_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_first_paragraph(
    p_body_html       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function request_to_post_status(
    p_request         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 22 Processing process "Close Dialog" condition
  function file_upload(
    p_file_name       in varchar2,
    p_collection_name in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
--  inside procedudre blog_cm.get_first_paragraph
  function remove_whitespace(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 23 and procedure blog_cm.file_upload
  procedure merge_files(
    p_collection_name in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12 Processing process "Process Category"
  procedure add_category(
    p_title           in varchar2,
    p_category_id     out nocopy number
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
--  this procedure is not used currently
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
-- Called from:
--  this procedure is not used / not ready
  procedure save_post_preview(
    p_id              in varchar2,
    p_tags            in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
-- Called from:
--  this procedure is not used / not ready
  procedure purge_post_preview;
---------------------------- ----------------------------------------------------
-- this procedure is not used / not ready
  procedure purge_post_preview_job(
    p_drop_job        in boolean default false
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is Integer"
  function is_integer(
    p_value           in varchar2,
    p_min             in number,
    p_max             in number,
    p_err_mesg        in varchar2 default 'BLOG_VALIDATION_ERR_INTEGER'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is URL"
  function is_url(
    p_value           in varchar2,
    p_err_mesg        in varchar2 default 'BLOG_VALIDATION_ERR_URL'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is date format"
  function is_date_format(
    p_value           in varchar2,
    p_err_mesg        in varchar2 default 'BLOG_VALIDATION_ERR_DATE_FORMAT'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 Processing process "Run post expression"
  procedure run_settings_post_expression(
    p_id              in number,
    p_value           in out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20011 Processing process "Features - Save Interactive Grid Data"
  procedure update_feature(
    p_app_id          in number,
    p_feature_id      in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 and 20011
  function get_help_link(
    p_app_page_id         in varchar2,
    p_request             in varchar2,
    p_items               in varchar2,
    p_values              in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_CM";
/


CREATE OR REPLACE package body "BLOG_CM"
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
  procedure add_tag(
    p_tag     in varchar2,
    p_tag_id  out nocopy number
  )
  as
    l_value varchar2(256);
  begin

    p_tag_id  := null;
    l_value := remove_whitespace( p_tag );

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
        insert into blog_tags( is_active, tag )
        values ( 1, l_value )
        returning id into p_tag_id
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag_to_post(
    p_post_id     in number,
    p_tag_id      in number,
    p_display_seq in number
  )
  as
  begin

    -- insert post id, tag id and display sequency to table.
    -- use unique constraint violation to skip existing records.
    insert into blog_post_tags( is_active, post_id, tag_id, display_seq )
    values ( 1, p_post_id, p_tag_id, p_display_seq )
    ;

  -- TO DO see item 1 from package specs
  exception when dup_val_on_index then

    -- update display sequence if it changed
    update blog_post_tags
    set display_seq = p_display_seq
    where 1 = 1
    and post_id = p_post_id
    and tag_id = p_tag_id
    and display_seq != p_display_seq
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
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max   number;
    l_autz  varchar2(256);
    l_name  varchar2(256);
    l_email varchar2(256);
  begin

    -- fetch next display_seq
    select max(display_seq) as display_seq
    into l_max
    from blog_bloggers
    ;

    l_max := next_seq( l_max );

    -- fetch user information from APEX users
    select email
      ,v1.first_name || ' ' || v1.last_name as full_name
    into l_email, l_name
    from apex_workspace_apex_users v1
    where 1 = 1
    and v1.user_name = p_username
    ;

    -- add new blogger
    insert into blog_bloggers
    ( apex_username, is_active, display_seq, blogger_name, email, publish_desc )
    values
    ( p_username, 1, l_max, l_name, l_email, 0 )
    returning id, blogger_name into p_id, p_name
    ;

  end add_blogger;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure post_authentication(
    p_user_email in varchar2 default null
  )
  as
    l_group_names apex_t_varchar2;
  begin

    -- collect user groups to PL/SQL table
    for c1 in(
      select group_name
      from apex_workspace_group_users
      where 1 = 1
        and user_name = sys_context( 'APEX$SESSION', 'APP_USER' )
    ) loop
      apex_string.push( l_group_names, c1.group_name );
    end loop;

    -- Enable user groups
    apex_authorization.enable_dynamic_groups (
      p_group_names => l_group_names
    );

  exception when others
  then
    apex_debug.error( 'Unhandled post authentication procedure error: %s: ', sqlerrm );
    raise;
  end post_authentication;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_app_id    in varchar2,
    p_username  in varchar2,
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_authz_grp varchar2(256);
  begin

    -- fetch user id and name
    select id
      ,blogger_name
    into p_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;

  -- if user not found, check is user authorized use blog
  exception when no_data_found
  then
    -- fetch user group name that is used for admin app authorization
    l_authz_grp := apex_app_setting.get_value( 'ADMIN_APP_AUTHZ_GROUP' );
    -- verify user is authorized
    if apex_util.current_user_in_group( l_authz_grp )
    then
      -- if user is authorized add user to blog_bloggers table
      add_blogger(
         p_app_id => p_app_id
        ,p_username => p_username
        ,p_id => p_id
        ,p_name => p_name
      );
    end if;

  end get_blogger_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return varchar2
  as
    l_max     number;
    l_result  varchar2(256);
  begin

    -- fetch max category display sequence
    select max( v1.display_seq ) as display_seq
    into l_max
    from blog_v_all_categories v1
    ;
    -- return next category display sequence
    l_result := blog_util.int_to_vc2( next_seq( l_max ) );

    return l_result;

  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return varchar2
  as
    l_max     number;
    l_result  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max
    from blog_v_all_link_groups v1
    ;
    -- return next link group display sequence
    l_result := blog_util.int_to_vc2( next_seq( l_max ) );

    return l_result;

  end get_link_grp_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_modal_page_seq
  return varchar2
  as
    l_max     number;
    l_result  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max
    from blog_v_all_dynamic_content v1
    ;
    -- return next link group display sequence
    l_result := blog_util.int_to_vc2( next_seq( l_max ) );

    return l_result;

  end get_modal_page_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id in varchar2
  ) return varchar2
  as
    l_result        varchar2(256);
    l_link_group_id number;
    l_max           number;
  begin

    l_link_group_id := to_number( p_link_group_id );

    -- fetch max link display sequence
    select max( v1.display_seq ) as display_seq
    into l_max
    from blog_v_all_links v1
    where 1 = 1
    and link_group_id = l_link_group_id
    ;
    -- return next link display sequence
    l_result := blog_util.int_to_vc2( next_seq( l_max ) );

    return l_result;

  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request in varchar2
  ) return varchar2
  as
  begin

    -- one reason for this function is that APEX 19.2 has bug in switch.
    -- switch not allow return value zero (0)

    -- conver APEX request to post status (blog_posts.is_active)
    return case p_request
      when 'CREATE_DRAFT'
      then '0'
      when 'CREATE'
      then '1'
      when 'SAVE_DRAFT'
      then '0'
      when 'SAVE_AND_PUBLISH'
      then '1'
      when 'REVERT_DRAFT'
      then '0'
      when 'SAVE'
      then '1'
      else '0'
    end;

  end request_to_post_status;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id in varchar2,
    p_sep     in varchar2 default ','
  ) return varchar2
  as
    l_post_id number;
    l_tags    varchar2(32700);
  begin

    l_post_id := to_number( p_post_id );

    -- fetch and return comma separated is of post tags
    select listagg( v1.tag, p_sep) within group( order by v1.display_seq ) as tags
    into l_tags
    from blog_v_all_post_tags v1
    where 1 = 1
    and v1.post_id = l_post_id
    ;
    return l_tags;

  exception when no_data_found then
    return null;
  end get_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2
  ) return varchar2
  as
    l_category_id number;
    l_title       varchar2(4000);
  begin

    l_category_id := to_number( p_category_id );

    -- fetch and return category name
    select t1.title
    into l_title
    from blog_v_all_categories t1
    where t1.id = l_category_id
    ;
    return l_title;

  exception when no_data_found then
    return null;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html in varchar2
  ) return varchar2
  as
    l_first_p       varchar2(32700);
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
      l_next_p := instr( l_first_p, '<p>', 1, l_cnt );

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
  function file_upload(
    p_file_name       in varchar2,
    p_collection_name in varchar2
  ) return boolean
  as
    l_file_exists boolean;
    l_file_names  apex_t_varchar2;
    l_file_name   varchar2(256);
  begin

    l_file_exists := false;

    -- Get file names
    l_file_names := apex_string.split (
      p_str => p_file_name
      ,p_sep => ':'
    );

    -- create apex_collection for storing files
    -- collection is used to show what files already exists in repository
    -- we prompt user to confirm those files overwrite
    apex_collection.create_or_truncate_collection(
      p_collection_name => p_collection_name
    );

    -- store uploaded files to apex_collection
    for i in 1 .. l_file_names.count
    loop

      l_file_name := substr(l_file_names(i), instr(l_file_names(i), '/') + 1);

      for c1 in(
        select
           t2.id            as file_id
          ,t2.row_version   as row_version
          ,t2.is_active     as is_active
          ,t2.is_download   as is_download
          ,t2.file_desc     as file_desc
          ,t1.mime_type     as mime_type
          ,t1.blob_content  as blob_content
        from apex_application_temp_files t1
        left join blog_v_all_files t2 on t2.file_name = l_file_name
        where 1 = 1
        and t1.name = l_file_names(i)
      ) loop

        l_file_exists := case
          when c1.file_id is not null
          then true
          else l_file_exists
          end
        ;

        apex_collection.add_member(
           p_collection_name => p_collection_name
          ,p_n001     => c1.file_id
          ,p_n002     => coalesce(c1.is_active, 1)
          ,p_n003     => coalesce(c1.is_download, 0)
          ,p_c001     => l_file_name
          ,p_c002     => c1.file_desc
          ,p_c003     => c1.mime_type
          ,p_blob001  => c1.blob_content
        );

      end loop;
    end loop;

    -- if non of files exists, insert files to blog_files
    if not l_file_exists then
      merge_files(
        p_collection_name => p_collection_name
      );
    end if;

    return not l_file_exists;

  end file_upload;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function remove_whitespace(
    p_string  in varchar2
  ) return varchar2
  as
  begin
    -- remove whitespace characters from string
    return trim( replace( regexp_replace( p_string, '\s+', ' ' ), '  ', ' ' ) );
  end remove_whitespace;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_files(
    p_collection_name in varchar2
  )
  as
  begin

    -- insert new files and overwrite existing
    merge into blog_files t1 using (
      select
         n001     as id
        ,n002     as is_active
        ,n003     as is_download
        ,c001     as file_name
        ,c002     as file_desc
        ,c003     as mime_type
        ,blob001  as blob_content
      from apex_collections
      where 1 = 1
      and collection_name = p_collection_name
    ) new_files
    on (t1.id = new_files.id)
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
         coalesce( new_files.is_active ,  1 )
        ,coalesce( new_files.is_download, 0 )
        ,new_files.file_name
        ,new_files.mime_type
        ,new_files.blob_content
        ,new_files.file_desc
      );

  end merge_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  )
  as
    l_seq   number;
    l_value varchar2(512);
  begin

    -- remove whitespace from category title
    l_value := remove_whitespace( p_title );

    -- check if category already exists and fetch id
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
    and v1.title_unique = upper( l_value )
    ;
  -- if category not exists insert and return id
  exception when no_data_found then
    -- get next sequence value
    l_seq := get_category_seq;
    -- try insert category and return id for out parameter.
    insert into blog_categories ( is_active, display_seq, title )
    values( 1, l_seq, l_value )
    returning id into p_category_id
    ;
  end add_category;
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

      -- reset variable holding tag id
      l_tag_id := null;

      -- add tag to repository
      add_tag(
         p_tag    => l_tag_tab(i)
        ,p_tag_id => l_tag_id
      );

      -- if tag was added to repository
      -- create relationships between tag and post
      if l_tag_id is not null then

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
/*
    -- if any relationship was removed, remove unused tags
    if sql%rowcount > 0 then
      remove_unused_tags;
    end if;
*/

  end add_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- This procedure is not used currently
  procedure remove_unused_tags
  as
  begin
    -- cleanup tags that aren't linked to any post
    delete from blog_tags t1
    where 1 = 1
    and not exists(
      select 1
      from blog_v_all_post_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- this procedure is not used / not ready
  procedure save_post_preview(
    p_id              in varchar2,
    p_tags            in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  )
  as
  begin

    -- delete from blog_post_preview if there is row for session
    delete from blog_post_preview
    where id = p_id
    ;
    -- insert preview data
    insert into blog_post_preview(
       id
      ,tags
      ,post_title
      ,category_title
      ,body_html
    )
    values(
       p_id
      ,p_tags
      ,p_post_title
      ,p_category_title
      ,p_body_html
    )
    ;
  end save_post_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- this procedure is not used / not ready
  procedure purge_post_preview
  as
  begin

    -- delete from blog_post_preview rows where session is expired
    delete from blog_post_preview p
    where not exists (
      select 1
      from apex_workspace_sessions s
      where 1 = 1
      and s.apex_session_id = p.id
    );
  end purge_post_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- this procedure is not used / not ready
  procedure purge_post_preview_job(
    p_drop_job in boolean default false
  )
  as
    l_job_name      varchar2(255);
    job_not_exists  exception;
    pragma          exception_init(job_not_exists, -27475);
  begin
    -- set job name
    l_job_name := 'BLOG_JOB_PURGE_POST_PREVIEW';
    -- drop job if exists
    begin
      sys.dbms_scheduler.drop_job(
        job_name => l_job_name
      );
    exception when job_not_exists then
      null;
    end;
    -- if job is not just dropped
    -- create new job
    if not p_drop_job then
      sys.dbms_scheduler.create_job(
         job_name        => l_job_name
        ,job_type        => 'STORED_PROCEDURE'
        ,job_action      => 'blog_conf.purge_post_preview'
        ,start_date      => trunc( localtimestamp, 'HH')
        ,repeat_interval => 'FREQ=DAILY'
        ,enabled         => true
        ,comments        => 'Purge expired sessions posts previews'
      );
    end if;

  end purge_post_preview_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_integer(
    p_value     in varchar2,
    p_min       in number,
    p_max       in number,
    p_err_mesg  in varchar2 default 'BLOG_VALIDATION_ERR_INTEGER'
  ) return varchar2
  as
    l_value     number;
    l_err_mesg  varchar2(32700);
  begin

    if p_value is not null
    then
      -- prepare validation error message
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
        ,p0 => p_min
        ,p1 => p_max
      );

      if l_err_mesg = apex_escape.html( p_err_mesg )
      then
        l_err_mesg := p_err_mesg;
      end if;

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
    p_err_mesg  in varchar2 default 'BLOG_VALIDATION_ERR_URL'
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin

    if not regexp_like(p_value, '^https?\:\/\/.*$')
    then
      -- if validation fails prepare error message
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
      );

      if l_err_mesg = apex_escape.html(
        p_string => p_err_mesg
      )
      then
        l_err_mesg := p_err_mesg;
      end if;
    else
      -- if validation passes, clear error meassage
      l_err_mesg := null;
    end if;

    return l_err_mesg;

  end is_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_date_format(
    p_value     in varchar2,
    p_err_mesg  in varchar2 default 'BLOG_VALIDATION_ERR_DATE_FORMAT'
  ) return varchar2
  as
    l_err_mesg          varchar2(32700);
    invalid_date_format exception;
    pragma              exception_init(invalid_date_format, -1821);
  begin

    -- prepare validation error message
    l_err_mesg := apex_lang.message(
      p_name => p_err_mesg
    );

    if l_err_mesg = apex_escape.html(
      p_string => p_err_mesg
    )
    then
      l_err_mesg := p_err_mesg;
    end if;

    -- try convert timestamp to string
    if to_char( systimestamp, p_value ) is not null
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
  procedure run_settings_post_expression(
    p_id    in number,
    p_value in out nocopy varchar2
  )
  as
    l_exp varchar2(32700);
  begin

    -- trim value
    p_value := trim( p_value );

    -- fetch post exporession
    select v1.post_expression
    into l_exp
    from blog_v_all_settings v1
    where 1 = 1
      and v1.post_expression is not null
      and v1.id = p_id
    ;
    -- get expression result
    p_value := apex_plugin_util.get_plsql_expression_result(
      p_plsql_expression => l_exp
    );

  exception when no_data_found
  then
    null;
  end run_settings_post_expression;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_app_id          in number,
    p_feature_id      in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  )
  as
  begin

    -- update build option value
    apex_util.set_build_option_status(
       p_application_id => p_app_id
      ,p_id => p_build_option_id
      ,p_build_status => upper( p_build_status )
    );

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_help_link(
    p_app_page_id in varchar2,
    p_request     in varchar2,
    p_items       in varchar2,
    p_values      in varchar2
  ) return varchar2
  as
    l_button varchar2(4000);
  begin
  if p_request is not null
  then
  l_button := '<a title="'
    || apex_lang.message(
      p_name => 'BLOG_BTN_TITLE_HELP'
    )
    || '" class="t-Button t-Button--noLabel t-Button--icon t-Button--link" href="'
    || apex_page.get_url(
      p_page      => p_app_page_id
      ,p_request  => p_request
      ,p_items    => p_items
      ,p_values   => p_values
    )
    || '">'
    || '<span aria-hidden="true" class="t-Icon fa fa-question-circle-o"></span>'
    || '</a>'
    ;
  end if;
  return l_button;
end get_help_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CM";
/
