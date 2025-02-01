prompt --application/pages/page_20014
begin
--   Manifest
--     PAGE: 20014
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20014
,p_name=>'File Synchronization'
,p_alias=>'FILE-SYNCHRONIZATION'
,p_page_mode=>'MODAL'
,p_step_title=>'File Synchronization'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>wwv_flow_imp.id(90902526034350271)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104918964963388312)
,p_plug_name=>'Synchronize'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104919072071388313)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104919533475388318)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(90917725665350280)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_FILE_SYNC_INFO!RAW.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(105675242463389015)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(104919072071388313)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104919172048388314)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(104919072071388313)
,p_button_name=>'SYNCHRONIZE_FILES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Synchronize Files'
,p_button_position=>'NEXT'
,p_show_processing=>'Y'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(105088897954889705)
,p_branch_name=>'Go To Confirm File Overwrite'
,p_branch_action=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP,:P303_ACTION:&P20014_ACTION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_comment=>'Branch to confirm overwrite file(s)'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(104919432058388317)
,p_name=>'P20014_ACTION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(104918964963388312)
,p_item_default=>'OCI'
,p_prompt=>'Action'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'FILE_SYNC_ACTION'
,p_lov=>'.'||wwv_flow_imp.id(105676962488365852)||'.'
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(90994829054350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(105675499659387199)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(105675242463389015)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675918884387188)
,p_event_id=>wwv_flow_imp.id(105675499659387199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104918667032388309)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Synchronize Files'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_OCI_OS'
,p_attribute_04=>'FILE_SYNC'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22472544390556218
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104918806576388310)
,p_page_process_id=>wwv_flow_imp.id(104918667032388309)
,p_page_id=>20014
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'BLOG_REPLACE_FILES_COLLECTION'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104918828246388311)
,p_page_process_id=>wwv_flow_imp.id(104918667032388309)
,p_page_id=>20014
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(105757409029179009)
,p_page_process_id=>wwv_flow_imp.id(104918667032388309)
,p_page_id=>20014
,p_name=>'p_action'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P20014_ACTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(105088437011890811)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'not apex_collection.collection_exists( :BLOG_REPLACE_FILES_COLLECTION )'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Files Synchronized.'
,p_internal_uid=>22642314370058720
);
wwv_flow_imp.component_end;
end;
/
