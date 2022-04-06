prompt --application/shared_components/logic/application_computations/g_user_date_time_format
begin
--   Manifest
--     APPLICATION COMPUTATION: G_USER_DATE_TIME_FORMAT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(8959846931541340)
,p_computation_sequence=>20
,p_computation_item=>'G_USER_DATE_TIME_FORMAT'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'SET_ITEM_EQUAL_THIS_PREFERENCE'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'BLOG_DISPLAY_DATE_FORMAT'
);
wwv_flow_api.component_end;
end;
/
