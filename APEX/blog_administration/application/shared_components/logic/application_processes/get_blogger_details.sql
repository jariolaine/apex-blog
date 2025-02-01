prompt --application/shared_components/logic/application_processes/get_blogger_details
begin
--   Manifest
--     APPLICATION PROCESS: Get Blogger Details
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(137150097155732617)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Blogger Details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.get_blogger_details(',
'  p_app_id    => :APP_ID  ',
', p_username  => :APP_USER',
', p_user_id   => :G_BLOGGER_ID',
', p_name      => :G_BLOGGER_NAME',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'G_BLOGGER_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(110805652816947583)
,p_process_comment=>'Get user details after authentication and authorization. Insert user to BLOG_BLOGGERS table if not exists. Currently in APEX 24.1 process point can''t be "After Authentication" due maybe bug in APEX. Verify after APEX 24.2 upgrade.'
,p_version_scn=>41492291275600
);
wwv_flow_imp.component_end;
end;
/
