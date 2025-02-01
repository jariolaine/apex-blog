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
    p_page          in varchar2,
    p_url           out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_POST
  function set_post_canonical_link(
    p_post_id       in varchar2,
    p_url           out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY
  function set_category_canonical_link(
    p_category_id   in varchar2,
    p_url           out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE
  function set_archive_canonical_link(
    p_archive_id    in varchar2,
    p_url           out nocopy varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAG
  function set_tag_canonical_link(
    p_tag_id        in varchar2,
    p_url           out nocopy varchar2
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
-- Called from:
--  pub app shortcut BLOG_ATOM_LINK
  function get_atom_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_button(
    p_app_id        in varchar2,
    p_title         in varchar2,
    p_action        in varchar2,
    p_icon_classes  in varchar2,
    p_build_option  in varchar2 default null,
    p_css_classes   in varchar2 default null
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

  c_link_canonical_template constant varchar2(64) := '<link rel="canonical" href="%s">';
  c_link_alternate_template constant varchar2(64) := '<link rel="alternate" href="%s" title="%s &raquo; %s" type="%s">';

  g_link_canonical varchar2(1024);

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
  function set_tab_canonical_link(
    p_page  in varchar2,
    p_url   out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for tab
    if p_page is not null
    then
      p_url :=
        blog_url.get_tab(
          p_page       => p_page
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      -- if p_page is not defined
      apex_debug.warn( 'Canonical link tag not generated for tab.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_post_canonical_link(
    p_post_id in varchar2,
    p_url     out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for post
    if p_post_id is not null
    then
      p_url :=
        blog_url.get_post(
          p_post_id      => p_post_id
        , p_canonical    => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for post.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_category_canonical_link(
    p_category_id in varchar2,
    p_url         out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for category
    if p_category_id is not null
    then
      p_url :=
        blog_url.get_category(
          p_category_id  => p_category_id
        , p_canonical    => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for category.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_archive_canonical_link(
    p_archive_id in varchar2,
    p_url        out nocopy varchar2
  ) return varchar2
  as
  begin
      -- generate canonical link for archives
    if p_archive_id is not null
    then
      p_url :=
        blog_url.get_archive(
          p_archive_id => p_archive_id
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for archive.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function set_tag_canonical_link(
    p_tag_id in varchar2,
    p_url    out nocopy varchar2
  ) return varchar2
  as
  begin
    -- generate canonical link for tags
    if p_tag_id is not null
    then
      p_url :=
        blog_url.get_tag(
          p_tag_id     => p_tag_id
        , p_canonical  => 'YES'
        )
      ;
      g_link_canonical :=
        apex_string.format(
          p_message => c_link_canonical_template
        , p0 => p_url
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for tag.' );
      g_link_canonical := get_robots_noindex_meta;
    end if;

    return g_link_canonical;

  end set_tag_canonical_link;
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
        p_name  => p_message
      , p0      => p_app_name
      )
    ;

    -- get rss url
    l_rss_url :=  blog_url.get_rss;

    -- generate RSS anchor
    l_rss_anchor :=
      apex_string.format(
        p_message =>
          '<a href="%s" aria-label="%s &raquo; %s" rel="alternate" type="%s" class="%s">'
          || '<span aria-hidden="true" class="%s"></span>'
          || '</a>'
      , p0 => l_rss_url
      , p1 => p_app_name
      , p2 => p_message
      , p3 => blog_util.g_mime_rss
      , p4 => 't-Button t-Button--noLabel t-Button--icon t-Button--link'
      , p5 => 'fa fa-rss-square fa-3x fa-lg u-color-8-text'
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
    l_rss_url   varchar2(256);
    l_rss_link  varchar2(2000);
    --l_rss_title varchar2(4000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- get rss url
      l_rss_url := blog_url.get_rss;

      -- generate HTML
      l_rss_link :=
        apex_string.format(
          p_message => c_link_alternate_template
        , p0 => l_rss_url
        , p1 => p_app_name
        , p2 => p_message
        , p3 => blog_util.g_mime_rss
        )
      ;
    end if;
    -- return generated HTML
    return l_rss_link;

  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_atom_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2
  as
    l_app_id      number;
    l_atom_url    varchar2(256);
    l_atom_link   varchar2(2000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- get atom url
      l_atom_url := blog_url.get_atom;

      -- generate HTML
      l_atom_link :=
        apex_string.format(
          p_message => c_link_alternate_template
        , p0 => l_atom_url
        , p1 => p_app_name
        , p2 => p_message
        , p3 => blog_util.g_mime_atom
        )
      ;

    end if;
    -- return generated HTML
    return l_atom_link;

  end get_atom_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_button(
    p_app_id        in varchar2,
    p_title         in varchar2,
    p_action        in varchar2,
    p_icon_classes  in varchar2,
    p_build_option  in varchar2 default null,
    p_css_classes   in varchar2 default null
  ) return varchar2
  as
    l_app_id  number;
    l_button  varchar2(32700) := '<span class="blog-hidden"></span>';
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should button generated
    if p_build_option is null or
      apex_application_admin.get_build_option_status(
        p_application_id    => l_app_id
      , p_build_option_name => p_build_option
      ) = apex_application_admin.c_build_option_status_include
    then
      -- generate button HTML
      l_button :=
        apex_string.format(
          p_message =>
            '<button type="button" data-action="%0" title="%1" aria-label="%1" class="%2" data-no-update="true">' ||
            '<span class="t-Icon fa %3" aria-hidden="true"></span>' ||
            '</button>'
        , p0 => p_action
        , p1 => p_title
        , p2 => 't-Button t-Button--noLabel t-Button--icon t-Button--link'
            || case when p_css_classes is not null then ' ' || p_css_classes end
        , p3 => p_icon_classes
        )
      ;
    end if;

    return l_button;

  end get_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
