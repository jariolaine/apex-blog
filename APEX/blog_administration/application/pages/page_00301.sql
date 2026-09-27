prompt --application/pages/page_00301
begin
--   Manifest
--     PAGE: 00301
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>301
,p_name=>'Edit File Properties'
,p_alias=>'EDIT-FILE-PROPERTIES'
,p_page_mode=>'MODAL'
,p_step_title=>'Properties'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(101422147890568597)
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(152287378789610594)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_escape_on_http_output=>'N'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149522797330336765)
,p_plug_name=>'File Properties'
,p_static_id=>'file-properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_escape_on_http_output=>'N'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_FILES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_ai_enabled=>false
,p_updated_on=>wwv_flow_imp.dz('20250414044901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104494486859972002)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(152287378789610594)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104494841705972002)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(152287378789610594)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104495252618972001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(152287378789610594)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124933415751325545)
,p_name=>'P301_ETAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_source=>'ETAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201062446Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142739281158791261)
,p_name=>'P301_FILE_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_prompt=>'Description'
,p_post_element_text=>'"BLOG_BTN_AI_ASSISTANT"'
,p_source=>'FILE_DESC'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>1609121967514267634
,p_item_css_classes=>'blog-item blog-postText'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'File description displayed in public application "Files" page.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(123117427667073240)
,p_name=>'P301_FILE_DIR'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_prompt=>'Directory'
,p_source=>'FILE_DIR'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FILE_DIRECTORIES'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Root'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_help_text=>'File directory in repository.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142737520653791260)
,p_name=>'P301_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_prompt=>'Name'
,p_source=>'FILE_NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'File name.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(123590826219162638)
,p_name=>'P301_FILE_PATH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_source=>'FILE_PATH'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201062446Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142735803862791257)
,p_name=>'P301_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201062446Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142736549868791258)
,p_name=>'P301_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_default=>'1'
,p_prompt=>'Status'
,p_source=>'IS_ACTIVE'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'  Enable/disable public access to file.',
'</p>',
'',
'<p>',
'  <strong>When object storage is used as file storage:</strong>',
'</p>',
'<p>',
'  The attribute does not block access to the file.',
'  It <strong>only hides</strong> the file from the public application <strong>Files page</strong>,',
'  if the <strong>Shared</strong> attribute of the file is <strong>Yes</strong>.',
'</p>',
'<p>',
'  Files with <strong>disabled</strong> status are not synchronized to <strong>object storage</strong>.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'Disabled',
  'off_value', '0',
  'on_label', 'Enabled',
  'on_value', '1',
  'use_defaults', 'N')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142738375526791261)
,p_name=>'P301_IS_DOWNLOAD'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_default=>'0'
,p_prompt=>'Shared'
,p_source=>'IS_DOWNLOAD'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Is file available for download in public application "Files" page.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_label', 'No',
  'off_value', '0',
  'on_label', 'Yes',
  'on_value', '1',
  'use_defaults', 'N')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142740184751791262)
,p_name=>'P301_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_css_classes=>'blog-item blog-noItemHelp'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_inline_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414044902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(102895415784185625)
,p_name=>'P301_OLD_FILE_PATH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_source=>'P301_FILE_PATH'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201062446Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(142736154828791258)
,p_name=>'P301_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_item_source_plug_id=>wwv_flow_imp.id(149522797330336765)
,p_source=>'ROW_VERSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201062446Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(104495924728971995)
,p_computation_sequence=>20
,p_computation_item=>'P301_FILE_DIR'
,p_static_id=>'p301-file-dir'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'trim( both ''/'' from :P301_FILE_DIR )'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(104496377210971994)
,p_computation_sequence=>40
,p_computation_item=>'P301_FILE_PATH'
,p_static_id=>'p301-file-path'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_file.format_file_path(',
'  p_file_name => :P301_FILE_NAME',
', p_dir       => :P301_FILE_DIR',
')'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104500767465971991)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(104494486859972002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104501249670971990)
,p_event_id=>wwv_flow_imp.id(104500767465971991)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96832451820013458)
,p_name=>'Initialize assistant button action'
,p_static_id=>'initialize-assistant-button-action'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_created_on=>wwv_flow_imp.dz('20250119101658Z')
,p_updated_on=>wwv_flow_imp.dz('20250119102100Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96832810180013463)
,p_event_id=>wwv_flow_imp.id(96832451820013458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_FILE_DESC'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.actions.add({',
    '  name: "gen-ai-assistant"',
    ', action: ( event, element, args ) => { ',
    '    apex.event.trigger( this.affectedElements, "action-open-assistant", args );',
    '  }',
    '});')))).to_clob
