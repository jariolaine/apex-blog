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
--application/shared_components/plugins/item_type/com_oracle_apex_twitter_button
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.ORACLE.APEX.TWITTER_BUTTON'
 ,p_display_name => 'Twitter Button'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'--==============================================================================='||chr(10)||
'-- Renders the Twitter button widget based on the configuration of the'||chr(10)||
'-- page item.'||chr(10)||
'--==============================================================================='||chr(10)||
'function render_twitter_button ('||chr(10)||
'    p_item                in apex_plugin.t_page_item,'||chr(10)||
'    p_plugin              in apex_plugin.t_plugin,'||chr(10)||
'    p_value  '||
'             in varchar2,'||chr(10)||
'    p_is_readonly         in boolean,'||chr(10)||
'    p_is_printer_friendly in boolean )'||chr(10)||
'    return apex_plugin.t_page_item_render_result'||chr(10)||
'is'||chr(10)||
'    c_host constant varchar2(4000) := wwv_flow_utilities.host_url(''SCRIPT'');'||chr(10)||
'    '||chr(10)||
'    -- It''s better to have named variables instead of using the generic ones,'||chr(10)||
'    -- makes the code more readable.'||chr(10)||
'    -- We are using the same defaults for the re'||
'quired attributes as in the'||chr(10)||
'    -- plug-in attribute configuration, because they can still be null.'||chr(10)||
'    -- Note: Keep them in sync!'||chr(10)||
'    l_url_to_like     varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');'||chr(10)||
'    l_page_url        varchar2(4000) := p_item.attribute_02;'||chr(10)||
'    l_custom_url      varchar2(4000) := p_item.attribute_03;'||chr(10)||
'    l_layout_style    varchar2(15)   := nvl(p_item.attribute_04,'||
' ''vertical'');'||chr(10)||
'    l_tweet_text_type varchar2(10)   := nvl(p_item.attribute_05, ''page_title'');'||chr(10)||
'    l_custom_text     varchar2(140)  := sys.htf.escape_sc(p_item.attribute_06);'||chr(10)||
'    l_follow1         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_07);'||chr(10)||
'    l_follow2         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_08);'||chr(10)||
''||chr(10)||
'    l_url             varchar2(4000);'||chr(10)||
'    l_result          apex_'||
'plugin.t_page_item_render_result;'||chr(10)||
'begin'||chr(10)||
'    -- Don''t show the widget if we are running in printer friendly mode'||chr(10)||
'    if p_is_printer_friendly then'||chr(10)||
'        return null;'||chr(10)||
'    end if;'||chr(10)||
'    '||chr(10)||
'    -- Generate the Tweet URL based on our URL setting.'||chr(10)||
'    -- Note: Always use session 0, otherwise Twitter will always register a different URL.'||chr(10)||
'    l_url := case l_url_to_like'||chr(10)||
'               when ''current_page'' th'||
'en c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0'''||chr(10)||
'               when ''page_url''     then c_host||l_page_url'||chr(10)||
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)'||chr(10)||
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)'||chr(10)||
'             end;'||chr(10)||
''||chr(10)||
'    -- For a custom text we have to replace the #PAGE_TITLE# placeholder with'||
' the correct'||chr(10)||
'    -- language dependent page title of the current page.'||chr(10)||
'    if l_tweet_text_type = ''custom'' then'||chr(10)||
'        if instr(l_custom_text, ''#PAGE_TITLE'') > 0 then'||chr(10)||
'            select replace(l_custom_text, ''#PAGE_TITLE#'', apex_application.do_substitutions(page_title, ''ESC''))'||chr(10)||
'              into l_custom_text'||chr(10)||
'              from apex_application_pages'||chr(10)||
'             where application_id = nvl(apex_'||
'application.g_translated_flow_id, apex_application.g_flow_id)'||chr(10)||
'               and page_id        = nvl(apex_application.g_translated_page_id, apex_application.g_flow_step_id);'||chr(10)||
'        end if;'||chr(10)||
'    end if;'||chr(10)||
''||chr(10)||
'    -- Output the Twitter button widget'||chr(10)||
'    -- See http://twitter.com/about/resources/tweetbutton for syntax'||chr(10)||
'    sys.htp.prn ('||chr(10)||
'        ''<a href="http://twitter.com/share" class="twitter-share-butt'||
'on" data-url="''||sys.htf.escape_sc(l_url)||''" ''||'||chr(10)||
'        case when l_tweet_text_type = ''custom'' then ''data-text="''||l_custom_text||''" '' end||'||chr(10)||
'        ''data-count="''||l_layout_style||''" ''||'||chr(10)||
'        case when l_follow1 is not null then ''data-via="''||l_follow1||''" '' end||'||chr(10)||
'        case when l_follow2 is not null then ''data-related="''||l_follow2||''" '' end||'||chr(10)||
'        ''>Tweet</a><script type="text/javasc'||
'ript" src="http://platform.twitter.com/widgets.js"></script>'' );'||chr(10)||
''||chr(10)||
'    -- Tell APEX that this field is NOT navigable'||chr(10)||
'    l_result.is_navigable := false;'||chr(10)||
''||chr(10)||
'    return l_result;'||chr(10)||
'end render_twitter_button;'
 ,p_render_function => 'render_twitter_button'
 ,p_standard_attributes => 'VISIBLE:SOURCE:ELEMENT'
 ,p_help_text => '<p>'||chr(10)||
