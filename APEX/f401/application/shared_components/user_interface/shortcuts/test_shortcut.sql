prompt --application/shared_components/user_interface/shortcuts/test_shortcut
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(38824026216053086)
,p_shortcut_name=>'TEST_SHORTCUT'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>'Testing button label'
);
end;
/
