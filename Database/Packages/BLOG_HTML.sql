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
--                            Functions to generate canonical link outputs robot noindex meta tag
--                            if proper link can't be generated
--                            Added apex_debug to functions generating meta and canonical link
--    Jari Laine 10.05.2020 - Utilize blog_url functions p_canonical
--    Jari Laine 19.05.2020 - Removed obsolete function get_search_button
--    Jari Laine 06.07.2020 - Added parameter p_rss_url to functions get_rss_link and get_rss_anchor
--                            Removed parameter p_build_option_status from function get_rss_link
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_META_ROBOTS_NOINDEX
  function get_robots_noindex_meta return varchar2;
--------------------------------------------------------------------------------
  function get_tag_anchor(
    p_tag_id              in number,
    p_app_id              in varchar2,
    p_tag                 in varchar2,
    p_button              in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_META_HOME_DESCRIPTION
  function get_description_meta(
    p_desc                in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_META_POST_DESCRIPTION
  function get_post_description_meta(
    p_post_id             in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAB
  function get_tab_canonical_link(
    p_app_page_id         in varchar2,
    p_app_id              in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_POST
  function get_post_canonical_link(
    p_post_id             in varchar2,
    p_app_id              in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY
  function get_category_canonical_link(
    p_category_id         in varchar2,
    p_app_id              in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE
  function get_archive_canonical_link(
    p_archive_id          in varchar2,
    p_app_id              in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAG
  function get_tag_canonical_link(
    p_tag_id              in varchar2,
    p_app_id              in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_ANCHOR
  function get_rss_anchor(
    p_app_name            in varchar2,
    p_rss_url             in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_LINK
  function get_rss_link(
    p_app_id              in varchar2,
    p_app_name            in varchar2,
    p_rss_url             in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app classic report on pages 2, 3, 6, 14, 15
  function get_post_tags(
    p_post_id             in number,
    p_app_id              in varchar2 default null,
    p_button              in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  not ready / not unused
  function get_preview_tags(
    p_tags                in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/


CREATE OR REPLACE package body "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
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
    -- generate HTML for tag
    if p_tag is null then
      p_tags := p_tags;
    else
      -- generate button
      if p_button = 'YES' then
        p_tags := p_tags
          ||  get_tag_anchor(
                p_tag_id  => p_tag_id
                ,p_app_id => p_app_id
                ,p_tag    => p_tag
                ,p_button => p_button
              );
      else
      -- generate anchor tag
        p_tags := p_tags
          ||  case when p_tags is not null then ',' end
          ||  get_tag_anchor(
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

    -- generate HTML for tag
    if p_tag is not null then

      l_tag := apex_escape.html( p_tag );

      -- get URL for tag
      l_url :=  blog_url.get_tag(
        p_tag_id => p_tag_id
        ,p_app_id => p_app_id
      );


      if p_button = 'YES' then
        -- generate button
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
        -- generate anchor tag
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
    l_html varchar2(32700);
  begin
    -- generate description meta tag
    if p_desc is not null then
      l_html :=
        '<meta name="description" content="'
        || apex_escape.html_attribute( p_desc )
        || '"/>'
      ;
    else
      apex_debug.warn('Description meta tag not generated.');
    end if;

    return l_html;

  end get_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_description_meta(
    p_post_id in varchar2
  ) return varchar2
  as
    l_post_desc varchar2(32700);
  begin
    -- generate description meta tag for post
    select v1.post_desc
    into l_post_desc
    from blog_v_posts v1
    where 1= 1
    and v1.post_id = p_post_id
    ;
    return get_description_meta(
      p_desc => l_post_desc
    );
  exception when no_data_found then
    apex_debug.warn( 'No data found to generate description meta tag for post id %s', p_post_id );
    return null;
  end get_post_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab_canonical_link(
    p_app_page_id     in varchar2,
    p_app_id          in varchar2 default null
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for tab
    if p_app_page_id is not null then
      l_html :=
        '<link rel="canonical" href="'
        || blog_url.get_tab(
           p_app_id       => p_app_id
          ,p_app_page_id  => p_app_page_id
          ,p_canonical    => 'YES'
        )
        || '" />'
      ;
    else
      -- if p_app_page_id is not defined then generate
      -- robots no index meta tag
      apex_debug.warn( 'Canonical link tag not generated for tab.');
      l_html := get_robots_noindex_meta;
    end if;

    return l_html;

  end get_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_canonical_link(
    p_post_id       in varchar2,
    p_app_id        in varchar2 default null
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for post
    if p_post_id is not null then
      l_html :=
        '<link rel="canonical" href="'
        || blog_url.get_post(
           p_post_id      => p_post_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_canonical    => 'YES'
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for post.');
      l_html := get_robots_noindex_meta;
    end if;

    return l_html;

  end get_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_canonical_link(
    p_category_id   in varchar2,
    p_app_id        in varchar2 default null
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for category
    if p_category_id is not null
    then
      l_html :=
        '<link rel="canonical" href="'
        || blog_url.get_category(
           p_category_id  => p_category_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_canonical    => 'YES'
        )
        || '" />'
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for category.');
      l_html := get_robots_noindex_meta;
    end if;

    return l_html;

  end get_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive_canonical_link(
    p_archive_id    in varchar2,
    p_app_id        in varchar2 default null
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
      -- generate canonical link for archives
    if p_archive_id is not null
    then
      l_html :=
        '<link rel="canonical" href="'
        || blog_url.get_archive(
           p_archive_id => p_archive_id
          ,p_app_id     => p_app_id
          ,p_session    => ''
          ,p_canonical  => 'YES'
        )
        || '" />'
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for archive.');
      l_html := get_robots_noindex_meta;
    end if;

    return l_html;

  end get_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag_canonical_link(
    p_tag_id        in varchar2,
    p_app_id        in varchar2 default null
  ) return varchar2
  as
  begin
    -- generate canonical link for tags
    if p_tag_id is not null then
      return
        '<link rel="canonical" href="'
        || blog_url.get_tag(
           p_tag_id       => p_tag_id
          ,p_app_id       => p_app_id
          ,p_session      => ''
          ,p_canonical    => 'YES'
        )
        || '" />'
      ;
    else
      apex_debug.warn('Canonical link tag not generated for tag.');
      return get_robots_noindex_meta;
    end if;
  end get_tag_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name in varchar2,
    p_rss_url  in varchar2 default null
  ) return varchar2
  as
    l_rss_url     varchar2(4000);
    l_rss_title   varchar2(4000);
    l_rss_anchor  varchar2(4000);
  begin

    -- get rss title
    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );

    -- get rss url
    l_rss_url := case
      when p_rss_url is null
      then blog_util.get_attribute_value( 'G_RSS_URL' )
      else p_rss_url
      end
    ;

    -- generate RSS anchor
    if l_rss_url is not null
    then
      l_rss_anchor :=
        '<a href="'
        || l_rss_url
        || '" rel="alternate" type="application/rss+xml" aria-label="'
        || l_rss_title
        || '" class="t-Button t-Button--noLabel t-Button--icon t-Button--link">'
        || '<span aria-hidden="true" class="fa fa-rss-square fa-3x fa-lg u-color-8-text"></span>'
        || '</a>'
      ;
    else
      apex_debug.warn('RSS URL is empty. RSS anchor not generated.');
    end if;

    return l_rss_anchor;

  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_id    in varchar2,
    p_app_name  in varchar2,
    p_rss_url   in varchar2 default null
  ) return varchar2
  as
    l_app_id    number;
    l_rss_url   varchar2(4000);
    l_rss_title varchar2(4000);
  begin

    l_app_id := to_number( p_app_id );

    if apex_util.get_build_option_status(
       p_application_id     => l_app_id
      ,p_build_option_name  => 'BLOG_FEATURE_RSS'
    ) = 'INCLUDE'
    then
      -- get rss url
      l_rss_url := case
        when p_rss_url is null
        then blog_util.get_attribute_value( 'G_RSS_URL' )
        else p_rss_url
        end
      ;

      -- generate link for rss
      if l_rss_url is not null
      then
        l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );
        --l_rss_title := apex_escape.html_attribute( l_rss_title );
        l_rss_url :=
          '<link rel="alternate" type="application/rss+xml" href="'
          || l_rss_url
          || '" title="'
          || l_rss_title
          || '"/>'
        ;
      else
        apex_debug.warn('RSS  URL is empty. RSS link for header not generated.');
      end if;

    end if;

    return l_rss_url;

  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_post_id in number,
    p_app_id  in varchar2 default null,
    p_button  in varchar2 default 'YES'
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin
    -- generate html for post tags
    select listagg(
      get_tag_anchor(
         p_tag_id => v1.tag_id
        ,p_app_id => p_app_id
        ,p_tag    => v1.tag
        ,p_button => p_button
      ), case when p_button != 'YES' then ', ' end)
    within group(order by v1.display_seq) as tags
    into l_tags
    from blog_v_post_tags v1
    where 1 = 1
    and v1.post_id = p_post_id
    ;
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
      get_tag_anchor(
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
