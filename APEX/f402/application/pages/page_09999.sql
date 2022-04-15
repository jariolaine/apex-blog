prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'&G_APP_NAME. - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8930100593603171)
,p_step_template=>wwv_flow_api.id(8455602087518179)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220414072623'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8575301514518303)
,p_plug_name=>'&G_APP_NAME.'
,p_icon_css_classes=>'fa-sign-in fa-lg u-color-31'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8496352815518209)
,p_plug_display_sequence=>10
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8579957534518310)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(8575301514518303)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20999976530414726)
,p_plug_name=>'Another Identity Provider'
,p_parent_plug_id=>wwv_flow_api.id(8575301514518303)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'"SIGN_IN_USING_ANOTHER_IDENTITY_PROVIDER"'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'   p_application_id     => :APP_ID',
'  ,p_build_option_name  => ''Use APEX authentication''',
') = ''INCLUDE'''))
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_api.id(35675193135740905)
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59284401267356420)
,p_plug_name=>'Google Authentication'
,p_parent_plug_id=>wwv_flow_api.id(8575301514518303)
,p_region_css_classes=>'t-Login-buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(35675193135740905)
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30587556497457048)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(59284401267356420)
,p_button_name=>'LOGIN_GOOGLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(8549115324518244)
,p_button_image_alt=>'Sign in with Google'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:HOME:&SESSION.:APEX_AUTHENTICATION=Google:&DEBUG.:::'
,p_button_css_classes=>'u-bold'
,p_required_patch=>wwv_flow_api.id(35675193135740905)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8578072273518308)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(8575301514518303)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(8549115324518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign in'
,p_button_position=>'NEXT'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8575764844518304)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8575301514518303)
,p_prompt=>'Username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8576105457518305)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8575301514518303)
,p_prompt=>'Password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8577148828518307)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8575301514518303)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(8576357010518305)||'.'
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
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
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8578843525518309)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8578406811518309)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8579610184518310)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8579277880518310)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_api.id(35674953070739317)
);
wwv_flow_api.component_end;
end;
/
