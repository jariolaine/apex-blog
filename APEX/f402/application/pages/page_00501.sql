prompt --application/pages/page_00501
begin
--   Manifest
--     PAGE: 00501
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>501
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'My Profile'
,p_page_mode=>'MODAL'
,p_step_title=>'My Profile'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8928435152589675)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220412214103'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8857181938695778)
,p_plug_name=>'My Profile'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_BLOGGERS'
,p_query_where=>'id = :G_BLOGGER_ID'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41876878447408309)
,p_plug_name=>'Left'
,p_parent_plug_id=>wwv_flow_api.id(8857181938695778)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475523710518195)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_column=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45722084445325202)
,p_plug_name=>'Name & Email'
,p_parent_plug_id=>wwv_flow_api.id(41876878447408309)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(8496813422518209)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(64991614836107692)
,p_plug_name=>'Preferences'
,p_parent_plug_id=>wwv_flow_api.id(41876878447408309)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(8496813422518209)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41876940295408310)
,p_plug_name=>'Right'
,p_parent_plug_id=>wwv_flow_api.id(8857181938695778)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475523710518195)
,p_plug_display_sequence=>40
,p_plug_grid_column_css_classes=>'padding-right-none'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8857844438695779)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8858265274695779)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8857844438695779)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8857640492695778)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(8857844438695779)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8864606652695787)
,p_name=>'P501_BLOGGER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_prompt=>'Name'
,p_source=>'BLOGGER_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Your name.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8865877548695788)
,p_name=>'P501_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Email address for notification emails. Leave blank if you wish not receive notification emails.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8866259082695788)
,p_name=>'P501_BLOGGER_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41876940295408310)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_prompt=>'Description'
,p_source=>'BLOGGER_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>4000
,p_cMaxlength=>4000
,p_cHeight=>20
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ( options ) {',
'  options.contentsCss = ["&APP_FILES.css/chkeditor.min.css"];',
'  options = blog.admin.editorInit(options);',
'  options.disallowedContent = "";',
'  options.allowedContent.script = true;',
'  return options;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'moonocolor'
,p_attribute_05=>'top'
,p_attribute_06=>'4'
,p_attribute_09=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27061385140689114)
,p_name=>'P501_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8857181938695778)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37643942322287105)
,p_name=>'P501_USER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_prompt=>'User Name'
,p_source=>'APEX_USERNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_api.id(24687280101070827)
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37645870035287124)
,p_name=>'P501_PUBLISH_DESC'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(45722084445325202)
,p_item_source_plug_id=>wwv_flow_api.id(8857181938695778)
,p_prompt=>'Publish Description'
,p_source=>'PUBLISH_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_help_text=>'Publish description in blog About page.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43469181299898223)
,p_name=>'P501_DEFAULT_TIMEFRAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(64991614836107692)
,p_use_cache_before_default=>'NO'
,p_item_default=>'BLOG_DEFAULT_TIMEFRAME'
,p_item_default_type=>'ITEM'
,p_prompt=>'Default Timeframe'
,p_source=>'BLOG_DEFAULT_TIMEFRAME'
,p_source_type=>'PREFERENCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Activity reports default timeframe.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45750979813491570)
,p_name=>'P501_DISPLAY_DATE_FORMAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(64991614836107692)
,p_item_default=>'G_USER_DATE_TIME_FORMAT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Display Date Format'
,p_source=>'G_USER_DATE_TIME_FORMAT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_help_text=>'Date format used in reports.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'SINCE'
,p_quick_pick_value_01=>'SINCE'
,p_quick_pick_label_02=>'DD.MM.YYYY HH24:MI'
,p_quick_pick_value_02=>'DD.MM.YYYY HH24:MI'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45751319514491572)
,p_name=>'P501_INPUT_DATE_FORMAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(64991614836107692)
,p_item_default=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Input Date Format'
,p_source=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_help_text=>'Date format used in input fields.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'DD.MM.YYYY'
,p_quick_pick_value_01=>'DD.MM.YYYY'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(27062727345689128)
,p_computation_sequence=>10
,p_computation_item=>'P501_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'G_BLOGGER_ID'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(45788317639650305)
,p_validation_name=>'Valid Display Date Format'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_date_format(',
'   p_value => :P501_DISPLAY_DATE_FORMAT',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_IS_DATE_FORMAT''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P501_DISPLAY_DATE_FORMAT'
,p_validation_condition2=>'SINCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(45750979813491570)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(45788617934652617)
,p_validation_name=>'Valid Input Date Format'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_date_format(',
'   p_value => :P501_INPUT_DATE_FORMAT',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_IS_DATE_FORMAT''',
');'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(45751319514491572)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8858308031695779)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8858265274695779)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8859145576695781)
,p_event_id=>wwv_flow_api.id(8858308031695779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45788891854655025)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Display Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_DISPLAY_DATE_FORMAT'
,p_attribute_03=>'P501_DISPLAY_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45789130633656044)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Input Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_INPUT_DATE_FORMAT'
,p_attribute_03=>'P501_INPUT_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(43469257085898224)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Default Timeframe'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_DEFAULT_TIMEFRAME'
,p_attribute_03=>'P501_DEFAULT_TIMEFRAME'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45789440480656875)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Application Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_session_state(''G_USER_DATE_TIME_FORMAT'', :P501_DISPLAY_DATE_FORMAT, false);',
'apex_util.set_session_state(''G_USER_INPUT_DATE_TIME_FORMAT'', :P501_INPUT_DATE_FORMAT, false);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8871718756695793)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8857181938695778)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form My Profile'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Profile Update Failed.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8857640492695778)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26381038521542603)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Purge Public Application Cache'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 12',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8857640492695778)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33489668168471576)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(8857640492695778)
,p_process_success_message=>'Profile Updated.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27061285324689113)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(8857181938695778)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form My Profile'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
