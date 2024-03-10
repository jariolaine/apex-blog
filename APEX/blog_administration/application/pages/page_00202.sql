prompt --application/pages/page_00202
begin
--   Manifest
--     PAGE: 00202
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>202
,p_name=>'About This Application'
,p_alias=>'ABOUT-THIS-APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'About This Application'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8930100593603171)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230409185850'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11416108930329119)
,p_name=>'Version'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.attribute_value as attribute_value',
'  ,t1.changed_on      as changed_on',
'from blog_settings t1',
'where 1 = 1',
'  and t1.attribute_name = ''G_APP_VERSION''',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
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
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12513831447984044)
,p_query_column_id=>2
,p_column_alias=>'CHANGED_ON'
,p_column_display_sequence=>50
,p_column_heading=>'Changed On'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12513918318984045)
,p_name=>'Patches'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.attribute_value as attribute_value',
'  ,t1.created_on      as created_on',
'from blog_settings t1',
'where 1 = 1',
'  and t1.attribute_name like ''PATCH%''',
'order by t1.created_on desc'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
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
,p_column_heading=>'Patch No.'
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12514150105984047)
,p_query_column_id=>2
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>20
,p_column_heading=>'Applied'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37562205582471036)
,p_plug_name=>'Buttons'
,p_region_css_classes=>'u-textCenter'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16125672228947349)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(37562205582471036)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'w40p mxw240'
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16125748734947350)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(16125672228947349)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19452116825363501)
,p_event_id=>wwv_flow_imp.id(16125748734947350)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
