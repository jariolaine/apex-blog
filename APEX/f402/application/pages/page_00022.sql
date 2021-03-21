prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Select File(s) to Upload'
,p_page_mode=>'MODAL'
,p_step_title=>'Upload File(s)'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(18976025248736506)
,p_step_template=>wwv_flow_api.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20210321134857'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20749984140206608)
,p_plug_name=>'Upload File(s)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30331927761917804)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20779498341098494)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(30331927761917804)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20779776271098495)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(30331927761917804)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(20750758141206616)
,p_branch_name=>'Go To Confirm Overwrite File(s)'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_comment=>'Branch to confirm overwrite file(s)'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20750366562206612)
,p_name=>'P22_FILE_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20749984140206608)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File(s)'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548807733518243)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'REQUEST'
,p_attribute_10=>'Y'
,p_attribute_12=>'DROPZONE_BLOCK'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(20780700866101698)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(20779498341098494)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(20781184373101701)
,p_event_id=>wwv_flow_api.id(20780700866101698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(24909702684771836)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Process File(s)'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.file_upload(',
'  p_file_name => :P22_FILE_NAME',
')'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'File(s) uploaded.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This Close Dialog process condition handles file upload.',
'If file(s) already exists dialog isn''t closed and branch loads to confirm file overwrite'))
);
wwv_flow_api.component_end;
end;
/
