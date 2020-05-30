prompt --application/shared_components/user_interface/lovs/tags_visible
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(24779831361886842)
,p_lov_name=>'TAGS_VISIBLE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.tag     as return_value',
'  ,v1.tag         as display_value',
'  ,v1.tag_unique  as display_seq',
'from #OWNER#.blog_v_all_tags v1',
'where 1 = 1',
'and v1.is_active = 1',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'DESC'
,p_default_sort_column_name=>'DISPLAY_SEQ'
,p_default_sort_direction=>'ASC'
);
end;
/
