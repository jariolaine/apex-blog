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
--
--------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
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
        || case when p_item.element_width is not null 
            then'size="' || p_item.element_width ||'" '
           end
        || case when p_item.element_max_length  is not null
            then 'maxlength="' || p_item.element_max_length || '" '
           end
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
--        || '$(".z-question").html(data);'
        || '$(data).insertBefore($("#' || p_item.name || '_LABEL").children());'
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
    l_data         varchar2(4000);
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
        l_data := l_data || '&#' || ascii(substr(l_tab(n), i, 1));
      end loop;
      if n = 1 then
        l_data := l_data || '&nbsp;&#' || ascii('+') || '&nbsp;';
      end if;

    end loop;

    -- Write header for the output
    sys.owa_util.mime_header('text/plain', false);
    sys.htp.p('Cache-Control: no-cache');
    sys.htp.p('Pragma: no-cache');
    sys.owa_util.http_header_close;
    -- Write output
    sys.htp.prn('<span class="z-question">' || l_data || '?</span>');
    -- set correct answer to item session state

  exception when others
  then
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
        -- Check if answer correct
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

    end if;

  end validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
