create or replace package "BLOG_HTML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    This package contains functions and procedures for generating and returning
--    HTML code, including canonical links, meta tags, RSS/Atom links, and buttons.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta return varchar2;
--------------------------------------------------------------------------------
  function set_tab_canonical_link(
    p_page            in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function set_post_canonical_link(
    p_post_id         in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function set_category_canonical_link(
    p_category_id     in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function set_archive_canonical_link(
    p_archive_id      in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function set_tag_canonical_link(
    p_tag_id          in varchar2,
    p_url             out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name        in varchar2,
    p_message         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_message         in varchar2,
    p_build_option    in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
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
    p_icon_classes    in varchar2,
    p_button_classes  in varchar2 default null,
    p_build_option    in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure prn_html(
    p_markdown        in apex_application_global.vc_arr2
  );
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
