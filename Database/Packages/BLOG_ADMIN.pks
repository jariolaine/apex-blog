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
