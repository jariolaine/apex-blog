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
  procedure post_authentication;
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_app_id            in varchar2,
    p_username          in varchar2,
    p_user_id           out nocopy number,
    p_name              out nocopy varchar2
  );
--------------------------------------------------------------------------------
  function get_category_seq return varchar2;
--------------------------------------------------------------------------------
  function get_link_grp_seq return varchar2;
--------------------------------------------------------------------------------
  function get_modal_page_seq return varchar2;
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request           in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html         in clob
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure add_category(
    p_category_title    in varchar2,
    p_category_id       out nocopy number
  );
--------------------------------------------------------------------------------
  procedure remove_unused_categories;
--------------------------------------------------------------------------------
  procedure add_tag(
    p_tag               in varchar2,
    p_tag_id            out nocopy number
  );
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id           in varchar2,
    p_tags              in varchar2,
    p_sep               in varchar2 default ','
  );
--------------------------------------------------------------------------------
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  function is_integer(
    p_value             in varchar2,
    p_min               in number,
    p_max               in number,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_url(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_date_format(
    p_value             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure update_feature(
    p_app_id            in number,
    p_build_option_id   in number,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
  procedure update_feature(
    p_build_option_name in varchar2,
    p_build_status      in varchar2
  );
--------------------------------------------------------------------------------
  procedure resequence_categories;
--------------------------------------------------------------------------------
  procedure resequence_tags(
    p_post_id           in varchar2
  );
--------------------------------------------------------------------------------
  procedure resequence_link_groups;
--------------------------------------------------------------------------------
  procedure resequence_links(
    p_link_group_id     in varchar2
  );
--------------------------------------------------------------------------------
  procedure resequence_dynamic_content;
--------------------------------------------------------------------------------
  procedure set_attribute_value(
    p_attribute_list    in apex_t_varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_ADMIN";
/
