CREATE OR REPLACE package "BLOG_HTML" 
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
--    Jari Laine 29.04.2020 - functions to generate canonical link output robot noindex meta tag if proper link can't be generated
--    Jari Laine 29.04.2020 - Added apex_debug to functions generating meta and canonical link
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_robots_noindex_meta return varchar2;
--------------------------------------------------------------------------------
  function get_tag_anchor(
    p_tag_id          in number,
    p_app_id          in varchar2,
    p_tag             in varchar2,
    p_button          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_description_meta(
    p_desc            in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post_description_meta(
    p_post_id         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tab_canonical_link(
    p_app_id          in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_home_page
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post_canonical_link(
    p_post_id       in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_post_page,
    p_page_item     in varchar2 default blog_globals.g_post_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_canonical_link(
    p_category_id   in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_category_page,
    p_page_item     in varchar2 default blog_globals.g_category_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_archive_canonical_link(
    p_year_month    in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_archive_page,
    p_page_item     in varchar2 default blog_globals.g_archive_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag_canonical_link(
    p_tag_id        in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_tag_page,
    p_page_item     in varchar2 default blog_globals.g_tag_item
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_name        in varchar2,
    p_status          in varchar2 default 'INCLUDE'
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Not used
  function get_search_button(
    p_request         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id         in number,
    p_status          in varchar2 default 'INCLUDE',
    p_app_id          in varchar2 default null,
    p_button          in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags            in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/


CREATE OR REPLACE package body                         "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables and constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_tag_anchor(
    p_tag_id  in number,
    p_app_id  in varchar2,
    p_tag     in varchar2,
    p_button  in varchar2,
    p_tags    in out nocopy varchar2
  )
  as
  begin
    if p_tag is null then
      p_tags := p_tags;
    else
      if p_button = 'YES' then
        p_tags := p_tags
          ||  blog_html.get_tag_anchor(
                p_tag_id  => p_tag_id
                ,p_app_id => p_app_id
                ,p_tag    => p_tag
                ,p_button => p_button
              );
      else
        p_tags := p_tags
          ||  case when p_tags is not null then ',' end
          ||  blog_html.get_tag_anchor(
                p_tag_id  => p_tag_id
                ,p_app_id => p_app_id
                ,p_tag    => p_tag
                ,p_button => p_button
              );
      end if;
    end if;
  end get_tag_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_robots_noindex_meta return varchar2
  as
  begin
    return '<meta name="robots" value="noindex" />';
  end get_robots_noindex_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag_anchor(
    p_tag_id  in number,
    p_app_id  in varchar2,
    p_tag     in varchar2,
    p_button  in varchar2
  ) return varchar2
  as
    l_tag varchar2(4000);
    l_url varchar2(4000);
  begin

    if p_tag is not null then

      l_tag := apex_escape.html( p_tag );


      l_url :=  blog_url.get_tag(
                  p_tag_id => p_tag_id
                  ,p_app_id => p_app_id
                );

      if p_button = 'YES' then

        l_tag := '<a href="'
          || l_url
          || '"'
          || ' class="t-Button'
          || ' t-Button--icon'
          || ' t-Button--noUI'
--          || ' t-Button--small'
--          || ' t-Button--hot'
--          || ' t-Button--link'
--          || ' t-Button--simple'
          || ' t-Button--iconLeft'
          || ' margin-top-sm'
          || '">'
          || '<span class="t-Icon fa fa-tag" aria-hidden="true"></span>'
          || l_tag
          || '</a>'
        ;

      else

        l_tag := '<a href="'
          || l_url
          || '"'
          || ' class="margin-bottom-md margin-left-sm">'
          || l_tag
          || '</a>'
        ;

      end if;

    end if;

    return l_tag;

  end get_tag_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_description_meta(
    p_desc in varchar2
  ) return varchar2
  as
  begin
    if p_desc is not null then
      return
        '<meta name="description" content="'
        || apex_escape.html_attribute( p_desc )
        || '"/>'
      ;
    else
      apex_debug.warn('Description meta tag not generated.');
      return ' <!-- no description -->';
    end if;
  end get_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_description_meta(
    p_post_id in varchar2
  ) return varchar2
  as
    l_post_desc varchar2(32700);
  begin
    select v1.post_desc
    into l_post_desc
    from blog_v_posts v1
    where 1= 1
    and v1.post_id = p_post_id
    ;
    return blog_html.get_description_meta(
      p_desc => l_post_desc
    );
  exception when no_data_found then
    apex_debug.warn('No data found to generate description meta tag.');
    return ' <!-- no description -->';
  end get_post_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab_canonical_link(
    p_app_id          in varchar2 default null,
    p_app_page_id     in varchar2 default blog_globals.g_home_page
  ) return varchar2
  as
  begin
    if p_app_page_id is not null then
      return
        '<link rel="canonical" href="'
        || blog_globals.g_canonical_url
        || blog_url.get_tab(
          p_app_id => p_app_id
          ,p_session => ''
          ,p_debug => 'NO'
          ,p_app_page_id => p_app_page_id
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for tab.');
      return blog_html.get_robots_noindex_meta;
    end if;
  end get_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_canonical_link(
    p_post_id       in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_post_page,
    p_page_item     in varchar2 default blog_globals.g_post_item
  ) return varchar2
  as
  begin
    if p_post_id is not null then
      return
        '<link rel="canonical" href="'
        || blog_globals.g_canonical_url
        || blog_url.get_post(
          p_post_id       => p_post_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_app_page_id  => p_app_page_id
          ,p_page_item    => p_page_item
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for post.');
      return blog_html.get_robots_noindex_meta;
    end if;
  end get_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_canonical_link(
    p_category_id   in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_category_page,
    p_page_item     in varchar2 default blog_globals.g_category_item
  ) return varchar2
  as
  begin
    if p_category_id is not null then
      return
        '<link rel="canonical" href="'
        || blog_globals.g_canonical_url
        || blog_url.get_category(
          p_category_id   => p_category_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_app_page_id  => p_app_page_id
          ,p_page_item    => p_page_item
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for category.');
      return blog_html.get_robots_noindex_meta;
    end if;
  end get_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive_canonical_link(
    p_year_month    in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_archive_page,
    p_page_item     in varchar2 default blog_globals.g_archive_item
  ) return varchar2
  as
  begin
    if p_year_month is not null then
      return
        '<link rel="canonical" href="'
        || blog_globals.g_canonical_url
        || blog_url.get_archive(
          p_year_month    => p_year_month
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_app_page_id  => p_app_page_id
          ,p_page_item    => p_page_item
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for archive.');
      return blog_html.get_robots_noindex_meta;
    end if;
  end get_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag_canonical_link(
    p_tag_id        in number,
    p_app_id        in varchar2 default null,
    p_app_page_id   in varchar2 default blog_globals.g_tag_page,
    p_page_item     in varchar2 default blog_globals.g_tag_item
  ) return varchar2
  as
  begin
    if p_tag_id is not null then
      return
        '<link rel="canonical" href="'
        || blog_globals.g_canonical_url
        || blog_url.get_tag(
          p_tag_id        => p_tag_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_app_page_id  => p_app_page_id
          ,p_page_item    => p_page_item
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for tag.');
      return blog_html.get_robots_noindex_meta;
    end if;
  end get_tag_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name in varchar2
  ) return varchar2
  as
    l_rss_title varchar2(4000);
  begin

    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );
    --l_rss_title := apex_escape.html_attribute( l_rss_title );
    return '<a href="'
      || blog_globals.g_rss_url
      || '" rel="alternate" type="application/rss+xml" aria-label="'
      || l_rss_title
      || '" class="t-Button t-Button--noLabel t-Button--icon t-Button--link">'
      || '<span aria-hidden="true" class="fa fa-rss-square fa-3x fa-lg u-color-8-text"></span>'
      || '</a>'
    ;
  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_name in varchar2,
    p_status   in varchar2 default 'INCLUDE'
  ) return varchar2
  as
    l_rss_title varchar2(4000);
  begin

    if p_status = 'INCLUDE' then
      l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );
      --l_rss_title := apex_escape.html_attribute( l_rss_title );
      return
        '<link rel="alternate" type="application/rss+xml" href="'
        || blog_globals.g_rss_url
        || '" title="'
        || l_rss_title
        || '"/>'
      ;
    else
      return ' <!-- no feed link -->';
    end if;
  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_search_button(
    p_request in varchar2
  ) return varchar2
  as
  begin
    return '<button'
      || ' type="button" title="Search" aria-label="Search"'
      || ' class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"'
      || ' onclick="apex.submit({request:'''|| p_request || '''});"'
      || '>'
      || '<span class="t-Icon fa fa-search" aria-hidden="true"></span>'
      || '</button>'
      ;
  end get_search_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id in number,
    p_status  in varchar2 default 'INCLUDE',
    p_app_id  in varchar2 default null,
    p_button  in varchar2 default 'YES'
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin

    if p_status = 'INCLUDE' then
      select listagg(
        blog_html.get_tag_anchor(
           p_tag_id => v1.tag_id
          ,p_app_id => p_app_id
          ,p_tag    => v1.tag
          ,p_button => p_button
        ), case when p_button != 'YES' then ', ' end)
      within group(order by v1.display_seq) as tags
      into l_tags
      from blog_v_posts_tags v1
      where 1 = 1
      and v1.post_id = p_post_id
      ;
    end if;
    return l_tags;

  end get_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags in varchar2
  ) return varchar2
  as
    l_tags      varchar2(32700);
    l_tags_tab  apex_t_varchar2;
  begin

    l_tags_tab := apex_string.split( p_tags, ',' );
    -- Loop tags to generate tags links
    for i in 1 .. l_tags_tab.count
    loop
      blog_html.get_tag_anchor(
         p_tag_id => null
        ,p_app_id => null
        ,p_tag    => trim(l_tags_tab(i))
        ,p_button => 'YES'
        ,p_tags   => l_tags
      );
    end loop;

    return l_tags;

  end get_preview_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
