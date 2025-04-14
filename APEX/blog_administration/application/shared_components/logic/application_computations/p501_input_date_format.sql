prompt --application/shared_components/logic/application_computations/p501_input_date_format
begin
--   Manifest
--     APPLICATION COMPUTATION: P501_INPUT_DATE_FORMAT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(72680992823700503)
,p_computation_sequence=>20
,p_computation_item=>'P501_INPUT_DATE_FORMAT'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'DD.MM.YYYY HH24:MI'
,p_compute_when=>'P501_INPUT_DATE_FORMAT'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>41487112460549
,p_created_on=>wwv_flow_imp.dz('20241124165759Z')
,p_updated_on=>wwv_flow_imp.dz('20241125111217Z')
);
wwv_flow_imp.component_end;
end;
/
