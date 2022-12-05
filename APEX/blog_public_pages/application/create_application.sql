prompt --application/create_application
begin
--   Manifest
--     FLOW: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'BLOG_040000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Blog Public Pages')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BLOG')
,p_application_group=>wwv_flow_imp.id(7755621288593240)
,p_application_group_name=>'APEX Blog'
,p_application_group_comment=>'APEX Blog applications'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'79ABAEFD7AD8D73AC0DC0A616F42577F97F051356BED99D8EBB45C92C0F77585'
,p_checksum_salt_last_reset=>'20211127075325'
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_max_session_length_sec=>86400
,p_on_max_session_timeout_url=>'#LOGOUT_URL#'
,p_max_session_idle_sec=>43200
,p_on_max_idle_timeout_url=>'#LOGOUT_URL#'
,p_session_timeout_warning_sec=>0
,p_compatibility_mode=>'21.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'BROWSER'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'https://github.com/jariolaine/apex-blog'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_imp.id(25278990329788475)
,p_application_tab_set=>1
,p_logo_type=>'C'
,p_logo=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="z-app-logo">',
'  <span class="z-app-name">&G_APP_NAME.</span>',
'  <span class="z-app-desc">&G_APP_DESC.</span>',
'</span>'))
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&G_APP_VERSION.'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'#OWNER#.blog_util.apex_error_handler'
,p_tokenize_row_search=>'N'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221205155233'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>478
,p_print_server_type=>'INSTANCE'
,p_is_pwa=>'N'
,p_copyright_banner=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The MIT License (MIT)',
'',
'Copyright (c) 2021, #YEAR#, Jari Laine',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy of',
'this software and associated documentation files (the "Software"), to deal in',
'the Software without restriction, including without limitation the rights to',
'use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of',
'the Software, and to permit persons to whom the Software is furnished to do so,',
'subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all',
'copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS',
'FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR',
'COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER',
'IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN',
'CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'))
);
wwv_flow_imp.component_end;
end;
/
