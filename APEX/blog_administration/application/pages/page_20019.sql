prompt --application/pages/page_20019
begin
--   Manifest
--     PAGE: 20019
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
 p_id=>20019
,p_name=>'Oracle Cloud API Key'
,p_alias=>'OCI-API-KEY'
,p_page_mode=>'MODAL'
,p_step_title=>'Oracle Cloud API Key'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_created_on=>wwv_flow_imp.dz('20250122024738Z')
,p_last_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(264428826407387430)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_OCI_API_KEY_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(292223975551569236)
,p_plug_name=>'API Key'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(330434126287505046)
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
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98635406684957504)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(330434126287505046)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(98635868492957505)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(330434126287505046)
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
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(98642576373957520)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(292224607901569273)
,p_name=>'P20019_OCI_USER_OCID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(292223975551569236)
,p_prompt=>'OCI User ID'
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
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(292224880545569275)
,p_name=>'P20019_OCI_PRIVATE_KEY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(292223975551569236)
,p_prompt=>'OCI Private Key'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>4
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(292224962616569276)
,p_name=>'P20019_OCI_TENANCY_OCID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(292223975551569236)
,p_prompt=>'OCI Tenancy ID'
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
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(292225068248569277)
,p_name=>'P20019_OCI_KEY_FINGERPRINT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(292223975551569236)
,p_prompt=>'OCI Public Key Fingerprint'
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
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(98640107516957516)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(98635406684957504)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(98640672267957517)
,p_event_id=>wwv_flow_imp.id(98640107516957516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(98637259084957512)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Update Credential'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_CREDENTIAL'
,p_attribute_04=>'SET_PERSISTENT_CREDENTIALS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20019_OCI_USER_OCID is not null and',
':P20019_OCI_PRIVATE_KEY is not null and',
':P20019_OCI_TENANCY_OCID is not null and',
':P20019_OCI_KEY_FINGERPRINT is not null'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Credential updated.'
,p_internal_uid=>98637259084957512
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250201054201Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(98637745598957513)
,p_page_process_id=>wwv_flow_imp.id(98637259084957512)
,p_page_id=>20019
,p_name=>'p_credential_static_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'STATIC'
,p_value=>'BLOG_OCI_API_KEY'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(98638241262957514)
,p_page_process_id=>wwv_flow_imp.id(98637259084957512)
,p_page_id=>20019
,p_name=>'p_client_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P20019_OCI_USER_OCID'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(98638799125957514)
,p_page_process_id=>wwv_flow_imp.id(98637259084957512)
,p_page_id=>20019
,p_name=>'p_client_secret'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P20019_OCI_PRIVATE_KEY'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(98639262689957514)
,p_page_process_id=>wwv_flow_imp.id(98637259084957512)
,p_page_id=>20019
,p_name=>'p_namespace'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P20019_OCI_TENANCY_OCID'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250122024739Z')
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(98639777160957515)
,p_page_process_id=>wwv_flow_imp.id(98637259084957512)
,p_page_id=>20019
,p_name=>'p_fingerprint'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P20019_OCI_KEY_FINGERPRINT'
,p_created_on=>wwv_flow_imp.dz('20250122024739Z')
,p_updated_on=>wwv_flow_imp.dz('20250201054201Z')
);
wwv_flow_imp.component_end;
end;
/
