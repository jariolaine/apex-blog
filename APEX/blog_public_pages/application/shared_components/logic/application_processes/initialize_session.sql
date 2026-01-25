prompt --application/shared_components/logic/application_processes/initialize_session
begin
--   Manifest
--     APPLICATION PROCESS: Initialize session
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(181577391643982135)
,p_process_sequence=>10
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.initialize_items( ',
'  p_app_id => :APP_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_comment=>'Set application and page item values for new session from parameter table.'
,p_version_scn=>42244534605990
,p_updated_on=>wwv_flow_imp.dz('20250701041501Z')
);
wwv_flow_imp.component_end;
end;
/
