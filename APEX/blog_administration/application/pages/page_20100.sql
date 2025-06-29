prompt --application/pages/page_20100
begin
--   Manifest
--     PAGE: 20100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20100
,p_name=>'Settings Help'
,p_alias=>'SETTING-HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Help'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_on=>wwv_flow_imp.dz('20250629052959Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(147746447900912997)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(147749375791913026)
,p_name=>'Help text'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-item--stacked:t-ContextualInfo-label--stacked'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  v1.attribute_desc as label',
', apex_lang.get_message(',
'    p_name    => v1.help_message',
'  , p_params  => ',
'      apex_t_varchar2(',
'        ''min''',
'      , v1.int_min',
'      , ''max''',
'      , v1.int_max',
'      )',
'  )                 as help',
'from blog_v_settings v1',
'where 1 = 1',
'  and :REQUEST = ''SETTINGS''',
'  and v1.id = :P20100_ID',
'union all',
'select',
'  v1.feature_desc   as label',
', apex_lang.get_message(',
'    p_name => v1.help_message',
'  )                 as help',
'from blog_v_features v1',
'where 1 = 1',
'  and :REQUEST = ''FEATURES''',
'  and v1.id = :P20100_ID'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_updated_on=>wwv_flow_imp.dz('20250629052959Z')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(147749852134913031)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_use_as_row_header=>'Y'
,p_column_css_class=>'u-bold'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(147749524035913028)
,p_query_column_id=>2
,p_column_alias=>'HELP'
,p_column_display_sequence=>20
,p_column_heading=>'&nbsp;'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(147746549869912998)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(147746447900912997)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(147749675186913029)
,p_name=>'P20100_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(147749375791913026)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201042817Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(147746676402912999)
,p_name=>'Close dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(147746549869912998)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(147746821737913000)
,p_event_id=>wwv_flow_imp.id(147746676402912999)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
