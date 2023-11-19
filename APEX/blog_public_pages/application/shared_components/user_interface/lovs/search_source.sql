prompt --application/shared_components/user_interface/lovs/search_source
begin
--   Manifest
--     SEARCH_SOURCE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(24721310666439263)
,p_lov_name=>'SEARCH_SOURCE'
,p_lov_query=>'.'||wwv_flow_imp.id(24721310666439263)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(24752688820807541)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'All'
,p_lov_return_value=>'ALL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(24722015026439266)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Posts'
,p_lov_return_value=>'POSTS'
,p_required_patch=>wwv_flow_imp.id(8667733481689180)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(24722485592439266)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Links'
,p_lov_return_value=>'LINKS'
,p_required_patch=>wwv_flow_imp.id(25684767186283357)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(24722834009439266)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Files'
,p_lov_return_value=>'FILES'
,p_required_patch=>wwv_flow_imp.id(25684564406281886)
);
wwv_flow_imp.component_end;
end;
/