,p_created_on=>wwv_flow_imp.dz('20250119101658Z')
,p_updated_on=>wwv_flow_imp.dz('20250119102100Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96833266677015104)
,p_name=>'Open AI assistant'
,p_static_id=>'open-ai-assistant'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_FILE_DESC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-open-assistant'
,p_created_on=>wwv_flow_imp.dz('20250119101715Z')
,p_updated_on=>wwv_flow_imp.dz('20250201055526Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96833681321015104)
,p_event_id=>wwv_flow_imp.id(96833266677015104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-ai-assistant'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'DIALOG',
  'use_response_item', 'P301_FILE_DESC',
  'use_response_type', 'ITEM')).to_clob
,p_ai_welcome_message=>'&APP_TEXT$BLOG_MSG_AI_ASSISTANT_WELCOME.'
,p_created_on=>wwv_flow_imp.dz('20250119101715Z')
,p_updated_on=>wwv_flow_imp.dz('20250201055526Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(105758299707179018)
,p_name=>'Process Shared Attribute'
,p_static_id=>'process-shared-attribute'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_IS_DOWNLOAD'
,p_condition_element=>'P301_IS_DOWNLOAD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_updated_on=>wwv_flow_imp.dz('20250224171105Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105758524375179021)
,p_event_id=>wwv_flow_imp.id(105758299707179018)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_IS_ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105758515520179020)
,p_event_id=>wwv_flow_imp.id(105758299707179018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_IS_ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105758677082179022)
,p_event_id=>wwv_flow_imp.id(105758299707179018)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_IS_ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105758376737179019)
,p_event_id=>wwv_flow_imp.id(105758299707179018)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_IS_ACTIVE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104498972260971992)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22052849619139901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104497041010971994)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Delete Object'
,p_static_id=>'delete-object'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'BLOG_OCI_OS',
  'package_method', 'DELETE_OBJECT',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(104494841705972002)
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>22050918369139903
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104498595757971992)
,p_page_process_id=>wwv_flow_imp.id(104497041010971994)
,p_page_id=>301
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104497546773971993)
,p_page_process_id=>wwv_flow_imp.id(104497041010971994)
,p_page_id=>301
,p_name=>'p_file_path'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P301_FILE_PATH'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104498076846971993)
,p_page_process_id=>wwv_flow_imp.id(104497041010971994)
,p_page_id=>301
,p_name=>'p_if_match'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P301_ETAG'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104493507719972005)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(149522797330336765)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form File Properties'
,p_static_id=>'initialize-form-file-properties'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22047385078139914
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104493817237972004)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(149522797330336765)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form File Properties'
,p_static_id=>'process-form-file-properties'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22047694596139913
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104499419627971992)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application Files Page Cache'
,p_static_id=>'purge-public-application-files-page-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_UTIL',
  'package_method', 'CACHE_PURGE_BY_PAGE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22053296986139901
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104499907767971992)
,p_page_process_id=>wwv_flow_imp.id(104499419627971992)
,p_page_id=>301
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104500386157971992)
,p_page_process_id=>wwv_flow_imp.id(104499419627971992)
,p_page_id=>301
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'11'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(102895427512185626)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Rename Object'
,p_static_id=>'rename-object'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'BLOG_OCI_OS',
  'package_method', 'RENAME_OBJECT',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(104495252618972001)
,p_process_when=>'P301_FILE_PATH'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_process_when2=>'&P301_OLD_FILE_PATH.'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>20449304870353535
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102895783422185629)
,p_page_process_id=>wwv_flow_imp.id(102895427512185626)
,p_page_id=>301
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102896111838185632)
,p_page_process_id=>wwv_flow_imp.id(102895427512185626)
,p_page_id=>301
,p_name=>'p_new_file_path'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P301_FILE_PATH'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102895916750185630)
,p_page_process_id=>wwv_flow_imp.id(102895427512185626)
,p_page_id=>301
,p_name=>'p_old_file_path'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P301_OLD_FILE_PATH'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102895996784185631)
,p_page_process_id=>wwv_flow_imp.id(102895427512185626)
,p_page_id=>301
,p_name=>'p_old_if_match'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P301_ETAG'
);
wwv_flow_imp.component_end;
end;
/
