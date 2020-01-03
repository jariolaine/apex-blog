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
--
--  TO DO: (search from body TODO#x)
--    #1 - check constraint name that raised dup_val_on_index error
--    #3 - is remove_unused_tags needed
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

-------------------------------------------------------------------------------- 
  --------------------------------------------------------------------------------
  function get_category_seq
  return number;
--------------------------------------------------------------------------------
  function get_link_seq
  return number;
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return number;
--------------------------------------------------------------------------------  
  function get_post_tags(
    p_post_id     in number,
    p_sep         in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_link_grp_title(
    p_link_grp_id in number
  ) return varchar2;
--------------------------------------------------------------------------------  
  function get_first_paragraph(
    p_body_html   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_hash        in varchar2,
    p_category_id out nocopy number
  );
--------------------------------------------------------------------------------
  procedure add_link_grp(
    p_title       in varchar2,
    p_link_grp_id out nocopy number
  );
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id     in number,
    p_tags        in varchar2,
    p_sep         in varchar2 default ','
  );
--------------------------------------------------------------------------------
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  procedure save_post_preview(
    p_id            in number,
    p_tags          in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
  procedure purge_post_preview;
--------------------------------------------------------------------------------
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
-- Private variables
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
--        begin
          select id
          into p_tag_id
          from blog_tags
          where 1 = 1
          and tag = l_tag_val
--          and is_active = 1
          ;
/*
        exception when no_data_found then
          raise_application_error( -20001,  apex_lang.message('BLOG_ERR_TAG_EXISTS_IS_DISABLED', p_tag) );
        end;
*/
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_changed(
    p_value in varchar2,
    p_hash  in varchar2
  ) return boolean
  as
    l_result  boolean;
    l_hash    varchar2(32700);
  begin
    l_result := true;
    l_hash := apex_util.get_hash(apex_t_varchar2(p_value));
    if p_hash = l_hash
    then
      l_result := false;
    end if;
    return l_result;
  end is_changed;
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
    from blog_categories
    ;
    return l_max;
  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq
  return number
  as
    l_max number;
  begin
    select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
    into l_max
    from blog_links
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
    from blog_link_groups
    ;
    return l_max;
  end get_link_grp_seq;
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
    from blog_v_all_post_tags v1
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
    l_category_title varchar2(4000);
  begin
    -- fetch and return category name
    select t1.title
    into l_category_title
    from blog_categories t1
    where t1.id = p_category_id
    ;
    -- return string
    return l_category_title;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_title(
    p_link_grp_id in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin
    -- fetch and return resource group name
    select title
    into l_value
    from blog_link_groups
    where id = p_link_grp_id
    ;
    -- Espace html and return string */
    return apex_escape.html( l_value );
  exception when no_data_found then
    return null;
  end get_link_grp_title;
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

    -- get first paragraph ending position
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>' );

    if l_first_p_start = 0 or l_first_p_end = 0 then
      raise_application_error( -20001,  'Post must habe at least one paragraph.' );
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
  procedure add_category(
    p_title       in varchar2,
    p_hash        in varchar2,
    p_category_id out nocopy number
  )
  as
    l_seq     number;
    l_title   varchar2(256);
    l_changed boolean;
  begin
  
    p_category_id := null;
    l_title := trim( p_title );
    
    l_changed := blog_cm.is_changed(
      p_value => p_title
      ,p_hash => p_hash
    );
    apex_debug.info ('Is category changed: %s', apex_debug.tochar(l_changed));
    
    -- if value not changed raise dup_val_on_index error and fetch key in exception handler
    if not l_changed then
      raise dup_val_on_index;
    end if;
    
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
--    begin
      select v1.id
      into p_category_id
      from blog_categories v1
      where 1 = 1
      and v1.title_unique = l_title
--      and v1.is_active = 1
      ;
/*
    exception when no_data_found then
      raise_application_error( -20001,  apex_lang.message('BLOG_ERR_CATEGORY_EXISTS_IS_DISABLED', p_title) );
    end;
*/
  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_link_grp(
    p_title       in varchar2,
    p_link_grp_id out nocopy number
  )
  as
    l_seq   number;
    l_title varchar2(512);
  begin

    p_link_grp_id := null;
    
    -- get next sequence value
    l_seq := blog_cm.get_link_grp_seq;
    -- 
    l_title := trim( p_title );

    -- try insert resource group to tabe and return id for out parameter.
    -- if unique constraint violation raised, resource group exists.
    -- then find id for out paramete in exception handler
    insert into blog_link_groups( is_active, display_seq, title )
    values( 1, l_seq, l_title )
    returning id into p_link_grp_id
    ;

  exception when dup_val_on_index then
    -- TODO#1
    l_title := upper( l_title );
    select id
    into p_link_grp_id
    from blog_link_groups
    where 1 = 1
    and title_unique = l_title
    ;
  end add_link_grp;
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
          insert into blog_post_tags( is_active, post_id, tag_id, display_seq )
          values ( 1, p_post_id, l_tag_id, l_arr_cnt )
          ;
        exception when dup_val_on_index then
          -- TODO#1
          -- update display sequence if it changed
          update blog_post_tags
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
    delete from blog_post_tags t1
    where 1 = 1
    and post_id = p_post_id
    and not exists(
      select 1
      from table( l_tag_tab ) x1
      where 1 = 1
      and x1.tag_id = t1.tag_id
    );

    -- TODO#3
    -- if any relationship was removed, remove unused tags
/*
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
      from blog_post_tags x1
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
      select 1 from apex_workspace_sessions s
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
        ,repeat_interval => 'FREQ=HOURLY'
        ,enabled         => true
        ,comments        => 'Purge expired sessions post preview'
      );
    end if;
    
  end purge_post_preview_job;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
end "BLOG_CM";
/
