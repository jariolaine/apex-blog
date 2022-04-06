prompt --application/shared_components/user_interface/lovs/is_active
begin
--   Manifest
--     IS_ACTIVE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(8819403626737334)
,p_lov_name=>'IS_ACTIVE'
,p_lov_query=>'.'||wwv_flow_api.id(8819403626737334)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(8820136575737336)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Disabled'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(8819764758737336)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Enabled'
,p_lov_return_value=>'1'
);
wwv_flow_api.component_end;
end;
/
