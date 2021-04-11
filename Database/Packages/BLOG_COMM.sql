CREATE OR REPLACE package  "BLOG_COMM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for public application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 11.05.2020 - Created
--    Jari Laine 11.04.2021 - New procedure reply_notify
--                            New functions validate_email and is_email_verified
--
--  TO DO:
--    #1  comment HTML validation could be improved
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment           in varchar2,
    p_remove_anchors    in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment           in varchar2,
    p_max_length        in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  function validate_email(
    p_email             in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  function is_email_verified(
    p_email             in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id           in varchar2,
    p_app_name          in varchar2,
    p_email_template    in varchar2
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 32
  procedure reply_notify(
    p_app_id            in varchar2,
    p_app_name          in varchar2,
    p_post_id           in varchar2,
    p_email_template    in varchar2
  );
--------------------------------------------------------------------------------
  procedure subscribe(
    p_post_id           in varchar2,
    p_email             in varchar2
  );
--------------------------------------------------------------------------------
  procedure unsubscribe(
    p_subscription_id   in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_COMM";
/


CREATE OR REPLACE package body "BLOG_COMM"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_whitelist_tags      constant varchar2(256)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  c_code_css_class      constant varchar2(256)  := 'z-program-code';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
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
    p_string in out nocopy varchar2
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
      ,p_whitelist_tags  => c_whitelist_tags
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
          ,p_value => '<pre class="' || c_code_css_class || '">'
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
    build_code_tab(
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
                then '<br>' || chr(10)
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
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment         in varchar2,
    p_remove_anchors  in boolean default false
  ) return varchar2
  as
    l_comment varchar2(32700);
  begin

    l_comment := p_comment;

    -- remove unwanted ascii codes
    remove_ascii(
       p_string => l_comment
    );
    -- remove all anchors
    if p_remove_anchors
    then
      remove_anchor(
        p_string => l_comment
      );
    end if;
    -- escape HTML
    escape_html(
       p_string => l_comment
    );
    -- build comment HTML
    build_comment_html(
       p_comment => l_comment
    );
    -- return comment
    return l_comment;

  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000
  ) return varchar2
  as
    l_xml       xmltype;
    l_result    varchar2(32700);
    l_err_mesg  varchar2(32700);

    xml_parsing_failed exception;
    pragma exception_init( xml_parsing_failed, -31011 );
  begin

    -- check formatted comment length
    if lengthb( p_comment ) > p_max_length
    then
      -- set error message
      l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_LENGTH';
    else
      -- check HTML is valid
      -- TO DO see item 1 from package specs
      begin
        l_xml := xmltype.createxml(
            '<root><row>'
          || p_comment
          || '</row></root>'
        );
      exception when xml_parsing_failed then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_HTML';
      end;

    end if;

    if l_err_mesg is not null
    then
      -- prepare return validation error message
      l_result := apex_lang.message( l_err_mesg );
    end if;
    -- return validation result
    -- if validation fails we return error message stored to variable
    return l_result;

  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_email(
    p_email in varchar2
  ) return boolean
  as
    l_params    apex_exec.t_parameters;
    l_response  clob;
    l_json      json_object_t;
    l_result    boolean;
  begin
    -- set result to false by default
    l_result := false;

    if not is_email_verified(p_email)
    then

      -- set email as parameter for rest source
      apex_exec.add_parameter( l_params, 'email', p_email );
      -- call rest source to validate email
      apex_exec.execute_rest_source(
         p_static_id  => 'ABSTRACT_EMAIL_VALIDATION_API'
        ,p_operation  => 'GET'
        ,p_parameters => l_params
      );

      -- get response
      l_response := apex_exec.get_parameter_clob( l_params, 'response' );
      apex_debug.info( 'Email validation response: %s', l_response );
      -- convert response to json object
      l_json := json_object_t( l_response );
      -- check email deliverability
      if l_json.get('deliverability').to_string = '"DELIVERABLE"'
      then
        -- if email is deliverable return true
        l_result := true;
      end if;
      
    else
      l_result := true;
    end if;

    return l_result;

  exception when others
  then
    -- if something goes wrong
    apex_debug.error( 'Email validation failed: %s', sqlerrm );
    raise_application_error( -20002 ,  apex_lang.message( 'BLOG_EMAIL_VALIDATION_ERROR' ) );
    raise;
  end validate_email;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_email_verified(
    p_email in varchar2
  ) return boolean
  as
    l_cnt     number;
    l_result  boolean;
  begin
    -- set result to false by default
    l_result := false;

    -- get email count from table
    select count(1) as cnt
    into l_cnt
    from blog_subscribers_email t1
    where 1 = 1
    and t1.email = lower( trim( p_email ) )
    ;
    if l_cnt = 1
    then
      -- email exists return true
      l_result := true;
    end if;
    -- return result
    return l_result;

  end is_email_verified;
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

    l_post_id   := to_number( p_post_id );

    -- fetch application email address
    l_app_email := blog_util.get_attribute_value('G_APP_EMAIL');
    -- if application email address is not set, exit from procedure
    if l_app_email is null
    then
      apex_debug.info('application email address is not set');
      return;
    end if;

    -- get values for APEX email template
    -- send notify email if blog email address is set
    -- and blogger has set email
    for c1 in(
      select v1.blogger_email
        ,json_object (
           'APP_NAME'     value p_app_name
          ,'BLOGGER_NAME' value v1.blogger_name
          ,'POST_TITLE'   value v1.title
          ,'POST_LINK'    value
              blog_url.get_post(
                 p_post_id => v1.id
                ,p_canonical => 'YES'
              )
        ) as placeholders
      from blog_v_all_posts v1
      where 1 = 1
      and v1.id = l_post_id
      and v1.blogger_email is not null
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
        ,c1.blogger_email
        ,l_app_email
        ,p_email_template
        ,c1.placeholders
      );
      -- send notify email
      apex_mail.send (
         p_to                 => c1.blogger_email
        ,p_from               => l_app_email
        ,p_template_static_id => p_email_template
        ,p_placeholders       => c1.placeholders
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
    l_app_email     varchar2(4000);
  begin

    l_post_id := to_number( p_post_id );

    -- fetch application email address
    l_app_email := blog_util.get_attribute_value( 'G_APP_EMAIL' );
    -- if application email address is not set, exit from procedure
    if l_app_email is null
    then
      apex_debug.info('application email address is not set');
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
      ,json_object (
         'APP_NAME'         value p_app_name
        ,'POST_TITLE'       value v1.title
        ,'POST_LINK'        value
            blog_url.get_post(
               p_app_id     => p_app_id
              ,p_post_id    => v1.id
              ,p_canonical  => 'YES'
            )
        ,'UNSUBSCRIBE_LINK' value
            blog_url.get_unsubscribe(
               p_app_id          => p_app_id
              ,p_post_id         => p_post_id
              ,p_subscription_id => t1.id
            )
       ) as placeholders
      from blog_comment_subscribers t1
      join blog_subscribers_email t2
        on t1.email_id = t2.id
      join blog_v_all_posts v1
        on t1.post_id = v1.id
      where 1 = 1
        and v1.id = l_post_id
        -- send notification if subscription is created less than months ago specified in settings
        and t1.subscription_date > l_watch_end
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
        ,c1.email
        ,l_app_email
        ,p_email_template
        ,c1.placeholders
      );
      -- send notify email
      apex_mail.send (
         p_from => l_app_email
        ,p_to   => c1.email
        ,p_template_static_id => p_email_template
        ,p_placeholders => c1.placeholders
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
          blog_comment_subscribers( post_id, email_id, subscription_date )
        values
          ( p_post_id, l_email_id, trunc( sysdate ) )
        ;
      -- if subscription already exists update subscription
      exception when dup_val_on_index
      then
        update blog_comment_subscribers
          set subscription_date = trunc( sysdate )
        where 1 = 1
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
