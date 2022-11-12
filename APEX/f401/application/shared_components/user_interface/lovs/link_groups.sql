prompt --application/shared_components/user_interface/lovs/link_groups
begin
--   Manifest
--     LINK_GROUPS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(17536632976390056)
,p_lov_name=>'LINK_GROUPS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select title  as return_value',
'  ,title      as display_vaue',
' from blog_link_groups',
' where 1 = 1',
' and is_active = 1',
' order by display_seq',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'BLOG_LINK_GROUPS'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VAUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/