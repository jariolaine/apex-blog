set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040000 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,697160412873685139));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2010.05.13');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,654321);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/item_type/com_oracle_apex_facebook_like_button
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.ORACLE.APEX.FACEBOOK_LIKE_BUTTON'
 ,p_display_name => 'Facebook Like Button'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'--==============================================================================='||chr(10)||
'-- Renders the Facebook "Like" button widget based on the configuration of the'||chr(10)||
'-- page item.'||chr(10)||
'--==============================================================================='||chr(10)||
'function render_facebook_like_button ('||chr(10)||
'    p_item                in apex_plugin.t_page_item,'||chr(10)||
'    p_plugin              in apex_plugin.t_plugin,'||
''||chr(10)||
'    p_value               in varchar2,'||chr(10)||
'    p_is_readonly         in boolean,'||chr(10)||
'    p_is_printer_friendly in boolean )'||chr(10)||
'    return apex_plugin.t_page_item_render_result'||chr(10)||
'is'||chr(10)||
'    c_host constant varchar2(4000) := wwv_flow_utilities.host_url(''SCRIPT'');'||chr(10)||
'    '||chr(10)||
'    -- It''s better to have named variables instead of using the generic ones,'||chr(10)||
'    -- makes the code more readable.'||chr(10)||
'    -- We are using the same defau'||
'lts for the required attributes as in the'||chr(10)||
'    -- plug-in attribute configuration, because they can still be null.'||chr(10)||
'    -- Note: Keep them in sync!'||chr(10)||
'    l_url_to_like  varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');'||chr(10)||
'    l_page_url     varchar2(4000) := p_item.attribute_02;'||chr(10)||
'    l_custom_url   varchar2(4000) := p_item.attribute_03;'||chr(10)||
'    l_layout_style varchar2(15)   := nvl(p_item.attribute_0'||
'4, ''standard'');'||chr(10)||
'    l_show_faces   boolean        := (nvl(p_item.attribute_05, ''Y'') = ''Y'');'||chr(10)||
'    l_width        number         := p_item.attribute_06;'||chr(10)||
'    l_verb         varchar2(15)   := nvl(p_item.attribute_07, ''like'');'||chr(10)||
'    l_font         varchar2(15)   := p_item.attribute_08;'||chr(10)||
'    l_color_scheme varchar2(15)   := nvl(p_item.attribute_09, ''light'');'||chr(10)||
''||chr(10)||
'    l_url          varchar2(4000);'||chr(10)||
'    l_height '||
'      number;'||chr(10)||
'    l_result       apex_plugin.t_page_item_render_result;'||chr(10)||
'begin'||chr(10)||
'    -- Don''t show the widget if we are running in printer friendly mode'||chr(10)||
'    if p_is_printer_friendly then'||chr(10)||
'        return null;'||chr(10)||
'    end if;'||chr(10)||
'    '||chr(10)||
'    -- Get the width and the height depending on the picked layout style'||chr(10)||
'    if l_width is null then'||chr(10)||
'        l_width := case l_layout_style'||chr(10)||
'                     when ''standard''  '||
'   then 450'||chr(10)||
'                     when ''button_count'' then 90'||chr(10)||
'                     when ''box_count''    then 55'||chr(10)||
'                   end;'||chr(10)||
'    end if;'||chr(10)||
'    '||chr(10)||
'    l_height := case l_layout_style'||chr(10)||
'                  when ''standard''     then case when l_show_faces then 80 else 35 end'||chr(10)||
'                  when ''button_count'' then 20'||chr(10)||
'                  when ''box_count''    then 65'||chr(10)||
'                end;'||chr(10)||
''||chr(10)||
'    -- Base U'||
'RL for the "Like" widget.'||chr(10)||
'    -- See http://developers.facebook.com/docs/reference/plugins/like'||chr(10)||
'    -- for a documentation of the URL syntax'||chr(10)||
'    l_url := ''http://www.facebook.com/plugins/like.php?href='';'||chr(10)||
'    '||chr(10)||
'    -- Generate the "Like" URL based on our URL to Like setting.'||chr(10)||
'    -- Note: Always use session 0, otherwise Facebook will not be able to get the page.'||chr(10)||
'    l_url := l_url||'||chr(10)||
'             utl_'||
'url.escape ('||chr(10)||
'                 url => case l_url_to_like'||chr(10)||
'                          when ''current_page'' then c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0'''||chr(10)||
'                          when ''page_url''     then c_host||l_page_url'||chr(10)||
'                          when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)'||chr(10)||
'                          when ''value''       '||
' then replace(p_value, ''#HOST#'', c_host)'||chr(10)||
'                        end,'||chr(10)||
'                 escape_reserved_chars => true)||'||chr(10)||
'             ''&amp;'';'||chr(10)||
''||chr(10)||
'    -- Add the display options for the "Like" button widget'||chr(10)||
'    l_url := l_url||'||chr(10)||
'             ''layout=''||l_layout_style||''&amp;''||'||chr(10)||
'             case when l_layout_style = ''standard'' then'||chr(10)||
'                 ''show_faces=''||case when l_show_faces then ''true'' els'||
'e ''false'' end||''&amp;'''||chr(10)||
'             end||'||chr(10)||
'             ''width=''||l_width||''&amp;''||'||chr(10)||
'             ''action=''||l_verb||''&amp;''||'||chr(10)||
'             case when l_font is not null then ''font=''||l_font||''&amp;'' end||'||chr(10)||
'             ''colorscheme=''||l_color_scheme||''&amp;''||'||chr(10)||
'             ''height=''||l_height;'||chr(10)||
''||chr(10)||
'    -- Output the Facebook Like button widget'||chr(10)||
'    sys.htp.prn(''<iframe src="''||l_url||''" scrolling="no" fr'||
'ameborder="0" style="border:none; overflow:hidden; width:''||l_width||''px; height:''||l_height||''px;" allowTransparency="true"></iframe>'');'||chr(10)||
''||chr(10)||
'    -- Tell APEX that this field is NOT navigable'||chr(10)||
'    l_result.is_navigable := false;'||chr(10)||
''||chr(10)||
'    return l_result;'||chr(10)||
'end render_facebook_like_button;'
 ,p_render_function => 'render_facebook_like_button'
 ,p_standard_attributes => 'VISIBLE:SOURCE:ELEMENT'
 ,p_help_text => '<p>'||chr(10)||
