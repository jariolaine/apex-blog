prompt --application/pages/page_00071
begin
--   Manifest
--     PAGE: 00071
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>71
,p_name=>'Edit File Properties'
,p_alias=>'FILE-PROPERTIES'
,p_page_mode=>'MODAL'
,p_step_title=>'File Properties'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18976025248736506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45038543970364723)
,p_plug_name=>'File Properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_FILES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47803125429638552)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38258945759819248)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(47803125429638552)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38259310496819248)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(47803125429638552)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38259700268819249)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(47803125429638552)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38250960755819239)
,p_name=>'P71_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38251311721819240)
,p_name=>'P71_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38251706761819240)
,p_name=>'P71_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_default=>'1'
,p_prompt=>'Status'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Enable/disable public access to file.'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38252677546819242)
,p_name=>'P71_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_prompt=>'File Name'
,p_source=>'FILE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'File name.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38253532419819243)
,p_name=>'P71_IS_DOWNLOAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_default=>'0'
,p_prompt=>'Attachment'
,p_source=>'IS_DOWNLOAD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Is file available for download in public application "Files" page.'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38254438051819243)
,p_name=>'P71_FILE_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_prompt=>'Description'
,p_source=>'FILE_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'File description displayed in public application "Files" page.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38255341644819244)
,p_name=>'P71_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_item_source_plug_id=>wwv_flow_imp.id(45038543970364723)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_inline_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38260840921819250)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38258945759819248)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38261394731819250)
,p_event_id=>wwv_flow_imp.id(38260840921819250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38258226770819247)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(45038543970364723)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form File Properties'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_FILES'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38258226770819247
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39244907607150829)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application Files Page Cache'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_UTIL'
,p_attribute_04=>'CACHE_PURGE_BY_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39244907607150829
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(39213215314831928)
,p_page_process_id=>wwv_flow_imp.id(39244907607150829)
,p_page_id=>71
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(39213457142831930)
,p_page_process_id=>wwv_flow_imp.id(39244907607150829)
,p_page_id=>71
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'11'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38260177976819249)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38260177976819249
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38257848125819247)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(45038543970364723)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form File Properties'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38257848125819247
);
wwv_flow_imp.component_end;
end;
/
