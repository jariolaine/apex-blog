CREATE OR REPLACE package "BLOG_CM" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Content management API
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 10.01.2020 - Added procedure merge_files and file_upload
--    jari Laine 12.01.2020 - Added function prepare_file_path
--
--  TO DO: (search from body TODO#x)
--    #1 - check constraint name that raised dup_val_on_index error
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

-------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------
  -- Called from: admin app pages 14
  function get_category_seq
  return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 18
  function get_link_seq(
    p_link_group_id in number
  ) return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 20
  function get_link_grp_seq
  return number;
--------------------------------------------------------------------------------  
  -- Called from: admin app pages 12
  function get_post_tags(
    p_post_id     in number,
    p_sep         in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_category_title(
    p_category_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 17
  function get_link_group_title(
    p_link_group_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: trigger blog_posts_trg
  function get_first_paragraph(
    p_body_html   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_post_is_active(
    p_request     in varchar2,
    p_is_active   in varchar2
  ) return varchar2;  
--------------------------------------------------------------------------------
  -- Called from: trigger blog_files_trg and procedure blog_cm.file_upload
  function prepare_file_path(
    p_file_path   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app page 22 branch condition
  function file_upload(
    p_file_name   in varchar2,
    p_file_path   in varchar2,
    p_unzip       in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  -- Called from: admin app page 23 and procedure blog_cm.file_upload
  procedure merge_files;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_post_tags(
    p_post_id     in number,
    p_tags        in varchar2,
    p_sep         in varchar2 default ','
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  -- obsolete
  -- page process is commented out
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure save_post_preview(
    p_id            in number,
    p_tags          in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
  -- Called from: 
  -- not ready
  procedure purge_post_preview;
--------------------------------------------------------------------------------
  -- Called from: 
  -- not ready
  procedure purge_post_preview_job(
    p_drop_job    in boolean default false
  );
--------------------------------------------------------------------------------
end "BLOG_CM";
/


CREATE OR REPLACE package body "BLOG_CM" 
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables and constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  procedure add_tag(
    p_tag     in varchar2,
    p_tag_id  out nocopy number
  )
  as
    l_tag_val varchar2(4000);
  begin

    p_tag_id  := null;
    l_tag_val := trim( p_tag );

    -- if tag is not null then insert to table and return id
    if l_tag_val is not null then

      begin

        insert into blog_tags( is_active, tag )
        values ( 1, l_tag_val )
        returning id into p_tag_id
        ;

      -- if unique constraint violation, tag exists.
      -- find id for tag in exception handler
      exception when dup_val_on_index then
      -- TODO#1
        select id
        into p_tag_id
        from blog_v_all_tags
        where 1 = 1
        and tag = l_tag_val
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_v_all_categories
    ;
    return l_max;
  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id in number
  ) return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_v_all_links
    where 1 = 1
    and link_group_id = p_link_group_id
    ;
    return l_max;
  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_v_all_link_groups
    ;
    return l_max;
  end get_link_grp_seq;
--------------------------------------------------------------------------------
  function get_post_is_active(
    p_request     in varchar2,
    p_is_active   in varchar2
  ) return varchar2
  as
  begin
    return case p_request
      when 'CREATE'
      then '1'
      when 'CREATE_DRAFT'
      then '0'
      else 
        case p_is_active
        when 'Y'
        then '1'
        else '0'
        end
    end;
  end get_post_is_active;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function get_post_tags(
    p_post_id in number,
    p_sep     in varchar2 default ','
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin
    select listagg( v1.tag, p_sep) within group( order by v1.display_seq ) as tags
    into l_tags
    from blog_v_all_posts_tags v1
    where 1 = 1
    and v1.post_id = p_post_id
    ;
    return l_tags;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_post_tags;  
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number
  ) return varchar2
  as
    l_title varchar2(4000);
  begin
    -- fetch and return category name
    select t1.title
    into l_title
    from blog_v_all_categories t1
    where t1.id = p_category_id
    ;
    -- return string
    return l_title;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_group_title(
    p_link_group_id in number
  ) return varchar2
  as
    l_title varchar2(4000);
  begin
    -- fetch and return category name
    select t1.title
    into l_title
    from blog_v_all_link_groups t1
    where t1.id = p_link_group_id
    ;
    -- return string
    return l_title;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_link_group_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function get_first_paragraph(
    p_body_html in varchar2
  ) return varchar2
  as
    l_first_p       varchar2(32700);
    l_first_p_start number;
    l_first_p_end   number;
  begin

    -- get first paragraph start and end positions
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>' );

    if l_first_p_start = 0 or l_first_p_end = 0 then
      raise_application_error( -20001,  'Post must have at least one paragraph.' );
    end if;

    l_first_p_start := l_first_p_start - 1;
    l_first_p_end   := l_first_p_end + 3;

    -- get first paragraph
    l_first_p := substr( p_body_html, l_first_p_start, l_first_p_end );

    -- remove whitespace
    l_first_p := replace( regexp_replace( l_first_p, '\s+', ' ' ), '  ', ' ' );

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function prepare_file_path(
    p_file_path in varchar2
  ) return varchar2
  as
    l_file_path   varchar2(256);
  begin
    l_file_path := trim(trim (both '/' from p_file_path));
    
    if l_file_path is null then
      l_file_path := '/';
    else
      l_file_path := '/' || l_file_path || '/';
    end if;
    
    return l_file_path;
    
  end prepare_file_path;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function file_upload(
    p_file_name   in varchar2,
    p_file_path   in varchar2,
    p_unzip       in varchar2
  ) return boolean
  as
    l_file_exists boolean;
    l_file_names  apex_t_varchar2;
    l_file_path   varchar2(256);
    l_file_name   varchar2(256);
  begin
  
    l_file_exists := false;

    l_file_names := apex_string.split (
      p_str => p_file_name
      ,p_sep => ':'
    );
    
    l_file_path := blog_cm.prepare_file_path( p_file_path );
    
    apex_collection.create_or_truncate_collection(
      p_collection_name => 'BLOG_FILES'
    );
    
    for i in 1 .. l_file_names.count
    loop
    
      l_file_name := substr(l_file_names(i), instr(l_file_names(i), '/') + 1);
      
      for c1 in(
        select t1.id
          ,t2.id as file_id
          ,t2.row_version
          ,coalesce(t2.is_active, 1) as is_active
          ,coalesce(t2.is_download, 0) is_download 
          ,t2.file_desc
        from apex_application_temp_files t1
        left join blog_v_all_files t2 on t2.file_name = l_file_name
          and t2.file_path = l_file_path
        where 1 = 1
        and t1.name = l_file_names(i)
      ) loop
        
        l_file_exists := case when c1.file_id is not null then true else l_file_exists end;
        
        apex_collection.add_member(
          p_collection_name => 'BLOG_FILES'
          ,p_n001 => c1.id
          ,p_n002 => c1.file_id
          ,p_n003 => c1.row_version
          ,p_n004 => c1.is_active
          ,p_n005 => c1.is_download
          ,p_c001 => l_file_path
          ,p_c002 => l_file_name
          ,p_c003 => c1.file_desc
          /*
          ,p_c021 => 'BLOG_STATUS_IS'
          ,p_c022 => 'Enabled'
          ,p_c023 => 'Disabled'
          ,p_c024 => 'BLOG_IS_PUBLIC_FILE'
          ,p_c025 => 'Yes'
          ,p_c026 => 'No'
          */
        );
        
      end loop;
    end loop;
    
    if not l_file_exists then
      blog_cm.merge_files;
    end if;
    
    return l_file_exists;
    
  end file_upload;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_files
  as
  begin
    merge into blog_files t1
    using blog_v_temp_files v1
    on (t1.id = v1.id)
  when matched then
    update set 
      t1.blob_content = v1.blob_content
  when not matched then
    insert (
      is_active
      ,is_download
      ,file_path
      ,file_name
      ,mime_type
      ,blob_content
      ,file_desc
    )
    values (
      v1.is_active
      ,v1.is_download
      ,v1.file_path
      ,v1.file_name
      ,v1.mime_type
      ,v1.blob_content
      ,v1.file_desc
    );
  end merge_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  )
  as
    l_seq     number;
    l_title   varchar2(256);
  begin
  
    p_category_id := null;
    l_title := trim( p_title );
    
    -- get next sequence value
    l_seq   := blog_cm.get_category_seq;

    -- try insert category and return id for out parameter.
    -- if unique constraint violation raised, category exists.
    -- then find category id for out parameter in exception handler
    insert into blog_categories ( is_active, display_seq, title )
    values( 1, l_seq, l_title )
    returning id into p_category_id
    ;
  exception when dup_val_on_index then
    -- TODO#1 
    l_title := upper( l_title );
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
    and v1.title_unique = l_title
    ;

  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id in number,
    p_tags    in varchar2,
    p_sep     in varchar2 default ','
  )
  as
    l_tag_id  number;
    l_arr_cnt number;
    l_tag_arr apex_t_varchar2;
    l_tag_tab blog_t_tag_ids := blog_t_tag_ids();
  begin

    -- split tags string to array and loop all values
    l_tag_arr := apex_string.split(
       p_str => p_tags
      ,p_sep => p_sep
    );

    for i in 1 .. l_tag_arr.count
    loop

      -- add tag to repository
      l_tag_id := null;
      
      blog_cm.add_tag(
         p_tag    => l_tag_arr(i)
        ,p_tag_id => l_tag_id
      );

      if l_tag_id is not null then

        -- collect tag id to array.
        -- array is used at end of procedure 
        -- to check not existing relationships between tag and posts
        l_tag_tab.extend;
        
        -- get array last index. 
        -- it is also usedfor tag display sequence
        l_arr_cnt := l_tag_tab.last;
        
        l_tag_tab( l_arr_cnt ) := blog_t_tag_id( l_tag_id );

        -- insert post id, tag id and display sequency to table.
        -- use unique constraint violation to skip existing records.
        begin
          insert into blog_posts_tags( is_active, post_id, tag_id, display_seq )
          values ( 1, p_post_id, l_tag_id, l_arr_cnt )
          ;
        exception when dup_val_on_index then
          -- TODO#1
          -- update display sequence if it changed
          update blog_posts_tags
          set display_seq = l_arr_cnt
          where 1 = 1
          and post_id = p_post_id
          and tag_id = l_tag_id
          and display_seq != l_arr_cnt
          ;
        end;

      end if;

    end loop;

    -- cleanup relationship from tags that aren't belong to post
    delete from blog_posts_tags t1
    where 1 = 1
    and post_id = p_post_id
    and not exists(
      select 1
      from table( l_tag_tab ) x1
      where 1 = 1
      and x1.tag_id = t1.tag_id
    );

/*
    -- if any relationship was removed, remove unused tags
    if sql%rowcount > 0 then
      blog_cm.remove_unused_tags;
    end if;
*/

  end add_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_tags
  as
  begin
    -- TODO#3
    -- cleanup tags that aren't linked to any post
    delete from blog_tags t1
    where 1 = 1
    and not exists(
      select 1
      from blog_v_all_posts_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure save_post_preview(
    p_id              in number,
    p_tags            in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  )
  as
  begin
  
    delete from blog_post_preview
    where id = p_id
    ;
    
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
  procedure purge_post_preview
  as
  begin
    /* Delete from blog_article_preview rows where session is expired */
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
  procedure purge_post_preview_job(
    p_drop_job in boolean default false
  )
  as
    l_job_name      varchar2(255);
    job_not_exists  exception;
    pragma          exception_init(job_not_exists, -27475);
  begin
  
    l_job_name := 'BLOG_PURGE_POST_PREVIEW_JOB';
    
    begin
      sys.dbms_scheduler.drop_job(
        job_name => l_job_name
      );
    exception when job_not_exists then
      null;
    end;
  
    if not p_drop_job then
      sys.dbms_scheduler.create_job(
         job_name        => l_job_name
        ,job_type        => 'STORED_PROCEDURE'
        ,job_action      => 'blog_cm.purge_post_preview'
        ,start_date      => trunc(localtimestamp, 'HH')
        ,repeat_interval => 'FREQ=DAILY'
        ,enabled         => true
        ,comments        => 'Purge expired sessions post previews'
      );
    end if;
    
  end purge_post_preview_job;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
end "BLOG_CM";
/
