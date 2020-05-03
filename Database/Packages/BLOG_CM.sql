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
--    Jari Laine 12.01.2020 - Added function prepare_file_path
--    Jari Laine 09.04.2020 - Handling tags case insensitive
--
--  TO DO: (search from body TODO#x)
--    #1 - check constraint name that raised dup_val_on_index error
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  -- Called from: admin app pages 14
  function get_category_seq return number;
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_username        in varchar2,
    p_id              out nocopy number,
    p_name            out nocopy varchar2
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 18
  function get_link_seq(
    p_link_group_id   in number
  ) return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 20
  function get_link_grp_seq return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_post_tags(
    p_post_id         in number,
    p_sep             in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_category_title(
    p_category_id     in number
  ) return varchar2;
  --------------------------------------------------------------------------------
    function get_post_title(
      p_post_id       in number
    ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: trigger blog_posts_trg
  function get_first_paragraph(
    p_body_html       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function request_to_post_status(
    p_request         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: trigger blog_files_trg and procedure blog_cm.file_upload
  function prepare_file_path(
    p_file_path       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app page 22 Close Dialog condition
  function file_upload(
    p_file_name       in varchar2,
    p_file_path       in varchar2,
    p_unzip           in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  function remove_whitespace(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app page 23 and procedure blog_cm.file_upload
  procedure merge_files;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_category(
    p_title           in varchar2,
    p_category_id     out nocopy number
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_post_tags(
    p_post_id         in number,
    p_tags            in varchar2,
    p_sep             in varchar2 default ','
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  -- obsolete
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  -- Not ready
  procedure save_post_preview(
    p_id              in number,
    p_tags            in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
  function is_integer(
    p_value           in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_url(
    p_value           in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_date_format(
    p_value           in varchar2
  ) return varchar2;
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
    l_value varchar2(256);
  begin

    p_tag_id  := null;
    l_value := trim( p_tag );

    -- if tag is not null then insert to table and return id
    if l_value is not null then

      begin

        insert into blog_tags( is_active, tag )
        values ( 1, l_value )
        returning id into p_tag_id
        ;

      -- if unique constraint violation, tag exists.
      -- find id for tag in exception handler
      exception when dup_val_on_index then
      -- TODO#1
        l_value := upper(l_value);

        select id
        into p_tag_id
        from blog_v_all_tags
        where 1 = 1
        and tag_unique = l_value
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
  -- TODO#1
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
    -- cleanup relationship from tags that aren't belong to post
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
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max   number;
    l_name  varchar2(256);
    l_email varchar2(256);
  begin

    -- If blogger is new add to blog_bloggers table
    if apex_util.current_user_in_group( 'Bloggers' )
    then

      select ceil(coalesce(max(display_seq) + 1, 1) / 10) * 10
      into l_max
      from blog_bloggers
      ;

      select email
        ,v1.first_name || ' ' || v1.last_name as full_name
      into l_email, l_name
      from apex_workspace_apex_users v1
      where 1  =1
      and v1.user_name = p_username
      ;

      insert into blog_bloggers
      ( apex_username, is_active, display_seq, blogger_name, email )
      values
      ( p_username, 1, l_max, l_name, l_email )
      returning id, blogger_name into p_id, p_name
      ;

    end if;

  end add_blogger;
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
  procedure get_blogger_details(
    p_username  in varchar2,
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
  begin
    -- get blogger id and name
    select id
      ,blogger_name
    into p_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;
  exception when no_data_found
  then
    blog_cm.add_blogger(
       p_username => p_username
      ,p_id => p_id
      ,p_name => p_name
    );
  end get_blogger_details;
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
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request     in varchar2
  ) return varchar2
  as
  begin
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
      then 1
      else '0'
    end;
  end request_to_post_status;
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
  function get_post_title(
    p_post_id in number
  ) return varchar2
  as
    l_title varchar2(4000);
  begin
    -- fetch and return category name
    select t1.title
    into l_title
    from blog_v_all_posts t1
    where t1.id = p_post_id
    ;
    -- return string
    return l_title;
  exception when no_data_found then
    return null;
  when others then
    raise;
  end get_post_title;
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
      --Post must have at least one paragraph
      raise_application_error( -20001,  apex_lang.message( 'BLOG_ERR_POST_NO_PARAGRAPH' ) );
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
    l_file_path varchar2(256);
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
        select t1.id        as id
          ,t2.id            as file_id
          ,t2.row_version   as row_version
          ,t2.is_active     as is_active
          ,t2.is_download   as is_download
          ,t2.file_desc     as file_desc
          ,t1.mime_type     as mime_type
          ,t1.blob_content  as blob_content
        from apex_application_temp_files t1
        left join blog_v_all_files t2 on t2.file_name = l_file_name
          and t2.file_path = l_file_path
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
           p_collection_name => 'BLOG_FILES'
          ,p_n001     => c1.id
          ,p_n002     => c1.file_id
          ,p_n003     => c1.row_version
          ,p_n004     => coalesce(c1.is_active, 1)
          ,p_n005     => coalesce(c1.is_download, 0)
          ,p_c001     => l_file_path
          ,p_c002     => l_file_name
          ,p_c003     => c1.file_desc
          ,p_c004     => c1.mime_type
          ,p_blob001  => c1.blob_content
        );

      end loop;
    end loop;

    if not l_file_exists then
      blog_cm.merge_files;
    end if;

    return not l_file_exists;

  end file_upload;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function remove_whitespace(
    p_string      in varchar2
  ) return varchar2
  as
  begin
    return regexp_replace( p_string, '\s+', ' ' );
  end remove_whitespace;
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
    l_value   varchar2(512);
  begin

    p_category_id := null;
    l_value := trim( p_title );

    if l_value is null then
      -- Category title must have some value
      raise_application_error( -20002,  apex_lang.message( 'BLOG_ERR_POST_NO_CATEGORY_TITLE' ) );
    end if;

    -- get next sequence value
    l_seq   := blog_cm.get_category_seq;

    -- try insert category and return id for out parameter.
    -- if unique constraint violation raised, category exists.
    -- then find category id for out parameter in exception handler
    insert into blog_categories ( is_active, display_seq, title )
    values( 1, l_seq, l_value )
    returning id into p_category_id
    ;
  exception when dup_val_on_index then
    -- TODO#1
    l_value := upper( l_value );
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
    and v1.title_unique = l_value
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
    l_tag_id      number;
    l_display_seq number;
    l_tag_tab     apex_t_varchar2;
    l_tag_id_tab  apex_t_number;
  begin

    -- split tags string to table and loop all values
    l_tag_tab := apex_string.split(
       p_str => p_tags
      ,p_sep => p_sep
    );

    for i in 1 .. l_tag_tab.count
    loop

      -- add tag to repository
      l_tag_id := null;

      blog_cm.add_tag(
         p_tag    => l_tag_tab(i)
        ,p_tag_id => l_tag_id
      );

      if l_tag_id is not null then

        -- collect tag id to table.
        -- table is used at end of procedure for checking relationships between tags and post
        apex_string.push( l_tag_id_tab, l_tag_id );

        -- get table record count for tag display sequence
        l_display_seq:= l_tag_id_tab.count * 10;

        -- tag post
        blog_cm.add_tag_to_post(
           p_post_id     => p_post_id
          ,p_tag_id      => l_tag_id
          ,p_display_seq => l_display_seq
        );

      end if;

    end loop;

    blog_cm.cleanup_post_tags(
       p_post_id => p_post_id
      ,p_tag_tab => l_tag_id_tab
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
    function is_integer(
      p_value in varchar2
    ) return varchar2
    as
      l_result varchar2(4000);
    begin

      l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_INTEGER');

      if round( to_number( p_value ) ) between 1 and 100
      then
        l_result := null;

      end if;
      return l_result;

    exception when invalid_number
    or value_error
    then
      return l_result;
    end is_integer;
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
    function is_url(
      p_value in varchar2
    ) return varchar2
    as
      l_result varchar2(4000);
    begin

      if not regexp_like(p_value, '^https?\:\/\/.*$')
      then
        l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_URL');
      end if;

      return l_result;

    end is_url;
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
    function is_date_format(
      p_value in varchar2
    ) return varchar2
    as
      l_result            varchar2(4000);
      invalid_date_format exception;
      pragma              exception_init(invalid_date_format, -1821);
    begin

      l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_DATE_FORMAT');

      if to_char( systimestamp, p_value) = to_char( systimestamp, p_value )
      then
        l_result := null;
      end if;

      return l_result;

    exception when invalid_date_format
    then
      return l_result;
    end is_date_format;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
end "BLOG_CM";
/
