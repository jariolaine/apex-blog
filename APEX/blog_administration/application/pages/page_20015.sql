prompt --application/pages/page_20015
begin
--   Manifest
--     PAGE: 20015
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
 p_id=>20015
,p_name=>'Language AI Configuration'
,p_alias=>'LANGUAGE-AI-CONFIGURATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Language AI'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91020498123350380)
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_on=>wwv_flow_imp.dz('20250630054936Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(133113396802091326)
,p_plug_name=>'Language AI'
,p_region_template_options=>'#DEFAULT#:t-Region-orderBy--center'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  t1.row_version      as row_version',
', t1.attribute_name   as attribute_name',
', t1.attribute_value  as compartment_id',
', apex_application_admin.get_build_option_status(',
'    p_application_id     => :APP_ID',
'  , p_build_option_name  => blog_ai.get_param_value( ''lang_ai_build_option'' )',
'  )                   as build_status',
', (',
'    select',
'      lkp.base_url',
'    from apex_workspace_remote_servers lkp',
'    where 1 = 1',
'      and lkp.remote_server_static_id = blog_ai.get_param_value( ''lang_ai_static_id'' )',
'  )                   as base_url',
'from blog_settings t1'))
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
,p_updated_on=>wwv_flow_imp.dz('20250630031225Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(165799487795429968)
,p_plug_name=>'Information'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'&APP_TEXT$BLOG_MSG_LANGUAGE_AI_INFO!RAW.'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(231804787675547584)
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
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(114479888946990029)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(231804787675547584)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(114480318868990027)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(231804787675547584)
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
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(114486729113989992)
,p_branch_name=>'Go to Page 20010'
,p_branch_action=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100708515115637212)
,p_name=>'P20015_BASE_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_item_source_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_prompt=>'Base URL'
,p_source=>'BASE_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'URL',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20250414021705Z')
,p_updated_on=>wwv_flow_imp.dz('20250630022119Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(115296168584141409)
,p_name=>'P20015_ATTRIBUTE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_item_source_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_source=>'ATTRIBUTE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201042630Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(115297330099141421)
,p_name=>'P20015_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_item_source_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201042630Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(132905817679163344)
,p_name=>'P20015_BUILD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_item_source_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_prompt=>'Status'
,p_source=>'BUILD_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137790706497336964)
,p_name=>'P20015_COMPARTMENT_OCID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_item_source_plug_id=>wwv_flow_imp.id(133113396802091326)
,p_prompt=>'Compartment ID'
,p_source=>'COMPARTMENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_inline_help_text=>'The compartment OCID for which the user has been granted access.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(115296619986141413)
,p_computation_sequence=>10
,p_computation_item=>'P20015_ATTRIBUTE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'blog_ai.get_param_value( ''lang_ai_compartment_param_name'' )'
,p_updated_on=>wwv_flow_imp.dz('20250630031225Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(114481332454990011)
,p_validation_name=>'P20015_COMPARTMENT_OCID is not null'
,p_validation_sequence=>30
,p_validation=>'P20015_COMPARTMENT_OCID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value if language AI is enabled.'
,p_validation_condition=>'P20015_BUILD_STATUS'
,p_validation_condition2=>'INCLUDE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(137790706497336964)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_updated_on=>wwv_flow_imp.dz('20250119065230Z')
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(15961845586299925)
,p_validation_name=>'P20015_BASE_URL is not null'
,p_validation_sequence=>40
,p_validation=>'P20015_BASE_URL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have a value if language AI is enabled.'
,p_validation_condition=>'P20015_BUILD_STATUS'
,p_validation_condition2=>'INCLUDE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(100708515115637212)
,p_error_display_location=>'INLINE_WITH_FIELD'
,p_created_on=>wwv_flow_imp.dz('20250630022204Z')
,p_updated_on=>wwv_flow_imp.dz('20250630022204Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(114484327590989997)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(114479888946990029)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(114484851989989995)
,p_event_id=>wwv_flow_imp.id(114484327590989997)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(114485227016989994)
,p_name=>'Process Feature Status'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20015_BUILD_STATUS'
,p_condition_element=>'P20015_BUILD_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'INCLUDE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_updated_on=>wwv_flow_imp.dz('20250629041631Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(114485792751989994)
,p_event_id=>wwv_flow_imp.id(114485227016989994)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20015_COMPARTMENT_OCID,P20015_BASE_URL'
,p_updated_on=>wwv_flow_imp.dz('20250629041631Z')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(114486250407989993)
,p_event_id=>wwv_flow_imp.id(114485227016989994)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20015_COMPARTMENT_OCID,P20015_BASE_URL'
,p_updated_on=>wwv_flow_imp.dz('20250629041631Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(115296514647141412)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(133113396802091326)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form - Language AI'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_ai.set_lang_ai(',
'  p_build_status    => :P20015_BUILD_STATUS',
', p_base_url        => :P20015_BASE_URL',
', p_compartment_id  => :P20015_COMPARTMENT_OCID',
');'))
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Language AI settings updated.'
,p_internal_uid=>32850392005309321
,p_updated_on=>wwv_flow_imp.dz('20250630054936Z')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(115296105978141408)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(133113396802091326)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form - Language AI Settings'
,p_internal_uid=>32849983336309317
,p_updated_on=>wwv_flow_imp.dz('20250630054936Z')
);
wwv_flow_imp.component_end;
end;
/
