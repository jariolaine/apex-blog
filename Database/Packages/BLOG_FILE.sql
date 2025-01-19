create or replace package "BLOG_FILE"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package provides procedures and functions for managing files in the
--    admin application's file repository. It includes operations for formatting
--    file paths, uploading, replacing, selecting, deleting, and downloading files.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  21.07.2024   Jari Laine     Created package.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_file_path(
    p_file_name         in varchar2,
    p_dir               in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_file_desc(
    p_file_path         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure upload_file(
    p_file_names        in varchar2,
    p_dir               in varchar2,
    p_collection_name   in varchar2,
    p_extract           in varchar2 default 'N',
    p_overwrite_file    in varchar2 default 'N'
  );
--------------------------------------------------------------------------------
  procedure replace_file(
    p_collection_name   in varchar2
  );
--------------------------------------------------------------------------------
  procedure file_select_collection(
    p_collection_name   in varchar2,
    p_seq_id            in number,
    p_id                in number
  );
--------------------------------------------------------------------------------
  procedure delete_selected_files(
    p_collection_name   in varchar2
  );
--------------------------------------------------------------------------------
  procedure download_selected_files(
    p_collection_name   in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_FILE";
/


create or replace package body "BLOG_FILE"
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
  procedure upload_to_database(
    p_file_name             in varchar2,
    p_dir                   in varchar2,
    p_mime_type             in varchar2,
    p_file_size             in pls_integer,
    p_overwrite_file        in varchar2,
    p_collection_name       in varchar2,
    p_blob_content          in blob
  )
  as
    l_file_path varchar2(2000);
    l_file_desc varchar2(32700);
  begin

    apex_debug.info( 'File name to upload: %s', p_file_name );

    -- format file path
    l_file_path := format_file_path( p_file_name, p_dir );

    case p_overwrite_file
    when 'N'
    then

      begin
        insert into blog_files( file_path, file_size, mime_type, blob_content )
          values( l_file_path, p_file_size, p_mime_type, p_blob_content )
        ;

      -- if file exists handle exception
      exception when dup_val_on_index
      then
        -- create collection for storing file temporaly
        -- we prompt user to confirm file overwrite
        -- and show file information e.g. name and possible description from collection
        -- then if user confirms, we can overwrite file using data stored in collection
        if not apex_collection.collection_exists( p_collection_name )
        then
          apex_collection.create_collection( p_collection_name );
        end if;

        l_file_desc := get_file_desc( l_file_path );

        -- store file lob and other info to collection
        apex_collection.add_member(
          p_collection_name => p_collection_name
        , p_c001            => l_file_path
        , p_c002            => l_file_desc
        , p_c003            => p_mime_type
        , p_n001            => p_file_size
        , p_blob001         => p_blob_content
        );
      end;

    when 'Y'
    then

      -- merge file info to blog_files
      merge into blog_files t1
      using dual on ( t1.file_path = l_file_path )
      when not matched then
        insert( file_path, file_size, mime_type, blob_content )
          values( l_file_path, p_file_size, p_mime_type, p_blob_content )
      when matched then
        update set
          file_size     = p_file_size
        , mime_type     = p_mime_type
        , blob_content  = p_blob_content
      ;

    end case;

  end upload_to_database;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_file_path(
    p_file_name in varchar2,
    p_dir       in varchar2
  ) return varchar2
  as
    l_file_path varchar2(2000);
    l_dir       varchar2(2000);
  begin

    apex_debug.info( 'Formating file name %s, dir %s', p_file_name, p_dir );
    -- format file path
    l_dir := utl_url.escape( trim( trim( both '/' from p_dir ) ) );
    l_file_path := utl_url.escape( trim( regexp_replace( p_file_name, '\s+', '_' ) ) );
    l_file_path :=
      case when l_dir is null
        then l_file_path
        else l_dir || '/' || l_file_path
      end
    ;

    apex_debug.info( 'Formated file path: %s', l_file_path );

    return l_file_path;

  end format_file_path;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_file_desc(
    p_file_path in varchar2
  ) return varchar2
  as
    l_file_desc varchar2(2000);
  begin

    begin
    -- fetch file description from database
      select
        t1.file_desc
      into l_file_desc
      from blog_files t1
      where 1 = 1
      and t1.file_path = p_file_path
      ;

    exception when no_data_found
    then
      l_file_desc := null;
    end;

    return l_file_desc;

  end get_file_desc;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure upload_file(
    p_file_names        in varchar2,
    p_dir               in varchar2,
    p_collection_name   in varchar2,
    p_extract           in varchar2 default 'N',
    p_overwrite_file    in varchar2 default 'N'
  )
  as
    l_file_names    apex_t_varchar2;
    l_file_name     varchar2(500);
    l_mime_type     varchar2(500);
    l_file_size     pls_integer;
    l_zip_dir       apex_zip.t_dir_entries;
    l_zip_file_path varchar2(32767);
    l_unzipped      blob := empty_blob();
  begin

    if apex_collection.collection_exists( p_collection_name )
    then
      apex_collection.delete_collection( p_collection_name );
    end if;

    -- get file names
    l_file_names :=
      apex_string.split(
        p_str => p_file_names
      , p_sep => ':'
      )
    ;

    -- loop file
    for c1 in(
      select
        files.filename
      , files.mime_type
      , files.blob_content
      from apex_application_temp_files files
      where 1 = 1
      and exists(
        select 1
        from table( l_file_names ) x1
        where 1 = 1
          and x1.column_value = files.name
      )
    ) loop

      apex_debug.info( 'Processing file %s : %s'
      , c1.filename
      , c1.mime_type
      );

      if p_extract = 'Y'
      and c1.mime_type = 'application/zip'
      then

        l_zip_dir :=
          apex_zip.get_dir_entries(
            p_zipped_blob => c1.blob_content
          )
        ;

        l_zip_file_path := l_zip_dir.first;

        while l_zip_file_path is not null
        loop

          l_unzipped :=
            apex_zip.get_file_content(
              p_zipped_blob => c1.blob_content
            , p_dir_entry   => l_zip_dir( l_zip_file_path )
            )
          ;

          l_mime_type := blog_mime.get_mime_type( l_zip_file_path );

          l_file_size := dbms_lob.getlength( l_unzipped );

          upload_to_database(
            p_file_name         => l_zip_file_path
          , p_dir               => p_dir
          , p_mime_type         => l_mime_type
          , p_file_size         => l_file_size
          , p_overwrite_file    => p_overwrite_file
          , p_collection_name   => p_collection_name
          , p_blob_content      => l_unzipped
          );

          l_zip_file_path := l_zip_dir.next( l_zip_file_path );

        end loop;

      else

        l_file_size := dbms_lob.getlength( c1.blob_content );

        upload_to_database(
          p_file_name         => c1.filename
        , p_dir               => p_dir
        , p_mime_type         => c1.mime_type
        , p_file_size         => l_file_size
        , p_overwrite_file    => p_overwrite_file
        , p_collection_name   => p_collection_name
        , p_blob_content      => c1.blob_content
        );

      end if;

    end loop;

  end upload_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure replace_file(
    p_collection_name in varchar2
  )
  as
  begin

    for c1 in(
      select
        c001    as file_path
      , c002    as file_desc
      , c003    as mime_type
      , n001    as file_size
      , blob001 as blob_content
      from apex_collections
      where 1 = 1
        and collection_name = p_collection_name
    ) loop

      upload_to_database(
        p_file_name         => c1.file_path
      , p_dir               => null
      , p_mime_type         => c1.mime_type
      , p_file_size         => c1.file_size
      , p_overwrite_file    => 'Y'
      , p_collection_name   => p_collection_name
      , p_blob_content      => c1.blob_content
      );

    end loop;

    if apex_collection.collection_exists( p_collection_name )
    then
      apex_collection.delete_collection( p_collection_name );
    end if;

  end replace_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure file_select_collection(
    p_collection_name in varchar2,
    p_seq_id          in number,
    p_id              in number
  )
  as
    l_seq number;
  begin

    -- create collection if not exists
    if not apex_collection.collection_exists( p_collection_name )
    then
      apex_collection.create_collection( p_collection_name );
    end if;

    -- if no seq_id from Ajax call, save file id/name to collection
    if trim( p_seq_id ) is null
    then
      l_seq := apex_collection.add_member(
        p_collection_name => p_collection_name
      , p_n001 => p_id
      );
    -- if seq_id exists, delete row from collection
    else
      apex_collection.delete_member(
        p_collection_name => p_collection_name
      , p_seq => p_seq_id
      );
    end if;

    -- write header for the output
    apex_plugin_util.print_json_http_header;
    -- write seq_id to output
    apex_json.open_object;
    apex_json.write(
      p_name        => 'seq'
    , p_value       => l_seq
    , p_write_null  => true
    );
    apex_json.close_all;

  exception when others
  then
    -- if error happens
    -- write header for the output
    apex_debug.error( 'Select file failed: %s', sqlerrm );

    apex_plugin_util.print_json_http_header;
    -- write error message to output
    apex_json.open_object;
    apex_json.write(
      p_name  => 'status'
    , p_value => apex_lang.message( 'BLOG_GENERIC_ERROR' )
    );
    apex_json.close_all;

  end file_select_collection;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure delete_selected_files(
    p_collection_name in varchar2
  )
  as
  begin

    -- delete selected files
    delete
    from blog_files t1
    where 1 = 1
      and exists(
      select 1
        from apex_collections x1
        where 1 = 1
          and x1.collection_name = p_collection_name
          and x1.n001 = t1.id
      )
    ;
    -- truncate collection
    apex_collection.truncate_collection( p_collection_name );

  end delete_selected_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_selected_files(
    p_collection_name in varchar2
  )
  as
    l_zip_name        varchar2(256);
    l_content_type    varchar2(256);
    l_blob_content    blob;
    l_zip_file        blob;
  begin
    -- fetch selected files
    for c1 in(
      select
        t1.file_path
      , t1.blob_content
      from blog_v_all_files t1
      where 1 = 1
        and exists(
          select 1
          from apex_collections x1
          where 1 = 1
            and x1.collection_name = p_collection_name
            and x1.n001 = t1.id
        )
    )loop
      -- add file to zip
      apex_zip.add_file(
        p_zipped_blob => l_zip_file
      , p_file_name   => c1.file_path
      , p_content     => c1.blob_content
      );
    end loop;
    -- close zip
    apex_zip.finish(
      p_zipped_blob => l_zip_file
    );
    -- define zip name
    l_zip_name :=
      apex_string.format(
        p_message => '%s.zip'
      , p0 =>
          apex_string_util.get_slug(
            p_string => lower( 'blog files' )
          , p_hash_length => 6
          )
      )
    ;
    -- download zip
    apex_http.download(
      p_blob          => l_zip_file
    , p_content_type  => 'application/zip'
    , p_filename      => l_zip_name
    );

  end download_selected_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_FILE";
/
