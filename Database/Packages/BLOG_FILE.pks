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
  function get_zip_name return varchar2;
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
