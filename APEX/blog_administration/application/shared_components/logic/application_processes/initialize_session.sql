prompt --application/shared_components/logic/application_processes/initialize_session
begin
--   Manifest
--     APPLICATION PROCESS: Initialize session
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
 p_id=>wwv_flow_imp.id(136631570810942561)
,p_process_sequence=>10
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.initialize_items(',
'  p_app_id => :APP_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_comment=>'Set application and page item values for new session from parameter table.'
,p_version_scn=>41492291312659
);
wwv_flow_imp.component_end;
end;
/
