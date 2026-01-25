prompt --application/pages/page_20018
begin
--   Manifest
--     PAGE: 20018
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
 p_id=>20018
,p_name=>'APEX Authentication'
,p_alias=>'APEX-AUTHENTICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'APEX Authentication'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20250120154733Z')
,p_last_updated_on=>wwv_flow_imp.dz('20250702012247Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(329388742250626152)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_APEX_AUTH_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120154733Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(363627248449204106)
,p_plug_name=>'APEX Authentication'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462320083972664564)
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
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(97824360813356989)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(462320083972664564)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(97824751538356990)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(462320083972664564)
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
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(97831844634357018)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250120154734Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(195629325070389779)
,p_name=>'P20018_BUILD_OPTION_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(105756857047179004)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250201042740Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(363421264773275884)
,p_name=>'P20018_BUILD_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(363627248449204106)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application_admin.get_build_option_status(',
'  p_application_id     => :APP_ID',
', p_build_option_name  => :P20018_BUILD_OPTION_NAME',
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
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(97825813022357010)
,p_computation_sequence=>20
,p_computation_item=>'P20018_BUILD_OPTION_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'BLOG_AUTHENTICATION_APEX'
,p_compute_when=>'P20018_BUILD_OPTION_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250120154838Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(103688264136906902)
,p_validation_name=>'One authentication scheme enabled'
,p_validation_sequence=>10
,p_validation=>':P20018_BUILD_STATUS = apex_application_admin.c_build_option_status_include'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'At least one authentication scheme must be enabled.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>-wwv_flow_imp.id(118121315777572996)
,p_created_on=>wwv_flow_imp.dz('20250201034623Z')
,p_updated_on=>wwv_flow_imp.dz('20250201035322Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(97829410286357015)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(97824360813356989)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250120154734Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(97829985358357016)
,p_event_id=>wwv_flow_imp.id(97829410286357015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250120154734Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(97826150616357010)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Update Feature'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_ADMIN'
,p_attribute_04=>'UPDATE_FEATURE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application_admin.get_build_option_status(',
'  p_application_id     => :APP_ID',
', p_build_option_name  => :P20018_BUILD_OPTION_NAME',
') != :P20018_BUILD_STATUS'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'APEX authentication status updated.'
,p_internal_uid=>97826150616357010
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250702012247Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(29562778355765202)
,p_page_process_id=>wwv_flow_imp.id(97826150616357010)
,p_page_id=>20018
,p_name=>'p_build_option_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P20018_BUILD_OPTION_NAME'
,p_created_on=>wwv_flow_imp.dz('20250702012229Z')
,p_updated_on=>wwv_flow_imp.dz('20250702012246Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(97827171168357013)
,p_page_process_id=>wwv_flow_imp.id(97826150616357010)
,p_page_id=>20018
,p_name=>'p_build_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P20018_BUILD_STATUS'
,p_created_on=>wwv_flow_imp.dz('20250120154734Z')
,p_updated_on=>wwv_flow_imp.dz('20250702012246Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(105272091258048374)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Default authentication scheme'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_APPLICATION_ADMIN'
,p_attribute_04=>'SET_AUTHENTICATION_SCHEME'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>105272091258048374
,p_process_comment=>'If APEX authentication is disabled set Google as default authentication scheme.'
,p_created_on=>wwv_flow_imp.dz('20250201044245Z')
,p_updated_on=>wwv_flow_imp.dz('20250201044505Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(105272470432048382)
,p_page_process_id=>wwv_flow_imp.id(105272091258048374)
,p_page_id=>20018
,p_name=>'p_application_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APP_ID'
,p_created_on=>wwv_flow_imp.dz('20250201044245Z')
,p_updated_on=>wwv_flow_imp.dz('20250201044245Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(105272917028048382)
,p_page_process_id=>wwv_flow_imp.id(105272091258048374)
,p_page_id=>20018
,p_name=>'p_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case :P20018_BUILD_STATUS ',
'  when apex_application_admin.c_build_option_status_include',
'  then ''APEX''',
'  when apex_application_admin.c_build_option_status_exclude',
'  then ''Google''',
'end'))
,p_created_on=>wwv_flow_imp.dz('20250201044245Z')
,p_updated_on=>wwv_flow_imp.dz('20250201044422Z')
);
wwv_flow_imp.component_end;
end;
/
