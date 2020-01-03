CREATE OR REPLACE package  "BLOG_PLUGIN" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Functions and procedures for APEX plugins
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 03.01.2020 - Comments to package specs
--
--  TO DO: (search from body TODO#x)
--    Jari Laine 03.01.2020 - whole package need to rewritten and reviewed.
--
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
  g_formatted_comment varchar2(32700);
  g_question_answer   pls_integer;
-------------------------------------------------------------------------------
  procedure render_formatting_buttons(
    p_item in apex_plugin.t_item,
    p_plugin in apex_plugin.t_plugin,
    p_param in apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
  );
-------------------------------------------------------------------------------
  function render_comment_textarea(
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
  function validate_comment_textarea(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin,
    p_value  in varchar2
  ) return apex_plugin.t_page_item_validation_result;
--------------------------------------------------------------------------------
  function render_math_question_field(
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
  function ajax_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin
  ) return apex_plugin.t_page_item_ajax_result;
--------------------------------------------------------------------------------
  function validate_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin,
    p_value  in varchar2
  ) return apex_plugin.t_page_item_validation_result;
--------------------------------------------------------------------------------
  function render_google_plus_one_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
  function render_google_share_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
  function render_facebook_like_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
  function render_twitter_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/


CREATE OR REPLACE package body  "BLOG_PLUGIN" 
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables, procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment         in varchar2,
    p_whitelist_tags  in varchar2
  ) return varchar2
  as
    l_comment               varchar2(32700);
    l_temp                  varchar2(32700);
    l_len_s                 number := 0;
    l_len_e                 number := 0;
    l_count_open            simple_integer := 0;
    l_count_close           simple_integer := 0;
    l_start                 simple_integer := 0;
    l_end                   simple_integer := 0;
    l_comment_arr           apex_application_global.vc_arr2;
    l_code_arr              apex_application_global.vc_arr2;
    c_code_open             constant varchar2(80) := '<code>';
    c_code_close            constant varchar2(80) := '</code>';
    c_syntaxhighlight_open  constant varchar2(80) := '<pre class="program-code">';
    c_syntaxhighlight_close constant varchar2(80) := '</pre>';
  begin
    l_len_s := length(c_code_open);
    l_len_e := length(c_code_close);
    /* Change all hash marks so we can escape those later*/
    l_comment := replace(p_comment, '#', '$@#HASH#@$');
    /* escape comment html */
    l_comment := apex_escape.html_whitelist (
      p_html            => l_comment,
      p_whitelist_tags  => p_whitelist_tags
    );
    /* Escape hash to e.g. prevent APEX substitutions */
    l_comment := replace(l_comment, '$@#HASH#@$', '&#x23;');
    /* check code tag count */
    l_count_open  := regexp_count(l_comment, c_code_open);
    l_count_close := regexp_count(l_comment, c_code_close);
    /* Process code tags */
    if l_count_open = l_count_close then
      /* Store text inside code tags to array while format rest of message*/
      for i in 1 .. l_count_open
      loop
        l_start       := instr(l_comment, c_code_open);
        l_end         := instr(l_comment, c_code_close);
        l_code_arr(i) := c_syntaxhighlight_open
                      || substr(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)
                      || c_syntaxhighlight_close;
        l_comment     := substr(l_comment, 1, l_start -1)
                      || chr(10)
                      || '$@#' || i || '#@$'
                      || chr(10)
                      || substr(l_comment, l_end + l_len_e);
      end loop;
      /* Format message */
      l_comment_arr := apex_util.string_to_table(l_comment, chr(10));
      l_comment := null;
      for i in 1 .. l_comment_arr.count
      loop
        /* Remove empty lines and do not add extra tags for code */
        l_temp := trim(l_comment_arr(i));
        if regexp_like(l_temp, '^\$\@\#[0-9]+\#\@\$$') then
          l_comment := l_comment || l_temp;
        elsif l_temp is not null then
          l_comment := l_comment || '<p>' || l_temp || '</p>';
        end if;
      end loop;
      /* insert code tags back to comment */
      for i in 1 .. l_code_arr.count
      loop
        l_comment := replace(l_comment, '$@#' || i || '#@$', l_code_arr(i));
      end loop;
    end if;
    return l_comment;
  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_formatting_buttons(
    p_item in apex_plugin.t_item,
    p_plugin in apex_plugin.t_plugin,
    p_param in apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
  )
  as
    
    l_item_name   varchar2(30);
    l_name        varchar2(30);
    l_code        varchar2(30);
    l_bold        varchar2(30);
    l_italics     varchar2(30);
    l_underline   varchar2(30);
    l_styles      varchar2(255);
    l_formatting  varchar2(10);
    
  begin
  
    
    
    if not apex_application.g_printer_friendly then
          
          
