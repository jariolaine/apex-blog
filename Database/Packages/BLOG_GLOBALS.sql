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
  g_ords_module                 constant varchar2(256)  := 'BLOG_PUBLIC_FILES';

  g_ords_public_files_prefix    constant varchar2(256)  := 'files';

  g_ords_feed_template          constant varchar2(256)  := 'feed/rss';
  g_ords_sitemap_index_template constant varchar2(256)  := 'sitemap/index';
  g_ords_sitemap_main_template  constant varchar2(256)  := 'sitemap/main';
  g_ords_sitemap_posts_template constant varchar2(256)  := 'sitemap/posts';

  g_rss_url                     constant varchar2(4000) := blog_util.get_attribute_value( 'RSS_URL' );

  g_canonical_url               constant varchar2(4000) := blog_util.get_attribute_value( 'CANONICAL_URL' );

  -- URL
  g_home_page                   constant varchar2(40) := 'HOME';

  g_post_page                   constant varchar2(40) := 'POST';
  g_post_item                   constant varchar2(40) := 'P2_POST_ID';

  g_search_page                 constant varchar2(40) := 'SEARCH';
  g_search_item                 constant varchar2(40) := 'P0_SEARCH';

  g_category_page               constant varchar2(40) := 'CATEGORY';
  g_category_item               constant varchar2(40) := 'P4_CATEGORY_ID';

  g_archive_page                constant varchar2(40) := 'ARCHIVE';
  g_archive_item                constant varchar2(40) := 'P5_YEAR_MONTH';

  g_tag_page                    constant varchar2(40) := 'TAG';
  g_tag_item                    constant varchar2(40) := 'P6_TAG_ID';
  
--------------------------------------------------------------------------------
  function get_comment_var
  return varchar2;
--------------------------------------------------------------------------------
  procedure set_comment_var(
    p_html in varchar2
  );
-------------------------------------------------------------------------------
END "BLOG_GLOBALS";
/


CREATE OR REPLACE package body "BLOG_GLOBALS"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Variable hold formatted comment
  g_comment_html varchar2(32700);
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_comment_var
  return varchar2
  as
  begin
    return g_comment_html;
  end get_comment_var;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_comment_var(
    p_html in varchar2
  )
  as
  begin
    g_comment_html := p_html;
  end set_comment_var;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_GLOBALS";
/