'	Twitter button widget based on the definition at <a href="http://twitter.com/about/resources/tweetbutton">http://twitter.com/about/resources/tweetbutton</a></p>'||chr(10)||
''
 ,p_version_identifier => '1.0'
 ,p_about_url => 'http://apex.oracle.com/plugins'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'URL to Tweet'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'current_page'
 ,p_is_translatable => false
 ,p_help_text => 'Suggest a default URL which will be included in the Tweet.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893518334827143223 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 5
 ,p_display_value => 'Current Page'
 ,p_return_value => 'current_page'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893494918355599241 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Page URL'
 ,p_return_value => 'page_url'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893495321818600232 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom URL'
 ,p_return_value => 'custom_url'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893524938805456618 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'Value of Page Item'
 ,p_return_value => 'value'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7893523035670304370 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Page URL'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'f?p=&APP_ID.:&APP_PAGE_ID.:0::::PAGE_ITEM:&PAGE_ITEM.'
 ,p_display_length => 50
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'page_url'
 ,p_help_text => '<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.</p>'||chr(10)||
''||chr(10)||
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise the URL will not be identified as the same URL. It''s also not allowed to end the page URL with a colon.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7893513233713887469 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Custom URL'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_default_value => 'http://'
 ,p_display_length => 50
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 7893494340949586853 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'custom_url'
 ,p_help_text => 'Enter the URL which should be included in the Tweet.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7893496027837611429 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Layout Style'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'vertical'
 ,p_is_translatable => false
 ,p_help_text => 'Determines the style how your Twitter button widget will look like.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893496632339612738 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893496027837611429 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Vertical Counter'
 ,p_return_value => 'vertical'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893497037879614379 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893496027837611429 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Horizontal Counter'
 ,p_return_value => 'horizontal'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7893497442035615514 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7893496027837611429 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'No Counter'
 ,p_return_value => 'none'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7000837736951824691 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Tweet Text'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'page_title'
 ,p_is_translatable => false
 ,p_help_text => 'Select "Page Title" to include the current page title as text that people will include in their Tweet when they share from your website. Custom allows to specify your own text.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7000838344223826783 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7000837736951824691 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Page Title'
 ,p_return_value => 'page_title'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 7000838747340827694 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 7000837736951824691 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Custom'
 ,p_return_value => 'custom'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7000839818858838446 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Custom Tweet Text'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 60
 ,p_max_length => 140
 ,p_is_translatable => true
 ,p_depending_on_attribute_id => 7000837736951824691 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'custom'
 ,p_help_text => 'Specify the text that people will include in their Tweet when they share from your website. Use the placeholder #PAGE_TITLE# for the current page title. Example: Check out "#PAGE_TITLE#"!'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7000840339637844427 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Follow 1'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_is_translatable => false
 ,p_help_text => 'Specify the Twitter account which will be @ mentioned in the suggested Tweet.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 7000840844139845756 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 7893494120864581013 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Follow 2'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_is_translatable => false
 ,p_help_text => '<p>Specify the Twitter account which is recommended for users to follow after they share content from your website.'||chr(10)||
'</p>'||chr(10)||
'<p>Optional use a colon to separate the Twitter account and an additional description of the account. For example: <code>patrickwolf:Author of many Plug-Ins</p>'
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
