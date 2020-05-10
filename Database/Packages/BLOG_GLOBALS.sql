CREATE OR REPLACE PACKAGE "BLOG_GLOBALS"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Global constants
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 29.03.2020 - Created
--    Jari Laine 16.04.2020 - Constants for comment program code css class
--    Jari Laine 10.05.2020 - Added constant g_unsubscribe_item
--
--  TO DO:
--    #1  Package contains hard coded values
--        e.g. public application tabs should be converted to dynamic list
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  g_owner               constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  g_number_format       constant varchar2(40)   := 'fm9999999999999999999999999999999999999';

  -- ORDS
  g_ords_module         constant varchar2(256)  := 'BLOG_PUBLIC_FILES';

  g_ords_public_files   constant varchar2(256)  := 'files';

  g_ords_rss_feed       constant varchar2(256)  := 'feed/rss';
  g_ords_sitemap_index  constant varchar2(256)  := 'sitemap/index';
  g_ords_sitemap_main   constant varchar2(256)  := 'sitemap/main';
  g_ords_sitemap_posts  constant varchar2(256)  := 'sitemap/posts';

  g_rss_url             constant varchar2(4000) := blog_util.get_attribute_value( 'RSS_URL' );

  g_canonical_url       constant varchar2(4000) := blog_util.get_attribute_value( 'CANONICAL_URL' );

  -- URL
  g_home_page           constant varchar2(40)   := 'HOME';

  g_post_page           constant varchar2(40)   := 'POST';
  g_post_item           constant varchar2(40)   := 'P2_POST_ID';

  g_unsubscribe_item    constant varchar2(40)   := 'P2_SUBSCRIPTION_ID';

  g_search_page         constant varchar2(40)   := 'SEARCH';
  g_search_item         constant varchar2(40)   := 'P0_SEARCH';

  g_category_page       constant varchar2(40)   := 'CATEGORIES';
  g_category_item       constant varchar2(40)   := 'P14_CATEGORY_ID';

  g_archive_page        constant varchar2(40)   := 'ARCHIVES';
  g_archive_item        constant varchar2(40)   := 'P15_ARCHIVE_ID';

  g_tag_page            constant varchar2(40)   := 'TAG';
  g_tag_item            constant varchar2(40)   := 'P6_TAG_ID';

  -- XML
  g_pub_app_tab_list    constant varchar2(256)  := 'Desktop Navigation Menu';

  -- comments
  g_whitelist_tags      constant varchar2(256)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  g_code_css_class      constant varchar2(256)  := 'z-program-code';

-------------------------------------------------------------------------------
END "BLOG_GLOBALS";
/
