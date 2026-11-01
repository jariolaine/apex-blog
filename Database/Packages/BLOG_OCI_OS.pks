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
--  30.06.2025   Jari Laine     New function get_param_value
--                              Changes to procedure set_object_storage
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure set_object_storage(
    p_bucket_name       in varchar2,
    p_base_url          in varchar2,
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
