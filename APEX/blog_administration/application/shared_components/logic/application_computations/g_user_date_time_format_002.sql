prompt --application/shared_components/logic/application_computations/g_user_date_time_format_002
begin
--   Manifest
--     APPLICATION COMPUTATION: G_USER_DATE_TIME_FORMAT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(28465031431932653)
,p_computation_sequence=>30
,p_computation_item=>'G_USER_DATE_TIME_FORMAT'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'DD.MM.YYYY HH24:MI'
,p_compute_when=>'G_USER_DATE_TIME_FORMAT'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>41109498954965
);
wwv_flow_imp.component_end;
end;
/
