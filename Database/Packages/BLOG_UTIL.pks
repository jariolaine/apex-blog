create or replace package "BLOG_UTIL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Provides utility procedures and functions for the public and administrative
--    blog applications. This includes error handling, string manipulation,
--    file operations, and support for application processes.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  g_nls_date_lang constant varchar2(40) := 'NLS_DATE_LANGUAGE = ENGLISH';
  g_iso_8601_date constant varchar2(40) := 'YYYY-MM-DD"T"HH24:MI:SS"Z"';
  g_rfc_2822_date constant varchar2(40) := 'Dy, DD Mon YYYY HH24:MI:SS "GMT"';

  g_mime_rss      constant varchar2(40) := 'application/rss+xml';
  g_mime_atom     constant varchar2(40) := 'application/atom+xml';
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
--  inside package blog_cm and blog_comm
  function remove_whitespace(
    p_string            in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure raise_http_error(
    p_error_code      in number
  );
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application definition Error Handling Function
  function apex_error_handler(
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
-- Called from:
--  inside package and from other packages
  function int_to_vc2(
    p_value           in number
  ) return varchar2 deterministic;
--------------------------------------------------------------------------------
-- Called from:
--  other packages, public and admin application
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application process Initialize Items
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure get_post_details(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_post_desc       out nocopy varchar2,
    p_post_category   out nocopy varchar2,
    p_post_author     out nocopy varchar2,
    p_post_published  out nocopy varchar2,
    p_post_modified   out nocopy varchar2,
    p_next_post_id    out nocopy varchar2,
    p_next_post_title out nocopy varchar2,
    p_prev_post_id    out nocopy varchar2,
    p_prev_post_title out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 14 Pre-Rendering Computations
  function get_category_title(
    p_category_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 6 Pre-Rendering Computations
  function get_tag(
    p_tag_id          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  inside package and package BLOG_XML
  procedure download_file(
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "download"
  procedure download_file(
    p_file_path       in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app application process Redirect to search page
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_page_id         in varchar2 default 'SEARCH',
    p_session         in varchar2 default null
  );
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