--      l_name := apex_plugin.get_input_name_for_page_item(false);
      
      l_item_name := p_item.attribute_01;

      l_code      := apex_lang.lang('Code');
      l_bold      := apex_lang.lang('Bold');
      l_italics   := apex_lang.lang('Italics');
      l_underline := apex_lang.lang('Underline');
  
      sys.htp.p(
        '<button type="button" '
        || q'[onclick="blog.plugin.wrapSelection('b',']' || l_item_name || q'[');" ]'
        || 'title="' || l_bold  || '" '
        || 'aria-label="' || l_bold  || '" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-bold"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" '
        || q'[onclick="blog.plugin.wrapSelection('i',']' || l_item_name || q'[');" ]'
        || 'title="' || l_italics ||'" '
        || 'aria-label="' || l_italics ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-italic"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" '
        || q'[onclick="blog.plugin.wrapSelection('u',']' || l_item_name || q'[');" ]'
        || 'title="' || l_underline ||'" '
        || 'aria-label="' || l_underline ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-underline"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" '
        || q'[onclick="blog.plugin.wrapSelection('code',']' || l_item_name || q'[');" ]'
        || 'title="' || l_code ||'" '
        || 'aria-label="' || l_code ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-code"></span>'
        || '</button>'
      );

      -- Tell APEX that this textarea is navigable
