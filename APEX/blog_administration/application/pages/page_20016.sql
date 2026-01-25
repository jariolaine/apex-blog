prompt --application/pages/page_20016
begin
--   Manifest
--     PAGE: 20016
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20016
,p_name=>'Generative AI Configuration'
,p_alias=>'GENERATIVE-AI-CONFIGURATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Generative AI'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_on=>wwv_flow_imp.dz('20250630054918Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168005195103829743)
,p_plug_name=>'Generative AI'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  v1.remote_server_static_id',
', apex_application_admin.get_build_option_status(',
'    p_application_id     => :APP_ID',
'  , p_build_option_name  => blog_ai.get_param_value( ''gen_ai_build_option'' )',
'  )               as build_status',
', v1.base_url     as base_url',
', v1.model_name   as ai_model_name',
', v1.http_headers as ai_http_headers',
', v1.attributes   as ai_attributes',
'from apex_workspace_ai_services v1'))
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(200691286097168385)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_GENERATIVE_AI_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(266696585977286001)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_translate_title=>'N'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117341368587570242)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(266696585977286001)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117341787455570240)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(266696585977286001)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_show_processing=>'Y'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
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
 p_id=>wwv_flow_imp.id(15961462369299921)
,p_name=>'P20016_BASE_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'Base URL'
,p_source=>'BASE_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250630021517Z')
,p_updated_on=>wwv_flow_imp.dz('20250630042301Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15961511203299922)
,p_name=>'P20016_AI_MODEL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'Model'
,p_source=>'AI_MODEL_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250630021517Z')
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15961670529299923)
,p_name=>'P20016_AI_HTTP_HEADERS'
,p_source_data_type=>'CLOB'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'HTTP Headers'
,p_source=>'AI_HTTP_HEADERS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>32767
,p_cHeight=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250630021611Z')
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15961744330299924)
,p_name=>'P20016_AI_ATTRIBUTES'
,p_source_data_type=>'CLOB'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'Attributes'
,p_source=>'AI_ATTRIBUTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>32767
,p_cHeight=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250630021942Z')
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15962179869299928)
,p_name=>'P20016_REMOTE_SERVER_STATIC_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_source=>'REMOTE_SERVER_STATIC_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250630033544Z')
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96787850742172227)
,p_name=>'P20016_API_KEY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'API Key'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(167798038627901506)
,p_name=>'P20016_BUILD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_item_source_plug_id=>wwv_flow_imp.id(168005195103829743)
,p_prompt=>'Status'
,p_source=>'BUILD_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Disabled',
  'off_value', 'EXCLUDE',
  'on_label', 'Enabled',
  'on_value', 'INCLUDE',
  'use_defaults', 'N')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250630033544Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15963178676299938)
,p_computation_sequence=>10
,p_computation_item=>'P20016_REMOTE_SERVER_STATIC_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'blog_ai.get_param_value( ''gen_ai_static_id'' )'
,p_created_on=>wwv_flow_imp.dz('20250630033638Z')
,p_updated_on=>wwv_flow_imp.dz('20250630033638Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(15963255901299939)
,p_validation_name=>'P20016_BASE_URL is not null'
,p_validation_sequence=>10
,p_validation=>'P20016_BASE_URL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value if generative AI is enabled.'
,p_validation_condition=>'P20016_BUILD_STATUS'
,p_validation_condition2=>'INCLUDE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(15961462369299921)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_created_on=>wwv_flow_imp.dz('20250630033831Z')
,p_updated_on=>wwv_flow_imp.dz('20250630042321Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(15963338656299940)
,p_validation_name=>'P20016_AI_MODEL_NAME is not null'
,p_validation_sequence=>20
,p_validation=>'P20016_AI_MODEL_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value if generative AI is enabled.'
,p_validation_condition=>'P20016_BUILD_STATUS'
,p_validation_condition2=>'INCLUDE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(15961511203299922)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_created_on=>wwv_flow_imp.dz('20250630033928Z')
,p_updated_on=>wwv_flow_imp.dz('20250630042321Z')
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
,p_updated_on=>wwv_flow_imp.dz('20250630025042Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96848962564465806)
,p_event_id=>wwv_flow_imp.id(96848584386465804)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20016_API_KEY,P20016_BASE_URL,P20016_AI_MODEL_NAME,P20016_AI_HTTP_HEADERS,P20016_AI_ATTRIBUTES'
,p_updated_on=>wwv_flow_imp.dz('20250630025042Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96849453369465806)
,p_event_id=>wwv_flow_imp.id(96848584386465804)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20016_API_KEY,P20016_BASE_URL,P20016_AI_MODEL_NAME,P20016_AI_HTTP_HEADERS,P20016_AI_ATTRIBUTES'
,p_updated_on=>wwv_flow_imp.dz('20250630025042Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15963088327299937)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(168005195103829743)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form - Generative AI'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_ai.set_gen_ai(',
'  p_build_status    => :P20016_BUILD_STATUS',
', p_api_key         => :P20016_API_KEY',
', p_base_url        => :P20016_BASE_URL',
', p_ai_model_name   => :P20016_AI_MODEL_NAME',
', p_ai_http_headers => :P20016_AI_HTTP_HEADERS',
', p_ai_attributes   => :P20016_AI_ATTRIBUTES',
');'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Generative AI settings updated.'
,p_internal_uid=>15963088327299937
,p_created_on=>wwv_flow_imp.dz('20250630033544Z')
,p_updated_on=>wwv_flow_imp.dz('20250630054918Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15962027798299927)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(168005195103829743)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form - Generative AI'
,p_internal_uid=>15962027798299927
,p_created_on=>wwv_flow_imp.dz('20250630033544Z')
,p_updated_on=>wwv_flow_imp.dz('20250630054918Z')
);
wwv_flow_imp.component_end;
end;
/
