prompt --application/create_application
begin
--   Manifest
--     FLOW: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'BLOG_040000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Blog Administration')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BLOG-ADMIN')
,p_application_group=>wwv_flow_imp.id(90201743930425331)
,p_application_group_name=>'APEX Blog'
,p_application_group_static_id=>'apex-blog'
,p_application_group_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Blog applications.',
'Source code: https://github.com/jariolaine/apex-blog'))
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'B22C496AFD040C7B5F1E21FA4AC20C2D68FA779C3AF68FB8A6F3F4BB268E96B2'
,p_checksum_salt_last_reset_dt=>to_date('20200329211509','YYYYMMDDHH24MISS')
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_compatibility_mode=>'26.1'
,p_accessible_read_only=>'N'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'&P501_DISPLAY_DATE_FORMAT.'
,p_date_time_format=>'&P501_DISPLAY_DATE_FORMAT.'
,p_timestamp_format=>'&P501_DISPLAY_DATE_FORMAT.'
,p_timestamp_tz_format=>'&P501_DISPLAY_DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Blog administration application.',
'Source code: https://github.com/jariolaine/apex-blog'))
,p_authentication_id=>wwv_flow_imp.id(106908761779929719)
,p_populate_roles=>'A'
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'&P0_BLOG_APP_NAME.'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 24.2.11.20260126'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T:O:W'
,p_security_scheme=>wwv_flow_imp.id(110805652816947583)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'Y'
,p_error_handling_function=>'blog_util.apex_error_handler'
,p_oracle_text_function_type=>'EXPERT_SEARCH'
,p_tokenize_row_search=>'N'
,p_modernization_available=>'Y'
,p_substitution_string_01=>'WORKSPACE_COOKIE'
,p_substitution_string_02=>'BLOG_SELECTED_FILES_COLLECTION'
,p_substitution_value_02=>'SELECTED_FILES'
,p_substitution_string_03=>'BLOG_REPLACE_FILES_COLLECTION'
,p_substitution_value_03=>'EXISTING_FILES'
,p_substitution_string_04=>'BLOG_DEFAULT_TIMEFRAME'
,p_substitution_value_04=>'86400'
,p_last_updated_on=>wwv_flow_imp.dz('20260928175156Z')
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461311073714
,p_version_scn=>'50675080508349'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
,p_copyright_banner=>'License: https://raw.githubusercontent.com/jariolaine/apex-blog/master/LICENSE.txt'
,p_ai_remote_server_id=>114707404165421999
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:HOME:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_auto_dismiss_success_msg=>true
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(90896897889350262)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--default:t-TreeNav--styleA'
,p_css_file_urls=>'#APP_FILES#css/admin#MIN#.css'
,p_javascript_file_urls=>'#APP_FILES#js/admin#MIN#.js'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(91016837626350353)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
