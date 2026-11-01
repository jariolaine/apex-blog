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
