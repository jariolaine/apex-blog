CREATE OR REPLACE package "BLOG_HTML" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Generate HTML code
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

--------------------------------------------------------------------------------
  function get_rss_anchor(
      p_app_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------  
  function get_rss_link(
      p_app_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_search_button(
    p_request     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_post_tags(
    p_app_id      in varchar2,
    p_post_id     in number,
    p_button      in varchar2 default 'YES'
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/


CREATE OR REPLACE package body                         "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
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
    l_tag varchar2(4000);
    l_url varchar2(4000);
  begin
  
    if p_tag is null then
      p_tags := p_tags;
    else
      l_tag := apex_escape.html( p_tag );
      
      if p_tag_id is null then
        l_url := '#';
      else 
        l_url := 
          blog_url.get_tag(
             p_tag_id => p_tag_id
            ,p_app_id => p_app_id
          )
        ;
      end if;
      
      if p_button = 'YES' then
        p_tags := p_tags
          || '<a href="'
          || l_url
          || '"'
          || ' class="t-Button'
          || ' t-Button--icon'
          || ' t-Button--small'
          --|| ' t-Button--primary'
          --|| ' t-Button--primary'
          || ' t-Button--hot'
          || ' t-Button--link'
          --|| ' t-Button--gapRight'
          --|| ' t-Button--gapTop'
          || ' t-Button--iconLeft'
          || '">'
          || '<span class="t-Icon fa fa-tag" aria-hidden="true"></span>'
          || l_tag
          || '</a>'
        ;    
      else
        p_tags := p_tags
          || case when p_tags is not null then ',' end 
          || '<a href="'
          || l_url
          || '"'
          || ' class="margin-bottom-md'
          ||  case when p_tags is not null 
              then
             ' margin-left-sm' 
              end
          || '">'
          || l_tag
          || '</a>'
        ;
      end if;
    end if;    
  end get_tag_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function get_description_meta(
    p_desc in varchar2
  ) return varchar2
  as
  begin
    return case when p_desc is not null then
      '<meta name="description" content="'
      || apex_escape.html( p_desc )
      || '"/>'
    end;
  end get_description_meta;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name in varchar2
  ) return varchar2
  as
    l_rss_url   varchar2(255);
    l_rss_title varchar2(255);
  begin
  
    l_rss_url   := blog_util.get_param_value( 'RSS_URL' );
    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );
    
    return '<a href="'
      || l_rss_url
      || '" rel="alternate" type="application/rss+xml" aria-label="'
      || apex_escape.html( l_rss_title )
      || '" class="t-Button t-Button--noLabel t-Button--icon t-Button--link">'
      || '<span aria-hidden="true" class="fa fa-rss-square fa-3x fa-lg u-color-8-text"></span>'
      || '</a>'
    ;
  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function get_rss_link(
    p_app_name in varchar2
  ) return varchar2
  as
    l_rss_url   varchar2(255);
    l_rss_title varchar2(255);
  begin
  
    l_rss_url   := blog_util.get_param_value( 'RSS_URL' );
    l_rss_title := apex_lang.message( 'BLOG_RSS_TITLE', p_app_name );
    
    return '<link rel="alternate" type="application/rss+xml" href="'
      || l_rss_url 
      || '" title="'
      || l_rss_title
      || '"/>'
    ;
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
      || ' class="t-Button t-Button--noLabel t-Button--icon t-Button--small t-Button--hot"'
      || ' onclick="apex.submit({request:'''|| p_request || '''});"'
      || '>'
      || '<span class="t-Icon fa fa-search" aria-hidden="true"></span>'
      || '</button>'
      ;
  end get_search_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_tags(
    p_app_id  in varchar2,
    p_post_id in number,
    p_button  in varchar2 default 'YES'
  ) return varchar2
  as
    l_tags varchar2(32700);
  begin
    -- Loop tags to generate tags links
    for c1 in(
      select tag_id
        ,tag
      from blog_v_post_tags
      where 1 = 1
      and post_id = p_post_id
      order by display_seq
    ) loop
      blog_html.get_tag_anchor(
         p_tag_id => c1.tag_id
        ,p_app_id => p_app_id
        ,p_tag    => c1.tag
        ,p_button => p_button
        ,p_tags   => l_tags
      );
    end loop;

    return l_tags;

  end get_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_preview_tags(
    p_tags in varchar2
  ) return varchar2
  as
    l_tags varchar2(32700);
    l_tags_array apex_application_global.vc_arr2;
  begin
  
    l_tags_array := apex_string.string_to_table( p_tags, ',' );
    -- Loop tags to generate tags links
    for i in 1 .. l_tags_array.count
    loop
      blog_html.get_tag_anchor(
         p_tag_id => null
        ,p_app_id => null
        ,p_tag    => trim(l_tags_array(i))
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
