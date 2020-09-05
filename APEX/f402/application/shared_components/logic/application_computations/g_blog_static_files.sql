prompt --application/shared_components/logic/application_computations/g_blog_static_files
begin
--   Manifest
--     APPLICATION COMPUTATION: G_BLOG_STATIC_FILES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(20114712727625957)
,p_computation_sequence=>10
,p_computation_item=>'G_BLOG_STATIC_FILES'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'#OWNER#.blog_ords.get_module_path || ''share/'''
);
wwv_flow_api.component_end;
end;
/
