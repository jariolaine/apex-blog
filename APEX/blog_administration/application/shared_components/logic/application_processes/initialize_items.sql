prompt --application/shared_components/logic/application_processes/initialize_items
begin
--   Manifest
--     APPLICATION PROCESS: Initialize Items
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
 p_id=>wwv_flow_imp.id(8615704870930436)
,p_process_sequence=>10
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.initialize_items(',
'  p_app_id => :APP_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
