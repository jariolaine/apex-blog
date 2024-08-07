prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'&APP_TEXT$BLOG_APP_NAME. - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8930100593603171)
,p_step_template=>wwv_flow_imp.id(8455602087518179)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8575301514518303)
,p_plug_name=>'&APP_TEXT$BLOG_APP_NAME.'
,p_icon_css_classes=>'fa-sign-in fa-lg u-color-31'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8496352815518209)
,p_plug_display_sequence=>10
,p_location=>null
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8579957534518310)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20999976530414726)
,p_plug_name=>'Another Identity Provider'
,p_parent_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'"SIGN_IN_USING_ANOTHER_IDENTITY_PROVIDER"'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_application_build_options',
'where 1 = 1',
'  and application_id = :APP_ID',
'  and build_option_status = ''Include''',
'  and lower( build_option_name ) like ''% authentication''',
' having count(1) > 1'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region is displayed if both authentication methods are enabled by build options'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59284401267356420)
,p_plug_name=>'Google Authentication'
,p_parent_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_region_css_classes=>'t-Login-buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_required_patch=>wwv_flow_imp.id(35675193135740905)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30587556497457048)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(59284401267356420)
,p_button_name=>'LOGIN_GOOGLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Sign in with Google'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:HOME:&SESSION.:APEX_AUTHENTICATION=Google:&DEBUG.:::'
,p_button_css_classes=>'u-bold u-color-39'
,p_icon_css_classes=>'fa-google'
,p_required_patch=>wwv_flow_imp.id(35675193135740905)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8578072273518308)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign in'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-apex'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8575764844518304)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_prompt=>'Username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8576105457518305)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_prompt=>'Password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8577148828518307)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8575301514518303)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38477391642283544)
,p_computation_sequence=>10
,p_computation_item=>'P9999_REMEMBER'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'Y'
,p_compute_when=>'P9999_USERNAME'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8578843525518309)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'SEND_LOGIN_USERNAME_COOKIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_internal_uid=>8578843525518309
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477482362283545)
,p_page_process_id=>wwv_flow_imp.id(8578843525518309)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477521411283546)
,p_page_process_id=>wwv_flow_imp.id(8578843525518309)
,p_page_id=>9999
,p_name=>'p_cookie_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477624005283547)
,p_page_process_id=>wwv_flow_imp.id(8578843525518309)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':P9999_REMEMBER = ''Y'''
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8578406811518309)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_internal_uid=>8578406811518309
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477786995283548)
,p_page_process_id=>wwv_flow_imp.id(8578406811518309)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477841722283549)
,p_page_process_id=>wwv_flow_imp.id(8578406811518309)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477926978283550)
,p_page_process_id=>wwv_flow_imp.id(8578406811518309)
,p_page_id=>9999
,p_name=>'p_uppercase_username'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38590005503274301)
,p_page_process_id=>wwv_flow_imp.id(8578406811518309)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8579610184518310)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_internal_uid=>8579610184518310
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8579277880518310)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Get Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'GET_LOGIN_USERNAME_COOKIE'
,p_required_patch=>wwv_flow_imp.id(35674953070739317)
,p_internal_uid=>8579277880518310
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477038839283541)
,p_page_process_id=>wwv_flow_imp.id(8579277880518310)
,p_page_id=>9999
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38477115365283542)
,p_page_process_id=>wwv_flow_imp.id(8579277880518310)
,p_page_id=>9999
,p_name=>'p_cookie_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp.component_end;
end;
/
