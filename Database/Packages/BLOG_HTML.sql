create or replace package "BLOG_HTML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Functions to generate and return HTML code
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 29.04.2020 - New function get_robots_noindex_meta
--                          - Functions generating canonical link returns robot noindex meta tag if proper link not generated
--                          - Added apex_debug to functions generating meta and canonical link
--    Jari Laine 10.05.2020 - Utilize blog_url functions p_canonical
--    Jari Laine 19.05.2020 - Removed obsolete function get_search_button
--    Jari Laine 06.07.2020 - Added parameter p_rss_url to functions get_rss_link and get_rss_anchor
--                          - Removed parameter p_build_option_status from function get_rss_link
--    Jari Laine 13.11.2021 - Changes to funtion get_rss_anchor and get get_rss_link
--                          - Removed obsolete functions
--    Jari Laine 27.03.2022 - Added parameter p_build_option and p_message to function get_rss_link
--                          - Added parameter p_message to function get_rss_anchor
--    Jari Laine 27.04.2022 - Removed obsolete functions get_tag_anchor and get_post_tags
--    Jari Laine 16.11.2022 - Removed obsolete functions:
--                              get_post_description_meta
--                              get_description_meta
--    Jari Laine 25.11.2022 - Removed unused parameters
--    Jari Laine 30.07.2023 - Replaced apex_util.get_build_option_status with apex_application_admin.get_build_option_status
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAB
  function get_tab_canonical_link(
    p_page          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_POST
  function get_post_canonical_link(
    p_post_id       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY
  function get_category_canonical_link(
    p_category_id   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE
  function get_archive_canonical_link(
    p_archive_id    in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAG
  function get_tag_canonical_link(
    p_tag_id        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_ANCHOR
  function get_rss_anchor(
    p_app_name      in varchar2,
    p_message       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_LINK
  function get_rss_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/


create or replace package body "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  c_link_canonical constant varchar2(34) := '<link rel="canonical" href="%s" />';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta
  return varchar2
  as
  begin
    return '<meta name="robots" value="noindex">';
  end get_robots_noindex_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab_canonical_link(
    p_page in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for tab
    if p_page is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_tab(
               p_page       => p_page
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      -- if p_page is not defined
      apex_debug.warn( 'Canonical link tag not generated for tab.' );
      l_html := get_robots_noindex_meta;
    end if;
    -- return generated HTML
    return l_html;

  end get_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_canonical_link(
    p_post_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for post
    if p_post_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_post(
               p_post_id      => p_post_id
              ,p_canonical    => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for post.' );
      l_html := get_robots_noindex_meta;
    end if;
    -- return generated HTML
    return l_html;

  end get_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_canonical_link(
    p_category_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for category
    if p_category_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_category(
               p_category_id  => p_category_id
              ,p_canonical    => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for category.' );
      l_html := get_robots_noindex_meta;
    end if;
    -- return generated HTML
    return l_html;

  end get_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive_canonical_link(
    p_archive_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
      -- generate canonical link for archives
    if p_archive_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_archive(
               p_archive_id => p_archive_id
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for archive.' );
      l_html := get_robots_noindex_meta;
    end if;
    -- return generated HTML
    return l_html;

  end get_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag_canonical_link(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for tags
    if p_tag_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_tag(
               p_tag_id     => p_tag_id
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for tag.' );
      l_html := get_robots_noindex_meta;
    end if;

    -- return generated HTML
    return l_html;

  end get_tag_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name  in varchar2,
    p_message   in varchar2
  ) return varchar2
  as
    l_rss_url     varchar2(4000);
    l_rss_title   varchar2(4000);
    l_rss_anchor  varchar2(4000);
  begin

    -- get rss title
    l_rss_title :=
      apex_lang.message(
        p_name => p_message
        ,p0 => p_app_name
      )
    ;

    -- get rss url
    l_rss_url :=  blog_url.get_rss;

    -- generate RSS anchor
    l_rss_anchor :=
      apex_string.format(
        p_message =>
          '<a href="%s" aria-label="%s" rel="alternate" type="%s" class="%s">'
          || '<span aria-hidden="true" class="%s"></span>'
          || '</a>'
        ,p0 => l_rss_url
        ,p1 => apex_escape.html_attribute( l_rss_title )
        ,p2 => 'application/rss+xml'
        ,p3 => 't-Button t-Button--noLabel t-Button--icon t-Button--link'
        ,p4 => 'fa fa-rss-square fa-3x fa-lg u-color-8-text'
      )
    ;
    -- return generated HTML
    return l_rss_anchor;

  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2
  as
    l_app_id    number;
    l_rss_url   varchar2(4000);
    l_rss_title varchar2(4000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if
      apex_application_admin.get_build_option_status(
        p_application_id      => l_app_id
        ,p_build_option_name  => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- get rss url
      l_rss_url := blog_url.get_rss;

    -- generate link for RSS
      l_rss_title := apex_lang.message(
        p_name => p_message
        ,p0 => p_app_name
      );
      -- generate HTML
      l_rss_url :=
        apex_string.format(
          p_message => '<link href="%s" title="%s" rel="alternate" type="application/rss+xml">'
          ,p0 => l_rss_url
          ,p1 =>
            apex_escape.html_attribute(
              p_string => l_rss_title
            )
        )
      ;

    end if;
    -- return generated HTML
    return l_rss_url;

  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
