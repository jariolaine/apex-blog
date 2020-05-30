prompt --application/pages/page_00503
begin
wwv_flow_api.create_page(
 p_id=>503
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'User Preferences'
,p_page_mode=>'MODAL'
,p_step_title=>'My Preferences '
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8928435152589675)
,p_step_template=>wwv_flow_api.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200509090156'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19240916739616131)
,p_plug_name=>'Preferences'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19254197166688392)
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
 p_id=>wwv_flow_api.id(8968922243638063)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19254197166688392)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8969369173638064)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19254197166688392)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8972349028638067)
,p_branch_name=>'Go To Process Succeeded'
,p_branch_action=>'f?p=&APP_ID.:500:&SESSION.:BLOG_MSG_PREFERENCES_UPDATED:&DEBUG.:&APP_PAGE_ID.::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8642725922195004)
,p_name=>'P503_DISPLAY_DATE_FORMAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(19240916739616131)
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
 p_id=>wwv_flow_api.id(19019686192830220)
,p_name=>'P503_INPUT_DATE_FORMAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(19240916739616131)
,p_item_default=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Input Date Time Format'
,p_source=>'G_USER_INPUT_DATE_TIME_FORMAT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'DD.MM.YYYY HH24:MI'
,p_quick_pick_value_01=>'DD.MM.YYYY HH24:MI'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8642832030195005)
,p_validation_name=>'Valid Display Date Format'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_date_format(',
'   p_value => :P503_DISPLAY_DATE_FORMAT',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_IS_DATE_FORMAT''',
');'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P503_DISPLAY_DATE_FORMAT'
,p_validation_condition2=>'SINCE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(8642725922195004)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19019838178830222)
,p_validation_name=>'Valid Input Date Format'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_cm.is_date_format(',
'   p_value => :P503_INPUT_DATE_FORMAT',
'  ,p_err_mesg => ''BLOG_VALIDATION_ERR_IS_DATE_FORMAT''',
');'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(19019686192830220)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8971362539638066)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(8968922243638063)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8971841406638066)
,p_event_id=>wwv_flow_api.id(8971362539638066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8642917109195006)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Display Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_DISPLAY_DATE_FORMAT'
,p_attribute_03=>'P503_DISPLAY_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19019771609830221)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Update Input Date Format'
,p_attribute_01=>'SET_PREFERENCE_TO_ITEM_VALUE'
,p_attribute_02=>'BLOG_INPUT_DATE_FORMAT'
,p_attribute_03=>'P503_INPUT_DATE_FORMAT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
