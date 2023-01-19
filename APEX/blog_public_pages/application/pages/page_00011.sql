prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'File Repository'
,p_alias=>'REPOSITORY'
,p_step_title=>'Files | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(20718112665951240)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(24626889314854172)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'24'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230119061721'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(65301007014080913)
,p_name=>'File Repository'
,p_template=>wwv_flow_imp.id(9260227573556082)
,p_display_sequence=>30
,p_region_css_classes=>'z-MediaList--files'
,p_region_template_options=>'#DEFAULT#:t-ResultsRegion--boxed'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.file_id   as id',
'  ,v1.file_name as list_title',
'  ,v1.file_desc as list_text',
'  ,v1.file_size as list_badge',
'  ,null         as list_class',
'  ,null         as icon_class -- se column HTML expression',
'  ,null         as icon_color_class',
'  ,apex_page.get_url(',
'     p_page     => 1003',
'    ,p_session  => null',
'    ,p_request  => ''application_process=download''',
'    ,p_items    => ''P11_FILE_NAME''',
'    ,p_values   => v1.file_name',
'  )             as link',
'  ,null         as link_attr -- se column HTML expression',
'  ,null         as link_class',
'from #OWNER#.blog_v_files v1',
'where 1 = 1',
'order by v1.file_name'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6815219261267393)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>100
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301140634080914)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301237974080915)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301369993080916)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301489097080917)
,p_query_column_id=>4
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>40
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_column_format=>'FILESIZE'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301558085080918)
,p_query_column_id=>5
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301643674080919)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'fa fa-download'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301725590080920)
,p_query_column_id=>7
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>70
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301875071080921)
,p_query_column_id=>8
,p_column_alias=>'LINK'
,p_column_display_sequence=>80
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65301942959080922)
,p_query_column_id=>9
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>90
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'download'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(65302003262080923)
,p_query_column_id=>10
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>100
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50989785872352709)
,p_plug_name=>'Search from Files'
,p_parent_plug_id=>wwv_flow_imp.id(65301007014080913)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781372168267375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SEARCH_FIELD'
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(65301007014080913)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_imp.id(25684564406281886)
,p_attribute_02=>'N'
,p_attribute_03=>'10000'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17563727870717601)
,p_name=>'P11_FILE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22521279988146407)
,p_name=>'P11_FILE_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50989785872352709)
,p_prompt=>'File Search'
,p_placeholder=>'Search on files...'
,p_source=>'LIST_TITLE,LIST_TEXT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(25684564406281886)
,p_attribute_01=>'ROW'
,p_attribute_04=>'N'
,p_fc_show_chart=>false
);
wwv_flow_imp.component_end;
end;
/
