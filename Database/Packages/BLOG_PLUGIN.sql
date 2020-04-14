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
  procedure render_formatting_buttons(
    p_item    in apex_plugin.t_item,
    p_plugin  in apex_plugin.t_plugin,
    p_param   in apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  );
-------------------------------------------------------------------------------
  procedure render_comment_textarea(
    p_item    in apex_plugin.t_item,
    p_plugin  in apex_plugin.t_plugin,
    p_param   in apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  );
-------------------------------------------------------------------------------
  procedure validate_comment_textarea(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_validation_param,
    p_result  in out nocopy apex_plugin.t_item_validation_result 
  );
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item    in apex_plugin.t_item,
    p_plugin  in apex_plugin.t_plugin,
    p_param   in apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  );
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_ajax_param,
    p_result  in out nocopy apex_plugin.t_item_ajax_result
  );
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_validation_param,
    p_result  in out nocopy apex_plugin.t_item_validation_result 
  );
--------------------------------------------------------------------------------
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
    c_syntaxhighlight_open  constant varchar2(80) := '<pre class="z-program-code">';
    c_syntaxhighlight_close constant varchar2(80) := '</pre>';
  begin
  
    l_len_s := length(c_code_open);
    l_len_e := length(c_code_close);
    
    -- Change all hash marks so we can escape those later
    l_comment := replace(p_comment, '#', '$##$');
    
    -- escape comment html
    l_comment := apex_escape.html_whitelist (
       p_html            => l_comment
      ,p_whitelist_tags  => p_whitelist_tags
    );
    
    -- Escape hash to e.g. prevent APEX substitutions
    l_comment := replace(l_comment, '$##$', '&#x23;');
    
    --- check code tag count
    l_count_open  := regexp_count(l_comment, c_code_open);
    l_count_close := regexp_count(l_comment, c_code_close);
    
    -- Process code tags
    if l_count_open = l_count_close then
      
      -- Store text inside code tags to array while format rest of message
      for i in 1 .. l_count_open
      loop
        l_start       := instr(l_comment, c_code_open);
        l_end         := instr(l_comment, c_code_close);
        
        l_code_arr(i) := c_syntaxhighlight_open
                      || substr(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)
                      || c_syntaxhighlight_close;
        
        l_comment     := substr(l_comment, 1, l_start -1)
                      || chr(10)
                      || '#CODE_' || i || '#'
                      || chr(10)
                      || substr(l_comment, l_end + l_len_e);
      end loop;
      
      -- Format message
      l_comment := trim(both chr(10) from l_comment);
      l_comment_arr := apex_util.string_to_table(l_comment, chr(10));
      l_comment := '<pre>';
      
      for i in 1 .. l_comment_arr.count
      loop
        
        l_temp := trim(l_comment_arr(i));
        
        -- do not add extra tags for code
        if regexp_like(l_temp, '^\CODE#\_[0-9]+\#') then
          l_comment := l_comment || '</pre>' || chr(10) || l_temp || chr(10) || '<pre>';
        else
          l_comment := l_comment || trim(l_temp) || chr(10);
        end if;
        
      end loop;
      
      l_comment := replace(l_comment || '</pre>', '<pre></pre>');
      l_comment := trim(both chr(10) from l_comment);
      
      -- insert code tags back to comment
      for i in 1 .. l_code_arr.count
      loop
        l_comment := replace(l_comment, '#CODE_' || i || '#', l_code_arr(i));
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

    if not p_param.is_readonly and not p_param.is_printer_friendly then
      
      l_item_name := p_item.attribute_01;

      l_code      := apex_lang.lang('Code');
      l_bold      := apex_lang.lang('Bold');
      l_italics   := apex_lang.lang('Italics');
      l_underline := apex_lang.lang('Underline');
  
      sys.htp.p('<div tabindex="-1" role="group" ' 
        || apex_plugin_util.get_element_attributes(p_item)
        || '>'
      );
      sys.htp.p(
        '<button type="button" tabindex="-1" '
        || q'[onclick="blog.plugin.wrapSelection('b',']' || l_item_name || q'[');" ]'
        || 'title="' || l_bold  || '" '
        || 'aria-label="' || l_bold  || '" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-bold"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" tabindex="-1" '
        || q'[onclick="blog.plugin.wrapSelection('i',']' || l_item_name || q'[');" ]'
        || 'title="' || l_italics ||'" '
        || 'aria-label="' || l_italics ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-italic"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" tabindex="-1" '
        || q'[onclick="blog.plugin.wrapSelection('u',']' || l_item_name || q'[');" ]'
        || 'title="' || l_underline ||'" '
        || 'aria-label="' || l_underline ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-underline"></span>'
        || '</button>'
      );
      sys.htp.p(
        '<button type="button" tabindex="-1" '
        || q'[onclick="blog.plugin.wrapSelection('code',']' || l_item_name || q'[');" ]'
        || 'title="' || l_code ||'" '
        || 'aria-label="' || l_code ||'" '
        || 'class="t-Button t-Button--noLabel t-Button--icon t-Button--small">'
        || '<span aria-hidden="true" class="t-Icon fa fa-code"></span>'
        || '</button>'
      );
      sys.htp.p('</div>');
      
      --p_result.navigable_dom_id := l_item_name;
      
    end if;
    
  end render_formatting_buttons;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_comment_textarea(
    p_item in apex_plugin.t_item,
    p_plugin in apex_plugin.t_plugin,
    p_param in apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
  )
  as
    l_name varchar2(256);
  begin
    
    if p_param.is_readonly or p_param.is_printer_friendly then
      -- emit hidden textarea if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_param.value,
        p_is_readonly => p_param.is_readonly,
        p_is_printer_friendly => p_param.is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_param.value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    else
      -- Because the page item saves state, we have to call get_input_name_for_page_item
      -- which generates the internal hidden p_arg_names textarea. It will also RETURN the
      -- HTML textarea name which we have to use when we render the HTML input textarea.
      l_name := apex_plugin.get_input_name_for_page_item(false);

      sys.htp.prn('<textarea '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'textarea apex-item-textarea')
        || 'cols="' || p_item.element_width ||'" '
        || 'rows="' || p_item.element_height ||'" '
        || 'maxlength="' || p_item.element_max_length || '">'
      );
      apex_plugin_util.print_escaped_value(p_param.value);
      sys.htp.p('</textarea>');
      
      -- Tell APEX that this textarea is navigable
      p_result.is_navigable := true;
    end if;

  end render_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure validate_comment_textarea(
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result 
  )
  as
    l_value_item      varchar2(32700);
    l_comment_temp    varchar2(32700);
    l_comment_html    xmltype;
    c_whitelist_tags  constant varchar2(200)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  begin
    
    l_value_item := p_item.attribute_01;
    
    -- get item value
    l_comment_temp := p_param.value;
    
    -- Remove unwanted ascii codes
    for i in 0 .. 31
    loop
      if i != 10 then
        l_comment_temp := trim( replace( l_comment_temp, chr(i) ) );
      end if;
    end loop;
    
    -- validate item value length
    if length(l_comment_temp) > p_item.element_max_length then

      p_result.message := apex_lang.message(
         p_name => p_plugin.attribute_01
        ,p0 => p_item.plain_label
        ,p1 => p_item.element_max_length
      );
      
      if p_result.message = apex_escape.html(p_plugin.attribute_01) then
        p_result.message := p_plugin.attribute_01;
      end if;

    end if;
    
    if p_result.message is null then

      l_comment_temp := blog_plugin.format_comment(
         p_comment => l_comment_temp
        ,p_whitelist_tags => c_whitelist_tags
      );
      
      -- Validate value html tags
      begin
        l_comment_html := xmltype.createxml(
            '<root><row>' 
          || l_comment_temp
          || '</row></root>'
        );
      exception when others then
      
        apex_debug.warn('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
        
        p_result.message := apex_lang.message(
          p_name => p_plugin.attribute_02
          ,p0 => p_item.plain_label
        );
        
        if p_result.message = apex_escape.html(p_plugin.attribute_02) then
          p_result.message := p_plugin.attribute_02;
        end if;
        
      end;
      
    end if;

    if p_result.message is null then
      apex_util.set_session_state( l_value_item, l_comment_temp, false );
    end if;

  end validate_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item in apex_plugin.t_item,
    p_plugin in apex_plugin.t_plugin,
    p_param in apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
  )
  as
    l_name varchar2(30);
  begin
    
    l_name := apex_plugin.get_input_name_for_page_item(false);

    if p_param.is_readonly or p_param.is_printer_friendly then
    
      -- emit hidden text field if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_param.value,
        p_is_readonly => p_param.is_readonly,
        p_is_printer_friendly => p_param.is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_param.value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    else

      sys.htp.p('<input type="text" '
        || 'size="' || p_item.element_width ||'" '
        || 'maxlength="' || p_item.element_max_length || '" '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'text_field apex-item-text')
        || 'value="" />'
      );
      sys.htp.p('<span class="apex-item-icon '
        || p_item.icon_css_classes
        || '" aria-hidden="true"></span>'
      );
      
      apex_javascript.add_onload_code (
        p_code => 'apex.server.plugin("' || apex_plugin.get_ajax_identifier || '",{},{'
        || 'dataType:"text",'
        || 'success:function(data){'
        || '$(".z-question").html(data);'
        || '}});'
      );
      -- Tell APEX that this textarea is navigable
      p_result.is_navigable := true;

    end if;
        
  end render_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_ajax_param,
    p_result in out nocopy apex_plugin.t_item_ajax_result
  )
  as
    l_tmp         varchar2(4000);
    l_value_item  varchar2(4000);
    l_min_1       pls_integer := 1;
    l_max_1       pls_integer := 1;
    l_min_2       pls_integer := 1;
    l_max_2       pls_integer := 1;
    l_tab         apex_t_number;
  begin
  
    l_min_1       := p_item.attribute_01;
    l_max_1       := p_item.attribute_02;
    l_min_2       := p_item.attribute_03;
    l_max_2       := p_item.attribute_04;
    l_value_item  := p_item.attribute_05;
    
    apex_string.push(l_tab, round(sys.dbms_random.value(l_min_1, l_max_1)));
    apex_string.push(l_tab, round(sys.dbms_random.value(l_min_2, l_max_2)));
    
    apex_util.set_session_state( l_value_item, to_number(l_tab(1)) + to_number(l_tab(2)), false);
    
    -- change question to HTML entities
    for n in 1 .. 2
    loop
      
      for i in 1 .. length(l_tab(n))
      loop
        l_tmp := l_tmp || '&#' || ascii(substr(l_tab(n), i, 1));
      end loop;
      if n = 1 then
        l_tmp := l_tmp || '&nbsp;&#' || ascii('+') || '&nbsp;';
      end if;
      
    end loop;

    -- Write header for the output
    sys.owa_util.mime_header('text/plain', false);
    sys.htp.p('Cache-Control: no-cache');
    sys.htp.p('Pragma: no-cache');
    sys.owa_util.http_header_close;
    -- Write output
    sys.htp.prn(l_tmp);
    -- set correct answer to item session state
    
  exception when others
  then
    apex_debug.warn('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
    sys.htp.prn(p_plugin.attribute_02);
    
  end ajax_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result 
  )
  as
    l_answer  number;
    l_value   number;
    l_result  boolean;
  begin
    
    if p_param.value is not null then
    
      begin
    
        l_value   := nv(p_item.attribute_05);
        l_answer  := to_number(p_param.value);
        l_result  := case when l_value = l_answer then true else false end;
        
      exception when others
      then
        l_result := false;
      end;
      
    else
      l_result := false;
    end if;
    
    if not l_result then  
    
      p_result.message := apex_lang.message(
        p_name => p_plugin.attribute_01
        ,p0 => p_item.plain_label
      );
    
      if p_result.message = apex_escape.html(p_plugin.attribute_01) then
        p_result.message := p_plugin.attribute_01;
      end if;
      
      apex_debug.warn('Incorrect answer was %s', p_param.value);
      apex_debug.warn('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
      
    end if;

  end validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