--      p_result.is_navigable := true;
      
    end if;
    
  end render_formatting_buttons;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function render_comment_textarea(
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    l_name        varchar2(30);
    l_code        varchar2(30);
    l_bold        varchar2(30);
    l_italics     varchar2(30);
    l_underline   varchar2(30);
    l_styles      varchar2(255);
    l_formatting  varchar2(10);
    l_result      apex_plugin.t_page_item_render_result;
  begin
    l_formatting := coalesce(p_item.attribute_01, 'Y');
    if p_is_readonly or p_is_printer_friendly then
      -- emit hidden textarea if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_value,
        p_is_readonly => p_is_readonly,
        p_is_printer_friendly => p_is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    else
      -- Because the page item saves state, we have to call get_input_name_for_page_item
      -- which generates the internal hidden p_arg_names textarea. It will also RETURN the
      -- HTML textarea name which we have to use when we render the HTML input textarea.
      l_name := apex_plugin.get_input_name_for_page_item(false);

      l_code      := apex_lang.lang('Code');
      l_bold      := apex_lang.lang('Bold');
      l_italics   := apex_lang.lang('Italics');
      l_underline := apex_lang.lang('Underline');
      
      sys.htp.p('<div>');
      
      if l_formatting = 'Y' then
        sys.htp.p('<div>');
        sys.htp.p(
          '<button type="button" '
          || q'[onclick="addStyleTag('b',']' || p_item.name || q'[');" ]'
          || 'title="' || l_bold  || '" '
          || 'aria-label="' || l_bold  || '" '
          || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
          || '<span aria-hidden="true" class="t-Icon fa fa-bold"></span>'
          || '</button>'
        );
        sys.htp.p(
          '<button type="button" '
          || q'[onclick="addStyleTag('i',']' || p_item.name || q'[');" ]'
          || 'title="' || l_italics ||'" '
          || 'aria-label="' || l_italics ||'" '
          || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
          || '<span aria-hidden="true" class="t-Icon fa fa-italic"></span>'
          || '</button>'
        );
        sys.htp.p(
          '<button type="button" '
          || q'[onclick="addStyleTag('u',']' || p_item.name || q'[');" ]'
          || 'title="' || l_underline ||'" '
          || 'aria-label="' || l_underline ||'" '
          || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
          || '<span aria-hidden="true" class="t-Icon fa fa-underline"></span>'
          || '</button>'
        );
        sys.htp.p(
          '<button type="button" '
          || q'[onclick="addStyleTag('code',']' || p_item.name || q'[');" ]'
          || 'title="' || l_code ||'" '
          || 'aria-label="' || l_code ||'" '
          || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
          || '<span aria-hidden="true" class="t-Icon fa fa-code"></span>'
          || '</button>'
        );
        sys.htp.p('</div>');
        sys.htp.p('<div>' || apex_escape.html (apex_lang.message('MSG_ALLOWED_HTML_TAGS')) || '</div>');
        --sys.htp.p('</div>');
      end if;
      sys.htp.prn('<textarea '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'textarea')
        || 'cols="' || p_item.element_width ||'" '
        || 'rows="' || p_item.element_height ||'" '
        || 'maxlength="' || p_item.element_max_length || '">'
      );
      apex_plugin_util.print_escaped_value(p_value);
      sys.htp.p('</textarea>');
      sys.htp.p('</div>');
      -- Tell APEX that this textarea is navigable
      l_result.is_navigable := true;
    end if;
    return l_result;
  end render_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment_textarea(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin,
    p_value  in varchar2
  ) return apex_plugin.t_page_item_validation_result
  as
    l_formatting  varchar2(10);
    l_tmp_item    varchar2(30);
    l_comment     xmltype;
    l_is_valid    boolean;
    l_result      apex_plugin.t_page_item_validation_result;
    xml_parse_err exception;
    pragma exception_init (xml_parse_err , -31011);

    c_comment_whitelist_tags constant varchar2(200)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  begin
    l_formatting := coalesce(p_item.attribute_01, 'Y');
    l_tmp_item := p_item.attribute_02;
    blog_plugin.g_formatted_comment := p_value;
    /* Remove some ascii codes */
    for i in 0 .. 31
    loop
      if i != 10 then
        blog_plugin.g_formatted_comment := trim(replace(blog_plugin.g_formatted_comment, chr(i)));
      end if;
    end loop;
    if blog_plugin.g_formatted_comment is null then
      return null;
    end if;
    if length(blog_plugin.g_formatted_comment) >= p_item.element_max_length then
      l_is_valid := false;
      l_result.message := apex_lang.message('VALIDATION_COMMENT_LENGTH', p_item.plain_label, p_item.element_max_length);
    else
      l_is_valid := true;
    end if;
    if l_is_valid then
      /* Format value */
      if l_formatting = 'Y' then
        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, c_comment_whitelist_tags);
      else
        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, null);
      end if;
      /* Validate value html tags */
      begin
        l_comment := xmltype.createxml(
            '<root><row>' 
          || blog_plugin.g_formatted_comment
          || '</row></root>'
        );
      exception
      when xml_parse_err then
        l_is_valid := false;
        apex_debug.error('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
      when others then
        apex_debug.error('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
        l_is_valid := false;
      end;
      if not l_is_valid then
        l_is_valid := false;
        l_result.message := apex_lang.message('VALIDATION_COMMENT_FORMAT', p_item.plain_label);
      end if;
    end if;
    return l_result;
  end validate_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function render_math_question_field(
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    l_name        varchar2(30);
    l_answer_item varchar2(30);
    l_result      apex_plugin.t_page_item_render_result;
  begin
    l_name        := apex_plugin.get_input_name_for_page_item(false);
    l_answer_item := p_item.attribute_01;

    if p_is_readonly or p_is_printer_friendly then
      -- emit hidden textarea if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_value,
        p_is_readonly => p_is_readonly,
        p_is_printer_friendly => p_is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    else
--      sys.htp.p('<div>');
      sys.htp.p('<input type="text" '
        || 'size="' || p_item.element_width ||'" '
        || 'maxlength="' || p_item.element_max_length || '" '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'text_field apex-item-text')
        || 'value="" />'
      );
--      sys.htp.p('</div>');
      apex_javascript.add_onload_code (
        p_code => 'apex.server.plugin("' || apex_plugin.get_ajax_identifier || '",{},{'
        || 'dataType:"html",'
        || 'success:function(data){'
        || '$("'
        || apex_plugin_util.page_item_names_to_jquery(p_item.name) 
        || q'[_LABEL").html(data)}]'
        || '});'
      );
      -- Tell APEX that this textarea is navigable
      l_result.is_navigable := true;
    end if;
    return l_result;
  end render_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function ajax_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin
  ) return apex_plugin.t_page_item_ajax_result
  as
    l_tmp         varchar2(255);
    l_msg         varchar2(256);
    l_answer_item varchar2(30);
    l_min_1       pls_integer := 1;
    l_max_1       pls_integer := 1;
    l_min_2       pls_integer := 1;
    l_max_2       pls_integer := 1;
    l_arr         apex_application_global.vc_arr2;
    l_result      apex_plugin.t_page_item_ajax_result;
  begin
    l_answer_item := p_item.attribute_01;
    l_min_1       := p_item.attribute_02;
    l_max_1       := p_item.attribute_03;
    l_min_2       := p_item.attribute_04;
    l_max_2       := p_item.attribute_05;
    l_msg         := p_item.attribute_06;
    l_arr(1)      := round(sys.dbms_random.value(l_min_1, l_max_1));
    l_arr(1)      := round(sys.dbms_random.value(l_min_2, l_max_2));
    for n in 1 .. 2
    loop
      l_arr(n) := round(sys.dbms_random.value(1, 40));
      for i in 1 .. length(l_arr(n))
      loop
        l_tmp := l_tmp || '&#' || ascii(substr(l_arr(n), i, 1));
      end loop;
      if n = 1 then
        l_tmp := l_tmp || '&nbsp;&#' || ascii('+') || '&nbsp;';
      end if;
    end loop;
    -- Write header for the output.
    sys.owa_util.mime_header('text/html', false);
    sys.htp.p('Cache-Control: no-cache');
    sys.htp.p('Pragma: no-cache');
    --sys.htp.p('X-Robots-Tag    noindex,follow');
    sys.owa_util.http_header_close;
    sys.htp.p(l_tmp || '&nbsp;&#' || ascii('=') || '&nbsp;');
    /* set correct answer to item session state */
    apex_util.set_session_state(l_answer_item, to_number(l_arr(1)) + to_number(l_arr(2)));
    return l_result;
  exception when others
  then
    sys.htp.prn(wwv_flow_lang.system_message('ajax_server_error'));
    return l_result;
  end ajax_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin,
    p_value  in varchar2
  ) return apex_plugin.t_page_item_validation_result
  as
    l_answer_item varchar2(30);
    l_msg         varchar2(256);
    l_value       simple_integer := 0;
    l_answer      simple_integer := 0;
    l_is_valid    boolean;
    l_result      apex_plugin.t_page_item_validation_result;
  begin
    l_answer_item := p_item.attribute_01;
    l_msg         := p_item.attribute_07;
    if p_value is null then
      return null;
    end if;
    begin
      l_is_valid := to_number(p_value) = nv(l_answer_item);
    exception when 
    value_error or 
    invalid_number
    then
      l_is_valid := false;
    end;
    if not l_is_valid then
      l_result.message := apex_lang.message(l_msg, p_item.plain_label);
    end if;
    return l_result;
  end validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function render_google_plus_one_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');

    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_plus varchar2(20)    := coalesce(p_item.attribute_01, 'current_page');
    l_page_url    varchar2(4000)  := p_item.attribute_02;
    l_custom_url  varchar2(4000)  := p_item.attribute_03;
    l_size        varchar2(20)    := coalesce(p_item.attribute_04, 'standard');
    l_annotation  varchar2(20)    := coalesce(p_item.attribute_05, 'bubble');
    l_width       varchar2(256)   := p_item.attribute_06;
    l_align       varchar2(20)    := coalesce(p_item.attribute_07, 'left');
    l_expandto    varchar2(100)   := p_item.attribute_08;
    l_url         varchar2(4000);
    l_result      apex_plugin.t_page_item_render_result;
  begin
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        return null;
    end if;

    -- Generate the Google +1 URL based on our URL setting.
    -- Note: Always use session 0, otherwise Google +1 will always register a different URL.
    l_url := case l_url_to_plus
               when 'current_page' then c_host || 'f?p=' || apex_application.g_flow_id || ':' || apex_application.g_flow_step_id || ':0'
               when 'page_url'     then c_host || l_page_url
               when 'custom_url'   then replace( l_custom_url, '#HOST#', c_host )
               when 'value'        then replace( p_value, '#HOST#', c_host )
             end;
    -- Output the Google +1 button widget
    -- See https://developers.google.com/+/web/+1button/ for syntax
    sys.htp.prn (
      ''
      || '<div class="g-plusone"'
      || case when l_url_to_plus != 'current_url'
          then ' data-href="' || apex_escape.html_attribute(l_url) || '"' end
      || ' data-size="' || apex_escape.html_attribute(l_size) || '"'
      || ' data-annotation="' || apex_escape.html_attribute(l_annotation) || '"'
      || case when l_annotation = 'inline' then
          ' data-width="' || apex_escape.html_attribute(l_annotation) || '"'
         end
      || ' data-align="' || apex_escape.html_attribute(l_align) || '"'
      || ' data-expandTo="' || apex_escape.html_attribute(replace(l_expandto, ':', ',')) || '"'
      || '></div>'
    );
    apex_javascript.add_library(
      p_name      => 'platform',
      p_directory => 'https://apis.google.com/js/',
      p_key       => 'com.google.apis.platform'
    );
    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;
    return l_result;
  end render_google_plus_one_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function render_google_share_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');

    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_share  varchar2(20)    := coalesce(p_item.attribute_01, 'current_page');
    l_page_url      varchar2(4000)  := p_item.attribute_02;
    l_custom_url    varchar2(4000)  := p_item.attribute_03;
    l_annotation    varchar2(20)    := coalesce(p_item.attribute_04, 'bubble');
    l_width         varchar2(256)   := p_item.attribute_05;
    l_height        varchar2(256)   := coalesce(p_item.attribute_06, '20');
    l_align         varchar2(20)    := coalesce(p_item.attribute_07, 'left');
    l_expandto      varchar2(100)   := replace(p_item.attribute_08, ':', ',');

    l_url             varchar2(4000);
    l_result          apex_plugin.t_page_item_render_result;
  begin
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        return null;
    end if;

    -- Generate the Google Share based on our URL setting.
    -- Note: Always use session 0, otherwise Google Share will always register a different URL.
    l_url := case l_url_to_share
               when 'current_page' then c_host || 'f?p=' || apex_application.g_flow_id || ':' || apex_application.g_flow_step_id || ':0'
               when 'page_url'     then c_host || l_page_url
               when 'custom_url'   then replace(l_custom_url, '#HOST#', c_host)
               when 'value'        then replace(p_value, '#HOST#', c_host)
             end;
    -- Output the Google Share button widget
    -- See https://developers.google.com/+/web/share/ for syntax
    sys.htp.prn (
      ''
      || '<div class="g-plus" data-action="share"'
      || case when l_url_to_share != 'current_url'
      then 
         ' data-href="'       || apex_escape.html_attribute(l_url)        || '"'
      end
      || ' data-annotation="' || apex_escape.html_attribute(l_annotation) || '"'
      || ' data-width="'      || apex_escape.html_attribute(l_width)      || '"'
      || ' data-height="'     || apex_escape.html_attribute(l_height)     || '"'
      || ' data-align="'      || apex_escape.html_attribute(l_align)      || '"'
      || case when l_expandto is not null 
      then 
         ' data-expandTo="'   || apex_escape.html_attribute(l_expandto)   || '"'
      end
      || '>'
      || '</div>'
    );

    apex_javascript.add_library(
      p_name      => 'platform',
      p_directory => 'https://apis.google.com/js/',
      p_key       => 'com.google.apis.platform'
    );

    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;
    return l_result;
  end render_google_share_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--==============================================================================
