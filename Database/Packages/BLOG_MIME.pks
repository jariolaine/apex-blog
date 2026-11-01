create or replace package "BLOG_MIME"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Procedures and functions for file mime type
--
--  CREDITS:
--    https://asktom.oracle.com/pls/apex/asktom.search?tag=mime-type-using-blob-data
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  21.07.2025   Jari Laine     Created package.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  g_default_mime constant varchar2(100) := 'application/octet-stream';
--------------------------------------------------------------------------------
  function get_mime_type(
    p_file_name varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_MIME";
/
