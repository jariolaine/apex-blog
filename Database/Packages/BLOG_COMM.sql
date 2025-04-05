create or replace package "BLOG_COMM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package provides procedures and functions for managing post comments,
--    including functionality for replying, flagging, email validation, and HTML content processing.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  11.05.2020   Jari Laine     Created package.
--  11.04.2021   Jari Laine     Added new procedure:
--                                - reply_notify
--                              Added new functions:
--                                - validate_email
--                                - is_email_verified
--  18.04.2021   Jari Laine     Added new function is_email.
--  30.10.2021   Jari Laine     Removed obsolete functions:
--                                - validate_email
--                                - is_email_verified
--  13.04.2022   Jari Laine     Enhanced flagging functionality:
--                                - Procedure flag_comment: Supports adding multiple flags.
--                                - Procedure unflag_comment: Supports removing multiple flags.
--  27.11.2022   Jari Laine     Updated procedure build_code_tab:
--                                - Removed leading and trailing line breaks from posted code.
--  15.08.2024   Jari Laine     Modified and renamed procedure:
--                                - remove_anchor to remove_html_tags
--                              Added new functions:
--                                - plain_text
--                                - short_text
--                              Updated procedure:
--                                - build_comment_html
--
--  ============================================================================
--  TO DO:
--  ============================================================================
--  #1 Improve HTML validation for comment content.
--  #2 Enhance email validation logic to handle edge cases.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  --  admin app pages 62
  function plain_text(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --
  function short_text(
    p_string          in varchar2,
    p_plain_text      in boolean default true,
    p_str_length      in number default 100
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function format_comment(
    p_comment         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  --  admin app page 20012
  function is_email(
    p_email           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
--  admin app pages 61
  procedure flag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app pages 61
  procedure unflag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
  -- Called from:
  --  admin app pages 62
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure subscribe(
    p_post_id         in varchar2,
    p_email           in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure unsubscribe(
    p_subscription_id in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_COMM";
/


create or replace package body "BLOG_COMM"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_whitelist_tags  constant varchar2(256) := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  c_code_block_html constant varchar2(256) := '<pre class="blog-program-code"><code>%s</code></pre>';
  c_app_email       constant varchar2(256) := blog_util.get_attribute_value( 'G_APP_EMAIL' );
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_html_tags(
    p_string    in out nocopy varchar2,
    p_html_tags in varchar2
  )
  as
    l_html_tags apex_t_varchar2;
  begin
    -- create table of html tags
    l_html_tags := apex_string.split( p_html_tags, ':' );
    -- loop table
    for i in 1 .. l_html_tags.count
    loop
      -- remove html tag
      p_string :=
        regexp_replace(
          p_string
        , apex_string.format(
            p_message => '<%0[^>]*>(.*?)<\/%0>'
          , p0 => l_html_tags(i)
          )
        , '', 1, 0, 'in'
        )
      ;
    end loop;

  end remove_html_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_ascii(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove unwanted ascii codes except new line chr 10
    for i in 0 .. 31
    loop
      if i != 10 then
        p_string := trim( replace( p_string, chr(i) ) );
      end if;
    end loop;
  end remove_ascii;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure escape_html(
    p_string in out nocopy varchar2
  )
  as
    l_hasmark constant varchar(10) := '#HashMark#';
  begin

    -- change all hash marks so we can escape those
    -- after calling apex_escape.html_whitelist
    -- escape of hash marks needed to prevent APEX substitutions
    p_string := replace( p_string, '#', l_hasmark );
    -- escape comment html
    p_string := apex_escape.html_whitelist(
      p_html            => p_string
    , p_whitelist_tags  => c_whitelist_tags
    );
    -- escape hash marks
    p_string := replace( p_string, l_hasmark, '	&#35;' );

  end escape_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_code_tab(
    p_comment   in out nocopy varchar2,
    p_code_tab  in out nocopy apex_t_varchar2
  )
  as

    l_code      varchar2(32700);
    l_code_cnt  pls_integer := 0;
    l_start_pos pls_integer := 0;
    l_end_pos   pls_integer := 0;

  begin

    -- check code open tag count
    l_code_cnt := regexp_count( p_comment, '<code>', 1, 'i' );

    -- process code tags if open and close count match ( pre check is for valid HTML )
    if l_code_cnt = regexp_count( p_comment, '<\/code>', 1, 'i' )
    then

      -- collect content inside code tags to collection
      for i in 1 .. l_code_cnt
      loop

        l_code := null;

        -- get code start and end position
        l_start_pos := instr( lower( p_comment ), '<code>' );
        l_end_pos := instr( lower( p_comment ), '</code>' );

        l_code := trim( substr( p_comment, l_start_pos  + 6, l_end_pos - l_start_pos - 6 ) );
        l_code := trim( trim( both chr(10) from l_code ) );

        -- store code tag content to collection and wrap it to pre tag having class
        apex_string.push(
          p_table => p_code_tab
        , p_value =>
            apex_string.format(
              p_message => c_code_block_html
            , p0 => l_code
           )
        );

        -- substitude handled code tag
        p_comment :=
          apex_string.format(
            p_message => '%s%s#BLOG_COMMENT_CODE%s#%s%s'
          , p0 => rtrim( substr( p_comment, 1, l_start_pos - 1 ), chr(10) )
          , p1 => chr(10)
          , p2 => i
          , p3 => chr(10)
          , p4 => ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )
          )
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
    l_code_row    pls_integer;
    l_code_tab    apex_t_varchar2;
    l_comment_tab apex_t_varchar2;
  begin

    -- process code tags
    build_code_tab(
      p_comment => p_comment
    , p_code_tab => l_code_tab
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
      if regexp_like( l_temp, '^#BLOG_COMMENT_CODE[0-9]+\#$' )
      then
        -- get code block row number
        l_code_row := regexp_substr( l_temp, '[0-9]+' );
        -- close p tag, insert code block
        -- and open p tag again for text
        p_comment :=
          apex_string.format(
            p_message => '%s%s'
          , p0 => p_comment
          , p1 => l_code_tab( l_code_row )
          )
        ;
      else
        -- append text if row is not empty
        if l_temp is not null
        then
          p_comment :=
            apex_string.format(
              p_message => '%s<p>%s</p>'
            , p0 => p_comment
            , p1 => l_temp
            )
          ;
        end if;

      end if;

    end loop;

  end build_comment_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function plain_text(
    p_string in varchar2
  ) return varchar2
  as
    l_string varchar2(32700);
  begin

    l_string := p_string;

    -- remove unwanted ascii
    remove_ascii(
      p_string => l_string
    );
    -- Unescape HTML entities
    l_string := utl_i18n.unescape_reference( l_string );
    -- remove code and anchor HTML tags
    remove_html_tags(
      p_string    => l_string
    , p_html_tags => 'code:a'
    );
    -- add space before html tag
    -- needed for language AI sentence recognition
    l_string := replace( l_string, '<', ' <' );
    -- remove HTML
    l_string := apex_escape.striphtml( l_string );
    -- remove extra whitespaces
    l_string := blog_util.remove_whitespace( l_string );

    return l_string;

  end plain_text;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function short_text(
    p_string      in varchar2,
    p_plain_text  in boolean default true,
    p_str_length  in number default 100
  ) return varchar2
  as
    l_length  pls_integer;
    l_string  varchar2(32700);
  begin

    l_string := p_string;

    if p_plain_text
    then
      l_string := plain_text( l_string );
    end if;

    l_length := instr( l_string, ' ', p_str_length );

    return
      case when l_length > 0
        then substr( l_string, 1, l_length ) || ' ...'
        else l_string
      end
    ;

  end short_text;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment in varchar2
  ) return varchar2
  as
    l_comment varchar2(32700);
  begin

    l_comment := p_comment;
    -- remove unwanted ascii
    remove_ascii(
      p_string => l_comment
    );
    -- remove anchors tags
    remove_html_tags(
      p_string    => l_comment
    , p_html_tags => 'a'
    );
    -- escape HTML
    escape_html(
      p_string => l_comment
    );
    -- build comment HTML
    build_comment_html(
      p_comment => l_comment
    );

    apex_debug.info( 'Formatted comment: %s', l_comment );
    -- return comment
    return l_comment;

  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment     in varchar2,
    p_max_length  in number default 4000
  ) return varchar2
  as
    l_xml       xmltype;
    l_result    varchar2(32700);
    l_err_mesg  varchar2(32700);

    xml_parsing_failed exception;
    pragma exception_init( xml_parsing_failed, -31011 );
  begin

    -- check formatted comment length
    if length( p_comment ) > p_max_length
    then
      -- set error message
      l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_LENGTH';
    else
      -- check HTML is valid
      -- TO DO see item 1 from package specs
      begin
        l_xml := xmltype.createxml(
          apex_string.format(
            p_message => '<comment>%s</comment>'
          , p0 => p_comment
          )
        );
      exception when xml_parsing_failed then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_HTML';
      end;

      if blog_comm.short_text( p_comment ) is null
      then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_PREVIEW';
      end if;

    end if;

    if l_err_mesg is not null
    then
      -- prepare return validation error message
      l_result := apex_lang.message(
        p_name => l_err_mesg
      );
    end if;
    -- return validation result
    -- if validation fails we return error message stored to variable
    return l_result;

  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_email(
    p_email     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin
    -- TO DO see item 3 from package specs

    -- do some basic check for email address
    if not regexp_like( p_email, '^.*\@.*\..*$' )
    then
      -- if validation fails prepare error message
      l_err_mesg := p_err_mesg;

    end if;

    return l_err_mesg;

  end is_email;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure flag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop

      begin
        insert into blog_comment_flags( comment_id, flag )
          values( p_comment_id, l_flags(i) )
        ;
      exception when dup_val_on_index
      then
        null;
      end;

    end loop;

  end flag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unflag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop
      delete from blog_comment_flags
      where 1 = 1
        and comment_id = p_comment_id
        and flag = l_flags(i)
      ;
    end loop;

  end unflag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  )
  as
    l_post_id number;
  begin

    l_post_id   := to_number( p_post_id );

    -- if application email address is not set, exit from procedure
    if c_app_email is null
    then
      apex_debug.warn( 'application email address is not set' );
      return;
    end if;

    -- get values for APEX email template
    -- send notify email if blog email address is set
    -- and blogger has set email
    for c1 in(
      select
        v1.blogger_email
      , json_object(
          'APP_NAME'      value p_app_name
        , 'BLOGGER_NAME'  value v1.blogger_name
        , 'POST_TITLE'    value v1.title
        , 'POST_LINK'     value
            blog_url.get_post(
              p_post_id   => v1.id
            , p_canonical => 'YES'
            )
        ) as placeholders
      from blog_v_all_posts v1
      where 1 = 1
      and v1.id = l_post_id
      and v1.blogger_email is not null
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
      , c1.blogger_email
      , c_app_email
      , p_email_template
      , c1.placeholders
      );
      -- send notify email
      apex_mail.send(
        p_to                  => c1.blogger_email
      , p_from                => c_app_email
      , p_template_static_id  => p_email_template
      , p_placeholders        => c1.placeholders
      );

    end loop;

  end new_comment_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  )
  as
    l_watch_end     date;
    l_post_id       number;
    l_watch_months  number;
  begin

    l_post_id := to_number( p_post_id );

    -- if application email address is not set, exit from procedure
    if c_app_email is null
    then
      apex_debug.warn( 'application email address is not set' );
      return;
    end if;

    -- fetch comment watch expires
    l_watch_months := to_number(
        blog_util.get_attribute_value( 'G_COMMENT_WATCH_MONTHS' )
      ) * -1
    ;
    l_watch_end := add_months( trunc( sysdate ), l_watch_months );

    -- send notify users that have subscribed to replies to comment
    for c1 in(
      select t2.email
      ,json_object(
         'APP_NAME'         value p_app_name
        ,'POST_TITLE'       value v1.title
        ,'POST_LINK'        value
            blog_url.get_post(
              p_application => p_app_id
            , p_post_id     => p_post_id
            , p_canonical   => 'YES'
            )
        ,'UNSUBSCRIBE_LINK' value
            blog_url.get_unsubscribe(
              p_application     => p_app_id
            , p_post_id         => p_post_id
            , p_subscription_id => t1.id
            )
       ) as placeholders
      from blog_comment_subscribers t1
      join blog_subscribers_email t2
        on t1.email_id = t2.id
      join blog_v_all_posts v1
        on t1.post_id = v1.id
      where 1 = 1
        and t1.is_active
          * t2.is_active
          * case v1.post_status_code when 'PUBLISHED' then 1 else 0 end
          = 1
        and v1.id = l_post_id
        -- send notification if subscription is created less than months ago specified in settings
        and t1.subscription_date > l_watch_end
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
        ,c1.email
      , c_app_email
      , p_email_template
      , c1.placeholders
      );
      -- send notify email
      apex_mail.send(
        p_from => c_app_email
      , p_to => c1.email
      , p_template_static_id => p_email_template
      , p_placeholders => c1.placeholders
      );

    end loop;

  end reply_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure subscribe(
    p_post_id in varchar2,
    p_email   in varchar2
  )
  as
    l_email     varchar2(256);
    l_post_id   number;
    l_email_id  number;
  begin

    l_email   := trim( lower( p_email ) );
    l_post_id := to_number( p_post_id );

    -- subscribe user to get notify on reply to comment
    if p_email is not null
    and p_post_id is not null
    then
      -- check if email address already exists and fetch id
      begin
        select id
        into l_email_id
        from blog_subscribers_email
        where 1 = 1
          and email = l_email
        ;
      -- if email address not exists, insert and return id
      exception when no_data_found
      then
        insert into
            blog_subscribers_email( email, is_active )
        values
          ( l_email, 1 )
        returning id into l_email_id
        ;
      end;
      -- insert post to email relation
      begin
        insert into
          blog_comment_subscribers( post_id, email_id, subscription_date, is_active )
        values
          ( p_post_id, l_email_id, trunc( sysdate ), 1 )
        ;
      -- if subscription already exists update subscription
      exception when dup_val_on_index
      then
        update blog_comment_subscribers
          set subscription_date = trunc( sysdate )
        where 1 = 1
          and is_active = 1
          and post_id = p_post_id
          and email_id = l_email_id
        ;
      end;
    end if;

  end subscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unsubscribe(
    p_subscription_id in varchar2
  )
  as
  begin
    -- remove user subscribtion to get notify from replies
    delete
      from blog_comment_subscribers
    where 1 = 1
      and id = p_subscription_id
    ;
  end unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_COMM";
/
