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

  -- ORDS
  ords_module                 constant varchar2(256)  := 'BLOG_PUBLIC_FILES';

  ords_public_files_prefix    constant varchar2(256)  := 'files';

  ords_feed_template          constant varchar2(256)  := 'feed/rss';
  ords_sitemap_index_template constant varchar2(256)  := 'sitemap/index';
  ords_sitemap_main_template  constant varchar2(256)  := 'sitemap/main';
  ords_sitemap_posts_template constant varchar2(256)  := 'sitemap/posts';

  rss_url                     constant varchar2(4000) := blog_util.get_attribute_value( 'RSS_URL' );

  canonical_url               constant varchar2(4000) := blog_util.get_attribute_value( 'CANONICAL_URL' );

  -- URL
  home_page                   constant varchar2(40) := 'HOME';

  post_page                   constant varchar2(40) := 'POST';
  post_item                   constant varchar2(40) := 'P2_POST_ID';

  search_page                 constant varchar2(40) := 'SEARCH';
  search_item                 constant varchar2(40) := 'P0_SEARCH';

  category_page               constant varchar2(40) := 'CATEGORY';
  category_item               constant varchar2(40) := 'P4_CATEGORY_ID';

  archive_page                constant varchar2(40) := 'ARCHIVE';
  archive_item                constant varchar2(40) := 'P5_YEAR_MONTH';

  tag_page                    constant varchar2(40) := 'TAG';
  tag_item                    constant varchar2(40) := 'P6_TAG_ID';
  
-------------------------------------------------------------------------------
END "BLOG_GLOBALS";
/



/