-- Renders the Facebook "Like" button widget based on the configuration of the
-- page item.
--==============================================================================
  function render_facebook_like_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');

    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_like  varchar2(20)   := nvl(p_item.attribute_01, 'current_page');
    l_page_url     varchar2(4000) := p_item.attribute_02;
    l_custom_url   varchar2(4000) := p_item.attribute_03;
    l_layout_style varchar2(15)   := nvl(p_item.attribute_04, 'standard');
    l_show_faces   boolean        := (nvl(p_item.attribute_05, 'Y') = 'Y');
    l_width        number         := p_item.attribute_06;
    l_verb         varchar2(15)   := nvl(p_item.attribute_07, 'like');
    l_font         varchar2(15)   := p_item.attribute_08;
    l_color_scheme varchar2(15)   := nvl(p_item.attribute_09, 'light');

    l_url          varchar2(4000);
    l_height       number;
    l_result       apex_plugin.t_page_item_render_result;
  begin
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        return null;
    end if;

    -- Get the width and the height depending on the picked layout style
    if l_width is null then
        l_width := case l_layout_style
                     when 'standard'     then 450
                     when 'button_count' then 90
                     when 'box_count'    then 55
                   end;
    end if;

    l_height := case l_layout_style
                  when 'standard'     then case when l_show_faces then 80 else 35 end
                  when 'button_count' then 20
                  when 'box_count'    then 65
                end;
    -- Base URL for the "Like" widget.
    -- See http://developers.facebook.com/docs/reference/plugins/like
    -- for a documentation of the URL syntax
    l_url := 'https://www.facebook.com/plugins/like.php?href=';

    -- Generate the "Like" URL based on our URL to Like setting.
    -- Note: Always use session 0, otherwise Facebook will not be able to get the page.
    l_url := l_url||
             utl_url.escape (
                 url => case l_url_to_like
                          when 'current_page' then c_host||'f?p='||apex_application.g_flow_id||':'||apex_application.g_flow_step_id||':0'
                          when 'page_url'     then c_host||l_page_url
                          when 'custom_url'   then replace(l_custom_url, '#HOST#', c_host)
                          when 'value'        then replace(p_value, '#HOST#', c_host)
                        end,
                 escape_reserved_chars => true)||
             '&amp;';
    -- Add the display options for the "Like" button widget
    l_url := l_url||
             'layout='||l_layout_style||'&amp;'||
             case when l_layout_style = 'standard' then
                 'show_faces='||case when l_show_faces then 'true' else 'false' end||'&amp;'
             end||
             'width='||l_width||'&amp;'||
             'action='||l_verb||'&amp;'||
             case when l_font is not null then 'font='||l_font||'&amp;' end||
             'colorscheme='||l_color_scheme||'&amp;'||
             'height='||l_height;
    -- Output the Facebook Like button widget
    sys.htp.prn(
      '<iframe src="' || l_url || '" '
      || 'scrolling="no" frameborder="0" '
      || 'style="border:none; overflow:hidden; width:' || l_width || 'px; height:' || l_height || 'px;" '
      || 'allowTransparency="true"></iframe>'
    );
    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;
    return l_result;
  end render_facebook_like_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--==============================================================================
