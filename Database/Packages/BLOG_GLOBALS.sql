CREATE OR REPLACE PACKAGE "BLOG_GLOBALS"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Global variables and constants
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 29.03.2020 - Created
--    Jari Laine 16.04.2020 - Variables for commenting
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

  g_owner                       constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  -- ORDS
  g_ords_module                 constant varchar2(256)  := 'BLOG_PUBLIC_FILES';

  g_ords_public_files_prefix    constant varchar2(256)  := 'files';

  g_ords_feed_template          constant varchar2(256)  := 'feed/rss';
  g_ords_sitemap_index_template constant varchar2(256)  := 'sitemap/index';
  g_ords_sitemap_main_template  constant varchar2(256)  := 'sitemap/main';
  g_ords_sitemap_posts_template constant varchar2(256)  := 'sitemap/posts';

  g_rss_url                     constant varchar2(4000) := blog_util.get_attribute_value( 'RSS_URL' );

  g_canonical_url               constant varchar2(4000) := rtrim( blog_util.get_attribute_value( 'CANONICAL_URL' ), '/' ) || '/';

  -- URL
  g_home_page                   constant varchar2(40) := 'HOME';

  g_post_page                   constant varchar2(40) := 'POST';
  g_post_item                   constant varchar2(40) := 'P2_POST_ID';

  g_search_page                 constant varchar2(40) := 'SEARCH';
  g_search_item                 constant varchar2(40) := 'P0_SEARCH';

  g_category_page               constant varchar2(40) := 'CATEGORIES';
  g_category_item               constant varchar2(40) := 'P14_CATEGORY_ID';

  g_archive_page                constant varchar2(40) := 'ARCHIVES';
  g_archive_item                constant varchar2(40) := 'P15_ARCHIVE_ID';

  g_tag_page                    constant varchar2(40) := 'TAG';
  g_tag_item                    constant varchar2(40) := 'P6_TAG_ID';

  -- Comments
  g_code_css_class              constant varchar2(40) := 'z-program-code';

-------------------------------------------------------------------------------
END "BLOG_GLOBALS";
/
