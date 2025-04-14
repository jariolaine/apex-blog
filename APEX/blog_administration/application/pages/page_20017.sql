prompt --application/pages/page_20017
begin
--   Manifest
--     PAGE: 20017
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20017
,p_name=>'Google Authentication'
,p_alias=>'GOOGLE-AUTHENTICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Google Authentication'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20250120143150Z')
,p_last_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(194588795161192388)
,p_plug_name=>'Credential'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120145125Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(231567041923269179)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_GOOGLE_AUTH_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120144736Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(265805548121847133)
,p_plug_name=>'Google Authentication'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120145058Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(364498383645307591)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_translate_title=>'N'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120145140Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(97802485432021594)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(364498383645307591)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_created_on=>wwv_flow_imp.dz('20250120145140Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(97802025449021592)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(364498383645307591)
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
,p_created_on=>wwv_flow_imp.dz('20250120145140Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(97808583725052006)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_created_on=>wwv_flow_imp.dz('20250120145644Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145644Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96789675761172245)
,p_name=>'P20017_CLIENT_SECRET'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(194588795161192388)
,p_prompt=>'Client Secret'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120151314Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(97803964101032770)
,p_name=>'P20017_BUILD_OPTION_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(105756857047179004)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120145331Z')
,p_updated_on=>wwv_flow_imp.dz('20250201042719Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(194589204969192390)
,p_name=>'P20017_CLIENT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(194588795161192388)
,p_prompt=>'Client ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120145125Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(265598645086918897)
,p_name=>'P20017_BUILD_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(265805548121847133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application_admin.get_build_option_status(',
'  p_application_id     => :APP_ID',
', p_build_option_name  => :P20017_BUILD_OPTION_NAME',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
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
,p_created_on=>wwv_flow_imp.dz('20250120145058Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(97804886470040446)
,p_computation_sequence=>20
,p_computation_item=>'P20017_BUILD_OPTION_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'BLOG_AUTHENTICATION_GOOGLE'
,p_compute_when=>'P20017_BUILD_OPTION_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_created_on=>wwv_flow_imp.dz('20250120145448Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145513Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(105228307123715648)
,p_validation_name=>'One authentication scheme enabled'
,p_validation_sequence=>10
,p_validation=>':P20017_BUILD_STATUS = apex_application_admin.c_build_option_status_include'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'At least one authentication scheme must be enabled.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>-wwv_flow_imp.id(118121075712571408)
,p_created_on=>wwv_flow_imp.dz('20250201034718Z')
,p_updated_on=>wwv_flow_imp.dz('20250201035242Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(97802871641023906)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(97802485432021594)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_created_on=>wwv_flow_imp.dz('20250120145203Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145203Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97803220723023909)
,p_event_id=>wwv_flow_imp.id(97802871641023906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_created_on=>wwv_flow_imp.dz('20250120145203Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145203Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(97810735752155155)
,p_name=>'Process Feature Status'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20017_BUILD_STATUS'
,p_condition_element=>'P20017_BUILD_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INCLUDE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_created_on=>wwv_flow_imp.dz('20250120151355Z')
,p_updated_on=>wwv_flow_imp.dz('20250120153140Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97811141081155157)
,p_event_id=>wwv_flow_imp.id(97810735752155155)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20017_CLIENT_ID,P20017_CLIENT_SECRET'
,p_created_on=>wwv_flow_imp.dz('20250120151355Z')
,p_updated_on=>wwv_flow_imp.dz('20250120153140Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97811691847155157)
,p_event_id=>wwv_flow_imp.id(97810735752155155)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20017_CLIENT_ID,P20017_CLIENT_SECRET'
,p_created_on=>wwv_flow_imp.dz('20250120151355Z')
,p_updated_on=>wwv_flow_imp.dz('20250120153140Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97805388353048929)
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
', p_build_option_name  => :P20017_BUILD_OPTION_NAME',
') != :P20017_BUILD_STATUS'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Google authentication status updated.'
,p_internal_uid=>97805388353048929
,p_created_on=>wwv_flow_imp.dz('20250120145613Z')
,p_updated_on=>wwv_flow_imp.dz('20250120151841Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97805760105048934)
,p_page_process_id=>wwv_flow_imp.id(97805388353048929)
,p_page_id=>20017
,p_name=>'p_build_option_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P20017_BUILD_OPTION_NAME'
,p_created_on=>wwv_flow_imp.dz('20250120145613Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145613Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97806232930048935)
,p_page_process_id=>wwv_flow_imp.id(97805388353048929)
,p_page_id=>20017
,p_name=>'p_build_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P20017_BUILD_STATUS'
,p_created_on=>wwv_flow_imp.dz('20250120145613Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145613Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97806614154050627)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Update Credential'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_CREDENTIAL'
,p_attribute_04=>'SET_PERSISTENT_CREDENTIALS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20017_CLIENT_ID is not null and',
':P20017_CLIENT_SECRET is not null and',
':P20017_BUILD_STATUS = apex_application_admin.c_build_option_status_include'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Credential updated.'
,p_internal_uid=>97806614154050627
,p_created_on=>wwv_flow_imp.dz('20250120145630Z')
,p_updated_on=>wwv_flow_imp.dz('20250120152444Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97807079668050628)
,p_page_process_id=>wwv_flow_imp.id(97806614154050627)
,p_page_id=>20017
,p_name=>'p_credential_static_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'STATIC'
,p_value=>'BLOG_GOOGLE_OAUTH2'
,p_created_on=>wwv_flow_imp.dz('20250120145630Z')
,p_updated_on=>wwv_flow_imp.dz('20250120145747Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97807538093050628)
,p_page_process_id=>wwv_flow_imp.id(97806614154050627)
,p_page_id=>20017
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P20017_CLIENT_ID'
,p_created_on=>wwv_flow_imp.dz('20250120145630Z')
,p_updated_on=>wwv_flow_imp.dz('20250120151314Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97808089782050629)
,p_page_process_id=>wwv_flow_imp.id(97806614154050627)
,p_page_id=>20017
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P20017_CLIENT_SECRET'
,p_created_on=>wwv_flow_imp.dz('20250120145630Z')
,p_updated_on=>wwv_flow_imp.dz('20250120151314Z')
);
wwv_flow_imp.component_end;
end;
/
