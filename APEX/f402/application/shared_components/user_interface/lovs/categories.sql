prompt --application/shared_components/user_interface/lovs/categories
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6986423229479201)
,p_lov_name=>'CATEGORIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select title    as return_value',
'  ,title        as display_value',
'  ,case is_active',
'  when 1',
'  then apex_lang.lang(''Enabled'')',
'  else apex_lang.lang(''Disabled'')',
'  end           as status',
'  ,display_seq  as display_seq',
'from #OWNER#.blog_v_all_categories',
'where 1 = 1'))
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
 p_id=>wwv_flow_api.id(24767170018767626)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(24767577456767626)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'Category'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(24773481755814823)
,p_query_column_name=>'STATUS'
,p_heading=>'Status'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
end;
/
