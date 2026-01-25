prompt --application/shared_components/user_interface/lovs/comment_flag_code
begin
--   Manifest
--     COMMENT_FLAG_CODE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(85902888330737212)
,p_lov_name=>'COMMENT_FLAG_CODE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  lov.display_value',
', lov.return_value',
'from blog_v_lov lov',
'where lov.lov_name = ''COMMENT_FLAG'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_default_sort_column_name=>'DISPLAY_VALUE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41473850426457
);
wwv_flow_imp.component_end;
end;
/
