prompt --application/shared_components/user_interface/lovs/sentiment
begin
--   Manifest
--     SENTIMENT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(113519338477134064)
,p_lov_name=>'SENTIMENT'
,p_lov_query=>'.'||wwv_flow_imp.id(113519338477134064)||'.'
,p_location=>'STATIC'
,p_version_scn=>41472584294360
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(113519681443134058)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Mixed'
,p_lov_return_value=>'Mixed'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(113520102348134057)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Negative'
,p_lov_return_value=>'Negative'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(113520489950134056)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Neutral'
,p_lov_return_value=>'Neutral'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(113520891623134056)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Positive'
,p_lov_return_value=>'Positive'
);
wwv_flow_imp.component_end;
end;
/
