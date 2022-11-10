prompt --application/shared_components/user_interface/lovs/tags
begin
--   Manifest
--     TAGS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(13690460867369074)
,p_lov_name=>'TAGS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.id  as return_value',
'  ,v1.tag as display_value',
'  ,v1.tag_unique as display_seq',
'  ,case v1.is_active',
'    when 1',
'    then apex_lang.message( ''BLOG_LOV_IS_ACTIVE_ENABLED'' )',
'    else apex_lang.message( ''BLOG_LOV_IS_ACTIVE_DISABLED'' )',
'  end            as status',
'from #OWNER#.blog_v_all_tags v1',
'where 1 = 1',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_column_name=>'STATUS'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DISPLAY_SEQ'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13826303638635316)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13826691952635317)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'Tag'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13827000349635318)
,p_query_column_name=>'STATUS'
,p_heading=>'Status'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
