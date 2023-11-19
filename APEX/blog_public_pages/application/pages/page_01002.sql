prompt --application/pages/page_01002
begin
--   Manifest
--     PAGE: 01002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>1002
,p_name=>'Footer Link Modal Dialog'
,p_alias=>'INFORMATION'
,p_page_mode=>'MODAL'
,p_step_title=>'&P1002_PAGE_TITLE.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8700188054171688)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230608144315'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(19452283963363502)
,p_name=>'Dynamic content'
,p_template=>wwv_flow_imp.id(6781372168267375)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   null             as region_title',
'  ,v1.content_html  as body_html',
' -- save content_desc to compute item after regions',
'  ,apex_util.savekey_vc2(',
'    p_val => v1.content_desc',
'  )                 as dialog_title',
'  ,case v1.show_changed_on',
'    when 1 then v1.changed_on ',
'  end               as changed_on',
'from blog_v_dynamic_content v1',
'where 1 = 1',
'and v1.content_id = :REQUEST',
'order by v1.content_id'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30641878306098019)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20472285543872837)
,p_query_column_id=>1
,p_column_alias=>'REGION_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Region Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19454652674363526)
,p_query_column_id=>2
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>20
,p_column_heading=>'Body Html'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19454925235363529)
,p_query_column_id=>3
,p_column_alias=>'DIALOG_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Dialog Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19453808827363518)
,p_query_column_id=>4
,p_column_alias=>'CHANGED_ON'
,p_column_display_sequence=>40
,p_column_heading=>'Changed On'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'{if CHANGED_ON/}<p>&APP_TEXT$BLOG_MSG_LAST_UPDATED. #CHANGED_ON#.</p>{endif/}'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(36227766771379736)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19452283963363502)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6855239813267414)
,p_button_image_alt=>'Close'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'w40p mxw240'
,p_icon_css_classes=>'fa-close'
,p_grid_column_css_classes=>'u-textCenter padding-top-md'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41879333719408334)
,p_name=>'P1002_PAGE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19454870397363528)
,p_computation_sequence=>10
,p_computation_item=>'P1002_PAGE_TITLE'
,p_computation_point=>'AFTER_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'apex_util.keyval_vc2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(36227874221379737)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(36227766771379736)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(36227948089379738)
,p_event_id=>wwv_flow_imp.id(36227874221379737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(43471134461898243)
,p_name=>'Set Dialog Title'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43471253207898244)
,p_event_id=>wwv_flow_imp.id(43471134461898243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'blog.ui.setDialogTitle( "&P1002_PAGE_TITLE." );'
);
wwv_flow_imp.component_end;
end;
/
