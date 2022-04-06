prompt --application/shared_components/user_interface/lovs/comment_flag
begin
--   Manifest
--     COMMENT_FLAG
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
 p_id=>wwv_flow_api.id(51200328000722214)
,p_lov_name=>'COMMENT_FLAG'
,p_lov_query=>'.'||wwv_flow_api.id(51200328000722214)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51200675357722225)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Read'
,p_lov_return_value=>'READ'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51201076379722227)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Unread'
,p_lov_return_value=>'UNREAD'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(51201441940722227)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Reply'
,p_lov_return_value=>'REPLY'
);
wwv_flow_api.component_end;
end;
/