-- Database objects upgrade
--------------------------------------------------------
create or replace package "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures for Oracle Text operations, including
--    the generation of text datastores for posts and comments.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.06.2020   Jari Laine     Created package.
--  30.04.2022   Jari Laine     Updated procedure generate_post_datastore to utilize XML functions.
--  02.05.2022   Jari Laine     Improved function get_post_search to enhance text search query handling.
--  25.11.2022   Jari Laine     Updated procedure generate_post_datastore to remove HTML tags from post body.
--  17.07.2024   Jari Laine     Removed obsolete function get_post_search.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  );
--------------------------------------------------------------------------------
  procedure generate_comment_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  );
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
create or replace package "BLOG_INSTALL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    Procedures and functions for application install
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  10.05.2025   Jari Laine     Created package.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure settings_merge(
    p_attribute_name          in varchar2,
    p_display_seq             in number,
    p_is_nullable             in number,
    p_data_type               in varchar2,
    p_attribute_group_message in varchar2,
    p_int_min                 in number   default null,
    p_int_max                 in number   default null,
    p_build_option_name       in varchar2 default null,
    p_build_option_status     in varchar2 default null,
    p_attribute_value         in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure features_merge(
    p_build_option_name       in varchar2,
    p_is_active               in number,
    p_display_seq             in number,
    p_build_option_group      in varchar2,
    p_build_option_parent     in varchar2 default null,
    p_ref_build_option_name   in varchar2 default null,
    p_ref_build_option_status in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure list_of_values_ins(
    p_is_active               in number,
    p_display_seq             in number,
    p_lov_name                in varchar2,
    p_return_value            in varchar2,
    p_display_message         in varchar2
  );
--------------------------------------------------------------------------------
  procedure init_items_ins;
--------------------------------------------------------------------------------
end "BLOG_INSTALL";
/
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
create or replace package "BLOG_ADMIN"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures and functions for the Admin application,
--    including operations content handling, and utility functions.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  26.04.2019   Jari Laine     Created package.
--  10.01.2020   Jari Laine     Added procedures:
--                                - merge_files
--                                - file_upload
--  12.01.2020   Jari Laine     Added function prepare_file_path.
--  09.04.2020   Jari Laine     Updated procedures for case-insensitive tag handling.
--  09.05.2020   Jari Laine     Changed input parameters from NUMBER to VARCHAR2.
--                              Added functions:
--                                - get_comment_post_id
--                                - is_email
--  10.05.2020   Jari Laine     Added procedure send_reply_notify to notify replies.
--  12.05.2020   Jari Laine     Removed function prepare_file_path.
--  17.05.2020   Jari Laine     Removed parameter `p_err_mesg` from function get_first_paragraph.
--  19.05.2020   Jari Laine     Removed obsolete function get_post_title.
--  24.05.2020   Jari Laine     Added procedures:
--                                - run_settings_post_expression
--                                - run_feature_post_expression
--                                - update_feature
--  22.06.2020   Jari Laine     Fixed bug in function is_integer.
--                              Added parameters `p_min` and `p_max` to function is_integer.
--  30.09.2020   Jari Laine     Added procedure google_post_authentication.
--  28.11.2020   Jari Laine     Renamed google_post_authentication to post_authentication.
--                              Removed obsolete function get_comment_post_id.
--  28.02.2021   Jari Laine     Added function get_footer_link_seq.
--  23.05.2021   Jari Laine     Updated package to remove ORDS dependency.
--  21.03.2021   Jari Laine     Updated procedure get_blogger_details:
--                                - Fetch authorization group name from BLOG_SETTINGS table.
--                              Enhanced function remove_whitespace by adding TRIM.
--                              Updated add_category and add_tag to use remove_whitespace.
--  11.04.2021   Jari Laine     Moved send_reply_notify to package BLOG_COMM.
--  13.04.2021   Jari Laine     Renamed function get_footer_link_seq to get_modal_page_seq.
--                              Removed procedure run_feature_post_expression.
--                              Updated procedure post_authentication.
--  18.04.2021   Jari Laine     Moved function is_email to package BLOG_COMM.
--  05.01.2022   Jari Laine     Removed unused parameters/variables from:
--                                - post_authentication
--                                - update_feature
--                                - get_blogger_details
--                                - add_blogger
--  27.03.2022   Jari Laine     Fixed bug in get_first_paragraph for nested elements.
--                              Removed obsolete procedures:
--                                - remove_unused_tags
--                                - purge_post_preview
--                                - purge_post_preview_job
--                                - save_post_preview
--  13.04.2022   Jari Laine     Fixed error message handling in functions:
--                                - is_integer
--                                - is_url
--                                - is_date_format
--  01.05.2022   Jari Laine     Simplified logic in function request_to_post_status.
--  07.05.2022   Jari Laine     Added procedures:
--                                - remove_unused_tags
--                                - remove_unused_categories
--                              Changed add_tag from private to public.
--                              Removed obsolete functions:
--                                - get_post_tags
--                                - get_category_title
--                              Added procedures:
--                                - resequence_link_groups
--                                - resequence_links
--                                - resequence_categories
--                                - resequence_tags
--  09.05.2022   Jari Laine     Removed obsolete procedure run_settings_post_expression.
--  08.03.2023   Jari Laine     Updated function is_date_format to validate as DATE instead of TIMESTAMP.
--  03.04.2023   Jari Laine     Converted function file_upload to procedure with OUT parameter.
--  28.05.2023   Jari Laine     Added function request_to_post_success_message.
--  01.06.2023   Jari Laine     Removed procedure file_upload.
--                              Added function file_exists.
--                              Updated procedure merge_files.
--  30.07.2023   Jari Laine     Updated procedure post_authentication:
--                                - Check if workspace user is locked.
--                                - Replaced apex_util.set_build_option_status with
--                                  apex_application_admin.set_build_option_status.
--  10.03.2024   Jari Laine     Bug fix in post_authentication to check only the current workspace.
--  08.04.2024   Jari Laine     Removed functions:
--                                - request_to_post_success_message
--                                - request_to_link_success_message
--  11.04.2024   Jari Laine     Added procedure resequence_dynamic_content.
--  21.07.2024   Jari Laine     Added procedures:
--                                - update_feature (accepts build option name as parameter)
--                                - set_attribute_value
--                              Moved file repository-related procedures/functions to BLOG_FILE package.
--                              Removed procedure update_text_messages.
--  25.08.2024   Jari Laine     Moved function remove_whitespace to package BLOG_UTIL.
--  30.06.2025   Jari Laine     Changes to procedure update_feature
--  02.07.2025   Jari Laine     Package renamed BLOG_CM -> BLOG_ADMIN
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  admin app application authentication scheme Google
  procedure post_authentication;
--------------------------------------------------------------------------------
-- Called from:
--  admin app application processes
  procedure get_blogger_details(
    p_app_id            in varchar2,
    p_username          in varchar2,
    p_user_id           out nocopy number,
    p_name              out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  function get_category_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 52
  function get_link_grp_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 81
  function get_modal_page_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 51
  function get_link_seq(
    p_link_group_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function request_to_post_status(
    p_request           in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_first_paragraph(
    p_body_html         in clob
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12 Processing process "Process Category"
  procedure add_category(
    p_category_title    in varchar2,
    p_category_id       out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure remove_unused_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 16 and inside this package
  procedure add_tag(
    p_tag               in varchar2,
    p_tag_id            out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  procedure add_post_tags(
    p_post_id           in varchar2,
    p_tags              in varchar2,
    p_sep               in varchar2 default ','
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 15
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is Integer"
  function is_integer(
    p_value             in varchar2,
    p_min               in number,
    p_max               in number,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is URL"
  function is_url(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is date format"
  function is_date_format(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20011 Processing process "Features - Save Interactive Grid Data"
  procedure update_feature(
    p_app_id            in number,
    p_build_option_id   in number,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20017 and 20018
--  package blog_ai and blog_oci_os
  procedure update_feature(
    p_build_option_name in varchar2,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure resequence_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 16
  procedure resequence_tags(
    p_post_id           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_link_groups;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 50
  procedure resequence_links(
    p_link_group_id     in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 80
  procedure resequence_dynamic_content;
--------------------------------------------------------------------------------
-- Called from:
--
  procedure set_attribute_value(
    p_attribute_list    in apex_t_varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_ADMIN";
/
create or replace package "BLOG_PLUGIN"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    This package contains procedures for rendering, validating, and handling AJAX requests for APEX plugins.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.04.2019   Jari Laine     Created package.
--  03.01.2020   Jari Laine     Added comments to package specification.
--  13.04.2022   Jari Laine     Bug fix in validate_math_question_field.
--                              Improved error message handling.
--  07.05.2023   Jari Laine     Minor changes to enhance code readability.
--  17.07.2024   Jari Laine     Removed deprecated apex_plugin.get_input_name_for_page_item usage.
--                              Modified render procedure to pass label ID to JavaScript during load.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  );
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_ajax_param,
    p_result  in out nocopy apex_plugin.t_item_ajax_result
  );
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_validation_param,
    p_result  in out nocopy apex_plugin.t_item_validation_result
  );
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
create or replace package "BLOG_URL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    This package contains functions to generate various types of URLs
--    for the blog application. The URLs support different content types,
--    such as posts, categories, archives, tags, and dynamic pages,
--    while offering flexibility with canonical options and APEX integrations.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.04.2019   Jari Laine     Created package.
--  09.05.2020   Jari Laine     Changed number input/output parameters to VARCHAR2 for APEX usage.
--                              Added canonical URL parameter to functions.
--                              Created additional signatures for APEX usage.
--  10.05.2020   Jari Laine     Added new function get_unsubscribe.
--  19.05.2020   Jari Laine     Hardcoded page and item names.
--                              Removed global constants from BLOG_UTIL package.
--  23.05.2020   Jari Laine     Removed default value for get_tab parameter p_app_page_id.
--  13.11.2021   Jari Laine     Added functions get_sitemap_index, get_rss, and get_rss_xsl.
--  18.12.2021   Jari Laine     Moved procedure redirect_search to BLOG_UTIL.
--  14.03.2022   Jari Laine     Added new function get_canonical_host.
--  24.11.2022   Jari Laine     Added new function get_dynamic_page.
--                              Removed unused parameters from functions.
--                              Hardcoded values moved to package private constants.
--  18.11.2023   Jari Laine     Added new function get_atom.
--  01.04.2024   Jari Laine     Changed private constants to a JSON object.
--  23.07.2024   Jari Laine     Added new function get_file.
--  01.02.2025   Jari Laine     Added new procedure set_canonical_host and package initialization code.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function get_canonical_host return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
  function get_tab(
    p_page            in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_comm, blog_xml
-- view blog_v_posts
  function get_post(
    p_post_id         in number,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_post(
    p_post_id         in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_categories
  function get_category(
    p_category_id     in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_category(
    p_category_id     in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_archive_year
  function get_archive(
    p_archive_id      in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_archive(
    p_archive_id      in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_post_tags
  function get_tag(
    p_tag_id          in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_tag(
    p_tag_id          in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- view blog_v_dynamic_content
  function get_dynamic_page(
    p_content_id      in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_url, blog_xml
  function get_process(
    p_application     in varchar2 default null,
    p_process         in varchar2 default null,
    p_items           in varchar2 default null,
    p_values          in varchar2 default null,
    p_canonical       in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_comm
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
-- Blog Administration > Lists > Public Application Links
  function get_rss(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
-- Blog Administration > Lists > Public Application Links
  function get_atom(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_xml
  function get_rss_xsl(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  Blog Administration > Lists > Public Application Links
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  Blog Administration abd Public Application
  function get_file(
    p_file_path       in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
create or replace package "BLOG_COMMENT"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package provides procedures and functions for managing post comments,
--    including functionality for replying, flagging, email validation, and HTML content processing.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  11.05.2020   Jari Laine     Created package.
--  11.04.2021   Jari Laine     Added new procedure:
--                                - reply_notify
--                              Added new functions:
--                                - validate_email
--                                - is_email_verified
--  18.04.2021   Jari Laine     Added new function is_email.
--  30.10.2021   Jari Laine     Removed obsolete functions:
--                                - validate_email
--                                - is_email_verified
--  13.04.2022   Jari Laine     Enhanced flagging functionality:
--                                - Procedure flag_comment: Supports adding multiple flags.
--                                - Procedure unflag_comment: Supports removing multiple flags.
--  27.11.2022   Jari Laine     Updated procedure build_code_tab:
--                                - Removed leading and trailing line breaks from posted code.
--  15.08.2024   Jari Laine     Modified and renamed procedure:
--                                - remove_anchor to remove_html_tags
--                              Added new functions:
--                                - plain_text
--                                - short_text
--                              Updated procedure:
--                                - build_comment_html
--  02.07.2025   Jari Laine     Package renamed BLOG_COMM -> BLOG_COMMENTS
--
--  ============================================================================
--  TO DO:
--  ============================================================================
--  #1 Improve HTML validation for comment content.
--  #2 Enhance email validation logic to handle edge cases.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  --  admin app pages 62
  function plain_text(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --
  function short_text(
    p_string          in varchar2,
    p_plain_text      in boolean default true,
    p_str_length      in number default 100
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function format_comment(
    p_comment         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  --  admin app page 20012
  function is_email(
    p_email           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
--  admin app pages 61
  procedure flag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app pages 61
  procedure unflag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
  -- Called from:
  --  admin app pages 62
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure subscribe(
    p_post_id         in varchar2,
    p_email           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure unsubscribe(
    p_subscription_id in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure auto_approve(
    p_comment_id      in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_COMMENT";
/
create or replace package "BLOG_HTML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    This package contains functions and procedures for generating and returning
--    HTML code, including canonical links, meta tags, RSS/Atom links, and buttons.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.04.2019   Jari Laine     Created package.
--  29.04.2020   Jari Laine     Added function get_robots_noindex_meta.
--                              Updated canonical link functions to return
--                              robots noindex meta tag if canonical link generation fails.
--                              Added apex_debug to meta and canonical link functions.
--  10.05.2020   Jari Laine     Integrated blog_url functions for parameter p_canonical.
--  19.05.2020   Jari Laine     Removed obsolete function get_search_button.
--  06.07.2020   Jari Laine     Added parameter p_rss_url to functions get_rss_link and get_rss_anchor.
--                              Removed p_build_option_status parameter from get_rss_link.
--  13.11.2021   Jari Laine     Modified get_rss_anchor and get_rss_link.
--                              Removed obsolete functions.
--  27.03.2022   Jari Laine     Added parameters p_build_option and p_message to get_rss_link.
--                              Added p_message to get_rss_anchor.
--  27.04.2022   Jari Laine     Removed obsolete functions get_tag_anchor and get_post_tags.
--  16.11.2022   Jari Laine     Removed obsolete functions get_post_description_meta and get_description_meta.
--  25.11.2022   Jari Laine     Removed unused parameters.
--  30.07.2023   Jari Laine     Replaced apex_util.get_build_option_status with
--                              apex_application_admin.get_build_option_status.
--  18.11.2023   Jari Laine     Added new function get_atom_link.
--  01.04.2024   Jari Laine     Converted canonical link functions to procedures:
--                              - get_tab_canonical_link -> set_tab_canonical_link
--                              - get_post_canonical_link -> set_post_canonical_link
--                              - get_category_canonical_link -> set_category_canonical_link
--                              - get_archive_canonical_link -> set_archive_canonical_link
--                              - get_tag_canonical_link -> set_tag_canonical_link.
--  10.04.2024   Jari Laine     Added function get_page_canonical_link.
--                              Renamed procedures for canonical links as listed above.
--                              Updated get_rss_link and get_atom_link.
--  18.04.2024   Jari Laine     Added new function get_button.
--  01.02.2025   Jari Laine     Removed function get_page_canonical_link.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAB
  function set_tab_canonical_link(
    p_page            in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_POST
  function set_post_canonical_link(
    p_post_id         in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY
  function set_category_canonical_link(
    p_category_id     in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE
  function set_archive_canonical_link(
    p_archive_id      in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAG
  function set_tag_canonical_link(
    p_tag_id          in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_ANCHOR
  function get_rss_anchor(
    p_app_name        in varchar2,
    p_message         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_LINK
  function get_rss_link(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_message         in varchar2,
    p_build_option    in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_ATOM_LINK
  function get_atom_link(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_message         in varchar2,
    p_build_option    in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_button(
    p_app_id          in varchar2,
    p_title           in varchar2,
    p_action          in varchar2,
    p_icon_classes    in varchar2,
    p_button_classes  in varchar2 default null,
    p_build_option    in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure prn_html(
    p_markdown      in apex_application_global.vc_arr2
  );
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
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
create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Provides procedures and functions to generate and output RSS feeds, Atom feeds,
--    and various sitemap components (index, main, posts, categories, archives, and tags).
--
--  CHANGE LOG
--  ============================================================================
--    DATE        AUTHOR        DESCRIPTION
--    ----------  ------------  ------------------------------------------------
--    07.05.2019  Jari Laine    Created package.
--    08.01.2020  Jari Laine    Removed categories sitemap.
--                              Modified to use ORDS and blog version 4.
--    09.04.2020  Jari Laine    Updated to utilize blog_url function parameter p_canonical.
--    17.05.2020  Jari Laine    Removed private function get_app_alias and constant c_pub_app_id.
--                              Moved private function get_ords_service to the blog_ords package.
--    23.05.2020  Jari Laine    Changed sitemap_main to use the blog_pages table.
--                              Removed ORDS dependency.
--                              Added procedures:
--                                sitemap_categories
--                                sitemap_archives
--                                sitemap_tags
--    30.10.2021  Jari Laine    Modified sitemap_main to use the apex_application_pages view.
--    13.11.2021  Jari Laine    Changes to the rss procedure.
--    30.12.2021  Jari Laine    Modified rss_xsl; CSS file name moved to application settings.
--    05.01.2021  Jari Laine    Added parameter p_css_file to rss_xsl.
--    13.03.2022  Jari Laine    Added parameter p_process_name to sitemap_index.
--                              Removed build option check from XML query in sitemap_index.
--    19.04.2022  Jari Laine    Updates related to blog_util.download_file.
--    26.04.2022  Jari Laine    Added <lastmod> element to XML output for:
--                                sitemap_categories
--                                sitemap_archives
--                                sitemap_tags
--    28.04.2020  Jari Laine    Changes to rss_xsl.
--    29.11.2022  Jari Laine    Removed parameter p_lang from rss.
--                              Added exception handler to raise HTTP errors in relevant procedures.
--                              Minor refinements.
--    19.01.2023  Jari Laine    Removed parameter p_ws_images from rss_xsl.
--                              Removed parameter p_page_group from sitemap_main.
--                              Replaced private constants with global ones from blog_util:
--                                g_nls_date_lang
--                                g_iso_8601_date
--                                g_rfc_2822_date
--    30.07.2023  Jari Laine    Replaced apex_util.get_build_option_status with apex_application_admin.get_build_option_status.
--    12.11.2023  Jari Laine    Updates to rss and rss_xsl.
--    13.11.2023  Jari Laine    Added a new procedure: atom.
--    10.03.2024  Jari Laine    Enhanced rss_xsl to handle application file absolute URLs.
--    01.04.2024  Jari Laine    Added parameter p_page_group to sitemap_main.
--                              Updated package constants.
--                              Introduced new constant: c_headers
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xml"
  procedure rss(
    p_app_name      in varchar2,
    p_app_desc      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "atom.xml"
  procedure atom(
    p_app_name      in varchar2,
    p_app_desc      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xsl"
  procedure rss_xsl(
    p_css_file      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-index.xml"
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-main.xml"
  procedure sitemap_main(
    p_app_id        in varchar2,
    p_page_group    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-posts.xml"
  procedure sitemap_posts;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-categories.xml"
  procedure sitemap_categories;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-archives.xml"
  procedure sitemap_archives;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-tags.xml"
  procedure sitemap_tags;
--------------------------------------------------------------------------------
end "BLOG_XML";
/
create or replace package "BLOG_AI"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    Procedures and functions for AI-related functionalities
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  15.08.2025   Jari Laine     Created package.
--  30.06.2025   Jari Laine     New function get_param_value
--                              Changes to procedures:
--                                - set_gen_ai
--                                - init_params
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name      in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status    in varchar2,
    p_api_key         in varchar2,
    p_base_url        in varchar2,
    p_ai_model_name   in varchar2,
    p_ai_http_headers in varchar2,
    p_ai_attributes   in varchar2
  );
--------------------------------------------------------------------------------
  procedure gen_ai_chat(
    p_post            in varchar2,
    p_system_prompt   in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  Public app page 1001 and admin app 62
  procedure merge_sentiment(
    p_language        in varchar2,
    p_documents       in clob
  );
--------------------------------------------------------------------------------
  procedure get_lang_code(
    p_documents       in clob,
    p_lang_code       out nocopy varchar2
  );
--------------------------------------------------------------------------------
  procedure get_translation(
    p_documents       in clob,
    p_translation     out nocopy clob
  );
--------------------------------------------------------------------------------
end "BLOG_AI";
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_DYNAMIC_CONTENT
--------------------------------------------------------
create or replace force view blog_v_all_dynamic_content as
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.content_type      as content_type
  ,t1.display_seq       as display_seq
  ,t1.show_changed_on   as show_changed_on
  ,t1.content_desc      as content_desc
  ,t1.content_html      as content_html
from blog_dynamic_content t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FILES
--------------------------------------------------------
create or replace force view blog_v_all_files as
select
  t1.id                         as id
, t1.row_version                as row_version
, t1.created_on                 as created_on
, lower(t1.created_by)          as created_by
, t1.changed_on                 as changed_on
, lower(t1.changed_by)          as changed_by
, t1.is_active                  as is_active
, t1.is_download                as is_download
, t1.file_path                  as file_path
, t1.file_dir                   as file_dir
, t1.file_name                  as file_name
, t1.mime_type                  as mime_type
, t1.blob_content               as blob_content
, t1.file_size                  as file_size
, t1.file_charset               as file_charset
, t1.file_desc                  as file_desc
, t1.notes                      as notes
, t1.etag                       as etag
, t1.md5                        as md5
, t1.apex$row_sync_timestamp
, cast(
    t1.apex$row_sync_timestamp  as timestamp with local time zone
  )                             as sync_timestamp
, apex_string_util.to_display_filesize(
    p_size_in_bytes => t1.file_size
  )                             as file_size_display
, dbms_lob.getlength(
    lob_loc => coalesce( blob_content, empty_blob() )
  )                             as local_size
, case lkp.object_storage
    when 'INCLUDE'
    then
      case when lkp.proxy_url is null
        then lkp.bucket_url
        else lkp.proxy_url
      end || t1.file_path
    else
      blog_url.get_file(
        p_application => lkp.pub_app_id
      , p_file_path   => t1.file_path
      )
  end                           as file_url
from blog_files t1
cross join(
  select
      apex_application_admin.get_build_option_status(
        p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID')
      , p_build_option_name => 'BLOG_FEATURE_OCI_OBJECT_STORAGE'
      ) as object_storage
    , blog_util.get_attribute_value(
        p_attribute_name    => 'G_OCI_OS_BUCKET_URL'
      ) as bucket_url
    , blog_util.get_attribute_value(
        p_attribute_name    => 'G_OCI_OS_PROXY_URL'
      ) as proxy_url
    , blog_util.get_attribute_value(
        p_attribute_name    => 'G_PUB_APP_ID'
      ) as pub_app_id
  from dual
) lkp
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINKS
--------------------------------------------------------
create or replace force view blog_v_all_links as
select
  t1.id                   as id
, t1.row_version          as row_version
, t1.created_on           as created_on
, lower( t1.created_by )  as created_by
, t1.changed_on           as changed_on
, lower( t1.changed_by )  as changed_by
, t2.id                   as link_group_id
, t1.is_active            as is_active
, t2.is_active            as link_group_is_active
, t1.display_seq          as display_seq
, t2.display_seq          as link_group_display_seq
, t1.title                as title
, t2.title                as link_group_title
, t1.link_desc            as link_desc
, t1.notes                as notes
, t1.link_url             as link_url
, case t2.is_active
    when 1 then
      case t1.is_active
        when 1
        then 'ENABLED'
        else 'DISABLED'
        end
    else 'GROUP_DISABLED'
  end                     as link_status_code
, t1.is_active
  * t2.is_active          as link_is_active
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINK_GROUPS
--------------------------------------------------------
create or replace force view blog_v_all_link_groups as
select
   t1.id                  as id
  ,t1.row_version         as row_version
  ,t1.created_on          as created_on
  ,lower( t1.created_by ) as created_by
  ,t1.changed_on          as changed_on
  ,lower (t1.changed_by ) as changed_by
  ,t1.is_active           as is_active
  ,t1.display_seq         as display_seq
  ,t1.title               as title
  ,t1.title_unique        as title_unique
  ,t1.notes               as notes
  ,(
    select
      count(1) as cnt
    from blog_links lkp
    where lkp.link_group_id = t1.id
  )                       as link_count
from blog_link_groups t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POST_TAGS
--------------------------------------------------------
create or replace force view blog_v_all_post_tags as
select
   t1.id                        as id
  ,t1.row_version               as row_version
  ,t1.created_on                as created_on
  ,lower(t1.created_by)         as created_by
  ,t1.changed_on                as changed_on
  ,lower(t1.changed_by)         as changed_by
  ,t1.is_active                 as is_active
  ,t1.post_id                   as post_id
  ,t1.tag_id                    as tag_id
  ,t1.display_seq               as display_seq
  ,(
    select lkp.tag
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag
  ,(
    select lkp.is_active
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag_is_active
from blog_post_tags t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_TAGS
--------------------------------------------------------
create or replace force view blog_v_all_tags as
select
  t1.id                 as id
, t1.row_version        as row_version
, t1.created_on         as created_on
, lower(t1.created_by)  as created_by
, t1.changed_on         as changed_on
, lower(t1.changed_by)  as changed_by
, t1.is_active          as is_active
, t1.tag                as tag
, t1.tag_unique         as tag_unique
, t1.notes              as notes
, case t1.is_active
    when 1
      then c.txt_enabled
      else c.txt_disabled
  end                   as tag_status_text
, (
    select count(1)
    from blog_post_tags lkp
    where 1 = 1
    and lkp.tag_id = t1.id
   )                    as posts_count
, case
    when exists(
      select 1
      from blog_post_tags lkp
      where 1 = 1
      and lkp.tag_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_tags t1
cross join(
  select
    apex_lang.get_message( 'BLOG_TXT_ENABLED' )   as txt_enabled
  , apex_lang.get_message( 'BLOG_TXT_DISABLED' )  as txt_disabled
  from dual
) c
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_BLOGGERS
--------------------------------------------------------
create or replace force view blog_v_bloggers as
select t1.id        as blogger_id
  ,t1.display_seq   as display_seq
  ,t1.blogger_name  as blogger_name
  ,t1.blogger_desc  as blogger_desc
from blog_bloggers t1
where 1 = 1
and t1.show_desc = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_DYNAMIC_CONTENT
--------------------------------------------------------
create or replace force view blog_v_dynamic_content as
select
   t1.id              as content_id
  ,t1.content_type    as content_type
  ,t1.changed_on      as changed_on
  ,t1.display_seq     as display_seq
  ,t1.show_changed_on as show_changed_on
  ,t1.content_desc    as content_desc
  ,t1.content_html    as content_html
  ,blog_url.get_dynamic_page(
    p_content_id => t1.id
  )                   as content_url
from blog_dynamic_content t1
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_FEATURES
--------------------------------------------------------
create or replace force view blog_v_features as
select
  t1.id                       as id
, v1.application_id           as application_id
, v1.build_option_id          as build_option_id
, v1.last_updated_on          as last_updated_on
, lower( v1.last_updated_by ) as last_updated_by
, t1.display_seq              as display_seq
, t1.build_option_name        as build_option_name
, v1.build_option_status      as build_option_status
, t1.build_option_parent      as build_option_parent
, level                       as build_option_level
, case when connect_by_isleaf = 0
    then 'Y'
    else 'N'
  end                         as is_parent
, apex_lang.get_message(
    p_name => t1.build_option_name
  )                           as feature_desc
, regexp_replace(
    t1.build_option_name
  , '^(BLOG)'
  , '\1_HELP'
  )                           as help_message
-- HTML in query because IG removes HTML from column HTM expression in control break column
-- Contrel break is soretd and attribute data-sort-order gives correct sort order
, apex_string.format(
    p_message => '<span data-sort-order="%s" class="u-bold">%s</span>'
  , p0 => lpad( min( t1.display_seq ) over( partition by t1.build_option_group ), 6, '0' )
  , p1 =>
      apex_lang.get_message(
        p_name => t1.build_option_group
      )
  )                           as feature_group_html
, t1.build_option_group       as feature_group
from blog_features t1
join apex_application_build_options v1
  on t1.build_option_name = v1.build_option_name
where 1 = 1
  and t1.build_option_group != 'INTERNAL'
  and t1.is_active = 1
  and case
    when t1.ref_build_option_name is null
    then 1
    when apex_application_admin.get_build_option_status(
      p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID' )
    , p_build_option_name => t1.ref_build_option_name
    ) = t1.ref_build_option_status
    then 1
    else 0
  end = 1
start with t1.build_option_parent is null
connect by prior t1.build_option_name = t1.build_option_parent
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_FILES
--------------------------------------------------------
create or replace force view blog_v_files as
select
  t1.id             as file_id
, t1.row_version    as row_version
, t1.created_on     as created_on
, t1.changed_on     as changed_on
, t1.is_download    as is_download
, t1.file_name      as file_name
, t1.file_path      as file_path
, t1.mime_type      as mime_type
, t1.blob_content   as blob_content
, apex_string_util.to_display_filesize(
    p_size_in_bytes => t1.file_size
  )                 as file_size
, t1.file_charset   as file_charset
, t1.file_desc      as file_desc
, lkp.object_storage
, case lkp.object_storage
    when 'INCLUDE'
    then
      case when lkp.proxy_url is null
        then lkp.bucket_url || t1.file_path
        else lkp.proxy_url  || t1.file_path
      end
    else
      blog_url.get_file(
        p_file_path => t1.file_path
      )
  end             as file_url
from blog_files t1
cross join(
  select
      apex_application_admin.get_build_option_status(
        p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID')
      , p_build_option_name => 'BLOG_FEATURE_OCI_OBJECT_STORAGE'
    )  as object_storage
    , blog_util.get_attribute_value(
        p_attribute_name => 'G_OCI_OS_BUCKET_URL'
      ) as bucket_url
    , blog_util.get_attribute_value(
        p_attribute_name => 'G_OCI_OS_PROXY_URL'
      ) as proxy_url
  from dual
) lkp
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_INIT_ITEMS
--------------------------------------------------------
create or replace force view blog_v_init_items as
select
  i.application_id  as application_id
, i.item_name       as item_name
, s.attribute_value as attribute_value
, v( i.item_name )  as session_value
from blog_init_items i
join blog_settings s
  on i.item_name = s.attribute_name
where 1 = 1
and i.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_LINKS
--------------------------------------------------------
create or replace force view blog_v_links as
select
  t1.id             as link_id
, t2.id             as group_id
, t2.title          as group_title
, t2.display_seq    as group_display_seq
, t1.display_seq    as display_seq
, t1.title          as link_title
, t1.link_desc      as link_desc
, t1.link_url       as link_url
, t1.external_link
  + t1.target_blank as link_attr_code
, case t1.external_link + t1.target_blank
    when 2
    then 'target="_blank" rel="external"'
    when 1
    then
      case t1.external_link
      when 1
      then 'rel="external"'
      else 'target="_blank"'
    end
  end as link_attr
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_LOV
--------------------------------------------------------
create or replace force view blog_v_lov as
select
  t1.lov_name                                 as lov_name
, t1.display_seq                              as display_seq
, t1.return_value                             as return_value
, t1.display_message                          as display_message
, apex_lang.get_message( t1.display_message ) as display_value
from blog_list_of_values t1
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_TAGS
--------------------------------------------------------
create or replace force view blog_v_post_tags as
with q1 as(
  select --+ inline
     t2.post_id     as post_id
    ,t2.tag_id      as tag_id
    ,t2.display_seq as display_seq
    ,t1.tag         as tag
    ,greatest(
       t1.changed_on
      ,t2.changed_on
    )               as changed_on
  -- Generate tag URL
    ,blog_url.get_tag(
      p_tag_id => t1.id
    )               as tag_url
  -- Generate HTML for tags used in APEX reports
    ,xmlelement( "span"
      ,xmlattributes(
        't-Icon fa fa-tag'  as "class"
        ,'true'             as "aria-hidden"
      )
    )               as tag_icon
    ,xmlelement( "span"
      ,xmlattributes(
        't-Button-label'    as "class"
      )
      ,t1.tag
    )               as tag_label
  -- Tag CSS class
    ,'t-Button t-Button--icon t-Button--large t-Button--noUI t-Button--iconLeft' as tag_class
  from blog_tags t1
  join blog_post_tags t2 on t1.id = t2.tag_id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
)
select
   q1.post_id                         as post_id
  ,q1.tag_id                          as tag_id
  ,q1.display_seq                     as display_seq
  ,q1.tag                             as tag
  ,q1.changed_on                      as changed_on
  ,q1.tag_url                         as tag_url
-- Generate HTML for tags used in APEX reports
  ,xmlelement( "a"
    ,xmlattributes(
      q1.tag_url            as "href"
      ,'blog-search--tags'  as "class"
    )
    ,q1.tag
  )                                   as tag_html1
  ,xmlelement( "a"
    ,xmlattributes(
       q1.tag_url       as "href"
      ,q1.tag_class     as "class"
      ,'tag'            as "rel"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                   as tag_html2
  ,xmlelement( "span"
    ,xmlattributes(
      q1.tag_class      as "class"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                    as tag_html3
from q1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_VERSION
--------------------------------------------------------
create or replace force view blog_v_version as
select
  attribute_value                             as application_version
  ,to_number( substr( attribute_value, -8 ) ) as application_date
from blog_settings
where 1 = 1
and attribute_name = 'G_APP_VERSION'
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_CATEGORIES
--------------------------------------------------------
create or replace force view blog_v_all_categories as
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.display_seq       as display_seq
  ,t1.title             as title
  ,t1.title_unique      as title_unique
  ,t1.notes             as notes
  ,(
    select lkp.display_value
    from blog_v_lov lkp
    where lkp.lov_name = 'IS_ACTIVE'
      and to_number( lkp.return_value ) = t1.is_active
  )                     as category_status_text
  ,(
    select count(1)
    from blog_posts lkp
    where lkp.category_id = t1.id
   )                    as posts_count
  ,case
    when exists(
      select 1
      from blog_posts lkp
      where lkp.category_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_categories t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_all_comments as
with q1 as(
  select --+ inline
    t1.id
  , t1.row_version
  , t1.created_on
  , t1.created_by
  , t1.changed_on
  , t1.changed_by
  , t1.is_active
  , t1.post_id
  , t1.parent_id
  , t1.body_html
  , t1.comment_preview
  , t1.comment_by
  , t1.ctx_search
  , t1.rowid as ctx_rid
  , t2.sentiment_json
  , t2.sentiment_json.documentSentiment as sentiment
  , t2.sentiment_json.documentScores.Positive.number()  * 100 as positive_pct
  , t2.sentiment_json.documentScores.Neutral.number()   * 100 as neutral_pct
  , t2.sentiment_json.documentScores.Negative.number()  * 100 as negative_pct
  , t2.sentiment_json.documentScores.Mixed.number()     * 100 as mixed_pct
  , case
      when (
        select count(1)
        from blog_comment_flags f11
        where f11.flag = 'MODERATE'
          and f11.comment_id = t1.id
      ) > 0
        then 'MODERATE'
      when t1.is_active = 1
        then 'ENABLED'
        else 'DISABLED'
    end as comment_status_code
  , case
      when (
        select count(1)
        from blog_comment_flags f12
        where f12.flag = 'NEW'
          and f12.comment_id = t1.id
      ) > 0
        then 'NEW'
      when (
        select count(1)
        from blog_comment_flags f13
        where f13.flag = 'UNREAD'
          and f13.comment_id = t1.id
      ) > 0
        then 'UNREAD'
      when t1.parent_id is not null
        then 'REPLY'
        else 'READ'
    end as comment_flag_code
  from blog_comments t1
  left join blog_comment_sentiments t2 on t1.id = t2.comment_id
)
select
  q1.id                   as id
, q1.row_version          as row_version
, q1.created_on           as created_on
, lower( q1.created_by )  as created_by
, q1.changed_on           as changed_on
, lower( q1.changed_by )  as changed_by
, q1.is_active            as is_active
, q1.post_id              as post_id
, q1.parent_id            as parent_id
, q1.body_html            as body_html
, q1.comment_preview      as comment_preview
, q1.comment_by           as comment_by
, q1.ctx_search           as ctx_search
, q1.ctx_rid              as ctx_rid
, q1.comment_status_code  as comment_status_code
, q1.comment_flag_code    as comment_flag_code
, q1.sentiment_json       as sentiment_json
, q1.sentiment            as sentiment
, q1.positive_pct         as sentiment_positive_pct
, q1.neutral_pct          as sentiment_neutral_pct
, q1.negative_pct         as sentiment_negative_pct
, q1.mixed_pct            as sentiment_mixed_pct
, (
    select lkp.title
    from blog_posts lkp
    where 1 = 1
      and lkp.id = q1.post_id
  )                       as post_title
, case
    when q1.comment_flag_code in( 'NEW', 'UNREAD' )
      then 'true'
      else 'false'
  end                     as data_unread
-- lov return value fetch in view query because IR detail view
, (
    select
      lov1.display_value
    from blog_v_lov lov1
    where lov1.lov_name = 'COMMENT_STATUS'
      and lov1.return_value = q1.comment_status_code
  )                       as comment_status_text
, (
    select
      lov2.display_value
    from blog_v_lov lov2
    where lov2.lov_name = 'COMMENT_FLAG'
      and lov2.return_value = q1.comment_flag_code
  )                       as comment_flag_text
-- class names in view query for reusability
, case q1.comment_status_code
    when 'MODERATE'
      then 'fa-exclamation-circle u-warning-text'
    when 'ENABLED'
      then 'fa-check-circle u-success-text'
      else 'fa-minus-circle u-danger-text'
  end                     as comment_status_icon
, case q1.comment_flag_code
    when 'REPLY'
      then 'fa-send-o'
    when 'NEW'
      then 'fa-envelope-arrow-down'
    when 'UNREAD'
      then 'fa-envelope-o'
      else 'fa-envelope-open-o'
  end                     as comment_flag_icon
, case q1.sentiment
    when 'Mixed'
      then 'fa-emoji-astonished u-info-text'
    when 'Negative'
      then 'fa-emoji-angry u-danger-text'
    when 'Neutral'
      then 'fa-emoji-neutral u-normal-text'
    when 'Positive'
      then 'fa-emoji-pleased u-success-text'
      else 'fa-no-icon'
  end                     as sentiment_icon
, xmlserialize( content
    xmlforest(
      q1.comment_by as "commented_by"
    , apex_escape.striphtml(
        p_string => q1.body_html
      )             as "comment"
    )
  )                       as ctx_datastore
from q1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS
--------------------------------------------------------
create or replace force view blog_v_all_posts as
with q1 as(
  select --+ inline
     t1.id              as id
    ,t1.category_id     as category_id
    ,t1.blogger_id      as blogger_id
    ,t1.row_version     as row_version
    ,t1.created_on      as created_on
    ,t1.created_by      as created_by
    ,t1.changed_on      as changed_on
    ,t1.changed_by      as changed_by
    ,t3.blogger_name    as blogger_name
    ,t3.email           as blogger_email
    ,t2.title           as category_title
    ,t1.title           as title
    ,t1.post_desc       as post_desc
    ,t1.first_paragraph as first_paragraph
    ,t1.body_html       as body_html
    ,t1.body_length     as body_length
    ,t1.published_on    as published_on
    ,t1.notes           as notes
    ,t1.ctx_search      as ctx_search
    ,t1.rowid           as ctx_rid
    ,case t1.is_active * t2.is_active * t3.is_active
      when 1
      then t1.published_on
     end                as published_display
    ,case
      when t3.is_active = 0
        then 'BLOGGER_DISABLED'
      when t2.is_active = 0
        then 'CATEGORY_DISABLED'
      when t1.is_active = 0
        then 'DRAFT'
      when t1.published_on > localtimestamp
        then 'SCHEDULED'
        else 'PUBLISHED'
    end                 as post_status_code
  from blog_posts t1
  join blog_categories t2
    on t1.category_id = t2.id
  join blog_bloggers t3
    on t1.blogger_id = t3.id
  where 1 = 1
)
select
   q1.id                  as id
  ,q1.category_id         as category_id
  ,q1.blogger_id          as blogger_id
  ,q1.row_version         as row_version
  ,q1.created_on          as created_on
  ,lower( q1.created_by ) as created_by
  ,q1.changed_on          as changed_on
  ,lower( q1.changed_by ) as changed_by
  ,q1.blogger_name        as blogger_name
  ,q1.blogger_email       as blogger_email
  ,q1.category_title      as category_title
  ,q1.title               as title
  ,q1.post_desc           as post_desc
  ,q1.first_paragraph     as first_paragraph
  ,q1.body_html           as body_html
  ,q1.body_length         as body_length
  ,q1.published_on        as published_on
  ,q1.notes               as notes
  ,q1.published_display   as published_display
  ,q1.post_status_code    as post_status_code
  ,q1.ctx_search          as ctx_search
  ,q1.ctx_rid             as ctx_rid
  ,case q1.post_status_code
    when 'BLOGGER_DISABLED' then 'fa-stop-circle u-danger-text'
    when 'CATEGORY_DISABLED'then 'fa-minus-circle u-danger-text'
    when 'DRAFT'            then 'fa-pause-circle u-warning-text'
    when 'SCHEDULED'        then 'fa-clock-o u-info-text'
    when 'PUBLISHED'        then 'fa-check-circle u-success-text'
                            else 'fa-question-circle'
  end                     as post_status_icon
-- Workaround for IR detail view
  ,to_char(
     q1.published_on
    ,(
      select
        blog_util.get_attribute_value( 'P0_BLOG_POST_DATE_FORMAT' )
       from dual
    )
  )                       as detail_view_published
  ,(
     select
      listagg( tags.tag_id, ':' )  within group( order by tags.display_seq ) as tag_ids
     from blog_v_all_post_tags tags
     where 1 = 1
     and tags.post_id = q1.id
   )                      as tag_id
  ,(
    select
      listagg( tags.tag, ', ' )  within group( order by tags.display_seq ) as tags
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = q1.id
    and tags.is_active * tags.tag_is_active = 1
  )                       as visible_tags
  ,(
    select
      listagg( tags.tag, ', ' )  within group( order by tags.display_seq ) as tags
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = q1.id
    and tags.is_active * tags.tag_is_active = 0
  )                       as hidden_tags
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
  )                       as comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.is_active = 1
    and co.post_id  = q1.id
  )                       as published_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag in( 'NEW', 'UNREAD' )
      and x1.comment_id = co.id
    )
  )                       as unread_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                       as moderate_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and co.is_active = 0
    and not exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                       as disabled_comments_cnt
  ,(
    select
      lov.display_value
    from blog_v_lov lov
    where 1 = 1
      and lov.lov_name = 'POST_STATUS'
      and lov.return_value = q1.post_status_code
  )                       as post_status_txt
-- Post tags for admin app page 11 IR detail view
  ,(
    select
      xmlserialize(
        content xmlagg( lkp1.tag_html3 order by lkp1.display_seq )
      )
    from blog_v_post_tags lkp1
    where 1 = 1
      and lkp1.post_id = q1.id
  )                       as tags_html
  ,apex_escape.striphtml(
    p_string => q1.first_paragraph
  )                       as search_desc
-- XML for text index user datastore
  ,xmlserialize( content
    xmlforest(
      q1.blogger_name     as "author"
      ,q1.title           as "title"
      ,q1.category_title  as "category"
      ,q1.post_desc       as "description"
      --,q1.notes           as "notes"
      ,apex_escape.striphtml(
        p_string => q1.body_html
      )                   as "post"
      ,(
        select
          xmlagg( xmlforest( tags.tag as "tag" ) )
        from blog_v_all_post_tags tags
        where 1 = 1
        and tags.post_id = q1.id
        and tags.is_active * tags.tag_is_active = 1
      )                   as "tags"
    )
  )                       as ctx_datastore
from q1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_FORM_POSTS
--------------------------------------------------------
create or replace force view blog_v_form_posts as
select
  t1.id               as id
  ,t1.row_version     as row_version
  ,t1.blogger_id      as blogger_id
  ,t1.category_id     as category_id
  ,t1.first_paragraph as first_paragraph
  ,t1.is_active       as is_active
  ,t1.post_desc       as post_desc
  ,(
    select lkp.title
    from blog_categories lkp
    where 1 = 1
      and lkp.id = t1.category_id
  )                   as category_title
  ,(
    select
      listagg( lkp.tag, ',' )
        within group( order by lkp.display_seq )
    from blog_v_all_post_tags lkp
    where 1 = 1
      and lkp.post_id = t1.id
  )                   as tags
  ,t1.published_on    as published_on
  ,t1.title           as title
  ,t1.body_html       as body_html
  ,t1.notes           as notes
from blog_posts t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
create or replace force view blog_v_posts as
with q1 as(
  select --+ inline
     t1.id              as post_id
    ,t3.id              as category_id
    ,t2.id              as blogger_id
    ,t2.blogger_name    as blogger_name
    ,t1.title           as post_title
    ,t3.title           as category_title
    ,t1.post_desc       as post_desc
    ,t1.first_paragraph as first_paragraph
    ,t1.body_html       as body_html
    ,t1.published_on    as published_on
    ,t1.ctx_search      as ctx_search
    ,t1.changed_on      as changed_on
    ,t1.archive_year    as archive_year
    ,t3.display_seq     as category_seq
  from blog_posts t1
  join blog_bloggers t2
    on t1.blogger_id  = t2.id
  join blog_categories t3
    on t1.category_id = t3.id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
    and t3.is_active = 1
    and t1.published_on <= current_timestamp
)
select
   q1.post_id         as post_id
  ,q1.category_id     as category_id
  ,q1.blogger_id      as blogger_id
  ,q1.blogger_name    as blogger_name
  ,q1.post_title      as post_title
  ,q1.category_title  as category_title
  ,q1.post_desc       as post_desc
  ,q1.first_paragraph as first_paragraph
  ,q1.body_html       as body_html
  ,q1.published_on    as published_on
  ,q1.ctx_search      as ctx_search
  ,q1.changed_on      as changed_on
  ,q1.archive_year    as archive_year
  ,q1.category_seq    as category_seq
-- Generate post URL
  ,blog_url.get_post(
    p_post_id => q1.post_id
  )                   as post_url
-- Generate category URL
  ,blog_url.get_category(
    p_category_id => q1.category_id
  )                   as category_url
-- Aggregate tag HTML for post
  ,(
    select
      xmlserialize(
        content xmlagg( lkp_tag.tag_html1 order by lkp_tag.display_seq ) as varchar2(4000)
      ) as tags_html
    from blog_v_post_tags lkp_tag
    where 1 = 1
      and lkp_tag.post_id = q1.post_id
  )                   as tags_html1
  ,(
    select
      xmlserialize(
        content xmlagg( lkp_tag.tag_html2 order by lkp_tag.display_seq )
      ) as tags_html
    from blog_v_post_tags lkp_tag
    where 1 = 1
      and lkp_tag.post_id = q1.post_id
  )                   as tags_html2
-- Fetch next post id and title
  ,(
    select
      json_object(
         'post_id'    : lkp_next.post_id
        ,'post_title' : lkp_next.post_title
      ) as post
    from q1 lkp_next
    where 1 = 1
      and lkp_next.published_on > q1.published_on
    order by lkp_next.published_on asc
    fetch first 1 rows only
  )                   as next_post
-- Fetch previous post id and title
  ,(
    select
      json_object(
         'post_id'    : lkp_prev.post_id
        ,'post_title' : lkp_prev.post_title
      ) as post
    from q1 lkp_prev
    where 1 = 1
      and lkp_prev.published_on < q1.published_on
    order by lkp_prev.published_on desc
    fetch first 1 rows only
  )                   as prev_post
from q1
where 1 = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_SETTINGS
--------------------------------------------------------
create or replace force view blog_v_settings as
select
  t1.id                       as id
, t1.row_version              as row_version
, t1.changed_on               as changed_on
, lower(t1.changed_by)        as changed_by
, t1.is_nullable              as is_nullable
, t1.display_seq              as display_seq
, t1.attribute_name           as attribute_name
, apex_lang.get_message(
    p_name => t1.attribute_message
  )                           as attribute_desc
, t1.attribute_value          as attribute_value
, t1.data_type                as data_type
, t1.int_min                  as int_min
, t1.int_max                  as int_max
, t1.help_message             as help_message
, (
    select lov.display_value
    from blog_v_lov lov
    where lov.lov_name = 'YES_NO'
    and to_number( lov.return_value ) = ( t1.is_nullable - 1 ) * -1
  )                           as value_required
-- HTML in query because IG removes HTML from column HTM expression in control break column
-- Control break is sorted and attribute data-sort-order gives correct order
, apex_string.format(
    p_message => '<span data-sort-order="%s" class="u-bold">%s</span>'
  , p0 => lpad( min( t1.display_seq ) over( partition by t1.attribute_group_message ), 5, '0' )
  , p1 =>
      apex_lang.get_message(
        p_name => t1.attribute_group_message
      )
  )                           as attribute_group_html
, t1.attribute_group_message  as attribute_group
from blog_settings t1
where 1 = 1
  and case
    when t1.build_option_name is null
    then 1
    when apex_application_admin.get_build_option_status(
      p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID' )
    , p_build_option_name => t1.build_option_name
    ) = t1.build_option_status
    then 1
    else 0
  end = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
create or replace force view blog_v_archive_year as
select
   v1.archive_year      as archive_year
  ,count(1)             as post_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_archive(
    p_archive_id => v1.archive_year
  )                     as archive_url
  ,feat.show_post_count as show_post_count
  ,case feat.show_post_count
    when 'INCLUDE' then count(1)
  end                   as list_badge
  ,apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => v1.archive_year
  )                     as list_attr
from blog_v_posts v1
cross join(
  select
    apex_application_admin.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_ARCHIVE_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.archive_year
  ,feat.show_post_count
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
create or replace force view blog_v_categories as
select
   v1.category_id       as category_id
  ,v1.category_title    as category_title
  ,v1.category_seq      as display_seq
  ,count(1)             as posts_count
-- if category is changed, trigger tickles text index and post changes
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_category(
    p_category_id => v1.category_id
  )                     as category_url
  ,feat.show_post_count as show_post_count
  ,case feat.show_post_count
    when 'INCLUDE' then count(1)
  end                   as list_badge
  ,apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => v1.category_id
  )                     as list_attr
from blog_v_posts v1
cross join(
  select
    apex_application_admin.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_CATEGORY_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.category_id
  ,v1.category_title
  ,v1.category_seq
  ,feat.show_post_count
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_comments as
select
   t1.id          as comment_id
  ,t1.post_id     as post_id
  ,t1.parent_id   as parent_id
  ,t1.created_on  as created_on
  ,t1.comment_by  as comment_by
  ,(
    select
      post_title
    from blog_v_posts lkp
    where 1 = 1
    and lkp.post_id = t1.post_id
  )               as post_title
-- Generate post URL
  ,blog_url.get_post(
    p_post_id => t1.post_id
  )               as post_url
  ,t1.body_html   as comment_body
  ,t1.ctx_search  as ctx_search
  ,apex_string.get_initials(
    p_str => t1.comment_by
  )               as user_icon
  ,apex_string.format(
     p_message => 'u-color-%s'
    ,p0 => ora_hash( lower( t1.comment_by ), 44 ) + 1
  )               as icon_modifier
from blog_comments t1
where 1 = 1
  and t1.is_active = 1
  and not exists(
    select 1
    from blog_comment_flags x1
    where 1 = 1
      and x1.comment_id = t1.id
      and x1.flag = 'MODERATE'
  )
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_FORM_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_form_comments as
select
  t1.id
, t1.row_version
, t1.is_active
, t1.post_id
, t1.parent_id
, t1.body_html
, t1.comment_by
, (
    select
      lkp.sentiment_json.documentSentiment
    from blog_comment_sentiments lkp
    where 1 = 1
      and lkp.comment_id = t1.id
  ) as sentiment
, (
    select lkp.title
    from blog_posts lkp
    where 1 = 1
      and lkp.id = t1.post_id
  ) as post_title
, (
    select
      lkp.comment_status_code
    from blog_v_all_comments lkp
    where 1 = 1
      and lkp.id = t1.id
  ) as comment_status_code
from blog_comments t1
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST20
--------------------------------------------------------
create or replace force view blog_v_posts_last20 as
select
  rownum             as display_seq
, q1.post_id         as post_id
, q1.published_on    as published_on
, q1.blogger_name    as blogger_name
, q1.post_title      as post_title
, q1.post_desc       as post_desc
, q1.category_title  as category_title
, q1.post_url        as post_url
, q1.body_html       as body_html
, q1.absolute_url    as absolute_url
, apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => q1.post_id
  )                   as list_attr
from (
  select --+ first_rows(20)
    v1.post_id
  , v1.published_on
  , v1.blogger_name
  , v1.post_title
  , v1.post_desc
  , v1.category_title
  , v1.post_url
  , v1.body_html
  , blog_url.get_post(
      p_post_id     => v1.post_id
    , p_canonical  => 'YES'
    ) as absolute_url
  from blog_v_posts v1
  order by v1.published_on desc
) q1
where 1 = 1
  and rownum <= 20
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
create or replace force view blog_v_tags as
with q1 as(
  select
    v1.tag_id
  , v1.tag
  , v1.tag_url
  -- if tag is changed, trigger tickles text index and post changes
  , max( v2.changed_on ) as changed_on
  , count( 1 ) as posts_count
  from blog_v_post_tags v1
  join blog_v_posts v2 on v1.post_id = v2.post_id
  group by
    v1.tag_id
  , v1.tag
  , v1.tag_url
)
select
  q1.tag_id             as tag_id
, q1.tag                as tag
, q1.tag_url            as tag_url
, q1.posts_count        as posts_count
, q1.changed_on         as changed_on
, width_bucket(
    q1.posts_count
  , min( q1.posts_count ) over()
  , max( q1.posts_count ) over()
  , 7
  )                     as tag_bucket
, feat.show_post_count  as show_post_count
, case feat.show_post_count
    when 'INCLUDE' then q1.posts_count
  end                   as list_badge
-- Get feature tag post count status
from q1
cross join(
  select
    apex_application_admin.get_build_option_status(
      p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
    , p_build_option_name  => 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
with read only
/
--------------------------------------------------------
--  DDL for Trigger BLOG_BLOGGERS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_BLOGGERS_TRG"
before
insert or
update on blog_bloggers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_CATEGORIES_TRG"
before
insert or
update on blog_categories
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENTS_TRG"
before
insert or
update on blog_comments
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

  -- Generate comment preview
  :new.comment_preview := blog_comment.short_text( :new.body_html );

  -- tickle text index
  :new.ctx_search := 'X';

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENT_FLAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE TRIGGER "BLOG_COMMENT_FLAGS_TRG"
before
insert or
update on blog_comment_flags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT_SENTIMENTS_TRG"
before
insert or
update on blog_comment_sentiments
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENT_SUBSCRIBERS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT_SUBSCRIBERS_TRG"
before
insert or
update on blog_comment_subscribers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_DYNAMIC_CONTENT_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_DYNAMIC_CONTENT_TRG"
before
insert or
update on blog_dynamic_content
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_FEATURES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FEATURES_TRG"
before
insert or
update on blog_features
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_FILES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FILES_TRG"
before
insert or
update on blog_files
for each row
begin

  if inserting then

    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );

    :new.is_active    := coalesce( :new.is_active, 1 );
    :new.is_download  := coalesce( :new.is_download, 0 );

    :new.mime_type    := coalesce( :new.mime_type, blog_mime.get_mime_type( :new.file_name ) );

  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

  :new.file_size := coalesce( :new.file_size, coalesce( sys.dbms_lob.getlength( :new.blob_content ), 0 ) );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_INIT_ITEMS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_INIT_ITEMS_TRG"
before
insert or
update on blog_init_items
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LINKS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINKS_TRG"
before
insert or
update on blog_links
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LINK_GROUPS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINK_GROUPS_TRG"
before
insert or
update on blog_link_groups
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LIST_OF_VALUES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LIST_OF_VALUES_TRG"
before
insert or
update on blog_list_of_values
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_TRG"
before
insert or
update on blog_posts
for each row
begin

  if inserting then
    :new.id           := coalesce(
        :new.id
      , to_number( to_char( sys_extract_utc( localtimestamp ), 'YYYYMMDDHH24MISSFF6' ) )
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

  -- tickle text index
  :new.ctx_search   := 'X';

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_TAGS_TRG"
before
insert or
update on blog_post_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"
after
update on blog_categories
for each row
begin

-- if category is changed, update blog_posts table text index column
  update blog_posts t1
    set ctx_search = ctx_search
  where 1 = 1
    and :new.title_unique != :old.title_unique
    and t1.category_id = :new.id
  ;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POST_TAGS_TRG"
for
insert or
update or
delete on blog_post_tags
compound trigger

  t_post_id apex_t_number;

  after each row is
  begin

    -- if tag is removed from post, save post id for after statement handling
    if deleting
    then

      apex_string.push( t_post_id, :old.post_id );

    else

    -- if updating or inserting post tag, update blog_posts table text index column
      update blog_posts t1
        set ctx_search = ctx_search
      where 1 = 1
        and t1.id = :new.post_id
      ;

    end if;

  end after each row;

  after statement is
  begin

    -- handle removed tags and update blog_posts table text index column
    update blog_posts t1
      set ctx_search = ctx_search
    where 1 = 1
      and exists(
        select 1
        from table( t_post_id ) x1
        where 1 = 1
          and x1.column_value = t1.id
      )
    ;

  end after statement;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"
after
update on blog_tags
for each row
begin

  if :new.tag_unique != :old.tag_unique
  or :new.is_active != :old.is_active
  then

  -- if tag is changed, update blog_posts table text index column
    update blog_posts t1
      set ctx_search = ctx_search
    where 1 = 1
    and exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
        and x1.post_id = t1.id
        and x1.tag_id  = :new.id
      )
    ;

  end if;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_SETTINGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SETTINGS_TRG"
before
insert or
update on blog_settings
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_SUBSCRIBERS_EMAIL_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SUBSCRIBERS_EMAIL_TRG"
before
insert or
update on blog_subscribers_email
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_TAGS_TRG"
before
insert or
update on blog_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
create or replace package body "BLOG_CTX"
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
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  )
  as
  begin

    select
      ctx_datastore
    into tlob
    from blog_v_all_posts v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_comment_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  )
  as
  begin

    select
      ctx_datastore
    into tlob
    from blog_v_all_comments v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_comment_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
create or replace package body "BLOG_INSTALL"
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
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure settings_merge(
    p_attribute_name          in varchar2,
    p_display_seq             in number,
    p_is_nullable             in number,
    p_data_type               in varchar2,
    p_attribute_group_message in varchar2,
    p_int_min                 in number   default null,
    p_int_max                 in number   default null,
    p_build_option_name       in varchar2 default null,
    p_build_option_status     in varchar2 default null,
    p_attribute_value         in varchar2 default null
  )
  as
  begin

    merge into blog_settings
    using dual
    on( attribute_name = p_attribute_name )
    when not matched then
      insert ( attribute_name, display_seq, is_nullable, data_type, attribute_group_message, int_min, int_max, build_option_name, build_option_status, attribute_value )
        values( p_attribute_name, p_display_seq, p_is_nullable, p_data_type, p_attribute_group_message, p_int_min, p_int_max, p_build_option_name, p_build_option_status, p_attribute_value )
    when matched then
      update set
        display_seq = p_display_seq
      , is_nullable = p_is_nullable
      , data_type = p_data_type
      , attribute_group_message = p_attribute_group_message
      , int_min = p_int_min
      , int_max = p_int_max
      , build_option_name = p_build_option_name
      , build_option_status = p_build_option_status
    ;

  end settings_merge;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure features_merge(
    p_build_option_name       in varchar2,
    p_is_active               in number,
    p_display_seq             in number,
    p_build_option_group      in varchar2,
    p_build_option_parent     in varchar2 default null,
    p_ref_build_option_name   in varchar2 default null,
    p_ref_build_option_status in varchar2 default null
  )
  as
  begin

    merge into blog_features
    using dual
    on( build_option_name = p_build_option_name )
    when not matched then
      insert ( build_option_name, is_active, display_seq, build_option_group, build_option_parent, ref_build_option_name, ref_build_option_status )
        values( p_build_option_name, p_is_active, p_display_seq, p_build_option_group, p_build_option_parent, p_ref_build_option_name, p_ref_build_option_status )
    when matched then
      update set
        is_active = p_is_active
      , display_seq = p_display_seq
      , build_option_group = p_build_option_group
      , build_option_parent = p_build_option_parent
      , ref_build_option_name = p_ref_build_option_name
      , ref_build_option_status = p_ref_build_option_status
    ;

  end features_merge;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure list_of_values_ins(
    p_is_active       in number,
    p_display_seq     in number,
    p_lov_name        in varchar2,
    p_return_value    in varchar2,
    p_display_message in varchar2
  )
  as
  begin

    insert into blog_list_of_values( is_active, display_seq, lov_name, return_value, display_message )
      values( p_is_active, p_display_seq, p_lov_name, p_return_value, p_display_message )
    ;

  end list_of_values_ins;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure init_items_ins
  as
  begin

    insert into blog_init_items(is_active, application_id, item_name)
    select
      1                 as is_active
    , ai.application_id as application_id
    , ai.item_name      as item_name
    from apex_application_items ai
    join blog_settings s
      on ai.item_name = s.attribute_name
    where 1 = 1
      and exists(
        select 1
        from blog_settings x1
        where 1 = 1
          and x1.attribute_name in( 'G_ADMIN_APP_ID', 'G_PUB_APP_ID' )
          and to_number( x1.attribute_value ) = ai.application_id
      )
    union all
    select
      1                 as is_active
    , pi.application_id as application_id
    , pi.item_name      as item_name
    from apex_application_page_items pi
    join blog_settings s
      on pi.item_name = s.attribute_name
    where 1 = 1
      and exists(
        select 1
        from blog_settings x1
        where 1 = 1
          and x1.attribute_name in( 'G_ADMIN_APP_ID', 'G_PUB_APP_ID' )
          and to_number( x1.attribute_value ) = pi.application_id
      )
    order by 2, 3
    ;

  end init_items_ins;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_INSTALL";
/
create or replace package body "BLOG_MIME"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  type str_t is table of varchar2( 256 ) index by varchar2( 20 );
  mime_t str_t;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_mime_type(
    p_file_name in varchar2
  ) return varchar2
  as
    l_mime_type	varchar2(2000);
    l_extension varchar2(2000);
  begin

    l_extension := lower( apex_string_util.get_file_extension( '.' || p_file_name ) );
    l_mime_type := g_default_mime;

    if mime_t.exists( l_extension )
    then
      l_mime_type := lower( mime_t( l_extension ) );
    end if;

    return l_mime_type;

  end get_mime_type;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Package initialization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin

  mime_t('ez') := 'application/andrew-inset';
  mime_t('aw') := 'application/applixware';
  mime_t('atom') := 'application/atom+xml';
  mime_t('atomcat') := 'application/atomcat+xml';
  mime_t('atomsvc') := 'application/atomsvc+xml';
  mime_t('ccxml') := 'application/ccxml+xml';
  mime_t('cdmia') := 'application/cdmi-capability';
  mime_t('cdmic') := 'application/cdmi-container';
  mime_t('cdmid') := 'application/cdmi-domain';
  mime_t('cdmio') := 'application/cdmi-object';
  mime_t('cdmiq') := 'application/cdmi-queue';
  mime_t('cu') := 'application/cu-seeme';
  mime_t('davmount') := 'application/davmount+xml';
  mime_t('dbk') := 'application/docbook+xml';
  mime_t('dssc') := 'application/dssc+der';
  mime_t('xdssc') := 'application/dssc+xml';
  mime_t('ecma') := 'application/ecmascript';
  mime_t('emma') := 'application/emma+xml';
  mime_t('epub') := 'application/epub+zip';
  mime_t('exi') := 'application/exi';
  mime_t('pfr') := 'application/font-tdpfr';
  mime_t('gml') := 'application/gml+xml';
  mime_t('gpx') := 'application/gpx+xml';
  mime_t('gxf') := 'application/gxf';
  mime_t('stk') := 'application/hyperstudio';
  mime_t('ink') := 'application/inkml+xml';
  mime_t('inkml') := 'application/inkml+xml';
  mime_t('ipfix') := 'application/ipfix';
  mime_t('jar') := 'application/java-archive';
  mime_t('ser') := 'application/java-serialized-object';
  mime_t('class') := 'application/java-vm';
  mime_t('json') := 'application/json';
  mime_t('jsonml') := 'application/jsonml+json';
  mime_t('lostxml') := 'application/lost+xml';
  mime_t('hqx') := 'application/mac-binhex40';
  mime_t('cpt') := 'application/mac-compactpro';
  mime_t('mads') := 'application/mads+xml';
  mime_t('mrc') := 'application/marc';
  mime_t('mrcx') := 'application/marcxml+xml';
  mime_t('ma') := 'application/mathematica';
  mime_t('nb') := 'application/mathematica';
  mime_t('mb') := 'application/mathematica';
  mime_t('mathml') := 'application/mathml+xml';
  mime_t('mbox') := 'application/mbox';
  mime_t('mscml') := 'application/mediaservercontrol+xml';
  mime_t('metalink') := 'application/metalink+xml';
  mime_t('meta4') := 'application/metalink4+xml';
  mime_t('mets') := 'application/mets+xml';
  mime_t('mods') := 'application/mods+xml';
  mime_t('m21') := 'application/mp21';
  mime_t('mp21') := 'application/mp21';
  mime_t('mp4s') := 'application/mp4';
  mime_t('doc') := 'application/msword';
  mime_t('dot') := 'application/msword';
  mime_t('mxf') := 'application/mxf';
  mime_t('oda') := 'application/oda';
  mime_t('opf') := 'application/oebps-package+xml';
  mime_t('ogx') := 'application/ogg';
  mime_t('omdoc') := 'application/omdoc+xml';
  mime_t('onetoc') := 'application/onenote';
  mime_t('onetoc2') := 'application/onenote';
  mime_t('onetmp') := 'application/onenote';
  mime_t('onepkg') := 'application/onenote';
  mime_t('oxps') := 'application/oxps';
  mime_t('xer') := 'application/patch-ops-error+xml';
  mime_t('pdf') := 'application/pdf';
  mime_t('pgp') := 'application/pgp-encrypted';
  mime_t('asc') := 'application/pgp-signature';
  mime_t('sig') := 'application/pgp-signature';
  mime_t('prf') := 'application/pics-rules';
  mime_t('p10') := 'application/pkcs10';
  mime_t('p7m') := 'application/pkcs7-mime';
  mime_t('p7c') := 'application/pkcs7-mime';
  mime_t('p7s') := 'application/pkcs7-signature';
  mime_t('p8') := 'application/pkcs8';
  mime_t('ac') := 'application/pkix-attr-cert';
  mime_t('cer') := 'application/pkix-cert';
  mime_t('crl') := 'application/pkix-crl';
  mime_t('pkipath') := 'application/pkix-pkipath';
  mime_t('pki') := 'application/pkixcmp';
  mime_t('pls') := 'application/pls+xml';
  mime_t('ai') := 'application/postscript';
  mime_t('eps') := 'application/postscript';
  mime_t('ps') := 'application/postscript';
  mime_t('cww') := 'application/prs.cww';
  mime_t('pskcxml') := 'application/pskc+xml';
  mime_t('rdf') := 'application/rdf+xml';
  mime_t('rif') := 'application/reginfo+xml';
  mime_t('rnc') := 'application/relax-ng-compact-syntax';
  mime_t('rl') := 'application/resource-lists+xml';
  mime_t('rld') := 'application/resource-lists-diff+xml';
  mime_t('rs') := 'application/rls-services+xml';
  mime_t('gbr') := 'application/rpki-ghostbusters';
  mime_t('mft') := 'application/rpki-manifest';
  mime_t('roa') := 'application/rpki-roa';
  mime_t('rsd') := 'application/rsd+xml';
  mime_t('rss') := 'application/rss+xml';
  mime_t('rtf') := 'application/rtf';
  mime_t('sbml') := 'application/sbml+xml';
  mime_t('scq') := 'application/scvp-cv-request';
  mime_t('scs') := 'application/scvp-cv-response';
  mime_t('spq') := 'application/scvp-vp-request';
  mime_t('spp') := 'application/scvp-vp-response';
  mime_t('sdp') := 'application/sdp';
  mime_t('setpay') := 'application/set-payment-initiation';
  mime_t('setreg') := 'application/set-registration-initiation';
  mime_t('shf') := 'application/shf+xml';
  mime_t('smi') := 'application/smil+xml';
  mime_t('smil') := 'application/smil+xml';
  mime_t('rq') := 'application/sparql-query';
  mime_t('srx') := 'application/sparql-results+xml';
  mime_t('gram') := 'application/srgs';
  mime_t('grxml') := 'application/srgs+xml';
  mime_t('sru') := 'application/sru+xml';
  mime_t('ssdl') := 'application/ssdl+xml';
  mime_t('ssml') := 'application/ssml+xml';
  mime_t('tei') := 'application/tei+xml';
  mime_t('teicorpus') := 'application/tei+xml';
  mime_t('tfi') := 'application/thraud+xml';
  mime_t('tsd') := 'application/timestamped-data';
  mime_t('plb') := 'application/vnd.3gpp.pic-bw-large';
  mime_t('psb') := 'application/vnd.3gpp.pic-bw-small';
  mime_t('pvb') := 'application/vnd.3gpp.pic-bw-var';
  mime_t('tcap') := 'application/vnd.3gpp2.tcap';
  mime_t('pwn') := 'application/vnd.3m.post-it-notes';
  mime_t('aso') := 'application/vnd.accpac.simply.aso';
  mime_t('imp') := 'application/vnd.accpac.simply.imp';
  mime_t('acu') := 'application/vnd.acucobol';
  mime_t('atc') := 'application/vnd.acucorp';
  mime_t('acutc') := 'application/vnd.acucorp';
  mime_t('air') := 'application/vnd.adobe.air-application-installer-package+zip';
  mime_t('fcdt') := 'application/vnd.adobe.formscentral.fcdt';
  mime_t('fxp') := 'application/vnd.adobe.fxp';
  mime_t('fxpl') := 'application/vnd.adobe.fxp';
  mime_t('xdp') := 'application/vnd.adobe.xdp+xml';
  mime_t('xfdf') := 'application/vnd.adobe.xfdf';
  mime_t('ahead') := 'application/vnd.ahead.space';
  mime_t('azf') := 'application/vnd.airzip.filesecure.azf';
  mime_t('azs') := 'application/vnd.airzip.filesecure.azs';
  mime_t('azw') := 'application/vnd.amazon.ebook';
  mime_t('acc') := 'application/vnd.americandynamics.acc';
  mime_t('ami') := 'application/vnd.amiga.ami';
  mime_t('apk') := 'application/vnd.android.package-archive';
  mime_t('cii') := 'application/vnd.anser-web-certificate-issue-initiation';
  mime_t('fti') := 'application/vnd.anser-web-funds-transfer-initiation';
  mime_t('atx') := 'application/vnd.antix.game-component';
  mime_t('mpkg') := 'application/vnd.apple.installer+xml';
  mime_t('m3u8') := 'application/vnd.apple.mpegurl';
  mime_t('swi') := 'application/vnd.aristanetworks.swi';
  mime_t('iota') := 'application/vnd.astraea-software.iota';
  mime_t('aep') := 'application/vnd.audiograph';
  mime_t('mpm') := 'application/vnd.blueice.multipass';
  mime_t('bmi') := 'application/vnd.bmi';
  mime_t('rep') := 'application/vnd.businessobjects';
  mime_t('cdxml') := 'application/vnd.chemdraw+xml';
  mime_t('mmd') := 'application/vnd.chipnuts.karaoke-mmd';
  mime_t('cdy') := 'application/vnd.cinderella';
  mime_t('cla') := 'application/vnd.claymore';
  mime_t('rp9') := 'application/vnd.cloanto.rp9';
  mime_t('c4g') := 'application/vnd.clonk.c4group';
  mime_t('c4d') := 'application/vnd.clonk.c4group';
  mime_t('c4f') := 'application/vnd.clonk.c4group';
  mime_t('c4p') := 'application/vnd.clonk.c4group';
  mime_t('c4u') := 'application/vnd.clonk.c4group';
  mime_t('c11amc') := 'application/vnd.cluetrust.cartomobile-config';
  mime_t('c11amz') := 'application/vnd.cluetrust.cartomobile-config-pkg';
  mime_t('csp') := 'application/vnd.commonspace';
  mime_t('cdbcmsg') := 'application/vnd.contact.cmsg';
  mime_t('cmc') := 'application/vnd.cosmocaller';
  mime_t('clkx') := 'application/vnd.crick.clicker';
  mime_t('clkk') := 'application/vnd.crick.clicker.keyboard';
  mime_t('clkp') := 'application/vnd.crick.clicker.palette';
  mime_t('clkt') := 'application/vnd.crick.clicker.template';
  mime_t('clkw') := 'application/vnd.crick.clicker.wordbank';
  mime_t('wbs') := 'application/vnd.criticaltools.wbs+xml';
  mime_t('pml') := 'application/vnd.ctc-posml';
  mime_t('ppd') := 'application/vnd.cups-ppd';
  mime_t('car') := 'application/vnd.curl.car';
  mime_t('pcurl') := 'application/vnd.curl.pcurl';
  mime_t('dart') := 'application/vnd.dart';
  mime_t('rdz') := 'application/vnd.data-vision.rdz';
  mime_t('uvf') := 'application/vnd.dece.data';
  mime_t('uvvf') := 'application/vnd.dece.data';
  mime_t('uvd') := 'application/vnd.dece.data';
  mime_t('uvvd') := 'application/vnd.dece.data';
  mime_t('uvt') := 'application/vnd.dece.ttml+xml';
  mime_t('uvvt') := 'application/vnd.dece.ttml+xml';
  mime_t('uvx') := 'application/vnd.dece.unspecified';
  mime_t('uvvx') := 'application/vnd.dece.unspecified';
  mime_t('uvz') := 'application/vnd.dece.zip';
  mime_t('uvvz') := 'application/vnd.dece.zip';
  mime_t('fe_launch') := 'application/vnd.denovo.fcselayout-link';
  mime_t('dna') := 'application/vnd.dna';
  mime_t('mlp') := 'application/vnd.dolby.mlp';
  mime_t('dpg') := 'application/vnd.dpgraph';
  mime_t('dfac') := 'application/vnd.dreamfactory';
  mime_t('kpxx') := 'application/vnd.ds-keypoint';
  mime_t('ait') := 'application/vnd.dvb.ait';
  mime_t('svc') := 'application/vnd.dvb.service';
  mime_t('geo') := 'application/vnd.dynageo';
  mime_t('mag') := 'application/vnd.ecowin.chart';
  mime_t('nml') := 'application/vnd.enliven';
  mime_t('esf') := 'application/vnd.epson.esf';
  mime_t('msf') := 'application/vnd.epson.msf';
  mime_t('qam') := 'application/vnd.epson.quickanime';
  mime_t('slt') := 'application/vnd.epson.salt';
  mime_t('ssf') := 'application/vnd.epson.ssf';
  mime_t('es3') := 'application/vnd.eszigno3+xml';
  mime_t('et3') := 'application/vnd.eszigno3+xml';
  mime_t('ez2') := 'application/vnd.ezpix-album';
  mime_t('ez3') := 'application/vnd.ezpix-package';
  mime_t('fdf') := 'application/vnd.fdf';
  mime_t('mseed') := 'application/vnd.fdsn.mseed';
  mime_t('seed') := 'application/vnd.fdsn.seed';
  mime_t('dataless') := 'application/vnd.fdsn.seed';
  mime_t('gph') := 'application/vnd.flographit';
  mime_t('ftc') := 'application/vnd.fluxtime.clip';
  mime_t('fm') := 'application/vnd.framemaker';
  mime_t('frame') := 'application/vnd.framemaker';
  mime_t('maker') := 'application/vnd.framemaker';
  mime_t('book') := 'application/vnd.framemaker';
  mime_t('fnc') := 'application/vnd.frogans.fnc';
  mime_t('ltf') := 'application/vnd.frogans.ltf';
  mime_t('fsc') := 'application/vnd.fsc.weblaunch';
  mime_t('oas') := 'application/vnd.fujitsu.oasys';
  mime_t('oa2') := 'application/vnd.fujitsu.oasys2';
  mime_t('oa3') := 'application/vnd.fujitsu.oasys3';
  mime_t('fg5') := 'application/vnd.fujitsu.oasysgp';
  mime_t('bh2') := 'application/vnd.fujitsu.oasysprs';
  mime_t('ddd') := 'application/vnd.fujixerox.ddd';
  mime_t('xdw') := 'application/vnd.fujixerox.docuworks';
  mime_t('xbd') := 'application/vnd.fujixerox.docuworks.binder';
  mime_t('fzs') := 'application/vnd.fuzzysheet';
  mime_t('txd') := 'application/vnd.genomatix.tuxedo';
  mime_t('ggb') := 'application/vnd.geogebra.file';
  mime_t('ggs') := 'application/vnd.geogebra.slides';
  mime_t('ggt') := 'application/vnd.geogebra.tool';
  mime_t('gex') := 'application/vnd.geometry-explorer';
  mime_t('gre') := 'application/vnd.geometry-explorer';
  mime_t('gxt') := 'application/vnd.geonext';
  mime_t('g2w') := 'application/vnd.geoplan';
  mime_t('g3w') := 'application/vnd.geospace';
  mime_t('gmx') := 'application/vnd.gmx';
  mime_t('kml') := 'application/vnd.google-earth.kml+xml';
  mime_t('kmz') := 'application/vnd.google-earth.kmz';
  mime_t('gqf') := 'application/vnd.grafeq';
  mime_t('gqs') := 'application/vnd.grafeq';
  mime_t('gac') := 'application/vnd.groove-account';
  mime_t('ghf') := 'application/vnd.groove-help';
  mime_t('gim') := 'application/vnd.groove-identity-message';
  mime_t('grv') := 'application/vnd.groove-injector';
  mime_t('gtm') := 'application/vnd.groove-tool-message';
  mime_t('tpl') := 'application/vnd.groove-tool-template';
  mime_t('vcg') := 'application/vnd.groove-vcard';
  mime_t('hal') := 'application/vnd.hal+xml';
  mime_t('zmm') := 'application/vnd.handheld-entertainment+xml';
  mime_t('hbci') := 'application/vnd.hbci';
  mime_t('les') := 'application/vnd.hhe.lesson-player';
  mime_t('hpgl') := 'application/vnd.hp-hpgl';
  mime_t('hpid') := 'application/vnd.hp-hpid';
  mime_t('hps') := 'application/vnd.hp-hps';
  mime_t('jlt') := 'application/vnd.hp-jlyt';
  mime_t('pcl') := 'application/vnd.hp-pcl';
  mime_t('pclxl') := 'application/vnd.hp-pclxl';
  mime_t('sfd-hdstx') := 'application/vnd.hydrostatix.sof-data';
  mime_t('mpy') := 'application/vnd.ibm.minipay';
  mime_t('afp') := 'application/vnd.ibm.modcap';
  mime_t('listafp') := 'application/vnd.ibm.modcap';
  mime_t('list3820') := 'application/vnd.ibm.modcap';
  mime_t('irm') := 'application/vnd.ibm.rights-management';
  mime_t('sc') := 'application/vnd.ibm.secure-container';
  mime_t('icc') := 'application/vnd.iccprofile';
  mime_t('icm') := 'application/vnd.iccprofile';
  mime_t('igl') := 'application/vnd.igloader';
  mime_t('ivp') := 'application/vnd.immervision-ivp';
  mime_t('ivu') := 'application/vnd.immervision-ivu';
  mime_t('igm') := 'application/vnd.insors.igm';
  mime_t('xpw') := 'application/vnd.intercon.formnet';
  mime_t('xpx') := 'application/vnd.intercon.formnet';
  mime_t('i2g') := 'application/vnd.intergeo';
  mime_t('qbo') := 'application/vnd.intu.qbo';
  mime_t('qfx') := 'application/vnd.intu.qfx';
  mime_t('rcprofile') := 'application/vnd.ipunplugged.rcprofile';
  mime_t('irp') := 'application/vnd.irepository.package+xml';
  mime_t('xpr') := 'application/vnd.is-xpr';
  mime_t('fcs') := 'application/vnd.isac.fcs';
  mime_t('jam') := 'application/vnd.jam';
  mime_t('rms') := 'application/vnd.jcp.javame.midlet-rms';
  mime_t('jisp') := 'application/vnd.jisp';
  mime_t('joda') := 'application/vnd.joost.joda-archive';
  mime_t('ktz') := 'application/vnd.kahootz';
  mime_t('ktr') := 'application/vnd.kahootz';
  mime_t('karbon') := 'application/vnd.kde.karbon';
  mime_t('chrt') := 'application/vnd.kde.kchart';
  mime_t('kfo') := 'application/vnd.kde.kformula';
  mime_t('flw') := 'application/vnd.kde.kivio';
  mime_t('kon') := 'application/vnd.kde.kontour';
  mime_t('kpr') := 'application/vnd.kde.kpresenter';
  mime_t('kpt') := 'application/vnd.kde.kpresenter';
  mime_t('ksp') := 'application/vnd.kde.kspread';
  mime_t('kwd') := 'application/vnd.kde.kword';
  mime_t('kwt') := 'application/vnd.kde.kword';
  mime_t('htke') := 'application/vnd.kenameaapp';
  mime_t('kia') := 'application/vnd.kidspiration';
  mime_t('kne') := 'application/vnd.kinar';
  mime_t('knp') := 'application/vnd.kinar';
  mime_t('skp') := 'application/vnd.koan';
  mime_t('skd') := 'application/vnd.koan';
  mime_t('skt') := 'application/vnd.koan';
  mime_t('skm') := 'application/vnd.koan';
  mime_t('sse') := 'application/vnd.kodak-descriptor';
  mime_t('lasxml') := 'application/vnd.las.las+xml';
  mime_t('lbd') := 'application/vnd.llamagraphics.life-balance.desktop';
  mime_t('lbe') := 'application/vnd.llamagraphics.life-balance.exchange+xml';
  mime_t('123') := 'application/vnd.lotus-1-2-3';
  mime_t('apr') := 'application/vnd.lotus-approach';
  mime_t('pre') := 'application/vnd.lotus-freelance';
  mime_t('nsf') := 'application/vnd.lotus-notes';
  mime_t('org') := 'application/vnd.lotus-organizer';
  mime_t('scm') := 'application/vnd.lotus-screencam';
  mime_t('lwp') := 'application/vnd.lotus-wordpro';
  mime_t('portpkg') := 'application/vnd.macports.portpkg';
  mime_t('mcd') := 'application/vnd.mcd';
  mime_t('mc1') := 'application/vnd.medcalcdata';
  mime_t('cdkey') := 'application/vnd.mediastation.cdkey';
  mime_t('mwf') := 'application/vnd.mfer';
  mime_t('mfm') := 'application/vnd.mfmp';
  mime_t('flo') := 'application/vnd.micrografx.flo';
  mime_t('igx') := 'application/vnd.micrografx.igx';
  mime_t('mif') := 'application/vnd.mif';
  mime_t('daf') := 'application/vnd.mobius.daf';
  mime_t('dis') := 'application/vnd.mobius.dis';
  mime_t('mbk') := 'application/vnd.mobius.mbk';
  mime_t('mqy') := 'application/vnd.mobius.mqy';
  mime_t('msl') := 'application/vnd.mobius.msl';
  mime_t('plc') := 'application/vnd.mobius.plc';
  mime_t('txf') := 'application/vnd.mobius.txf';
  mime_t('mpn') := 'application/vnd.mophun.application';
  mime_t('mpc') := 'application/vnd.mophun.certificate';
  mime_t('xul') := 'application/vnd.mozilla.xul+xml';
  mime_t('cil') := 'application/vnd.ms-artgalry';
  mime_t('cab') := 'application/vnd.ms-cab-compressed';
  mime_t('xls') := 'application/vnd.ms-excel';
  mime_t('xlm') := 'application/vnd.ms-excel';
  mime_t('xla') := 'application/vnd.ms-excel';
  mime_t('xlc') := 'application/vnd.ms-excel';
  mime_t('xlt') := 'application/vnd.ms-excel';
  mime_t('xlw') := 'application/vnd.ms-excel';
  mime_t('xlam') := 'application/vnd.ms-excel.addin.macroenabled.12';
  mime_t('xlsb') := 'application/vnd.ms-excel.sheet.binary.macroenabled.12';
  mime_t('xlsm') := 'application/vnd.ms-excel.sheet.macroenabled.12';
  mime_t('xltm') := 'application/vnd.ms-excel.template.macroenabled.12';
  mime_t('eot') := 'application/vnd.ms-fontobject';
  mime_t('chm') := 'application/vnd.ms-htmlhelp';
  mime_t('ims') := 'application/vnd.ms-ims';
  mime_t('lrm') := 'application/vnd.ms-lrm';
  mime_t('thmx') := 'application/vnd.ms-officetheme';
  mime_t('cat') := 'application/vnd.ms-pki.seccat';
  mime_t('stl') := 'application/vnd.ms-pki.stl';
  mime_t('ppt') := 'application/vnd.ms-powerpoint';
  mime_t('pps') := 'application/vnd.ms-powerpoint';
  mime_t('pot') := 'application/vnd.ms-powerpoint';
  mime_t('ppam') := 'application/vnd.ms-powerpoint.addin.macroenabled.12';
  mime_t('pptm') := 'application/vnd.ms-powerpoint.presentation.macroenabled.12';
  mime_t('sldm') := 'application/vnd.ms-powerpoint.slide.macroenabled.12';
  mime_t('ppsm') := 'application/vnd.ms-powerpoint.slideshow.macroenabled.12';
  mime_t('wav') := 'audio/x-wav';
  mime_t('xm') := 'audio/xm';
  mime_t('cdx') := 'chemical/x-cdx';
  mime_t('cif') := 'chemical/x-cif';
  mime_t('cmdf') := 'chemical/x-cmdf';
  mime_t('cml') := 'chemical/x-cml';
  mime_t('csml') := 'chemical/x-csml';
  mime_t('xyz') := 'chemical/x-xyz';
  mime_t('ttc') := 'font/collection';
  mime_t('otf') := 'font/otf';
  mime_t('ttf') := 'font/ttf';
  mime_t('woff') := 'font/woff';
  mime_t('woff2') := 'font/woff2';
  mime_t('avif') := 'image/avif';
  mime_t('bmp') := 'image/bmp';
  mime_t('cgm') := 'image/cgm';
  mime_t('g3') := 'image/g3fax';
  mime_t('gif') := 'image/gif';
  mime_t('ief') := 'image/ief';
  mime_t('jpeg') := 'image/jpeg';
  mime_t('jpg') := 'image/jpeg';
  mime_t('jpe') := 'image/jpeg';
  mime_t('ktx') := 'image/ktx';
  mime_t('png') := 'image/png';
  mime_t('btif') := 'image/prs.btif';
  mime_t('sgi') := 'image/sgi';
  mime_t('svg') := 'image/svg+xml';
  mime_t('svgz') := 'image/svg+xml';
  mime_t('tiff') := 'image/tiff';
  mime_t('tif') := 'image/tiff';
  mime_t('psd') := 'image/vnd.adobe.photoshop';
  mime_t('uvi') := 'image/vnd.dece.graphic';
  mime_t('uvvi') := 'image/vnd.dece.graphic';
  mime_t('uvg') := 'image/vnd.dece.graphic';
  mime_t('uvvg') := 'image/vnd.dece.graphic';
  mime_t('djvu') := 'image/vnd.djvu';
  mime_t('djv') := 'image/vnd.djvu';
  mime_t('sub') := 'image/vnd.dvb.subtitle';
  mime_t('dwg') := 'image/vnd.dwg';
  mime_t('dxf') := 'image/vnd.dxf';
  mime_t('fbs') := 'image/vnd.fastbidsheet';
  mime_t('fpx') := 'image/vnd.fpx';
  mime_t('fst') := 'image/vnd.fst';
  mime_t('mmr') := 'image/vnd.fujixerox.edmics-mmr';
  mime_t('rlc') := 'image/vnd.fujixerox.edmics-rlc';
  mime_t('mdi') := 'image/vnd.ms-modi';
  mime_t('wdp') := 'image/vnd.ms-photo';
  mime_t('npx') := 'image/vnd.net-fpx';
  mime_t('wbmp') := 'image/vnd.wap.wbmp';
  mime_t('xif') := 'image/vnd.xiff';
  mime_t('webp') := 'image/webp';
  mime_t('3ds') := 'image/x-3ds';
  mime_t('ras') := 'image/x-cmu-raster';
  mime_t('cmx') := 'image/x-cmx';
  mime_t('fh') := 'image/x-freehand';
  mime_t('fhc') := 'image/x-freehand';
  mime_t('fh4') := 'image/x-freehand';
  mime_t('fh5') := 'image/x-freehand';
  mime_t('fh7') := 'image/x-freehand';
  mime_t('ico') := 'image/x-icon';
  mime_t('sid') := 'image/x-mrsid-image';
  mime_t('pcx') := 'image/x-pcx';
  mime_t('pic') := 'image/x-pict';
  mime_t('pct') := 'image/x-pict';
  mime_t('pnm') := 'image/x-portable-anymap';
  mime_t('pbm') := 'image/x-portable-bitmap';
  mime_t('pgm') := 'image/x-portable-graymap';
  mime_t('ppm') := 'image/x-portable-pixmap';
  mime_t('rgb') := 'image/x-rgb';
  mime_t('tga') := 'image/x-tga';
  mime_t('xbm') := 'image/x-xbitmap';
  mime_t('xpm') := 'image/x-xpixmap';
  mime_t('xwd') := 'image/x-xwindowdump';
  mime_t('eml') := 'message/rfc822';
  mime_t('mime') := 'message/rfc822';
  mime_t('igs') := 'model/iges';
  mime_t('iges') := 'model/iges';
  mime_t('msh') := 'model/mesh';
  mime_t('mesh') := 'model/mesh';
  mime_t('silo') := 'model/mesh';
  mime_t('dae') := 'model/vnd.collada+xml';
  mime_t('dwf') := 'model/vnd.dwf';
  mime_t('gdl') := 'model/vnd.gdl';
  mime_t('gtw') := 'model/vnd.gtw';
  mime_t('vtu') := 'model/vnd.vtu';
  mime_t('wrl') := 'model/vrml';
  mime_t('vrml') := 'model/vrml';
  mime_t('x3db') := 'model/x3d+binary';
  mime_t('x3dbz') := 'model/x3d+binary';
  mime_t('x3dv') := 'model/x3d+vrml';
  mime_t('x3dvz') := 'model/x3d+vrml';
  mime_t('x3d') := 'model/x3d+xml';
  mime_t('x3dz') := 'model/x3d+xml';
  mime_t('appcache') := 'text/cache-manifest';
  mime_t('ics') := 'text/calendar';
  mime_t('ifb') := 'text/calendar';
  mime_t('css') := 'text/css';
  mime_t('csv') := 'text/csv';
  mime_t('html') := 'text/html';
  mime_t('htm') := 'text/html';
  mime_t('js') := 'text/javascript';
  mime_t('mjs') := 'text/javascript';
  mime_t('n3') := 'text/n3';
  mime_t('txt') := 'text/plain';
  mime_t('text') := 'text/plain';
  mime_t('conf') := 'text/plain';
  mime_t('def') := 'text/plain';
  mime_t('list') := 'text/plain';
  mime_t('log') := 'text/plain';
  mime_t('in') := 'text/plain';
  mime_t('dsc') := 'text/prs.lines.tag';
  mime_t('rtx') := 'text/richtext';
  mime_t('sgml') := 'text/sgml';
  mime_t('sgm') := 'text/sgml';
  mime_t('tsv') := 'text/tab-separated-values';
  mime_t('t') := 'text/troff';
  mime_t('tr') := 'text/troff';
  mime_t('roff') := 'text/troff';
  mime_t('man') := 'text/troff';
  mime_t('me') := 'text/troff';
  mime_t('ms') := 'text/troff';
  mime_t('ttl') := 'text/turtle';
  mime_t('uri') := 'text/uri-list';
  mime_t('uris') := 'text/uri-list';
  mime_t('urls') := 'text/uri-list';
  mime_t('vcard') := 'text/vcard';
  mime_t('curl') := 'text/vnd.curl';
  mime_t('dcurl') := 'text/vnd.curl.dcurl';
  mime_t('mcurl') := 'text/vnd.curl.mcurl';
  mime_t('scurl') := 'text/vnd.curl.scurl';
  mime_t('sub') := 'text/vnd.dvb.subtitle';
  mime_t('fly') := 'text/vnd.fly';
  mime_t('flx') := 'text/vnd.fmi.flexstor';
  mime_t('gv') := 'text/vnd.graphviz';
  mime_t('3dml') := 'text/vnd.in3d.3dml';
  mime_t('spot') := 'text/vnd.in3d.spot';
  mime_t('jad') := 'text/vnd.sun.j2me.app-descriptor';
  mime_t('wml') := 'text/vnd.wap.wml';
  mime_t('wmls') := 'text/vnd.wap.wmlscript';
  mime_t('s') := 'text/x-asm';
  mime_t('asm') := 'text/x-asm';
  mime_t('c') := 'text/x-c';
  mime_t('cc') := 'text/x-c';
  mime_t('cxx') := 'text/x-c';
  mime_t('cpp') := 'text/x-c';
  mime_t('h') := 'text/x-c';
  mime_t('hh') := 'text/x-c';
  mime_t('dic') := 'text/x-c';
  mime_t('f') := 'text/x-fortran';
  mime_t('for') := 'text/x-fortran';
  mime_t('f77') := 'text/x-fortran';
  mime_t('f90') := 'text/x-fortran';
  mime_t('java') := 'text/x-java-source';
  mime_t('nfo') := 'text/x-nfo';
  mime_t('opml') := 'text/x-opml';
  mime_t('p') := 'text/x-pascal';
  mime_t('pas') := 'text/x-pascal';
  mime_t('etx') := 'text/x-setext';
  mime_t('sfv') := 'text/x-sfv';
  mime_t('uu') := 'text/x-uuencode';
  mime_t('vcs') := 'text/x-vcalendar';
  mime_t('vcf') := 'text/x-vcard';
  mime_t('3gp') := 'video/3gpp';
  mime_t('3g2') := 'video/3gpp2';
  mime_t('h261') := 'video/h261';
  mime_t('h263') := 'video/h263';
  mime_t('h264') := 'video/h264';
  mime_t('jpgv') := 'video/jpeg';
  mime_t('jpm') := 'video/jpm';
  mime_t('jpgm') := 'video/jpm';
  mime_t('mj2') := 'video/mj2';
  mime_t('mjp2') := 'video/mj2';
  mime_t('ts') := 'video/mp2t';
  mime_t('m2t') := 'video/mp2t';
  mime_t('m2ts') := 'video/mp2t';
  mime_t('mts') := 'video/mp2t';
  mime_t('mp4') := 'video/mp4';
  mime_t('mp4v') := 'video/mp4';
  mime_t('mpg4') := 'video/mp4';
  mime_t('mpeg') := 'video/mpeg';
  mime_t('mpg') := 'video/mpeg';
  mime_t('mpe') := 'video/mpeg';
  mime_t('m1v') := 'video/mpeg';
  mime_t('m2v') := 'video/mpeg';
  mime_t('ogv') := 'video/ogg';
  mime_t('qt') := 'video/quicktime';
  mime_t('mov') := 'video/quicktime';
  mime_t('uvh') := 'video/vnd.dece.hd';
  mime_t('uvvh') := 'video/vnd.dece.hd';
  mime_t('uvm') := 'video/vnd.dece.mobile';
  mime_t('uvvm') := 'video/vnd.dece.mobile';
  mime_t('uvp') := 'video/vnd.dece.pd';
  mime_t('uvvp') := 'video/vnd.dece.pd';
  mime_t('uvs') := 'video/vnd.dece.sd';
  mime_t('uvvs') := 'video/vnd.dece.sd';
  mime_t('uvv') := 'video/vnd.dece.video';
  mime_t('uvvv') := 'video/vnd.dece.video';
  mime_t('dvb') := 'video/vnd.dvb.file';
  mime_t('fvt') := 'video/vnd.fvt';
  mime_t('mxu') := 'video/vnd.mpegurl';
  mime_t('m4u') := 'video/vnd.mpegurl';
  mime_t('pyv') := 'video/vnd.ms-playready.media.pyv';
  mime_t('uvu') := 'video/vnd.uvvu.mp4';
  mime_t('uvvu') := 'video/vnd.uvvu.mp4';
  mime_t('viv') := 'video/vnd.vivo';
  mime_t('webm') := 'video/webm';
  mime_t('f4v') := 'video/x-f4v';
  mime_t('fli') := 'video/x-fli';
  mime_t('flv') := 'video/x-flv';
  mime_t('m4v') := 'video/x-m4v';
  mime_t('mkv') := 'video/x-matroska';
  mime_t('mk3d') := 'video/x-matroska';
  mime_t('mks') := 'video/x-matroska';
  mime_t('mng') := 'video/x-mng';
  mime_t('asf') := 'video/x-ms-asf';
  mime_t('asx') := 'video/x-ms-asf';
  mime_t('vob') := 'video/x-ms-vob';
  mime_t('wm') := 'video/x-ms-wm';
  mime_t('wmv') := 'video/x-ms-wmv';
  mime_t('wmx') := 'video/x-ms-wmx';
  mime_t('wvx') := 'video/x-ms-wvx';
  mime_t('avi') := 'video/x-msvideo';
  mime_t('movie') := 'video/x-sgi-movie';
  mime_t('smv') := 'video/x-smv';
  mime_t('ice') := 'x-conference/x-cooltalk';
  mime_t('potm') := 'application/vnd.ms-powerpoint.template.macroenabled.12';
  mime_t('mpp') := 'application/vnd.ms-project';
  mime_t('mpt') := 'application/vnd.ms-project';
  mime_t('docm') := 'application/vnd.ms-word.document.macroenabled.12';
  mime_t('dotm') := 'application/vnd.ms-word.template.macroenabled.12';
  mime_t('wps') := 'application/vnd.ms-works';
  mime_t('wks') := 'application/vnd.ms-works';
  mime_t('wcm') := 'application/vnd.ms-works';
  mime_t('wdb') := 'application/vnd.ms-works';
  mime_t('wpl') := 'application/vnd.ms-wpl';
  mime_t('xps') := 'application/vnd.ms-xpsdocument';
  mime_t('mseq') := 'application/vnd.mseq';
  mime_t('mus') := 'application/vnd.musician';
  mime_t('msty') := 'application/vnd.muvee.style';
  mime_t('taglet') := 'application/vnd.mynfc';
  mime_t('nlu') := 'application/vnd.neurolanguage.nlu';
  mime_t('ntf') := 'application/vnd.nitf';
  mime_t('nitf') := 'application/vnd.nitf';
  mime_t('nnd') := 'application/vnd.noblenet-directory';
  mime_t('nns') := 'application/vnd.noblenet-sealer';
  mime_t('nnw') := 'application/vnd.noblenet-web';
  mime_t('ngdat') := 'application/vnd.nokia.n-gage.data';
  mime_t('n-gage') := 'application/vnd.nokia.n-gage.symbian.install';
  mime_t('rpst') := 'application/vnd.nokia.radio-preset';
  mime_t('rpss') := 'application/vnd.nokia.radio-presets';
  mime_t('edm') := 'application/vnd.novadigm.edm';
  mime_t('edx') := 'application/vnd.novadigm.edx';
  mime_t('ext') := 'application/vnd.novadigm.ext';
  mime_t('odc') := 'application/vnd.oasis.opendocument.chart';
  mime_t('otc') := 'application/vnd.oasis.opendocument.chart-template';
  mime_t('odb') := 'application/vnd.oasis.opendocument.database';
  mime_t('odf') := 'application/vnd.oasis.opendocument.formula';
  mime_t('odft') := 'application/vnd.oasis.opendocument.formula-template';
  mime_t('odg') := 'application/vnd.oasis.opendocument.graphics';
  mime_t('otg') := 'application/vnd.oasis.opendocument.graphics-template';
  mime_t('odi') := 'application/vnd.oasis.opendocument.image';
  mime_t('oti') := 'application/vnd.oasis.opendocument.image-template';
  mime_t('odp') := 'application/vnd.oasis.opendocument.presentation';
  mime_t('otp') := 'application/vnd.oasis.opendocument.presentation-template';
  mime_t('ods') := 'application/vnd.oasis.opendocument.spreadsheet';
  mime_t('ots') := 'application/vnd.oasis.opendocument.spreadsheet-template';
  mime_t('odt') := 'application/vnd.oasis.opendocument.text';
  mime_t('odm') := 'application/vnd.oasis.opendocument.text-master';
  mime_t('ott') := 'application/vnd.oasis.opendocument.text-template';
  mime_t('oth') := 'application/vnd.oasis.opendocument.text-web';
  mime_t('xo') := 'application/vnd.olpc-sugar';
  mime_t('dd2') := 'application/vnd.oma.dd2+xml';
  mime_t('oxt') := 'application/vnd.openofficeorg.extension';
  mime_t('pptx') := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
  mime_t('sldx') := 'application/vnd.openxmlformats-officedocument.presentationml.slide';
  mime_t('ppsx') := 'application/vnd.openxmlformats-officedocument.presentationml.slideshow';
  mime_t('potx') := 'application/vnd.openxmlformats-officedocument.presentationml.template';
  mime_t('xlsx') := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  mime_t('xltx') := 'application/vnd.openxmlformats-officedocument.spreadsheetml.template';
  mime_t('docx') := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
  mime_t('dotx') := 'application/vnd.openxmlformats-officedocument.wordprocessingml.template';
  mime_t('mgp') := 'application/vnd.osgeo.mapguide.package';
  mime_t('dp') := 'application/vnd.osgi.dp';
  mime_t('esa') := 'application/vnd.osgi.subsystem';
  mime_t('pdb') := 'application/vnd.palm';
  mime_t('pqa') := 'application/vnd.palm';
  mime_t('oprc') := 'application/vnd.palm';
  mime_t('paw') := 'application/vnd.pawaafile';
  mime_t('str') := 'application/vnd.pg.format';
  mime_t('ei6') := 'application/vnd.pg.osasli';
  mime_t('efif') := 'application/vnd.picsel';
  mime_t('wg') := 'application/vnd.pmi.widget';
  mime_t('plf') := 'application/vnd.pocketlearn';
  mime_t('pbd') := 'application/vnd.powerbuilder6';
  mime_t('box') := 'application/vnd.previewsystems.box';
  mime_t('mgz') := 'application/vnd.proteus.magazine';
  mime_t('qps') := 'application/vnd.publishare-delta-tree';
  mime_t('ptid') := 'application/vnd.pvi.ptid1';
  mime_t('qxd') := 'application/vnd.quark.quarkxpress';
  mime_t('qxt') := 'application/vnd.quark.quarkxpress';
  mime_t('qwd') := 'application/vnd.quark.quarkxpress';
  mime_t('qwt') := 'application/vnd.quark.quarkxpress';
  mime_t('qxl') := 'application/vnd.quark.quarkxpress';
  mime_t('qxb') := 'application/vnd.quark.quarkxpress';
  mime_t('bed') := 'application/vnd.realvnc.bed';
  mime_t('mxl') := 'application/vnd.recordare.musicxml';
  mime_t('musicxml') := 'application/vnd.recordare.musicxml+xml';
  mime_t('cryptonote') := 'application/vnd.rig.cryptonote';
  mime_t('cod') := 'application/vnd.rim.cod';
  mime_t('rm') := 'application/vnd.rn-realmedia';
  mime_t('rmvb') := 'application/vnd.rn-realmedia-vbr';
  mime_t('link66') := 'application/vnd.route66.link66+xml';
  mime_t('st') := 'application/vnd.sailingtracker.track';
  mime_t('see') := 'application/vnd.seemail';
  mime_t('sema') := 'application/vnd.sema';
  mime_t('semd') := 'application/vnd.semd';
  mime_t('semf') := 'application/vnd.semf';
  mime_t('ifm') := 'application/vnd.shana.informed.formdata';
  mime_t('itp') := 'application/vnd.shana.informed.formtemplate';
  mime_t('iif') := 'application/vnd.shana.informed.interchange';
  mime_t('ipk') := 'application/vnd.shana.informed.package';
  mime_t('twd') := 'application/vnd.simtech-mindmapper';
  mime_t('twds') := 'application/vnd.simtech-mindmapper';
  mime_t('mmf') := 'application/vnd.smaf';
  mime_t('teacher') := 'application/vnd.smart.teacher';
  mime_t('sdkm') := 'application/vnd.solent.sdkm+xml';
  mime_t('sdkd') := 'application/vnd.solent.sdkm+xml';
  mime_t('dxp') := 'application/vnd.spotfire.dxp';
  mime_t('sfs') := 'application/vnd.spotfire.sfs';
  mime_t('sdc') := 'application/vnd.stardivision.calc';
  mime_t('sda') := 'application/vnd.stardivision.draw';
  mime_t('sdd') := 'application/vnd.stardivision.impress';
  mime_t('smf') := 'application/vnd.stardivision.math';
  mime_t('sdw') := 'application/vnd.stardivision.writer';
  mime_t('vor') := 'application/vnd.stardivision.writer';
  mime_t('sgl') := 'application/vnd.stardivision.writer-global';
  mime_t('smzip') := 'application/vnd.stepmania.package';
  mime_t('sm') := 'application/vnd.stepmania.stepchart';
  mime_t('sxc') := 'application/vnd.sun.xml.calc';
  mime_t('stc') := 'application/vnd.sun.xml.calc.template';
  mime_t('sxd') := 'application/vnd.sun.xml.draw';
  mime_t('std') := 'application/vnd.sun.xml.draw.template';
  mime_t('sxi') := 'application/vnd.sun.xml.impress';
  mime_t('sti') := 'application/vnd.sun.xml.impress.template';
  mime_t('sxm') := 'application/vnd.sun.xml.math';
  mime_t('sxw') := 'application/vnd.sun.xml.writer';
  mime_t('sxg') := 'application/vnd.sun.xml.writer.global';
  mime_t('stw') := 'application/vnd.sun.xml.writer.template';
  mime_t('sus') := 'application/vnd.sus-calendar';
  mime_t('susp') := 'application/vnd.sus-calendar';
  mime_t('svd') := 'application/vnd.svd';
  mime_t('sis') := 'application/vnd.symbian.install';
  mime_t('sisx') := 'application/vnd.symbian.install';
  mime_t('xsm') := 'application/vnd.syncml+xml';
  mime_t('bdm') := 'application/vnd.syncml.dm+wbxml';
  mime_t('xdm') := 'application/vnd.syncml.dm+xml';
  mime_t('tao') := 'application/vnd.tao.intent-module-archive';
  mime_t('pcap') := 'application/vnd.tcpdump.pcap';
  mime_t('cap') := 'application/vnd.tcpdump.pcap';
  mime_t('dmp') := 'application/vnd.tcpdump.pcap';
  mime_t('tmo') := 'application/vnd.tmobile-livetv';
  mime_t('tpt') := 'application/vnd.trid.tpt';
  mime_t('mxs') := 'application/vnd.triscape.mxs';
  mime_t('tra') := 'application/vnd.trueapp';
  mime_t('ufd') := 'application/vnd.ufdl';
  mime_t('ufdl') := 'application/vnd.ufdl';
  mime_t('utz') := 'application/vnd.uiq.theme';
  mime_t('umj') := 'application/vnd.umajin';
  mime_t('unityweb') := 'application/vnd.unity';
  mime_t('uoml') := 'application/vnd.uoml+xml';
  mime_t('vcx') := 'application/vnd.vcx';
  mime_t('vsd') := 'application/vnd.visio';
  mime_t('vst') := 'application/vnd.visio';
  mime_t('vss') := 'application/vnd.visio';
  mime_t('vsw') := 'application/vnd.visio';
  mime_t('vis') := 'application/vnd.visionary';
  mime_t('vsf') := 'application/vnd.vsf';
  mime_t('wbxml') := 'application/vnd.wap.wbxml';
  mime_t('wmlc') := 'application/vnd.wap.wmlc';
  mime_t('wmlsc') := 'application/vnd.wap.wmlscriptc';
  mime_t('wtb') := 'application/vnd.webturbo';
  mime_t('nbp') := 'application/vnd.wolfram.player';
  mime_t('wpd') := 'application/vnd.wordperfect';
  mime_t('wqd') := 'application/vnd.wqd';
  mime_t('stf') := 'application/vnd.wt.stf';
  mime_t('xar') := 'application/vnd.xara';
  mime_t('xfdl') := 'application/vnd.xfdl';
  mime_t('hvd') := 'application/vnd.yamaha.hv-dic';
  mime_t('hvs') := 'application/vnd.yamaha.hv-script';
  mime_t('hvp') := 'application/vnd.yamaha.hv-voice';
  mime_t('osf') := 'application/vnd.yamaha.openscoreformat';
  mime_t('osfpvg') := 'application/vnd.yamaha.openscoreformat.osfpvg+xml';
  mime_t('saf') := 'application/vnd.yamaha.smaf-audio';
  mime_t('spf') := 'application/vnd.yamaha.smaf-phrase';
  mime_t('cmp') := 'application/vnd.yellowriver-custom-menu';
  mime_t('zir') := 'application/vnd.zul';
  mime_t('zirz') := 'application/vnd.zul';
  mime_t('zaz') := 'application/vnd.zzazz.deck+xml';
  mime_t('vxml') := 'application/voicexml+xml';
  mime_t('wasm') := 'application/wasm';
  mime_t('wgt') := 'application/widget';
  mime_t('hlp') := 'application/winhlp';
  mime_t('wsdl') := 'application/wsdl+xml';
  mime_t('wspolicy') := 'application/wspolicy+xml';
  mime_t('7z') := 'application/x-7z-compressed';
  mime_t('abw') := 'application/x-abiword';
  mime_t('ace') := 'application/x-ace-compressed';
  mime_t('dmg') := 'application/x-apple-diskimage';
  mime_t('aab') := 'application/x-authorware-bin';
  mime_t('x32') := 'application/x-authorware-bin';
  mime_t('u32') := 'application/x-authorware-bin';
  mime_t('vox') := 'application/x-authorware-bin';
  mime_t('aam') := 'application/x-authorware-map';
  mime_t('aas') := 'application/x-authorware-seg';
  mime_t('bcpio') := 'application/x-bcpio';
  mime_t('torrent') := 'application/x-bittorrent';
  mime_t('blb') := 'application/x-blorb';
  mime_t('blorb') := 'application/x-blorb';
  mime_t('bz') := 'application/x-bzip';
  mime_t('bz2') := 'application/x-bzip2';
  mime_t('boz') := 'application/x-bzip2';
  mime_t('cbr') := 'application/x-cbr';
  mime_t('cba') := 'application/x-cbr';
  mime_t('cbt') := 'application/x-cbr';
  mime_t('cbz') := 'application/x-cbr';
  mime_t('cb7') := 'application/x-cbr';
  mime_t('vcd') := 'application/x-cdlink';
  mime_t('cfs') := 'application/x-cfs-compressed';
  mime_t('chat') := 'application/x-chat';
  mime_t('pgn') := 'application/x-chess-pgn';
  mime_t('nsc') := 'application/x-conference';
  mime_t('cpio') := 'application/x-cpio';
  mime_t('csh') := 'application/x-csh';
  mime_t('deb') := 'application/x-debian-package';
  mime_t('udeb') := 'application/x-debian-package';
  mime_t('dgc') := 'application/x-dgc-compressed';
  mime_t('dir') := 'application/x-director';
  mime_t('dcr') := 'application/x-director';
  mime_t('dxr') := 'application/x-director';
  mime_t('cst') := 'application/x-director';
  mime_t('cct') := 'application/x-director';
  mime_t('cxt') := 'application/x-director';
  mime_t('w3d') := 'application/x-director';
  mime_t('fgd') := 'application/x-director';
  mime_t('swa') := 'application/x-director';
  mime_t('wad') := 'application/x-doom';
  mime_t('ncx') := 'application/x-dtbncx+xml';
  mime_t('dtb') := 'application/x-dtbook+xml';
  mime_t('res') := 'application/x-dtbresource+xml';
  mime_t('dvi') := 'application/x-dvi';
  mime_t('evy') := 'application/x-envoy';
  mime_t('eva') := 'application/x-eva';
  mime_t('bdf') := 'application/x-font-bdf';
  mime_t('gsf') := 'application/x-font-ghostscript';
  mime_t('psf') := 'application/x-font-linux-psf';
  mime_t('pcf') := 'application/x-font-pcf';
  mime_t('snf') := 'application/x-font-snf';
  mime_t('pfa') := 'application/x-font-type1';
  mime_t('pfb') := 'application/x-font-type1';
  mime_t('pfm') := 'application/x-font-type1';
  mime_t('afm') := 'application/x-font-type1';
  mime_t('arc') := 'application/x-freearc';
  mime_t('spl') := 'application/x-futuresplash';
  mime_t('gca') := 'application/x-gca-compressed';
  mime_t('ulx') := 'application/x-glulx';
  mime_t('gnumeric') := 'application/x-gnumeric';
  mime_t('gramps') := 'application/x-gramps-xml';
  mime_t('gtar') := 'application/x-gtar';
  mime_t('hdf') := 'application/x-hdf';
  mime_t('install') := 'application/x-install-instructions';
  mime_t('iso') := 'application/x-iso9660-image';
  mime_t('jnlp') := 'application/x-java-jnlp-file';
  mime_t('latex') := 'application/x-latex';
  mime_t('lzh') := 'application/x-lzh-compressed';
  mime_t('lha') := 'application/x-lzh-compressed';
  mime_t('mie') := 'application/x-mie';
  mime_t('prc') := 'application/x-mobipocket-ebook';
  mime_t('mobi') := 'application/x-mobipocket-ebook';
  mime_t('application') := 'application/x-ms-application';
  mime_t('lnk') := 'application/x-ms-shortcut';
  mime_t('wmd') := 'application/x-ms-wmd';
  mime_t('wmz') := 'application/x-ms-wmz';
  mime_t('xbap') := 'application/x-ms-xbap';
  mime_t('mdb') := 'application/x-msaccess';
  mime_t('obd') := 'application/x-msbinder';
  mime_t('crd') := 'application/x-mscardfile';
  mime_t('clp') := 'application/x-msclip';
  mime_t('exe') := 'application/x-msdownload';
  mime_t('dll') := 'application/x-msdownload';
  mime_t('com') := 'application/x-msdownload';
  mime_t('bat') := 'application/x-msdownload';
  mime_t('msi') := 'application/x-msdownload';
  mime_t('mvb') := 'application/x-msmediaview';
  mime_t('m13') := 'application/x-msmediaview';
  mime_t('m14') := 'application/x-msmediaview';
  mime_t('wmf') := 'application/x-msmetafile';
  mime_t('wmz') := 'application/x-msmetafile';
  mime_t('emf') := 'application/x-msmetafile';
  mime_t('emz') := 'application/x-msmetafile';
  mime_t('mny') := 'application/x-msmoney';
  mime_t('pub') := 'application/x-mspublisher';
  mime_t('scd') := 'application/x-msschedule';
  mime_t('trm') := 'application/x-msterminal';
  mime_t('wri') := 'application/x-mswrite';
  mime_t('nc') := 'application/x-netcdf';
  mime_t('cdf') := 'application/x-netcdf';
  mime_t('nzb') := 'application/x-nzb';
  mime_t('p12') := 'application/x-pkcs12';
  mime_t('pfx') := 'application/x-pkcs12';
  mime_t('p7b') := 'application/x-pkcs7-certificates';
  mime_t('spc') := 'application/x-pkcs7-certificates';
  mime_t('p7r') := 'application/x-pkcs7-certreqresp';
  mime_t('rar') := 'application/x-rar-compressed';
  mime_t('ris') := 'application/x-research-info-systems';
  mime_t('sh') := 'application/x-sh';
  mime_t('shar') := 'application/x-shar';
  mime_t('swf') := 'application/x-shockwave-flash';
  mime_t('xap') := 'application/x-silverlight-app';
  mime_t('sql') := 'application/x-sql';
  mime_t('sit') := 'application/x-stuffit';
  mime_t('sitx') := 'application/x-stuffitx';
  mime_t('srt') := 'application/x-subrip';
  mime_t('sv4cpio') := 'application/x-sv4cpio';
  mime_t('sv4crc') := 'application/x-sv4crc';
  mime_t('t3') := 'application/x-t3vm-image';
  mime_t('gam') := 'application/x-tads';
  mime_t('tar') := 'application/x-tar';
  mime_t('tcl') := 'application/x-tcl';
  mime_t('tex') := 'application/x-tex';
  mime_t('tfm') := 'application/x-tex-tfm';
  mime_t('texinfo') := 'application/x-texinfo';
  mime_t('texi') := 'application/x-texinfo';
  mime_t('obj') := 'application/x-tgif';
  mime_t('ustar') := 'application/x-ustar';
  mime_t('src') := 'application/x-wais-source';
  mime_t('der') := 'application/x-x509-ca-cert';
  mime_t('crt') := 'application/x-x509-ca-cert';
  mime_t('fig') := 'application/x-xfig';
  mime_t('xlf') := 'application/x-xliff+xml';
  mime_t('xpi') := 'application/x-xpinstall';
  mime_t('xz') := 'application/x-xz';
  mime_t('z1') := 'application/x-zmachine';
  mime_t('z2') := 'application/x-zmachine';
  mime_t('z3') := 'application/x-zmachine';
  mime_t('z4') := 'application/x-zmachine';
  mime_t('z5') := 'application/x-zmachine';
  mime_t('z6') := 'application/x-zmachine';
  mime_t('z7') := 'application/x-zmachine';
  mime_t('z8') := 'application/x-zmachine';
  mime_t('xaml') := 'application/xaml+xml';
  mime_t('xdf') := 'application/xcap-diff+xml';
  mime_t('xenc') := 'application/xenc+xml';
  mime_t('xhtml') := 'application/xhtml+xml';
  mime_t('xht') := 'application/xhtml+xml';
  mime_t('xml') := 'application/xml';
  mime_t('xsl') := 'application/xml';
  mime_t('dtd') := 'application/xml-dtd';
  mime_t('xop') := 'application/xop+xml';
  mime_t('xpl') := 'application/xproc+xml';
  mime_t('xslt') := 'application/xslt+xml';
  mime_t('xspf') := 'application/xspf+xml';
  mime_t('mxml') := 'application/xv+xml';
  mime_t('xhvml') := 'application/xv+xml';
  mime_t('xvml') := 'application/xv+xml';
  mime_t('xvm') := 'application/xv+xml';
  mime_t('yang') := 'application/yang';
  mime_t('yin') := 'application/yin+xml';
  mime_t('zip') := 'application/zip';
  mime_t('adp') := 'audio/adpcm';
  mime_t('au') := 'audio/basic';
  mime_t('snd') := 'audio/basic';
  mime_t('mid') := 'audio/midi';
  mime_t('midi') := 'audio/midi';
  mime_t('kar') := 'audio/midi';
  mime_t('rmi') := 'audio/midi';
  mime_t('m4a') := 'audio/mp4';
  mime_t('mp4a') := 'audio/mp4';
  mime_t('mpga') := 'audio/mpeg';
  mime_t('mp2') := 'audio/mpeg';
  mime_t('mp2a') := 'audio/mpeg';
  mime_t('mp3') := 'audio/mpeg';
  mime_t('m2a') := 'audio/mpeg';
  mime_t('m3a') := 'audio/mpeg';
  mime_t('oga') := 'audio/ogg';
  mime_t('ogg') := 'audio/ogg';
  mime_t('spx') := 'audio/ogg';
  mime_t('opus') := 'audio/ogg';
  mime_t('s3m') := 'audio/s3m';
  mime_t('sil') := 'audio/silk';
  mime_t('uva') := 'audio/vnd.dece.audio';
  mime_t('uvva') := 'audio/vnd.dece.audio';
  mime_t('eol') := 'audio/vnd.digital-winds';
  mime_t('dra') := 'audio/vnd.dra';
  mime_t('dts') := 'audio/vnd.dts';
  mime_t('dtshd') := 'audio/vnd.dts.hd';
  mime_t('lvp') := 'audio/vnd.lucent.voice';
  mime_t('pya') := 'audio/vnd.ms-playready.media.pya';
  mime_t('ecelp4800') := 'audio/vnd.nuera.ecelp4800';
  mime_t('ecelp7470') := 'audio/vnd.nuera.ecelp7470';
  mime_t('ecelp9600') := 'audio/vnd.nuera.ecelp9600';
  mime_t('rip') := 'audio/vnd.rip';
  mime_t('weba') := 'audio/webm';
  mime_t('aac') := 'audio/x-aac';
  mime_t('aif') := 'audio/x-aiff';
  mime_t('aiff') := 'audio/x-aiff';
  mime_t('aifc') := 'audio/x-aiff';
  mime_t('caf') := 'audio/x-caf';
  mime_t('flac') := 'audio/x-flac';
  mime_t('mka') := 'audio/x-matroska';
  mime_t('m3u') := 'audio/x-mpegurl';
  mime_t('wax') := 'audio/x-ms-wax';
  mime_t('wma') := 'audio/x-ms-wma';
  mime_t('ram') := 'audio/x-pn-realaudio';
  mime_t('ra') := 'audio/x-pn-realaudio';
  mime_t('rmp') := 'audio/x-pn-realaudio-plugin';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_MIME";
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
    p_file_size             in integer,
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
  function get_zip_name return varchar2
  as
  begin
    return
      apex_string.format(
        p_message => '%s.zip'
      , p0 =>
          apex_string_util.get_slug(
            p_string => lower( 'blog_files' )
          , p_hash_length => 6
          )
      )
    ;
  end get_zip_name;
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
    l_file_size     integer;
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
    , p_value => apex_lang.get_message( 'BLOG_GENERIC_ERROR' )
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
    l_file_cnt      pls_integer := 0;
    l_file_name     varchar2(256);
    l_content_type  varchar2(256);
    l_blob_content  blob;
  begin
    -- fetch selected files
    for c1 in(
      select
        t1.file_path
      , t1.file_name
      , t1.mime_type
      , t1.blob_content
      , count(1) over() as num_rows
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

      l_file_cnt := c1.num_rows;

      if l_file_cnt = 1
      then
        l_file_name     := c1.file_name;
        l_content_type  := c1.mime_type;
        l_blob_content  := c1.blob_content;
      else
        -- add file to zip
        apex_zip.add_file(
          p_zipped_blob => l_blob_content
        , p_file_name   => c1.file_path
        , p_content     => c1.blob_content
        );
      end if;

    end loop;

    if l_file_cnt = 0
    then
      -- TO DO: raise error here
      null;
    elsif l_file_cnt > 1
    then

      -- get zip name
      l_file_name := get_zip_name;
      -- set content type
      l_content_type := 'application/zip';
      -- close zip
      apex_zip.finish(
        p_zipped_blob => l_blob_content
      );

    end if;

    -- download file/zip
    apex_http.download(
      p_blob          => l_blob_content
    , p_content_type  => l_content_type
    , p_filename      => l_file_name
    );

  end download_selected_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_FILE";
/
create or replace package body "BLOG_UTIL"
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
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function remove_whitespace(
    p_string  in varchar2
  ) return varchar2
  as
  begin
    -- remove whitespace characters from string
    return trim( regexp_replace( p_string, '\s+', ' ' ) );
  end remove_whitespace;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure raise_http_error(
    p_error_code  in number
  )
  as
  begin
    -- output HTTP status
    owa_util.status_line( p_error_code );
    -- stop APEX
    apex_application.stop_apex_engine;

  exception when others
  then
    raise;
  end raise_http_error;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function apex_error_handler(
    p_error in apex_error.t_error
  ) return apex_error.t_error_result
  as

    l_genereric_error constant varchar2(255) := 'BLOG_GENERIC_ERROR';

    l_result          apex_error.t_error_result;
    l_reference_id    pls_integer;
    l_constraint_name varchar2(255);
    l_err_mesg        varchar2(32700);

  begin

    -- This function must be used to ensure initialization is compatible
    -- with future changes to t_error_result.
    l_result :=
      apex_error.init_error_result(
        p_error => p_error
      )
    ;
    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error
    then
      if not p_error.is_common_runtime_error
      then
        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.
        l_result.message :=
          apex_lang.get_message(
            p_name => l_genereric_error
          )
        ;
        l_result.additional_info := null;
      end if;
    else

      -- If it's a constraint violation like
      --
      --   -) ORA-02292 ORA-02291 ORA-02290 ORA-02091 ORA-00001: unique constraint violated
      --   -) : transaction rolled back (-> can hide a deferred constraint)
      --   -) : check constraint violated
      --   -) : integrity constraint violated - parent key not found
      --   -) : integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from our constraint lookup configuration.
      -- If we don't find the constraint in our lookup table we fallback to
      -- the original ORA error message.

      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292)
      then
        l_constraint_name :=
          apex_error.extract_constraint_name(
            p_error => p_error
          )
        ;
        l_err_mesg :=
          apex_lang.get_message(
            p_name => l_constraint_name
          )
        ;
        -- not every constraint has to be in our lookup table
        if not l_err_mesg = l_constraint_name
        then
          l_result.message := l_err_mesg;
          l_result.additional_info := null;
        end if;
      end if;

      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
      -- in a table trigger or in a PL/SQL package called by a process and we
      -- haven't found the error in our lookup table, then we just want to see
      -- the actual error text and not the full error stack with all the ORA error numbers.
      if p_error.ora_sqlcode is not null
      and l_result.message = p_error.message
      then
        l_result.message :=
          apex_error.get_first_ora_error_text(
            p_error => p_error
          )
        ;
        l_result.additional_info := null;
      end if;

      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      if l_result.page_item_name is null
      and l_result.column_alias is null
      then
        apex_error.auto_set_associated_item(
          p_error => p_error
        , p_error_result => l_result
        );
      end if;

    end if;

    return l_result;

  end apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function int_to_vc2(
    p_value in number
  ) return varchar2
  as
  begin
    -- convert number to string without decimals
    return to_char( p_value,  'fm99999999999999999999999999999999999999' );
  end int_to_vc2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name in varchar2
  ) return varchar2 result_cache
  as
    l_value blog_settings.attribute_value%type;
  begin

    -- raise no data found error if parameter p_attribute_name is null
    if p_attribute_name is null then
      raise no_data_found;
    end if;

    -- fetch and return value from settings table
    select attribute_value
    into l_value
    from blog_settings
    where attribute_name = p_attribute_name
    ;

    apex_debug.info(
      p_message => 'Fetch attribute %s return: %s'
    , p0 => p_attribute_name
    , p1 => l_value
    );

    -- return attribute value
    return l_value;

  -- Handle error cases
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_attribute_name'
      ,p3 => coalesce( p_attribute_name, '(null)' )
    );
    raise;

  end get_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in varchar2
  )
  as
    l_app_id blog_v_init_items.application_id%type;

    type item_value_r is record(
      item_name   blog_v_init_items.item_name%type,
      item_value  blog_v_init_items.attribute_value%type
    );

    type items_t is table of item_value_r;

    l_init_items items_t;

  begin

    apex_debug.enter(
      p_routine_name  => 'blog_util.initialize_items'
    , p_name01        => 'p_app_id'
    , p_value01       => p_app_id
    );

    -- raise no data found error if parameter p_app_id_name is null
    if p_app_id is null then
      raise no_data_found;
    end if;

    -- conver application id string to number
    l_app_id := to_number( p_app_id );

    -- fetch items and values that session state need to be set
    select
      v1.item_name
    , v1.attribute_value
    bulk collect into l_init_items
    from blog_v_init_items v1
    where 1 = 1
      and v1.application_id = l_app_id
      and (
        v1.attribute_value != v1.session_value
        or( v1.attribute_value is null and v1.session_value is not null )
        or( v1.attribute_value is not null and v1.session_value is null )
      )
    ;

    for i in 1 .. l_init_items.count
    loop
      -- set item session state. do not commit.
      apex_util.set_session_state(
        p_name    => l_init_items(i).item_name
      , p_value   => l_init_items(i).item_value
      , p_commit  => false
      );
    end loop;

  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s. %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_app_id'
      ,p3 => coalesce( p_app_id, '(null)' )
    );

    raise;

  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
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
  )
  as
    l_next_post_id  number;
    l_prev_post_id  number;
    l_post_id       blog_v_posts.post_id%type;
    l_published_on  blog_v_posts.published_on%type;
    l_changed_on    blog_v_posts.changed_on%type;
  begin

    -- raise no data found error if parameter p_post_id is null
    if p_post_id is null then
      raise no_data_found;
    end if;
    -- conver post id string to number
    l_post_id := to_number( p_post_id );
    -- fetch post title and description by post id
    -- also fetch prev and next post id and title
    select
      v1.post_title
    , v1.post_desc
    , v1.category_title
    , v1.blogger_name
    , v1.published_on
    , v1.changed_on
    , v1.next_post.post_id
    , v1.next_post.post_title
    , v1.prev_post.post_id
    , v1.prev_post.post_title
    into p_post_title
    , p_post_desc
    , p_post_category
    , p_post_author
    , l_published_on
    , l_changed_on
    , l_next_post_id
    , p_next_post_title
    , l_prev_post_id
    , p_prev_post_title
    from blog_v_posts v1
    where 1 = 1
      and post_id = l_post_id
    ;

    p_next_post_id := int_to_vc2( l_next_post_id );
    p_prev_post_id := int_to_vc2( l_prev_post_id );

    -- Get post published and modified UTC time
    p_post_published :=
      to_char(
        sys_extract_utc( l_published_on )
      , g_iso_8601_date
      , g_nls_date_lang
      )
    ;
    p_post_modified :=
      to_char(
        sys_extract_utc( l_changed_on )
      , g_iso_8601_date
      , g_nls_date_lang
      )
    ;

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
      p_message => 'Error: %s %s( %s => %s )'
    , p0 => sqlerrm
    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p2 => 'p_post_id'
    , p3 => coalesce( p_post_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_post_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2
  ) return varchar2
  as
    l_category_id   blog_v_categories.category_id%type;
    l_category_name blog_v_categories.category_title%type;
  begin

    -- raise no data found error if parameter p_category_id is null
    if p_category_id is null then
      raise no_data_found;
    end if;

    -- conver category id string to number
    l_category_id := to_number( p_category_id );

    -- fetch category name
    select v1.category_title
    into l_category_name
    from blog_v_categories v1
    where v1.category_id = l_category_id
    ;

    -- return category name
    return l_category_name;

  -- handle errors
  exception
  when others then

    apex_debug.error(
      p_message => 'Error: %s %s( %s => %s, %s => %s )'
    , p0 => sqlerrm
    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p2 => 'p_category_id'
    , p3 => coalesce( p_category_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_tag_id    blog_v_tags.tag_id%type;
    l_tag_name  blog_v_tags.tag%type;
  begin

    -- raise no data found error if parameter p_tag_id is null
    if p_tag_id is null then
      raise no_data_found;
    end if;

    -- conver tag id string to number
    l_tag_id := to_number( p_tag_id );

    -- fetch tag name
    select t1.tag
    into l_tag_name
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = l_tag_id
    ;

    -- return category name
    return l_tag_name;

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
      p_message => 'Error: %s %s( %s => %s )'
    , p0 => sqlerrm
    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p2 => 'p_tag_id'
    , p3 => coalesce( p_tag_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file(
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  )
  as
  begin

    -- init HTTP buffer
    sys.htp.flush;
    --sys.htp.init;

    -- open HTTP header
    sys.owa_util.mime_header(
      ccontent_type => coalesce( p_mime_type, blog_mime.g_default_mime )
    , bclose_header => false
    , ccharset      => p_charset
    );

    apex_debug.info(
      p_message => 'Set response headers'
    );

    -- set response headers
    for i in 1 .. p_header_names.count
    loop

      apex_debug.info(
        p_message => 'Header name: %s , header value: %s'
      , p0 => p_header_names(i)
      , p1 => p_header_values(i)
      );

      if p_header_values(i) is not null
      then
        -- output HTTP header
        sys.htp.p(
          apex_string.format(
            p_message => '%s: %s'
          , p0 => trim( p_header_names(i) )
          , p1 => trim( p_header_values(i) )
          )
        );
      else
        apex_debug.info(
          p_message => 'Header %s value is null. Header not set'
        , p0 => p_header_names(i)
        );
      end if;

    end loop;

    -- close HTTP header
    sys.owa_util.http_header_close;

    -- output file
    sys.wpg_docload.download_file( p_blob_content );

    begin
      apex_application.stop_apex_engine;
    exception
    when apex_application.e_stop_apex_engine
    then
      null;
    end;

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
      p_message => '%s Error: %s'
    , p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p1 => sqlerrm
    );

    -- show http error
    raise_http_error( 400 );
    raise;

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file(
    p_file_path in varchar2
  )
  as
    l_last_modified varchar2(256);
    l_file_t        blog_v_files%rowtype;
    l_header_names  apex_t_varchar2;
    l_header_values apex_t_varchar2;
  begin

    -- fetch file
    select *
    into l_file_t
    from blog_v_files t1
    where 1 = 1
      and t1.file_path = p_file_path
    ;

    l_last_modified :=
      to_char(
        sys_extract_utc( l_file_t.changed_on )
      , g_rfc_2822_date
      , g_nls_date_lang
      )
    ;

    apex_debug.info(
      p_message => 'File name: %s, file size: %s, mime type: %s, charset: %s, last modified: %s'
    , p0 => l_file_t.file_name
    , p1 => l_file_t.file_size
    , p2 => l_file_t.mime_type
    , p3 => l_file_t.file_charset
    , p4 => l_last_modified
    );

    -- Compare request If-Modified-Since header to Last-Modified
    -- If values are equal then set status header and exit from procedure
    if sys.owa_util.get_cgi_env( 'HTTP_IF_MODIFIED_SINCE' ) = l_last_modified
    then
      sys.owa_util.status_line( 304 );
      apex_debug.info(
        p_message => 'File not sent. If-Modified-Since: %s'
      , p0 => l_last_modified
      );
      return;
    end if;

    -- Add Last-Modified header
    apex_string.push(
      p_table => l_header_names
    , p_value => 'Last-Modified'
    );
    apex_string.push(
      p_table => l_header_values
    , p_value => l_last_modified
    );

    -- Add Cache-Control header
    apex_string.push(
      p_table => l_header_names
    , p_value => 'Cache-Control'
    );

    apex_string.push(
      p_table => l_header_values
    , p_value =>
        apex_string.format(
          p_message => 'max-age=%s'
        , p0 =>
            case l_file_t.is_download
              when 1
              then get_attribute_value( 'G_MAX_AGE_DOWNLOAD' )
              else get_attribute_value( 'G_MAX_AGE_FILE' )
            end
        )
    );

    -- add Content-Disposition header
    apex_string.push(
      p_table => l_header_names
    , p_value => 'Content-Disposition'
    );
    apex_string.push(
      p_table => l_header_values
    , p_value =>
        apex_string.format(
            p_message => '%s filename="%s"'
          , p0 =>
              case l_file_t.is_download
                when 1
                then 'attachment;'
              end
          , p1 => l_file_t.file_name
        )
    );

    -- download file
    download_file(
      p_blob_content  => l_file_t.blob_content
    , p_mime_type     => l_file_t.mime_type
    , p_header_names  => l_header_names
    , p_header_values => l_header_values
    );

  -- handle errors
  exception when no_data_found
  then

    apex_debug.error(
      p_message => 'Error: %s %s( %s => %s )'
    , p0 => sqlerrm
    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p2 => 'p_file_path'
    , p3 => coalesce( p_file_path, '(null)' )
    );

    raise_http_error( 404 );

  when others
  then

    apex_debug.error(
      p_message => 'Error: %s %s( %s => %s )'
    , p0 => sqlerrm
    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
    , p2 => 'p_file_path'
    , p3 => coalesce( p_file_path, '(null)' )
    );

    raise_http_error( 400 );
    raise;

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value   in varchar2,
    p_app_id  in varchar2 default null,
    p_page_id in varchar2 default 'SEARCH',
    p_session in varchar2 default null
  )
  as
  begin
    -- Get search page URL and redirect
    apex_util.redirect_url(
      apex_page.get_url(
        p_application => p_app_id
      , p_page        => p_page_id
      , p_session     => p_session
      , p_items       => 'P4_SEARCH'
      , p_values      => p_value
      , p_plain_url   => true
      )
    );
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
create or replace package body "BLOG_ADMIN"
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
  function next_seq(
    p_max in number
  ) return number
  as
  begin
    return ceil( coalesce( p_max + 1, 1 ) / 10 ) * 10;
  end next_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag_to_post(
    p_post_id     in number,
    p_tag_id      in number,
    p_display_seq in number
  )
  as
  begin

    -- merge tag
    merge into blog_post_tags t1
    using dual on (
      t1.post_id  = p_post_id
      and t1.tag_id  = p_tag_id
    )
    when matched then
    -- update display sequence if it changed
      update
        set t1.display_seq = p_display_seq
      where t1.display_seq != p_display_seq
    -- insert post id, tag id and display sequency to table
    when not matched then
      insert
        ( is_active, post_id, tag_id, display_seq )
      values
        ( 1, p_post_id, p_tag_id, p_display_seq )
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

    -- delete relationship from tags that aren't belong to post anymore
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
    p_app_id    in varchar2,
    p_username  in varchar2,
    p_user_id   out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max     blog_bloggers.display_seq%type;
    l_email   blog_bloggers.email%type;
    l_app_id  apex_applications.application_id%type;
    l_authz   apex_applications.authorization_scheme%type;
  begin

    -- convert application id string to number
    l_app_id := to_number( p_app_id );

    -- fetch application authorization scheme name.
    select authorization_scheme
    into l_authz
    from apex_applications
    where 1 = 1
    and application_id = l_app_id
    ;

    apex_debug.info( 'Check is user in group: %s.', l_authz );

    -- verify user is authorized
    if apex_authorization.is_authorized( l_authz )
    then

      -- if user is authorized add user to blog_bloggers table
      apex_debug.info( 'User %s is authorized and added to bloggers.', p_username );

      -- fetch next display_seq
      select
        max( t1.display_seq ) as display_seq
      into l_max
      from blog_bloggers t1
      ;

      l_max := next_seq( l_max );

      -- get APEX user email
      l_email := apex_util.get_email( p_username => p_username );

      -- get APEX user first and last name for blogger name
      p_name := apex_string.format(
        p_message  => '%s %s'
      , p0 => apex_util.get_first_name( p_username => p_username )
      , p1 => apex_util.get_last_name( p_username => p_username )
      );

      -- add new blogger
      insert into blog_bloggers
        ( is_active, publish_desc, display_seq, apex_username, blogger_name, email )
      values
        ( 1, 0, l_max, p_username, p_name, l_email )
      returning id into p_user_id
      ;

    else
      apex_debug.info( 'User %s is not authorized.', p_username );
    end if;

  end add_blogger;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_attribute_value(
    p_attribute_name  in varchar2,
    p_attribute_value in varchar2
  )
  as
  begin

    apex_debug.info( 'Set parameter %s: %s', p_attribute_name, p_attribute_value );

    update blog_settings
      set attribute_value = p_attribute_value
    where 1 = 1
      and attribute_name = p_attribute_name
      and (
        attribute_value != p_attribute_value
        or( attribute_value is null and p_attribute_value is not null )
        or( attribute_value is not null and p_attribute_value is null )
      )
    ;

  end set_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure post_authentication
  as
    l_group_names apex_t_varchar2;
    l_user_name   apex_workspace_apex_users.user_name%type;
  begin

    l_user_name := sys_context( 'APEX$SESSION', 'APP_USER' );

    -- collect user groups to PL/SQL table
    for c1 in(
      select distinct
        g.group_name
      from apex_workspace_groups g
      left join apex_workspace_group_groups gg on g.group_name = gg.grantee_name
      left join apex_workspace_group_users gu on g.group_name = gu.group_name
        and gu.user_name = l_user_name
      left join apex_workspace_apex_users u on gu.user_name = u.user_name
        and u.account_locked  = 'No'
        and u.user_name = l_user_name
        start with u.user_name = l_user_name
      connect by nocycle prior gg.group_name = g.group_name
    ) loop
      apex_string.push( l_group_names, c1.group_name );
    end loop;

    -- Enable user groups
    apex_authorization.enable_dynamic_groups (
      p_group_names => l_group_names
    );

  exception
  when others
  then
    apex_debug.error( 'Unhandled post authentication procedure error: %s: ', sqlerrm );
    raise;
  end post_authentication;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_app_id      in varchar2,
    p_username    in varchar2,
    p_user_id     out nocopy number,
    p_name        out nocopy varchar2
  )
  as
  begin

    apex_debug.info( 'Fetch user id and name for username: %s', p_username );

    -- fetch user id and name
    select
      id
    , blogger_name
    into p_user_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;

  -- if user not found, try add user
  exception
  when no_data_found
  then

    apex_debug.info( 'User %s not found from bloggers.', p_username );

    add_blogger(
      p_app_id    => p_app_id
    , p_username  => p_username
    , p_user_id   => p_user_id
    , p_name      => p_name
    );

  end get_blogger_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return varchar2
  as
    l_max_seq   blog_v_all_categories.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max category display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_categories v1
    ;
    -- get next category display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next category display sequence
    return l_next_seq;

  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return varchar2
  as
    l_max_seq   blog_v_all_link_groups.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_link_groups v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_link_grp_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_modal_page_seq
  return varchar2
  as
    l_max_seq   blog_v_all_dynamic_content.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_dynamic_content v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_modal_page_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id in varchar2
  ) return varchar2
  as
    l_link_group_id number;
    l_max_seq       blog_v_all_links.display_seq%type;
    l_next_seq      varchar2(256);
  begin

    -- conver link group id string to number
    l_link_group_id := to_number( p_link_group_id );

    -- fetch max link display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_links v1
    where 1 = 1
    and link_group_id = l_link_group_id
    ;
    -- get next link display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link display sequence
    return l_next_seq;

  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request in varchar2
  ) return varchar2
  as
  begin

    -- conver APEX request to post status (blog_posts.is_active)
    return case p_request
      when 'CREATE'
      then '1'
      when 'SAVE'
      then '1'
      when 'SAVE_AND_PUBLISH'
      then '1'
      else '0'
    end;

  end request_to_post_status;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html in clob
  ) return varchar2
  as
    l_first_p       clob;
    l_first_p_start number;
    l_first_p_end   number;
    l_length        number;
    l_next_p        number;
    l_cnt           number;
  begin

    l_cnt := 1;
    l_next_p := 1;

    -- get first opening and closing tag positions
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>', l_first_p_start ) + 4;

    -- check if there nested tags
    while l_next_p > 0
    loop
      l_cnt := l_cnt + 1;

      -- get string length between opening and closing tag
      l_length  := l_first_p_end - l_first_p_start;
      -- select contect between opening and closing tag
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- check if there is more opening tags inside selection
      l_next_p := instr( l_first_p, '<p', 1, l_cnt );

      if l_next_p > 0
      then
        -- if another opening tag found, find next closing tag
        l_first_p_end := instr( p_body_html, '</p>', 1, l_cnt ) + 4;
      end if;

      l_first_p := null;

    end loop;


    -- post must have at least one paragraph
    if l_first_p_start > 0 and l_first_p_end > 0 then

      l_length := l_first_p_end - l_first_p_start;

      -- get first paragraph
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- remove whitespace
      l_first_p := blog_util.remove_whitespace( l_first_p );

    end if;

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_category_title  in varchar2,
    p_category_id out nocopy number
  )
  as
    l_next_seq      number;
    l_title         varchar2(512);
    l_title_unique  varchar2(512);
  begin

    -- remove whitespace from category title
    l_title := blog_util.remove_whitespace( p_category_title );
    l_title_unique := upper( l_title );

    -- check if category already exists and fetch id
    begin
      select v1.id
      into p_category_id
      from blog_v_all_categories v1
      where 1 = 1
      and v1.title_unique = l_title_unique
      ;
    -- if category not exists insert and return id
    exception
    when no_data_found
    then
      -- get next sequence value
      l_next_seq := get_category_seq;
      -- insert category and return id for out parameter.
      insert into blog_categories
        ( is_active, display_seq, title )
      values
        ( 1, l_next_seq, l_title )
      returning id into p_category_id
      ;
    end;
  -- fetch category id if it was inserted in other session but not commited
  exception
  when dup_val_on_index
  then
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
      and v1.title_unique = l_title_unique
    ;
  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_categories
  as
  begin
    -- cleanup categories that aren't linked to any post
    delete from blog_categories t1
    where 1 = 1
    and not exists(
      select 1
      from blog_posts x1
      where 1 = 1
      and x1.category_id = t1.id
    );

  end remove_unused_categories;
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
    l_value   := blog_util.remove_whitespace( p_tag );

    -- if tag is not null then fetch id
    if l_value is not null then

      begin
        select id
        into p_tag_id
        from blog_v_all_tags
        where 1 = 1
        and tag_unique = upper( l_value )
        ;
      -- if tag not exists insert and return id
      exception when no_data_found then
        insert into blog_tags
          ( is_active, tag )
        values
          ( 1, l_value )
        returning id into p_tag_id
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id in varchar2,
    p_tags    in varchar2,
    p_sep     in varchar2 default ','
  )
  as
    l_post_id     number;
    l_tag_id      number;
    l_display_seq number;
    l_tag_tab     apex_t_varchar2;
    l_tag_id_tab  apex_t_number;
  begin

    l_post_id := to_number( p_post_id );

    -- split tags string to table and loop all values
    l_tag_tab := apex_string.split(
      p_str => p_tags
    , p_sep => p_sep
    );

    for i in 1 .. l_tag_tab.count
    loop

      -- add tag to repository and return id
      add_tag(
        p_tag     => l_tag_tab(i)
      , p_tag_id  => l_tag_id
      );

      -- if the tag has been added or is already in the repository
      -- create relationships to post
      if l_tag_id is not null
      then

        -- collect tag id to table.
        -- table is used at end of procedure
        -- for checking relationships that should be removed
        apex_string.push( l_tag_id_tab, l_tag_id );

        -- get table record count for tag display sequence
        l_display_seq:= l_tag_id_tab.count * 10;

        -- add tag relationships to post
        add_tag_to_post(
          p_post_id     => l_post_id
        , p_tag_id      => l_tag_id
        , p_display_seq => l_display_seq
        );

      end if;

    end loop;

    -- delete removed tags relationships
    cleanup_post_tags(
      p_post_id => l_post_id
    , p_tag_tab => l_tag_id_tab
    );

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
      from blog_post_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_integer(
    p_value     in varchar2,
    p_min       in number,
    p_max       in number,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_value     number;
    l_err_mesg  varchar2(32700);
  begin

    if p_value is not null
    then

      -- prepare validation error message for exception handler
      l_err_mesg := apex_lang.get_message(
        p_name    => p_err_mesg
      , p_params  =>
          apex_t_varchar2(
            'min'
          , p_min
          , 'max'
          , p_max
        )
      );

      l_value := to_number( p_value );

      -- check value is integer and between range
      if round( l_value ) = l_value
      and l_value between p_min and p_max
      then
        -- if validation passes, clear error meassage
        l_err_mesg := null;
      end if;

    end if;

    return l_err_mesg;

  exception
  when invalid_number
  or value_error
  then
    -- return error message
    return l_err_mesg;
  end is_integer;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_url(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin

    if not regexp_like(p_value, '^https?\:\/\/.*$')
    then
      -- if validation fails prepare error message
      l_err_mesg := p_err_mesg;

    end if;

    return l_err_mesg;

  end is_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_date_format(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg          varchar2(32700);
    invalid_date_format exception;
    pragma              exception_init(invalid_date_format, -1821);
  begin

    -- prepare validation error message
    l_err_mesg := p_err_mesg;

    -- try convert timestamp to string
    if to_char( sysdate, p_value ) is not null
    then
      -- if validation passes, clear error meassage
      l_err_mesg := null;
    end if;

    return l_err_mesg;

  exception
  when invalid_date_format
  then
    -- return error message
    return l_err_mesg;
  end is_date_format;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_app_id          in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  )
  as
    l_build_status apex_application_admin.t_build_option_status;
  begin

    l_build_status := upper( p_build_status );

    -- update build option value
    if
      apex_application_admin.get_build_option_status(
        p_application_id  => p_app_id
      , p_id              => p_build_option_id
      ) != l_build_status
    then

      apex_application_admin.set_build_option_status(
        p_application_id  => p_app_id
      , p_id              => p_build_option_id
      , p_build_status    => l_build_status
      );

    end if;

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_build_option_name in varchar2,
    p_build_status      in varchar2
  )
  as
  begin
    -- get build option id by build option name for both applications
    for c1 in(
      select
        t1.application_id
      , t1.build_option_id
      from apex_application_build_options t1
      where 1 = 1
        and t1.build_option_name  = p_build_option_name
        and exists(
          select 1
          from blog_settings x1
          where 1 = 1
            and x1.attribute_name in( 'G_PUB_APP_ID', 'G_ADMIN_APP_ID' )
            and to_number( x1.attribute_value ) = t1.application_id
        )
    ) loop

      -- update build option value
      update_feature(
        p_app_id          => c1.application_id
      , p_build_option_id => c1.build_option_id
      , p_build_status    => p_build_status
      );

    end loop;

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_categories
  as
  begin

    -- update categories display_seq if it different than new
    merge into blog_categories t1
    using (
      select
        id
      , row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_categories
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_tags(
    p_post_id in varchar2
  )
  as
    l_post_id number;
  begin

    l_post_id := to_number( p_post_id );

    -- update post tags display_seq if it different than new
    merge into blog_post_tags t1
    using (
      select
        id
      , row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_post_tags
      where 1 = 1
      and post_id = l_post_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_link_groups
  as
  begin

    -- update link groups display_seq if it different than new
    merge into blog_link_groups t1
    using (
      select
        id
      , row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_link_groups
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_link_groups;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_links(
    p_link_group_id in varchar2
  )
  as
    l_link_group_id number;
  begin

    -- convert link group id to number
    l_link_group_id := to_number( p_link_group_id );

    -- update links display_seq if it different than new
    merge into blog_links t1
    using (
      select
        id
      , row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_links
      where 1 = 1
      and link_group_id = l_link_group_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_links;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_dynamic_content
  as
  begin
    -- Update dynamic content seq if it different than new
    merge into blog_dynamic_content t1
    using (
      select
        id
      , row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_dynamic_content
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;
  end resequence_dynamic_content;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_attribute_value(
    p_attribute_list in apex_t_varchar2
  )
  as
    l_values  json_object_t;
    l_keys    json_key_list;
  begin

    l_values :=
      json_object_t.parse(
        apex_string.plist_to_json_clob( p_attribute_list )
      )
    ;

    l_keys := l_values.get_keys;

    for i in 1 .. l_keys.count
    loop

      set_attribute_value(
        p_attribute_name  => l_keys(i)
      , p_attribute_value => l_values.get_string( l_keys(i) )
      );

    end loop;

  end set_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ADMIN";
/
create or replace package body "BLOG_PLUGIN"
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
  function to_html_entities(
    p_number in number
  ) return varchar2
  as
    l_string varchar2(4000);
    l_result varchar2(4000);
  begin

    l_string := blog_util.int_to_vc2( p_number );

    for i in 1 .. length( l_string )
    loop
      l_result :=
        apex_string.format(
          p_message => '%s&#%s'
        , p0 => l_result
        , p1 => ascii( substr( l_string, i, 1 ) )
        )
      ;
    end loop;

    return l_result;

  end to_html_entities;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  )
  as
  begin

    if apex_application.g_debug
    then
      apex_plugin_util.debug_page_item(
        p_plugin      => p_plugin
      , p_page_item  => p_item
      );
    end if;

    if not ( p_param.is_readonly or p_param.is_printer_friendly )
    then

      sys.htp.p( '<input type="text" '
        || case when p_item.element_width is not null
            then 'size="' || p_item.element_width ||'" '
           end
        || case when p_item.element_max_length  is not null
            then 'maxlength="' || p_item.element_max_length || '" '
           end
        ||
          apex_plugin_util.get_element_attributes(
            p_item            => p_item
          , p_name            => p_item.name
          , p_default_class   => 'text_field apex-item-text'
          , p_add_labelledby  => false
          )
        || 'value="">'
      );

      if p_item.icon_css_classes is not null
      then
        sys.htp.p('<span class="apex-item-icon fa '
          || p_item.icon_css_classes
          || '" aria-hidden="true"></span>'
        );
      end if;

      apex_json.initialize_clob_output;
      apex_json.open_object;
      apex_json.write( 'labelId', p_item.name || '_LABEL' );
      apex_json.write( 'ajaxIdentifier', apex_plugin.get_ajax_identifier );
      apex_json.close_object;

      apex_javascript.add_onload_code(
        p_code =>
          apex_string.format(
            p_message => 'blog.plugin.mathQuestionField.getQuestion(%s)'
          , p0 => apex_json.get_clob_output
          )
      );

      -- Tell APEX that this input is navigable
      p_result.is_navigable := true;

    else
      p_result.item_rendered := false;
    end if;

  end render_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_ajax_param,
    p_result  in out nocopy apex_plugin.t_item_ajax_result
  )
  as
    l_err   varchar2(4000);
    l_min   number;
    l_max   number;
    l_num_1 number;
    l_num_2 number;
  begin

    l_min   := to_number( p_item.attribute_01 );
    l_max   := to_number( p_item.attribute_02 );
    l_num_1 := round( sys.dbms_random.value( l_min, l_max ) );

    l_min   := to_number( p_item.attribute_03 );
    l_max   := to_number( p_item.attribute_04 );
    l_num_2 := round( sys.dbms_random.value( l_min, l_max ) );

    -- set correct answer to item session state
    apex_util.set_session_state(
      p_name   => p_item.attribute_05
    , p_value  => blog_util.int_to_vc2( l_num_1 + l_num_2 )
    , p_commit => false
    );

    -- Write header for the output
    apex_plugin_util.print_json_http_header;
    -- Write output
    apex_json.open_object;
    apex_json.write(
      'label'
      ,apex_string.format(
        p_message => '%s&nbsp;%s&nbsp;&#%s&nbsp;%s&nbsp;&#%s&nbsp;&#%s'
      , p0 => p_item.plain_label
      , p1 => to_html_entities( l_num_1 )
      , p2 => ascii('+')
      , p3 => to_html_entities( l_num_2 )
      , p4 => ascii('=')
      , p5 => ascii('?')
      )
    );
    apex_json.close_all;

  exception when others
  then

    apex_debug.error( 'ajax_math_question_field error: %s', sqlerrm );

    l_err := apex_lang.get_message(
      p_name => p_plugin.attribute_02
    );

    if l_err = apex_escape.html( upper( p_plugin.attribute_02 ) )
    then
      l_err := p_plugin.attribute_02;
    end if;

    raise_application_error( -20002 ,  l_err );
    raise;

  end ajax_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_validation_param,
    p_result  in out nocopy apex_plugin.t_item_validation_result
  )
  as
    l_answer  varchar2(4000);
    l_value   varchar2(4000);
    l_result  boolean;
  begin

    if p_param.value is not null
    then

      l_value   := v(p_item.attribute_05);
      l_answer  := p_param.value;

      -- Check is answer correct
      l_result  := case when l_value = l_answer then true else false end;

    else
      l_result := false;
    end if;

    if not l_result
    then

      p_result.message := apex_lang.get_message(
        p_name => p_plugin.attribute_01
      );

      if p_result.message = apex_escape.html( upper( p_plugin.attribute_01 ) )
      then
        p_result.message := p_plugin.attribute_01;
      end if;

    end if;

  end validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
create or replace package body "BLOG_URL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- json for pages and items
  c_page_and_items constant json_object_t := json_object_t.parse(
    '{
      "post": {"page": "POST", "items": "P2_POST_ID"},
      "category": {"page": "CATEGORY", "items": "P14_CATEGORY_ID"},
      "archive": {"page": "ARCHIVES", "items": "P15_ARCHIVE_ID"},
      "tag": {"page": "TAG", "items": "P6_TAG_ID"},
      "unsubscribe": {"page": "POST", "items": "P2_POST_ID,P2_SUBSCRIPTION_ID"},
      "download": {"page": "PGM", "items": "P1003_FILE_NAME", "process": "download"}
    }'
  );

-- cache rss and atom url
  g_rss_url             varchar2(1024);
  g_atom_url            varchar2(1024);
-- cache canonical host url
  g_canonical_host_url  varchar2(1024);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_canonical_host
  as
  begin

    -- get canonical host from blog settings or use APEX provided value
    -- cache value to package private variable
    if g_canonical_host_url is null
    then

      g_canonical_host_url := blog_util.get_attribute_value( 'G_CANONICAL_HOST' );
      -- if host not found from settings, use APEX provided value
      if g_canonical_host_url is null
      then
        g_canonical_host_url := apex_util.host_url();
      end if;
      -- remove trailing slash
      g_canonical_host_url := rtrim( g_canonical_host_url, '/' );

    end if;

  end set_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_canonical_host
  return varchar2
  as
  begin

    return g_canonical_host_url;

  end get_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab(
    p_page        in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_url varchar2(4000);
  begin

    return
      case p_canonical
        when 'YES' then g_canonical_host_url
      end ||
      apex_page.get_url(
        p_application => p_application
      , p_page        => p_page
      , p_session     => ''
      , p_plain_url   => true
      )
    ;

  end get_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in number,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_post_id varchar2(256);
  begin

    l_post_id := blog_util.int_to_vc2( p_post_id );

    return
      get_post(
        p_post_id     => l_post_id
      , p_application => p_application
      , p_canonical   => p_canonical
      )
    ;

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

  l_json := c_page_and_items.get_object( 'post' );

  return
    case p_canonical
      when 'YES' then g_canonical_host_url
    end ||
    apex_page.get_url(
      p_application => p_application
    , p_page        => l_json.get_string( 'page' )
    , p_session     => ''
    , p_items       => l_json.get_string( 'items' )
    , p_values      => p_post_id
    , p_plain_url   => true
    )
  ;

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_category_id varchar2(256);
  begin

    l_category_id := blog_util.int_to_vc2( p_category_id );

    return
      get_category(
        p_category_id => l_category_id
      , p_canonical   => p_canonical
      )
    ;

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

  l_json := c_page_and_items.get_object( 'category' );

    return
      case p_canonical
        when 'YES' then g_canonical_host_url
      end ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_category_id
      , p_plain_url => true
      )
    ;

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_archive_id varchar2(256);
  begin

    l_archive_id := blog_util.int_to_vc2( p_archive_id );

    return
      get_archive(
        p_archive_id  => l_archive_id
      , p_canonical   => p_canonical
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'archive' );

    return
      case p_canonical
        when 'YES' then g_canonical_host_url
      end  ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_archive_id
      , p_plain_url => true
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_tag_id varchar2(256);
  begin

    l_tag_id := blog_util.int_to_vc2( p_tag_id );

    return
      get_tag(
        p_tag_id    => l_tag_id
      , p_canonical => p_canonical
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'tag' );

    return
      case p_canonical
        when 'YES' then g_canonical_host_url
      end ||
      apex_page.get_url(
        p_page      => l_json.get_string( 'page' )
      , p_session   => ''
      , p_items     => l_json.get_string( 'items' )
      , p_values    => p_tag_id
      , p_plain_url => true
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_dynamic_page(
    p_content_id in number
  ) return varchar2
  as
    l_content_id varchar(256);
  begin

    l_content_id := blog_util.int_to_vc2( p_content_id );

    return
      apex_page.get_url(
        p_page    => 'information'
      , p_request => l_content_id
      )
    ;

  end get_dynamic_page;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_process(
    p_application in varchar2 default null,
    p_process     in varchar2 default null,
    p_items       in varchar2 default null,
    p_values      in varchar2 default null,
    p_canonical   in varchar2 default 'YES'
  ) return varchar2
  as
    l_request varchar2(256);
  begin

    l_request :=
      apex_string.format(
        p_message => 'application_process=%s'
      , p0 => p_process
      )
    ;
    return
      case p_canonical
      when 'YES'
      then g_canonical_host_url end ||
      apex_page.get_url(
        p_application => p_application
      , p_page        => 'pgm'
      , p_session     => ''
      , p_request     => l_request
      , p_items       => p_items
      , p_values      => p_values
      , p_plain_url   => true
      )
    ;

  end get_process;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2
  as
    l_url     varchar2(4000);
    l_subs_id varchar2(256);
    l_json    json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'unsubscribe' );

    l_subs_id := blog_util.int_to_vc2( p_subscription_id );

    l_url :=
      apex_page.get_url(
        p_application => p_application
      , p_page        => l_json.get_string( 'page' )
      , p_session     => ''
      , p_items       => l_json.get_string( 'items' )
      , p_values      => p_post_id || ',' || l_subs_id
      , p_plain_url   => true
      )
    ;

    return g_canonical_host_url || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_application in varchar2 default null
  ) return varchar2
  as
  begin
    -- get rss url from blog settings or use default value
    -- cache value to package private variable
    if g_rss_url is null
    then
      -- Fetch RSS URL override from settings
      g_rss_url := blog_util.get_attribute_value( 'G_RSS_URL' );
      -- If there isn't override custruct URL
      if g_rss_url is null
      then
        g_rss_url :=
          get_process(
            p_application => p_application
          , p_process     => 'rss.xml'
          )
        ;
      end if;
    end if;

    return g_rss_url;

  end get_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_atom(
    p_application in varchar2 default null
  ) return varchar2
  as
  begin

    -- cache value to package private variable
    if g_atom_url is null
    then
      g_atom_url :=
        get_process(
          p_application => p_application
        , p_process     => 'atom.xml'
        )
      ;
    end if;

    return g_atom_url;

  end get_atom;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_xsl(
    p_application in varchar2 default null
  ) return varchar2
  as
    l_xsl_url varchar2(4000);
  begin

    -- Fetch XSL URL override from settings
    l_xsl_url := blog_util.get_attribute_value( 'G_RSS_XSL_URL' );
    -- If there isn't override use default XSL
    if l_xsl_url is null
    then
      l_xsl_url :=
        get_process(
          p_application => p_application
        , p_process     => 'rss.xsl'
        )
      ;
    end if;

    return l_xsl_url;

  end get_rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2
  as
    l_sitemap_url varchar2(4000);
  begin

    l_sitemap_url :=
      get_process(
        p_application => p_application
      , p_process     => 'sitemap-index.xml'
      )
    ;

    return l_sitemap_url;

  end get_sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_file(
    p_file_path       in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2
  as
    l_json json_object_t;
  begin

    l_json := c_page_and_items.get_object( 'download' );

    return
      get_process(
        p_application => p_application
      , p_process     => l_json.get_string( 'process' )
      , p_items       => l_json.get_string( 'items' )
      , p_values      => p_file_path
      , p_canonical   => p_canonical
      )
    ;

  end get_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Package initialization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
  -- initialize parameters
  apex_debug.info( '----- Initialize package BLOG_URL -----' );
  set_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
create or replace package body "BLOG_COMMENT"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_whitelist_tags  constant varchar2(256) := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  c_code_block_html constant varchar2(256) := '<pre class="blog-program-code"><code>%s</code></pre>';
  c_app_email       constant varchar2(256) := blog_util.get_attribute_value( 'G_APP_EMAIL' );
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_html_tags(
    p_string    in out nocopy varchar2,
    p_html_tags in varchar2
  )
  as
    l_html_tags apex_t_varchar2;
  begin
    -- create table of html tags
    l_html_tags := apex_string.split( p_html_tags, ':' );
    -- loop table
    for i in 1 .. l_html_tags.count
    loop
      -- remove html tag
      p_string :=
        regexp_replace(
          p_string
        , apex_string.format(
            p_message => '<%0[^>]*>(.*?)<\/%0>'
          , p0 => l_html_tags(i)
          )
        , '', 1, 0, 'in'
        )
      ;
    end loop;

  end remove_html_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_ascii(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove unwanted ascii codes except new line chr 10
    for i in 0 .. 31
    loop
      if i != 10 then
        p_string := trim( replace( p_string, chr(i) ) );
      end if;
    end loop;
  end remove_ascii;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure escape_html(
    p_string in out nocopy varchar2
  )
  as
    l_hasmark constant varchar(10) := '#HashMark#';
  begin

    -- change all hash marks so we can escape those
    -- after calling apex_escape.html_whitelist
    -- escape of hash marks needed to prevent APEX substitutions
    p_string := replace( p_string, '#', l_hasmark );
    -- escape comment html
    p_string := apex_escape.html_whitelist(
      p_html            => p_string
    , p_whitelist_tags  => c_whitelist_tags
    );
    -- escape hash marks
    p_string := replace( p_string, l_hasmark, '	&#35;' );

  end escape_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_code_tab(
    p_comment   in out nocopy varchar2,
    p_code_tab  in out nocopy apex_t_varchar2
  )
  as

    l_code      varchar2(32700);
    l_code_cnt  pls_integer := 0;
    l_start_pos pls_integer := 0;
    l_end_pos   pls_integer := 0;

  begin

    -- check code open tag count
    l_code_cnt := regexp_count( p_comment, '<code>', 1, 'i' );

    -- process code tags if open and close count match ( pre check is for valid HTML )
    if l_code_cnt = regexp_count( p_comment, '<\/code>', 1, 'i' )
    then

      -- collect content inside code tags to collection
      for i in 1 .. l_code_cnt
      loop

        l_code := null;

        -- get code start and end position
        l_start_pos := instr( lower( p_comment ), '<code>' );
        l_end_pos := instr( lower( p_comment ), '</code>' );

        l_code := trim( substr( p_comment, l_start_pos  + 6, l_end_pos - l_start_pos - 6 ) );
        l_code := trim( trim( both chr(10) from l_code ) );

        -- store code tag content to collection and wrap it to pre tag having class
        apex_string.push(
          p_table => p_code_tab
        , p_value =>
            apex_string.format(
              p_message => c_code_block_html
            , p0 => l_code
           )
        );

        -- substitude handled code tag
        p_comment :=
          apex_string.format(
            p_message => '%s%s#BLOG_COMMENT_CODE%s#%s%s'
          , p0 => rtrim( substr( p_comment, 1, l_start_pos - 1 ), chr(10) )
          , p1 => chr(10)
          , p2 => i
          , p3 => chr(10)
          , p4 => ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )
          )
        ;

      end loop;

    end if;

  end build_code_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_comment_html(
    p_comment in out nocopy varchar2
  )
  as
    l_temp        varchar2(32700);
    l_code_row    pls_integer;
    l_code_tab    apex_t_varchar2;
    l_comment_tab apex_t_varchar2;
  begin

    -- process code tags
    build_code_tab(
      p_comment => p_comment
    , p_code_tab => l_code_tab
    );

    -- split comment to collection by new line character
    l_comment_tab := apex_string.split( p_comment, chr(10) );

    -- comment is stored to collection
    -- start building comment with prober html tags
    p_comment := null;

    -- Format comment
    for i in 1 .. l_comment_tab.count
    loop

      l_temp := trim( l_comment_tab(i) );

      -- check if row is code block
      if regexp_like( l_temp, '^#BLOG_COMMENT_CODE[0-9]+\#$' )
      then
        -- get code block row number
        l_code_row := regexp_substr( l_temp, '[0-9]+' );
        -- close p tag, insert code block
        -- and open p tag again for text
        p_comment :=
          apex_string.format(
            p_message => '%s%s'
          , p0 => p_comment
          , p1 => l_code_tab( l_code_row )
          )
        ;
      else
        -- append text if row is not empty
        if l_temp is not null
        then
          p_comment :=
            apex_string.format(
              p_message => '%s<p>%s</p>'
            , p0 => p_comment
            , p1 => l_temp
            )
          ;
        end if;

      end if;

    end loop;

  end build_comment_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function plain_text(
    p_string in varchar2
  ) return varchar2
  as
    l_string varchar2(32700);
  begin

    l_string := p_string;

    -- remove unwanted ascii
    remove_ascii(
      p_string => l_string
    );
    -- Unescape HTML entities
    l_string := utl_i18n.unescape_reference( l_string );
    -- remove code and anchor HTML tags
    remove_html_tags(
      p_string    => l_string
    , p_html_tags => 'code'
    );
    -- add space before html tag
    -- needed for language AI sentence recognition
    l_string := replace( l_string, '<', ' <' );
    -- remove HTML
    l_string := apex_escape.striphtml( l_string );
    -- remove extra whitespaces
    l_string := blog_util.remove_whitespace( l_string );

    return l_string;

  end plain_text;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function short_text(
    p_string      in varchar2,
    p_plain_text  in boolean default true,
    p_str_length  in number default 100
  ) return varchar2
  as
    l_length  pls_integer;
    l_string  varchar2(32700);
  begin

    l_string := p_string;

    if p_plain_text
    then
      l_string := plain_text( l_string );
    end if;

    l_length := instr( l_string, ' ', p_str_length );

    return
      case when l_length > 0
        then substr( l_string, 1, l_length ) || ' ...'
        else l_string
      end
    ;

  end short_text;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment in varchar2
  ) return varchar2
  as
    l_comment varchar2(32700);
  begin

    l_comment := p_comment;
    -- remove unwanted ascii
    remove_ascii(
      p_string => l_comment
    );
    -- remove anchors tags
    remove_html_tags(
      p_string    => l_comment
    , p_html_tags => 'a'
    );
    -- escape HTML
    escape_html(
      p_string => l_comment
    );
    -- build comment HTML
    build_comment_html(
      p_comment => l_comment
    );

    apex_debug.info( 'Formatted comment: %s', l_comment );
    -- return comment
    return l_comment;

  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment     in varchar2,
    p_max_length  in number default 4000
  ) return varchar2
  as
    l_xml       xmltype;
    l_result    varchar2(32700);
    l_err_mesg  varchar2(32700);

    xml_parsing_failed exception;
    pragma exception_init( xml_parsing_failed, -31011 );
  begin

    -- check formatted comment length
    if length( p_comment ) > p_max_length
    then
      -- set error message
      l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_LENGTH';
    else
      -- check HTML is valid
      -- TO DO see item 1 from package specs
      begin
        l_xml := xmltype.createxml(
          apex_string.format(
            p_message => '<comment>%s</comment>'
          , p0 => p_comment
          )
        );
      exception when xml_parsing_failed then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_HTML';
      end;

      if short_text( p_comment ) is null
      then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_PREVIEW';
      end if;

    end if;

    if l_err_mesg is not null
    then
      -- prepare return validation error message
      l_result := apex_lang.get_message(
        p_name => l_err_mesg
      );
    end if;
    -- return validation result
    -- if validation fails we return error message stored to variable
    return l_result;

  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_email(
    p_email     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin
    -- TO DO see item 3 from package specs

    -- do some basic check for email address
    if not regexp_like( p_email, '^.*\@.*\..*$' )
    then
      -- if validation fails prepare error message
      l_err_mesg := p_err_mesg;

    end if;

    return l_err_mesg;

  end is_email;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure flag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop

      begin
        insert into blog_comment_flags( comment_id, flag )
          values( p_comment_id, l_flags(i) )
        ;
      exception when dup_val_on_index
      then
        apex_debug.warn( 'Duplicate flag %s for comment id: %s', l_flags(i), p_comment_id );
      end;

    end loop;

  end flag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unflag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop

      delete from blog_comment_flags
      where 1 = 1
        and comment_id = p_comment_id
        and flag = l_flags(i)
      ;

      if sql%rowcount != 1
      then
        apex_debug.warn( 'Removed %s %s flags from comment id: %s', sql%rowcount, l_flags(i), p_comment_id );
      end if;

    end loop;

  end unflag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  )
  as
    l_post_id number;
  begin

    l_post_id   := to_number( p_post_id );

    -- if application email address is not set, exit from procedure
    if c_app_email is null
    then
      apex_debug.warn( 'application email address is not set' );
      return;
    end if;

    -- get values for APEX email template
    -- send notify email if blog email address is set
    -- and blogger has set email
    for c1 in(
      select
        v1.blogger_email
      , json_object(
          'APP_NAME'      value p_app_name
        , 'BLOGGER_NAME'  value v1.blogger_name
        , 'POST_TITLE'    value v1.title
        , 'POST_LINK'     value
            blog_url.get_post(
              p_post_id   => v1.id
            , p_canonical => 'YES'
            )
        ) as placeholders
      from blog_v_all_posts v1
      where 1 = 1
      and v1.id = l_post_id
      and v1.blogger_email is not null
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
      , c1.blogger_email
      , c_app_email
      , p_email_template
      , c1.placeholders
      );
      -- send notify email
      apex_mail.send(
        p_to                  => c1.blogger_email
      , p_from                => c_app_email
      , p_template_static_id  => p_email_template
      , p_placeholders        => c1.placeholders
      );

    end loop;

  end new_comment_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  )
  as
    l_watch_end     date;
    l_post_id       number;
    l_watch_months  number;
  begin

    l_post_id := to_number( p_post_id );

    -- if application email address is not set, exit from procedure
    if c_app_email is null
    then
      apex_debug.warn( 'application email address is not set' );
      return;
    end if;

    -- fetch comment watch expires
    l_watch_months := to_number(
        blog_util.get_attribute_value( 'G_COMMENT_WATCH_MONTHS' )
      ) * -1
    ;
    l_watch_end := add_months( trunc( sysdate ), l_watch_months );

    -- send notify users that have subscribed to replies to comment
    for c1 in(
      select t2.email
      ,json_object(
         'APP_NAME'         value p_app_name
        ,'POST_TITLE'       value v1.title
        ,'POST_LINK'        value
            blog_url.get_post(
              p_application => p_app_id
            , p_post_id     => p_post_id
            , p_canonical   => 'YES'
            )
        ,'UNSUBSCRIBE_LINK' value
            blog_url.get_unsubscribe(
              p_application     => p_app_id
            , p_post_id         => p_post_id
            , p_subscription_id => t1.id
            )
       ) as placeholders
      from blog_comment_subscribers t1
      join blog_subscribers_email t2
        on t1.email_id = t2.id
      join blog_v_all_posts v1
        on t1.post_id = v1.id
      where 1 = 1
        and t1.is_active
          * t2.is_active
          * case v1.post_status_code when 'PUBLISHED' then 1 else 0 end
          = 1
        and v1.id = l_post_id
        -- send notification if subscription is created less than months ago specified in settings
        and t1.subscription_date > l_watch_end
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
      , c1.email
      , c_app_email
      , p_email_template
      , c1.placeholders
      );
      -- send notify email
      apex_mail.send(
        p_from => c_app_email
      , p_to => c1.email
      , p_template_static_id => p_email_template
      , p_placeholders => c1.placeholders
      );

    end loop;

  end reply_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure subscribe(
    p_post_id in varchar2,
    p_email   in varchar2
  )
  as
    l_email     varchar2(256);
    l_post_id   number;
    l_email_id  number;
  begin

    l_email   := trim( lower( p_email ) );
    l_post_id := to_number( p_post_id );

    -- subscribe user to get notify on reply to comment
    if p_email is not null
    and p_post_id is not null
    then
      -- check if email address already exists and fetch id
      begin
        select id
        into l_email_id
        from blog_subscribers_email
        where 1 = 1
          and email = l_email
        ;
      -- if email address not exists, insert and return id
      exception when no_data_found
      then
        insert into
            blog_subscribers_email( email, is_active )
        values
          ( l_email, 1 )
        returning id into l_email_id
        ;
      end;
      -- insert post to email relation
      begin
        insert into
          blog_comment_subscribers( post_id, email_id, subscription_date, is_active )
        values
          ( p_post_id, l_email_id, trunc( sysdate ), 1 )
        ;
      -- if subscription already exists update subscription
      exception when dup_val_on_index
      then
        update blog_comment_subscribers
          set subscription_date = trunc( sysdate )
        where 1 = 1
          and is_active = 1
          and post_id = p_post_id
          and email_id = l_email_id
        ;
      end;
    end if;

  end subscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unsubscribe(
    p_subscription_id in varchar2
  )
  as
  begin
    -- remove user subscribtion to get notify from replies
    delete
      from blog_comment_subscribers
    where 1 = 1
      and id = p_subscription_id
    ;
  end unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure auto_approve(
    p_comment_id in varchar2
  )
  as
    l_cnt number;
  begin

    apex_debug.info( 'Automaticallu approve comment id %s if sentiment is Positive', p_comment_id );

    -- check that comment exists
    select 1
    into l_cnt
    from blog_comment_sentiments t1
    where 1 = 1
      and t1.comment_id = p_comment_id
      and t1.sentiment_json.documentSentiment = 'Positive'
    ;

    -- remove MODERATE flag
    unflag_comment(
      p_comment_id  => p_comment_id
    , p_flags       => 'MODERATE'
    );

    -- set comment active
    update blog_comments
      set is_active = 1
    where 1 = 1
      and id = p_comment_id
    ;

  exception when no_data_found
  then
    apex_debug.warn( 'Comment id %s not found for automatic approve', p_comment_id );
  end auto_approve;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_COMMENT";
/
create or replace package body "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  c_link_canonical_template constant varchar2(64) := '<link rel="canonical" href="%s">';
  c_link_alternate_template constant varchar2(64) := '<link rel="alternate" href="%s" title="%s &raquo; %s" type="%s">';

  g_link_canonical varchar2(1024);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta
  return varchar2
  as
  begin
    return '<meta name="robots" value="noindex">';
  end get_robots_noindex_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_tab_canonical_link(
    p_page  in varchar2,
    p_url   out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for tab
    if p_page is not null
    then
      p_url :=
        blog_url.get_tab(
          p_page       => p_page
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      -- if p_page is not defined
      apex_debug.warn( 'Canonical link tag not generated for tab.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_post_canonical_link(
    p_post_id in varchar2,
    p_url     out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for post
    if p_post_id is not null
    then
      p_url :=
        blog_url.get_post(
          p_post_id      => p_post_id
        , p_canonical    => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for post.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_category_canonical_link(
    p_category_id in varchar2,
    p_url         out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for category
    if p_category_id is not null
    then
      p_url :=
        blog_url.get_category(
          p_category_id  => p_category_id
        , p_canonical    => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for category.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_archive_canonical_link(
    p_archive_id in varchar2,
    p_url        out nocopy varchar2
  ) return varchar2
  as
  begin
      -- generate canonical link for archives
    if p_archive_id is not null
    then
      p_url :=
        blog_url.get_archive(
          p_archive_id => p_archive_id
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for archive.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_tag_canonical_link(
    p_tag_id in varchar2,
    p_url    out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for tags
    if p_tag_id is not null
    then
      p_url :=
        blog_url.get_tag(
          p_tag_id     => p_tag_id
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for tag.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_tag_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name  in varchar2,
    p_message   in varchar2
  ) return varchar2
  as
    l_rss_url     varchar2(4000);
    l_rss_anchor  varchar2(4000);
  begin

    -- get rss url
    l_rss_url :=  blog_url.get_rss;

    -- generate RSS anchor
    l_rss_anchor :=
      apex_string.format(
        p_message =>
          '<a href="%s" aria-label="%s &raquo; %s" rel="alternate" type="%s" class="%s">'
          || '<span aria-hidden="true" class="%s"></span>'
          || '</a>'
      , p0 => l_rss_url
      , p1 => p_app_name
      , p2 => p_message
      , p3 => blog_util.g_mime_rss
      , p4 => 't-Button t-Button--noLabel t-Button--icon t-Button--link'
      , p5 => 'fa fa-rss-square fa-3x fa-lg u-color-8-text'
      )
    ;
    -- return generated HTML
    return l_rss_anchor;

  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2
  as
    l_app_id    number;
    l_rss_url   varchar2(256);
    l_rss_link  varchar2(2000);
    --l_rss_title varchar2(4000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- get rss url
      l_rss_url := blog_url.get_rss;

      -- generate HTML
      l_rss_link :=
        apex_string.format(
          p_message => c_link_alternate_template
        , p0 => l_rss_url
        , p1 => p_app_name
        , p2 => p_message
        , p3 => blog_util.g_mime_rss
        )
      ;
    end if;
    -- return generated HTML
    return l_rss_link;

  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_atom_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2
  as
    l_app_id      number;
    l_atom_url    varchar2(256);
    l_atom_link   varchar2(2000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- get atom url
      l_atom_url := blog_url.get_atom;

      -- generate HTML
      l_atom_link :=
        apex_string.format(
          p_message => c_link_alternate_template
        , p0 => l_atom_url
        , p1 => p_app_name
        , p2 => p_message
        , p3 => blog_util.g_mime_atom
        )
      ;

    end if;
    -- return generated HTML
    return l_atom_link;

  end get_atom_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_button(
    p_app_id          in varchar2,
    p_title           in varchar2,
    p_action          in varchar2,
    p_icon_classes    in varchar2,
    p_button_classes  in varchar2 default null,
    p_build_option    in varchar2 default null
  ) return varchar2
  as
    l_app_id  number;
    l_button  varchar2(32700) := '<span class="blog-hidden"></span>';
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should button generated
    if p_build_option is null or
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- generate button HTML
      l_button :=
        apex_string.format(
          p_message =>
            '<button type="button" data-action="%0" title="%1" aria-label="%1" class="%2" data-no-update="true">' ||
            '<span class="t-Icon fa %3" aria-hidden="true"></span>' ||
            '</button>'
        , p0 => p_action
        , p1 => p_title
        , p2 => coalesce( p_button_classes, 't-Button t-Button--noLabel t-Button--icon t-Button--link' )
        , p3 => p_icon_classes
        )
      ;
    end if;

    return l_button;

  end get_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure prn_html(
    p_markdown in apex_application_global.vc_arr2
  )
  as
    l_response clob;
  begin

    l_response := apex_string.table_to_clob(
      p_table => p_markdown
    , p_sep   => null
    );

    l_response := apex_markdown.to_html(
      p_markdown              => l_response
    , p_softbreak             => apex_application.lf
    , p_embedded_html_mode    => apex_markdown.c_embedded_html_escape
    , p_extra_link_attributes => apex_t_varchar2( 'target', '_blank' )
    );

    apex_util.prn(
      p_clob    => l_response
    , p_escape  => false
    );

  end prn_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
create or replace package body "BLOG_OCI_OS"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );

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
    param_t( 'remote_server_static_id' ) := 'BLOG_OBJECT_STORAGE';
    param_t( 'bucket_param_name' ) := 'G_OCI_OS_BUCKET';
    param_t( 'namespace_param_name' ) := 'G_OCI_OS_NAMESPACE';
    param_t( 'region_param_name' ) := 'G_OCI_OS_REGION';
    param_t( 'bucket_url_param_name' ) := 'G_OCI_OS_BUCKET_URL';
    param_t( 'bucket' ) := blog_util.get_attribute_value( param_t( 'bucket_param_name' ) );
    param_t( 'namespace' ) := blog_util.get_attribute_value( param_t( 'namespace_param_name' ) );

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

    -- Debug parameters
    apex_debug.info( 'Object storage build option name: %s', param_t( 'build_option_name' ) );
    apex_debug.info( 'Object storage module static id: %s', param_t( 'module_static_id' ) );
    apex_debug.info( 'Object storage remote server static id: %s', param_t( 'remote_server_static_id' ) );
    apex_debug.info( 'Object storage bucket parameter name: %s', param_t( 'bucket_param_name' ) );
    apex_debug.info( 'Object storage namespace parameter name: %s', param_t( 'namespace_param_name' ) );
    apex_debug.info( 'Object storage region parameter name: %s', param_t( 'region_param_name' ) );
    apex_debug.info( 'Object storage bucket url parameter name: %s', param_t( 'bucket_url_param_name' ) );
    apex_debug.info( 'Object storage bucket: %s', param_t( 'bucket' ) );
    apex_debug.info( 'Object storage namespace: %s', param_t( 'namespace' ) );
    apex_debug.info( 'Object storage base URL: %s', param_t( 'base_url' ) );
    apex_debug.info( 'Object storage credential: %s', param_t( 'credential' ) );

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

    -- debug request status
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

      -- save response header to array for getting value by header name
      response_heade_t( lower( trim( apex_web_service.g_headers(i).name ) ) ) :=
        trim( apex_web_service.g_headers(i).value )
      ;

    end loop;

  end process_headers;
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

    -- get header by name if it exists in array
    if response_heade_t.exists( l_header )
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
    l_top_obj json_element_t;
    l_err_obj json_object_t;
  begin

    apex_debug.error( 'Error response body: %s', p_response );

    -- parse response to json
    if p_response is not null and p_response is json
    then

      l_top_obj := json_element_t.parse( p_response );

      -- if top level is object try get error code and error message
      if ( l_top_obj.is_object )
      then

        l_err_obj := treat( l_top_obj as json_object_t );

        p_code := l_err_obj.get_string( 'code' );
        p_message := l_err_obj.get_string( 'message' );

      end if;

    end if;

    apex_debug.info( 'Error code: %s, error message: %s', p_code, p_message );

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
    , p_value_04  => p_cache_control
    , p_name_05   => case when p_client_request_id is not null then 'opc-client-request-id' end
    , p_value_05  => p_client_request_id
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
  function get_param_value(
    p_param_name in varchar2
  ) return varchar2
  as
  begin
    return param_t( p_param_name );
  end get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_object_storage(
    p_bucket_name   in varchar2,
    p_base_url      in varchar2,
    p_build_status  in varchar2
  )
  as
    c_bucket_url_template constant varchar2(64) := 'https://%0.objectstorage.%1.oci.customer-oci.com/n/%0/b/%2/o/';

    l_attributes   apex_t_varchar2;

    l_base_url    varchar2(2000);
    l_bucket_url  varchar2(2000);
    l_region      varchar2(256);
    l_namespace   varchar2(256);
  begin

    apex_debug.info( 'Set object storage buid option %s status: %s', param_t( 'build_option_name' ), p_build_status );
    -- Set build option status for the storage feature
    blog_admin.update_feature(
      p_build_option_name => param_t( 'build_option_name' )
    , p_build_status      => p_build_status
    );

    if p_build_status = apex_application_admin.c_build_option_status_include
    then

      apex_debug.info( 'Set object storage bucket: %s', p_bucket_name );

      apex_string.plist_push( l_attributes, param_t( 'bucket_param_name' ), p_bucket_name );

      l_region :=
        substr(
          param_t( 'base_url' )
        , instr( param_t( 'base_url' ), '.', 1, 1 ) + 1
        , instr( param_t( 'base_url' ), '.', 1, 2 ) - 1 - instr( param_t( 'base_url' ), '.', 1, 1 )
        )
      ;

      apex_debug.info( 'Set object storage region: %s', l_region );

      apex_string.plist_push( l_attributes, param_t( 'region_param_name' ), l_region );

      l_namespace := get_namespace;

      apex_debug.info( 'Set object storage  namespace: %s', l_namespace );

      apex_string.plist_push( l_attributes, param_t( 'namespace_param_name' ), l_namespace );

      l_bucket_url :=
        apex_string.format(
          p_message => c_bucket_url_template
        , p0 => l_namespace
        , p1 => l_region
        , p2 => p_bucket_name
        )
      ;

      apex_debug.info( 'Set object storage bucket URL: %s', l_bucket_url );

      apex_string.plist_push( l_attributes, param_t( 'bucket_url_param_name' ), l_bucket_url );

      blog_admin.set_attribute_value(
        p_attribute_list  => l_attributes
      );

      l_base_url := rtrim( p_base_url, '/' ) || '/';

      apex_debug.info( 'Set object storage remote server %s: %s', param_t( 'remote_server_static_id' ), l_base_url );
      -- Set remote server URL
      apex_application_admin.set_remote_server(
        p_static_id => param_t( 'remote_server_static_id' )
      , p_base_url  => l_base_url
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
    l_file_name     varchar2(256);
    l_content_type  varchar2(256);
    l_blob_content  blob;
    l_zip_file      blob;
  begin

    for c1 in(
      select
        t1.file_path
      , t1.file_name
      , t1.etag
      , count(1) over() as num_rows
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
      -- get file from object storage
      get_object(
        p_file_path         => c1.file_path
      , p_client_request_id => p_client_request_id
      , p_content_type      => l_content_type
      , p_blob_content      => l_blob_content
      );

      if not apex_error.have_errors_occurred
      then
        -- add files to zip if more than 1 is selected
        if c1.num_rows = 1
        then
          l_file_name := c1.file_name;
        else
          apex_zip.add_file(
            p_zipped_blob => l_zip_file
          , p_file_name   => c1.file_path
          , p_content     => l_blob_content
          );
        end if;

      else
        -- exit from loop if error have occured
        exit;
      end if;

    end loop;

    -- if we have zip
    if l_zip_file is not null
    then

      apex_zip.finish(
        p_zipped_blob => l_zip_file
      );

      if not apex_error.have_errors_occurred
      then

        l_blob_content := l_zip_file;
        l_content_type := 'application/zip';
        l_file_name := blog_file.get_zip_name;

      end if;

    end if;
    -- if no error download file/zip
    if not apex_error.have_errors_occurred
    then
      apex_http.download(
        p_blob          => l_blob_content
      , p_content_type  => l_content_type
      , p_filename      => l_file_name
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
  apex_debug.info( '----- Initialize package BLOG_OCI_OS -----' );
  init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_OCI_OS";
/
create or replace package body "BLOG_XML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_mime_xml  constant varchar2(40)     := 'application/xml';
  c_char_set  constant varchar2(5)      := 'UTF-8';
  c_headers   constant apex_t_varchar2  := apex_t_varchar2( 'Cache-Control', 'Content-Disposition', 'Last-Modified' );
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_app_name  in varchar2,
    p_app_desc  in varchar2
  )
  as
    l_xml           xmltype;
    l_rss           blob;
    l_lang          varchar2(256);
    l_app_id        varchar2(256);
    l_rss_url       varchar2(4000);
    l_xsl_url       varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_name      varchar2(4000);
    l_app_desc      varchar2(4000);
    l_cache_control varchar2(256);
    l_last_modified varchar2(256);
    l_max_published timestamp;

    l_rss_version   constant varchar2(5)  := '2.0';

  begin

    l_lang := apex_application.g_browser_language;

    -- RSS feed URL
    l_rss_url   := blog_url.get_rss;
    -- blog name
    l_app_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'P0_BLOG_APP_NAME' )
    );
    -- rss feed description
    l_app_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'P0_BLOG_APP_DESC' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_page       => 'HOME'
      ,p_canonical  => 'YES'
    );
    -- rss transformations (XSLT)
    l_xsl_url := blog_url.get_rss_xsl;

    -- generate RSS
    select xmlserialize(
      content xmlconcat(
        case when l_xsl_url is not null
          then xmlpi( "xml-stylesheet",
            apex_string.format(
               p_message => 'type="text/xsl" href="%s" media="screen"'
              ,p0 => l_xsl_url
            )
          )
        end,
        xmlelement(
          "rss", xmlattributes(
             l_rss_version                              as "version"
            ,'http://purl.org/dc/elements/1.1/'         as "xmlns:dc"
            ,'http://purl.org/rss/1.0/modules/content/' as "xmlns:content"
            ,'http://www.w3.org/2005/Atom'              as "xmlns:atom"
          )
          ,xmlelement(
            "channel"
            ,xmlelement(
              "atom:link"
              ,xmlattributes(
                'self'                as "rel"
                ,l_rss_url            as "href"
                ,blog_util.g_mime_rss as "type"
              )
            )
            ,xmlforest(
              l_app_name  as "title"
              ,l_home_url as "link"
              ,l_app_desc as "description"
              ,l_lang     as "language"
            )
            ,xmlagg(
              xmlelement(
                "item"
                ,xmlelement( "title",           posts.post_title )
                ,xmlelement( "dc:creator",      posts.blogger_name )
                ,xmlelement( "category",        posts.category_title )
                ,xmlelement( "link",            posts.absolute_url )
                ,xmlelement( "description",     posts.post_desc )
                ,xmlelement( "content:encoded", xmlcdata( posts.body_html ) )
                ,xmlelement( "pubDate",
                  to_char(
                    sys_extract_utc( posts.published_on )
                    ,blog_util.g_rfc_2822_date
                    ,blog_util.g_nls_date_lang
                  )
                )
                ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id )
              ) order by posts.published_on desc
            )
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    ,max( posts.published_on ) as max_published
    into l_rss, l_max_published
    from blog_v_posts_last20 posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS' )
      )
    ;

    l_last_modified :=
      to_char(
         sys_extract_utc( l_max_published )
        ,blog_util.g_rfc_2822_date
        ,blog_util.g_nls_date_lang
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_rss
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="rss.xml"', l_last_modified  )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure atom(
    p_app_name  in varchar2,
    p_app_desc  in varchar2
  )
  as
    l_xml           xmltype;
    l_atom          blob;
    l_app_id        varchar2(256);
    l_atom_url      varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_name      varchar2(4000);
    l_app_desc      varchar2(4000);
    l_cache_control varchar2(256);
    l_last_modified varchar2(256);
    l_max_published timestamp;
  begin

    -- atom feed URL
    l_atom_url   := blog_url.get_atom;
    -- blog name
    l_app_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'P0_BLOG_APP_NAME' )
    );
    -- atom feed description
    l_app_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'P0_BLOG_APP_DESC' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_page       => 'HOME'
      ,p_canonical  => 'YES'
    );

    -- generate atom feed
    select xmlserialize( content
      xmlelement(
        "feed", xmlattributes(
          'http://www.w3.org/2005/Atom' as "xmlns"
        )
        ,xmlelement( "link"
          ,xmlattributes(
            'self'                  as "rel"
            ,l_atom_url             as "href"
            ,blog_util.g_mime_atom  as "type"
          )
        )
        ,xmlforest(
          l_app_name  as "title"
          ,l_app_desc as "subtitle"
          ,l_atom_url as "id"
          ,to_char(
            sys_extract_utc( max( posts.published_on ) )
            ,blog_util.g_iso_8601_date
            ,blog_util.g_nls_date_lang
          )           as "updated"
        )
        ,xmlagg(
          xmlelement( "entry"
            ,xmlelement( "title", posts.post_title )
            ,xmlelement( "author"
              ,xmlelement( "name", posts.blogger_name )
            )
            ,xmlelement( "category"
              ,xmlattributes(
                posts.category_title  as "label"
                ,posts.category_title as "term"
              )
            )
            ,xmlelement( "link"
              ,xmlattributes( posts.absolute_url as "href" )
            )
            ,xmlelement( "summary", posts.post_desc )
            ,xmlelement( "content"
              ,xmlattributes( 'html' as "type" )
              ,xmlcdata( posts.body_html )
            )
            ,xmlelement( "updated",
              to_char(
                sys_extract_utc( posts.published_on )
                ,blog_util.g_iso_8601_date
                ,blog_util.g_nls_date_lang
              )
            )
            ,xmlelement( "id",  posts.absolute_url )
          ) order by posts.published_on desc
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    ,max( posts.published_on ) as max_published
    into l_atom, l_max_published
    from blog_v_posts_last20 posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS' )
      )
    ;

    l_last_modified :=
      to_char(
         sys_extract_utc( l_max_published )
        ,blog_util.g_rfc_2822_date
        ,blog_util.g_nls_date_lang
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_atom
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="atom.xml"', l_last_modified  )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end atom;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_css_file in varchar2
  )
  as
    l_xml           xmltype;
    l_xsl           blob;
    l_css_url       varchar2(1024);
    l_cache_control varchar2(256);
  begin

    -- Generate relaive URL for CSS file
    if p_css_file not like 'http%'
    then
      l_css_url := apex_util.host_url( 'APEX_PATH' );
      l_css_url := substr( l_css_url, instr( l_css_url, '/', 1, 3 ) );
    end if;

    l_css_url := l_css_url || p_css_file;

    l_xml :=
      xmltype(
        apex_string.format(
          p_message => '
            <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/">
              <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. -->
              <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />
              <!-- Start matching at the Channel node within the XML RSS feed. -->
              <xsl:template match="/rss/channel">
                <html lang="%s">
                <head>
                  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                  <title>
                    <xsl:value-of select="title" />
                  </title>
                  <link rel="stylesheet" type="text/css" href="%s" />
                </head>
                <body>
                  <h1><a class="blog-rss--title" href="{ link }"><xsl:value-of select="title" /></a></h1>
                  <h2 class="blog-rss--description"><xsl:value-of select="description" /></h2>
                  <xsl:for-each select="./item">
                    <article class="blog-rss--post">
                      <header>
                        <h3 class="blog-rss--postHeader"><a href="{ link }"><xsl:value-of select="title" /></a></h3>
                      </header>
                      <p class="blog-rss--postBody"><xsl:value-of select="description" /></p>
                    </article>
                  </xsl:for-each>
                </body>
                </html>
              </xsl:template>
            </xsl:stylesheet>'
          ,p0 => apex_application.g_browser_language
          ,p1 => l_css_url
        )
      )
    ;

    select
      xmlserialize(
        content l_xml as blob encoding c_char_set indent size = 2
      ) xsl
    into l_xsl
    from dual
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS_XSL' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xsl
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="rss.xsl"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  )
  as
    l_url           varchar2(4000);
    l_xml           blob;
    l_cache_control varchar2(256);
    l_build_option  constant varchar2(256) := 'BLOG_FEATURE_SITEMAP';
  begin

    -- get url to call sitemaps process
    l_url := blog_url.get_process;

    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "sitemap"
              ,xmlelement( "loc", l_url || t1.process_name
              )
            ) order by t1.execution_sequence
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from apex_application_page_proc t1
    where 1 = 1
      and t1.process_name != p_process_name
      and t1.application_id = p_app_id
      and t1.page_id = p_app_page_id
      and t1.build_option = l_build_option
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-index.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main(
    p_app_id      in varchar2,
    p_page_group  in varchar2
  )
  as
    l_xml   blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tab(
                   p_page       => v1.page_alias
                  ,p_canonical  => 'YES'
                )
              )
            ) order by v1.page_id
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from apex_application_pages v1
    where 1 = 1
      and v1.application_id = p_app_id
      and v1.page_group = p_page_group
      and case
        when v1.build_option is null
        then apex_application_admin.c_build_option_status_include
        else
          apex_application_admin.get_build_option_status(
             p_application_id    => p_app_id
            ,p_build_option_name => v1.build_option
          )
      end = apex_application_admin.c_build_option_status_include
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-main.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_post(
                   p_post_id    => posts.post_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc(
                    greatest( posts.published_on, posts.changed_on )
                  )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by posts.published_on desc
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from blog_v_posts posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-posts.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_categories
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_category(
                   p_category_id  => cat.category_id
                  ,p_canonical    => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( cat.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by cat.display_seq desc
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from blog_v_categories cat
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-categories.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_archives
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_archive(
                   p_archive_id => arc.archive_year
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( arc.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by arc.archive_year desc
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from blog_v_archive_year arc
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-archives.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_archives;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_tags
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tag(
                   p_tag_id     => tags.tag_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( tags.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by tags.changed_on
          )
        )
      )
      as blob encoding c_char_set indent size = 2
    )
    into l_xml
    from blog_v_tags tags
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => c_mime_xml
      ,p_header_names   => c_headers
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-tags.xml"', null )
      ,p_charset        => c_char_set
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 400 );
    raise;

  end sitemap_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
create or replace package body "BLOG_AI"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );
  param_t str_t;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure init_params
  as
  begin

    -- set valus for session
    param_t( 'lang_ai_static_id' ) := 'BLOG_LANGUAGE_AI';
    param_t( 'gen_ai_static_id' ) := 'BLOG_OPEN_AI_API';
    param_t( 'gen_ai_credential_static_id' ) := 'BLOG_OPEN_AI_API_KEY';
    param_t( 'lang_ai_build_option' ) := 'BLOG_FEATURE_LANGUAGE_AI';
    param_t( 'gen_ai_build_option' ) := 'BLOG_FEATURE_GENERATIVE_AI';
    param_t( 'gen_ai_generate_msg' ) := 'BLOG_AI_GENERATE_MESSAGE';
    param_t( 'gen_ai_generate_prompt_msg' ) := 'BLOG_AI_GENERATE_PROMPT';
    param_t( 'lang_ai_compartment_param_name') := 'G_OCI_LANG_AI_COMPARTMENT_OCID';
    param_t( 'lang_ai_compartment_ocid' ) := blog_util.get_attribute_value( param_t( 'lang_ai_compartment_param_name' ) );

    -- Debug parameters
    apex_debug.info( 'Language AI remote server static id: %s', param_t( 'lang_ai_static_id' ) );
    apex_debug.info( 'Generative AI service static id: %s', param_t( 'gen_ai_static_id' ) );
    apex_debug.info( 'Generative AI credential static id: %s', param_t( 'gen_ai_credential_static_id' ) );
    apex_debug.info( 'Language AI build option name: %s', param_t( 'lang_ai_build_option' ) );
    apex_debug.info( 'Generative AI build option name: %s', param_t( 'gen_ai_build_option' ) );
    apex_debug.info( 'Generative AI generate message: %s', param_t( 'gen_ai_generate_msg' ) );
    apex_debug.info( 'Generative AI generate prompt message: %s', param_t( 'gen_ai_generate_prompt_msg' ) );
    apex_debug.info( 'Language AI comparment parameter name : %s', param_t( 'lang_ai_compartment_param_name' ) );
    apex_debug.info( 'Language AI comparment OCID : %s', param_t( 'lang_ai_compartment_ocid') );

  end init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_sentiments
  as
    l_compartnet_id varchar2(256);
    l_document      clob;
    l_params        apex_exec.t_parameters;
  begin

    -- Loop through comments that have not yet been analyzed
    for c1 in (
      with q1 as(
        select
          id
        , v1.body_html
        , mod( rownum, floor( count(1) over() / 5 ) ) as batch_group
        from blog_v_all_comments v1
        where 1 = 1
          and sentiment is null
      )
      select
        json_arrayagg(
          json_object(
            'key'   is blog_util.int_to_vc2( q1.id ),
            'text'  is blog_comment.plain_text( q1.body_html )
          ) returning clob
        ) as document
      from q1
      group by
        q1.batch_group
    ) loop

      -- Set attributes for the language AI request
      apex_exec.add_parameter( l_params, 'compartmentId', param_t( 'lang_ai_compartment_ocid') );
      apex_exec.add_parameter( l_params, 'documents', c1.document );
      apex_exec.add_parameter( l_params, 'level', 'SENTENCE' );
      apex_exec.add_parameter( l_params, 'languageCode', 'en' );
      apex_exec.add_parameter( l_params, 'batchDocumentService', 'batchDetectLanguageSentiments' );

      -- Call language AI to analyze sentiment
      apex_exec.execute_rest_source(
        p_static_id           => param_t( 'lang_ai_module_static_id' ),
        p_operation_static_id => 'batch_document',
        p_parameters          => l_params
      );

      -- Retrieve response body
      l_document := apex_exec.get_parameter_clob( l_params, 'response_body' );

      -- Insert response JSON into the database
      merge_sentiment(
        p_language  => 'en'
      , p_documents => l_document
      );

      dbms_session.sleep( 1 );

    end loop;

  end get_sentiments;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name in varchar2
  ) return varchar2
  as
  begin
    return param_t( p_param_name );
  end get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  )
  as
    l_attributes  apex_t_varchar2;
    l_base_url    varchar2(2000);
  begin

    apex_debug.info( 'Set buid option %s status: %s', param_t( 'lang_ai_build_option' ), p_build_status );
    -- Set build option status for the language AI feature
    blog_admin.update_feature(
      p_build_option_name => param_t( 'lang_ai_build_option' )
    , p_build_status      => p_build_status
    );

    -- If build option status is INCLUDE
    if p_build_status = apex_application_admin.c_build_option_status_include
    then

      apex_debug.info( 'Set compartment OCID: %s', p_compartment_id );
      -- Set attribute name and value
      apex_string.plist_push( l_attributes, param_t( 'lang_ai_compartment_param_name' ), p_compartment_id );

      -- Update attribute
      blog_admin.set_attribute_value(
        p_attribute_list => l_attributes
      );

      l_base_url := rtrim( p_base_url, '/' ) || '/';

      apex_debug.info( 'Set remote server %s: %s', param_t( 'lang_ai_static_id' ), l_base_url );
      -- Set remote server URL
      apex_application_admin.set_remote_server(
        p_static_id => param_t( 'lang_ai_static_id' )
      , p_base_url  => l_base_url
      );

    end if;

  end set_lang_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status    in varchar2,
    p_api_key         in varchar2,
    p_base_url        in varchar2,
    p_ai_model_name   in varchar2,
    p_ai_http_headers in varchar2,
    p_ai_attributes   in varchar2
  )
  as
    l_base_url    varchar2(2000);
  begin

    apex_debug.info( 'Set buid option %s status: %s', param_t( 'gen_ai_build_option' ), p_build_status );
    -- Set build option status for the generative AI feature
    blog_admin.update_feature(
      p_build_option_name => param_t( 'gen_ai_build_option' )
    , p_build_status      => p_build_status
    );

    if p_build_status = apex_application_admin.c_build_option_status_include
    then
      -- Update credential if new API key is provided
      if p_api_key is not null
      then
        apex_credential.set_persistent_credentials(
          p_credential_static_id  => param_t( 'gen_ai_credential_static_id' )
        , p_key   => 'Authorization'
        , p_value =>
            apex_string.format(
              p_message => 'Bearer %s'
            , p0 => p_api_key
            )
        );
      end if;

      l_base_url := rtrim( p_base_url, '/' ) || '/';
      -- Update remote server
      apex_application_admin.set_remote_server(
        p_static_id       => param_t( 'gen_ai_static_id' )
      , p_base_url        => p_base_url
      , p_ai_model_name   => p_ai_model_name
      , p_ai_http_headers => p_ai_http_headers
      , p_ai_attributes   => p_ai_attributes
      );

    end if;

  end set_gen_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure gen_ai_chat(
    p_post          in varchar2,
    p_system_prompt in varchar2
  )
  as
    l_messages  apex_ai.t_chat_messages := apex_ai.c_chat_messages;
    l_response  clob;
  begin

    -- Prepare user message for AI chat
    l_messages(1).chat_role := 'user';
    l_messages(1).message :=
      apex_lang.get_message(
        p_name    => param_t( 'gen_ai_generate_msg' )
      , p_params  =>
          apex_t_varchar2 (
            'post'
          , substr( apex_escape.striphtml( p_post ), 1, 32000 )
          )
      )
    ;

    -- Generate AI response using AI service
    l_response :=
      apex_ai.chat(
        p_service_static_id => param_t( 'gen_ai_static_id' )
      , p_messages          => l_messages
      , p_prompt            =>
          apex_lang.get_message(
            p_name => param_t( 'gen_ai_generate_prompt_msg' )
          )
      , p_system_prompt     =>
          apex_lang.get_message(
            p_name => p_system_prompt
          )
      );

    apex_debug.info( 'AI generated content: %s', l_response );

    -- Write HTTP JSON header and response
    apex_plugin_util.print_json_http_header;
    apex_json.open_object;
    apex_json.write( 'response', l_response );
    apex_json.close_all;

  end gen_ai_chat;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_sentiment(
    p_language  in varchar2,
    p_documents in clob
  )
  as
    l_comment_id      number;
    l_sentiment_json  varchar2(32700);
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON document: %s', p_documents );

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );

    -- Loop through each document in the array
    for i in 0 .. l_json_documents.get_size() - 1 loop

      -- Extract document details
      l_json_document := json_object_t( l_json_documents.get(i) );
      l_comment_id := to_number( l_json_document.get_string( 'key' ) );
      l_sentiment_json := l_json_document.stringify();

      -- Merge sentiment data into the database
      merge into blog_comment_sentiments t1
      using dual on ( t1.comment_id = l_comment_id )
      when not matched then
        insert( comment_id, original_language, sentiment_json )
        values( l_comment_id, p_language, l_sentiment_json )
      when matched then
        update set sentiment_json = l_sentiment_json;

    end loop;

  end merge_sentiment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_lang_code(
    p_documents in clob,
    p_lang_code out nocopy varchar2
  )
  as
    l_temp_score      number;
    l_score           number := -999;
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON document: %s', p_documents );

    p_lang_code := 'en'; -- Default language code

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );
    -- Extract the first document
    l_json_document := json_object_t( l_json_documents.get(0) );
    -- Retrieve the "languages" array
    l_json_documents := l_json_document.get_array( 'languages' );

    -- Loop through languages to find the highest score
    for i in 0 .. l_json_documents.get_size() - 1 loop
      l_json_document := json_object_t( l_json_documents.get(i) );
      l_temp_score := l_json_document.get_number( 'score' );
      if l_temp_score > l_score then
        l_score := l_temp_score;
        p_lang_code := l_json_document.get_string( 'code' );
      end if;
    end loop;

  end get_lang_code;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_translation(
    p_documents   in clob,
    p_translation out nocopy clob
  )
  as
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON: %s', p_documents );

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );
    -- Extract the translated text from the first document
    l_json_document := json_object_t( l_json_documents.get(0) );
    p_translation := l_json_document.get_string( 'translatedText' );

  end get_translation;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Package initialization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
  -- initialize parameters
  apex_debug.info( '----- Initialize package BLOG_AI -----' );
  init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_AI";
/
