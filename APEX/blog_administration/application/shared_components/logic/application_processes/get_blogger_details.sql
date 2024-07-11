prompt --application/shared_components/logic/application_processes/get_blogger_details
begin
--   Manifest
--     APPLICATION PROCESS: Get Blogger Details
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(54703974513900526)
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
,p_security_scheme=>wwv_flow_imp.id(28359530175115492)
,p_version_scn=>41110415845681
);
wwv_flow_imp.component_end;
end;
/
