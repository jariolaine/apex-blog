prompt --application/shared_components/user_interface/lovs/tags
begin
--   Manifest
--     TAGS
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
 p_id=>wwv_flow_api.id(7140542412077627)
,p_lov_name=>'TAGS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.tag        as return_value',
'  ,v1.tag        as display_value',
'  ,v1.tag_unique as display_seq',
'  ,case v1.is_active',
'  when 1',
'  then apex_lang.lang(''Enabled'')',
'  else apex_lang.lang(''Disabled'')',
'  end            as status',
'from #OWNER#.blog_v_all_tags v1',
'where 1 = 1',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_column_name=>'STATUS'
,p_group_sort_direction=>'DESC'
,p_default_sort_column_name=>'DISPLAY_SEQ'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(24770130757807179)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(24770589496807179)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'Tag'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(24770901431807179)
,p_query_column_name=>'STATUS'
,p_heading=>'Status'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_api.component_end;
end;
/
