prompt --application/shared_components/user_interface/lovs/file_directories
begin
--   Manifest
--     FILE_DIRECTORIES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(101183193712540895)
,p_lov_name=>'FILE_DIRECTORIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'  trim( both ''/'' from file_dir ) as return_value',
'from blog_files',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'RETURN_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41375763033534
);
wwv_flow_imp.component_end;
end;
/
