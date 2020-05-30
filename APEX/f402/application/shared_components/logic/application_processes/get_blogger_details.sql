prompt --application/shared_components/logic/application_processes/get_blogger_details
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(27393260249598885)
,p_process_sequence=>20
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Blogger Details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_blogger_details(',
'   p_app_id    => :APP_ID',
'  ,p_username  => :APP_USER',
'  ,p_id        => :G_BLOGGER_ID',
'  ,p_name      => :G_BLOGGER_NAME',
');'))
);
end;
/