'	Facebook &quot;Like&quot; button widget based on the definition at <a href="http://developers.facebook.com/docs/reference/plugins/like">http://developers.facebook.com/docs/reference/plugins/like</a></p>'||chr(10)||
''
 ,p_version_identifier => '1.1'
 ,p_about_url => 'http://apex.oracle.com/plugins'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'URL to Like'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'current_page'
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175924045974513668 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 5
 ,p_display_value => 'Current Page'
 ,p_return_value => 'current_page'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175900629502969686 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Page URL'
 ,p_return_value => 'page_url'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175901032965970677 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom URL'
 ,p_return_value => 'custom_url'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175930649952827063 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Value of Page Item'
 ,p_return_value => 'value'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175928746817674815 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Page URL'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'f?p=&APP_ID.:&APP_PAGE_ID.:0::::PAGE_ITEM:&PAGE_ITEM.'
 ,p_display_length => 50
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'page_url'
 ,p_help_text => '<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.</p>'||chr(10)||
''||chr(10)||
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise Facebook will not be able to retrieve the page.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175918944861257914 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Custom URL'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'http://'
 ,p_display_length => 50
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 6175900052096957298 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'custom_url'
 ,p_help_text => 'Enter the URL which should be liked.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175901738984981874 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Layout Style'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'standard'
 ,p_is_translatable => false
 ,p_help_text => 'Determines the size and amount of social context next to the Like button.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175902343486983183 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175901738984981874 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Standard'
 ,p_return_value => 'standard'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175902749026984824 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175901738984981874 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Button Count'
 ,p_return_value => 'button_count'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175903153182985959 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175901738984981874 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Box Count'
 ,p_return_value => 'box_count'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175904444309992858 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Show Faces'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 6175901738984981874 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'standard'
 ,p_help_text => 'Show profile pictures below the Like button.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175905047558003252 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Width'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => false
 ,p_display_length => 4
 ,p_is_translatable => false
 ,p_help_text => 'Enter the width of the Facebook Like button widget. If not entered the following defaults will be used depending on the selected Layout Style:'||chr(10)||
'<ul>'||chr(10)||
'  <li><strong>Standard:</strong> 450</li>'||chr(10)||
'  <li><strong>Button Count:</strong> 90</li>'||chr(10)||
'  <li><strong>Box Count:</strong> 55</li>'||chr(10)||
'</ul>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175905553791005132 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Verb to Display'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'like'
 ,p_is_translatable => false
 ,p_help_text => 'The verb to display in the Like button.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175906157254006100 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175905553791005132 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Like'
 ,p_return_value => 'like'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175906560371006968 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175905553791005132 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Recommend'
 ,p_return_value => 'recommend'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Font'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => 'Specify the font used by the widget.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175907859810016242 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Arial'
 ,p_return_value => 'arial'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175908232583017891 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Lucida Grande'
 ,p_return_value => 'lucida grande'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175908637777019375 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Segoe UI'
 ,p_return_value => 'segoe ui'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175909044011021140 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 40
 ,p_display_value => 'Tahoma'
 ,p_return_value => 'tahoma'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175909450937023218 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 50
 ,p_display_value => 'Trebuchet MS'
 ,p_return_value => 'trebuchet ms'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175909958209025253 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175907254269014663 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 60
 ,p_display_value => 'Verdana'
 ,p_return_value => 'verdana'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 6175910243103030333 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 6175899832011951458 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => 'Color Scheme'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'light'
 ,p_is_translatable => false
 ,p_help_text => 'Specify the color scheme used by the widget.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175910845873031182 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175910243103030333 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Light'
 ,p_return_value => 'light'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 6175911248990032077 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 6175910243103030333 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Dark'
 ,p_return_value => 'dark'
  );
null;
 
end;
/

commit;
begin 
execute immediate 'begin dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
prompt  ...done
