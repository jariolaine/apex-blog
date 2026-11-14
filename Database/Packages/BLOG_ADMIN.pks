create or replace package "BLOG_ADMIN"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures and functions for the Admin application,
--    including operations content handling, and utility functions.
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
