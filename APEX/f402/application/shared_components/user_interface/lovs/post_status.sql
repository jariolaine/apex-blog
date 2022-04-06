prompt --application/shared_components/user_interface/lovs/post_status
begin
--   Manifest
--     POST_STATUS
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
 p_id=>wwv_flow_api.id(7400955148112919)
,p_lov_name=>'POST_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(7400955148112919)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7401232271112923)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Published'
,p_lov_return_value=>'PUBLISHED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7402044315112924)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Scheduled'
,p_lov_return_value=>'SCHEDULED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7401613475112924)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Draft'
,p_lov_return_value=>'DRAFT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3948151956719951)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Category is disabled'
,p_lov_return_value=>'CATEGORY_DISABLED'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3947832275719950)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Blogger is disable'
,p_lov_return_value=>'BLOGGER_DISABLED'
);
wwv_flow_api.component_end;
end;
/
