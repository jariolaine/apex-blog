prompt --application/pages/page_20016
begin
--   Manifest
--     PAGE: 20016
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
 p_id=>20016
,p_name=>'Generative AI Settings'
,p_alias=>'GENERATIVE-AI-SETTINGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Generative AI'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>wwv_flow_imp.id(90902526034350271)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(96787758408172226)
,p_plug_name=>'Credential'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(90942936064350300)
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168005195103829743)
,p_plug_name=>'Generative AI'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200691286097168385)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(90917725665350280)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_GENERATIVE_AI_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(266696585977286001)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_translate_title=>'N'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117341368587570242)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(266696585977286001)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117341787455570240)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(266696585977286001)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_show_processing=>'Y'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(117345859689570078)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96787850742172227)
,p_name=>'P20016_API_KEY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(96787758408172226)
,p_prompt=>'API Key'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96788305205172232)
,p_name=>'P20016_BUILD_OPTION_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(105756857047179004)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(167798038627901506)
,p_name=>'P20016_BUILD_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application_admin.get_build_option_status(',
'  p_application_id     => :APP_ID',
', p_build_option_name  => :P20016_BUILD_OPTION_NAME',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(90994829054350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
,p_attribute_02=>'INCLUDE'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'EXCLUDE'
,p_attribute_05=>'Disabled'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(96788427282172233)
,p_computation_sequence=>10
,p_computation_item=>'P20016_BUILD_OPTION_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'BLOG_FEATURE_GENERATIVE_AI'
,p_compute_when=>'P20016_BUILD_OPTION_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(117343503272570083)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(117341368587570242)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(117343931192570080)
,p_event_id=>wwv_flow_imp.id(117343503272570083)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96848584386465804)
,p_name=>'Process Feature Status'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20016_BUILD_STATUS'
,p_condition_element=>'P20016_BUILD_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INCLUDE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96848962564465806)
,p_event_id=>wwv_flow_imp.id(96848584386465804)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(96787758408172226)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96849453369465806)
,p_event_id=>wwv_flow_imp.id(96848584386465804)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(96787758408172226)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96787942115172228)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Update Feature'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_CM'
,p_attribute_04=>'UPDATE_FEATURE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application_admin.get_build_option_status(',
'  p_application_id     => :APP_ID',
', p_build_option_name  => :P20016_BUILD_OPTION_NAME',
') != :P20016_BUILD_STATUS'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Generative AI status updated.'
,p_internal_uid=>96787942115172228
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(96788121591172230)
,p_page_process_id=>wwv_flow_imp.id(96787942115172228)
,p_page_id=>20016
,p_name=>'p_build_option_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P20016_BUILD_OPTION_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(96788241776172231)
,p_page_process_id=>wwv_flow_imp.id(96787942115172228)
,p_page_id=>20016
,p_name=>'p_build_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P20016_BUILD_STATUS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96843632889433491)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Update Credential'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_CREDENTIAL'
,p_attribute_04=>'SET_PERSISTENT_CREDENTIALS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P20016_API_KEY'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Credential updated.'
,p_internal_uid=>96843632889433491
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(96844027950433497)
,p_page_process_id=>wwv_flow_imp.id(96843632889433491)
,p_page_id=>20016
,p_name=>'p_credential_static_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'STATIC'
,p_value=>'BLOG_OPEN_AI_API_KEY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(96845046171433498)
,p_page_process_id=>wwv_flow_imp.id(96843632889433491)
,p_page_id=>20016
,p_name=>'p_key'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'Authorization'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(96846048134433499)
,p_page_process_id=>wwv_flow_imp.id(96843632889433491)
,p_page_id=>20016
,p_name=>'p_value'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_string.format(',
'  p_message => ''Bearer %s''',
', p0 => :P20016_API_KEY  ',
')'))
);
wwv_flow_imp.component_end;
end;
/
