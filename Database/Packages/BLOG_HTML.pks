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
