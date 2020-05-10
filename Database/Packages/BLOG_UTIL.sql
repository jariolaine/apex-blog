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
--    Jari Laine 15.04.2020 - function validate_comment
--    Jari Laine 26.04.2020 - Changed validate_comment us apex_util.savekey_vc2
--                            and removed custom functions that was doing same thing
--    Jari Laine 08.05.2020 - Functions get_year_month are obsolete
--                            application changed to group archives by year
--    Jari Laine 10.05.2020 - Procedure new_comment_notify to notify blogger about new comments
--
--  TO DO:
--    #1  comment HTML validation could improved
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  function get_item_init_value(
    p_item_name       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id         in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_newer_id        out nocopy varchar2,
    p_older_id        out nocopy varchar2
  );
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id     in varchar2,
    p_escape          in boolean
  ) return varchar2;
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Signature 1
  -- obsolete / not used
  function get_year_month(
    p_year_month      in varchar2,
    p_date_format     in varchar2
  ) return varchar2 result_cache;
--------------------------------------------------------------------------------
  -- Signature 2
  -- obsolete / not used
  function get_year_month(
    p_archive_date    in timestamp with local time zone,
    p_date_format     in varchar2,
    p_posts_count     in number default null
  ) return varchar2;
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000,
    p_set_variable    in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_ascii(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove unwanted ascii codes
    for i in 0 .. 31
    loop
      if i != 10 then
        p_string := trim( replace( p_string, chr(i) ) );
      end if;
    end loop;
  end remove_ascii;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_anchor(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove anchor tags
    p_string := regexp_replace( p_string, '<a[^>]*>(.*?)<\/a>', '', 1, 0, 'i' );
  end remove_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure escape_html(
    p_string          in out nocopy varchar2,
    p_whitelist_tags  in varchar2
  )
  as
  begin

    -- change all hash marks so we can escape those
    -- after calling apex_escape.html_whitelist
    -- escape of hash marks needed to prevent APEX substitutions
    p_string := replace( p_string, '#', '#HashMark#' );

    -- escape comment html
    p_string := apex_escape.html_whitelist(
       p_html            => p_string
      ,p_whitelist_tags  => p_whitelist_tags
    );

    -- escape hash marks
    p_string := replace( p_string, '#HashMark#', '&#x23;' );

  end escape_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_code_tab(
    p_comment   in out nocopy varchar2,
    p_code_tab  in out nocopy apex_t_varchar2
  )
  as

    l_code_cnt  pls_integer := 0;
    l_start_pos pls_integer := 0;
    l_end_pos   pls_integer := 0;

  begin

    -- check code open tag count
    l_code_cnt := regexp_count( p_comment, '\<code\>', 1, 'i' );

    -- process code tags if open and close count match ( pre check is for valid HTML )
    if l_code_cnt = regexp_count( p_comment, '\<\/code\>', 1, 'i' )
    then

      -- collect content inside code tags to collection
      for i in 1 .. l_code_cnt
      loop

        -- get code start and end position
        l_start_pos := instr( lower( p_comment ), '<code>' );
        l_end_pos := instr( lower( p_comment ), '</code>' );

        -- store code tag content to collection and wrap it to pre tag having class
        apex_string.push(
           p_table => p_code_tab
          ,p_value => '<pre class="' || blog_globals.g_code_css_class || '">'
            || substr(p_comment, l_start_pos  + 6, l_end_pos - l_start_pos - 6)
            || '</pre>'
        );

        -- substitude handled code tag
        p_comment := rtrim( substr( p_comment, 1, l_start_pos - 1 ), chr(10) )
          || chr(10)
          || 'CODE#' || i
          || chr(10)
          || ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )
        ;

      end loop;

    end if;

  end build_code_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_comment_html(
    p_comment in out nocopy varchar2
  )
  as
    l_temp        varchar2(32700);
    l_code_row    number;
    l_code_tab    apex_t_varchar2;
    l_comment_tab apex_t_varchar2;
  begin

    -- process code tags
    blog_util.build_code_tab(
       p_comment => p_comment
      ,p_code_tab => l_code_tab
    );

    -- split comment to collection by new line character
    l_comment_tab := apex_string.split( p_comment, chr(10) );

    -- comment is stored to collection
    -- start building comment with prober html tags
    p_comment := null;

    -- Format comment
    for i in 1 .. l_comment_tab.count
    loop

      l_temp := trim( l_comment_tab(i) );

      -- check if row is code block
      if regexp_like( l_temp, '^CODE\#[0-9]+$' )
      then
        -- get code block row number
        l_code_row := regexp_substr( l_temp, '[0-9]+' );
        -- close p tag, insert code block
        -- and open p tag again for text
        p_comment := p_comment
          || '</p>'
          || chr(10)
          || l_code_tab(l_code_row)
          || chr(10)
          || '<p>'
        ;

      else
        -- append text if row is not empty
        if l_temp is not null
        then
          -- if we are in first row
          if p_comment is null
          then
            p_comment := l_temp;
          else
            -- check if p tag is opened, then insert br for new line
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

    -- wrap comment to p tag.
    p_comment := '<p>' || p_comment || '</p>';
    -- there might be empty p, if comment ends code tag, remove that
    p_comment := replace( p_comment, '<p></p>' );

  end build_comment_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure format_comment(
    p_comment         in out nocopy varchar2,
    p_whitelist_tags  in varchar2
  )
  as
    l_comment varchar2(32700);
  begin

    -- remove unwanted ascii codes
    blog_util.remove_ascii(
       p_string => p_comment
    );
    -- remove all anchors
--    blog_util.remove_anchor(
--       p_string => l_comment
--    );
    -- escape HTML
    blog_util.escape_html(
       p_string => p_comment
      ,p_whitelist_tags  => p_whitelist_tags
    );
    -- build comment HTML
    blog_util.build_comment_html(
       p_comment => p_comment
    );

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

    exception when no_data_found
    then

      apex_debug.error(
         p_message => 'No data found. %s( %s => %s )'
        ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
        ,p1 => 'p_attribute_name'
        ,p2 => coalesce( p_attribute_name, '(null)' )
      );
      raise;

    when others
    then

      apex_debug.error(
         p_message => 'Unhandled error. %s( %s => %s )'
        ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
        ,p1 => 'p_attribute_name'
        ,p2 => coalesce( p_attribute_name, '(null)' )
      );
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

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_attribute_name'
      ,p2 => coalesce( p_item_name, '(null)' )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_attribute_name'
      ,p2 => coalesce( p_item_name, '(null)' )
    );
    raise;

  end get_item_init_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in varchar2
  )
  as
    l_app_id number;
  begin

    apex_debug.enter(
      'blog_util.initialize_items'
      ,'p_app_id'
      ,p_app_id
    );

    if p_app_id is null then
      raise no_data_found;
    end if;

    l_app_id := to_number( p_app_id );
    -- loop materialized view and set items values
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_items_init i
      where i.application_id = l_app_id
    ) loop

      apex_debug.info( 'Initialize application id: %s item: %s value: %s', p_app_id, c1.item_name, c1.item_value );
      apex_util.set_session_state( c1.item_name, c1.item_value, false );

    end loop;

  exception when no_data_found then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_app_id'
      ,p2 => coalesce( p_app_id, '(null)' )
    );
    raise;

  when others then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_app_id'
      ,p2 => coalesce( p_app_id, '(null)' )
    );
    raise;

  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_title(
    p_post_id     in varchar2,
    p_escape      in boolean
  ) return varchar2
  as
    l_value   varchar2(4000);
    l_post_id number;
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

    l_post_id := to_number( p_post_id );

    -- fetch and return post title
    select v1.post_title
    into l_value
    from blog_v_posts v1
    where v1.post_id = l_post_id
    ;
    apex_debug.info( 'Fetch post: %s return: %s', p_post_id, l_value );
    -- espace html and return string
    return case when p_escape
      then apex_escape.html(l_value)
      else l_value
      end
    ;

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  end get_post_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_post_pagination(
    p_post_id         in varchar2,
    p_newer_id        out nocopy varchar2,
    p_older_id        out nocopy varchar2
  )
  as
    l_post_id   number;
    l_newer_id  number;
    l_older_id  number;
  begin

    apex_debug.enter(
      'blog_util.pagination'
      ,'p_post_id'
      ,p_post_id
    );

    if p_post_id is null then
      raise no_data_found;
    end if;

    l_post_id := to_number( p_post_id );

    select
       q1.newer_id
      ,q1.older_id
    into l_newer_id, l_older_id
    from (
      select
         v1.post_id
        ,lag( v1.post_id ) over(order by v1.published_on desc) as newer_id
        ,lead( v1.post_id ) over(order by v1.published_on desc) as older_id
      from blog_v_posts v1
      where 1 = 1
    ) q1
    where 1 = 1
    and q1.post_id = l_post_id
    ;

    p_newer_id  := to_char( l_newer_id, blog_globals.g_number_format );
    p_older_id  := to_char( l_older_id, blog_globals.g_number_format );

    apex_debug.info( 'Fetch post: %s next_id: %s prev_id: %s', p_post_id, p_newer_id, p_older_id );

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_newer_id'
      ,p4 => p_newer_id
      ,p5 => 'p_older_id'
      ,p6 => p_older_id
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_post_id'
      ,p2 => coalesce( p_post_id, '(null)' )
      ,p3 => 'p_newer_id'
      ,p4 => p_newer_id
      ,p5 => 'p_older_id'
      ,p6 => p_older_id
    );
    raise;

  end get_post_pagination;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2,
    p_escape      in boolean
  ) return varchar2
  as
    l_category_id number;
    l_title       varchar2(4000);
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

    l_category_id := to_number( p_category_id );

    -- fetch and return category name
    select v1.category_title
    into l_title
    from blog_v_categories v1
    where v1.category_id = l_category_id
    ;
    apex_debug.info( 'Fetch category: %s return: %s', p_category_id, l_title );
    -- espace html and return string
    return case when p_escape
      then apex_escape.html(l_title)
      else l_title
      end
    ;

  exception when no_data_found then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_category_id'
      ,p2 => coalesce( p_category_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;

  when others then
    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_category_id'
      ,p2 => coalesce( p_category_id, '(null)' )
      ,p3 => 'p_escape'
      ,p4 => apex_debug.tochar( p_escape )
    );
    raise;
  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_tag_id  number;
    l_value   varchar2(4000);
  begin

    apex_debug.enter(
      'blog_util.get_tag'
      ,'p_tag_id'
      ,p_tag_id
    );

    if p_tag_id is null then
      raise no_data_found;
    end if;

    l_tag_id := to_number( p_tag_id );

    -- fetch and return tag name
    select t1.tag
    into l_value
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = l_tag_id
    ;
    apex_debug.info( 'Fetch tag: %s return: %s', p_tag_id, l_value );
    -- espace html and return string
    return apex_escape.html( l_value );
  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_tag_id'
      ,p2 => coalesce( p_tag_id, '(null)' )
    );
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Signature 1
  function get_year_month(
    p_year_month  in varchar2,
    p_date_format in varchar2
  ) return varchar2 result_cache
  as
    l_year_month  number;
    l_value       varchar2(256);
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

    l_year_month := to_number( p_year_month );
    -- query that passed year month number actually exists
    select blog_util.get_year_month(
       p_archive_date => archive_date
      ,p_date_format  => p_date_format
    )
    into l_value
    from blog_v_archive_year_month
    where 1 = 1
    and archive_year_month = l_year_month
    ;

    apex_debug.info( 'Fetch archive %s return: %s', p_year_month, l_value );
    return l_value;

  exception when no_data_found
  then

    apex_debug.error(
       p_message => 'No data found. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_year_month'
      ,p2 => coalesce( p_year_month, '(null)' )
      ,p3 => 'p_date_format'
      ,p4 => p_date_format
    );
    raise;

  when others
  then

    apex_debug.error(
       p_message => 'Unhandled error. %s( %s => %s, %s => %s )'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => 'p_year_month'
      ,p2 => coalesce( p_year_month, '(null)' )
      ,p3 => 'p_date_format'
      ,p4 => p_date_format
    );
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
    p_comment       in varchar2,
    p_max_length    in number default 4000,
    p_set_variable  in varchar2 default 'NO'
  ) return varchar2
  as

    l_xml               xmltype;
    l_error             varchar2(32700);
    l_comment           varchar2(32700);
    l_whitelist_tags    varchar2(32700);

    xml_parsing_failed  exception;
    pragma exception_init( xml_parsing_failed, -31011 );

  begin

    l_comment := p_comment;

    -- fetch allowed HTML tags from settings
    l_whitelist_tags := blog_util.get_attribute_value(
      p_attribute_name => 'COMMENT_WHITELIST_TAGS'
    );
    -- format comment
    blog_util.format_comment(
       p_comment        => l_comment
      ,p_whitelist_tags => l_whitelist_tags
    );
    -- check formatted comment length
    if length( l_comment ) > p_max_length
    then
      -- get error message
      l_error := apex_lang.message( 'BLOG_VALIDATION_ERR_COMMENT_LENGTH' );
    else
      -- check HTML is valid
      -- TO DO see item 1 from package specs
      begin
        l_xml := xmltype.createxml(
            '<root><row>'
          || l_comment
          || '</row></root>'
        );
      exception when xml_parsing_failed then
        -- get error message
        l_error :=  apex_lang.message( 'BLOG_VALIDATION_ERR_COMMENT_HTML' );
      end;
    end if;

    if l_error is null
    then
      -- if validation passed set package vartiable
      if p_set_variable = 'YES'
      then
        l_comment := apex_util.savekey_vc2(
           p_val => l_comment
        );
      end if;
    end if;

    -- return validation result
    -- if validation fails we return error message stored to variable
    return l_error;

  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  )
  as
    l_post_id   number;
    l_app_email varchar2(4000);
  begin

    -- fetch application email address
    l_app_email := blog_util.get_attribute_value('APP_EMAIL');

    -- send notify email if application email address is set
    if l_app_email is not null
    then

      l_post_id   := to_number( p_post_id );

      -- get values for APEX email template
      for c1 in(
        select v1.blogger_email
          ,json_object (
             'APP_NAME'     value p_app_name
            ,'BLOGGER_NAME' value v1.blogger_name
            ,'POST_TITLE'   value v1.title
            ,'POST_LINK'    value blog_url.get_post(
                                     p_post_id => v1.id
                                    ,p_canonical => 'YES'
                                  )
          ) as placeholders
        from blog_v_all_posts v1
        where 1 = 1
        and v1.id = l_post_id
      ) loop
        -- send notify email
        apex_mail.send (
           p_to                 => c1.blogger_email
          ,p_from               => l_app_email
          ,p_template_static_id => p_email_template
          ,p_placeholders       => c1.placeholders
        );
      end loop;

    end if;

  end new_comment_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
