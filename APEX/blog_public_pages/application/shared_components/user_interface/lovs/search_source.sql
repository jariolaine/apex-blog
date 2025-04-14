prompt --application/shared_components/user_interface/lovs/search_source
begin
--   Manifest
--     SEARCH_SOURCE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(152115299995335397)
,p_lov_name=>'SEARCH_SOURCE'
,p_lov_query=>'.'||wwv_flow_imp.id(152115299995335397)||'.'
,p_location=>'STATIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(152116004355335400)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Posts'
,p_lov_return_value=>'POSTS'
,p_required_patch=>wwv_flow_imp.id(136061722810585314)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(136578637747615168)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Comments'
,p_lov_return_value=>'COMMENTS'
,p_required_patch=>wwv_flow_imp.id(136577204653609176)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(152116474921335400)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Links'
,p_lov_return_value=>'LINKS'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_application_build_options',
'where 1 = 1',
'and application_id = :APP_ID',
'and build_option_name = ''BLOG_FEATURE_LINKS''',
'and build_option_status = ''Include'''))
,p_required_patch=>wwv_flow_imp.id(153078756515179491)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(152116823338335400)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Files'
,p_lov_return_value=>'FILES'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_application_build_options',
'where 1 = 1',
'and application_id = :APP_ID',
'and build_option_name = ''BLOG_FEATURE_FILES''',
'and build_option_status = ''Include'''))
,p_required_patch=>wwv_flow_imp.id(153078553735178020)
);
wwv_flow_imp.component_end;
end;
/
