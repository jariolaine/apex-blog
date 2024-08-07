prompt --application/pages/page_00501
begin
--   Manifest
--     PAGE: 00501
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
 p_id=>501
,p_name=>'My Profile'
,p_alias=>'MY-PROFILE'
,p_page_mode=>'MODAL'
,p_step_title=>'My Profile'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8928435152589675)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8857181938695778)
,p_plug_name=>'My Profile'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_BLOGGERS'
,p_query_where=>'id = :G_BLOGGER_ID'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41876878447408309)
,p_plug_name=>'Left'
,p_parent_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475523710518195)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_column=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45722084445325202)
,p_plug_name=>'Name & Email'
,p_parent_plug_id=>wwv_flow_imp.id(41876878447408309)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(8496813422518209)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64991614836107692)
,p_plug_name=>'Preferences'
,p_parent_plug_id=>wwv_flow_imp.id(41876878447408309)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(8496813422518209)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41876940295408310)
,p_plug_name=>'Right'
,p_parent_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475523710518195)
,p_plug_display_sequence=>40
,p_plug_grid_column_css_classes=>'padding-right-none'
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8857844438695779)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8858265274695779)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8857844438695779)
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
 p_id=>wwv_flow_imp.id(8857640492695778)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8857844438695779)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8864606652695787)
,p_name=>'P501_BLOGGER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_prompt=>'Name'
,p_source=>'BLOGGER_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_field_template=>wwv_flow_imp.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Your name.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8865877548695788)
,p_name=>'P501_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Email address for notification emails. Leave blank if you wish not receive notification emails.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8866259082695788)
,p_name=>'P501_BLOGGER_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(41876940295408310)
,p_item_source_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_prompt=>'Description'
,p_source=>'BLOGGER_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'HTML'
,p_attribute_02=>'FULL'
,p_attribute_03=>'MULTILINE'
,p_attribute_04=>'380'
,p_attribute_07=>'Y'
,p_attribute_25=>'CKEDITOR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27061385140689114)
,p_name=>'P501_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_item_source_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(37645870035287124)
,p_name=>'P501_PUBLISH_DESC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_imp.id(8857181938695778)
,p_prompt=>'Publish Description'
,p_source=>'PUBLISH_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Publish description in blog About page.'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45750979813491570)
,p_name=>'P501_DISPLAY_DATE_FORMAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(64991614836107692)
,p_item_default=>'G_USER_DATE_TIME_FORMAT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Display Date Format'
,p_source=>'G_USER_DATE_TIME_FORMAT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_help_text=>'Date format used in reports.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'DD.MM.YYYY HH24:MI:SS'
,p_quick_pick_value_01=>'DD.MM.YYYY HH24:MI:SS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45751319514491572)
,p_name=>'P501_INPUT_DATE_FORMAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(64991614836107692)
,p_item_default=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Input Date Format'
,p_source=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_help_text=>'Date format used in input fields.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'DD.MM.YYYY HH24:MI:SS'
,p_quick_pick_value_01=>'DD.MM.YYYY HH24:MI:SS'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27062727345689128)
,p_computation_sequence=>10
,p_computation_item=>'P501_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'G_BLOGGER_ID'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(45788317639650305)
,p_validation_name=>'Valid Display Date Format'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return blog_cm.is_date_format(',
'   p_value => :P501_DISPLAY_DATE_FORMAT',
'  ,p_err_mesg => :APP_TEXT$BLOG_VALIDATION_ERR_DATE_FORMAT',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(45750979813491570)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(45788617934652617)
,p_validation_name=>'Valid Input Date Format'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return blog_cm.is_date_format(',
'   p_value => :P501_INPUT_DATE_FORMAT',
'  ,p_err_mesg => :APP_TEXT$BLOG_VALIDATION_ERR_DATE_FORMAT',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(45751319514491572)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8858308031695779)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8858265274695779)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8859145576695781)
,p_event_id=>wwv_flow_imp.id(8858308031695779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45788891854655025)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Display Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_DISPLAY_DATE_FORMAT'
,p_attribute_03=>'P501_DISPLAY_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>45788891854655025
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45789130633656044)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Input Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_INPUT_DATE_FORMAT'
,p_attribute_03=>'P501_INPUT_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>45789130633656044
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8871718756695793)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8857181938695778)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form My Profile'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Profile Update Failed.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8857640492695778)
,p_internal_uid=>8871718756695793
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26381038521542603)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application About Page Cache'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_UTIL'
,p_attribute_04=>'CACHE_PURGE_BY_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8857640492695778)
,p_internal_uid=>26381038521542603
,p_process_comment=>'Purge public application about page cached region.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473718754283508)
,p_page_process_id=>wwv_flow_imp.id(26381038521542603)
,p_page_id=>501
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473917381283510)
,p_page_process_id=>wwv_flow_imp.id(26381038521542603)
,p_page_id=>501
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'12'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38474134770283512)
,p_page_process_id=>wwv_flow_imp.id(26381038521542603)
,p_page_id=>501
,p_name=>'p_user_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(33489668168471576)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8857640492695778)
,p_process_success_message=>'Profile Updated.'
,p_internal_uid=>33489668168471576
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27061285324689113)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8857181938695778)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form My Profile'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>27061285324689113
);
wwv_flow_imp.component_end;
end;
/
