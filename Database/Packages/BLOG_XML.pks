create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION:
--    Provides procedures and functions to generate and output RSS feeds, Atom feeds,
--    and various sitemap components (index, main, posts, categories, archives, and tags).
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_app_name      in varchar2,
    p_app_desc      in varchar2,
    p_css_file      in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure atom(
    p_app_name      in varchar2,
    p_app_desc      in varchar2
  );
--------------------------------------------------------------------------------
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  );
--------------------------------------------------------------------------------
  procedure sitemap_main(
    p_app_id        in varchar2,
    p_page_group    in varchar2
  );
--------------------------------------------------------------------------------
  procedure sitemap_posts;
--------------------------------------------------------------------------------
  procedure sitemap_categories;
--------------------------------------------------------------------------------
  procedure sitemap_archives;
--------------------------------------------------------------------------------
  procedure sitemap_tags;
--------------------------------------------------------------------------------
end "BLOG_XML";
/
