prompt --application/shared_components/logic/application_processes/initiatize_items
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(8615704870930436)
,p_process_sequence=>10
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initiatize Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.initialize_items(',
'  p_app_id => :APP_ID',
');'))
);
end;
/
