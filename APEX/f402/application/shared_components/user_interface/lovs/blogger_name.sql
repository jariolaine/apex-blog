prompt --application/shared_components/user_interface/lovs/blogger_name
begin
--   Manifest
--     BLOGGER_NAME
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(11799190347841995)
,p_lov_name=>'BLOGGER_NAME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   blogger_name as display_value',
'  ,blogger_name as return_value',
'from #OWNER#.blog_bloggers'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DISPLAY_VALUE'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
