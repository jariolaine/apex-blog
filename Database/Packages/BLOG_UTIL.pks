create or replace package "BLOG_UTIL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Provides utility procedures and functions for the public and administrative
--    blog applications. This includes error handling, string manipulation,
--    file operations, and support for application processes.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.04.2019   Jari Laine     Created package.
--  28.03.2020   Jari Laine     Added alternate signature for get_year_month.
--  15.04.2020   Jari Laine     Added function validate_comment.
--  26.04.2020   Jari Laine     Replaced validate_comment with APEX_UTIL.SAVEKEY_VC2.
--                              Removed redundant custom functions.
--  08.05.2020   Jari Laine     Marked get_year_month functions as obsolete.
--  10.05.2020   Jari Laine     Added procedures new_comment_notify, subscribe,
--                              and unsubscribe for comment replies.
--  11.05.2020   Jari Laine     Moved comment-related logic to BLOG_COMM package.
--  17.05.2020   Jari Laine     Added out parameters p_older_title and p_newer_title to get_post_pagination.
--                              Replaced materialized view BLOG_ITEMS_INIT with a view.
--                              Removed obsolete function get_item_init_value.
--  18.05.2020   Jari Laine     Moved ORDS-specific global constants.
--  19.05.2020   Jari Laine     Enhanced APEX debug logging and exception handling.
--                              Modified get_post_pagination to raise ORA-20901.
--                              Removed global constants.
--  23.05.2020   Jari Laine     Removed dependency on ORDS.
--  05.11.2020   Jari Laine     Added procedure render_dynamic_content.
--  18.12.2021   Jari Laine     Added procedure redirect_search.
--  24.03.2022   Jari Laine     Added parameter names to APEX_DEBUG calls.
--  25.03.2022   Jari Laine     Improved comments and renamed variables for clarity.
--                              Removed obsolete procedure check_archive_exists.
--  19.04.2022   Jari Laine     Enhanced download_file procedures.
--  26.04.2022   Jari Laine     Added parameter p_escape to function get_tag.
--  03.08.2022   Jari Laine     Updated render_dynamic_content to use APEX_UTIL.PRN.
--  16.11.2022   Jari Laine     Removed obsolete function get_post_title.
--  21.11.2022   Jari Laine     Added DETERMINISTIC clause to function int_to_vc2.
--  23.11.2022   Jari Laine     Improved exception handling in procedures.
--                              Renamed get_post_pagination to get_post_details.
--  24.11.2022   Jari Laine     Removed obsolete parameter p_escape.
--  29.11.2022   Jari Laine     Added procedure raise_http_error.
--                              Moved next/previous post logic to BLOG_V_POSTS view.
--  15.01.2023   Jari Laine     Removed procedure render_dynamic_content.
--  19.01.2023   Jari Laine     Renamed get_post_details parameters.
--                              Added global constants: g_nls_date_lang, g_iso_8601_date and g_rfc_2822_date.
--  08.04.2023   Jari Laine     Modified redirect_search to accept p_page_id.
--  05.09.2023   Jari Laine     Removed use of BLOG_T_POST type in get_post_details.
--  01.04.2024   Jari Laine     Added new global constants and variables.
--                              Minor changes to download_file.
--  10.04.2024   Jari Laine     Updated initialize_items procedure.
--  20.07.2024   Jari Laine     Added RESULT_CACHE for function get_attribute_value.
--  25.08.2024   Jari Laine     Added new function remove_whitespace.
--
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
