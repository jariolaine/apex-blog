CREATE OR REPLACE package  "BLOG_UTIL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for public application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 28.03.2020 - Signature 2 of get_year_month function
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name    in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name      in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id        in number
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id       in number,
    p_escape        in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id   in number,
    p_escape        in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id        in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month    in number,
    p_date_format   in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_archive_date  in timestamp with local time zone,
    p_date_format   in varchar2,
    p_posts_count   in number default null
  ) return varchar2;
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment     in varchar2,
    p_max_length  in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure save_comment(
    p_post_id       in number,
    p_comment_by    in varchar2,
    p_email         in varchar2 default null
  );
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/


CREATE OR REPLACE package body "BLOG_UTIL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- For holding validated comment
  g_comment varchar2(32700);
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure format_comment(
    p_comment         in out nocopy varchar2,
    p_whitelist_tags  in varchar2
  )
  as
    l_temp            varchar2(32700);
    
    l_code_row        pls_integer := 0;
    l_code_open_cnt   pls_integer := 0;
    l_code_close_cnt  pls_integer := 0;
    l_code_start_pos  pls_integer := 0;
    l_code_end_pos    pls_integer := 0;
    
    l_comment_tab     apex_t_varchar2;
    l_code_tab        apex_t_varchar2;
    
    c_code_new_open   constant varchar2(80) := '<pre class="z-program-code">';
    c_code_new_close  constant varchar2(80) := '</pre>';
  begin
    
    -- Change all hash marks so we can escape those
    -- after calling apex_escape.html_whitelist
    -- Escape of hash marks needed to prevent APEX substitutions
    p_comment := replace(p_comment, '#', '$HASH$');
    
    -- Escape comment html
    p_comment := apex_escape.html_whitelist(
       p_html            => p_comment
      ,p_whitelist_tags  => p_whitelist_tags
    );
    
    -- Escape hash marks
    p_comment := replace(p_comment, '$HASH$', '&#x23;');
    
    -- Check code open and close tag count
    l_code_open_cnt  := regexp_count(p_comment, '\<code\>', 1, 'i');
    l_code_close_cnt := regexp_count(p_comment, '\<\/code\>', 1, 'i');
    
    -- Process code tags if open and close count match ( pre check is for valid HTML )
    if l_code_open_cnt = l_code_close_cnt
    then
      
      -- Collect content inside code tags to collection
      for i in 1 .. l_code_open_cnt
      loop
      
        -- Get code start and end position
        l_code_start_pos := instr( lower( p_comment ), '<code>' );
        l_code_end_pos := instr( lower( p_comment ), '</code>' );
        
        -- Store code tag content to collection and wrap it to pre tag having class
        apex_string.push( 
           p_table => l_code_tab
          ,p_value => c_code_new_open
            || substr(p_comment, l_code_start_pos  + 6, l_code_end_pos - l_code_start_pos - 6)
            || c_code_new_close
        );
        
        -- Substitude handled code tag
        p_comment := rtrim( substr( p_comment, 1, l_code_start_pos - 1 ), chr(10) )
          || chr(10)
          || 'CODE#' || i
          || chr(10)
          || ltrim( substr( p_comment, l_code_end_pos + 7 ), chr(10) )
        ;
        
      end loop;
      
      -- Split comment to collection by new line character
      l_comment_tab := apex_string.split( p_comment, chr(10) );
      
      -- Comment is stored to collection
      -- start building comment with prober html tags
      p_comment := null;
      
      -- Format comment
      for i in 1 .. l_comment_tab.count
      loop
        
        l_temp := trim(l_comment_tab(i));
        
        -- Check if row is code block
        if regexp_like(l_temp, '^CODE\#[0-9]+$')
        then
          -- Get code block row number
          l_code_row := regexp_substr(l_temp, '[0-9]+');
          -- Close p tag, insert code block 
          -- and open p tag again for text
          p_comment := p_comment
            || '</p>'
            || chr(10)
            || l_code_tab(l_code_row)
            || chr(10)
            || '<p>'
          ;
          
        else
          -- Append text
          if l_temp is not null
          then
            if p_comment is null
            then
              p_comment := l_temp;
            else
              p_comment := p_comment
                ||
                  case 
                  when not substr( p_comment, length( p_comment ) - 2 ) = '<p>'
                  then '<br />' || chr(10)
                  end
                || l_temp
              ;
            end if;
          end if;
          
        end if;
        
      end loop;
      
      -- Wrap comment to p tag.
      p_comment := '<p>' || p_comment || '</p>';
      -- There might be empty p, if comment ends code tag, remove that
      p_comment := replace( p_comment, '<p></p>' );      
      
    end if;
    
  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name in varchar2
  ) return varchar2 result_cache
  as
    l_value varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_attribute_value'
      ,'p_attribute_name'
      ,p_attribute_name
    );

    if p_attribute_name is null then
      raise no_data_found;
    end if;

    -- fetch and return value from settings table
    select attribute_value
    into l_value
    from blog_settings
    where attribute_name = p_attribute_name
    ;
    
    apex_debug.info( 'Fetch attribute %s return: %s', p_attribute_name, l_value );
    return l_value;
    
  exception when no_data_found then
    apex_debug.error( 'Not found. Attribute: %s', coalesce( p_attribute_name, '(null)' ) );
    raise;
    
  when others then
    apex_debug.error( 'Unhandled error when fetching attribute: %s', p_attribute_name );
    raise;
    
  end get_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name in varchar2
  ) return varchar2
  as
    l_value varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_item_init_value'
      ,'p_item_name'
      ,p_item_name
    );

    if p_item_name is null then
      raise no_data_found;
    end if;

    -- fetch and return value from settings table
    select item_value
    into l_value
    from blog_items_init
    where 1 = 1
    and item_name = p_item_name
    ;
    apex_debug.info( 'Fetc item %s return: %s', p_item_name, l_value );
    return l_value;
  exception when no_data_found then
    apex_debug.error( 'Not found. Item: %s', coalesce( p_item_name, '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching item: %s', p_item_name );
    raise;
  end get_item_init_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in number
  )
  as
  begin

    apex_debug.enter(
      'blog_util.initialize_items'
      ,'p_app_id'
      ,p_app_id
    );

    if p_app_id is null then
      raise no_data_found;
    end if;

    -- loop materialized view and set items values
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_items_init i
      where i.application_id = p_app_id
    ) loop
      apex_debug.info( 'Initialize application id: %s item: %s value: %s', p_app_id, c1.item_name, c1.item_value );
      apex_util.set_session_state( c1.item_name, c1.item_value, false );
    end loop;

  exception when no_data_found then
    apex_debug.error( 'Not found. Application: %s', coalesce( p_app_id, '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when initialize application: %s', to_char( p_app_id ) );
    raise;
  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in number,
    p_escape      in boolean default false
  ) return varchar2
  as
    l_value varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_post_title'
      ,'p_post_id'
      ,p_post_id
      ,'p_escape'
      ,apex_debug.tochar(p_escape)
    );

    if p_post_id is null then
      raise no_data_found;
    end if;

    -- fetch and return post title
    select v1.post_title
    into l_value
    from blog_v_posts v1
    where v1.post_id = p_post_id
    ;
    apex_debug.info( 'Fetch post: %s return: %s', p_post_id, l_value );
    -- Espace html and return string
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Not found. Post: %s', coalesce( to_char( p_post_id ), '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching post: %s', to_char( p_post_id ) );
    raise;
  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in number,
    p_escape      in boolean default false
  ) return varchar2
  as
    l_value varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_category_title'
      ,'p_category_id'
      ,p_category_id
      ,'p_escape'
      ,apex_debug.tochar(p_escape)
    );

    if p_category_id is null then
      raise no_data_found;
    end if;

    -- fetch and return category name
    select v1.category_title
    into l_value
    from blog_v_categories v1
    where v1.category_id = p_category_id
    ;
    apex_debug.info( 'Fetch category: %s return: %s', p_category_id, l_value );
    -- Espace html and return string
    return case when p_escape then apex_escape.html(l_value) else l_value end;
  exception when no_data_found then
    apex_debug.error( 'Not found. Category: %s', coalesce( to_char( p_category_id ), '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching category: %s', to_char( p_category_id ) );
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in number
  ) return varchar2
  as
    l_value varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_tag'
      ,'p_tag_id'
      ,p_tag_id
    );

    if p_tag_id is null then
      raise no_data_found;
    end if;

    -- fetch and return tag name
    select t1.tag
    into l_value
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = p_tag_id
    ;
    apex_debug.info( 'Fetch tag: %s return: %s', p_tag_id, l_value );
    -- Espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found then
    apex_debug.error( 'Not found. Tag: %s', coalesce( to_char( p_tag_id ), '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching tag: %s', to_char( p_tag_id ) );
    raise;
  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month  in number,
    p_date_format in varchar2
  ) return varchar2 result_cache
  as
    l_value varchar2(256);
  begin

    apex_debug.enter(
      'blog_util.get_year_month'
      ,'p_year_month'
      ,p_year_month
      ,'p_date_format'
      ,p_date_format
    );

    if p_year_month is null then
      raise no_data_found;
    end if;

    -- query that passed year month number actually exists
    select blog_util.get_year_month(
       p_archive_date => archive_date
      ,p_date_format  => p_date_format
    )
    into l_value
    from blog_v_archive_lov
    where 1 = 1
    and year_month = p_year_month
    ;

    apex_debug.info( 'Fetch archive %s return: %s', p_year_month, l_value );
    return l_value;

  exception when no_data_found then
    apex_debug.error( 'Not found. Archive: %s', coalesce( to_char( p_year_month ), '(null)' ) );
    raise;
  when others then
    apex_debug.error( 'Unhandled error when fetching archive: %s', to_char( p_year_month ) );
    raise;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 2
  function get_year_month(
    p_archive_date  in timestamp with local time zone,
    p_date_format   in varchar2,
    p_posts_count   in number default null
  ) return varchar2
  as
    l_value varchar2(256);
  begin

    apex_debug.enter(
      'blog_util.get_year_month'
      ,'p_archive_date'
      ,p_archive_date
      ,'p_date_format'
      ,p_date_format
      ,'p_posts_count'
      ,p_posts_count
    );

    -- format archive date and return string
    return case when p_archive_date is not null then
      to_char(
         p_archive_date
        ,p_date_format || case when p_posts_count is not null then ' "(' || p_posts_count || ')"' end
      )
    end;
  end get_year_month;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment     in varchar2,
    p_max_length  in number default 4000
  ) return varchar2
  as
    l_xml               xmltype;
    l_whitelist_tags    varchar2(32700);
    xml_parsing_failed  exception;
    pragma exception_init( xml_parsing_failed, -31011 );
  begin
    
    blog_util.g_comment := p_comment;
    l_whitelist_tags := blog_util.get_attribute_value('COMMENT_WHITE_LIST_TAGS');
    
    blog_util.format_comment(
       p_comment        => blog_util.g_comment
      ,p_whitelist_tags => l_whitelist_tags
    );
    
    -- Check length
    if length(blog_util.g_comment) > p_max_length
    then
      return apex_lang.message( 'BLOG_ERR_COMMENT_LENGTH' );
    end if;
    
    -- Check that there tags are closed and opened properly
    begin
      l_xml := xmltype.createxml(
          '<root><row>' 
        || blog_util.g_comment
        || '</row></root>'
      );
    exception when xml_parsing_failed then
      return apex_lang.message( 'BLOG_ERR_COMMENT_HTML' );  
    end;
    
    return null;
    
  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure save_comment(
    p_post_id       in number,
    p_comment_by    in varchar2,
    p_email         in varchar2 default null
  )
  as
    l_comment         varchar2(32700);
  begin 
    
    insert into blog_comments_test
    (post_id, comment_by, body_html)
    values
    (p_post_id, p_comment_by, blog_util.g_comment)
    ;
    
  end save_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