-- Renders the Twitter button widget based on the configuration of the
-- page item.
--==============================================================================
  function render_twitter_button (
    p_item                in apex_plugin.t_page_item,
    p_plugin              in apex_plugin.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean
  ) return apex_plugin.t_page_item_render_result
  as
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');

    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_like     varchar2(20)   := nvl(p_item.attribute_01, 'current_page');
    l_page_url        varchar2(4000) := p_item.attribute_02;
    l_custom_url      varchar2(4000) := p_item.attribute_03;
    l_layout_style    varchar2(15)   := nvl(p_item.attribute_04, 'vertical');
    l_tweet_text_type varchar2(10)   := nvl(p_item.attribute_05, 'page_title');
    l_custom_text     varchar2(140)  := sys.htf.escape_sc(p_item.attribute_06);
    l_follow1         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_07);
    l_follow2         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_08);

    l_url             varchar2(4000);
    l_result          apex_plugin.t_page_item_render_result;
  begin
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        return null;
    end if;

    -- Generate the Tweet URL based on our URL setting.
    -- Note: Always use session 0, otherwise Twitter will always register a different URL.
    l_url := case l_url_to_like
               when 'current_page' then c_host||'f?p='||apex_application.g_flow_id||':'||apex_application.g_flow_step_id||':0'
               when 'page_url'     then c_host||l_page_url
               when 'custom_url'   then replace(l_custom_url, '#HOST#', c_host)
               when 'value'        then replace(p_value, '#HOST#', c_host)
             end;
    -- For a custom text we have to replace the #PAGE_TITLE# placeholder with the correct
    -- language dependent page title of the current page.
    if l_tweet_text_type = 'custom' then
        if instr(l_custom_text, '#PAGE_TITLE') > 0 then
            select replace(l_custom_text, '#PAGE_TITLE#', apex_application.do_substitutions(page_title, 'ESC'))
              into l_custom_text
              from apex_application_pages
             where application_id = nvl(apex_application.g_translated_flow_id, apex_application.g_flow_id)
               and page_id        = nvl(apex_application.g_translated_page_id, apex_application.g_flow_step_id);
        end if;
    end if;
    -- Output the Twitter button widget
    -- See http://twitter.com/about/resources/tweetbutton for syntax
    sys.htp.prn (
      '<a href="https://twitter.com/share" class="twitter-share-button"'
      || case when l_url_to_like != 'current_url'
          then ' data-url="' || sys.htf.escape_sc(l_url) || '"' end
      || case when l_tweet_text_type = 'custom'
            then ' data-text="' || l_custom_text || '"' end
      || case when l_follow1 is not null
          then ' data-via="' || l_follow1 || '"' end
      || case when l_follow2 is not null
          then ' data-related="' || l_follow2 || '"' end
      || ' data-count="' || l_layout_style || '"'
      || '></a>'
    );
    apex_javascript.add_library(
      p_name      => 'widgets',
      p_directory => 'https://platform.twitter.com/',
      p_key       => 'com.twitter.platform.widgets'
    );
    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;
    return l_result;
  end render_twitter_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
