prompt --application/pages/page_20013
begin
--   Manifest
--     PAGE: 20013
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
 p_id=>20013
,p_name=>'Object Storage Settings'
,p_alias=>'OBJECT-STORAGE-SETTINGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Object Storage'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>wwv_flow_imp.id(90902526034350271)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(101081211692933338)
,p_plug_name=>'Object Storage'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  t1.row_version      as row_version',
', t1.attribute_name   as attribute_name',
', t1.attribute_value  as bucket_name',
', apex_application_admin.get_build_option_status(',
'    p_application_id     => :APP_ID',
'  , p_build_option_name  => ''BLOG_FEATURE_OCI_OBJECT_STORAGE''',
'  )                   as build_status',
'from blog_settings t1'))
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(133767302686271980)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(90917725665350280)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_OBJECT_STORAGE_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(199772602566389596)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_translate_title=>'N'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101084718707921293)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(199772602566389596)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101085066599921292)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(199772602566389596)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_show_processing=>'Y'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(101077117292933297)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100873062231005395)
,p_name=>'P20013_BUILD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_item_source_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_prompt=>'Status'
,p_source=>'BUILD_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(90994829054350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
,p_attribute_02=>'INCLUDE'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'EXCLUDE'
,p_attribute_05=>'Disabled'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105757951049179015)
,p_name=>'P20013_BUCKET_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_item_source_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_prompt=>'Bucket Name'
,p_source=>'BUCKET_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(115296811434141415)
,p_name=>'P20013_ATTRIBUTE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_item_source_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_source=>'ATTRIBUTE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(115297223284141420)
,p_name=>'P20013_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_item_source_plug_id=>wwv_flow_imp.id(101081211692933338)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(115297169834141419)
,p_computation_sequence=>10
,p_computation_item=>'P20013_ATTRIBUTE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'G_OCI_OS_BUCKET'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(104918615574388308)
,p_validation_name=>'P20013_BUCKET is not null'
,p_validation_sequence=>30
,p_validation=>'P20013_BUCKET_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value if object storage is enabled.'
,p_validation_condition=>'P20013_BUILD_STATUS'
,p_validation_condition2=>'INCLUDE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(105757951049179015)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101101761398573004)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(101084718707921293)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101102123232573000)
,p_event_id=>wwv_flow_imp.id(101101761398573004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104920231986388325)
,p_name=>'Process Feature Status'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20013_BUILD_STATUS'
,p_condition_element=>'P20013_BUILD_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INCLUDE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104920373709388326)
,p_event_id=>wwv_flow_imp.id(104920231986388325)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20013_BUCKET_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104920452862388327)
,p_event_id=>wwv_flow_imp.id(104920231986388325)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20013_BUCKET_NAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(115297040761141418)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(101081211692933338)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Object Storage'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_oci_os.set_object_storage(',
'  p_bucket_name   => :P20013_BUCKET_NAME',
', p_build_status  => :P20013_BUILD_STATUS',
');'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Object storage settings updated.'
,p_internal_uid=>32850918119309327
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(105749916372210973)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application Files Page Cache'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_UTIL'
,p_attribute_04=>'CACHE_PURGE_BY_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>23303793730378882
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(105750311920210972)
,p_page_process_id=>wwv_flow_imp.id(105749916372210973)
,p_page_id=>20013
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(105750739317210972)
,p_page_process_id=>wwv_flow_imp.id(105749916372210973)
,p_page_id=>20013
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'11'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(115296702948141414)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(101081211692933338)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Object Storage Settings'
,p_internal_uid=>32850580306309323
);
wwv_flow_imp.component_end;
end;
/
