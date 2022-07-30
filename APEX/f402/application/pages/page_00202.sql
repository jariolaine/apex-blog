prompt --application/pages/page_00202
begin
--   Manifest
--     PAGE: 00202
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_imp.id(8571044485518264)
,p_name=>'About This Application'
,p_alias=>'ABOUT-THIS-APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'About This Application'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8930100593603171)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220510054419'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11416108930329119)
,p_name=>'Version'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.attribute_value as attribute_value',
'  ,t1.created_on      as created_on',
'  ,t1.changed_on      as changed_on',
'from #OWNER#.blog_settings t1',
'where 1 = 1',
'  and t1.attribute_name = ''G_APP_VERSION''',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_row_count_max=>1
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11416335010329121)
,p_query_column_id=>1
,p_column_alias=>'ATTRIBUTE_VALUE'
,p_column_display_sequence=>30
,p_column_heading=>'Version'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12513700970984043)
,p_query_column_id=>2
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>40
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12513831447984044)
,p_query_column_id=>3
,p_column_alias=>'CHANGED_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Changed On'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_USER_DATE_TIME_FORMAT.'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12513918318984045)
,p_name=>'Patches'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.attribute_value as attribute_value',
'  ,t1.created_on      as created_on',
'  ,t1.changed_on      as changed_on',
'from #OWNER#.blog_settings t1',
'where 1 = 1',
'  and t1.attribute_name like ''PATCH%''',
'order by t1.attribute_name desc'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12514001878984046)
,p_query_column_id=>1
,p_column_alias=>'ATTRIBUTE_VALUE'
,p_column_display_sequence=>10
,p_column_heading=>'Patch'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12514150105984047)
,p_query_column_id=>2
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>20
,p_column_heading=>'Created'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_USER_DATE_TIME_FORMAT.'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12514210714984048)
,p_query_column_id=>3
,p_column_alias=>'CHANGED_ON'
,p_column_display_sequence=>30
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp.component_end;
end;
/
