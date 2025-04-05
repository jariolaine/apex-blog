prompt --application/pages/page_00302
begin
--   Manifest
--     PAGE: 00302
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>302
,p_name=>'Upload File'
,p_alias=>'UPLOAD-FILE'
,p_page_mode=>'MODAL'
,p_step_title=>'Upload File(s)'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(101422147890568597)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(172053312893799528)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(177426977262743184)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103928720726786989)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(177426977262743184)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103929092850786988)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(177426977262743184)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(103951739503537933)
,p_branch_name=>'Go To Confirm Object Overwrite'
,p_branch_action=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP,:P303_ACTION:OCI'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(103929092850786988)
,p_branch_sequence=>10
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_branch_comment=>'Branch to confirm overwrite file(s)'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(105757609970179011)
,p_branch_name=>'Go To Confirm File Overwrite'
,p_branch_action=>'f?p=&APP_ID.:303:&SESSION.::&DEBUG.:RP,:P303_ACTION:DB'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(103929092850786988)
,p_branch_sequence=>20
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
,p_branch_comment=>'Branch to confirm overwrite file(s)'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(160581785281032986)
,p_name=>'P302_CACHE_CONTROL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(172053312893799528)
,p_prompt=>'Cache Control'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'margin-bottom-sm'
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_inline_help_text=>'The optional Cache-Control header that defines the caching behavior value to be returned in GetObject and HeadObject responses. Specifying values for this header has no effect on Object Storage behavior. Programs that read the object determine what t'
||'o do based on the value provided. For example, you could use this header to identify objects that require caching restrictions.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'1 hour'
,p_quick_pick_value_01=>'max-age-3600'
,p_quick_pick_label_02=>'10 hours'
,p_quick_pick_value_02=>'max-age=36000'
,p_quick_pick_label_03=>'1 day'
,p_quick_pick_value_03=>'max-age=86400'
,p_quick_pick_label_04=>'10 days'
,p_quick_pick_value_04=>'max-age=864000'
,p_quick_pick_label_05=>'1 month'
,p_quick_pick_value_05=>'max-age=26280000'
,p_quick_pick_label_06=>'10 months'
,p_quick_pick_value_06=>'max-age=262800000'
,p_quick_pick_label_07=>'No cache'
,p_quick_pick_value_07=>'no-cache'
,p_quick_pick_link_attr=>'class="u-bold x-quickPick"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(170712928681880771)
,p_name=>'P302_DIR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(172053312893799528)
,p_prompt=>'Directory'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FILE_DIRECTORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'  trim( both ''/'' from file_dir ) as return_value',
'from blog_files',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'( Root )'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(172054736391799507)
,p_name=>'P302_FILE_NAMES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(172053312893799528)
,p_prompt=>'File Name(s)'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'REQUEST'
,p_attribute_10=>'Y'
,p_attribute_12=>'DROPZONE_BLOCK'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182310994348113775)
,p_name=>'P302_EXTRACT'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(172053312893799528)
,p_prompt=>'Unzip File(s)'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_inline_help_text=>'If the file is a zip archive, upload the extracted files.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103933445832786986)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(103928720726786989)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103933957389786985)
,p_event_id=>wwv_flow_imp.id(103933445832786986)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103929659562786988)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Process Object Upload'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_OCI_OS'
,p_attribute_04=>'UPLOAD_OBJECT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>21483536920954897
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102893679956185608)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'BLOG_REPLACE_FILES_COLLECTION'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103930181229786988)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_file_names'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P302_FILE_NAMES'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103930711654786987)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_dir'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P302_DIR'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103931209600786987)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_extract'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P302_EXTRACT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103931698371786986)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>80
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103932164783786986)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_cache_control'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P302_CACHE_CONTROL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103932675922786986)
,p_page_process_id=>wwv_flow_imp.id(103929659562786988)
,p_page_id=>302
,p_name=>'p_overwrite_file'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104917229227388295)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Process File Upload'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_FILE'
,p_attribute_04=>'UPLOAD_FILE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>22471106585556204
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104917375174388296)
,p_page_process_id=>wwv_flow_imp.id(104917229227388295)
,p_page_id=>302
,p_name=>'p_file_names'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P302_FILE_NAMES'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104917513593388297)
,p_page_process_id=>wwv_flow_imp.id(104917229227388295)
,p_page_id=>302
,p_name=>'p_dir'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P302_DIR'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104917586842388298)
,p_page_process_id=>wwv_flow_imp.id(104917229227388295)
,p_page_id=>302
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'BLOG_REPLACE_FILES_COLLECTION'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104917815538388300)
,p_page_process_id=>wwv_flow_imp.id(104917229227388295)
,p_page_id=>302
,p_name=>'p_extract'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P302_EXTRACT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104917825755388301)
,p_page_process_id=>wwv_flow_imp.id(104917229227388295)
,p_page_id=>302
,p_name=>'p_overwrite_file'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103933090244786986)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not apex_collection.collection_exists( :BLOG_REPLACE_FILES_COLLECTION )',
''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Object(s) uploaded.'
,p_internal_uid=>21486967602954895
);
wwv_flow_imp.component_end;
end;
/
