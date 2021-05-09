prompt --application/shared_components/user_interface/lovs/tags_hidden
begin
--   Manifest
--     TAGS_HIDDEN
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(24782207188898443)
,p_lov_name=>'TAGS_HIDDEN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.tag     as return_value',
'  ,v1.tag         as display_value',
'  ,v1.tag_unique  as display_seq',
'from #OWNER#.blog_v_all_tags v1',
'where 1 = 1',
'and v1.is_active = 0',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'DESC'
,p_default_sort_column_name=>'DISPLAY_SEQ'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
