create or replace package "BLOG_OCI_OS"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Procedure and functions for Oracle cloud object storage
--
--  CREDITS:
--    https://blogs.oracle.com/oraclemagazine/post/better-file-storage-in-oracle-cloud
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  21.07.2025   Jari Laine     Created package.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_object_storage(
    p_bucket_name       in varchar2,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
  procedure upload_object(
    p_file_names        in varchar2,
    p_dir               in varchar2,
    p_collection_name   in varchar2,
    p_cache_control     in varchar2 default null,
    p_extract           in varchar2 default 'N',
    p_overwrite_file    in varchar2 default 'N',
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure file_sync(
    p_action            in varchar2,
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure replace_object(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure download_selected_objects(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure rename_object(
    p_old_file_path     in varchar2,
    p_old_if_match      in varchar2,
    p_new_file_path     in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure delete_object(
    p_file_path         in varchar2,
    p_if_match          in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure delete_selected_objects(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  );
--------------------------------------------------------------------------------
end "BLOG_OCI_OS";
/


create or replace package body "BLOG_OCI_OS"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  type str_t is table of varchar2( 2000 ) index by varchar2( 256 );

-- variables
  param_t           str_t;
  response_heade_t  str_t;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure init_params
  as
  begin

    -- set valus for session
    param_t( 'build_option_name' ) := 'BLOG_FEATURE_OCI_OBJECT_STORAGE';
    param_t( 'module_static_id' ) := 'BLOG_OBJECT_STORAGE_OBJECT';
    param_t( 'bucket' ) := blog_util.get_attribute_value( 'G_OCI_OS_BUCKET' );
    param_t( 'namespace' ) := blog_util.get_attribute_value( 'G_OCI_OS_NAMESPACE' );

    -- query REST source module credential id and base url for session
    select
      t2.base_url
    , t1.credential_static_id
    into param_t( 'base_url' ), param_t( 'credential' )
    from apex_appl_web_src_modules t1
    join apex_workspace_remote_servers t2 on 1 = 1
      and t1.remote_server_static_id = t2.remote_server_static_id
    where 1 = 1
      and t1.application_id = apex_application.g_flow_id
      and t1.module_static_id = param_t( 'module_static_id' )
    ;

    apex_debug.info( 'Build option: %s', param_t( 'build_option_name' ) );
    apex_debug.info( 'Bucket: %s', param_t( 'bucket' ) );
    apex_debug.info( 'Namespace: %s', param_t( 'namespace' ) );
    apex_debug.info( 'Base URL: %s', param_t( 'base_url' ) );
    apex_debug.info( 'Credential: %s', param_t( 'credential' ) );
    apex_debug.info( 'Module: %s', param_t( 'module_static_id' ) );

  end init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure process_headers(
    p_is_error in boolean
  )
  as
    l_resp_status_msg constant varchar2(256) := 'Request HTTP status: %s - %s';
    l_resp_header_msg constant varchar2(256) := 'Response header %s: %s';
    l_req_header_msg constant varchar2(256) := 'Request header %s: %s';
  begin

    apex_debug.info( l_resp_status_msg, apex_web_service.g_status_code, apex_web_service.g_reason_phrase );

    -- if error debug request headers
    if p_is_error
    then

      apex_debug.error( l_resp_status_msg, apex_web_service.g_status_code, apex_web_service.g_reason_phrase );

      -- loop request headers
      for i in 1 .. apex_web_service.g_request_headers.count
      loop
        apex_debug.error( l_req_header_msg, apex_web_service.g_request_headers(i).name , apex_web_service.g_request_headers(i).value );
      end loop;

    end if;

    -- loop response headers and store it array
    for i in 1 .. apex_web_service.g_headers.count
    loop

      if p_is_error
      then
        apex_debug.error( l_resp_header_msg, apex_web_service.g_headers(i).name , apex_web_service.g_headers(i).value );
      else
        apex_debug.info( l_resp_header_msg, apex_web_service.g_headers(i).name , apex_web_service.g_headers(i).value );
      end if;

      response_heade_t( lower( trim( apex_web_service.g_headers(i).name ) ) ) :=
        trim( apex_web_service.g_headers(i).value )
      ;

    end loop;

  end;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_response_header(
    p_header in varchar2
  ) return varchar2
  as
    l_header varchar2(256);
    l_result varchar2(256);
  begin

    l_header := trim( lower( p_header ) );

    if response_heade_t .exists( l_header )
    then
      l_result := response_heade_t( l_header );
    end if;

    return l_result;

  end get_response_header;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure append_default_request_headers
  as
  begin

    -- append default headers
    apex_web_service.set_request_headers(
      p_reset     => false
    , p_name_01   => 'User-Agent'
    , p_value_01  => 'Oracle Application Express (gzip)'
    , p_name_02   => 'Accept-Encoding'
    , p_value_02  => 'gzip, deflate'
    );

    -- debug request headers
    if apex_application.g_debug
    then
      -- debug request headers
      for i in 1..apex_web_service.g_request_headers.count
      loop
         apex_debug.info(
          p_message => 'Set request header %s value: %s'
        , p0 => apex_web_service.g_request_headers(i).name
        , p1 => apex_web_service.g_request_headers(i).value
        );
      end loop;

    end if;

  end append_default_request_headers;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure parse_error_json(
    p_response  in clob,
    p_code      out nocopy varchar2,
    p_message   out nocopy varchar2
  )
  as
    l_top_obj json_object_t;
    l_err_obj json_object_t;
  begin

    apex_debug.error( 'Error response body: %s', p_response );

    -- parse response to json
    if p_response is not null
    then

      l_top_obj := json_object_t.parse( p_response );

      -- if top level is object try get error code and error message
      if ( l_top_obj.is_object )
      then

        l_err_obj := treat( l_top_obj as json_object_t );

        p_code := l_err_obj.get_string( 'code' );
        p_message := l_err_obj.get_string( 'message' );

      end if;

    end if;

    apex_debug.info( 'Error code: %s, error message', p_code, p_message );

  end parse_error_json;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function prepare_object_url(
    p_file_path in varchar2
  ) return varchar2
  as
    l_url_endpoint varchar2(2000);
  begin

    apex_debug.info( 'Prepare object URL for file path: %s', p_file_path );

    -- prepare URL for object store object
    l_url_endpoint :=
      apex_string.format(
        p_message => '%s/n/%s/b/%s/o/%s'
      -- remote server
      , p0 => rtrim( param_t( 'base_url' ), '/' )
      -- object storage namespace
      , p1 => param_t( 'namespace' )
      -- bucket
      , p2 => param_t( 'bucket' )
      -- object
      -- dir + file
      , p3 => p_file_path
      )
    ;

    apex_debug.info( 'Returning object URL: %s', l_url_endpoint );
    -- return URL
    return l_url_endpoint;

  end prepare_object_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure upload_to_bucket(
    p_file_name         in varchar2,
    p_dir               in varchar2,
    p_mime_type         in varchar2,
    p_file_size         in pls_integer,
    p_cache_control     in varchar2,
    p_overwrite_file    in varchar2,
    p_collection_name   in varchar2,
    p_blob_content      in blob,
    p_client_request_id in varchar2
  )
  as
    l_etag          varchar2(2000);
    l_md5           varchar2(2000);
    l_file_path     varchar2(2000);
    l_file_desc     varchar2(32700);
    l_error_code    varchar2(2000);
    l_error_mesg    varchar2(2000);
    l_url_endpoint  varchar2(2000);
    l_response_body clob;
  begin

    apex_debug.info( 'File name to upload: %s', p_file_name );

    -- format file path
    l_file_path := blog_file.format_file_path( p_file_name, p_dir );

    -- prepare request URL
    l_url_endpoint := prepare_object_url( l_file_path );

    apex_debug.info( 'Request URL: %s', l_url_endpoint );

    -- set request headers for request
    apex_web_service.set_request_headers(
      p_reset     => true
    , p_name_01   => 'Content-Type'
    , p_value_01  => p_mime_type
    , p_name_02   => case when p_mime_type = blog_mime.g_default_mime then 'Content-Length' end
    , p_value_02  => case when p_mime_type = blog_mime.g_default_mime then p_file_size end
    , p_name_03   => case when p_overwrite_file = 'N' then 'if-none-match' end
    , p_value_03  => case when p_overwrite_file = 'N' then '*' end
    , p_name_04   => case when p_cache_control is not null then 'Cache-Control' end
    , p_value_04  => case when p_cache_control is not null then p_cache_control end
    , p_name_05   => case when p_client_request_id is not null then 'opc-client-request-id' end
    , p_value_05  => case when p_client_request_id is not null then p_client_request_id end
    );
    -- append default request headers
    append_default_request_headers;

    -- make request to put file to object storage
    l_response_body :=
      apex_web_service.make_rest_request(
        p_url                   => l_url_endpoint
      , p_http_method           => 'PUT'
      , p_body_blob             => p_blob_content
      , p_credential_static_id  => param_t( 'credential' )
      )
    ;

    -- process response headers
    -- debug request headers if error
    process_headers(
      p_is_error => not apex_web_service.g_status_code in( 200, 412 )
    );

    -- handle request status
    case apex_web_service.g_status_code
    when 200 then
    -- if HTTP 200 request succeeded

      l_etag  := get_response_header( 'etag' );
      l_md5   := get_response_header( 'opc-content-md5' );

      -- insert file info to blog_files
      merge into blog_files t1
      using dual on ( t1.file_path = l_file_path )
      when not matched then
        insert( file_path, file_size, mime_type, etag, md5 )
          values( l_file_path, p_file_size, p_mime_type, l_etag, l_md5 )
      when matched then
        update set
          file_size     = p_file_size
        , mime_type     = p_mime_type
        , etag          = l_etag
        , md5           = l_md5
      ;

    when 412 then
    -- if HTTP 412 file already exists

      -- create collection for storing file temporaly
      -- we prompt user to confirm file overwrite
      -- and show file information e.g. name and possible description from collection
      -- then if user confirms, we can overwrite file using data stored in collection
      if not apex_collection.collection_exists( p_collection_name )
      then
        apex_collection.create_collection( p_collection_name );
      end if;

      -- fetch file description from database
      l_file_desc := blog_file.get_file_desc( l_file_path );

      apex_debug.info(
        p_message => 'File exists: %s, desc: %s, mime: %s, size: %s'
      , p0 => l_file_path
      , p1 => l_file_desc
      , p2 => p_mime_type
      , p3 => p_file_size
      );
      -- store file lob and other info to collection
      apex_collection.add_member(
        p_collection_name => p_collection_name
      , p_c001            => l_file_path
      , p_c002            => l_file_desc
      , p_c003            => p_mime_type
      , p_c004            => p_cache_control
      , p_n001            => p_file_size
      , p_blob001         => p_blob_content
      );

    else
    -- treat other HTTP status codes as error
    -- logic need to improved e.g. cases when two files are uploaded and only second file goes error

      apex_debug.error( 'Error uploading file: %s', l_url_endpoint );
      -- get error information from response body
      parse_error_json( l_response_body, l_error_code, l_error_mesg);

      apex_error.add_error(
        p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )
      , p_display_location  => apex_error.c_inline_in_notification
      );

    end case;

  end upload_to_bucket;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_object(
    p_file_path         in varchar2,
    p_client_request_id in varchar2,
    p_content_type      in out nocopy varchar2,
    p_blob_content      in out nocopy blob
  )
  as
    l_url_endpoint    varchar2(2000);
    l_file_extension  varchar2(500);
    l_response_body   clob;
    l_error_code      varchar2(2000);
    l_error_mesg      varchar2(2000);
  begin

    -- prepare request URL
    l_url_endpoint := prepare_object_url( p_file_path );

    apex_debug.info( 'Object URL: %s', l_url_endpoint);

    -- set request headers
    apex_web_service.set_request_headers(
      p_reset     => true
    , p_name_01   => 'Accept'
    , p_value_01  => '*/*'
    , p_name_02   => case when p_client_request_id is not null then 'opc-client-request-id' end
    , p_value_02  => case when p_client_request_id is not null then p_client_request_id end
    );
    -- append default request headers
    append_default_request_headers;

    -- make request to get file from object storage
    p_blob_content :=
      apex_web_service.make_rest_request_b(
        p_url                  => l_url_endpoint
      , p_http_method          => 'GET'
      , p_credential_static_id => param_t( 'credential' )
      )
    ;

    -- process response headers
    -- debug request headers if error
    process_headers(
      p_is_error => apex_web_service.g_status_code >= 400
    );

    -- check reponse status
    if apex_web_service.g_status_code >= 400
    then

      apex_debug.error( 'Error downloading file: %s', l_url_endpoint );

      l_response_body := apex_util.blob_to_clob( p_blob_content ) ;

      parse_error_json( l_response_body, l_error_code, l_error_mesg );

      apex_error.add_error(
        p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )
      , p_display_location  => apex_error.c_inline_in_notification
      );

    else
      p_content_type := get_response_header( 'content-type' );

      if p_content_type is null
      or p_content_type = blog_mime.g_default_mime
      then
        apex_debug.info( 'File mime type is %s. Trying to fetch better one.', coalesce( p_content_type, '(null)' ) );
        p_content_type := blog_mime.get_mime_type( p_file_path );
      end if;

      apex_debug.info( 'File mime type: %s', p_content_type );

    end if;

  end get_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure delete_bucket_object(
    p_file_path             in varchar2,
    p_if_match              in varchar2,
    p_client_request_id     in varchar2
  )
  as
    l_error_code    varchar2(2000);
    l_error_mesg    varchar2(2000);
    l_response_body clob;
    l_del_params    apex_exec.t_parameters;
  begin

    apex_debug.info( 'Object name for deletion: %s, etag: %s', p_file_path, p_if_match );

    apex_exec.add_parameter( l_del_params, 'bucketName', param_t( 'bucket' ) );
    apex_exec.add_parameter( l_del_params, 'namespace', param_t( 'namespace' ) );
    apex_exec.add_parameter( l_del_params, 'objectName', p_file_path );
    apex_exec.add_parameter( l_del_params, 'if-match', p_if_match );
    apex_exec.add_parameter( l_del_params, 'opc-client-request-id', p_client_request_id );

    apex_exec.execute_rest_source(
      p_static_id           => param_t( 'module_static_id' )
    , p_operation_static_id => 'delete_object'
    , p_parameters          => l_del_params
    );

    l_response_body := apex_exec.get_parameter_clob( l_del_params, 'response_body' );

    -- process response headers
    -- debug request headers if error
    process_headers(
      p_is_error => not apex_web_service.g_status_code in( 204, 404 )
    );

    -- check request status
    -- don't raise error on HTTP 404 error.
    -- when HTTP 404 error file not exists in object storage
    -- and file need to anyway deleted from blog_files table
    if apex_web_service.g_status_code in( 204, 404 )
    then

      apex_debug.info( 'File deleted from object storage: %s', apex_web_service.g_status_code );

      delete from blog_files
        where 1 = 1
          and file_path = p_file_path
      ;

      apex_debug.info( '%s rows deleted from blog_files', sql%rowcount );

    else

      apex_debug.error( 'Error deleting file: %s', p_file_path );

      parse_error_json( l_response_body, l_error_code, l_error_mesg );

      apex_error.add_error(
        p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )
      , p_display_location  => apex_error.c_inline_in_notification
      );

    end if;


  end delete_bucket_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sync_from_database(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
  begin

    -- loop file
    for c1 in(
      select
        v1.file_name
      , v1.file_dir
      , v1.mime_type
      , v1.local_size
      , v1.blob_content
      from blog_v_all_files v1
      where 1 = 1
        and v1.is_active = 1
        and v1.local_size > 0
    ) loop

      apex_debug.info( 'Processing file %s : %s', c1.file_name, c1.mime_type );

      upload_to_bucket(
        p_file_name         => c1.file_name
      , p_dir               => c1.file_dir
      , p_mime_type         => c1.mime_type
      , p_file_size         => c1.local_size
      , p_cache_control     => null
      , p_overwrite_file    => 'N'
      , p_collection_name   => p_collection_name
      , p_blob_content      => c1.blob_content
      , p_client_request_id => p_client_request_id
      );

    end loop;

  end sync_from_database;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sync_from_object_storage(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
    l_row_timestamp timestamp with time zone;
    l_mime_type     varchar2(2000);
    l_blob_content  blob;
    l_file_exists   boolean := false;
  begin

    -- get files max sync timestamp
    select
      coalesce( max( apex$row_sync_timestamp ), current_timestamp ) as row_sync_timestamp
    into l_row_timestamp
    from blog_v_all_files
    ;

    apex_debug.info( 'Max sync time: %s', l_row_timestamp );

    -- create collection for storing filea temporaly
    apex_collection.create_or_truncate_collection( p_collection_name );

    -- sync files metadata from object storage
    apex_rest_source_sync.synchronize_data(
      p_module_static_id => param_t( 'module_static_id' )
    );

    -- loop files
    for c1 in(
      select
        v1.id
      , v1.file_path
      , v1.file_desc
      , v1.file_size
      , v1.local_size
      from blog_v_all_files v1
      where 1 = 1
        and v1.apex$row_sync_timestamp > l_row_timestamp
    ) loop

      apex_debug.info( 'Processing file: %s', c1.file_path );

      -- get file from object storage
      get_object(
        p_file_path         => c1.file_path
      , p_client_request_id => p_client_request_id
      , p_content_type      => l_mime_type
      , p_blob_content      => l_blob_content
      );
      -- save file to collection if it already exists in database
      -- we prompt user to confirm file overwrite
      -- and show file information e.g. name and possible description from collection
      -- then if user confirms, we can overwrite file using data stored in collection
      if c1.local_size > 0
      then

        apex_collection.add_member(
          p_collection_name => p_collection_name
        , p_c001            => c1.file_path
        , p_c002            => c1.file_desc
        , p_c003            => l_mime_type
        , p_n001            => c1.file_size
        , p_blob001         => l_blob_content
        );

        l_file_exists := true;

      else

        -- if file not already exists in database update blob
        update blog_files
          set blob_content = l_blob_content
        where 1 = 1
          and id = c1.id
        ;

      end if;

    end loop;

    -- if any of files didn't exists, delete collection
    if not l_file_exists
    then
      apex_collection.delete_collection( p_collection_name );
    end if;

  end sync_from_object_storage;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_namespace(
    p_client_request_id in varchar2 default null
  ) return varchar2
  as
    l_params        apex_exec.t_parameters;
    l_response_body clob;
    l_namespace     varchar2(256);
    l_error_code    varchar2(2000);
    l_error_mesg    varchar2(2000);
  begin
  -- fetch object storage namespace

    apex_exec.add_parameter( l_params, 'opc-client-request-id', p_client_request_id );

    apex_exec.execute_rest_source(
      p_static_id           => param_t( 'module_static_id' )
    , p_operation_static_id => 'get_namespace'
    , p_parameters          => l_params
    );

    l_response_body := apex_exec.get_parameter_clob( l_params, 'response_body' );

    apex_debug.info( 'Fetch object storage namespace returns: %s', l_response_body );

    -- check reponse status
    if not apex_web_service.g_status_code = 200
    then

      process_headers(
        p_is_error => true
      );

      apex_debug.error( 'Error on get_namespace.' );

      parse_error_json( l_response_body, l_error_code, l_error_mesg );

      apex_error.add_error(
        p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )
      , p_display_location  => apex_error.c_inline_in_notification
      );

    end if;

    l_namespace := trim( both '"' from l_response_body );

    -- return namespace
    return l_namespace;

  end get_namespace;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_object_storage(
    p_bucket_name   in varchar2,
    p_build_status  in varchar2
  )
  as
    c_bucket_url_template constant varchar2(64) := 'https://%0.objectstorage.%1.oci.customer-oci.com/n/%0/b/%2/o/';

    l_attributes   apex_t_varchar2;

    l_bucket_url  varchar2(2000);
    l_region      varchar2(256);
    l_namespace   varchar2(256);
  begin

    blog_cm.update_feature(
      p_build_option_name => param_t( 'build_option_name' )
    , p_build_status      => p_build_status
    );

    if p_build_status = apex_application_admin.c_build_option_status_include
    then

      apex_debug.info( 'Set object storage bucket: %s', p_bucket_name );

      apex_string.plist_push( l_attributes, 'G_OCI_OS_BUCKET', p_bucket_name );

      l_region :=
        substr(
          param_t( 'base_url' )
        , instr( param_t( 'base_url' ), '.', 1, 1 ) + 1
        , instr( param_t( 'base_url' ), '.', 1, 2 ) - 1 - instr( param_t( 'base_url' ), '.', 1, 1 )
        )
      ;

      apex_debug.info( 'Set object storage region: %s', l_region );

      apex_string.plist_push( l_attributes, 'G_OCI_OS_REGION', l_region );

      l_namespace := get_namespace;

      apex_debug.info( 'Set object storage  namespace: %s', l_namespace );

      apex_string.plist_push( l_attributes, 'G_OCI_OS_NAMESPACE', l_namespace );

      l_bucket_url :=
        apex_string.format(
          p_message => c_bucket_url_template
        , p0 => l_namespace
        , p1 => l_region
        , p2 => p_bucket_name
        )
      ;

      apex_debug.info( 'Set object storage bucket URL: %s', l_bucket_url );

      apex_string.plist_push( l_attributes, 'G_OCI_OS_BUCKET_URL', l_bucket_url );

      blog_cm.set_attribute_value(
        p_attribute_list  => l_attributes
      );

    end if;

  end set_object_storage;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure upload_object(
    p_file_names        in varchar2,
    p_dir               in varchar2,
    p_collection_name   in varchar2,
    p_cache_control     in varchar2 default null,
    p_extract           in varchar2 default 'N',
    p_overwrite_file    in varchar2 default 'N',
    p_client_request_id in varchar2 default null
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

      apex_debug.info( 'Processing file %s : %s', c1.filename, c1.mime_type );

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

          upload_to_bucket(
            p_file_name         => l_zip_file_path
          , p_dir               => p_dir
          , p_mime_type         => l_mime_type
          , p_file_size         => l_file_size
          , p_cache_control     => p_cache_control
          , p_overwrite_file    => p_overwrite_file
          , p_collection_name   => p_collection_name
          , p_blob_content      => l_unzipped
          , p_client_request_id => p_client_request_id
          );

          l_zip_file_path := l_zip_dir.next( l_zip_file_path );

        end loop;

      else

        l_file_size := dbms_lob.getlength( c1.blob_content );

        upload_to_bucket(
          p_file_name         => c1.filename
        , p_dir               => p_dir
        , p_mime_type         => c1.mime_type
        , p_file_size         => l_file_size
        , p_cache_control     => p_cache_control
        , p_overwrite_file    => p_overwrite_file
        , p_collection_name   => p_collection_name
        , p_blob_content      => c1.blob_content
        , p_client_request_id => p_client_request_id
        );

      end if;

    end loop;

  end upload_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure file_sync(
    p_action            in varchar2,
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
  begin

    apex_debug.info( 'File sync action is: %s', p_action );

    if apex_collection.collection_exists( p_collection_name )
    then
      apex_collection.delete_collection( p_collection_name );
    end if;

    case p_action
    when 'META'
    then

      apex_rest_source_sync.synchronize_data(
        p_module_static_id  => param_t( 'module_static_id' )
      );

    when 'DB'
    then

      sync_from_object_storage(
        p_collection_name   => p_collection_name
      , p_client_request_id => p_client_request_id
      );

    when 'OCI'
    then

      sync_from_database(
        p_collection_name   => p_collection_name
      , p_client_request_id => p_client_request_id
      );

    end case;

  end file_sync;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure replace_object(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
  begin

    for c1 in(
      select
        c001    as file_path
      , c002    as file_desc
      , c003    as mime_type
      , c004    as cache_control
      , n001    as file_size
      , blob001 as blob_content
      from apex_collections
      where 1 = 1
        and collection_name = p_collection_name
    ) loop

      upload_to_bucket(
        p_file_name         => c1.file_path
      , p_dir               => null
      , p_mime_type         => c1.mime_type
      , p_file_size         => c1.file_size
      , p_cache_control     => c1.cache_control
      , p_overwrite_file    => 'Y'
      , p_collection_name   => p_collection_name
      , p_blob_content      => c1.blob_content
      , p_client_request_id => p_client_request_id
      );

    end loop;

    if apex_collection.collection_exists( p_collection_name )
    then
      apex_collection.delete_collection( p_collection_name );
    end if;

  end replace_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_selected_objects(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
    l_zip_name      varchar2(256);
    l_content_type  varchar2(256);
    l_blob_content  blob;
    l_zip_file      blob;
  begin

    for c1 in(
      select
        file_path
      , etag
      from blog_v_all_files t1
      where 1 = 1
        and exists(
          select 1
          from apex_collections x1
          where 1 = 1
            and x1.collection_name = p_collection_name
            and x1.n001 = t1.id
        )
    ) loop

      get_object(
        p_file_path         => c1.file_path
      , p_client_request_id => p_client_request_id
      , p_content_type      => l_content_type
      , p_blob_content      => l_blob_content
      );

      if not apex_error.have_errors_occurred
      then
        apex_zip.add_file(
          p_zipped_blob => l_zip_file
        , p_file_name   => c1.file_path
        , p_content     => l_blob_content
        );
      end if;

    end loop;

    if l_zip_file is not null
    then

      apex_zip.finish(
        p_zipped_blob => l_zip_file
      );

      l_zip_name :=
        apex_string.format(
          p_message => 'blog-%s.zip'
        , p0 =>
            apex_string_util.get_slug(
              p_string => lower( param_t( 'bucket' ) )
            , p_hash_length => 6
            )
        )
      ;

    end if;

    if not apex_error.have_errors_occurred
    then
      apex_http.download(
        p_blob          => l_zip_file
      , p_content_type  => 'application/zip'
      , p_filename      => l_zip_name
      );
    end if;

  end download_selected_objects;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rename_object(
    p_old_file_path     in varchar2,
    p_old_if_match      in varchar2,
    p_new_file_path     in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
    l_error_code    varchar2(2000);
    l_error_mesg    varchar2(2000);
    l_response_body clob;
    l_params        apex_exec.t_parameters;
  begin

    apex_debug.info( 'Object for rename: %s - etag: %s', p_old_file_path, p_old_if_match );

    apex_exec.add_parameter( l_params, 'bucketName', param_t( 'bucket' ) );
    apex_exec.add_parameter( l_params, 'namespace', param_t( 'namespace' ) );
    apex_exec.add_parameter( l_params, 'sourceName', p_old_file_path );
    apex_exec.add_parameter( l_params, 'srcObjIfMatchETag', p_old_if_match );
    apex_exec.add_parameter( l_params, 'newName', p_new_file_path );
    apex_exec.add_parameter( l_params, 'opc-client-request-id', p_client_request_id );

    apex_exec.execute_rest_source(
      p_static_id           => param_t( 'module_static_id' )
    , p_operation_static_id => 'rename_object'
    , p_parameters          => l_params
    );

    l_response_body := apex_exec.get_parameter_clob( l_params, 'response_body' );

    -- process response headers
    -- debug request headers if error
    process_headers(
      p_is_error => not apex_web_service.g_status_code = 200
    );

    -- check request status
    if apex_web_service.g_status_code = 200
    then

      apex_debug.info( 'File %s renamed to %s', p_old_file_path, p_new_file_path );

    else

      parse_error_json( l_response_body, l_error_code, l_error_mesg );

      apex_error.add_error (
        p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )
      , p_display_location  => apex_error.c_inline_in_notification
      );

    end if;

  end rename_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure delete_object(
    p_file_path         in varchar2,
    p_if_match          in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
  begin

    delete_bucket_object(
      p_file_path         => p_file_path
    , p_if_match          => p_if_match
    , p_client_request_id => p_client_request_id
    );

  end delete_object;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure delete_selected_objects(
    p_collection_name   in varchar2,
    p_client_request_id in varchar2 default null
  )
  as
    l_obj_idx pls_integer := 1;
  begin

    for c1 in(
      select
        file_path
      , etag
      from blog_v_all_files t1
      where 1 = 1
        and exists(
          select 1
          from apex_collections x1
          where 1 = 1
            and x1.collection_name = p_collection_name
            and x1.n001 = t1.id
        )
    ) loop

      delete_bucket_object(
        p_file_path         => c1.file_path
      , p_if_match          => c1.etag
      , p_client_request_id => p_client_request_id
      );

    end loop;

  end delete_selected_objects;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Package initialization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
  -- initialize parameters
  init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_OCI_OS";
/
