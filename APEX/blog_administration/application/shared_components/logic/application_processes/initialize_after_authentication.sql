prompt --application/shared_components/logic/application_processes/initialize_after_authentication
begin
--   Manifest
--     APPLICATION PROCESS: Initialize after authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(9326471933599174)
,p_process_sequence=>10
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize after authentication'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.initialize_items(',
'  p_app_id => :APP_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_comment=>'Set application and page item values for new session from parameter table.'
,p_version_scn=>42197538651022
,p_created_on=>wwv_flow_imp.dz('20250414103433Z')
,p_updated_on=>wwv_flow_imp.dz('20250414105543Z')
);
wwv_flow_imp.component_end;
end;
/
