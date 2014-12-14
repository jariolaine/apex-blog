set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 290 - Blog Reader
--
-- Application Export:
--   Application:     290
--   Name:            Blog Reader
--   Date and Time:   16:14 Sunday December 14, 2014
--   Exported By:     LAINFJAR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.4.00.08
--   Instance ID:     71406128538984
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     21
--     Items:                   47
--     Computations:            47
--     Validations:             16
--     Processes:               23
--     Regions:                 33
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                 18
--       Processes:              3
--       Computations:           7
--       Build Options:          1
--     Navigation:
--       Lists:                  6
--     Security:
--       Authentication:         1
--       Authorization:         20
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 4
--         Region:               7
--         Label:                5
--         List:                 3
--         Popup LOV:            1
--         Button:               1
--         Report:               6
--       LOVs:                   2
--       Shortcuts:             16
--       Plug-ins:               4
--     Globalization:
--       Messages:              59
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,3031121837515744));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,290);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,290));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,290));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,290),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,290),
  p_owner => nvl(wwv_flow_application_install.get_schema,'BLOG_020900'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Blog Reader'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'BLOG'),
  p_application_group=>11245122453116684,
  p_application_group_name=>'Blog',
  p_application_group_comment=>'DbSWH APEX blogging platform',
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt=> '4DC18F44D89444E71B1FF26A7D89E0F7A174335914DB4B6F88E429DA1B788FB7',
  p_checksum_salt_last_reset => '20130401112716',
  p_max_session_length_sec=> 7200,
  p_max_session_idle_sec=> 1800,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> '0',
  p_allow_feedback_yn=> 'N',
  p_date_format=> '&G_DATE_FORMAT.',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 246416448814329990 + wwv_flow_api.g_id_offset,
  p_logout_url=> 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:19',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:&G_BLOG_NAME.',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> '2.9.0.2',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'D',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'Y',
  p_csv_encoding=> 'N',
  p_auto_time_zone=> 'N',
  p_content_delivery_network=> 'GOOGLE',
  p_javascript_file_urls=> '&G_THEME_PATH.lib.js?v=#APP_VERSION#',
  p_include_legacy_javascript=> 'N',
  p_error_handling_function=> 'blog_log.apex_error_handler',
  p_default_error_display_loc=> 'INLINE_IN_NOTIFICATION',
  p_last_updated_by => 'LAINFJAR',
  p_last_upd_yyyymmddhh24miss=> '20141214161433',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 202
 ,p_home_url => 'f?p=&APP_ALIAS.:HOME:0'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 244228556333510121 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_02 => 'Yes'
 ,p_attribute_03 => 'N'
 ,p_attribute_04 => 'No'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
--application/shared_components/security/authorization/file_download_enabled
wwv_flow_api.create_security_scheme (
  p_id => 10514724551117068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'FILE_DOWNLOAD_ENABLED'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'FILE_DOWNLOAD_ENABLED'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_photos_page
wwv_flow_api.create_security_scheme (
  p_id => 10927018932947823 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_PHOTOS_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_PHOTOS_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/moderation_enabled
wwv_flow_api.create_security_scheme (
  p_id => 16876681611922261 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'MODERATION_ENABLED'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'MODERATION_ENABLED'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/sitemap_enabled
wwv_flow_api.create_security_scheme (
  p_id => 17029362785174007 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SITEMAP_ENABLED'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SITEMAP_ENABLED'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_disclaimer_page
wwv_flow_api.create_security_scheme (
  p_id => 20922271866560678 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_DISCLAIMER_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_DISCLAIMER_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/allow_comment
wwv_flow_api.create_security_scheme (
  p_id => 21625974564712197 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'ALLOW_COMMENT'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'ALLOW_COMMENT'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_footer
wwv_flow_api.create_security_scheme (
  p_id => 27448106836545511 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_FOOTER'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_FOOTER'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_about_page
wwv_flow_api.create_security_scheme (
  p_id => 85237926821183966 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_ABOUT_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_ABOUT_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/comment_verify_question
wwv_flow_api.create_security_scheme (
  p_id => 177066440145888817 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'COMMENT_VERIFY_QUESTION'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'COMMENT_VERIFY_QUESTION'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_blog_description
wwv_flow_api.create_security_scheme (
  p_id => 177269232785329006 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_BLOG_DESCRIPTION'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_BLOG_DESCRIPTION'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_rss_feed
wwv_flow_api.create_security_scheme (
  p_id => 177269928459346158 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_RSS_FEED'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_RSS_FEED'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_contact_page
wwv_flow_api.create_security_scheme (
  p_id => 186579061301136844 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_CONTACT_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_CONTACT_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_blog_report
wwv_flow_api.create_security_scheme (
  p_id => 188580549933852371 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_BLOG_REPORT'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_BLOG_REPORT'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/logging_enabled
wwv_flow_api.create_security_scheme (
  p_id => 199802085449528265 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'LOGGING_ENABLED'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'LOGGING_ENABLED'
 ,p_error_message => 'Logging is disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_visitor_page
wwv_flow_api.create_security_scheme (
  p_id => 200066992375286427 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_VISITOR_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_VISITOR_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_resource_page
wwv_flow_api.create_security_scheme (
  p_id => 200069793404346775 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_RESOURCE_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_RESOURCE_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_file_page
wwv_flow_api.create_security_scheme (
  p_id => 200074807242826486 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_FILE_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_FILE_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_author_page
wwv_flow_api.create_security_scheme (
  p_id => 200075100988829346 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_AUTHOR_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_AUTHOR_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_resource_report
wwv_flow_api.create_security_scheme (
  p_id => 200079993485309408 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_RESOURCE_REPORT'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_RESOURCE_REPORT'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/show_faq_page
wwv_flow_api.create_security_scheme (
  p_id => 200132890661760400 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SHOW_FAQ_PAGE'
 ,p_scheme_type => 'PLUGIN_NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_attribute_01 => 'SHOW_FAQ_PAGE'
 ,p_error_message => 'This feature is currently disabled.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
null;
 
end;
/

prompt  ...application processes
--
--application/shared_components/logic/application_processes/initialize_session
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':G_USER_ID := #OWNER#.blog_util.init_session(:APP_ID, :APP_SESSION);';

wwv_flow_api.create_flow_process(
  p_id => 21274572240514586 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'AFTER_AUTHENTICATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Initialize session',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Error on process: Initialize session',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/redirect_to_search_page
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'apex_util.redirect_url(''f?p='' || :APP_ALIAS || '':SEARCH:0'');';

wwv_flow_api.create_flow_process(
  p_id => 247578270780112074 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 10,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Redirect to search page',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Error on process: Redirect to search page',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'P0_SEARCH',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/redirect_to_archives
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'apex_util.redirect_url(''f?p='' || :APP_ALIAS || '':ARCHIVES:0'');';

wwv_flow_api.create_flow_process(
  p_id => 200415702432820112 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 20,
  p_process_point => 'ON_SUBMIT_BEFORE_COMPUTATION',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Redirect to archives',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Error on process: Redirect to archives',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=> 'P0_ARCHIVES',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

prompt  ...application items
--
--application/shared_components/logic/application_items/article
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 409184068328888161 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'ARTICLE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'N'
 ,p_item_comment => 'Article id'
  );
 
end;
/

--application/shared_components/logic/application_items/category
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 409384447035919904 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'CATEGORY'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'N'
 ,p_item_comment => 'Category id'
  );
 
end;
/

--application/shared_components/logic/application_items/g_article_rows
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 186525543941729778 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_ARTICLE_ROWS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'How many articles per page shown in home page.'||unistr('\000a')||
'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_base_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 247658956613040781 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_BASE_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_bing_webmaster_meta
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 186826545495841889 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_BING_WEBMASTER_META'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'Bing webmaster tools verification meta tag.'||unistr('\000a')||
'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_blog_description
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 247720258545089294 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_BLOG_DESCRIPTION'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_blog_name
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 247658364593037044 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_BLOG_NAME'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_canonical_href
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 10223119724630456 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_CANONICAL_HREF'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/g_comment_rows
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 195266892902532800 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_COMMENT_ROWS'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'How many comments per page show for article.'||unistr('\000a')||
'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_date_format
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 20927989544825897 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_DATE_FORMAT'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_google_analytics_js_code
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 239719821843937755 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_GOOGLE_ANALYTICS_JS_CODE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'Google Analytics tracing JavaScript code.'||unistr('\000a')||
'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_google_webmaster_meta
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 186826361035819507 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_GOOGLE_WEBMASTER_META'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'Google webmaster tools verification meta tag.'||unistr('\000a')||
'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_page_title
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 10881306686570982 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_PAGE_TITLE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/g_region_title
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 10881504745571927 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_REGION_TITLE'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/g_rss_feed_url
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 247659153810042045 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_RSS_FEED_URL'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_theme_path
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 194171980767890256 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_THEME_PATH'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
 ,p_item_comment => 'This should be stored to BLOG_PARAM_APP materialized view for performance.'
  );
 
end;
/

--application/shared_components/logic/application_items/g_user_id
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 199363584473296033 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'G_USER_ID'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

--application/shared_components/logic/application_items/subscriber_id
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 85913538087265947 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SUBSCRIBER_ID'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'B'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
--application/shared_components/logic/application_computations/p0_region_title_rss
wwv_flow_api.create_flow_computation (
  p_id => 10877100062498176 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_RSS',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''MSG_SUBSCRIBE_RSS'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_search
wwv_flow_api.create_flow_computation (
  p_id => 10879904985541388 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_SEARCH',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_SEARCH'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_archives
wwv_flow_api.create_flow_computation (
  p_id => 10888829219697271 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_ARCHIVES',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_ARCHIVES'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_categories
wwv_flow_api.create_flow_computation (
  p_id => 10890807832752806 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_CATEGORIES',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_CATEGORIES'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_latest_article
wwv_flow_api.create_flow_computation (
  p_id => 10892632608771642 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_LATEST_ARTICLE',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_LATEST_ARTICLES'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_most_clicked
wwv_flow_api.create_flow_computation (
  p_id => 10893730439787917 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_MOST_CLICKED',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_MOST_CLICKED'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/p0_region_title_most_hits
wwv_flow_api.create_flow_computation (
  p_id => 10894513402795805 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'P0_REGION_TITLE_MOST_HITS',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'apex_lang.message(''REGION_TITLE_MOST_HITS'')',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/archive_months
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 85815132176274047 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'ARCHIVE_MONTHS',
  p_lov_query=> 'SELECT'||unistr('\000a')||
'  TO_CHAR(l.year_month,''fmMonth, YYYY "('' || l.article_count || '')"'') AS d,'||unistr('\000a')||
'  l.year_month_num'||unistr('\000a')||
'FROM blog_archive_lov l'||unistr('\000a')||
'ORDER BY l.year_month_num DESC');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/search_type
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 85796825532692150 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'SEARCH_TYPE',
  p_lov_query=> '.'||to_char(85796825532692150 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>85797011157692181 + wwv_flow_api.g_id_offset,
  p_lov_id=>85796825532692150 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Title and Text',
  p_lov_return_value=>'ALL',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>85797318891692232 + wwv_flow_api.g_id_offset,
  p_lov_id=>85796825532692150 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>20,
  p_lov_disp_value=>'Only Title',
  p_lov_return_value=>'TITLE',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>85797639024692233 + wwv_flow_api.g_id_offset,
  p_lov_id=>85796825532692150 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>30,
  p_lov_disp_value=>'Only Text',
  p_lov_return_value=>'TEXT',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>200051794058691127 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'GENERAL',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>200204786797318269 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'READER',
  p_group_desc=>'These pages activity is reported in blog admin');
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: Global page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Global page'
 ,p_step_title => '0'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200051794058691127 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'D'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214132743'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'"BLOG_READER_FOOTER"';

wwv_flow_api.create_page_plug (
  p_id=> 10216128116679287 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Footer',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 61152914134065932+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 100,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>&G_BLOG_DESCRIPTION.</p>';

wwv_flow_api.create_page_plug (
  p_id=> 177260419964322693 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Blog description',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 177269232785329006+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 200380084185341520 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_ARCHIVES.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 244237854574606288 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_LATEST_ARTICLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 244235726953579388 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 244236535873590853+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 244238729902618106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_MOST_CLICKED.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 244235933879581345 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 244236535873590853+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 244239048948623583 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_MOST_HITS.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 244236142191583784 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 244236535873590853+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 244240247048660845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_CATEGORIES.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 244235551410577019 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 244236535873590853+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 247623149501611129 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Tabs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 1003370432496805047+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 409282767205906764 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Not Rendered Items. DON''T DELETE THIS REGION !!',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 110,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'NEVER',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Do not delete this region. Region holds all pages items that we do not like render.');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p style="margin-left:15px;"><a href="&G_RSS_FEED_URL." rel="alternate" type="application/rss+xml"><img src="&G_THEME_PATH.feed-icon-128x128.png" alt="RSS" title=""MSG_SUBSCRIBE_RSS"" /></a></p>';

wwv_flow_api.create_page_plug (
  p_id=> 414709147311034743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_RSS.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 177269928459346158+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '<a href="&G_RSS_FEED_URL."><img src="&G_THEME_PATH.images/rss.jpg" alt="RSS Feed" /></a>');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 420832778317929731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> '&P0_REGION_TITLE_SEARCH.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 244237140040595261+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10875606976479775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_RSS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10877703932511497 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10888405077693318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_ARCHIVES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10889014314734622 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_CATEGORIES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10891120759761982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_LATEST_ARTICLE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10893304788784611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_MOST_CLICKED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10894121165792138 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_REGION_TITLE_MOST_HITS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>200380890835354253 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_ARCHIVES',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 200380084185341520+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'RETURN CASE WHEN :APP_PAGE_ID = 5 THEN :P0_ARCHIVES END',
  p_source_type=> 'FUNCTION_BODY',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'ARCHIVE_MONTHS',
  p_lov=> 'SELECT'||unistr('\000a')||
'  TO_CHAR(l.year_month,''fmMonth, YYYY "('' || l.article_count || '')"'') AS d,'||unistr('\000a')||
'  l.year_month_num'||unistr('\000a')||
'FROM blog_archive_lov l'||unistr('\000a')||
'ORDER BY l.year_month_num DESC',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'- Select month -',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>407686369228384654 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SEARCH_TYPE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 420832778317929731+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'ALL',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'SEARCH_TYPE',
  p_lov=> '.'||to_char(85796825532692150 + wwv_flow_api.g_id_offset)||'.',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>420833273399929838 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 420832778317929731+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'RETURN CASE WHEN :APP_PAGE_ID = 2 THEN :P0_SEARCH END',
  p_source_type=> 'FUNCTION_BODY',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 80,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="width:190px"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>420833675873929847 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SEARCH_BTN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 420832778317929731+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'P0_SEARCH',
  p_prompt=>'Search',
  p_source=>'P0_SEARCH',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_button_image_attr=> 'style="margin:0"',
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 200432396129673878 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'Before pagination'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#PPR_ARTICLES,#PPR_COMMENTS'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'apexbeforerefresh'
 ,p_display_when_type => 'CURRENT_PAGE_IN_CONDITION'
 ,p_display_when_cond => '1,2,3,4,5'
  );
wwv_flow_api.create_page_da_action (
  p_id => 200432680794674000 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 200432396129673878 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'JQUERY_SELECTOR'
 ,p_affected_elements => '#modal_LOADER'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 200432804094676179 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_name => 'After pagination'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'JQUERY_SELECTOR'
 ,p_triggering_element => '#PPR_ARTICLES,#PPR_COMMENTS'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'apexafterrefresh'
 ,p_display_when_type => 'CURRENT_PAGE_IN_CONDITION'
 ,p_display_when_cond => '1,2,3,4,5'
  );
wwv_flow_api.create_page_da_action (
  p_id => 200433300232676180 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 200432804094676179 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_affected_elements_type => 'JQUERY_SELECTOR'
 ,p_affected_elements => '#articlepages'
 ,p_attribute_01 => '1>=this.affectedElements.children().length && this.affectedElements.empty();'||unistr('\000a')||
'SyntaxHighlighter.highlight();'||unistr('\000a')||
'if(!/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)){'||unistr('\000a')||
' $("#center div.article a[href]").filter(function(){return /\.(jpg|png|gif)$/i.test(this.href)}).slimbox({loop:true},null,function(el){return (this==el)||($(this).parents("#center div.article")[0]&&($(this).parents("#center div.article")[0]==$(el).parents("div.article")[0]))})'||unistr('\000a')||
'}'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 200433082660676180 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 0
 ,p_event_id => 200432804094676179 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_affected_elements_type => 'JQUERY_SELECTOR'
 ,p_affected_elements => 'html,body'
 ,p_attribute_01 => 'this.affectedElements.animate({scrollTop:(3===&APP_PAGE_ID.?$("#COMMENTS"):$("#PAGE_TOP")).offset().top},"fast",function(){$("#modal_LOADER").hide()});'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Home
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Home'
 ,p_alias => 'HOME'
 ,p_step_title => '&G_BLOG_NAME.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Application Express Tips&Tricks'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'||unistr('\000a')||
'<meta content="&G_BLOG_DESCRIPTION." name="description" />'||unistr('\000a')||
''
 ,p_inline_css => 
'#back-top {'||unistr('\000a')||
'	position: fixed;'||unistr('\000a')||
'	bottom: 30px;'||unistr('\000a')||
'	margin-left: -150px;'||unistr('\000a')||
'}'||unistr('\000a')||
'#back-top a {'||unistr('\000a')||
'	width: 108px;'||unistr('\000a')||
'	display: block;'||unistr('\000a')||
'	text-align: center;'||unistr('\000a')||
'	font: 11px/100% Arial, Helvetica, sans-serif;'||unistr('\000a')||
'	text-transform: uppercase;'||unistr('\000a')||
'	text-decoration: none;'||unistr('\000a')||
'	color: #bbb;'||unistr('\000a')||
'	/* background color transition */'||unistr('\000a')||
'	-webkit-transition: 1s;'||unistr('\000a')||
'	-moz-transition: 1s;'||unistr('\000a')||
'	transition: 1s;'||unistr('\000a')||
'}'||unistr('\000a')||
'#back-top a:hover {'||unistr('\000a')||
'	color: #000;'||unistr('\000a')||
'}'||unistr('\000a')||
'/* arrow icon '||
'(span tag) */'||unistr('\000a')||
'#back-top span {'||unistr('\000a')||
'	width: 108px;'||unistr('\000a')||
'	height: 108px;'||unistr('\000a')||
'	display: block;'||unistr('\000a')||
'	margin-bottom: 7px;'||unistr('\000a')||
'	background: #ddd url(up-arrow.png) no-repeat center center;'||unistr('\000a')||
'	/* rounded corners */'||unistr('\000a')||
'	-webkit-border-radius: 15px;'||unistr('\000a')||
'	-moz-border-radius: 15px;'||unistr('\000a')||
'	border-radius: 15px;'||unistr('\000a')||
'	/* background color transition */'||unistr('\000a')||
'	-webkit-transition: 1s;'||unistr('\000a')||
'	-moz-transition: 1s;'||unistr('\000a')||
'	transition: 1s;'||unistr('\000a')||
'}'||unistr('\000a')||
'#back-top a:hover span {'||unistr('\000a')||
'	background'||
'-color: #777;'||unistr('\000a')||
'}'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141209122807'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,a.category_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,a.category_name'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,a.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,a.comment_count'||unistr('\000a')||
'  ,a.created_on_txt'||unistr('\000a')||
'  ,a.posted_by_txt'||unistr('\000a')||
'  ,a.category_txt'||unistr('\000a')||
'  ,a.view_comment'||unistr('\000a')||
'  ,a.post_comment'||unistr('\000a')||
'FROM #OWNER#.blog_v$article a'||unistr('\000a')||
'ORDER BY a.created_on DESC';

wwv_flow_api.create_report_region (
  p_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Articles',
  p_region_name=>'PPR_ARTICLES',
  p_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_item=> 'G_ARTICLE_ROWS',
  p_query_num_rows_type=> 'SEARCH_ENGINE',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85869524655957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85869637683957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28020824350737469 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19411377800495588 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#ARTICLE_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 204576396275979319 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#',
  p_column_linktext=>'#CATEGORY_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 235018095224019466 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28020900326737469 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199366683515705922 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85869717000957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28599499753503320 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85869822564957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85722024781739035 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85869934243957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'VIEW_COMMENT',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS',
  p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />',
  p_column_link_attr=>'class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85870032047957423 + wwv_flow_api.g_id_offset,
  p_region_id=> 235017472988019428 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 14,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />',
  p_column_link_attr=>'rel="nofollow" class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10223313254633512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_computation_sequence => 10,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':HOME:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 177235119041596455 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Reset pagination',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Search
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Search'
 ,p_alias => 'SEARCH'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213112556'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,a.category_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,a.category_name'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,a.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,a.comment_count'||unistr('\000a')||
'  ,a.created_on_txt'||unistr('\000a')||
'  ,a.posted_by_txt'||unistr('\000a')||
'  ,a.category_txt'||unistr('\000a')||
'  ,a.view_comment'||unistr('\000a')||
'  ,a.post_comment'||unistr('\000a')||
'FROM #OWNER#.blog_v$article a'||unistr('\000a')||
'WHERE :P0_SEARCH IS NOT NULL'||unistr('\000a')||
'  AND ('||unistr('\000a')||
'   ('||unistr('\000a')||
'    :P0_SEARCH_TYPE = ''ALL'''||unistr('\000a')||
'    AND ('||unistr('\000a')||
'     INSTR(UPPER(a.article_title), ';

s:=s||'UPPER(:P0_SEARCH)) > 0'||unistr('\000a')||
'     OR CONTAINS(a.article_text, ''{'' || :P0_SEARCH || ''}'', 1) > 0'||unistr('\000a')||
'    )'||unistr('\000a')||
'   )'||unistr('\000a')||
'   OR ('||unistr('\000a')||
'    :P0_SEARCH_TYPE = ''TITLE'''||unistr('\000a')||
'    AND INSTR(UPPER(a.article_title), UPPER(:P0_SEARCH)) > 0'||unistr('\000a')||
'   )'||unistr('\000a')||
'   OR ('||unistr('\000a')||
'    :P0_SEARCH_TYPE = ''TEXT'''||unistr('\000a')||
'    AND CONTAINS(a.article_text, ''{'' || :P0_SEARCH || ''}'', 2) > 0'||unistr('\000a')||
'   ) '||unistr('\000a')||
'  )'||unistr('\000a')||
'ORDER BY score(1) + score(2) DESC, a.created_on DESC';

wwv_flow_api.create_report_region (
  p_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'PPR_ARTICLES',
  p_template=> 179113213838116989+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_item=> 'G_ARTICLE_ROWS',
  p_query_num_rows_type=> 'SEARCH_ENGINE',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85870621611989217 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85870715171989217 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28021211626743301 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19412276709511234 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#ARTICLE_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 204577400095036710 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#',
  p_column_linktext=>'#CATEGORY_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 235036299981491578 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28021317995743301 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199377405849139827 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_hit_highlight=>'&P0_SEARCH.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85870817149989217 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28599696302504874 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85870940154989217 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85731424881292982 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85871032618989217 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'VIEW_COMMENT',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS',
  p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />',
  p_column_link_attr=>'class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85871121695989218 + wwv_flow_api.g_id_offset,
  p_region_id=> 235035477546491576 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 14,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />',
  p_column_link_attr=>'rel="nofollow" class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10879104535530839 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_SEARCH_RESULT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10874007895399317 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_SEARCH_RESULT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_log.write_activity_log('||unistr('\000a')||
'  p_user_id       => :G_USER_ID,'||unistr('\000a')||
'  p_session_id    => :APP_SESSION,'||unistr('\000a')||
'  p_activity_type => ''SEARCH'','||unistr('\000a')||
'  p_search_type   => :P0_SEARCH_TYPE,'||unistr('\000a')||
'  p_search        => :P0_SEARCH'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 199809079332830966 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Write search log',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Write search log',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_security_scheme => 199802085449528265+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 177234739688592993 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Reset pagination',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00003
prompt  ...PAGE 3: Read article
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Read article'
 ,p_alias => 'READ'
 ,p_step_title => '&P3_ARTICLE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Read Article'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'||unistr('\000a')||
'<meta content="&P3_DESCRIPTION." name="description" />'||unistr('\000a')||
'<meta content="&P3_KEYWORDS.,&P3_CATEGORY_NAME." name="keywords" />'||unistr('\000a')||
'<meta content="&P3_AUTHOR_NAME." name="author" />'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214133212'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,a.category_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,category_name'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,a.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,0 AS comment_count'||unistr('\000a')||
'  ,a.created_on_txt'||unistr('\000a')||
'  ,a.posted_by_txt'||unistr('\000a')||
'  ,a.category_txt'||unistr('\000a')||
'  ,a.post_comment'||unistr('\000a')||
'FROM #OWNER#.blog_v$article a'||unistr('\000a')||
'WHERE a.article_id = :ARTICLE'||unistr('\000a')||
'ORDER BY a.created_on'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_name=> 'Read Article',
  p_region_name=>'',
  p_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '1',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '1',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85871834946028545 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85872019190028545 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28021627357751195 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19412699126516094 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_html_expression=>'<span>#ARTICLE_TITLE#</span>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 204577979811061391 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#',
  p_column_linktext=>'#CATEGORY_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 235041799151819924 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28021723325751196 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199370978259913795 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_html_expression=>'#ARTICLE_TEXT#'||unistr('\000a')||
'<a id="COMMENTS" name="COMMENTS"></a>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85903421689161873 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28599925835506408 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85872213706028545 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85733820876400082 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85872321235028545 + wwv_flow_api.g_id_offset,
  p_region_id=> 235041000701819923 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />',
  p_column_link_attr=>'rel="nofollow" class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'WITH qry AS ('||unistr('\000a')||
'  SELECT '||unistr('\000a')||
'    CEIL(ROW_NUMBER() OVER(ORDER BY a.created_on DESC) / :G_COMMENT_ROWS) AS rn'||unistr('\000a')||
'    ,a.created_on'||unistr('\000a')||
'    ,b.nick_name AS posted_by'||unistr('\000a')||
'    ,a.comment_text'||unistr('\000a')||
'    ,(SELECT APEX_LANG.LANG(''Posted on'') FROM DUAL) AS created_txt'||unistr('\000a')||
'    ,(SELECT APEX_LANG.LANG(''by'') FROM DUAL) AS posted_by_txt'||unistr('\000a')||
'  FROM #OWNER#.blog_comment a'||unistr('\000a')||
'  JOIN #OWNER#.blog_comment_user b'||unistr('\000a')||
'    ON a.user_id = b.user_id'||unistr('\000a')||
'  WHE';

s:=s||'RE a.article_id = :ARTICLE'||unistr('\000a')||
'    AND a.moderated = ''Y'''||unistr('\000a')||
'    AND a.active = ''Y'''||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  qry.created_on'||unistr('\000a')||
'  ,qry.posted_by'||unistr('\000a')||
'  ,qry.comment_text'||unistr('\000a')||
'  ,qry.created_txt'||unistr('\000a')||
'  ,qry.posted_by_txt'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'ORDER BY qry.rn,'||unistr('\000a')||
'  qry.created_on';

wwv_flow_api.create_report_region (
  p_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'PPR_COMMENTS',
  p_parent_plug_id=>235041000701819923 + wwv_flow_api.g_id_offset,
  p_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 21625974564712197+ wwv_flow_api.g_id_offset,
  p_display_when_condition=> 'ARTICLE',
  p_display_condition_type=> 'ITEM_IS_NOT_NULL',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 235043478957912725+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No comments yet on this article.',
  p_query_num_rows_item=> 'G_COMMENT_ROWS',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 235044075847957036 + wwv_flow_api.g_id_offset,
  p_region_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199383086580683149 + wwv_flow_api.g_id_offset,
  p_region_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199382798442677635 + wwv_flow_api.g_id_offset,
  p_region_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_TEXT',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85738915191589549 + wwv_flow_api.g_id_offset,
  p_region_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_TXT',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85876231194136692 + wwv_flow_api.g_id_offset,
  p_region_id=> 235043683620956906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>19386378455690097 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_KEYWORDS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'KEYWORDS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>186522655502767359 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_AUTHOR_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'AUTHOR_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>186829464480091430 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_DESCRIPTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'DESCRIPTION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>204701710630713783 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_CATEGORY_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'CATEGORY_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>235072386476534835 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_ARTICLE_TITLE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'ARTICLE_TITLE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 28030504182883501 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_computation_sequence => 10,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || :ARTICLE, NULL, ''PUBLIC_BOOKMARK'')',
  p_computation_error_message => 'Error on: Computation ARTICLE_URL',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10895018349808636 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_computation_sequence => 20,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_COMMENTS'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 219975445712829095 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Reset pagination',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_log.write_activity_log('||unistr('\000a')||
'  p_user_id       => :G_USER_ID,'||unistr('\000a')||
'  p_session_id    => :APP_SESSION,'||unistr('\000a')||
'  p_activity_type => ''READ'','||unistr('\000a')||
'  p_related_id    => :ARTICLE'||unistr('\000a')||
');'||unistr('\000a')||
'#OWNER#.blog_log.write_article_log(:ARTICLE);';

wwv_flow_api.create_page_process(
  p_id     => 199789991332850503 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Write article log',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Write article log',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_security_scheme => 199802085449528265+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_util.unsubscribe('||unistr('\000a')||
'  p_value      => :SUBSCRIBER_ID,'||unistr('\000a')||
'  p_user_id    => :G_USER_ID,'||unistr('\000a')||
'  p_article_id => :ARTICLE'||unistr('\000a')||
');'||unistr('\000a')||
'IF :ARTICLE IS NULL OR :G_USER_ID IS NULL THEN'||unistr('\000a')||
'  apex_util.redirect_url(:HOME_LINK);'||unistr('\000a')||
'END IF;';

wwv_flow_api.create_page_process(
  p_id     => 21563485612113705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Unsubscribe',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Unsubscribe',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'SUBSCRIBER_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'You have unsubscribed get followup notification from this article.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:BLOG_V$ARTICLE:ARTICLE:ARTICLE_ID';

wwv_flow_api.create_page_process(
  p_id     => 21480293918473050 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch BLOG_V$ARTICLE',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Automated Row Fetch ',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: Read category
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Read category'
 ,p_alias => 'READCAT'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Read Articles for &CATEGORY.'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'||unistr('\000a')||
'<meta content="&P4_CATEGORY_NAME." name="keywords" />'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213110446'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,category_name'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,a.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,a.comment_count'||unistr('\000a')||
'  ,a.created_on_txt'||unistr('\000a')||
'  ,a.posted_by_txt'||unistr('\000a')||
'  ,a.category_txt'||unistr('\000a')||
'  ,a.view_comment'||unistr('\000a')||
'  ,a.post_comment'||unistr('\000a')||
'FROM #OWNER#.blog_v$article a'||unistr('\000a')||
'WHERE a.category_id = :CATEGORY'||unistr('\000a')||
'ORDER BY a.created_on DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_name=> '&G_PAGE_TITLE.',
  p_region_name=>'PPR_ARTICLES',
  p_template=> 179113213838116989+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_item=> 'G_ARTICLE_ROWS',
  p_query_num_rows_type=> 'SEARCH_ENGINE',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85872931052045587 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28022116790756128 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19413271952528612 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#ARTICLE_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873040780045587 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_html_expression=>'<span itemprop="keywords">#CATEGORY_NAME#</span>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 235031885738495380 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28022198011756128 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 199369982021862255 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873141527045587 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28600123032507702 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873235494045587 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85735018056441392 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873328499045588 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'VIEW_COMMENT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS',
  p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />',
  p_column_link_attr=>'class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873433012045588 + wwv_flow_api.g_id_offset,
  p_region_id=> 235031100366495355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />',
  p_column_link_attr=>'rel="nofollow" class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10887004455663160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_CATEGORY_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 21479095763425482 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 10,
  p_computation_item=> 'P4_CATEGORY_NAME',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'SELECT c.category_name'||unistr('\000a')||
' FROM #OWNER#.blog_category c'||unistr('\000a')||
'WHERE c.category_id = :CATEGORY'||unistr('\000a')||
'  AND c.active = ''Y''',
  p_computation_error_message => 'Error on: Computation TITLE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 28031019266891740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 20,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READCAT:0::::CATEGORY:'' || :CATEGORY, NULL, ''PUBLIC_BOOKMARK'')',
  p_computation_error_message => 'Error on: Computation CATEGORY_URL',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10887420617670932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_computation_sequence => 30,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''TEXT_CATEGORY'')'||unistr('\000a')||
' || '': '''||unistr('\000a')||
' || :P4_CATEGORY_NAME',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 219975857832832571 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Reset pagination',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_log.write_activity_log('||unistr('\000a')||
'  p_user_id       => :G_USER_ID,'||unistr('\000a')||
'  p_session_id    => :APP_SESSION,'||unistr('\000a')||
'  p_activity_type => ''READCAT'','||unistr('\000a')||
'  p_related_id    => :CATEGORY'||unistr('\000a')||
');'||unistr('\000a')||
'#OWNER#.blog_log.write_category_log(:CATEGORY);';

wwv_flow_api.create_page_process(
  p_id     => 219974954800812834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 20,
  p_process_point=> 'BEFORE_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Write category log',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Writing category log',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_security_scheme => 199802085449528265+ wwv_flow_api.g_id_offset,
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00005
prompt  ...PAGE 5: Read archives
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 5
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Read archives'
 ,p_alias => 'ARCHIVES'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Archives'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213110800'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,a.category_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,a.category_name'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,a.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,a.comment_count'||unistr('\000a')||
'  ,a.created_on_txt'||unistr('\000a')||
'  ,a.posted_by_txt'||unistr('\000a')||
'  ,a.category_txt'||unistr('\000a')||
'  ,a.view_comment'||unistr('\000a')||
'  ,a.post_comment'||unistr('\000a')||
'FROM #OWNER#.blog_v$article a'||unistr('\000a')||
'WHERE a.year_month_num = :P0_ARCHIVES'||unistr('\000a')||
'ORDER BY a.created_on DESC'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_name=> '&G_PAGE_TITLE.',
  p_region_name=>'PPR_ARTICLES',
  p_template=> 179113213838116989+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'Y',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_item=> 'G_ARTICLE_ROWS',
  p_query_num_rows_type=> 'SEARCH_ENGINE',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85873928236062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85874029099062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28022506654760842 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19413791350534839 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#ARTICLE_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200402495551486809 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#',
  p_column_linktext=>'#CATEGORY_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'TEXT_FROM_LOV',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200402396152486808 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28022616529760843 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200402175219486808 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85874115019062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28600319797509175 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85874209379062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85736517672472819 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85874333220062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'VIEW_COMMENT',
  p_column_display_sequence=> 13,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS',
  p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />',
  p_column_link_attr=>'class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_link_checksum_type=> '1',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85874425168062054 + wwv_flow_api.g_id_offset,
  p_region_id=> 200401890867486805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 14,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#',
  p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />',
  p_column_link_attr=>'rel="nofollow" class="comment-link"',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 21475883963355022 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_computation_sequence => 10,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_ARCHIVES'') '||unistr('\000a')||
' || '': '' '||unistr('\000a')||
' || to_char(to_date(:P0_ARCHIVES, ''YYYYMM''), ''fmMonth, YYYY'')'||unistr('\000a')||
'',
  p_computation_error_message => 'Error on: Computation TITLE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'reset_pagination';

wwv_flow_api.create_page_process(
  p_id     => 177234915578595462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 5,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'RESET_PAGINATION',
  p_process_name=> 'Reset Pagination',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Reset pagination',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00009
prompt  ...PAGE 9: Submit comment
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 9
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Submit comment'
 ,p_alias => 'NEW_COMMENT'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Submit comment'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/jquery-ui/1.8.22/ui/minified/jquery.ui.button.min.js'
 ,p_required_role => 21625974564712197 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'C'
 ,p_browser_cache => 'N'
 ,p_deep_linking => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214130358'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>"MSG_REQUIRED_FIELDS"</p>';

wwv_flow_api.create_page_plug (
  p_id=> 85768836972581380 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'"MSG_CONFIRM_COMMENT"';

wwv_flow_api.create_page_plug (
  p_id=> 85772110182581440 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Confirm dialog',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 200173584798199453+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'ITEM_IS_NOT_NULL',
  p_plug_display_when_condition => 'P9_ARTICLE',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>59520724128042161 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_name=> 'Return to article',
  p_branch_action=> '3',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'BRANCH_TO_STEP',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>21596398129122804 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_name=> 'Goto home page',
  p_branch_action=> 'HOME_LINK',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'BRANCH_TO_URL_IDENT_BY_ITEM',
  p_branch_sequence=> 20,
  p_branch_condition_type=> 'ITEM_IS_NULL',
  p_branch_condition=> 'P9_ARTICLE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16928469165649235 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_MODERATION_ENABLED_MSG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> '"MSG_MODERATION_ENABLED"',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'BELOW',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_security_scheme => 16876681611922261+ wwv_flow_api.g_id_offset,
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16932369003846801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_MATH_QUESTION_ANSWER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 21272493943377828+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_LAST_NAME"';

wwv_flow_api.create_page_item(
  p_id=>61211999514985211 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_LAST_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Last Name',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 80,
  p_cHeight=> 1,
  p_cattributes_element=>'class="hideMe508"',
  p_tag_attributes  => 'required',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 85682918386179396+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => 'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85769013226581388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_MATH_QUESTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Question answer',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'PLUGIN_NET.WEBHOP.DBSWH.MATH_QUESTION_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="text-align:right"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_security_scheme => 177066440145888817+ wwv_flow_api.g_id_offset,
  p_attribute_01 => 'P9_MATH_QUESTION_ANSWER',
  p_attribute_02 => '1',
  p_attribute_03 => '46',
  p_attribute_04 => '1',
  p_attribute_05 => '46',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_NICK_NAME"';

wwv_flow_api.create_page_item(
  p_id=>85769214223581412 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_NICK_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Name',
  p_source=>'NICK_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 80,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_WEBSITE"';

wwv_flow_api.create_page_item(
  p_id=>85769722049581431 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_WEBSITE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Website',
  p_source=>'WEBSITE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 256,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906175811062416+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85770231281581432 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_CANCEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Cancel',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-BOTTOM',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'N',
  p_button_action => 'REDIRECT_URL',
  p_button_redirect_url => 'f?p=&APP_ALIAS.:READ:0::::ARTICLE:&P9_ARTICLE.',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85770432206581433 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_SUBMIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Submit',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-BOTTOM',
  p_display_when=>'P9_ARTICLE',
  p_display_when_type=>'ITEM_IS_NOT_NULL',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'Y',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_EMAIL"';

wwv_flow_api.create_page_item(
  p_id=>85770621663581433 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source=>'EMAIL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 256,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_COMMENT"';

wwv_flow_api.create_page_item(
  p_id=>85771134958581434 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_COMMENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comment',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'PLUGIN_NET.WEBHOP.DBSWH.COMMENT_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 10,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_COMMENT_FOLLOWUP_NOTIFY"';

wwv_flow_api.create_page_item(
  p_id=>85771617307581435 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_FOLLOWUP_NOTIFY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 85768836972581380+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Y',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Notification',
  p_source=>'SELECT n.followup_notify'||unistr('\000a')||
' FROM #OWNER#.blog_comment_notify n'||unistr('\000a')||
'WHERE n.user_id = :G_USER_ID'||unistr('\000a')||
'  AND n.article_id = :P9_ARTICLE',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'SELECT apex_lang.message(''FOLLOWUP_NOTIFY_CHECKBOX'') as d,'||unistr('\000a')||
'  ''Y'' r'||unistr('\000a')||
'FROM dual'||unistr('\000a')||
'',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cattributes_element=>'style="padding:8px 0"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906175811062416+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'S',
  p_escape_on_http_output => 'N',
  p_help_text=> h,
  p_attribute_01 => '1',
  p_attribute_02 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85772730778581444 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_ARTICLE_TITLE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85894916355298392 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_ARTICLE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85774011650581446 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 10,
  p_computation_item=> 'ARTICLE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'ITEM_VALUE',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'P9_ARTICLE',
  p_computation_error_message => 'Error on: Computation ARTICLE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85773032170581445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 20,
  p_computation_item=> 'P9_NICK_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(:P9_NICK_NAME)',
  p_computation_error_message => 'Error on: Computation NICK',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85773223446581445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 30,
  p_computation_item=> 'P9_EMAIL',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(LOWER(:P9_EMAIL))',
  p_computation_error_message => 'Error on: Computation EMAIL',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85773432094581446 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 40,
  p_computation_item=> 'P9_WEBSITE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(:P9_WEBSITE)',
  p_computation_error_message => 'Error on: Computation WEBSITE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85773624807581446 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 50,
  p_computation_item=> 'P9_FOLLOWUP_NOTIFY',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'N',
  p_computation_error_message => 'Error on: Computation FOLLOWUP_NOTIFY',
  p_compute_when => 'P9_FOLLOWUP_NOTIFY',
  p_compute_when_type=>'ITEM_IS_NULL');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 85774440962581447 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 60,
  p_computation_item=> 'P9_ARTICLE_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'SELECT a.article_title'||unistr('\000a')||
'FROM #OWNER#.blog_article a'||unistr('\000a')||
'WHERE a.article_id = :P9_ARTICLE'||unistr('\000a')||
'',
  p_computation_error_message => 'Error on: Computation ARTICLE_TITLE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10856816989095249 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 70,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_COMMENT'', :P9_ARTICLE_TITLE)',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10872626680385823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 80,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_COMMENT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85774625201581448 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Not banned',
  p_validation_sequence=> 10,
  p_validation => 'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_block b'||unistr('\000a')||
'WHERE b.active       = ''Y'''||unistr('\000a')||
'AND ( ( b.block_type = ''EMAIL'''||unistr('\000a')||
'AND b.block_value    = :P9_EMAIL )'||unistr('\000a')||
'OR ( b.block_type    = ''IP'''||unistr('\000a')||
'AND b.block_value    = owa_util.get_cgi_env(''REMOTE_ADDR'') )'||unistr('\000a')||
'OR ( b.block_type    = ''USER_AGENT'''||unistr('\000a')||
'AND b.block_value    = owa_util.get_cgi_env(''HTTP_USER_AGENT'') ) )'||unistr('\000a')||
'UNION ALL'||unistr('\000a')||
'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_user u'||unistr('\000a')||
'WHERE u.blocked = ''Y'''||unistr('\000a')||
'AND u.email     = :P9_EMAIL',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'It is not possible submit comment at this time.',
  p_always_execute=>'N',
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85776238296581482 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_ARTICLE is not null',
  p_validation_sequence=> 20,
  p_validation => 'P9_ARTICLE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Commenting is not possible. You have probably open this application in other browser tab or window and session information is cleared. Return to article and try submit comment again.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 85894916355298392 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 61214424279019329 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_LAST_NAME is null',
  p_validation_sequence=> 30,
  p_validation => ':P9_LAST_NAME IS NULL',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'It is not possible submit comment at this time.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 61211999514985211 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> 'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85775219827581480 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_FOLLOWUP_NOTIFY is Y/N',
  p_validation_sequence=> 40,
  p_validation => 'P9_FOLLOWUP_NOTIFY',
  p_validation2 => 'Y,N',
  p_validation_type => 'ITEM_IN_VALIDATION_IN_STRING2',
  p_error_message => 'It is not possible submit comment at this time.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 85771617307581435 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85775009468581470 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_NICK_NAME is not reserved',
  p_validation_sequence=> 50,
  p_validation => 'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_user u'||unistr('\000a')||
'WHERE UPPER(u.nick_name) = UPPER(:P9_NICK_NAME)'||unistr('\000a')||
'  AND u.email != :P9_EMAIL',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => '#LABEL# is already reserved.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 85769214223581412 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16986872798466732 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_NICK_NAME max length',
  p_validation_sequence=> 60,
  p_validation => 'LENGTH(:P9_NICK_NAME) <= 80',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 80 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 85769214223581412 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85774841330581470 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_EMAIL address is valid',
  p_validation_sequence=> 70,
  p_validation => '#OWNER#.blog_util.validate_email(:P9_EMAIL);',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter a valid #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 85770621663581433 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16987489392474220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_WEBSITE max length',
  p_validation_sequence=> 80,
  p_validation => 'LENGTH(:P9_WEBSITE) <= 256',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 256 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 85769722049581431 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16988163297486262 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_COMMENT max length',
  p_validation_sequence=> 90,
  p_validation => 'LENGTH(:P9_COMMENT) <= 2000',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 2000 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 85771134958581434 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 85777119315581495 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 9
 ,p_name => 'Modal confirm dialog'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 85770432206581433 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
 ,p_display_when_type => 'ITEM_IS_NOT_NULL'
 ,p_display_when_cond => 'P9_ARTICLE'
  );
wwv_flow_api.create_page_da_action (
  p_id => 85777434757581520 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 9
 ,p_event_id => 85777119315581495 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_NET.WEBHOP.DBSWH.MODAL_CONFIRM'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 85772110182581440 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_util.save_comment('||unistr('\000a')||
'  p_apex_session_id => :APP_SESSION,'||unistr('\000a')||
'  p_app_alias       => :APP_ALIAS,'||unistr('\000a')||
'  p_base_url        => :G_BASE_URL,'||unistr('\000a')||
'  p_blog_name       => :G_BLOG_NAME,'||unistr('\000a')||
'  p_article_id      => :P9_ARTICLE,'||unistr('\000a')||
'  p_article_title   => :P9_ARTICLE_TITLE,'||unistr('\000a')||
'  p_user_id         => :G_USER_ID,'||unistr('\000a')||
'  p_email           => :P9_EMAIL,'||unistr('\000a')||
'  p_nick_name       => :P9_NICK_NAME,'||unistr('\000a')||
'  p_website         => :P9_WEBSITE,'||unistr('\000a')||
'  ';

p:=p||'p_followup        => :P9_FOLLOWUP_NOTIFY,'||unistr('\000a')||
'  -- Plugin "Comment Textarea" saves formatted and escaped comment to variable.'||unistr('\000a')||
'  -- Insert that to table.'||unistr('\000a')||
'  p_comment         => #OWNER#.blog_plugin.g_formatted_comment'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 85776311471581482 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Save comment',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Save comment',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>85770432206581433 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'Thank you for submitting comment.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'9';

wwv_flow_api.create_page_process(
  p_id     => 85776538858581482 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear items',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Clear items',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:BLOG_COMMENT_USER:G_USER_ID:USER_ID';

wwv_flow_api.create_page_process(
  p_id     => 21488483211047124 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch BLOG_COMMENT_USER',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Automated Row Fetch ',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'G_USER_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 9
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00010
prompt  ...PAGE 10: Resources
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 10
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Resources'
 ,p_alias => 'RESOURCES'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Resources'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_inline_css => 
'td[headers="LINK_TITLE"]{width:200px;}'
 ,p_required_role => 200069793404346775 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 31536000
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213145647'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT r.link_title,'||unistr('\000a')||
'  r.link_text,'||unistr('\000a')||
'  r.link_url'||unistr('\000a')||
'FROM #OWNER#.blog_resource r'||unistr('\000a')||
'WHERE r.link_type = ''RESOURCE'''||unistr('\000a')||
'AND r.active = ''Y'''||unistr('\000a')||
'ORDER BY r.link_title';

wwv_flow_api.create_report_region (
  p_id=> 188572543037315584 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_name=> '&P10_REGION_TITLE_USEFUL_LINKS.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_region_css_classes=>'resourcesmargin',
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 200079993485309408+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 411997056936887967+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '25',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '25',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Print',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'INCHES',
  p_prn_paper_size=> 'LETTER',
  p_prn_width_units=> 'PERCENTAGE',
  p_prn_width=> 11,
  p_prn_height=> 8.5,
  p_prn_orientation=> 'HORIZONTAL',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '12',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#9bafde',
  p_prn_header_font_color=> '#ffffff',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '10',
  p_prn_body_bg_color=> '#efefef',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '10',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_query_asc_image=> 'arrow_down_gray_light.gif',
  p_query_asc_image_attr=> ' width="13" height="12" ',
  p_query_desc_image=> 'arrow_up_gray_light.gif',
  p_query_desc_image_attr=> ' width="13" height="12" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19419373314710339 + wwv_flow_api.g_id_offset,
  p_region_id=> 188572543037315584 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_TITLE',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'#LINK_URL#',
  p_column_linktext=>'#LINK_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 188579757746787928 + wwv_flow_api.g_id_offset,
  p_region_id=> 188572543037315584 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_TEXT',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 188579841360787928 + wwv_flow_api.g_id_offset,
  p_region_id=> 188572543037315584 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_URL',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select r.link_title,'||unistr('\000a')||
'  r.link_text,'||unistr('\000a')||
'  r.link_url'||unistr('\000a')||
'from #OWNER#.blog_resource r'||unistr('\000a')||
'where r.link_type = ''BLOG'''||unistr('\000a')||
'and r.active = ''Y'''||unistr('\000a')||
'order by r.link_title';

wwv_flow_api.create_report_region (
  p_id=> 200448102410932388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_name=> '&P10_REGION_TITLE_BLOGROLL.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => false,
  p_new_grid_column  => false,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_required_role => 188580549933852371+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 411997056936887967+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '25',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '25',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_prn_format=> 'PDF',
  p_prn_output_show_link=> 'Y',
  p_prn_output_link_text=> 'Print',
  p_prn_content_disposition=> 'ATTACHMENT',
  p_prn_document_header=> 'APEX',
  p_prn_units=> 'INCHES',
  p_prn_paper_size=> 'LETTER',
  p_prn_width_units=> 'PERCENTAGE',
  p_prn_width=> 11,
  p_prn_height=> 8.5,
  p_prn_orientation=> 'HORIZONTAL',
  p_prn_page_header_font_color=> '#000000',
  p_prn_page_header_font_family=> 'Helvetica',
  p_prn_page_header_font_weight=> 'normal',
  p_prn_page_header_font_size=> '12',
  p_prn_page_footer_font_color=> '#000000',
  p_prn_page_footer_font_family=> 'Helvetica',
  p_prn_page_footer_font_weight=> 'normal',
  p_prn_page_footer_font_size=> '12',
  p_prn_header_bg_color=> '#9bafde',
  p_prn_header_font_color=> '#ffffff',
  p_prn_header_font_family=> 'Helvetica',
  p_prn_header_font_weight=> 'normal',
  p_prn_header_font_size=> '10',
  p_prn_body_bg_color=> '#efefef',
  p_prn_body_font_color=> '#000000',
  p_prn_body_font_family=> 'Helvetica',
  p_prn_body_font_weight=> 'normal',
  p_prn_body_font_size=> '10',
  p_prn_border_width=> .5,
  p_prn_page_header_alignment=> 'CENTER',
  p_prn_page_footer_alignment=> 'CENTER',
  p_query_asc_image=> 'arrow_down_gray_light.gif',
  p_query_asc_image_attr=> ' width="13" height="12" ',
  p_query_desc_image=> 'arrow_up_gray_light.gif',
  p_query_desc_image_attr=> ' width="13" height="12" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19418986038704412 + wwv_flow_api.g_id_offset,
  p_region_id=> 200448102410932388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_TITLE',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'#LINK_URL#',
  p_column_linktext=>'#LINK_TITLE#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 188578154776728574 + wwv_flow_api.g_id_offset,
  p_region_id=> 200448102410932388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_TEXT',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 188578250643728574 + wwv_flow_api.g_id_offset,
  p_region_id=> 200448102410932388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'LINK_URL',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_print_col_width=> '0',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10858107476130074 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_REGION_TITLE_BLOGROLL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10860023613168183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_REGION_TITLE_USEFUL_LINKS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10858830958149593 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_computation_sequence => 10,
  p_computation_item=> 'P10_REGION_TITLE_BLOGROLL',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_BLOGROLL'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10860131631169700 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_computation_sequence => 20,
  p_computation_item=> 'P10_REGION_TITLE_USEFUL_LINKS',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_USEFUL_LINKS'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10871318668355123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_computation_sequence => 30,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_RESOURCES'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10226115565708345 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_computation_sequence => 40,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':RESOURCES:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 10
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00011
prompt  ...PAGE 11: File repository
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 11
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'File repository'
 ,p_alias => 'FILES'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Files'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_inline_css => 
'td[headers="LINK"],td[headers="CREATED_ON"]{white-space:nowrap!important;}'||unistr('\000a')||
''
 ,p_required_role => 200074807242826486 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214101823'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT f.file_id'||unistr('\000a')||
'  ,f.description'||unistr('\000a')||
'  ,f.created_on'||unistr('\000a')||
'  ,f.file_name'||unistr('\000a')||
'  ,f.file_size'||unistr('\000a')||
'  ,(select apex_lang.message(''DOWNLOAD_LINK_TITLE'') from dual) AS link_title'||unistr('\000a')||
'FROM #OWNER#.blog_file f'||unistr('\000a')||
'WHERE f.active = ''Y'''||unistr('\000a')||
'  AND f.file_type = ''FILE'''||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 200461906240958157 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'N',
  p_rest_enabled=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT f.file_id'||unistr('\000a')||
'  ,f.description'||unistr('\000a')||
'  ,f.created_on'||unistr('\000a')||
'  ,f.file_name'||unistr('\000a')||
'  ,f.file_size'||unistr('\000a')||
'  ,(select apex_lang.message(''DOWNLOAD_LINK_TITLE'') from dual) AS link_title'||unistr('\000a')||
'FROM #OWNER#.blog_file f'||unistr('\000a')||
'WHERE f.active = ''Y'''||unistr('\000a')||
'  AND f.file_type = ''FILE'''||unistr('\000a')||
'';

wwv_flow_api.create_worksheet(
  p_id=> 200462079635958164+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_region_id=> 200461906240958157+wwv_flow_api.g_id_offset,
  p_name=> 'Files',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '100000',
  p_max_row_count_message=> 'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'100',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'style="vertical-align:top"',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'style="vertical-align:top"',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'N',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'NONE',
  p_show_detail_link=>'N',
  p_show_select_columns=>'N',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'N',
  p_show_highlight=>'N',
  p_show_computation=>'N',
  p_show_aggregate=>'N',
  p_show_chart=>'N',
  p_show_group_by=>'N',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'N',
  p_show_reset=>'Y',
  p_show_download=>'N',
  p_show_help=>'Y',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_use_custom=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'LAINFJAR',
  p_internal_uid=> 6466204432002829);
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 200881996418127249+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FILE_ID',
  p_display_order          =>2,
  p_column_identifier      =>'L',
  p_column_label           =>'File ID',
  p_report_label           =>'File ID',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 200462604956958183+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FILE_NAME',
  p_display_order          =>4,
  p_column_identifier      =>'I',
  p_column_label           =>'File Name',
  p_report_label           =>'File Name',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ALIAS.:FILES:0:APPLICATION_PROCESS=DOWNLOAD:::P11_FILE_NAME:#FILE_NAME#',
  p_column_linktext        =>'#FILE_NAME#',
  p_column_link_attr       =>'rel="nofollow" title="#LINK_TITLE#"',
  p_column_link_checksum_type =>'1',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 200569877142327141+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FILE_SIZE',
  p_display_order          =>5,
  p_column_identifier      =>'J',
  p_column_label           =>'File Size',
  p_report_label           =>'File Size',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'RIGHT',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'FILESIZE',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 200462199133958178+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DESCRIPTION',
  p_display_order          =>11,
  p_column_identifier      =>'B',
  p_column_label           =>'Description',
  p_report_label           =>'Description',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'N',
  p_allow_filtering        =>'N',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'LEFT',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'N',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 200462279068958182+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CREATED_ON',
  p_display_order          =>12,
  p_column_identifier      =>'C',
  p_column_label           =>'Created',
  p_report_label           =>'Created',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'N',
  p_allow_ctrl_breaks      =>'N',
  p_allow_aggregations     =>'N',
  p_allow_computations     =>'N',
  p_allow_charting         =>'N',
  p_allow_group_by         =>'N',
  p_allow_hide             =>'N',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'RIGHT',
  p_column_alignment       =>'RIGHT',
  p_format_mask            =>'&G_DATE_FORMAT.',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 10938210662546201+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'LINK_TITLE',
  p_display_order          =>13,
  p_column_identifier      =>'M',
  p_column_label           =>'Link Title',
  p_report_label           =>'Link Title',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'FILE_NAME:FILE_SIZE:DESCRIPTION:CREATED_ON:FILE_ID:LINK_TITLE';

wwv_flow_api.create_worksheet_rpt(
  p_id => 200462683193958183+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_worksheet_id => 200462079635958164+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'64669',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_sort_column_1           =>'CREATED_ON',
  p_sort_direction_1        =>'DESC',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>10936717828482057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_FILE_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 4000,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10861805143199914 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_FILES'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10869917713335973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_FILES'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10226425688718874 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':FILES:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_util.download_file('||unistr('\000a')||
'  p_file_name  => :P11_FILE_NAME,'||unistr('\000a')||
'  p_user_id    => :G_USER_ID,'||unistr('\000a')||
'  p_session_id => :APP_SESSION'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 10936413292477250 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 10,
  p_process_point=> 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'DOWNLOAD',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 11
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00012
prompt  ...PAGE 12: Visitors
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 12
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Visitors'
 ,p_alias => 'VISITORS'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Visitors'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_required_role => 200066992375286427 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214134841'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 157829188219849155 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_MAP',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_header=> '<a href="http://www.hostip.info"><img style="vertical-align:middle;" src="&G_THEME_PATH.hostip-info-86x18.gif" alt="hostip.info" /> My IP Address Lookup </a>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart5(
  p_id                     => 157829368549849163+wwv_flow_api.g_id_offset,
  p_flow_id                => wwv_flow.g_flow_id,
  p_page_id                => 12,
  p_region_id              => 157829188219849155+wwv_flow_api.g_id_offset,
  p_default_chart_type     =>'Map',
  p_chart_title            =>'',
  p_chart_rendering        =>'FLASH_PREFERRED',
  p_chart_name             =>'chart_22269404799758900',
  p_chart_width            =>700,
  p_chart_height           =>400,
  p_chart_animation        =>'Appear',
  p_display_attr           =>':H:::B::N::V:Y:None:::::::::',
  p_dial_tick_attr         =>'',
  p_gantt_attr             =>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E',
  p_pie_attr               =>'Outside:::',
  p_map_attr               =>'Equirectangular:RegionBounds:REGION_NAME:Y:Y:Series::::N:',
  p_map_source             =>'world/world.amap',
  p_margins                =>'26:::',
  p_omit_label_interval    => null,
  p_bgtype                 =>'Trans',
  p_bgcolor1               =>'',
  p_bgcolor2               =>'',
  p_gradient_rotation      =>null,
  p_grid_bgtype            =>'Trans',
  p_grid_bgcolor1          =>'',
  p_grid_bgcolor2          =>'',
  p_grid_gradient_rotation =>null,
  p_color_scheme           =>'7',
  p_custom_colors          =>'',
  p_map_undef_color_scheme =>'',
  p_map_undef_custom_colors =>'',
  p_x_axis_title           =>'',
  p_x_axis_min             =>null,
  p_x_axis_max             =>null,
  p_x_axis_decimal_place   =>null,
  p_x_axis_prefix          =>'',
  p_x_axis_postfix         =>'',
  p_x_axis_label_rotation  =>'',
  p_x_axis_label_font      =>'Tahoma:10:#000000',
  p_x_axis_major_interval  =>null,
  p_x_axis_minor_interval  =>null,
  p_y_axis_title           =>'',
  p_y_axis_min             =>null,
  p_y_axis_max             =>null,
  p_y_axis_decimal_place   =>null,
  p_y_axis_prefix          =>'',
  p_y_axis_postfix         =>'',
  p_y_axis_label_rotation  =>'',
  p_y_axis_label_font      =>'Tahoma:10:#000000',
  p_y_axis_major_interval  =>null,
  p_y_axis_minor_interval  =>null,
  p_async_update           =>'N',
  p_async_time             =>null,
  p_legend_title           =>'',
  p_legend_title_font      =>'',
  p_names_font             => null,
  p_names_rotation         => null,
  p_values_font            =>'Tahoma:10:#000000',
  p_values_rotation        =>null,
  p_values_prefix          =>'',
  p_values_postfix         =>'',
  p_hints_font             =>'Tahoma:10:#000000',
  p_legend_font            =>'Tahoma:10:#000000',
  p_grid_labels_font       =>'Tahoma:10:#000000',
  p_chart_title_font       =>'Tahoma:14:#000000',
  p_x_axis_title_font      =>'Tahoma:14:#000000',
  p_x_axis_title_rotation  =>'',
  p_y_axis_title_font      =>'Tahoma:14:#000000',
  p_y_axis_title_rotation  =>'',
  p_gauge_labels_font      =>'Tahoma:10:#000000',
  p_use_chart_xml          =>'N',
  p_chart_xml              => a1);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT NULL AS link_col'||unistr('\000a')||
'  ,v.country_name'||unistr('\000a')||
'  ,SUM(v.visit_count) AS visit_count'||unistr('\000a')||
' FROM blog_country v'||unistr('\000a')||
'WHERE v.country_code != ''XX'''||unistr('\000a')||
'  AND v.visit_count > 0'||unistr('\000a')||
'GROUP BY NULL'||unistr('\000a')||
'  ,v.country_name'||unistr('\000a')||
'ORDER BY 3'||unistr('\000a')||
'';

wwv_flow_api.create_flash_chart5_series(
  p_id                        => 157829484853849163+wwv_flow_api.g_id_offset,
  p_chart_id                  => 157829368549849163+wwv_flow_api.g_id_offset,
  p_flow_id                   => wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_type               =>'Map',
  p_series_query_type         =>'SQL_QUERY',
  p_series_ajax_items_to_submit=>'',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No data found.',
  p_series_query_row_count_max=>300,
  p_action_link               =>'',
  p_show_action_link          =>'N',
  p_action_link_checksum_type =>'',
  p_display_when_cond_type    =>'',
  p_display_when_condition    =>'',
  p_display_when_condition2   =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10862507699210062 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_VISITOR_MAP'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10868714119325475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_VISITOR'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10227021794735825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':VISITORS:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 12
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00013
prompt  ...PAGE 13: FAQ
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 13
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'FAQ'
 ,p_alias => 'FAQ'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'FAQ'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'||unistr('\000a')||
''
 ,p_required_role => 200132890661760400 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213110121'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'WITH qry AS ('||unistr('\000a')||
'  SELECT '||unistr('\000a')||
'     ROW_NUMBER() OVER(ORDER BY f.faq_seq) AS n'||unistr('\000a')||
'    ,f.question'||unistr('\000a')||
'    ,f.answer'||unistr('\000a')||
'  FROM #OWNER#.blog_faq f'||unistr('\000a')||
'  WHERE f.active =  ''Y'''||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'   APEX_LANG.MESSAGE(''FAQ_QUESTION'', qry.n) AS faq_no'||unistr('\000a')||
'  ,qry.question'||unistr('\000a')||
'  ,qry.answer'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'ORDER BY qry.n';

wwv_flow_api.create_report_region (
  p_id=> 200459775289949837 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 200706979642003808+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '50',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '50',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 10222602151501883 + wwv_flow_api.g_id_offset,
  p_region_id=> 200459775289949837 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'FAQ_NO',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200460679785949845 + wwv_flow_api.g_id_offset,
  p_region_id=> 200459775289949837 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'QUESTION',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200460791230949845 + wwv_flow_api.g_id_offset,
  p_region_id=> 200459775289949837 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ANSWER',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10864001035227107 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_FAQ'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10867403945313055 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_FAQ'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10227310148741234 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':FAQ:0'''||unistr('\000a')||
'',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 13
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00014
prompt  ...PAGE 14: Authors
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 14
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Authors'
 ,p_alias => 'AUTHORS'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Authors'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_required_role => 200075100988829346 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141213112937'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT '||unistr('\000a')||
'  a.author_name,'||unistr('\000a')||
'  a.bio,'||unistr('\000a')||
'  a.author_seq,'||unistr('\000a')||
'  a.author_id'||unistr('\000a')||
'FROM #OWNER#.blog_author a'||unistr('\000a')||
'WHERE a.active = ''Y'''||unistr('\000a')||
'ORDER BY a.author_seq';

wwv_flow_api.create_report_region (
  p_id=> 200465305676969805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 14,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 204627982111044660+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '5',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '5',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200465602157969809 + wwv_flow_api.g_id_offset,
  p_region_id=> 200465305676969805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 200465692881969809 + wwv_flow_api.g_id_offset,
  p_region_id=> 200465305676969805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'BIO',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 28679026591810914 + wwv_flow_api.g_id_offset,
  p_region_id=> 200465305676969805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_SEQ',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Author Seq',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 177163233202137702 + wwv_flow_api.g_id_offset,
  p_region_id=> 200465305676969805 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10865216019288210 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_AUTHOR'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10866125154300288 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_AUTHOR'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10227630839746842 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':AUTHORS:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 14
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00015
prompt  ...PAGE 15: Contact form
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 15
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Contact form'
 ,p_alias => 'CONTACT'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_javascript_file_urls => '#IMAGE_PREFIX#libraries/jquery-ui/1.8.22/ui/minified/jquery.ui.button.min.js'
 ,p_required_role => 186579061301136844 + wwv_flow_api.g_id_offset
 ,p_required_patch => 19434169279261909 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_browser_cache => 'N'
 ,p_deep_linking => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214114716'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'"MSG_CONFIRM_COMMENT"';

wwv_flow_api.create_page_plug (
  p_id=> 85219609232986499 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Confirm dialog',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 200173584798199453+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>"MSG_CONTACT_FORM"</p>'||unistr('\000a')||
'<p>"MSG_REQUIRED_FIELDS"</p>';

wwv_flow_api.create_page_plug (
  p_id=> 186596349969820674 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>186601943842847835 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_branch_name=> 'Goto home page',
  p_branch_action=> '1',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'BRANCH_TO_STEP',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16932865312878882 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_MATH_QUESTION_ANSWER',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 21272493943377828+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>16979986987432452 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_NO_HTML_CODE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> '"MSG_NO_HTML"',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'BELOW',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'I',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_LAST_NAME" It will be displayed in comment posted by.';

wwv_flow_api.create_page_item(
  p_id=>21499191429247879 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_LAST_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Your Last Name',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 80,
  p_cHeight=> 1,
  p_cattributes_element=>'class="hideMe508"',
  p_tag_attributes  => 'required',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 85682918386179396+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => 'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85224136012363614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_MATH_QUESTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Question answer',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'PLUGIN_NET.WEBHOP.DBSWH.MATH_QUESTION_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_tag_attributes  => 'style="text-align:right"',
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 1003338938911992905+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_security_scheme => 177066440145888817+ wwv_flow_api.g_id_offset,
  p_attribute_01 => 'P15_MATH_QUESTION_ANSWER',
  p_attribute_02 => '1',
  p_attribute_03 => '46',
  p_attribute_04 => '1',
  p_attribute_05 => '46',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your message to author(s). "MSG_NO_HTML"';

wwv_flow_api.create_page_item(
  p_id=>186598564626820792 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_COMMENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Your Comment',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'PLUGIN_NET.WEBHOP.DBSWH.COMMENT_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 10,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'WEB_SAFE',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_EMAIL"';

wwv_flow_api.create_page_item(
  p_id=>186598747246820794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Your Email',
  p_source=>'EMAIL',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 256,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_NICK_NAME"';

wwv_flow_api.create_page_item(
  p_id=>186598938449820794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_NICK_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Your Name',
  p_source=>'NICK_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 80,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906279967063673+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'"HELP_WEBSITE"';

wwv_flow_api.create_page_item(
  p_id=>186599139203820794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_WEBSITE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Your Website',
  p_source=>'WEBSITE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 256,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 194906175811062416+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>186605970064902152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_SUBMIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Submit',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'Y',
  p_button_action => 'DEFINED_BY_DA',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>186607137913996981 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_CANCEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 186596349969820674+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Cancel',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT-BOTTOM',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'N',
  p_button_action => 'REDIRECT_URL',
  p_button_redirect_url => 'f?p=&APP_ALIAS.:HOME:0',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 21507979756471794 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 10,
  p_computation_item=> 'P15_NICK_NAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(:P15_NICK_NAME)',
  p_computation_error_message => 'Error on: Computation NICK',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 21508182873472754 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 20,
  p_computation_item=> 'P15_EMAIL',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(LOWER(:P15_EMAIL))',
  p_computation_error_message => 'Error on: Computation EMAIL',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 21508386336473704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 30,
  p_computation_item=> 'P15_WEBSITE',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'TRIM(:P15_WEBSITE)',
  p_computation_error_message => 'Error on: Computation WEBSITE',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10896214024825932 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 40,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_CONTACT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10897002625842520 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_computation_sequence => 50,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_CONTACT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85227739811585522 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Not banned',
  p_validation_sequence=> 10,
  p_validation => 'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_block b'||unistr('\000a')||
'WHERE b.active       = ''Y'''||unistr('\000a')||
'AND ( ( b.block_type = ''EMAIL'''||unistr('\000a')||
'AND b.block_value    = :P15_EMAIL )'||unistr('\000a')||
'OR ( b.block_type    = ''IP'''||unistr('\000a')||
'AND b.block_value    = owa_util.get_cgi_env(''REMOTE_ADDR'') )'||unistr('\000a')||
'OR ( b.block_type    = ''USER_AGENT'''||unistr('\000a')||
'AND b.block_value    = owa_util.get_cgi_env(''HTTP_USER_AGENT'') ) )'||unistr('\000a')||
'UNION ALL'||unistr('\000a')||
'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_user u'||unistr('\000a')||
'WHERE u.blocked = ''Y'''||unistr('\000a')||
'AND u.email     = :P15_EMAIL',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'It is not possible submit comment at this time.',
  p_always_execute=>'N',
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 21499788410249269 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_LAST_NAME is null',
  p_validation_sequence=> 20,
  p_validation => ':P15_LAST_NAME IS NULL',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'It is not possible submit comment at this time.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 21499191429247879 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'ON_ERROR_PAGE',
  p_validation_comment=> 'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16984075879389348 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_NICK_NAME max length',
  p_validation_sequence=> 30,
  p_validation => 'LENGTH(:P15_NICK_NAME) <= 80',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 80 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 186598938449820794 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85228130537589759 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_NICK_NAME is not reserved',
  p_validation_sequence=> 40,
  p_validation => 'SELECT 1'||unistr('\000a')||
'FROM #OWNER#.blog_comment_user'||unistr('\000a')||
'WHERE UPPER(nick_name) = UPPER(:P15_NICK_NAME)'||unistr('\000a')||
'  AND email != :P15_EMAIL',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => '#LABEL# is already reserved.',
  p_always_execute=>'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 186598938449820794 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 85227933556588353 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_EMAIL address is valid',
  p_validation_sequence=> 50,
  p_validation => '#OWNER#.blog_util.validate_email(:P15_EMAIL);',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter a valid #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 186598747246820794 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16984886003399822 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_WEBSITE max length',
  p_validation_sequence=> 60,
  p_validation => 'LENGTH(:P15_WEBSITE) <= 256',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 256 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 186599139203820794 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 16985889429428639 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P15_COMMENT max length',
  p_validation_sequence=> 70,
  p_validation => 'LENGTH(:P15_COMMENT) <= 2000',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Please enter no more than 2000 characters for #LABEL#.',
  p_always_execute=>'N',
  p_associated_item=> 186598564626820792 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 19439792996848700 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 15
 ,p_name => 'Modal confirm dialog'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'BUTTON'
 ,p_triggering_button_id => 186605970064902152 + wwv_flow_api.g_id_offset
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'click'
  );
wwv_flow_api.create_page_da_action (
  p_id => 19440090408848704 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 15
 ,p_event_id => 19439792996848700 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'PLUGIN_NET.WEBHOP.DBSWH.MODAL_CONFIRM'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 85219609232986499 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_util.save_contact('||unistr('\000a')||
'  p_user_id         => :G_USER_ID,'||unistr('\000a')||
'  p_apex_session_id => :APP_SESSION,'||unistr('\000a')||
'  p_email           => :P15_EMAIL,'||unistr('\000a')||
'  p_nick_name       => :P15_NICK_NAME,'||unistr('\000a')||
'  p_website         => :P15_WEBSITE,'||unistr('\000a')||
'  -- Plugin "Comment Textarea" saves formatted and escaped comment to variable.'||unistr('\000a')||
'  -- Insert that to table.'||unistr('\000a')||
'  p_comment         => #OWNER#.blog_plugin.g_formatted_comment'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 85231012457712779 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Save contact message',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Save message',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>186605970064902152 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Thank you for submitting message.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'15';

wwv_flow_api.create_page_process(
  p_id     => 85231412719731780 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear items',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Clear items',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:BLOG_COMMENT_USER:G_USER_ID:USER_ID';

wwv_flow_api.create_page_process(
  p_id     => 21495397765127021 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 30,
  p_process_point=> 'BEFORE_BOX_BODY',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch BLOG_COMMENT_USER',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Automated Row Fetch ',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'G_USER_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 15
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00016
prompt  ...PAGE 16: About
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 16
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'About'
 ,p_alias => 'ABOUT'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'About'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_required_role => 85237926821183966 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214105908'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT t.long_text'||unistr('\000a')||
'FROM #OWNER#.blog_long_text t'||unistr('\000a')||
'WHERE t.long_text_id = ''ABOUT'''||unistr('\000a')||
'ORDER BY t.long_text_id';

wwv_flow_api.create_report_region (
  p_id=> 85767035081573823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 16,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85242714239280978+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '1',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '1',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 27968724327991866 + wwv_flow_api.g_id_offset,
  p_region_id=> 85767035081573823 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LONG_TEXT',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10898604941860445 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 16,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_ABOUT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10227916390753534 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 16,
  p_computation_sequence => 20,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':ABOUT:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10898115077855791 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 16,
  p_computation_sequence => 30,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_ABOUT'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 16
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00017
prompt  ...PAGE 17: Disclaimer
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 17
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Disclaimer'
 ,p_alias => 'DISCLAIMER'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_required_role => 20922271866560678 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214105927'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT t.long_text'||unistr('\000a')||
'FROM #OWNER#.blog_long_text t'||unistr('\000a')||
'WHERE t.long_text_id = ''DISCLAIMER'''||unistr('\000a')||
'ORDER BY t.long_text_id';

wwv_flow_api.create_report_region (
  p_id=> 20923198867617671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 17,
  p_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85242714239280978+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '1',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '1',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20923367077617676 + wwv_flow_api.g_id_offset,
  p_region_id=> 20923198867617671 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LONG_TEXT',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10899324986866418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 17,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_DISCLAIMER'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10899520025868687 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 17,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_DISCLAIMER'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10228200000761114 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 17,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':DISCLAIMER:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 17
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00018
prompt  ...PAGE 18: Photo Gallery
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 18
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Photo Gallery'
 ,p_alias => 'PHOTOS'
 ,p_step_title => '&G_PAGE_TITLE.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Photo Gallery'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"CANONICAL_URL"'
 ,p_inline_css => 
'ol.bjqs-markers li a{'||unistr('\000a')||
'	display:inline-block;'||unistr('\000a')||
'	border: 1px solid #005eb0;'||unistr('\000a')||
'	border-radius: 3px;'||unistr('\000a')||
'	display: inline-block;'||unistr('\000a')||
'	height: 14px;'||unistr('\000a')||
'	line-height: 14px;'||unistr('\000a')||
'	margin: 2px;'||unistr('\000a')||
'	padding: 3px 5px;'||unistr('\000a')||
'	text-align: center;'||unistr('\000a')||
'	width: 14px;'||unistr('\000a')||
''||unistr('\000a')||
'}'||unistr('\000a')||
'ol.bjqs-markers li.active-marker a{'||unistr('\000a')||
'    background: none repeat scroll 0 0 #005eb0;'||unistr('\000a')||
'    border-radius: 3px;'||unistr('\000a')||
'    color: #fafafa;'||unistr('\000a')||
'    display: inline-block;'||unistr('\000a')||
'    height: 14px;'||unistr('\000a')||
'   '||
' line-height: 14px;'||unistr('\000a')||
'    margin: 2px;'||unistr('\000a')||
'    padding: 4px 7px;'||unistr('\000a')||
'    text-align: center;'||unistr('\000a')||
'    width: 14px;'||unistr('\000a')||
'}'
 ,p_required_role => 10927018932947823 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141214152244'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>"MSG_PHOTO_GALLERY"</p>';

wwv_flow_api.create_page_plug (
  p_id=> 10911416766442595 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 18,
  p_plug_name=> '&G_REGION_TITLE.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 235001201303596179+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 10908032750328995 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 18,
  p_plug_name=> 'Photo Gallery',
  p_region_name=>'',
  p_parent_plug_id=>10911416766442595 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'N',
  p_plug_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 10907816579328992 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 10907431415229208+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10902714221082834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 18,
  p_computation_sequence => 10,
  p_computation_item=> 'G_REGION_TITLE',
  p_computation_point=> 'BEFORE_BOX_BODY',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''REGION_TITLE_PHOTOS'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10902905973082834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 18,
  p_computation_sequence => 20,
  p_computation_item=> 'G_PAGE_TITLE',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'apex_lang.message(''PAGE_TITLE_PHOTOS'')',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 10902515481082834 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 18,
  p_computation_sequence => 30,
  p_computation_item=> 'G_CANONICAL_HREF',
  p_computation_point=> 'BEFORE_HEADER',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '''f?p='' || :APP_ALIAS || '':PHOTOS:0''',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 10910420052405650 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 18
 ,p_name => 'Set Photo Gallery'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 10910705551405655 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 18
 ,p_event_id => 10910420052405650 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 10908032750328995 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'this.affectedElements.bjqs({'||unistr('\000a')||
' animtype:"fade",'||unistr('\000a')||
' height:400,'||unistr('\000a')||
' width:700,'||unistr('\000a')||
' usecaptions:true,'||unistr('\000a')||
' showcontrols:false,'||unistr('\000a')||
' responsive:true,'||unistr('\000a')||
' automatic:true'||unistr('\000a')||
'});'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 18
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00020
prompt  ...PAGE 20: RSS feed
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 20
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'RSS feed'
 ,p_alias => 'RSS'
 ,p_step_title => 'RSS feed'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'RSS feed'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_step_template => 21526292157345770 + wwv_flow_api.g_id_offset
 ,p_required_role => 177269928459346158 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20140718133628'
  );
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_xml.rss(:APP_ALIAS, :G_BLOG_NAME, :G_BASE_URL);';

wwv_flow_api.create_page_process(
  p_id     => 85762340330506520 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 20,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Output RSS feed',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process:RSS feed',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 20
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00021
prompt  ...PAGE 21: Sitemap
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 21
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Sitemap'
 ,p_alias => 'SITEMAP'
 ,p_step_title => 'Sitemap'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Sitemap'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_step_template => 21526292157345770 + wwv_flow_api.g_id_offset
 ,p_required_role => 17029362785174007 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20141206175628'
  );
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.blog_xml.sitemap(:APP_ID, :APP_ALIAS, :G_BASE_URL, ''TABS'');';

wwv_flow_api.create_page_process(
  p_id     => 85763526756512687 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Output sitemap',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Sitemap',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 21
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00023
prompt  ...PAGE 23: Unsubscribe
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 23
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Unsubscribe'
 ,p_alias => 'UNSUBSCRIBE'
 ,p_step_title => 'Unsubscribe'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Unsubscribe'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200204786797318269 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_step_template => 21526292157345770 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'C'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20140719110925'
  );
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>85765611415555798 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 23,
  p_branch_name=> 'Goto article',
  p_branch_action=> '3',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'BRANCH_TO_STEP',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'ITEM_IS_NOT_NULL',
  p_branch_condition=> 'SUBSCRIBER_ID',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>85765829071555798 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 23,
  p_branch_name=> 'Goto home page',
  p_branch_action=> 'HOME_LINK',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'BRANCH_TO_URL_IDENT_BY_ITEM',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 23
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login Page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Login Page'
 ,p_alias => 'LOGIN_DESKTOP'
 ,p_step_title => 'Login Page'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200051794058691127 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_step_template => 85696939003116068 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'U'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20140728121852'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 85681241499175159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login Page',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85681434874175159 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 85681241499175159+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Username',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 85682918386179396+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85681633192175160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 85681241499175159+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Password',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 85682918386179396+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85681809779175160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 85681241499175159+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(199712388480191134 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_protection_level => 'S',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.send_login_username_cookie ('||unistr('\000a')||
'  p_username => lower(:P101_USERNAME)'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 85682211613175160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Set Username Cookie',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.login ('||unistr('\000a')||
'  p_username => :P101_USERNAME,'||unistr('\000a')||
'  p_password => :P101_PASSWORD'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 85682037485175160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Login',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 85682636096175161 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Clear Page(s) Cache',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P101_USERNAME := apex_authentication.get_login_username_cookie;';

wwv_flow_api.create_page_process(
  p_id     => 85682413882175161 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> 'Error on process: Get Username Cookie',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00201
prompt  ...PAGE 201: Article preview
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 201
 ,p_user_interface_id => 244292879420806699 + wwv_flow_api.g_id_offset
 ,p_name => 'Article preview'
 ,p_alias => 'PREVIEW'
 ,p_step_title => 'Article preview'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Article preview'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 200051794058691127 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'"ROBOTS_NOINDEX"'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20140725083506'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT'||unistr('\000a')||
'  a.category_id'||unistr('\000a')||
'  ,a.author_id'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,c.category_name'||unistr('\000a')||
'  ,SYSDATE AS created_on'||unistr('\000a')||
'  ,b.author_name'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,0 AS comment_count'||unistr('\000a')||
'  ,(SELECT APEX_LANG.LANG(''Posted on'') FROM DUAL) AS created_on_txt'||unistr('\000a')||
'  ,(SELECT APEX_LANG.LANG(''by'') FROM DUAL) AS posted_by_txt'||unistr('\000a')||
'  ,(SELECT APEX_LANG.LANG(''Category'') FROM DUAL) AS category_txt'||unistr('\000a')||
'  ,(SELECT APEX_LANG.LANG(''Post a Comment'') FROM ';

s:=s||'DUAL) AS post_comment'||unistr('\000a')||
'FROM blog_article_preview a'||unistr('\000a')||
'  LEFT JOIN blog_author b ON a.author_id = b.author_id'||unistr('\000a')||
'  LEFT JOIN blog_category c ON a.category_id = c.category_id'||unistr('\000a')||
'WHERE a.apex_session_id = :P201_ARTICLE'||unistr('\000a')||
'ORDER BY a.author_id';

wwv_flow_api.create_report_region (
  p_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_name=> 'Read Article',
  p_region_name=>'',
  p_template=> 244237336194595264+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'BELOW',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_rest_enabled=> 'N',
  p_query_row_template=> 85867610925851325+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '1',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No articles found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '1',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'N',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85904030691201865 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20952372080195512 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 19419785163720035 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TITLE',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_html_expression=>'<span>#ARTICLE_TITLE#</span>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85904132836201865 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85759812837484430 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_format=> '&G_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20952489766195512 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'AUTHOR_NAME',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85759718928484430 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'ARTICLE_TEXT',
  p_column_display_sequence=> 7,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85904210925201865 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENT_COUNT',
  p_column_display_sequence=> 8,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20952796221199563 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON_TXT',
  p_column_display_sequence=> 9,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85904338322201865 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'POSTED_BY_TXT',
  p_column_display_sequence=> 10,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85782131234676241 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'CATEGORY_TXT',
  p_column_display_sequence=> 11,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 85904534525201865 + wwv_flow_api.g_id_offset,
  p_region_id=> 85759430952484416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'POST_COMMENT',
  p_column_display_sequence=> 12,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_html_expression=>'<span class="comment-link">#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="" /></span>',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>85897432240382176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_ARTICLE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 409282767205906764+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'B',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 201
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/photo_gallery
 
begin
 
wwv_flow_api.create_list (
  p_id=> 10907816579328992 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'PHOTO_GALLERY',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'SELECT NULL AS list_level'||unistr('\000a')||
'  ,f.description'||unistr('\000a')||
'  ,NULL AS link_target'||unistr('\000a')||
'  ,''YES'' is_current'||unistr('\000a')||
'  ,apex_util.prepare_url(''f?p='' || :APP_ID || '':FILES:0:APPLICATION_PROCESS=DOWNLOAD:::P11_FILE_NAME:'' || f.file_name, NULL, ''PUBLIC_BOOKMARK'') AS img_url'||unistr('\000a')||
'FROM blog_file f'||unistr('\000a')||
'WHERE f.file_type = ''GALLERY'''||unistr('\000a')||
'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/categories
 
begin
 
wwv_flow_api.create_list (
  p_id=> 244235551410577019 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'CATEGORIES',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'SELECT'||unistr('\000a')||
'  NULL AS link_level'||unistr('\000a')||
'  ,c.category_name AS link_text'||unistr('\000a')||
'  ,APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READCAT:0::::CATEGORY:'' || c.category_id, NULL, ''PUBLIC_BOOKMARK'') AS target'||unistr('\000a')||
'  ,CASE WHEN :APP_PAGE_ID = 4 AND :CATEGORY = c.category_id'||unistr('\000a')||
'   THEN ''YES'''||unistr('\000a')||
'   ELSE ''NO'''||unistr('\000a')||
'   END AS is_current'||unistr('\000a')||
'FROM #OWNER#.blog_category c'||unistr('\000a')||
'WHERE EXISTS('||unistr('\000a')||
'  SELECT 1 '||unistr('\000a')||
'  FROM #OWNER#.blog_article a'||unistr('\000a')||
'  WHERE a.category_id = c.category_id'||unistr('\000a')||
'    AND a.active = ''Y'''||unistr('\000a')||
')'||unistr('\000a')||
'ORDER BY c.category_seq',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/latest_articles
 
begin
 
wwv_flow_api.create_list (
  p_id=> 244235726953579388 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'LATEST_ARTICLES',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'WITH qry AS('||unistr('\000a')||
'  SELECT /*+ first_rows(5) */'||unistr('\000a')||
'     ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn'||unistr('\000a')||
'    ,a.article_title AS link_text'||unistr('\000a')||
'    ,APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS target'||unistr('\000a')||
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id'||unistr('\000a')||
'     THEN ''YES'''||unistr('\000a')||
'     ELSE ''NO'''||unistr('\000a')||
'     END AS is_current'||unistr('\000a')||
'  FROM #OWNER#.blog_article_last20 a'||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  NULL AS link_level'||unistr('\000a')||
'  ,qry.link_text'||unistr('\000a')||
'  ,qry.target'||unistr('\000a')||
'  ,qry.is_current'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE qry.rn <= 5'||unistr('\000a')||
'ORDER BY qry.rn',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/most_clicked_articles
 
begin
 
wwv_flow_api.create_list (
  p_id=> 244235933879581345 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'MOST_CLICKED_ARTICLES',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'WITH qry AS ('||unistr('\000a')||
'  SELECT /*+ first_rows(5) */'||unistr('\000a')||
'     ROW_NUMBER() OVER (ORDER BY a.top_article DESC) rn'||unistr('\000a')||
'    ,a.article_title AS link_text'||unistr('\000a')||
'    ,APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'')  AS target'||unistr('\000a')||
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id'||unistr('\000a')||
'     THEN ''YES'''||unistr('\000a')||
'     ELSE ''NO'''||unistr('\000a')||
'     END AS is_current'||unistr('\000a')||
'  FROM #OWNER#.blog_article_top20 a'||unistr('\000a')||
') '||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  NULL AS link_level'||unistr('\000a')||
'  ,qry.link_text'||unistr('\000a')||
'  ,qry.target'||unistr('\000a')||
'  ,qry.is_current'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE qry.rn <= 5'||unistr('\000a')||
'ORDER BY qry.rn',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/most_day_hit_articles
 
begin
 
wwv_flow_api.create_list (
  p_id=> 244236142191583784 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'MOST_DAY_HIT_ARTICLES',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'WITH qry AS ('||unistr('\000a')||
'  SELECT /*+ first_rows(5) */'||unistr('\000a')||
'     ROW_NUMBER() OVER (ORDER BY a.top_hit DESC) rn'||unistr('\000a')||
'    ,a.article_title AS link_text'||unistr('\000a')||
'    ,APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS target'||unistr('\000a')||
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id'||unistr('\000a')||
'     THEN ''YES'''||unistr('\000a')||
'     ELSE ''NO'''||unistr('\000a')||
'     END AS is_current'||unistr('\000a')||
'  FROM #OWNER#.blog_article_hit20 a'||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  NULL AS link_level'||unistr('\000a')||
'  ,qry.link_text'||unistr('\000a')||
'  ,qry.target'||unistr('\000a')||
'  ,qry.is_current'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE qry.rn <= 5'||unistr('\000a')||
'ORDER BY qry.rn',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/tabs
 
begin
 
wwv_flow_api.create_list (
  p_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'TABS',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
wwv_flow_api.create_list_item (
  p_id=> 247621177711580585 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'HOME',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:HOME:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '1,2,3,4,5,9,23,201',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 20919883943555104 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'DISCLAIMER',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:DISCLAIMER:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 20922271866560678+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 200406603580553329 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'RESOURCE',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:RESOURCES:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 200069793404346775+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 10903905341164150 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>40,
  p_list_item_link_text=> 'PHOTO',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:PHOTOS:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 10927018932947823+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 200406797972555891 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'FILE',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:FILES:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 200074807242826486+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 200406992581558507 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>60,
  p_list_item_link_text=> 'VISITOR',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:VISITORS:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 200066992375286427+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 85239821621216782 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>70,
  p_list_item_link_text=> 'ABOUT',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:ABOUT:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 85237926821183966+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 200087193557666801 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>80,
  p_list_item_link_text=> 'FAQ',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:FAQ:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 200132890661760400+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 199639096381955269 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>90,
  p_list_item_link_text=> 'AUTHOR',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:AUTHORS:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 200075100988829346+ wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 186579645127144335 + wwv_flow_api.g_id_offset,
  p_list_id=> 247620974603580536 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>100,
  p_list_item_link_text=> 'CONTACT',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:CONTACT:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_security_scheme => 186579061301136844+ wwv_flow_api.g_id_offset,
  p_required_patch => 19434169279261909 + wwv_flow_api.g_id_offset,
  p_list_item_current_type=> 'TARGET_PAGE',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
prompt  ...page templates for application: 290
--
--application/shared_components/user_interface/templates/page/minimal
prompt  ......Page template 21526292157345770
 
begin
 
wwv_flow_api.create_template (
  p_id => 21526292157345770 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 202
 ,p_name => 'Minimal'
 ,p_is_popup => false
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body>'
 ,p_box => 
'#BOX_BODY#'
 ,p_footer_template => 
'</body></html>'
 ,p_theme_class_id => 9
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => true
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/error_page
prompt  ......Page template 59538697487157434
 
begin
 
wwv_flow_api.create_template (
  p_id => 59538697487157434 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 202
 ,p_name => 'Error page'
 ,p_is_popup => false
 ,p_css_file_urls => '&G_THEME_PATH.style#MIN#.css?v=#APP_VERSION#'
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />'||unistr('\000a')||
'<meta name="robots" value="noindex" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'
 ,p_box => 
'<div id="header-container">'||unistr('\000a')||
' <div id="header">'||unistr('\000a')||
'  <div id="title">'||unistr('\000a')||
'   <h1><a href="&HOME_LINK.">#LOGO#</a></h1>'||unistr('\000a')||
'   #REGION_POSITION_01#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="menu">#REGION_POSITION_03#</div>'||unistr('\000a')||
' </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="page-body">'||unistr('\000a')||
'<div id="wrap"> '||unistr('\000a')||
' <div id="center">'||unistr('\000a')||
'  #GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'  #NOTIFICATION_MESSAGE#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="clear"></div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#"><img src="#IMAGE#" alt="#TEXT#" title="#TEXT#"/>#TEXT#</a>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_region_table_cattributes => 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" '
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 8
 ,p_error_page_template => '<div class="errcontainer">'||unistr('\000a')||
' <p class="fielddatabold">#MESSAGE#</p>'||unistr('\000a')||
' <p class="fielddata"><a href="&HOME_LINK.">#RETURN_TO_APPLICATION#</a></p>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => false
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 85696939003116068
 
begin
 
wwv_flow_api.create_template (
  p_id => 85696939003116068 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 202
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_css_file_urls => '&G_THEME_PATH.style#MIN#.css?v=#APP_VERSION#'
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />'||unistr('\000a')||
'<meta name="robots" value="noindex" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'
 ,p_box => 
'<div id="login">'||unistr('\000a')||
' <div id="login-messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>'||unistr('\000a')||
' <div id="login-main">#BOX_BODY#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''
 ,p_footer_template => 
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0"'
 ,p_theme_class_id => 6
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => false
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_right_side_bar
prompt  ......Page template 1003363250164640425
 
begin
 
wwv_flow_api.create_template (
  p_id => 1003363250164640425 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 202
 ,p_name => 'No Tabs with Right Side Bar'
 ,p_is_popup => false
 ,p_css_file_urls => '&G_THEME_PATH.style#MIN#.css?v=#APP_VERSION#'
 ,p_header_template => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link type="application/rss+xml" href="&G_RSS_FEED_URL." rel="alternate" title="&G_BLOG_NAME. RSS Feed" />'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />'||unistr('\000a')||
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />'||unistr('\000a')||
'&G_GOOGLE_WEBMASTER_META.'||unistr('\000a')||
'&G_BING_WEBMASTER_META.'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'&G_GOOGLE_ANALYTICS_JS_CODE.'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'
 ,p_box => 
'<div id="header-container">'||unistr('\000a')||
' <div id="header">'||unistr('\000a')||
'  <div id="title">'||unistr('\000a')||
'   <h1>'||unistr('\000a')||
'    <a href="&HOME_LINK.">#LOGO#</a>'||unistr('\000a')||
'   </h1>'||unistr('\000a')||
'   #REGION_POSITION_01#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="menu">#REGION_POSITION_03#</div>'||unistr('\000a')||
' </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="mainbody">'||unistr('\000a')||
'<div id="wrap"> '||unistr('\000a')||
' <div id="center">'||unistr('\000a')||
'  #GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  #SUCCESS_MESSAGE#'||unistr('\000a')||
'  #NOTIFICATION_MESSAGE#'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="right">#REGION_POSITION_05#</'||
'div>'||unistr('\000a')||
' <div class="clear"></div>'
 ,p_footer_template => 
' #REGION_POSITION_08#'||unistr('\000a')||
'</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#"><img src="#IMAGE#" alt="#TEXT#" title="#TEXT#"/>#TEXT#</a>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_region_table_cattributes => 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" '
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_error_page_template => '<div class="errcontainer">'||unistr('\000a')||
' <p class="fielddatabold">#MESSAGE#</p>'||unistr('\000a')||
' <p class="fielddata"><a href="&HOME_LINK.">#RETURN_TO_APPLICATION#</a></p>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'TABLE'
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_has_edit_links => false
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 199712388480191134
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 199712388480191134 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-gray" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span>#LABEL#</span></button>'
 ,p_hot_template => 
'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt1" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span>#LABEL#</span></button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 202
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/report_region_backup
prompt  ......region template 10857629460112327
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 10857629460112327 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="reportsregion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h2>#TITLE#</h2>'||unistr('\000a')||
'#SUB_REGION_HEADERS#'||unistr('\000a')||
'<div class="regionbody">#BODY##SUB_REGIONS#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_sub_plug_header_template => '#ENTRIES#'
 ,p_sub_plug_header_entry_templ => '<h2>#SUB_REGION_TITLE#</h2>'
 ,p_sub_plug_template => '<div id="#SUB_REGION_ID#">#SUB_REGION#</div>'
 ,p_page_plug_template_name => 'Report Region backup'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/footer_region
prompt  ......region template 61152914134065932
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 61152914134065932 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="footer #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Footer Region'
 ,p_theme_id => 202
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 179113213838116989
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 179113213838116989 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="borderlessregion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#><h2>#TITLE#</h2><div class="regionbody">#BODY#</div></div>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 7
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/jquery_modal_region_template
prompt  ......region template 200173584798199453
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 200173584798199453 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="hideMe508 #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'jQuery Modal Region Template'
 ,p_theme_id => 202
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_region
prompt  ......region template 235001201303596179
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 235001201303596179 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="reportsregion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h2>#TITLE#</h2>'||unistr('\000a')||
'<div class="regionbody">#BODY#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Report Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 244237140040595261
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 244237140040595261 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#><h2>#TITLE#</h2>#BODY#</div>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 244237336194595264
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 244237336194595264 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Region without Title'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 11
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/photo_gallery
prompt  ......list template 10907431415229208
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li>'||unistr('\000a')||
' <img src="#IMAGE#" #IMAGE_ATTR# alt="#IMAGE_ALT#" />'||unistr('\000a')||
' <div class="bjqs-caption">#TEXT#</div>'||unistr('\000a')||
'</li>';

t2:=t2||'<li>'||unistr('\000a')||
' <img src="#IMAGE#" #IMAGE_ATTR# alt="#IMAGE_ALT#" />'||unistr('\000a')||
' <div class="bjqs-caption">#TEXT#</div>'||unistr('\000a')||
'</li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>10907431415229208 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Photo Gallery',
  p_theme_id  => 202,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<ul class="bjqs">',
  p_list_template_after_rows=>' </ul>',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 244236535873590853
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><span style="font-weight:bold;">#TEXT#</span></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>244236535873590853 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 202,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<ul>',
  p_list_template_after_rows=>' </ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tab_list
prompt  ......list template 1003370432496805047
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1003370432496805047 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tab List',
  p_theme_id  => 202,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul>',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/long_text
prompt  ......report template 85242714239280978
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div>#LONG_TEXT#</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 85242714239280978 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Long text',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>' ',
  p_row_template_after_rows =>' ',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 202,
  p_theme_class_id => 9,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/articles
prompt  ......report template 85867610925851325
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="article">'||unistr('\000a')||
' <div class="article-title">'||unistr('\000a')||
'  <h2>#ARTICLE_TITLE#</h2>'||unistr('\000a')||
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="article-body">#ARTICLE_TEXT#</div>'||unistr('\000a')||
' <br/>'||unistr('\000a')||
'</div>';

c2:=c2||'<div class="article">'||unistr('\000a')||
' <div class="article-title">'||unistr('\000a')||
'  <h2>#ARTICLE_TITLE#</h2>'||unistr('\000a')||
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="article-body">#ARTICLE_TEXT#</div>'||unistr('\000a')||
' <div class="comment">#VIEW_COMMENT#</div>'||unistr('\000a')||
'</div>';

c3:=c3||'<div class="article">'||unistr('\000a')||
' <div class="article-title">'||unistr('\000a')||
'  <h2>#ARTICLE_TITLE#</h2>'||unistr('\000a')||
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>'||unistr('\000a')||
' </div>'||unistr('\000a')||
' <div class="article-body">#ARTICLE_TEXT#</div>'||unistr('\000a')||
' <div class="comment">#POST_COMMENT#</div>'||unistr('\000a')||
'</div>';

c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 85867610925851325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Articles',
  p_row_template1=> c1,
  p_row_template_condition1=> 'NOT APEX_UTIL.PUBLIC_CHECK_AUTHORIZATION(''ALLOW_COMMENT'')',
  p_row_template2=> c2,
  p_row_template_condition2=> '#COMMENT_COUNT# > 0',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>' ',
  p_row_template_after_rows =>'#PAGINATION#'||unistr('\000a')||
'<span role="alert" style="display:none;" id="modal_LOADER">'||unistr('\000a')||
' <img src="#IMAGE_PREFIX#ws/ajax-loader.gif" alt="Processing Request" />'||unistr('\000a')||
'</span>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_pagination_template=>'<span id="articlepages">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.next.png" alt="#PAGINATION_NEXT#" title="#PAGINATION_NEXT#" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.prev.png" alt="#PAGINATION_PREVIOUS#" title="#PAGINATION_PREVIOUS#" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.next.gif" alt="#PAGINATION_NEXT_SET#" title="#PAGINATION_NEXT_SET#" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.prev.gif" alt="#PAGINATION_PREVIOUS_SET#" title="#PAGINATION_PREVIOUS_SET#" /></a>',
  p_theme_id  => 202,
  p_theme_class_id => 10,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/faq
prompt  ......report template 200706979642003808
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<h3 class="question"><span>#FAQ_NO#</span>&nbsp;#QUESTION#</h3><div class="answer">#ANSWER#</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 200706979642003808 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'FAQ',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>' ',
  p_row_template_after_rows =>' ',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 202,
  p_theme_class_id => 8,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/authors
prompt  ......report template 204627982111044660
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<a id="#AUTHOR_ID#" name="#AUTHOR_ID#"></a>'||unistr('\000a')||
'<h2 class="author-name">#AUTHOR_NAME#</h2>'||unistr('\000a')||
'<div class="author-bio">#BIO#</div>'||unistr('\000a')||
'';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 204627982111044660 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Authors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>' ',
  p_row_template_after_rows =>' ',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 202,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/comments
prompt  ......report template 235043478957912725
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="comment-text"><h3>#CREATED_TXT# #CREATED_ON# #POSTED_BY_TXT# #POSTED_BY#</h3>#COMMENT_TEXT#</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 235043478957912725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Comments',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="comments"><h2>Comments</h2>',
  p_row_template_after_rows =>'</div>'||unistr('\000a')||
'',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a rel="nofollow" href="#LINK#">#PAGINATION_PREVIOUS#&nbsp;<img src="&G_THEME_PATH.next.png" align="absmiddle" alt="#PAGINATION_PREVIOUS#" /></a>',
  p_previous_page_template=>'<a rel="nofollow" href="#LINK#"><img src="&G_THEME_PATH.prev.png" align="absmiddle" alt="#PAGINATION_NEXT#" />&nbsp;#PAGINATION_NEXT#</a>',
  p_next_set_template=>'<a rel="nofollow" href="#LINK#">#PAGINATION_PREVIOUS#&nbsp;<img src="&G_THEME_PATH.nextset.png" align="absmiddle" alt="#PAGINATION_PREVIOUS#" /></a>',
  p_previous_set_template=>'<a rel="nofollow" href="#LINK#"><img src="&G_THEME_PATH.prevset.png" align="absmiddle" alt="#PAGINATION_NEXT#" />&nbsp;#PAGINATION_NEXT#</a>',
  p_theme_id  => 202,
  p_theme_class_id => 11,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 411997056936887967
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 411997056936887967 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" style="width:100%">#TOP_PAGINATION#<tr><td>'||unistr('\000a')||
'<table cellpadding="0" border="0" cellspacing="0" summary="" class="HorizontalBorder" id="report_data_#REGION_STATIC_ID#">',
  p_row_template_after_rows =>'</table></td></tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'<tr><td colspan="#COLCOUNT#">#EXTERNAL_LINK##CSV_LINK#</td></tr></table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span>#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.next.png" alt="Next" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.prev.png" alt="Previous" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.nextset.png" alt="Next" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img style="vertical-align:middle"" src="&G_THEME_PATH.prevset.png" alt="Previous" /></a>',
  p_theme_id  => 202,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 411997056936887967 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 21272493943377828
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 21272493943377828 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 85682918386179396
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 85682918386179396 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="&G_THEME_PATH.required.png" alt="#VALUE_REQUIRED#" /><span class="optionallabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 194906175811062416
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 194906175811062416 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><a href="##CURRENT_ITEM_NAME#" class="helplabel" tabindex="999">',
  p_template_body2=>'<div class="htmltooltip">#CURRENT_ITEM_HELP_TEXT#</div></a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 194906279967063673
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 194906279967063673 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="&G_THEME_PATH.required.png" alt="#VALUE_REQUIRED#" /><a href="##CURRENT_ITEM_NAME#" class="helplabel" tabindex="999">',
  p_template_body2=>'<div>#CURRENT_ITEM_HELP_TEXT#</div></a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 2,
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 1003338938911992905
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1003338938911992905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="hideMe508">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 1003340229436992906
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 1003340229436992906 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link href="&G_THEME_PATH.style#MIN#.css" rel="stylesheet" type="text/css"/>'||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="PopupBody">',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
prompt  ...application themes
--
--application/shared_components/user_interface/themes/blog_blue
prompt  ......theme 1003340354021992906
begin
wwv_flow_api.create_theme (
  p_id =>1003340354021992906 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 202,
  p_theme_name=>'Blog Blue',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>1003363250164640425 + wwv_flow_api.g_id_offset,
  p_error_template=>59538697487157434 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>null + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>1003333048537992900 + wwv_flow_api.g_id_offset,
  p_default_button_template=>199712388480191134 + wwv_flow_api.g_id_offset,
  p_default_region_template=>235001201303596179 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>null + wwv_flow_api.g_id_offset,
  p_default_reportr_template => null,
  p_default_tabform_template=>null + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>null + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>null + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template   =>411997056936887967 + wwv_flow_api.g_id_offset,
  p_default_label_template=>194906175811062416 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>null + wwv_flow_api.g_id_offset,
  p_default_list_template=>244236535873590853 + wwv_flow_api.g_id_offset,
  p_default_option_label=>1003339133029992905 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>1003339358713992905 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
--application/shared_components/logic/build_options/not_ready
wwv_flow_api.create_build_option (
  p_id=> 19434169279261909 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_build_option_name=> 'Not ready',
  p_build_option_status=> 'EXCLUDE',
  p_build_option_comment=> '');
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 290
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
prompt  ......Message region_title_files
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'My Shared Files';

wwv_flow_api.create_message (
  p_id=>10148823599378631 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_FILES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_author
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'About Author';

wwv_flow_api.create_message (
  p_id=>10152600134602171 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_AUTHOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_visitor_map
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Visitors by Country';

wwv_flow_api.create_message (
  p_id=>10153920992668449 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_VISITOR_MAP',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_disclaimer
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Disclaimer';

wwv_flow_api.create_message (
  p_id=>10154725724681473 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_DISCLAIMER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_faq
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Frequently Asked Questions';

wwv_flow_api.create_message (
  p_id=>10156720092714427 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_FAQ',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_about
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'About';

wwv_flow_api.create_message (
  p_id=>10157819864729712 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_ABOUT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_blogroll
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Blogroll';

wwv_flow_api.create_message (
  p_id=>10159615501792562 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_BLOGROLL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_useful_links
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Useful Links';

wwv_flow_api.create_message (
  p_id=>10160104287797773 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_USEFUL_LINKS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_contact
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Contact';

wwv_flow_api.create_message (
  p_id=>10161300608814607 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_CONTACT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message blog_reader_footer
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'All the information on this website is published in good faith and for general information purpose only. &G_BASE_URL. does not make any warranties about the completeness, reliability and accuracy of this information. Any action you take upon the information you find on this website (&G_BASE_URL.), is strictly at your own risk. &G_BASE_URL. will not be liable for any losses and/or damages in connec';

h:=h||'tion with the use of our website';

wwv_flow_api.create_message (
  p_id=>10215812430671729 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'BLOG_READER_FOOTER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_contact_form
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please free to contact us using this form.';

wwv_flow_api.create_message (
  p_id=>10513604293579529 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_CONTACT_FORM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message text_category
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Category';

wwv_flow_api.create_message (
  p_id=>10854101536011353 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TEXT_CATEGORY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message text_posted_on
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Posted on';

wwv_flow_api.create_message (
  p_id=>10854401739026409 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TEXT_POSTED_ON',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message text_by
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'by';

wwv_flow_api.create_message (
  p_id=>10854627391029747 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TEXT_BY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message text_view_comments
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'View Comments';

wwv_flow_api.create_message (
  p_id=>10854819627033346 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TEXT_VIEW_COMMENTS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message text_post_comment
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Post a Comment';

wwv_flow_api.create_message (
  p_id=>10855011863036946 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TEXT_POST_COMMENT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_archives
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Archives';

wwv_flow_api.create_message (
  p_id=>10855213576051331 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_ARCHIVES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_comment
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please Enter Your Comment for Article:<br/><h2>%0</h2>';

wwv_flow_api.create_message (
  p_id=>10856625616091313 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_COMMENT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_author
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Author';

wwv_flow_api.create_message (
  p_id=>10867120051306567 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_AUTHOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_visitor
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Visitors';

wwv_flow_api.create_message (
  p_id=>10869603433329508 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_VISITOR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_files
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Files';

wwv_flow_api.create_message (
  p_id=>10870409891341636 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_FILES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_resources
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Resources';

wwv_flow_api.create_message (
  p_id=>10871707722357875 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_RESOURCES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_comment
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Submit Comment';

wwv_flow_api.create_message (
  p_id=>10873104031389960 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_COMMENT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_search_result
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Search Result';

wwv_flow_api.create_message (
  p_id=>10874930748407944 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_SEARCH_RESULT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_search_result
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Search Result';

wwv_flow_api.create_message (
  p_id=>10878121819518441 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_SEARCH_RESULT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_search
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Search';

wwv_flow_api.create_message (
  p_id=>10879613612537471 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_SEARCH',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_categories
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Categories';

wwv_flow_api.create_message (
  p_id=>10890614517749684 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_CATEGORIES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_latest_articles
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Latest Articles';

wwv_flow_api.create_message (
  p_id=>10892404153769679 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_LATEST_ARTICLES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_most_clicked
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Most Clicked Articles';

wwv_flow_api.create_message (
  p_id=>10893107591783299 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_MOST_CLICKED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_most_hits
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Most Hits per Day';

wwv_flow_api.create_message (
  p_id=>10893923969790931 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_MOST_HITS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_comments
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Comments';

wwv_flow_api.create_message (
  p_id=>10895313389811002 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_COMMENTS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_contact
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Contact Form';

wwv_flow_api.create_message (
  p_id=>10897501503846869 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_CONTACT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_about
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'About';

wwv_flow_api.create_message (
  p_id=>10897922841852182 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_ABOUT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_disclaimer
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Disclaimer';

wwv_flow_api.create_message (
  p_id=>10899810968872848 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_DISCLAIMER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message region_title_photos
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'My Photos';

wwv_flow_api.create_message (
  p_id=>10903306050087842 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'REGION_TITLE_PHOTOS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message photo_title_photos
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'My Photo Gallery';

wwv_flow_api.create_message (
  p_id=>10903531054091449 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PHOTO_TITLE_PHOTOS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_photo_gallery
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'My favorite pictures.';

wwv_flow_api.create_message (
  p_id=>10928324262021273 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_PHOTO_GALLERY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_faq
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'FAQ';

wwv_flow_api.create_message (
  p_id=>10931119067312308 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_FAQ',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message download_link_title
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Download';

wwv_flow_api.create_message (
  p_id=>10938530274552241 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'DOWNLOAD_LINK_TITLE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message page_title_photos
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Photo Gallery';

wwv_flow_api.create_message (
  p_id=>11226212884259153 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAGE_TITLE_PHOTOS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_followup_notify
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Check this box if you want an email sent<br/>when a new comment is posted to this article.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>11238705243642476 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_FOLLOWUP_NOTIFY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_comment
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enter your comment.<br/>Use the formatting buttons to add allowed HTML tags.<br/>Example wrap program code to &lt;code&gt; tags so it is easier to read.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>11239606956656909 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_COMMENT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message followup_notify_checkbox
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Notify me of follow-up comments via email.';

wwv_flow_api.create_message (
  p_id=>11240308669671316 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FOLLOWUP_NOTIFY_CHECKBOX',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_no_html
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Note! Message can''t contain HTML command characters (<>").';

wwv_flow_api.create_message (
  p_id=>16871959288319707 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_NO_HTML',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_moderation_enabled
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Comment moderation has been enabled. All comments must be approved by the blog author.';

wwv_flow_api.create_message (
  p_id=>16875975825879340 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_MODERATION_ENABLED',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_allowed_html_tags
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'You can use <b>, <i>, <u> and <code> HTML tags.';

wwv_flow_api.create_message (
  p_id=>16882061302977280 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_ALLOWED_HTML_TAGS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_nick_name
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please enter your name.<br/>It will be displayed in comment posted by.';

wwv_flow_api.create_message (
  p_id=>19794267816933737 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_NICK_NAME',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_last_name
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please enter your last name.<br/>It will be displayed in comment posted by.';

wwv_flow_api.create_message (
  p_id=>19796981821942393 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_LAST_NAME',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_email
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please enter your email address.<br/>It will not be displayed for others.';

wwv_flow_api.create_message (
  p_id=>19798894533951717 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_EMAIL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message help_comment_website
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Optionally please enter your website address.<br/>It will not be displayed for others.';

wwv_flow_api.create_message (
  p_id=>19800297324965578 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'HELP_COMMENT_WEBSITE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message validation_comment_length
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 maximum length is %1 characters.';

wwv_flow_api.create_message (
  p_id=>21416874518853979 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'VALIDATION_COMMENT_LENGTH',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message validation_comment_format
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 is not valid. Please check e.g. allowed HTML tags are entered properly.';

wwv_flow_api.create_message (
  p_id=>21417092621860769 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'VALIDATION_COMMENT_FORMAT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message validation_math_question
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'%0 wasn''t correct.';

wwv_flow_api.create_message (
  p_id=>21455978488926560 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'VALIDATION_MATH_QUESTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message general_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ooops... We are sorry! Unexpected internal error have occurred.';

wwv_flow_api.create_message (
  p_id=>61144613043837500 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'GENERAL_ERROR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message faq_question
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Q%0.';

wwv_flow_api.create_message (
  p_id=>85737827546507897 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FAQ_QUESTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_confirm_comment
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Your message will be submitted after you press OK.';

wwv_flow_api.create_message (
  p_id=>85740917083649460 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_CONFIRM_COMMENT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_math_question
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please answer this simple question before you submit comment.%0';

wwv_flow_api.create_message (
  p_id=>85792717857531351 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_MATH_QUESTION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_required_fields
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'All required fields are marked with asterisk.'||unistr('\000a')||
'';

wwv_flow_api.create_message (
  p_id=>85793613519563787 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_REQUIRED_FIELDS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message msg_subscribe_rss
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Subscribe in a Reader';

wwv_flow_api.create_message (
  p_id=>85816124619290505 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'MSG_SUBSCRIBE_RSS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/blog_reader_footer
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_plugin_util.replace_substitutions(apex_lang.message(''BLOG_READER_FOOTER''));';

wwv_flow_api.create_shortcut (
 p_id=> 10217508967688516 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'BLOG_READER_FOOTER',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/canonical_url
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN ''<link href="'' || :G_BASE_URL || :G_CANONICAL_HREF ||''" rel="canonical" />'';'||unistr('\000a')||
'';

wwv_flow_api.create_shortcut (
 p_id=> 10223716477647128 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'CANONICAL_URL',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_contact_form
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 10513901489580787 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_CONTACT_FORM',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_photo_gallery
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 10928620811022943 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_PHOTO_GALLERY',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_followup_notify
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 11238510850639898 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_FOLLOWUP_NOTIFY',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_comment
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 11239421405650202 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_COMMENT',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_no_html
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 16872879763325436 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_NO_HTML',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_moderation_enabled
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 16876386787919846 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_MODERATION_ENABLED',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_website
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 19800988698969593 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_WEBSITE',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_email
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 19801382012972668 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_EMAIL',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_last_name
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 19801578562974303 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_LAST_NAME',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/help_comment_nick_name
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 19801775758975601 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'HELP_COMMENT_NICK_NAME',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/robots_noindex
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<meta name="robots" value="noindex" />';

wwv_flow_api.create_shortcut (
 p_id=> 28725403090709367 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'ROBOTS_NOINDEX',
 p_shortcut_type=> 'HTML_TEXT',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_confirm_comment
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 85795219520606574 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_CONFIRM_COMMENT',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_subscribe_rss
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'RETURN apex_escape.html_attribute(apex_lang.message(''MSG_SUBSCRIBE_RSS''));';

wwv_flow_api.create_shortcut (
 p_id=> 85815827638289153 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_SUBSCRIBE_RSS',
 p_shortcut_type=> 'FUNCTION_BODY',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/msg_required_fields
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 247239274685440541 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'MSG_REQUIRED_FIELDS',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/no_authentication
prompt  ......authentication 246416448814329990
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 246416448814329990 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'No Authentication'
 ,p_scheme_type => 'NATIVE_DAD'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/dynamic_action/net_webhop_dbswh_modal_confirm
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 19438174717730380 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'DYNAMIC ACTION'
 ,p_name => 'NET.WEBHOP.DBSWH.MODAL_CONFIRM'
 ,p_display_name => 'Modal Confirm'
 ,p_category => 'NOTIFICATION'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '&G_THEME_PATH.'
 ,p_render_function => 'blog_plugin.render_modal_confirm'
 ,p_standard_attributes => 'REGION:REQUIRED'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/net_webhop_dbswh_comment_textarea
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 21409996530296858 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'NET.WEBHOP.DBSWH.COMMENT_TEXTAREA'
 ,p_display_name => 'Comment Textarea'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '&G_THEME_PATH.'
 ,p_render_function => '#OWNER#.blog_plugin.render_comment_textarea'
 ,p_validation_function => '#OWNER#.blog_plugin.validate_comment_textarea'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER:ENCRYPT'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21412972290414430 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21409996530296858 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Formatting Buttons'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_help_text => 'Show formatting buttons.'
  );
null;
 
end;
/

--application/shared_components/plugins/authorization_type/net_webhop_dbswh_feature_authorization
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 21431092700886891 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'AUTHORIZATION TYPE'
 ,p_name => 'NET.WEBHOP.DBSWH.FEATURE_AUTHORIZATION'
 ,p_display_name => 'Feature Enabled'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_execution_function => '#OWNER#.blog_plugin.feature_authorization'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21431386446889808 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21431092700886891 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Feature Name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/net_webhop_dbswh_math_question_field
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'NET.WEBHOP.DBSWH.MATH_QUESTION_FIELD'
 ,p_display_name => 'Math Question Field'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'blog_plugin.render_math_question_field'
 ,p_ajax_function => 'blog_plugin.ajax_math_question_field'
 ,p_validation_function => 'blog_plugin.validate_math_question_field'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:ELEMENT:WIDTH:PLACEHOLDER'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21452883634696297 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Item Holding Answer'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
 ,p_help_text => 'Item name witch will hold correct answer.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21442885205619548 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'First Number min Value'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_display_length => 10
 ,p_max_length => 10
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21443180461621806 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'First Number max Value'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '40'
 ,p_display_length => 10
 ,p_max_length => 10
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21443477226623294 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Second Number min Value'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '1'
 ,p_display_length => 10
 ,p_max_length => 10
 ,p_is_translatable => false
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 21443773560625026 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 21442578317607573 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Second Number max Value'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => true
 ,p_default_value => '40'
 ,p_display_length => 10
 ,p_max_length => 10
 ,p_is_translatable => false
  );
null;
 
end;
/

prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s:=s||'BEGIN'||unistr('\000a')||
'    blog_install.pre_deinstall;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK3"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_ARTICLE_LOG" DROP CONSTRAINT "BLOG_ARTICLE_LOG_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK2"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_COMMENT_NOTIFY" DROP CONSTRAINT "BLOG_COMMENT_NOTIFY_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_FILE_LOG" DROP CONSTRAINT "BLOG_FILES_LOG_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABL';

s:=s||'E "BLOG_ARTICLE" DROP CONSTRAINT "BLOG_ARTICLE_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_CONTACT_MESSAGE" DROP CONSTRAINT "BLOG_CONTACT_MESSAGE_FK1";'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_AUTHOR" DROP CONSTRAINT "BLOG_AUTHOR_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_COMMENT_NOTIFY" DROP CONSTRAINT "BLOG_COMMENT_NOTIFY_FK2"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_CATEGORY_LOG" DROP CONSTRAINT "BLOG_CATEGOR';

s:=s||'Y_LOG_FK1"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE "BLOG_ARTICLE" DROP CONSTRAINT "BLOG_ARTICLE_FK2"'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_HIT20 DROP CONSTRAINT BLOG_ARTICLE_HIT20_FK1'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_LAST20 DROP CONSTRAINT BLOG_ARTICLE_LAST20_FK1'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_TOP20 DROP CONSTRAINT BLOG_ARTICLE_TOP20_FK1'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT_LOG DROP CONSTRAINT BLOG_COMMENT_LOG_FK1'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_PARAM_APP DROP ';

s:=s||'CONSTRAINT BLOG_PARAM_APP_FK1'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_COMMENT"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP TABLE "BLOG_FAQ"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP TABLE "BLOG_FILE_LOG"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP TABLE "BLOG_COMMENT_BLOCK"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP TABLE "BLOG_CONTACT_MESSAGE"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_ACTIVITY_LOG2"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_PARAM"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP TABLE "BLOG_COUNTRY"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_ARTICLE"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_FILE"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_ARTICLE_PREVIEW"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_AUT';

s:=s||'HOR"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_COMMENT_USER"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_CATEGORY"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_ARTICLE_LOG"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_CATEGORY_LOG"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_RESOURCE"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_ACTIVITY_LOG1"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_COMMENT_NOTIFY"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP TABLE "BLOG_LONG_TEXT";'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP VIEW "BLOG_V$ACTIVITY"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP VIEW "BLOG_V$ACTIVITY_LOG"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP VIEW "BLOG_V$ARTICLE"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP SYNONYM "BLOG_ACTIVITY_LOG"';

s:=s||''||unistr('\000a')||
'/'||unistr('\000a')||
'DROP SEQUENCE "BLOG_SEQ"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_TOP20"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_LAST20"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_HIT20"'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP MATERIALIZED VIEW "BLOG_ARCHIVE_LOV"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP MATERIALIZED VIEW "BLOG_COMMENT_LOG"'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP MATERIALIZED VIEW BLOG_PARAM_APP'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP PACKAGE BLOG_ADMIN_APP'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP PACKAGE BLOG_JOB'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP PACKAGE BLOG_PLUGIN'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP P';

s:=s||'ACKAGE BLOG_LOG'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP PACKAGE BLOG_UTIL'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP PACKAGE BLOG_XML'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP PACKAGE BLOG_INSTALL'||unistr('\000a')||
'/    '||unistr('\000a')||
'DROP FUNCTION BLOG_SGID'||unistr('\000a')||
'/'||unistr('\000a')||
'DROP FUNCTION BLOG_PW_HASH'||unistr('\000a')||
'/';

wwv_flow_api.create_install (
  p_id => 10834514095423806 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_welcome_message => 'This application installer will guide you through the process of creating your database objects and seed data.',
  p_license_message    => '<p>'||unistr('\000a')||
'DbSWH APEX blogging platform <br/>'||unistr('\000a')||
'Date: 07.12.2014'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Dual licensed under the MIT and GPL licenses:<br/>'||unistr('\000a')||
'http://www.opensource.org/licenses/mit-license.php <br/>'||unistr('\000a')||
'http://www.gnu.org/licenses/gpl.html <br/>'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Requires:<br/>'||unistr('\000a')||
'Oracle Application Express 4.2 or higher<br/>'||unistr('\000a')||
'Oracle Database 11G R2<br/>'||unistr('\000a')||
'</p>',
  p_configuration_message => 'You can configure the following attributes of your application.',
  p_build_options_message => 'You can choose to include the following build options.',
  p_validation_message => 'The following validations will be performed to ensure your system is compatible with this application.',
  p_install_message=> 'Please confirm that you would like to install this application''s supporting objects.',
  p_install_success_message => 'Your application''s supporting objects have been installed.',
  p_install_failure_message => 'Installation of database objects and seed data has failed.',
  p_upgrade_message => 'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.',
  p_upgrade_confirm_message => 'Please confirm that you would like to install this application''s supporting objects.',
  p_upgrade_success_message => 'Your application''s supporting objects have been installed.',
  p_upgrade_failure_message => 'Installation of database objects and seed data has failed.',
  p_deinstall_success_message => 'Deinstallation complete.',
  p_deinstall_script_clob => s,
  p_required_free_kb => 6400,
  p_required_sys_privs => 'CREATE MATERIALIZED VIEW:CREATE PROCEDURE:CREATE SEQUENCE:CREATE SYNONYM:CREATE TABLE:CREATE TRIGGER:CREATE VIEW',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE TABLE  BLOG_ACTIVITY_LOG1'||unistr('\000a')||
'(    ACTIVITY_DATE DATE DEFAULT SYSDATE,'||unistr('\000a')||
'ACTIVITY_TYPE VARCHAR2(40 CHAR),'||unistr('\000a')||
'APEX_SESSION_ID NUMBER(38,0),'||unistr('\000a')||
'RELATED_ID NUMBER(38,0),'||unistr('\000a')||
'IP_ADDRESS VARCHAR2(500 CHAR),'||unistr('\000a')||
'USER_ID NUMBER(38,0),'||unistr('\000a')||
'LATITUDE NUMBER(9,6),'||unistr('\000a')||
'LONGITUDE NUMBER(9,6),'||unistr('\000a')||
'COUNTRY_CODE VARCHAR2(2 CHAR),'||unistr('\000a')||
'COUNTRY_REGION VARCHAR2(256 CHAR),'||unistr('\000a')||
'COUNTRY_CITY VARCHAR2(256 CHAR),'||unistr('\000a')||
'HTTP_USER_AGENT VARCHAR2(2000 CHAR),'||unistr('\000a')||
'HTTP';

s:=s||'_REFERER VARCHAR2(2000 CHAR),'||unistr('\000a')||
'SEARCH_TYPE VARCHAR2(80 CHAR),'||unistr('\000a')||
'SEARCH_CRITERIA VARCHAR2(4000 CHAR),'||unistr('\000a')||
'ADDITIONAL_INFO VARCHAR2(4000 CHAR)'||unistr('\000a')||
') NOLOGGING'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_ACTIVITY_LOG2'||unistr('\000a')||
'(    ACTIVITY_DATE DATE DEFAULT SYSDATE,'||unistr('\000a')||
'ACTIVITY_TYPE VARCHAR2(40 CHAR),'||unistr('\000a')||
'APEX_SESSION_ID NUMBER(38,0),'||unistr('\000a')||
'RELATED_ID NUMBER(38,0),'||unistr('\000a')||
'IP_ADDRESS VARCHAR2(500 CHAR),'||unistr('\000a')||
'USER_ID NUMBER(38,0),'||unistr('\000a')||
'LATITUDE NUMBER(9,6),'||unistr('\000a')||
'LONGITUDE NUMBE';

s:=s||'R(9,6),'||unistr('\000a')||
'COUNTRY_CODE VARCHAR2(2 CHAR),'||unistr('\000a')||
'COUNTRY_REGION VARCHAR2(256 CHAR),'||unistr('\000a')||
'COUNTRY_CITY VARCHAR2(256 CHAR),'||unistr('\000a')||
'HTTP_USER_AGENT VARCHAR2(2000 CHAR),'||unistr('\000a')||
'HTTP_REFERER VARCHAR2(2000 CHAR),'||unistr('\000a')||
'SEARCH_TYPE VARCHAR2(80 CHAR),'||unistr('\000a')||
'SEARCH_CRITERIA VARCHAR2(4000 CHAR),'||unistr('\000a')||
'ADDITIONAL_INFO VARCHAR2(4000 CHAR)'||unistr('\000a')||
') NOLOGGING'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_COMMENT_USER'||unistr('\000a')||
'(    USER_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDA';

s:=s||'TE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'EMAIL VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'NICK_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'BLOCKED VARCHAR2(1 CHAR) DEFAULT ''N'' NOT NULL ENABLE,'||unistr('\000a')||
'BLOCKED_ON DATE,'||unistr('\000a')||
'WEBSITE VARCHAR2(256 CHAR),'||unistr('\000a')||
'USER_TYPE VARCHAR2(1) DEFAULT ''R'' NOT NULL ENABLE,'||unistr('\000a')||
'CO';

s:=s||'NSTRAINT BLOG_COMMENT_USER_PK PRIMARY KEY (USER_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_UK1 UNIQUE (EMAIL) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_UK2 UNIQUE (NICK_NAME) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_CK1 CHECK (USER_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_CK2 CHECK (BLOCKED IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_CK3 CHECK ((BLOCKED = ''N'' AND BLOCKED_ON IS NULL) OR (BLOCKED = ';

s:=s||'''Y'' AND BLOCKED_ON IS NOT NULL)) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_USER_CK4 CHECK (USER_TYPE IN(''R'', ''A'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_AUTHOR'||unistr('\000a')||
'(    AUTHOR_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR)';

s:=s||' DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'EMAIL VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'USER_NAME VARCHAR2(30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PASSWD VARCHAR2(2000 CHAR),'||unistr('\000a')||
'AUTHOR_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'BIO VARCHAR2(4000 CHAR),'||unistr('\000a')||
'AUTHOR_SEQ NUMBER(2,0) NOT NULL ENABLE,'||unistr('\000a')||
'EMAIL_NOTIFY VARCHAR2(1) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_PK PRIMARY KEY (AUTHOR_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_UK1 UNIQ';

s:=s||'UE (EMAIL) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_UK2 UNIQUE (USER_NAME) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_UK3 UNIQUE (AUTHOR_SEQ) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_CK1 CHECK (AUTHOR_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_CK2 CHECK (AUTHOR_SEQ BETWEEN 1 AND 99) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_CK3 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_AUTHOR_CK4 CHECK (EMAIL_NOTIFY IN(''Y'', ''N'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TA';

s:=s||'BLE  BLOG_CATEGORY'||unistr('\000a')||
'(    CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'CATEGORY_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CATEGORY_SEQ NUMBER(4,0) NOT NULL ENABLE,'||unistr('\000a')||
'';

s:=s||'CONSTRAINT BLOG_CATEGORY_PK PRIMARY KEY (CATEGORY_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_UK1 UNIQUE (CATEGORY_NAME) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_UK2 UNIQUE (CATEGORY_SEQ) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_CK1 CHECK (CATEGORY_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_CK3 CHECK (CATEGORY_SEQ BETWEEN 1 AND 9999) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE ';

s:=s||' BLOG_ARTICLE'||unistr('\000a')||
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'AUTHOR_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''N'' NOT NULL ENABLE,'||unistr('\000a')||
'CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'ARTICLE_TITLE V';

s:=s||'ARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ARTICLE_TEXT CLOB,'||unistr('\000a')||
'DESCRIPTION VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ARTICLE_LENGTH NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'YEAR_MONTH_NUM NUMBER(6,0) NOT NULL ENABLE,'||unistr('\000a')||
'VALID_FROM DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'KEYWORDS VARCHAR2(256 CHAR) NOT NULL,'||unistr('\000a')||
'HASTAGS VARCHAR2(256 CHAR),'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_PK PRIMARY KEY (ARTICLE_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_CK1 CHECK ';

s:=s||'(ARTICLE_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_CK2 CHECK (AUTHOR_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_CK3 CHECK (CATEGORY_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_CK4 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_CK5 CHECK (ARTICLE_LENGTH >= 0) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_ARTICLE_LOG'||unistr('\000a')||
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'VIEW_COUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE';

s:=s||','||unistr('\000a')||
'ARTICLE_RATE NUMBER DEFAULT 0 NOT NULL ENABLE,'||unistr('\000a')||
'ARTICLE_RATE_INT NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,'||unistr('\000a')||
'RATE_CLICK NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,'||unistr('\000a')||
'LAST_VIEW DATE DEFAULT NULL,'||unistr('\000a')||
'LAST_RATE DATE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_LOG_PK PRIMARY KEY (ARTICLE_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_LOG_CK1 CHECK (ARTICLE_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_LOG_CK2 CHECK (VIEW_COUNT >= 0) ENABLE,'||unistr('\000a')||
'CONSTRAI';

s:=s||'NT BLOG_ARTICLE_LOG_CK3 CHECK (ARTICLE_RATE BETWEEN 0 AND 5) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_LOG_CK4 CHECK (ARTICLE_RATE_INT BETWEEN 0 AND 5) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_LOG_CK5 CHECK (RATE_CLICK >= 0) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_ARTICLE_PREVIEW'||unistr('\000a')||
'(    APEX_SESSION_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'AUTHOR_ID NUMBER(38,0),'||unistr('\000a')||
'CATEGORY_ID NUMBER(38,0),'||unistr('\000a')||
'ARTICLE_TITLE VARCHAR2(256 CHAR),'||unistr('\000a')||
'ARTICLE_TEXT ';

s:=s||'CLOB,'||unistr('\000a')||
'CONSTRAINT BLOG_ARTICLE_PREVIEW_PK PRIMARY KEY (APEX_SESSION_ID) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_CATEGORY_LOG'||unistr('\000a')||
'(    CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'VIEW_COUNT NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,'||unistr('\000a')||
'LAST_VIEW DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_LOG_PK PRIMARY KEY (CATEGORY_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CATEGORY_LOG_CK1 CHECK (CATEGORY_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAIN';

s:=s||'T BLOG_CATEGORY_LOG_CK2 CHECK (VIEW_COUNT > 0) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_COMMENT'||unistr('\000a')||
'(    COMMENT_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'USER_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'APEX_SESSION_ID NUMBER(38,0) NOT NULL ENA';

s:=s||'BLE,'||unistr('\000a')||
'ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'COMMENT_TEXT VARCHAR2(4000 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'MODERATED VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'MODERATED_ON DATE DEFAULT SYSDATE,'||unistr('\000a')||
'PARENT_ID NUMBER(38,0),'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'NOTIFY_EMAIL_SENT VARCHAR2(1 CHAR) DEFAULT ''N'' NOT NULL ENABLE,'||unistr('\000a')||
'NOTIFY_EMAIL_SENT_ON DATE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_PK PRIMARY KEY (COMME';

s:=s||'NT_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK1 CHECK (COMMENT_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK2 CHECK (USER_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK3 CHECK (ARTICLE_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK4 CHECK (PARENT_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK5 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK6 CHECK (MODERATED IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMEN';

s:=s||'T_CK7 CHECK (MODERATED=''N'' AND MODERATED_ON IS NULL OR MODERATED=''Y'' AND MODERATED_ON IS NOT NULL) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK9 CHECK (NOTIFY_EMAIL_SENT=''N'' AND NOTIFY_EMAIL_SENT_ON IS NULL OR NOTIFY_EMAIL_SENT=''Y'' AND NOTIFY_EMAIL_SENT_ON IS NOT NULL) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_CK8 CHECK (NOTIFY_EMAIL_SENT IN(''Y'',''N'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_COMMENT_BLOCK'||unistr('\000a')||
'(    BLOCK_ID NUMBER(3';

s:=s||'8,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'BLOCK_TYPE VARCHAR2(30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'BLOCK_VALUE VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_BLOCK_PK PRIMARY ';

s:=s||'KEY (BLOCK_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_BLOCK_UK1 UNIQUE (BLOCK_VALUE) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_BLOCK_CK1 CHECK (BLOCK_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_BLOCK_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_BLOCK_CK3 CHECK (BLOCK_TYPE IN(''EMAIL'', ''IP'', ''USER_AGENT'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_COMMENT_NOTIFY'||unistr('\000a')||
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'USER_';

s:=s||'ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'FOLLOWUP_NOTIFY VARCHAR2(1 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_NOTIFY_PK PRIMARY KEY (ARTICLE_ID, USER_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK1 CHECK (ARTICLE_I';

s:=s||'D > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK2 CHECK (USER_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK3 CHECK (FOLLOWUP_NOTIFY IN(''Y'',''N'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_CONTACT_MESSAGE'||unistr('\000a')||
'(    CONTACT_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARC';

s:=s||'HAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PROCESSED VARCHAR2(1 CHAR) DEFAULT ''N'' NOT NULL ENABLE,'||unistr('\000a')||
'USER_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'APEX_SESSION_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'MESSAGE VARCHAR2(4000 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CONTACT_MESSAGE_PK PRIMARY KEY (CONTACT_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK1 CHECK (CONTACT_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK2 CHECK (USER_I';

s:=s||'D > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK3 CHECK (PROCESSED IN(''Y'', ''N'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_COUNTRY'||unistr('\000a')||
'(    COUNTRY_CODE VARCHAR2(2 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'COUNTRY_NAME VARCHAR2(60 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'VISIT_COUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COUNTRY_PK PRIMARY KEY (COUNTRY_CODE) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_COUNTRY_CK1 CHECK (VISIT_COUNT >= 0) ENABLE'||unistr('\000a')||
') ORGA';

s:=s||'NIZATION INDEX NOCOMPRESS'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_FAQ'||unistr('\000a')||
'(    FAQ_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'FAQ_SEQ NUMBER(4,0) NOT NULL ENABLE,'||unistr('\000a')||
'QUESTION VARCHAR2(4000 CHAR) NOT NULL E';

s:=s||'NABLE,'||unistr('\000a')||
'ANSWER VARCHAR2(4000 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FAQ_PK PRIMARY KEY (FAQ_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FAQ_UK1 UNIQUE (FAQ_SEQ) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FAQ_CK1 CHECK (FAQ_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FAQ_CK2 CHECK (ACTIVE IN(''Y'',''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FAQ_CK3 CHECK (FAQ_SEQ BETWEEN 1 AND 50) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_FILE'||unistr('\000a')||
'(    FILE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CRE';

s:=s||'ATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'FILE_NAME VARCHAR2(60 CHAR),'||unistr('\000a')||
'MIME_TYPE VARCHAR2(256 CHAR),'||unistr('\000a')||
'FILE_SIZE NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,'||unistr('\000a')||
'DAD_CHARSET VARCHAR2(256 CHAR),'||unistr('\000a')||
'FILE_TYPE VARCHAR2(';

s:=s||'30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'BLOB_CONTENT BLOB NOT NULL ENABLE,'||unistr('\000a')||
'DESCRIPTION VARCHAR2(4000 CHAR),'||unistr('\000a')||
'FILE_ETAG VARCHAR2(50 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'FILE_MODIFIED_SINCE VARCHAR2(30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_PK PRIMARY KEY (FILE_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_UK1 UNIQUE (FILE_NAME) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_CK1 CHECK (FILE_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_CK2 CHECK (ACTIVE IN(''Y'',''';

s:=s||'N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_CK4 CHECK (FILE_SIZE >0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_CK3 CHECK (FILE_TYPE IN(''IMAGE'',''FILE'',''THEME'',''GALLERY'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_FILE_LOG'||unistr('\000a')||
'(    FILE_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CLICK_COUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,'||unistr('\000a')||
'LAST_CLICK DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_LOG_PK PRIMARY KEY (FILE_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT B';

s:=s||'LOG_FILE_LOG_CK1 CHECK (FILE_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_FILE_LOG_CK2 CHECK (CLICK_COUNT >= 0) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_LONG_TEXT'||unistr('\000a')||
'(    LONG_TEXT_ID VARCHAR2(30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'LONG_TEXT_DESCRIPT';

s:=s||'ION VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'LONG_TEXT CLOB,'||unistr('\000a')||
'CONSTRAINT BLOG_LONG_TEXT_PK PRIMARY KEY (LONG_TEXT_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_LONG_TEXT_CK1 CHECK (LONG_TEXT_ID IN(''ABOUT'',''DISCLAIMER'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_PARAM'||unistr('\000a')||
'(    PARAM_ID VARCHAR2(30 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT ';

s:=s||'SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'EDITABLE VARCHAR2(1 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_NAME VARCHAR2(60 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_VALUE VARCHAR2(4000 CHAR),'||unistr('\000a')||
'PARAM_HELP VARCHAR2(4000 CHAR),'||unistr('\000a')||
'PARAM_TYPE VARCHAR2(20 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_NULLABLE VARCHAR2(1 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_GROUP VARCHAR2(10 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_USE_SKILL VARCHAR2(1) DEFAU';

s:=s||'LT ''B'' NOT NULL ENABLE,'||unistr('\000a')||
'PARAM_PARENT VARCHAR2(40 CHAR),'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_PK PRIMARY KEY (PARAM_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK1 CHECK (EDITABLE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK2 CHECK (PARAM_NULLABLE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK3 CHECK (PARAM_TYPE IN(''TEXT'',''TEXTAREA'',''NUMBER'',''YESNO'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK4 CHECK ((PARAM_NULLABLE = ''N'' AND PAR';

s:=s||'AM_VALUE IS NOT NULL) OR (PARAM_NULLABLE = ''Y'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK5 CHECK ((PARAM_TYPE = ''YESNO'' AND PARAM_VALUE IS NOT NULL) OR (PARAM_TYPE != ''YESNO'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK6 CHECK ((PARAM_TYPE =''YESNO'' AND PARAM_NULLABLE = ''N'') OR (PARAM_TYPE !=''YESNO'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK7 CHECK (PARAM_GROUP IN(''SEO'', ''UI'', ''EMAIL'', ''LOG'', ''AUTH'', ''RSS'', ''INTERNAL'')) ENA';

s:=s||'BLE,'||unistr('\000a')||
'CONSTRAINT BLOG_PARAM_CK8 CHECK (PARAM_USE_SKILL IN(''A'', ''B'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'COMMENT ON COLUMN BLOG_PARAM.PARAM_TYPE IS ''Values defined in blog admin app PARAM_TYPE list of values'''||unistr('\000a')||
'/'||unistr('\000a')||
'COMMENT ON COLUMN BLOG_PARAM.PARAM_GROUP IS ''Values defined in blog admin app PARAM_GROUP list of values'''||unistr('\000a')||
'/'||unistr('\000a')||
'COMMENT ON COLUMN BLOG_PARAM.PARAM_USE_SKILL IS ''Values defined in blog admin app PARAM_USE_SKILL list of v';

s:=s||'alues'''||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE TABLE  BLOG_RESOURCE'||unistr('\000a')||
'(    LINK_ID NUMBER(38,0) NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,'||unistr('\000a')||
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'ACTIVE VARCHAR2(1 CHAR) DEFAULT ''Y'' NOT NULL ENABLE,'||unistr('\000a')||
'LINK_TYPE VARCHAR2(40 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'LINK_TITLE VARCHAR2(256 CHAR) NO';

s:=s||'T NULL ENABLE,'||unistr('\000a')||
'LINK_TEXT VARCHAR2(4000 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'LINK_URL VARCHAR2(256 CHAR) NOT NULL ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_RESOURCE_PK PRIMARY KEY (LINK_ID) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_RESOURCE_CK1 CHECK (LINK_ID > 0) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_RESOURCE_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,'||unistr('\000a')||
'CONSTRAINT BLOG_RESOURCE_CK3 CHECK (LINK_TYPE IN(''BLOG'',''FAVORITE'',''RESOURCE'')) ENABLE'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 11224317574059470 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '1 Table',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE INDEX  "BLOG_ARTICLE_CTX" ON  "BLOG_ARTICLE" ("ARTICLE_TEXT") '||unistr('\000a')||
'INDEXTYPE IS "CTXSYS"."CONTEXT"  PARAMETERS (''FILTER CTXSYS.NULL_FILTER SECTION GROUP CTXSYS.HTML_SECTION_GROUP SYNC (ON COMMIT)'')'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX1" ON  "BLOG_ARTICLE" ("AUTHOR_ID")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX2" ON  "BLOG_ARTICLE" ("CATEGORY_ID")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX3" ON  "BLOG_ARTICLE" ("AC';

s:=s||'TIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX4" ON  "BLOG_ARTICLE" ("YEAR_MONTH_NUM")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX5" ON  "BLOG_ARTICLE" ("CREATED_ON")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_ARTICLE_IDX6" ON  "BLOG_ARTICLE" ("VALID_FROM")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_AUTHOR_IDX1" ON  "BLOG_AUTHOR" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_CATEGORY_IDX1" ON  "BLOG_CATEGORY" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_BLOCK_IDX1" ON  "';

s:=s||'BLOG_COMMENT_BLOCK" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_IDX1" ON  "BLOG_COMMENT" ("USER_ID")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_IDX2" ON  "BLOG_COMMENT" ("ARTICLE_ID")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_IDX3" ON  "BLOG_COMMENT" ("PARENT_ID")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_IDX4" ON  "BLOG_COMMENT" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_IDX5" ON  "BLOG_COMMENT" ("MODERATED")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMEN';

s:=s||'T_IDX6" ON  "BLOG_COMMENT" ("CREATED_ON" DESC)'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_NOTIFY_IDX1" ON  "BLOG_COMMENT_NOTIFY" ("FOLLOWUP_NOTIFY")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COMMENT_USER_IDX1" ON  "BLOG_COMMENT_USER" ("BLOCKED")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COUNTRY_IDX1" ON  "BLOG_COUNTRY" ("COUNTRY_NAME")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_COUNTRY_IDX2" ON  "BLOG_COUNTRY" ("VISIT_COUNT")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_FAQ_IDX1" ON  "BLOG_FA';

s:=s||'Q" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_FILE_IDX1" ON  "BLOG_FILE" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_FILE_IDX2" ON  "BLOG_FILE" ("FILE_TYPE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_PARAM_IDX1" ON  "BLOG_PARAM" ("PARAM_PARENT")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_RESOURCE_IDX1" ON  "BLOG_RESOURCE" ("LINK_TYPE")'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE INDEX  "BLOG_RESOURCE_IDX2" ON  "BLOG_RESOURCE" ("ACTIVE")'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10834928830429828 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '2 Index',
  p_sequence=> 20,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE SEQUENCE "BLOG_SEQ" MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 50 NOORDER CYCLE'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10835223870432113 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '3 Sequence',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE OR REPLACE SYNONYM  "BLOG_ACTIVITY_LOG" FOR  "BLOG_ACTIVITY_LOG1"'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10835419772434005 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '4 Synonym',
  p_sequence=> 40,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE OR REPLACE FUNCTION  "BLOG_SGID" RETURN NUMBER AS '||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  RETURN TO_NUMBER(TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') || LPAD(blog_seq.nextval,4,0));'||unistr('\000a')||
'END "BLOG_SGID";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE FUNCTION  "BLOG_PW_HASH" ('||unistr('\000a')||
'  p_username IN VARCHAR2,'||unistr('\000a')||
'  p_password IN VARCHAR2'||unistr('\000a')||
') RETURN VARCHAR2'||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'/* This function should be wrapped, as the hash algorhythm for password is exposed. */'||unistr('\000a')||
'  l_passwo';

s:=s||'rd VARCHAR2(4000);'||unistr('\000a')||
'  l_salt     VARCHAR2(255) := ''EVQELZY27PVLWPHMRN8B0CRRMAXBR8'';'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_password  :='||unistr('\000a')||
'        SUBSTR(l_salt, 8, 13)'||unistr('\000a')||
'    ||  p_password'||unistr('\000a')||
'    ||  SUBSTR(l_salt, 4, 10)'||unistr('\000a')||
'	||  SUBSTR(l_salt, 22, 28)'||unistr('\000a')||
'    ||  p_username'||unistr('\000a')||
'    ||  SUBSTR(l_salt, 18, 26)'||unistr('\000a')||
'  ;'||unistr('\000a')||
'  l_password := utl_raw.cast_to_raw(l_password);'||unistr('\000a')||
'  l_password := dbms_obfuscation_toolkit.md5(input_string => l_password);'||unistr('\000a')||
'  RETURN l';

s:=s||'_password;'||unistr('\000a')||
'END "BLOG_PW_HASH";'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10835614381436515 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '5 Function',
  p_sequence=> 50,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CREATE MATERIALIZED VIEW blog_archive_lov'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS'||unistr('\000a')||
'SELECT a.year_month_num'||unistr('\000a')||
'    ,TRUNC(a.created_on,''MM'') AS year_month'||unistr('\000a')||
'    ,COUNT(1) AS article_count'||unistr('\000a')||
'  FROM blog_article a'||unistr('\000a')||
'  WHERE a.active = ''Y'''||unistr('\000a')||
'    AND a.valid_from ';

s:=s||'<= SYSDATE'||unistr('\000a')||
'  GROUP BY a.year_month_num,'||unistr('\000a')||
'    TRUNC(a.created_on,''MM'')'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT BLOG_ARCHIVE_LOV_PK PRIMARY KEY (YEAR_MONTH_NUM)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT  BLOG_ARCHIVE_LOV_UK1 UNIQUE (YEAR_MONTH)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARCHIVE_LOV MODIFY YEAR_MONTH NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARCHIVE_LOV MODIFY ARTICLE_COUNT NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'---------------------------';

s:=s||'-----------------------------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CREATE MATERIALIZED VIEW blog_param_app'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS'||unistr('\000a')||
'SELECT a.application_id'||unistr('\000a')||
'  ,a.item_name AS param_id'||unistr('\000a')||
'FROM apex_application_items a'||unistr('\000a')||
'WHERE EXISTS (SELECT 1 FROM blog_param p WHERE p.param_id = a.item_name)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_PARAM_APP ADD CONSTRA';

s:=s||'INT BLOG_PARAM_APP_PK PRIMARY KEY (APPLICATION_ID, PARAM_ID)'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CREATE MATERIALIZED VIEW blog_comment_log'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS'||unistr('\000a')||
'SELECT article_id,'||unistr('\000a')||
'  COUNT(1) as comment_count,'||unistr('\000a')||
'  MAX(created_on) as last_comment'||unistr('\000a')||
'FROM blog_comment'||unistr('\000a')||
'WH';

s:=s||'ERE moderated = ''Y'''||unistr('\000a')||
'AND active = ''Y'''||unistr('\000a')||
'GROUP BY article_id'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_COMMENT_LOG ADD CONSTRAINT BLOG_COMMENT_LOG_PK PRIMARY KEY (ARTICLE_ID)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_COMMENT_LOG MODIFY COMMENT_COUNT NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_COMMENT_LOG MODIFY LAST_COMMENT NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CRE';

s:=s||'ATE MATERIALIZED VIEW blog_article_top20'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS '||unistr('\000a')||
'WITH qry AS ('||unistr('\000a')||
'  SELECT /*+ FIRST_ROWS(20) */'||unistr('\000a')||
'    ROW_NUMBER() OVER(ORDER BY l.view_count DESC) AS top_article,'||unistr('\000a')||
'    a.article_id,'||unistr('\000a')||
'    a.article_title,'||unistr('\000a')||
'    l.view_count,'||unistr('\000a')||
'    l.last_view,'||unistr('\000a')||
'    a.created_on,'||unistr('\000a')||
'    SUM(l.view_count) OVER() AS total_views'||unistr('\000a')||
'  FROM blog_article a'||unistr('\000a')||
'  JOIN blog_article_lo';

s:=s||'g l'||unistr('\000a')||
'  ON a.article_id = l.article_id'||unistr('\000a')||
'  WHERE a.active = ''Y'''||unistr('\000a')||
'    AND a.valid_from <= SYSDATE'||unistr('\000a')||
'    AND l.view_count > 0'||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  qry.article_id,'||unistr('\000a')||
'  qry.article_title,'||unistr('\000a')||
'  qry.view_count,'||unistr('\000a')||
'  qry.last_view,'||unistr('\000a')||
'  (qry.view_count / qry.total_views) * 100 AS view_pct,'||unistr('\000a')||
'  qry.created_on,'||unistr('\000a')||
'  qry.top_article'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE qry.top_article <= 20'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_PK P';

s:=s||'RIMARY KEY (ARTICLE_ID)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_UK1 UNIQUE (TOP_ARTICLE)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY LAST_VIEW NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY VIEW_PCT NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY TOP_ARTICLE NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'-----------------------------------------';

s:=s||'---------------------'||unistr('\000a')||
'CREATE MATERIALIZED VIEW blog_article_last20'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS'||unistr('\000a')||
'WITH qry AS ('||unistr('\000a')||
'  SELECT /*+ FIRST_ROWS(20) */'||unistr('\000a')||
'    ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn,'||unistr('\000a')||
'    a.article_id,'||unistr('\000a')||
'    APEX_ESCAPE.HTML(a.article_title) AS article_title,'||unistr('\000a')||
'    a.article_title                   AS rss_title,'||unistr('\000a')||
'    APEX_ESCAPE.HTML(a.description)  ';

s:=s||' AS description,'||unistr('\000a')||
'    p.author_name                     AS posted_by,'||unistr('\000a')||
'    c.category_name,'||unistr('\000a')||
'    a.created_on'||unistr('\000a')||
'  FROM blog_article a'||unistr('\000a')||
'  JOIN blog_author p'||unistr('\000a')||
'  ON a.author_id = p.author_id'||unistr('\000a')||
'  JOIN blog_category c'||unistr('\000a')||
'  ON a.category_id = c.category_id'||unistr('\000a')||
'  WHERE a.active   = ''Y'''||unistr('\000a')||
'    AND a.valid_from <= SYSDATE'||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  article_id,'||unistr('\000a')||
'  article_title,'||unistr('\000a')||
'  rss_title,'||unistr('\000a')||
'  description,'||unistr('\000a')||
'  posted_by,'||unistr('\000a')||
'  category_name,'||unistr('\000a')||
'  crea';

s:=s||'ted_on'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE rn <= 20'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_PK PRIMARY KEY (ARTICLE_ID)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY ARTICLE_TITLE NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY DESCRIPTION NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CREATE OR REPLACE ';

s:=s||'FORCE VIEW blog_v$activity_log'||unistr('\000a')||
'AS '||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'    activity_date ,'||unistr('\000a')||
'    activity_type,'||unistr('\000a')||
'    apex_session_id,'||unistr('\000a')||
'    ip_address,'||unistr('\000a')||
'    related_id,'||unistr('\000a')||
'    user_id,'||unistr('\000a')||
'    latitude,'||unistr('\000a')||
'    longitude,'||unistr('\000a')||
'    country_code,'||unistr('\000a')||
'    country_region,'||unistr('\000a')||
'    country_city,'||unistr('\000a')||
'    http_user_agent,'||unistr('\000a')||
'    http_referer,'||unistr('\000a')||
'    search_type,'||unistr('\000a')||
'    search_criteria,'||unistr('\000a')||
'	additional_info'||unistr('\000a')||
'FROM blog_activity_log1'||unistr('\000a')||
'UNION ALL'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'    activity_date,'||unistr('\000a')||
'    activity';

s:=s||'_type,'||unistr('\000a')||
'    apex_session_id,'||unistr('\000a')||
'    ip_address,'||unistr('\000a')||
'    related_id,'||unistr('\000a')||
'    user_id,'||unistr('\000a')||
'    latitude,'||unistr('\000a')||
'    longitude,'||unistr('\000a')||
'    country_code,'||unistr('\000a')||
'    country_region,'||unistr('\000a')||
'    country_city,'||unistr('\000a')||
'    http_user_agent,'||unistr('\000a')||
'    http_referer,'||unistr('\000a')||
'    search_type,'||unistr('\000a')||
'    search_criteria,'||unistr('\000a')||
'	additional_info'||unistr('\000a')||
'FROM blog_activity_log2'||unistr('\000a')||
'WITH READ ONLY CONSTRAINT blog_v$activity_log_ro'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'----------';

s:=s||'----------------------------------------------------'||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW blog_v$activity'||unistr('\000a')||
'AS '||unistr('\000a')||
'  SELECT l.activity_date'||unistr('\000a')||
'  ,l.activity_type'||unistr('\000a')||
'  ,n.apex_session_id'||unistr('\000a')||
'  ,n.ip_address'||unistr('\000a')||
'  ,l.related_id'||unistr('\000a')||
'  ,l.user_id'||unistr('\000a')||
'  ,u.email'||unistr('\000a')||
'  ,u.nick_name'||unistr('\000a')||
'  ,u.website'||unistr('\000a')||
'  ,n.latitude'||unistr('\000a')||
'  ,n.longitude'||unistr('\000a')||
'  ,n.country_code'||unistr('\000a')||
'  ,c.country_name'||unistr('\000a')||
'  ,n.country_region'||unistr('\000a')||
'  ,n.country_city'||unistr('\000a')||
'  ,n.http_user_agent'||unistr('\000a')||
'  ,l.http_referer'||unistr('\000a')||
'  ,l.se';

s:=s||'arch_type'||unistr('\000a')||
'  ,l.search_criteria'||unistr('\000a')||
'  ,l.additional_info'||unistr('\000a')||
'FROM blog_v$activity_log l'||unistr('\000a')||
'JOIN blog_v$activity_log n'||unistr('\000a')||
'  ON l.apex_session_id = n.apex_session_id'||unistr('\000a')||
' AND n.activity_type = ''NEW_SESSION'''||unistr('\000a')||
'LEFT JOIN blog_country c '||unistr('\000a')||
'  ON n.country_code = c.country_code'||unistr('\000a')||
'LEFT JOIN blog_comment_user u'||unistr('\000a')||
'  ON l.user_id = u.user_id'||unistr('\000a')||
'WITH READ ONLY CONSTRAINT blog_v$activity_ro'||unistr('\000a')||
'/'||unistr('\000a')||
'-----------------------------------------------';

s:=s||'---------------'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW blog_v$article'||unistr('\000a')||
'AS '||unistr('\000a')||
'  SELECT'||unistr('\000a')||
'  a.article_id'||unistr('\000a')||
'  ,c.category_id'||unistr('\000a')||
'  ,b.author_id'||unistr('\000a')||
'  ,a.created_on'||unistr('\000a')||
'  ,b.author_name'||unistr('\000a')||
'  ,a.article_title'||unistr('\000a')||
'  ,a.description'||unistr('\000a')||
'  ,c.category_name'||unistr('\000a')||
'  ,a.keywords'||unistr('\000a')||
'  ,a.article_text'||unistr('\000a')||
'  ,a.active'||unistr('\000a')||
'  ,a.year_month_num'||unistr('\000a')||
'  ,CASE WHEN d.comment_count IS NULL THEN'||unistr('\000a')||
'    0'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    d.comm';

s:=s||'ent_count'||unistr('\000a')||
'  END AS comment_count'||unistr('\000a')||
'  ,(SELECT apex_lang.message(''TEXT_POSTED_ON'') FROM DUAL) AS created_on_txt'||unistr('\000a')||
'  ,(SELECT apex_lang.message(''TEXT_BY'') FROM DUAL) AS posted_by_txt'||unistr('\000a')||
'  ,(SELECT apex_lang.message(''TEXT_CATEGORY'') FROM DUAL) AS category_txt'||unistr('\000a')||
'  ,(SELECT apex_lang.message(''TEXT_VIEW_COMMENTS'') FROM DUAL) AS view_comment'||unistr('\000a')||
'  ,(SELECT apex_lang.message(''TEXT_POST_COMMENT'') FROM DUAL) AS post_com';

s:=s||'ment'||unistr('\000a')||
'FROM blog_article a'||unistr('\000a')||
'  JOIN blog_author b ON a.author_id = b.author_id'||unistr('\000a')||
'  JOIN blog_category c ON a.category_id = c.category_id'||unistr('\000a')||
'  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id'||unistr('\000a')||
'WHERE a.active = ''Y'''||unistr('\000a')||
'  AND a.valid_from <= SYSDATE'||unistr('\000a')||
'WITH READ ONLY CONSTRAINT blog_v$article_ro'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'-----------------------------------------------';

s:=s||'---------------'||unistr('\000a')||
''||unistr('\000a')||
'CREATE MATERIALIZED VIEW blog_article_hit20'||unistr('\000a')||
'  BUILD IMMEDIATE'||unistr('\000a')||
'  USING NO INDEX'||unistr('\000a')||
'  REFRESH COMPLETE ON DEMAND'||unistr('\000a')||
'AS'||unistr('\000a')||
'WITH al AS ('||unistr('\000a')||
'  SELECT l.related_id AS article_id,'||unistr('\000a')||
'    TRUNC(l.activity_date) AS activity_date,'||unistr('\000a')||
'    COUNT(1) AS view_count'||unistr('\000a')||
'  FROM blog_v$activity_log l'||unistr('\000a')||
'  WHERE l.activity_type = ''READ'''||unistr('\000a')||
'  GROUP BY l.related_id,TRUNC(l.activity_date)'||unistr('\000a')||
'), hit AS ('||unistr('\000a')||
'  SELECT al.article_id,'||unistr('\000a')||
'    S';

s:=s||'UM(al.view_count) / COUNT(1) AS hit_ratio'||unistr('\000a')||
'  FROM al'||unistr('\000a')||
'  GROUP BY al.article_id'||unistr('\000a')||
'), qry AS ('||unistr('\000a')||
'  SELECT /*+ FIRST_ROWS(20) */'||unistr('\000a')||
'    ROW_NUMBER() OVER(ORDER BY hit.hit_ratio DESC) AS rn,'||unistr('\000a')||
'    a.article_id,'||unistr('\000a')||
'    a.article_title,'||unistr('\000a')||
'    hit.hit_ratio'||unistr('\000a')||
'  FROM blog_article a'||unistr('\000a')||
'  JOIN hit'||unistr('\000a')||
'  ON a.article_id = hit.article_id'||unistr('\000a')||
'  WHERE a.active  = ''Y'''||unistr('\000a')||
'    AND a.valid_from <= SYSDATE'||unistr('\000a')||
')'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  qry.article_id,'||unistr('\000a')||
'  qry.article_';

s:=s||'title,'||unistr('\000a')||
'  qry.hit_ratio,'||unistr('\000a')||
'  qry.rn AS top_hit'||unistr('\000a')||
'FROM qry'||unistr('\000a')||
'WHERE qry.rn <= 20'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_PK PRIMARY KEY (ARTICLE_ID)'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY HIT_RATIO NOT NULL'||unistr('\000a')||
'/'||unistr('\000a')||
'--------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------';

wwv_flow_api.create_install_script(
  p_id => 11220521006814806 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '6 View',
  p_sequence=> 60,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE OR REPLACE PACKAGE  "BLOG_XML" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION show_entry('||unistr('\000a')||
'    p_build_option_id         IN VARCHAR2,'||unistr('\000a')||
'    p_authorization_scheme_id IN VARCHAR2,'||unistr('\000a')||
'    p_condition_type_code     IN VARCHAR2,'||unistr('\000a')||
'    p_condition_expression1   IN VARCHAR2,'||unistr('\000a')||
'    p_condition_expression2   IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'----';

s:=s||'----------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rss('||unistr('\000a')||
'    p_app_alias IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name IN VARCHAR2,'||unistr('\000a')||
'    p_base_url  IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE sitemap('||unistr('\000a')||
'    p_app_id    IN NUMBER,'||unistr('\000a')||
'    p_app_alias IN VARCHAR2,'||unistr('\000a')||
'    p_base_url  IN VARCHAR2,'||unistr('\000a')||
'    p_tab_list  IN VARCHAR2'||unistr('\000a')||
'';

s:=s||'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_XML";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_XML" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION show_entry('||unistr('\000a')||
'    p_build_option_id         IN VARCHAR2,'||unistr('\000a')||
'    p_authorization_s';

s:=s||'cheme_id IN VARCHAR2,'||unistr('\000a')||
'    p_condition_type_code     IN VARCHAR2,'||unistr('\000a')||
'    p_condition_expression1   IN VARCHAR2,'||unistr('\000a')||
'    p_condition_expression2   IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_retval    VARCHAR2(1);'||unistr('\000a')||
'    l_entry_id  VARCHAR2(100);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    IF apex_plugin_util.is_component_used ('||unistr('\000a')||
'            p_build_option_id         => p_build_option_id,'||unistr('\000a')||
'            p_authorization_scheme_id => p_authorizat';

s:=s||'ion_scheme_id,'||unistr('\000a')||
'            p_condition_type          => p_condition_type_code,'||unistr('\000a')||
'            p_condition_expression1   => p_condition_expression1,'||unistr('\000a')||
'            p_condition_expression2   => p_condition_expression2'||unistr('\000a')||
'        )'||unistr('\000a')||
'      THEN'||unistr('\000a')||
'        l_retval := ''Y'';'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        l_retval := ''N'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      RETURN l_retval;'||unistr('\000a')||
'   END show_entry;'||unistr('\000a')||
'----------------------------------------------------';

s:=s||'----------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rss('||unistr('\000a')||
'    p_app_alias IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name IN VARCHAR2,'||unistr('\000a')||
'    p_base_url  IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_xml         BLOB;'||unistr('\000a')||
'    l_url         VARCHAR2(255);'||unistr('\000a')||
'    l_rss_desc    VARCHAR2(255);'||unistr('\000a')||
'    l_rss_url     VARCHAR2(255);'||unistr('\000a')||
'    l_home_url    VARCHAR2(255);'||unistr('\000a')||
'    l_article_url VARC';

s:=s||'HAR2(255);'||unistr('\000a')||
'    l_webmaster   VARCHAR2(255);'||unistr('\000a')||
''||unistr('\000a')||
'    c_version     CONSTANT VARCHAR2(5) := ''2.0'';'||unistr('\000a')||
'    c_rss_lang    CONSTANT VARCHAR2(5) := ''en'';'||unistr('\000a')||
''||unistr('\000a')||
'    c_date_lang   CONSTANT VARCHAR2(255) := ''NLS_DATE_LANGUAGE=ENGLISH'';'||unistr('\000a')||
'    c_date_form   CONSTANT VARCHAR2(255) := ''Dy, DD Mon RRRR HH24:MI:SS "+0100"'';'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'    l_rss_desc    := blog_util.get_param_value(''RSS_DESCRIPTION'');'||unistr('\000a')||
'    l_url         := ''f?p=';

s:=s||''' || p_app_alias || '':'';'||unistr('\000a')||
'    l_rss_url     := p_base_url || l_url || ''RSS:0'';'||unistr('\000a')||
'    l_home_url    := p_base_url || l_url || ''HOME:0'';'||unistr('\000a')||
'    l_article_url := l_url || ''READ:0::::ARTICLE:'';'||unistr('\000a')||
''||unistr('\000a')||
'    SELECT xmlelement("rss", xmlattributes(c_version AS "version", ''http://www.w3.org/2005/Atom'' AS "xmlns:atom", ''http://purl.org/dc/elements/1.1/'' AS "xmlns:dc"),'||unistr('\000a')||
'      xmlelement("channel",'||unistr('\000a')||
'        xmlelement("at';

s:=s||'om:link", xmlattributes(l_rss_url AS "href", ''self'' AS "rel", ''application/rss+xml'' AS "type")),'||unistr('\000a')||
'        xmlforest('||unistr('\000a')||
'          p_blog_name AS "title"'||unistr('\000a')||
'          ,l_home_url AS "link"'||unistr('\000a')||
'          ,l_rss_desc AS "description"'||unistr('\000a')||
'          ,c_rss_lang AS "language"'||unistr('\000a')||
'        ),'||unistr('\000a')||
'        xmlagg('||unistr('\000a')||
'          xmlelement("item",'||unistr('\000a')||
'            xmlelement("title", l.rss_title),'||unistr('\000a')||
'            xmlelement("dc:creator", l.pos';

s:=s||'ted_by),'||unistr('\000a')||
'            xmlelement("category", l.category_name),'||unistr('\000a')||
'            xmlelement("link", p_base_url || APEX_UTIL.PREPARE_URL(l_article_url || l.article_id, NULL, ''PUBLIC_BOOKMARK'')),'||unistr('\000a')||
'            xmlelement("description", l.description),'||unistr('\000a')||
'            xmlelement("pubDate", TO_CHAR(l.created_on, c_date_form, c_date_lang)),'||unistr('\000a')||
'            xmlelement("guid", xmlattributes(''false'' AS "isPermaLink"), l.a';

s:=s||'rticle_id || TO_CHAR(l.created_on, ''JHH24MISS''))'||unistr('\000a')||
'          ) ORDER BY created_on DESC'||unistr('\000a')||
'        )'||unistr('\000a')||
'      )'||unistr('\000a')||
'    ).getblobval(nls_charset_id(''AL32UTF8''))'||unistr('\000a')||
'    INTO l_xml'||unistr('\000a')||
'    FROM blog_article_last20 l'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    owa_util.mime_header(''application/rss+xml'', TRUE);'||unistr('\000a')||
'    wpg_docload.download_file(l_xml);'||unistr('\000a')||
'    APEX_APPLICATION.STOP_APEX_ENGINE;'||unistr('\000a')||
''||unistr('\000a')||
'  END rss;'||unistr('\000a')||
'-------------------------------------------------------';

s:=s||'-------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE sitemap('||unistr('\000a')||
'    p_app_id    IN NUMBER,'||unistr('\000a')||
'    p_app_alias IN VARCHAR2,'||unistr('\000a')||
'    p_base_url  IN VARCHAR2,'||unistr('\000a')||
'    p_tab_list  IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_xml             BLOB;'||unistr('\000a')||
'    l_article_url     VARCHAR2(255);'||unistr('\000a')||
'    l_category_url    VARCHAR2(255);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'    l_article_url   := ''f?p='' || p_app_';

s:=s||'alias || '':READ:0::::ARTICLE:'';'||unistr('\000a')||
'    l_category_url  := ''f?p='' || p_app_alias || '':READCAT:0::::CATEGORY:'';'||unistr('\000a')||
''||unistr('\000a')||
'    WITH article_cat AS('||unistr('\000a')||
'      SELECT category_id,'||unistr('\000a')||
'        MAX(changed_on) AS changed_on'||unistr('\000a')||
'      FROM blog_article b'||unistr('\000a')||
'      WHERE b.active = ''Y'''||unistr('\000a')||
'        AND b.valid_from <= SYSDATE'||unistr('\000a')||
'      GROUP BY category_id'||unistr('\000a')||
'    ), sitemap_query AS ('||unistr('\000a')||
'      SELECT 1 AS grp,'||unistr('\000a')||
'        ROW_NUMBER() OVER(ORDER BY e.d';

s:=s||'isplay_sequence) AS rnum,'||unistr('\000a')||
'        APEX_PLUGIN_UTIL.REPLACE_SUBSTITUTIONS(e.entry_target) AS url,'||unistr('\000a')||
'        (SELECT MAX(changed_on) FROM article_cat) AS lastmod'||unistr('\000a')||
'      FROM APEX_APPLICATION_LIST_ENTRIES e'||unistr('\000a')||
'      WHERE e.application_id = p_app_id'||unistr('\000a')||
'        AND e.list_name      = p_tab_list'||unistr('\000a')||
'        --AND COALESCE(blog_util.get_param_value(e.authorization_scheme), ''Y'') = ''Y'''||unistr('\000a')||
'        AND'||unistr('\000a')||
'          blog_xml.s';

s:=s||'how_entry('||unistr('\000a')||
'            (SELECT o.build_option_id FROM apex_application_build_options o WHERE o.build_option_name = e.build_option),'||unistr('\000a')||
'            e.authorization_scheme_id,'||unistr('\000a')||
'            e.condition_type_code,'||unistr('\000a')||
'            e.condition_expression1,'||unistr('\000a')||
'            e.condition_expression2'||unistr('\000a')||
'           ) = ''Y'''||unistr('\000a')||
'      UNION ALL'||unistr('\000a')||
'      SELECT 2 AS grp,'||unistr('\000a')||
'        ROW_NUMBER() OVER(ORDER BY a.created_on) AS rnum,'||unistr('\000a')||
'     ';

s:=s||'   APEX_UTIL.PREPARE_URL(l_article_url || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS url,'||unistr('\000a')||
'        a.changed_on AS lastmod'||unistr('\000a')||
'      FROM blog_article a'||unistr('\000a')||
'      WHERE a.active = ''Y'''||unistr('\000a')||
'        AND a.valid_from <= SYSDATE'||unistr('\000a')||
'      UNION ALL'||unistr('\000a')||
'      SELECT 3 AS grp,'||unistr('\000a')||
'        ROW_NUMBER() OVER(ORDER BY c.category_seq) AS rnum,'||unistr('\000a')||
'        APEX_UTIL.PREPARE_URL(l_category_url || c.category_id, NULL, ''PUBLIC_BOOKMARK'') AS ';

s:=s||'url,'||unistr('\000a')||
'        a.changed_on AS lastmod'||unistr('\000a')||
'      FROM blog_category c'||unistr('\000a')||
'      JOIN article_cat a'||unistr('\000a')||
'        ON c.category_id = a.category_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    SELECT XMLElement("urlset", XMLAttributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' AS "xmlns"),'||unistr('\000a')||
'        ('||unistr('\000a')||
'          XMLAgg('||unistr('\000a')||
'              XMLElement("url"'||unistr('\000a')||
'              ,XMLElement("loc", p_base_url || url)'||unistr('\000a')||
'              ,XMLElement("lastmod", TO_CHAR(las';

s:=s||'tmod, ''YYYY-MM-DD''))'||unistr('\000a')||
'              ,XMLElement("changefreq", ''monthly'')'||unistr('\000a')||
'              ,XMLElement("priority", ''0.5'')'||unistr('\000a')||
'            ) ORDER BY grp,rnum'||unistr('\000a')||
'          )'||unistr('\000a')||
'        )'||unistr('\000a')||
'      ).getblobval(nls_charset_id(''AL32UTF8''))'||unistr('\000a')||
'    INTO l_xml'||unistr('\000a')||
'    FROM sitemap_query'||unistr('\000a')||
'    ;'||unistr('\000a')||
''||unistr('\000a')||
'    owa_util.mime_header(''application/xml'', TRUE);'||unistr('\000a')||
'    wpg_docload.download_file(l_xml);'||unistr('\000a')||
'    APEX_APPLICATION.STOP_APEX_ENGINE;'||unistr('\000a')||
''||unistr('\000a')||
'  END si';

s:=s||'temap;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_XML";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE  "BLOG_UTIL" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION init_session ('||unistr('\000a')||
'    p_app_id          IN NUMBER,'||unistr('\000a')||
'    p_session_';

s:=s||'id      IN NUMBER'||unistr('\000a')||
'  ) RETURN NUMBER;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_param_value ('||unistr('\000a')||
'    p_param_id        IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_article_url('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_app_alias       IN VARCHAR2,'||unistr('\000a')||
'    p_base_url       ';

s:=s||' IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE set_items_from_param ('||unistr('\000a')||
'    p_app_id          IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_comment('||unistr('\000a')||
'    p_user_id         IN OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_apex_session_id IN NUMBER,'||unistr('\000a')||
'    p_app_alias ';

s:=s||'      IN VARCHAR2,'||unistr('\000a')||
'    p_base_url        IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name       IN VARCHAR2,'||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_article_title   IN VARCHAR2,'||unistr('\000a')||
'    p_email           IN VARCHAR2,'||unistr('\000a')||
'    p_nick_name       IN VARCHAR2,'||unistr('\000a')||
'    p_website         IN VARCHAR2,'||unistr('\000a')||
'    p_followup        IN VARCHAR2,'||unistr('\000a')||
'    p_comment         IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'----------------------------------------------------------------';

s:=s||'----------------'||unistr('\000a')||
'  PROCEDURE save_contact ('||unistr('\000a')||
'    p_user_id         IN OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_apex_session_id IN NUMBER,'||unistr('\000a')||
'    p_email           IN VARCHAR2,'||unistr('\000a')||
'    p_nick_name       IN VARCHAR2,'||unistr('\000a')||
'    p_website         IN VARCHAR2,'||unistr('\000a')||
'    p_comment         IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE notify_readers ('||unistr('\000a')||
'    p_comment_id      IN ';

s:=s||'NUMBER,'||unistr('\000a')||
'    p_user_id         IN NUMBER,'||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_article_title   IN VARCHAR2,'||unistr('\000a')||
'    p_app_alias       IN VARCHAR2,'||unistr('\000a')||
'    p_base_url        IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name       IN VARCHAR2,'||unistr('\000a')||
'    p_article_url     IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE unsubscribe ('||unistr('\000a')||
'    p_value           IN OUT NOCOPY VARC';

s:=s||'HAR2,'||unistr('\000a')||
'    p_user_id         OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_article_id      OUT NOCOPY NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE download_file ('||unistr('\000a')||
'    p_session_id  IN NUMBER,'||unistr('\000a')||
'    p_file_name   IN VARCHAR2,'||unistr('\000a')||
'    p_user_id     IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_ema';

s:=s||'il ('||unistr('\000a')||
'    p_email           IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_UTIL";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_UTIL" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-- Private variables, procedure';

s:=s||'s and functions'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  TYPE t_author IS RECORD ('||unistr('\000a')||
'    n_author_id     NUMBER(38),'||unistr('\000a')||
'    v_author_name   VARCHAR2(80),'||unistr('\000a')||
'    v_email         VARCHAR2(120),'||unistr('\000a')||
'    v_active        VARCHAR2(1),'||unistr('\000a')||
'    v_email_notify  VARCHAR2(1)'||unistr('\000a')||
'  );'||unistr('\000a')||
'  TYPE t_email  IS RECO';

s:=s||'RD ('||unistr('\000a')||
'    v_from          VARCHAR2(120),'||unistr('\000a')||
'    v_subj          VARCHAR2(255),'||unistr('\000a')||
'    v_body          VARCHAR2(32700)'||unistr('\000a')||
'  );'||unistr('\000a')||
'  g_cookie_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), 12);'||unistr('\000a')||
'  g_watche_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), -1);'||unistr('\000a')||
'  g_cookie_name       CONSTANT VARCHAR2(30)   := ''__dbswhblog'';'||unistr('\000a')||
'  g_cookie_version    CONSTANT VARCHAR2(30)   := ''020100'';';

s:=s||''||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_user_name ('||unistr('\000a')||
'    p_user_id IN NUMBER'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_user_name VARCHAR2(255);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT nick_name'||unistr('\000a')||
'    INTO l_user_name'||unistr('\000a')||
'    FROM blog_comment_user'||unistr('\000a')||
'    WHERE user_id = p_user_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_user';

s:=s||'_name;'||unistr('\000a')||
'  EXCEPTION WHEN'||unistr('\000a')||
'    NO_DATA_FOUND OR'||unistr('\000a')||
'    VALUE_ERROR OR'||unistr('\000a')||
'    INVALID_NUMBER'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    apex_debug.warn(''blog_util.get_user_name(p_user_id => %s); error: %s'', p_user_id, sqlerrm);'||unistr('\000a')||
'    RETURN NULL;'||unistr('\000a')||
'  END get_user_name;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get';

s:=s||'_article_author('||unistr('\000a')||
'    p_article_id IN NUMBER'||unistr('\000a')||
'  ) RETURN t_author'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_author  t_author;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT u.author_id,'||unistr('\000a')||
'      author_name,'||unistr('\000a')||
'      email,'||unistr('\000a')||
'      active,'||unistr('\000a')||
'      email_notify'||unistr('\000a')||
'      INTO l_author.n_author_id,'||unistr('\000a')||
'        l_author.v_author_name,'||unistr('\000a')||
'        l_author.v_email,'||unistr('\000a')||
'        l_author.v_active,'||unistr('\000a')||
'        l_author.v_email_notify'||unistr('\000a')||
'    FROM blog_author u'||unistr('\000a')||
'    WHERE EXISTS('||unistr('\000a')||
'      SELECT 1'||unistr('\000a')||
'    ';

s:=s||'  FROM blog_article a'||unistr('\000a')||
'      WHERE a.article_id = p_article_id'||unistr('\000a')||
'      AND a.author_id = u.author_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_author;'||unistr('\000a')||
'  EXCEPTION WHEN'||unistr('\000a')||
'    NO_DATA_FOUND OR'||unistr('\000a')||
'    VALUE_ERROR OR'||unistr('\000a')||
'    INVALID_NUMBER'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    apex_debug.warn(''blog_util.get_author_record_by_article(p_article_id => %s); error: %s'', p_article_id, sqlerrm);'||unistr('\000a')||
'    RETURN NULL;'||unistr('\000a')||
'  END get_article_author;'||unistr('\000a')||
'--------------------------';

s:=s||'------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION raw_to_table('||unistr('\000a')||
'    p_value     IN RAW,'||unistr('\000a')||
'    p_separator IN VARCHAR2 DEFAULT '':'''||unistr('\000a')||
'  ) RETURN apex_application_global.vc_arr2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_value VARCHAR2(32700);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_value := UTL_RAW.CAST_TO_VARCHAR2(p_value);'||unistr('\000a')||
'    l_value := UTL_URL.UNESCAPE(l_value)';

s:=s||';'||unistr('\000a')||
'    RETURN APEX_UTIL.STRING_TO_TABLE(l_value, COALESCE(p_separator, '':''));'||unistr('\000a')||
'  END raw_to_table;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE set_cookie('||unistr('\000a')||
'    p_user_id IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'    -- The first element in th';

s:=s||'e table is the cookie version'||unistr('\000a')||
'    -- The second element in the table is the user id'||unistr('\000a')||
'    owa_cookie.send('||unistr('\000a')||
'      name    => blog_util.g_cookie_name,'||unistr('\000a')||
'      value   => UTL_RAW.CAST_TO_RAW(blog_util.g_cookie_version || '':'' || p_user_id),'||unistr('\000a')||
'      expires => blog_util.g_cookie_expires'||unistr('\000a')||
'    );'||unistr('\000a')||
'    --owa_util.http_header_close;'||unistr('\000a')||
'  END set_cookie;'||unistr('\000a')||
'----------------------------------------------------------------';

s:=s||'----------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_cookie'||unistr('\000a')||
'  RETURN NUMBER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_user_id     NUMBER(38,0);'||unistr('\000a')||
'    l_cookie_val  VARCHAR2(2000);'||unistr('\000a')||
'    l_cookie_vals apex_application_global.vc_arr2;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_cookie_val := APEX_AUTHENTICATION.GET_LOGIN_USERNAME_COOKIE(blog_util.g_cookie_name);'||unistr('\000a')||
'    IF l_cookie_val IS NOT NULL THEN'||unistr('\000a')||
'     ';

s:=s||' l_cookie_vals := blog_util.raw_to_table(l_cookie_val);'||unistr('\000a')||
'      -- The first element in the table is the cookie version'||unistr('\000a')||
'      IF l_cookie_vals(1) = blog_util.g_cookie_version THEN'||unistr('\000a')||
'        -- The second element in the table is the user id'||unistr('\000a')||
'        l_user_id := TO_NUMBER(l_cookie_vals(2));'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_user_id;'||unistr('\000a')||
'  EXCEPTION WHEN'||unistr('\000a')||
'    NO_DATA_FOUND OR'||unistr('\000a')||
'    INVALID_NUMBER OR'||unistr('\000a')||
'    VA';

s:=s||'LUE_ERROR'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    apex_debug.warn(''blog_util.get_cookie; error: %s'', sqlerrm);'||unistr('\000a')||
'    RETURN NULL;'||unistr('\000a')||
'  END get_cookie;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_email_message ('||unistr('\000a')||
'    p_article_title IN VARCHAR2,'||unistr('\000a')||
'    p_article_url   IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name     IN V';

s:=s||'ARCHAR2,'||unistr('\000a')||
'    p_author_name   IN VARCHAR2,'||unistr('\000a')||
'    p_subj          IN VARCHAR2,'||unistr('\000a')||
'    p_body          IN VARCHAR2'||unistr('\000a')||
'  ) RETURN t_email'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    TYPE tabtype IS TABLE OF VARCHAR2(255) INDEX BY VARCHAR2(40);'||unistr('\000a')||
'    l_arr   tabtype;'||unistr('\000a')||
'    l_key   VARCHAR2(40);'||unistr('\000a')||
'    l_email t_email;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_email.v_subj            := blog_util.get_param_value(p_subj);'||unistr('\000a')||
'    l_email.v_body            := blog_util.get_param_value(';

s:=s||'p_body);'||unistr('\000a')||
'    l_arr(''#BLOG_NAME#'')      := p_blog_name;'||unistr('\000a')||
'    l_arr(''#ARTICLE_TITLE#'')  := p_article_title;'||unistr('\000a')||
'    l_arr(''#AUTHOR_NAME#'')    := p_author_name;'||unistr('\000a')||
'    l_arr(''#ARTICLE_URL#'')    := p_article_url;  '||unistr('\000a')||
'    l_key := l_arr.FIRST;'||unistr('\000a')||
'    -- Substitude message'||unistr('\000a')||
'    WHILE l_key IS NOT NULL LOOP'||unistr('\000a')||
'      l_email.v_subj := REGEXP_REPLACE( l_email.v_subj, l_key, l_arr(l_key), 1, 0, ''i'' );'||unistr('\000a')||
'      l_email.v_body :';

s:=s||'= REGEXP_REPLACE( l_email.v_body, l_key, l_arr(l_key), 1, 0, ''i'' );'||unistr('\000a')||
'      l_key := l_arr.NEXT(l_key);'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    /* Get blog email */'||unistr('\000a')||
'    l_email.v_from := blog_util.get_param_value(''BLOG_EMAIL'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'    RETURN l_email;'||unistr('\000a')||
'  END get_email_message;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------------------------------------------------';

s:=s||'-----------------'||unistr('\000a')||
'  FUNCTION get_unsubscribe_url ('||unistr('\000a')||
'    p_user_id     IN NUMBER,'||unistr('\000a')||
'    p_article_id  IN NUMBER,'||unistr('\000a')||
'    p_app_alias   IN VARCHAR2,'||unistr('\000a')||
'    p_base_url    IN VARCHAR2,'||unistr('\000a')||
'    p_page_alias  IN VARCHAR2 DEFAULT ''UNSUBSCRIBE'','||unistr('\000a')||
'    p_session_id  IN NUMBER DEFAULT 0'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_url       VARCHAR2(2000);'||unistr('\000a')||
'    l_value     VARCHAR2(2000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_value := UTL_RAW.CAST_TO_RAW(p_user';

s:=s||'_id || '':'' || p_article_id);'||unistr('\000a')||
'    l_url   := ''f?p='' || p_app_alias || '':UNSUBSCRIBE:'' || p_session_id || ''::::SUBSCRIBER_ID:'' || l_value;'||unistr('\000a')||
'    l_url   := APEX_UTIL.PREPARE_URL(p_url => l_url, p_checksum_type => ''PUBLIC_BOOKMARK'');'||unistr('\000a')||
'    l_url   := p_base_url || l_url;'||unistr('\000a')||
'    RETURN l_url;'||unistr('\000a')||
'  END get_unsubscribe_url;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------';

s:=s||'-----------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_user_attr('||unistr('\000a')||
'    p_user_id     OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_email       IN VARCHAR2,'||unistr('\000a')||
'    p_nick_name   IN VARCHAR2,'||unistr('\000a')||
'    p_website     IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      INSERT INTO blog_comment_user (email, nick_name, website)'||unistr('\000a')||
'        VALUES (p_email, p_nick_name, p_website)'||unistr('\000a')||
'      RETURNING user_id INTO p_';

s:=s||'user_id'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN'||unistr('\000a')||
'      UPDATE blog_comment_user'||unistr('\000a')||
'        SET nick_name = p_nick_name,'||unistr('\000a')||
'          website = p_website'||unistr('\000a')||
'        WHERE email = p_email'||unistr('\000a')||
'      RETURNING user_id INTO p_user_id'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'  END save_user_attr;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------';

s:=s||'------------------------'||unistr('\000a')||
'  PROCEDURE save_notify_user ('||unistr('\000a')||
'    p_user_id         IN NUMBER,'||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_followup        IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    MERGE INTO blog_comment_notify a'||unistr('\000a')||
'    USING ('||unistr('\000a')||
'      SELECT p_user_id AS user_id,'||unistr('\000a')||
'        p_article_id AS article_id,'||unistr('\000a')||
'        p_followup  AS followup_notify'||unistr('\000a')||
'      FROM DUAL'||unistr('\000a')||
'    ) b'||unistr('\000a')||
'    ON (a.user_id = b.user_id AND a.article_';

s:=s||'id = b.article_id)'||unistr('\000a')||
'    WHEN MATCHED THEN'||unistr('\000a')||
'      UPDATE SET a.followup_notify = b.followup_notify'||unistr('\000a')||
'    WHEN NOT MATCHED THEN'||unistr('\000a')||
'      INSERT (user_id, article_id, followup_notify)'||unistr('\000a')||
'      VALUES (b.user_id, b.article_id, b.followup_notify)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END save_notify_user;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------------------------------------------';

s:=s||'-----------------------'||unistr('\000a')||
'  PROCEDURE notify_author ('||unistr('\000a')||
'    p_article_title IN VARCHAR2,'||unistr('\000a')||
'    p_article_url   IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name     IN VARCHAR2,'||unistr('\000a')||
'    p_author_name   IN VARCHAR2,'||unistr('\000a')||
'    p_author_email  IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_email t_email;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Get email subject and body to variable */'||unistr('\000a')||
'    l_email := blog_util.get_email_message('||unistr('\000a')||
'      p_article_title => p_article_title,'||unistr('\000a')||
'      p_art';

s:=s||'icle_url   => p_article_url,'||unistr('\000a')||
'      p_blog_name     => p_blog_name,'||unistr('\000a')||
'      p_author_name   => p_author_name,'||unistr('\000a')||
'      p_subj          => ''NEW_COMMENT_EMAIL_SUBJ'','||unistr('\000a')||
'      p_body          => ''NEW_COMMENT_EMAIL_BODY'''||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Send mail to author */'||unistr('\000a')||
'    APEX_MAIL.SEND ('||unistr('\000a')||
'      p_from => l_email.v_from,'||unistr('\000a')||
'      p_to   => p_author_email,'||unistr('\000a')||
'      p_subj => l_email.v_subj,'||unistr('\000a')||
'      p_body => l_email.v_body'||unistr('\000a')||
'    );'||unistr('\000a')||
'';

s:=s||'    /* we do have time wait email sending */'||unistr('\000a')||
'    --APEX_MAIL.PUSH_QUEUE;'||unistr('\000a')||
'  END notify_author;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-- Global functions and procedures'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------';

s:=s||'----------------------------------------------------'||unistr('\000a')||
'  FUNCTION init_session ('||unistr('\000a')||
'    p_app_id      IN NUMBER,'||unistr('\000a')||
'    p_session_id  IN NUMBER'||unistr('\000a')||
'  ) RETURN NUMBER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_user_id     NUMBER(38);'||unistr('\000a')||
'    l_user_name   VARCHAR2(255);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    blog_util.set_items_from_param(p_app_id);'||unistr('\000a')||
'    l_user_id := blog_util.get_cookie;'||unistr('\000a')||
'    IF l_user_id IS NOT NULL THEN'||unistr('\000a')||
'      l_user_name := blog_util.get_user_name(l_user';

s:=s||'_id);'||unistr('\000a')||
'      IF l_user_name IS NOT NULL THEN'||unistr('\000a')||
'        /* Set APP_USER */'||unistr('\000a')||
'        APEX_CUSTOM_AUTH.SET_USER(UPPER(l_user_name));'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        l_user_id := NULL;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF apex_util.public_check_authorization(''LOGGING_ENABLED'') THEN'||unistr('\000a')||
'      blog_log.write_activity_log('||unistr('\000a')||
'        p_user_id       => l_user_id,'||unistr('\000a')||
'        p_session_id    => p_session_id,'||unistr('\000a')||
'        p_ip_address    => o';

s:=s||'wa_util.get_cgi_env(''REMOTE_ADDR''),'||unistr('\000a')||
'        p_user_agent    => owa_util.get_cgi_env(''HTTP_USER_AGENT''),'||unistr('\000a')||
'        p_referer       => owa_util.get_cgi_env(''HTTP_REFERER''),'||unistr('\000a')||
'        p_activity_type => ''NEW_SESSION'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_user_id;'||unistr('\000a')||
'  END init_session;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------------------------';

s:=s||'----------------------------------'||unistr('\000a')||
'  FUNCTION get_param_value('||unistr('\000a')||
'    p_param_id IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_value VARCHAR2(4000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT param_value'||unistr('\000a')||
'    INTO l_value'||unistr('\000a')||
'    FROM blog_param'||unistr('\000a')||
'    WHERE param_id = p_param_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_value;'||unistr('\000a')||
'  END get_param_value;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------------';

s:=s||'-----------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_article_url('||unistr('\000a')||
'    p_article_id  IN NUMBER,'||unistr('\000a')||
'    p_app_alias   IN VARCHAR2,'||unistr('\000a')||
'    p_base_url    IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_url VARCHAR2(2000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_url := ''f?p='' || p_app_alias || '':READ:0::::ARTICLE:'' || p_article_id;'||unistr('\000a')||
'    l_url := APEX_UTIL.PREPARE_URL(p_url => l_url, p_checksum_type => ''PUBLIC_B';

s:=s||'OOKMARK'');'||unistr('\000a')||
'    l_url := p_base_url || l_url;'||unistr('\000a')||
'    RETURN l_url;'||unistr('\000a')||
'  END get_article_url;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE set_items_from_param('||unistr('\000a')||
'    p_app_id IN NUMBER'||unistr('\000a')||
'  ) AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    FOR c1 IN ('||unistr('\000a')||
'      SELECT'||unistr('\000a')||
'        p.param_id,'||unistr('\000a')||
'        p.param_value'||unistr('\000a')||
'      FRO';

s:=s||'M blog_param p'||unistr('\000a')||
'      WHERE p.param_value IS NOT NULL'||unistr('\000a')||
'        AND EXISTS('||unistr('\000a')||
'          SELECT 1'||unistr('\000a')||
'          FROM blog_param_app a'||unistr('\000a')||
'          WHERE a.application_id = p_app_id'||unistr('\000a')||
'          AND a.param_id = p.param_id'||unistr('\000a')||
'        )'||unistr('\000a')||
'    ) LOOP'||unistr('\000a')||
'      APEX_UTIL.SET_SESSION_STATE(c1.param_id, c1.param_value);'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END set_items_from_param;'||unistr('\000a')||
'-------------------------------------------------------------------';

s:=s||'-------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_comment('||unistr('\000a')||
'    p_user_id         IN OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_apex_session_id IN NUMBER,'||unistr('\000a')||
'    p_app_alias       IN VARCHAR2,'||unistr('\000a')||
'    p_base_url        IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name       IN VARCHAR2,'||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_article_title   IN VARCHAR2,'||unistr('\000a')||
'    p_email           IN VARC';

s:=s||'HAR2,'||unistr('\000a')||
'    p_nick_name       IN VARCHAR2,'||unistr('\000a')||
'    p_website         IN VARCHAR2,'||unistr('\000a')||
'    p_followup        IN VARCHAR2,'||unistr('\000a')||
'    p_comment         IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_comment_id  NUMBER(38);'||unistr('\000a')||
'    l_article_url VARCHAR2(4000);'||unistr('\000a')||
'    l_publish     VARCHAR2(1) := ''N'';'||unistr('\000a')||
'    l_author      t_author;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Set APP_USER */'||unistr('\000a')||
'    APEX_CUSTOM_AUTH.SET_USER(UPPER(p_nick_name));'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Insert or update use';

s:=s||'r */'||unistr('\000a')||
'    blog_util.save_user_attr('||unistr('\000a')||
'      p_user_id     => p_user_id,'||unistr('\000a')||
'      p_email       => p_email,'||unistr('\000a')||
'      p_nick_name   => p_nick_name,'||unistr('\000a')||
'      p_website     => p_website'||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Save should user be notified when new comment is posted */'||unistr('\000a')||
'    blog_util.save_notify_user('||unistr('\000a')||
'      p_user_id     => p_user_id,'||unistr('\000a')||
'      p_article_id  => p_article_id,'||unistr('\000a')||
'      p_followup    => p_followup'||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Set us';

s:=s||'er id to cookie */'||unistr('\000a')||
'    blog_util.set_cookie(p_user_id);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Should author moderate comment before it is published */'||unistr('\000a')||
'    IF NOT apex_util.public_check_authorization(''MODERATION_ENABLED'') THEN'||unistr('\000a')||
'      l_publish := ''Y'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Inser comment to table */'||unistr('\000a')||
'    INSERT INTO blog_comment'||unistr('\000a')||
'    (user_id, apex_session_id, article_id, comment_text, moderated)'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    (p_user_id';

s:=s||', p_apex_session_id, p_article_id, p_comment , l_publish)'||unistr('\000a')||
'    RETURNING comment_id INTO l_comment_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Update user id to activity log */'||unistr('\000a')||
'    UPDATE blog_activity_log'||unistr('\000a')||
'    SET user_id = p_user_id'||unistr('\000a')||
'    WHERE apex_session_id = p_apex_session_id'||unistr('\000a')||
'      AND user_id IS NULL'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Get article url */'||unistr('\000a')||
'    l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_b';

s:=s||'ase_url);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Send email about new comment to readers */'||unistr('\000a')||
'    IF l_publish = ''Y'' THEN'||unistr('\000a')||
'      blog_util.notify_readers ('||unistr('\000a')||
'        p_comment_id    => l_comment_id,'||unistr('\000a')||
'        p_user_id       => p_user_id,'||unistr('\000a')||
'        p_article_id    => p_article_id,'||unistr('\000a')||
'        p_article_title => p_article_title,'||unistr('\000a')||
'        p_article_url   => l_article_url,'||unistr('\000a')||
'        p_app_alias     => p_app_alias,'||unistr('\000a')||
'        p_base_url      =>';

s:=s||' p_base_url,'||unistr('\000a')||
'        p_blog_name     => p_blog_name'||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Refresh comment log */'||unistr('\000a')||
'    DBMS_MVIEW.REFRESH(''BLOG_COMMENT_LOG'');'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Get author details for notification emails */'||unistr('\000a')||
'    l_author := blog_util.get_article_author(p_article_id);'||unistr('\000a')||
'    --'||unistr('\000a')||
'    /* Send email about new comment to author */'||unistr('\000a')||
'    /* If we have author email and author is active and like have noti';

s:=s||'fications */'||unistr('\000a')||
'    IF  l_author.v_email IS NOT NULL'||unistr('\000a')||
'    AND (l_author.v_active = ''Y'' AND l_author.v_email_notify = ''Y'')'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      blog_util.notify_author ('||unistr('\000a')||
'        p_article_title => p_article_title,'||unistr('\000a')||
'        p_article_url   => l_article_url,'||unistr('\000a')||
'        p_blog_name     => p_blog_name,'||unistr('\000a')||
'        p_author_name   => l_author.v_author_name,'||unistr('\000a')||
'        p_author_email  => l_author.v_email'||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;';

s:=s||''||unistr('\000a')||
'  END save_comment;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_contact('||unistr('\000a')||
'    p_user_id         IN OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_apex_session_id IN NUMBER,'||unistr('\000a')||
'    p_email           IN VARCHAR2,'||unistr('\000a')||
'    p_nick_name       IN VARCHAR2,'||unistr('\000a')||
'    p_website         IN VARCHAR2,'||unistr('\000a')||
'    p_com';

s:=s||'ment         IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Set APP_USER */'||unistr('\000a')||
'    APEX_CUSTOM_AUTH.SET_USER(UPPER(p_nick_name));'||unistr('\000a')||
'    /* Insert or update user */'||unistr('\000a')||
'    blog_util.save_user_attr('||unistr('\000a')||
'      p_user_id     => p_user_id,'||unistr('\000a')||
'      p_email       => p_email,'||unistr('\000a')||
'      p_nick_name   => p_nick_name,'||unistr('\000a')||
'      p_website     => p_website'||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Inser message to table */'||unistr('\000a')||
'    INSERT INTO blog_contact_message'||unistr('\000a')||
'    (user_';

s:=s||'id, apex_session_id, message)'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    (p_user_id, p_apex_session_id, p_comment)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'     /* Set user id to cookie */'||unistr('\000a')||
'    blog_util.set_cookie(p_user_id);'||unistr('\000a')||
'  END save_contact;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE notify_readers ('||unistr('\000a')||
'    p_comment_id    IN NUM';

s:=s||'BER,'||unistr('\000a')||
'    p_user_id       IN NUMBER,'||unistr('\000a')||
'    p_article_id    IN NUMBER,'||unistr('\000a')||
'    p_article_title IN VARCHAR2,'||unistr('\000a')||
'    p_app_alias     IN VARCHAR2,'||unistr('\000a')||
'    p_base_url      IN VARCHAR2,'||unistr('\000a')||
'    p_blog_name     IN VARCHAR2,'||unistr('\000a')||
'    p_article_url   IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_unsubscribe_url VARCHAR2(2000);'||unistr('\000a')||
'    l_user_email      t_email;'||unistr('\000a')||
'    l_email           t_email;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Get email subject and body to variables */'||unistr('\000a')||
'  ';

s:=s||'  l_email := blog_util.get_email_message('||unistr('\000a')||
'      p_article_title => p_article_title,'||unistr('\000a')||
'      p_article_url   => p_article_url,'||unistr('\000a')||
'      p_blog_name     => p_blog_name,'||unistr('\000a')||
'      p_author_name   => ''#AUTHOR_NAME#'','||unistr('\000a')||
'      p_subj          => ''FOLLOWUP_EMAIL_SUBJ'','||unistr('\000a')||
'      p_body          => ''FOLLOWUP_EMAIL_BODY'''||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Loop trough all users that like have notification */'||unistr('\000a')||
'    FOR c1 IN ('||unistr('\000a')||
'      SELECT email';

s:=s||','||unistr('\000a')||
'        nick_name,'||unistr('\000a')||
'        user_id'||unistr('\000a')||
'      FROM blog_comment_user u'||unistr('\000a')||
'      WHERE u.user_id != p_user_id'||unistr('\000a')||
'        AND u.blocked = ''N'''||unistr('\000a')||
'        AND EXISTS('||unistr('\000a')||
'          SELECT 1'||unistr('\000a')||
'          FROM blog_comment_notify n'||unistr('\000a')||
'          WHERE n.user_id = u.user_id'||unistr('\000a')||
'          AND n.article_id = p_article_id'||unistr('\000a')||
'          AND n.followup_notify = ''Y'''||unistr('\000a')||
'          AND n.changed_on > g_watche_expires'||unistr('\000a')||
'        )'||unistr('\000a')||
'        AND EXISTS(';

s:=s||''||unistr('\000a')||
'          SELECT 1'||unistr('\000a')||
'          FROM blog_comment c'||unistr('\000a')||
'          WHERE c.article_id = p_article_id'||unistr('\000a')||
'          AND c.comment_id = p_comment_id'||unistr('\000a')||
'          AND c.active = ''Y'''||unistr('\000a')||
'          AND c.moderated = ''Y'''||unistr('\000a')||
'          AND c.notify_email_sent = ''N'''||unistr('\000a')||
'        )'||unistr('\000a')||
'    ) LOOP'||unistr('\000a')||
'      /* User specific unsubscribe url */'||unistr('\000a')||
'      l_unsubscribe_url := blog_util.get_unsubscribe_url('||unistr('\000a')||
'        p_user_id     => c1.user_id,'||unistr('\000a')||
'     ';

s:=s||'   p_article_id  => p_article_id,'||unistr('\000a')||
'        p_app_alias   => p_app_alias,'||unistr('\000a')||
'        p_base_url    => p_base_url'||unistr('\000a')||
'      );'||unistr('\000a')||
'      /* Make user specific substitutions */'||unistr('\000a')||
'      l_user_email.v_subj := REGEXP_REPLACE(l_email.v_subj, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');'||unistr('\000a')||
'      l_user_email.v_body := REGEXP_REPLACE(l_email.v_body, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');'||unistr('\000a')||
'      l_user_email.v_body := REGEXP_';

s:=s||'REPLACE(l_user_email.v_body, ''#UNSUBSCRIBE_URL#'', l_unsubscribe_url, 1, 0, ''i'');'||unistr('\000a')||
'      /* Send mail to user */'||unistr('\000a')||
'      APEX_MAIL.SEND ('||unistr('\000a')||
'        p_from => l_email.v_from,'||unistr('\000a')||
'        p_to   => c1.email,'||unistr('\000a')||
'        p_subj => l_user_email.v_subj,'||unistr('\000a')||
'        p_body => l_user_email.v_body'||unistr('\000a')||
'      );'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    /* we do have time wait email sending */'||unistr('\000a')||
'    --APEX_MAIL.PUSH_QUEUE;'||unistr('\000a')||
'    UPDATE blog_comment'||unistr('\000a')||
'      S';

s:=s||'ET notify_email_sent = ''Y'''||unistr('\000a')||
'    WHERE comment_id = p_comment_id'||unistr('\000a')||
'      AND active = ''Y'''||unistr('\000a')||
'      AND moderated = ''Y'''||unistr('\000a')||
'      AND notify_email_sent = ''N'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END notify_readers;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE unsubscribe('||unistr('\000a')||
'    p_value       IN OUT NOCOPY VARCHAR';

wwv_flow_api.create_install_script(
  p_id => 11220716262817091 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '7 Package',
  p_sequence=> 70,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||'2,'||unistr('\000a')||
'    p_user_id     OUT NOCOPY NUMBER,'||unistr('\000a')||
'    p_article_id  OUT NOCOPY NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_user_name   VARCHAR2(255);'||unistr('\000a')||
'    l_arr       apex_application_global.vc_arr2;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_arr         := blog_util.raw_to_table(p_value);'||unistr('\000a')||
'    p_value       := NULL;'||unistr('\000a')||
'    p_user_id     := l_arr(1);'||unistr('\000a')||
'    p_article_id  := l_arr(2);'||unistr('\000a')||
'    IF p_user_id IS NOT NULL THEN'||unistr('\000a')||
'      l_user_name := blog_util.get_user_name(p_u';

s:=s||'ser_id);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF p_user_id IS NOT NULL'||unistr('\000a')||
'    AND l_user_name IS NOT NULL'||unistr('\000a')||
'    AND p_article_id IS NOT NULL'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      /* Set APP_USER */'||unistr('\000a')||
'      APEX_CUSTOM_AUTH.SET_USER(UPPER(l_user_name));'||unistr('\000a')||
'      blog_util.save_notify_user('||unistr('\000a')||
'        p_user_id    => p_user_id,'||unistr('\000a')||
'        p_article_id => p_article_id,'||unistr('\000a')||
'        p_followup   => ''N'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      p_user_id     := NULL;'||unistr('\000a')||
'      p_article_';

s:=s||'id  := NULL;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  EXCEPTION WHEN'||unistr('\000a')||
'    NO_DATA_FOUND OR'||unistr('\000a')||
'    INVALID_NUMBER OR'||unistr('\000a')||
'    VALUE_ERROR'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    apex_debug.warn(''blog_util.unsubscribe(p_value => %s); error: %s'', p_value, sqlerrm);'||unistr('\000a')||
'    p_value       := NULL;'||unistr('\000a')||
'    p_user_id     := NULL;'||unistr('\000a')||
'    p_article_id  := NULL;'||unistr('\000a')||
'  END unsubscribe;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------';

s:=s||'-----------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE download_file ('||unistr('\000a')||
'    p_session_id  IN NUMBER,'||unistr('\000a')||
'    p_file_name   IN VARCHAR2,'||unistr('\000a')||
'    p_user_id     IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_file_name       VARCHAR2(2000);'||unistr('\000a')||
'    l_utc             TIMESTAMP;'||unistr('\000a')||
'    l_file_cached     BOOLEAN;'||unistr('\000a')||
'    l_file_rowtype    blog_file%ROWTYPE;'||unistr('\000a')||
'    l_arr             apex_application_global.vc_arr2;'||unistr('\000a')||
'    c_date_lang';

s:=s||'       CONSTANT VARCHAR2(255) := ''NLS_DATE_LANGUAGE=ENGLISH'';'||unistr('\000a')||
'    c_date_format     CONSTANT VARCHAR2(255) := ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'';'||unistr('\000a')||
'    SESSION_NOT_VALID EXCEPTION;'||unistr('\000a')||
'    PRAGMA EXCEPTION_INIT(SESSION_NOT_VALID, -20001);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    IF NOT wwv_flow_custom_auth_std.is_session_valid THEN'||unistr('\000a')||
'      RAISE_APPLICATION_ERROR(-20001, ''Unauthorized access - file will not be retrieved.'');'||unistr('\000a')||
'    END I';

s:=s||'F;'||unistr('\000a')||
'    l_file_cached := FALSE;'||unistr('\000a')||
'    /* APEX request can also contain query string */'||unistr('\000a')||
'    l_arr := APEX_UTIL.STRING_TO_TABLE(p_file_name, ''?'');'||unistr('\000a')||
'    l_file_name := l_arr(1);'||unistr('\000a')||
'    l_utc := SYS_EXTRACT_UTC(SYSTIMESTAMP);'||unistr('\000a')||
'    SELECT *'||unistr('\000a')||
'    INTO l_file_rowtype'||unistr('\000a')||
'    FROM blog_file'||unistr('\000a')||
'    WHERE file_name = l_file_name'||unistr('\000a')||
'      AND active = ''Y'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    sys.owa_util.mime_header(COALESCE (l_file_rowtype.mime_type, ''';

s:=s||'application/octet''), FALSE);'||unistr('\000a')||
'    IF l_file_rowtype.file_type != ''FILE'' THEN'||unistr('\000a')||
'      /* File type is not FILE, then use cache e.g. for images, css and JavaScript */'||unistr('\000a')||
'      /* Cache and ETag headers */'||unistr('\000a')||
'      sys.htp.p(''Cache-Control: public, max-age=31536000'');'||unistr('\000a')||
'      sys.htp.p(''Date: ''    || TO_CHAR(l_utc, c_date_format, c_date_lang));'||unistr('\000a')||
'      sys.htp.p(''Expires: '' || TO_CHAR(l_utc + 365, c_date_format, ';

s:=s||'c_date_lang));'||unistr('\000a')||
'      sys.htp.p(''ETag: "''   || l_file_rowtype.file_etag || ''"'');'||unistr('\000a')||
'      /* Check if file is modified after last download */'||unistr('\000a')||
'      IF (UPPER(TRIM(sys.OWA_UTIL.GET_CGI_ENV(''HTTP_IF_MODIFIED_SINCE''))) = UPPER(l_file_rowtype.file_modified_since))'||unistr('\000a')||
'      OR (UPPER(TRIM(sys.OWA_UTIL.GET_CGI_ENV(''HTTP_IF_NONE_MATCH'')))  = UPPER(l_file_rowtype.file_etag))'||unistr('\000a')||
'      THEN'||unistr('\000a')||
'        owa_util.status_li';

s:=s||'ne('||unistr('\000a')||
'          nstatus       => 304,'||unistr('\000a')||
'          creason       => ''Not Modified'','||unistr('\000a')||
'          bclose_header => FALSE'||unistr('\000a')||
'        );'||unistr('\000a')||
'        l_file_cached := TRUE;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        sys.htp.p(''Last-Modified : '' || l_file_rowtype.file_modified_since);'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      IF apex_util.public_check_authorization(''LOGGING_ENABLED'') THEN'||unistr('\000a')||
'        /* Log file download */'||unistr('\000a')||
'        blog_log.write_file_log(l';

s:=s||'_file_rowtype.file_id);'||unistr('\000a')||
'        blog_log.write_activity_log('||unistr('\000a')||
'          p_user_id       => p_user_id,'||unistr('\000a')||
'          p_session_id    => p_session_id,'||unistr('\000a')||
'          p_activity_type => ''DOWNLOAD'','||unistr('\000a')||
'          p_related_id    => l_file_rowtype.file_id'||unistr('\000a')||
'        );'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      sys.htp.p(''Content-Disposition: attachment; filename="'' || l_file_name || ''"'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF NOT l_file_cached THEN'||unistr('\000a')||
'      sys.';

s:=s||'htp.p(''Content-length: '' || l_file_rowtype.file_size);'||unistr('\000a')||
'      sys.wpg_docload.download_file(l_file_rowtype.blob_content);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    sys.owa_util.http_header_close;'||unistr('\000a')||
'    apex_application.stop_apex_engine;'||unistr('\000a')||
'  EXCEPTION WHEN '||unistr('\000a')||
'    NO_DATA_FOUND OR'||unistr('\000a')||
'    INVALID_NUMBER OR'||unistr('\000a')||
'    VALUE_ERROR'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    owa_util.status_line('||unistr('\000a')||
'      nstatus       => 404,'||unistr('\000a')||
'      creason       => ''Not Found'','||unistr('\000a')||
'      bclose_heade';

s:=s||'r => true'||unistr('\000a')||
'    );'||unistr('\000a')||
'  WHEN SESSION_NOT_VALID'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    owa_util.status_line('||unistr('\000a')||
'      nstatus       => 403,'||unistr('\000a')||
'      creason       => ''Forbidden'','||unistr('\000a')||
'      bclose_header => true'||unistr('\000a')||
'    );'||unistr('\000a')||
'  END download_file;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_email('||unistr('\000a')||
'    p_email     ';

s:=s||'IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_is_valid    BOOLEAN := TRUE;'||unistr('\000a')||
'    l_dot_pos     SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_at_pos      SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_str_length  SIMPLE_INTEGER := 0;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    IF p_email IS NOT NULL THEN'||unistr('\000a')||
'      l_dot_pos     := instr(p_email ,''.'');'||unistr('\000a')||
'      l_at_pos      := instr(p_email ,''@'');'||unistr('\000a')||
'      l_str_length  := LENGTH(p_email);'||unistr('\000a')||
'      IF ('||unistr('\000a')||
'        (l_dot_pos = 0)'||unistr('\000a')||
'        O';

s:=s||'R (l_at_pos = 0)'||unistr('\000a')||
'        --OR (l_dot_pos = l_at_pos - 1)'||unistr('\000a')||
'        OR (l_dot_pos = l_at_pos + 1)'||unistr('\000a')||
'        OR (l_at_pos = 1)'||unistr('\000a')||
'        OR (l_at_pos = l_str_length)'||unistr('\000a')||
'        OR (l_dot_pos = l_str_length)'||unistr('\000a')||
'        OR (l_str_length > 256)'||unistr('\000a')||
'      )'||unistr('\000a')||
'      THEN'||unistr('\000a')||
'        l_is_valid := FALSE;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      IF l_is_valid THEN'||unistr('\000a')||
'        l_is_valid := NOT instr(SUBSTR(p_email ,l_at_pos) ,''.'') = 0;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'  ';

s:=s||'  END IF;'||unistr('\000a')||
'    RETURN l_is_valid;'||unistr('\000a')||
'  END validate_email;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_UTIL";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE  "BLOG_PLUGIN" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'  g_formatted_comment V';

s:=s||'ARCHAR2(32700);'||unistr('\000a')||
'  g_question_answer   PLS_INTEGER;'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_comment_textarea('||unistr('\000a')||
'    p_item                IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               IN VARCHAR2,'||unistr('\000a')||
'    p_is_readonly         IN BOOLEAN,'||unistr('\000a')||
'    p_is_printer_friendly IN BOOLEAN'||unistr('\000a')||
'  ) RETURN ape';

s:=s||'x_plugin.t_page_item_render_result;'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_comment_textarea('||unistr('\000a')||
'    p_item   IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_validation_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCT';

s:=s||'ION feature_authorization ('||unistr('\000a')||
'    p_authorization in apex_plugin.t_authorization,'||unistr('\000a')||
'    p_plugin        in apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_authorization_exec_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_math_question_field('||unistr('\000a')||
'    p_item                IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              IN apex_plugin.t_plugin,';

s:=s||''||unistr('\000a')||
'    p_value               IN VARCHAR2,'||unistr('\000a')||
'    p_is_readonly         IN BOOLEAN,'||unistr('\000a')||
'    p_is_printer_friendly IN BOOLEAN'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION ajax_math_question_field('||unistr('\000a')||
'    p_item   in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin in apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_ajax';

s:=s||'_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_math_question_field('||unistr('\000a')||
'    p_item   IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_validation_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_modal_confir';

s:=s||'m('||unistr('\000a')||
'    p_dynamic_action IN apex_plugin.t_dynamic_action,'||unistr('\000a')||
'    p_plugin         IN apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_dynamic_action_render_result;'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_PLUGIN";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_PLUGIN" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-----------';

s:=s||'---------------------------------------------------------------------'||unistr('\000a')||
'-- Private variables, procedures and functions'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  g_whitelist_tags        CONSTANT VARCHAR2(200)  := ''<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>'';'||unistr('\000a')||
'  g_code_open          ';

s:=s||'   CONSTANT VARCHAR2(30)   := ''<code>'';'||unistr('\000a')||
'  g_code_close            CONSTANT VARCHAR2(30)   := ''</code>'';'||unistr('\000a')||
'  g_syntaxhighlight_open  CONSTANT VARCHAR2(100)  := ''<pre class="brush:plain" style="background-color:#eeeeee;padding:2px;">'';'||unistr('\000a')||
'  g_syntaxhighlight_close CONSTANT VARCHAR2(30)   := ''</pre>'';'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'------------------------';

s:=s||'--------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_comment('||unistr('\000a')||
'    p_comment         IN VARCHAR2,'||unistr('\000a')||
'    p_whitelist_tags  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_comment               VARCHAR2(32700);'||unistr('\000a')||
'    l_temp                  VARCHAR2(32700);'||unistr('\000a')||
'    l_len_s                 NUMBER := 0;'||unistr('\000a')||
'    l_len_e                 NUMBER := 0;'||unistr('\000a')||
'    l_count_open            SIMPLE_INTEGER := 0;'||unistr('\000a')||
' ';

s:=s||'   l_count_close           SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_start                 SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_end                   SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_comment_arr           apex_application_global.vc_arr2;'||unistr('\000a')||
'    l_code_arr              apex_application_global.vc_arr2;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_len_s := LENGTH(g_code_open);'||unistr('\000a')||
'    l_len_e := LENGTH(g_code_close);'||unistr('\000a')||
'    /* Change all hash marks so we can escape those';

s:=s||' later*/'||unistr('\000a')||
'    l_comment := REPLACE(p_comment, ''#'', ''$@#HASH#@$'');'||unistr('\000a')||
'    /* escape comment html */'||unistr('\000a')||
'    l_comment := APEX_ESCAPE.HTML_WHITELIST ('||unistr('\000a')||
'      p_html            => l_comment,'||unistr('\000a')||
'      p_whitelist_tags  => p_whitelist_tags'||unistr('\000a')||
'    );'||unistr('\000a')||
'    /* Escape hash to e.g. prevent APEX substitutions */'||unistr('\000a')||
'    l_comment := REPLACE(l_comment, ''$@#HASH#@$'', ''&#x23;'');'||unistr('\000a')||
'    /* check code tag count */'||unistr('\000a')||
'    l_count_open  := ';

s:=s||'regexp_count(l_comment, g_code_open);'||unistr('\000a')||
'    l_count_close := regexp_count(l_comment, g_code_close);'||unistr('\000a')||
'    /* Process code tags */'||unistr('\000a')||
'    IF l_count_open = l_count_close THEN'||unistr('\000a')||
'      /* Store text inside code tags to array while format rest of message*/'||unistr('\000a')||
'      FOR i IN 1 .. l_count_open'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_start       := INSTR(l_comment, g_code_open);'||unistr('\000a')||
'        l_end         := INSTR(l_comment, g_code_close);';

s:=s||''||unistr('\000a')||
'        l_code_arr(i) := g_syntaxhighlight_open'||unistr('\000a')||
'                      || SUBSTR(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)'||unistr('\000a')||
'                      || g_syntaxhighlight_close;'||unistr('\000a')||
'        l_comment     := SUBSTR(l_comment, 1, l_start -1)'||unistr('\000a')||
'                      || chr(10)'||unistr('\000a')||
'                      || ''$@#'' || i || ''#@$'''||unistr('\000a')||
'                      || chr(10)'||unistr('\000a')||
'                      || SUBSTR(l_comment,';

s:=s||' l_end + l_len_e);'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'      /* Format message */'||unistr('\000a')||
'      l_comment_arr := APEX_UTIL.STRING_TO_TABLE(l_comment, chr(10));'||unistr('\000a')||
'      l_comment := NULL;'||unistr('\000a')||
'      FOR i IN 1 .. l_comment_arr.COUNT'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        /* Remove empty lines and do not add extra tags for code */'||unistr('\000a')||
'        l_temp := TRIM(l_comment_arr(i));'||unistr('\000a')||
'        IF REGEXP_LIKE(l_temp, ''^\$\@\#[0-9]+\#\@\$$'') THEN'||unistr('\000a')||
'          l_comment :=';

s:=s||' l_comment || l_temp;'||unistr('\000a')||
'        ELSIF l_temp IS NOT NULL THEN'||unistr('\000a')||
'          l_comment := l_comment || ''<p>'' || l_temp || ''</p>'';'||unistr('\000a')||
'        END IF;'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'      /* insert code tags back to comment */'||unistr('\000a')||
'      FOR i IN 1 .. l_code_arr.COUNT'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_comment := REPLACE(l_comment, ''$@#'' || i || ''#@$'', l_code_arr(i));'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_comment;'||unistr('\000a')||
'  END format_comment;'||unistr('\000a')||
'---';

s:=s||'-----------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-- Global procedures and functions'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_comment_textarea('||unistr('\000a')||
'    p_it';

s:=s||'em                IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               IN VARCHAR2,'||unistr('\000a')||
'    p_is_readonly         IN BOOLEAN,'||unistr('\000a')||
'    p_is_printer_friendly IN BOOLEAN'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_render_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_name        VARCHAR2(30);'||unistr('\000a')||
'    l_code        VARCHAR2(30);'||unistr('\000a')||
'    l_bold        VARCHAR2(30);'||unistr('\000a')||
'    l_italics     VARCHAR2(30);'||unistr('\000a')||
'    l_u';

s:=s||'nderline   VARCHAR2(30);'||unistr('\000a')||
'    l_styles      VARCHAR2(255);'||unistr('\000a')||
'    l_formatting  VARCHAR2(10);'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');'||unistr('\000a')||
'    IF p_is_readonly OR p_is_printer_friendly THEN'||unistr('\000a')||
'      -- emit hidden textarea if necessary'||unistr('\000a')||
'      apex_plugin_util.print_hidden_if_readonly ('||unistr('\000a')||
'        p_item_name => p_item.name,'||unistr('\000a')||
'        p';

s:=s||'_value => p_value,'||unistr('\000a')||
'        p_is_readonly => p_is_readonly,'||unistr('\000a')||
'        p_is_printer_friendly => p_is_printer_friendly'||unistr('\000a')||
'      );'||unistr('\000a')||
'      -- emit display span with the value'||unistr('\000a')||
'      apex_plugin_util.print_display_only ('||unistr('\000a')||
'        p_item_name => p_item.name,'||unistr('\000a')||
'        p_display_value => p_value,'||unistr('\000a')||
'        p_show_line_breaks => false,'||unistr('\000a')||
'        p_escape => true,'||unistr('\000a')||
'        p_attributes => p_item.element_attributes'||unistr('\000a')||
'      ';

s:=s||');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      -- Because the page item saves state, we have to call get_input_name_for_page_item'||unistr('\000a')||
'      -- which generates the internal hidden p_arg_names textarea. It will also return the'||unistr('\000a')||
'      -- HTML textarea name which we have to use when we render the HTML input textarea.'||unistr('\000a')||
'      l_name := apex_plugin.get_input_name_for_page_item(false);'||unistr('\000a')||
'      '||unistr('\000a')||
'      l_code      := APEX_LANG.LANG(''Code'');'||unistr('\000a')||
'  ';

s:=s||'    l_bold      := APEX_LANG.LANG(''Bold'');'||unistr('\000a')||
'      l_italics   := APEX_LANG.LANG(''Italics'');'||unistr('\000a')||
'      l_underline := APEX_LANG.LANG(''Underline'');'||unistr('\000a')||
'      IF l_formatting = ''Y'' THEN'||unistr('\000a')||
'        sys.htp.p(''<ul class="format-btn">'');'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'          q''[<li><img onclick="addStyleTag(''b'','']'' || p_item.name || q''['');" ]'''||unistr('\000a')||
'          || ''alt="'' || l_bold  || ''" '''||unistr('\000a')||
'          || ''title="'' || l_bold  || ''" ''';

s:=s||''||unistr('\000a')||
'          || ''src="'' || p_plugin.file_prefix || q''[text-bold-20x22.png" /></li>]'''||unistr('\000a')||
'        );'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'          q''[<li><img onclick="addStyleTag(''i'','']'' || p_item.name || q''['');" ]'''||unistr('\000a')||
'          || ''alt="'' || l_italics ||''" '''||unistr('\000a')||
'          || ''title="'' || l_italics ||''" '''||unistr('\000a')||
'          || ''src="'' || p_plugin.file_prefix || q''[text-italics-20x22.png" /></li>]'''||unistr('\000a')||
'        );'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'        ';

s:=s||'  q''[<li><img onclick="addStyleTag(''u'','']'' || p_item.name || q''['');" ]'''||unistr('\000a')||
'          || ''alt="'' || l_underline || ''" '''||unistr('\000a')||
'          || ''title="'' || l_underline || ''" '''||unistr('\000a')||
'          || ''src="'' || p_plugin.file_prefix || q''[text-underline-20x22.png" /></li>]'''||unistr('\000a')||
'        );'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'          q''[<li><img onclick="addStyleTag(''code'','']'' || p_item.name || q''['');" ]'''||unistr('\000a')||
'          || ''alt="'' || l_code  || '' "';

s:=s||' '''||unistr('\000a')||
'          || ''title="'' || l_code  || ''" '''||unistr('\000a')||
'          || ''src="'' || p_plugin.file_prefix || q''[code-20x22.png" /></li>]'''||unistr('\000a')||
'        );'||unistr('\000a')||
'        sys.htp.p(''</ul>'');'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'          ''<div>'''||unistr('\000a')||
'          || APEX_ESCAPE.HTML (APEX_LANG.MESSAGE(''MSG_ALLOWED_HTML_TAGS''))'||unistr('\000a')||
'          || ''</div>'''||unistr('\000a')||
'        );'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      sys.htp.prn(''<textarea '''||unistr('\000a')||
'        || apex_plugin_util.get_element_attribute';

s:=s||'s(p_item, l_name, ''textarea'')'||unistr('\000a')||
'        || ''cols="'' || p_item.element_width ||''" '''||unistr('\000a')||
'        || ''rows="'' || p_item.element_height ||''" '''||unistr('\000a')||
'        || ''maxlength="'' || p_item.element_max_length || ''">'''||unistr('\000a')||
'      );'||unistr('\000a')||
'      apex_plugin_util.print_escaped_value(p_value);'||unistr('\000a')||
'      sys.htp.p(''</textarea>'');'||unistr('\000a')||
'      -- Tell APEX that this textarea is navigable'||unistr('\000a')||
'      l_result.is_navigable := true;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN ';

s:=s||'l_result;'||unistr('\000a')||
'  END render_comment_textarea;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_comment_textarea('||unistr('\000a')||
'    p_item   IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_validation_result'||unistr('\000a')||
'  ';

s:=s||'AS'||unistr('\000a')||
'    l_formatting  VARCHAR2(10);'||unistr('\000a')||
'    l_tmp_item    VARCHAR2(30);'||unistr('\000a')||
'    l_comment     XMLTYPE;'||unistr('\000a')||
'    l_is_valid    BOOLEAN;'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_validation_result;'||unistr('\000a')||
'    xml_parse_err EXCEPTION;'||unistr('\000a')||
'    PRAGMA EXCEPTION_INIT (xml_parse_err , -31011);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');'||unistr('\000a')||
'    l_tmp_item := p_item.attribute_02;'||unistr('\000a')||
'    blog_plugin.g_formatted_commen';

s:=s||'t := p_value;'||unistr('\000a')||
'    /* Remove some ascii codes */'||unistr('\000a')||
'    FOR i IN 0 .. 31'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF i != 10 THEN'||unistr('\000a')||
'        blog_plugin.g_formatted_comment := TRIM(REPLACE(blog_plugin.g_formatted_comment, chr(i)));'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    IF blog_plugin.g_formatted_comment IS NULL THEN'||unistr('\000a')||
'      RETURN NULL;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF LENGTH(blog_plugin.g_formatted_comment) >= p_item.element_max_length THEN'||unistr('\000a')||
'      l_i';

s:=s||'s_valid := FALSE;'||unistr('\000a')||
'      l_result.message := APEX_LANG.MESSAGE(''VALIDATION_COMMENT_LENGTH'', p_item.plain_label, p_item.element_max_length);'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_is_valid := TRUE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_is_valid THEN'||unistr('\000a')||
'      /* Format value */'||unistr('\000a')||
'      IF l_formatting = ''Y'' THEN'||unistr('\000a')||
'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, g_whitelist_tags);'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'';

s:=s||'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, NULL);'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      /* Validate value html tags */'||unistr('\000a')||
'      BEGIN'||unistr('\000a')||
'        l_comment := xmlType.createXML('||unistr('\000a')||
'            ''<root><row>'' '||unistr('\000a')||
'          || blog_plugin.g_formatted_comment'||unistr('\000a')||
'          || ''</row></root>'''||unistr('\000a')||
'        );'||unistr('\000a')||
'      EXCEPTION'||unistr('\000a')||
'      WHEN xml_parse_err THEN'||unistr('\000a')||
'        l_is_valid := FALSE;'||unistr('\000a')||
'';

s:=s||'        APEX_DEBUG.ERROR(''%s : %s'', dbms_utility.format_error_backtrace, sqlerrm);'||unistr('\000a')||
'      WHEN OTHERS THEN'||unistr('\000a')||
'        APEX_DEBUG.ERROR(''%s : %s'', dbms_utility.format_error_backtrace, sqlerrm);'||unistr('\000a')||
'        l_is_valid := FALSE;'||unistr('\000a')||
'      END;'||unistr('\000a')||
'      IF NOT l_is_valid THEN'||unistr('\000a')||
'        l_is_valid := FALSE;'||unistr('\000a')||
'        l_result.message := APEX_LANG.MESSAGE(''VALIDATION_COMMENT_FORMAT'', p_item.plain_label);'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'   ';

s:=s||' END IF;'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END validate_comment_textarea;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION feature_authorization ('||unistr('\000a')||
'    p_authorization in apex_plugin.t_authorization,'||unistr('\000a')||
'    p_plugin        in apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_authorization_exec_';

s:=s||'result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_count         NUMBER;'||unistr('\000a')||
'    l_feature_name  VARCHAR(100);'||unistr('\000a')||
'    l_result        apex_plugin.t_authorization_exec_result; -- result object to return'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_feature_name := p_authorization.attribute_01;'||unistr('\000a')||
'    SELECT COUNT(1)'||unistr('\000a')||
'    INTO l_count'||unistr('\000a')||
'    FROM blog_param c'||unistr('\000a')||
'    LEFT JOIN blog_param p ON c.param_parent = p.param_id'||unistr('\000a')||
'    WHERE c.param_id = l_feature_name'||unistr('\000a')||
'      AND c.param_value';

s:=s||' = ''Y'' '||unistr('\000a')||
'      AND CASE WHEN p.param_type = ''YESNO'''||unistr('\000a')||
'      THEN p.param_value ELSE ''Y'' END = ''Y'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    l_result.is_authorized := l_count > 0;'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'END feature_authorization;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_math_question_field('||unistr('\000a')||
'    p_i';

s:=s||'tem                IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin              IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value               IN VARCHAR2,'||unistr('\000a')||
'    p_is_readonly         IN BOOLEAN,'||unistr('\000a')||
'    p_is_printer_friendly IN BOOLEAN'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_render_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_name        VARCHAR2(30);'||unistr('\000a')||
'    l_answer_item VARCHAR2(30);'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l';

s:=s||'_name        := apex_plugin.get_input_name_for_page_item(false);'||unistr('\000a')||
'    l_answer_item := p_item.attribute_01;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF p_is_readonly OR p_is_printer_friendly THEN'||unistr('\000a')||
'      -- emit hidden textarea if necessary'||unistr('\000a')||
'      apex_plugin_util.print_hidden_if_readonly ('||unistr('\000a')||
'        p_item_name => p_item.name,'||unistr('\000a')||
'        p_value => p_value,'||unistr('\000a')||
'        p_is_readonly => p_is_readonly,'||unistr('\000a')||
'        p_is_printer_friendly => p_is_pr';

s:=s||'inter_friendly'||unistr('\000a')||
'      );'||unistr('\000a')||
'      -- emit display span with the value'||unistr('\000a')||
'      apex_plugin_util.print_display_only ('||unistr('\000a')||
'        p_item_name => p_item.name,'||unistr('\000a')||
'        p_display_value => p_value,'||unistr('\000a')||
'        p_show_line_breaks => false,'||unistr('\000a')||
'        p_escape => true,'||unistr('\000a')||
'        p_attributes => p_item.element_attributes'||unistr('\000a')||
'      );'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      sys.htp.p(''<input type="text" '''||unistr('\000a')||
'        || ''size="'' || p_item.element_width ||''" ';

s:=s||''''||unistr('\000a')||
'        || ''maxlength="'' || p_item.element_max_length || ''" '''||unistr('\000a')||
'        || apex_plugin_util.get_element_attributes(p_item, l_name, ''text_field'')'||unistr('\000a')||
'        || ''value="" />'''||unistr('\000a')||
'      );'||unistr('\000a')||
'      apex_javascript.add_onload_code ('||unistr('\000a')||
'        p_code => ''apex.server.plugin("'' || apex_plugin.get_ajax_identifier || ''",{},{'''||unistr('\000a')||
'        || ''dataType:"html",'''||unistr('\000a')||
'        || ''success:function(data){'''||unistr('\000a')||
'        || ''$("#'' || p_ite';

s:=s||'m.name || ''").before(data).siblings("label,br").remove()}'''||unistr('\000a')||
'        || ''});'''||unistr('\000a')||
'      );'||unistr('\000a')||
'      -- Tell APEX that this textarea is navigable'||unistr('\000a')||
'      l_result.is_navigable := true;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END render_math_question_field;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-------------------------------------------------------------------------------';

s:=s||'-'||unistr('\000a')||
'  FUNCTION ajax_math_question_field('||unistr('\000a')||
'    p_item   in apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin in apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_ajax_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_tmp         VARCHAR2(255);'||unistr('\000a')||
'    l_answer_item VARCHAR2(30);'||unistr('\000a')||
'    l_min_1       PLS_INTEGER := 1;'||unistr('\000a')||
'    l_max_1       PLS_INTEGER := 1;'||unistr('\000a')||
'    l_min_2       PLS_INTEGER := 1;'||unistr('\000a')||
'    l_max_2       PLS_INTEGER := 1;'||unistr('\000a')||
'    l_arr         APEX';

s:=s||'_APPLICATION_GLOBAL.vc_arr2;'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_ajax_result;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_answer_item := p_item.attribute_01;'||unistr('\000a')||
'    l_min_1       := p_item.attribute_02;'||unistr('\000a')||
'    l_max_1       := p_item.attribute_03;'||unistr('\000a')||
'    l_min_2       := p_item.attribute_04;'||unistr('\000a')||
'    l_max_2       := p_item.attribute_05;'||unistr('\000a')||
'    l_arr(1)      := ROUND(DBMS_RANDOM.VALUE(l_min_1, l_max_1));'||unistr('\000a')||
'    l_arr(1)      := ROUND(DBMS_R';

s:=s||'ANDOM.VALUE(l_min_2, l_max_2));'||unistr('\000a')||
'    FOR n IN 1 .. 2'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      l_arr(n) := ROUND(DBMS_RANDOM.VALUE(1, 40));'||unistr('\000a')||
'      FOR i IN 1 .. LENGTH(l_arr(n))'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_tmp := l_tmp || ''&#'' || ASCII(SUBSTR(l_arr(n), i, 1));'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'      IF n = 1 THEN'||unistr('\000a')||
'        l_tmp := l_tmp || ''&nbsp;&#'' || ASCII(''+'') || ''&nbsp;'';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    -- Write header for the output.'||unistr('\000a')||
'    sys.owa';

s:=s||'_util.mime_header(''text/html'', false);'||unistr('\000a')||
'    sys.htp.p(''Cache-Control: no-cache'');'||unistr('\000a')||
'    sys.htp.p(''Pragma: no-cache'');'||unistr('\000a')||
'    --sys.htp.p(''X-Robots-Tag    noindex,follow'');'||unistr('\000a')||
'    sys.owa_util.http_header_close;'||unistr('\000a')||
'    sys.htp.p(''<p>'' || APEX_LANG.MESSAGE(''MSG_MATH_QUESTION'', ''</p><span>'' ||l_tmp || ''&nbsp;&#'' || ASCII(''='') || ''</span>''));'||unistr('\000a')||
'    /* set correct answer to item session state */'||unistr('\000a')||
'    apex_util.set_s';

s:=s||'ession_state(l_answer_item, TO_NUMBER(l_arr(1)) + TO_NUMBER(l_arr(2)));'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  EXCEPTION WHEN OTHERS'||unistr('\000a')||
'  THEN'||unistr('\000a')||
'    sys.htp.p(wwv_flow_lang.system_message(''ajax_server_error''));'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END ajax_math_question_field;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------------------------------------------------------';

s:=s||'----'||unistr('\000a')||
'  FUNCTION validate_math_question_field('||unistr('\000a')||
'    p_item   IN apex_plugin.t_page_item,'||unistr('\000a')||
'    p_plugin IN apex_plugin.t_plugin,'||unistr('\000a')||
'    p_value  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN apex_plugin.t_page_item_validation_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_answer_item VARCHAR2(30);'||unistr('\000a')||
'    l_value       SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_answer      SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_is_valid    BOOLEAN;'||unistr('\000a')||
'    l_result      apex_plugin.t_page_item_validation_re';

s:=s||'sult;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_answer_item := p_item.attribute_01;'||unistr('\000a')||
'    IF p_value IS NULL THEN'||unistr('\000a')||
'      RETURN NULL;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      l_is_valid := TO_NUMBER(p_value) = nv(l_answer_item);'||unistr('\000a')||
'    EXCEPTION WHEN '||unistr('\000a')||
'    VALUE_ERROR OR '||unistr('\000a')||
'    INVALID_NUMBER'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      l_is_valid := FALSE;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    IF NOT l_is_valid THEN'||unistr('\000a')||
'      l_result.message := APEX_LANG.MESSAGE(''VALIDATION_MATH_QUESTION'', p_item.plain';

s:=s||'_label);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END validate_math_question_field;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION render_modal_confirm('||unistr('\000a')||
'    p_dynamic_action IN apex_plugin.t_dynamic_action,'||unistr('\000a')||
'    p_plugin         IN apex_plugin.t_plugin'||unistr('\000a')||
'  ) RETURN apex_plugin.t_dyn';

s:=s||'amic_action_render_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_result apex_plugin.t_dynamic_action_render_result;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    apex_javascript.add_inline_code ('||unistr('\000a')||
'      p_code => ''function net_webhop_dbswh_modal_confirm(){'''||unistr('\000a')||
'        || ''this.affectedElements.data("request",this.triggeringElement.id).dialog({'''||unistr('\000a')||
'        || ''modal:true,'''||unistr('\000a')||
'        || ''buttons:{'''||unistr('\000a')||
'        || ''"'' || APEX_LANG.LANG(''OK'') || ''":function(){$(this).dialog(';

s:=s||'"close");apex.submit($(this).data("request"));},'''||unistr('\000a')||
'        || ''"'' || APEX_LANG.LANG(''Cancel'') || ''":function(){$(this).dialog("close")}'''||unistr('\000a')||
'        || ''}})}'''||unistr('\000a')||
'      ,p_key  => ''net.webhop.dbswh.modal_confirm'''||unistr('\000a')||
'    );'||unistr('\000a')||
'    l_result.javascript_function := ''net_webhop_dbswh_modal_confirm'';'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END render_modal_confirm;'||unistr('\000a')||
'----------------------------------------------------------------------';

s:=s||'----------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_PLUGIN";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE  "BLOG_LOG" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION apex_error_handler('||unistr('\000a')||
'    p_error IN apex_error.t_error'||unistr('\000a')||
'  ) RETURN apex_error.t_error_result;'||unistr('\000a')||
'----------------------------------------------';

s:=s||'----------------------------------'||unistr('\000a')||
'  PROCEDURE write_activity_log('||unistr('\000a')||
'    p_user_id         IN NUMBER,'||unistr('\000a')||
'    p_activity_type   IN VARCHAR2,'||unistr('\000a')||
'    p_session_id      IN NUMBER,'||unistr('\000a')||
'    p_related_id      IN NUMBER DEFAULT 0,'||unistr('\000a')||
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_user_agent      IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_referer         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_search_type     IN VARCHAR2 DEFAULT NUL';

s:=s||'L,'||unistr('\000a')||
'    p_search          IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_country_code    IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_region          IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_city            IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_latitude        IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_longitude       IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_additional_info IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  );'||unistr('\000a')||
'-------------------------------------------------------------';

s:=s||'-------------------'||unistr('\000a')||
'  PROCEDURE write_article_log('||unistr('\000a')||
'    p_article_id  IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rate_article('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_article_rate    IN OUT NOCOPY NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_category_log('||unistr('\000a')||
'    p_category_';

s:=s||'id  IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_file_log('||unistr('\000a')||
'    p_file_id  IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_LOG";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_LOG" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------';

s:=s||'-----------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION apex_error_handler('||unistr('\000a')||
'    p_error IN apex_error.t_error'||unistr('\000a')||
'  ) RETURN apex_error.t_error_result'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_result          apex_error.t_error_result;'||unistr('\000a')||
'    l_error           apex_error.t_error;'||unistr('\000a')||
'    l_reference_id    PLS_INTEGER;'||unistr('\000a')||
'    l_constraint_name VARCHAR2(255);'||unistr('\000a')||
'    l_err_msg         VARCHAR2(32700);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_result := a';

s:=s||'pex_error.init_error_result ( p_error => p_error );'||unistr('\000a')||
'    -- If it''s an internal error raised by APEX, like an invalid statement or'||unistr('\000a')||
'    -- code which can''t be executed, the error text might contain security sensitive'||unistr('\000a')||
'    -- information. To avoid this security problem we can rewrite the error to'||unistr('\000a')||
'    -- a generic error message and log the original error message for further'||unistr('\000a')||
'    -- investigation by the ';

s:=s||'help desk.'||unistr('\000a')||
'    IF p_error.is_internal_error THEN'||unistr('\000a')||
'      -- Access Denied errors raised by application or page authorization should'||unistr('\000a')||
'      -- still show up with the original error message'||unistr('\000a')||
'      IF NOT p_error.apex_error_code LIKE ''APEX.SESSION_STATE.%'''||unistr('\000a')||
'      AND NOT p_error.apex_error_code = ''APEX.AUTHORIZATION.ACCESS_DENIED'''||unistr('\000a')||
'      AND NOT p_error.apex_error_code = ''APEX.PAGE.DUPLICATE_SUBMIT'''||unistr('\000a')||
'      ';

s:=s||'AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'''||unistr('\000a')||
'      AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'''||unistr('\000a')||
'      THEN'||unistr('\000a')||
'        -- log error for example with an autonomous transaction and return'||unistr('\000a')||
'        -- l_reference_id as reference#'||unistr('\000a')||
'        -- l_reference_id := log_error ('||unistr('\000a')||
'        --                       p_error => p_error );'||unistr('\000a')||
'        --'||unistr('\000a')||
'  ';

s:=s||'      -- Change the message to the generic error message which doesn''t expose'||unistr('\000a')||
'        -- any sensitive information.'||unistr('\000a')||
'        -- log error to application debug information'||unistr('\000a')||
'        APEX_DEBUG.ERROR('||unistr('\000a')||
'          ''Error handler: %s %s %s'','||unistr('\000a')||
'           p_error.apex_error_code,'||unistr('\000a')||
'           l_result.message,'||unistr('\000a')||
'           l_result.additional_info'||unistr('\000a')||
'        );'||unistr('\000a')||
'        l_result.message := APEX_LANG.MESSAGE(''GENERAL_';

s:=s||'ERROR'');'||unistr('\000a')||
'        l_result.additional_info := NULL;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      /*'||unistr('\000a')||
'      -- Show the error as inline error'||unistr('\000a')||
'      l_result.display_location :='||unistr('\000a')||
'      CASE'||unistr('\000a')||
'      WHEN l_result.display_location = apex_error.c_on_error_page THEN'||unistr('\000a')||
'        apex_error.c_inline_in_notification'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        l_result.display_location'||unistr('\000a')||
'      END;'||unistr('\000a')||
'      */'||unistr('\000a')||
'      -- If it''s a constraint violation like'||unistr('\000a')||
'      ';

wwv_flow_api.append_to_install_script(
  p_id => 11220716262817091 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||'--'||unistr('\000a')||
'      --   -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated'||unistr('\000a')||
'      --   -) : transaction rolled back (-> can hide a deferred constraint)'||unistr('\000a')||
'      --   -) : check constraint violated'||unistr('\000a')||
'      --   -) : integrity constraint violated - parent key not found'||unistr('\000a')||
'      --   -) : integrity constraint violated - child record found'||unistr('\000a')||
'      --'||unistr('\000a')||
'      -- we try to get a friendly error messag';

s:=s||'e from our constraint lookup configuration.'||unistr('\000a')||
'      -- If we don''t find the constraint in our lookup table we fallback to'||unistr('\000a')||
'      -- the original ORA error message.'||unistr('\000a')||
'      IF p_error.ora_sqlcode IN (-1, -2091, -2290, -2291, -2292) THEN'||unistr('\000a')||
'        l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );'||unistr('\000a')||
'        l_err_msg := APEX_LANG.MESSAGE(l_constraint_name);'||unistr('\000a')||
'        -- not every c';

s:=s||'onstraint has to be in our lookup table'||unistr('\000a')||
'        IF NOT l_err_msg = l_constraint_name THEN'||unistr('\000a')||
'          l_result.message := l_err_msg;'||unistr('\000a')||
'        END IF;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, ''...'')'||unistr('\000a')||
'      -- in a table trigger or in a PL/SQL package called by a process and we'||unistr('\000a')||
'      -- haven''t found the error in our lookup table, then we just';

s:=s||' want to see'||unistr('\000a')||
'      -- the actual error text and not the full error stack with all the ORA error numbers.'||unistr('\000a')||
'      IF p_error.ora_sqlcode IS NOT NULL AND l_result.message = p_error.message THEN'||unistr('\000a')||
'        l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      -- If no associated page item/tabular form column has been set, we can use'||unistr('\000a')||
'      -- apex_error.auto_se';

s:=s||'t_associated_item to automatically guess the affected'||unistr('\000a')||
'      -- error field by examine the ORA error for constraint names or column names.'||unistr('\000a')||
'      IF l_result.page_item_name IS NULL AND l_result.column_alias IS NULL THEN'||unistr('\000a')||
'        apex_error.auto_set_associated_item ( p_error => p_error, p_error_result => l_result );'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END apex_error_handler;'||unistr('\000a')||
'-------------';

s:=s||'-------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_activity_log('||unistr('\000a')||
'    p_user_id         IN NUMBER,'||unistr('\000a')||
'    p_activity_type   IN VARCHAR2,'||unistr('\000a')||
'    p_session_id      IN NUMBER,'||unistr('\000a')||
'    p_related_id      IN NUMBER DEFAULT 0,'||unistr('\000a')||
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_user_agent      IN VA';

s:=s||'RCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_referer         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_search_type     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_search          IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_country_code    IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_region          IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_city            IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_latitude        IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_longitude       IN NUMBER DEFAULT NULL,';

s:=s||''||unistr('\000a')||
'    p_additional_info IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    PRAGMA AUTONOMOUS_TRANSACTION;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    INSERT /*+ append */ INTO blog_activity_log ('||unistr('\000a')||
'      ACTIVITY_TYPE,'||unistr('\000a')||
'      APEX_SESSION_ID,'||unistr('\000a')||
'      IP_ADDRESS,'||unistr('\000a')||
'      RELATED_ID,'||unistr('\000a')||
'      USER_ID,'||unistr('\000a')||
'      LATITUDE,'||unistr('\000a')||
'      LONGITUDE,'||unistr('\000a')||
'      COUNTRY_CODE,'||unistr('\000a')||
'      COUNTRY_REGION,'||unistr('\000a')||
'      COUNTRY_CITY,'||unistr('\000a')||
'      HTTP_USER_AGENT,'||unistr('\000a')||
'      HTTP_REFERER,'||unistr('\000a')||
'      SEARCH_TYPE';

s:=s||','||unistr('\000a')||
'      SEARCH_CRITERIA,'||unistr('\000a')||
'      ADDITIONAL_INFO'||unistr('\000a')||
'    ) VALUES ('||unistr('\000a')||
'      p_activity_type,'||unistr('\000a')||
'      p_session_id,'||unistr('\000a')||
'      p_ip_address,'||unistr('\000a')||
'      p_related_id,'||unistr('\000a')||
'      p_user_id,'||unistr('\000a')||
'      p_latitude,'||unistr('\000a')||
'      p_longitude,'||unistr('\000a')||
'      p_country_code,'||unistr('\000a')||
'      p_region,'||unistr('\000a')||
'      p_city,'||unistr('\000a')||
'      p_user_agent,'||unistr('\000a')||
'      p_referer,'||unistr('\000a')||
'      p_search_type,'||unistr('\000a')||
'      p_search,'||unistr('\000a')||
'      p_additional_info'||unistr('\000a')||
'    );'||unistr('\000a')||
'    COMMIT;'||unistr('\000a')||
'  END write_activity_log;'||unistr('\000a')||
'------';

s:=s||'--------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_article_log('||unistr('\000a')||
'    p_article_id  IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    PRAGMA AUTONOMOUS_TRANSACTION;'||unistr('\000a')||
'    INSERT_NULL_VALUE EXCEPTION;'||unistr('\000a')||
'    PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    MERGE INTO blog_article_log a'||unistr('\000a')||
'    USING (SE';

s:=s||'LECT p_article_id AS article_id FROM DUAL) b'||unistr('\000a')||
'    ON (a.article_id = b.article_id)'||unistr('\000a')||
'    WHEN MATCHED THEN'||unistr('\000a')||
'    UPDATE SET a.view_count = a.view_count + 1,'||unistr('\000a')||
'      a.last_view = SYSDATE'||unistr('\000a')||
'    WHEN NOT MATCHED THEN'||unistr('\000a')||
'    INSERT (article_id, view_count, last_view)'||unistr('\000a')||
'    VALUES (b.article_id, 1, SYSDATE)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    COMMIT;'||unistr('\000a')||
'  EXCEPTION WHEN INSERT_NULL_VALUE THEN'||unistr('\000a')||
'    NULL;'||unistr('\000a')||
'  END write_article_log;'||unistr('\000a')||
'----------------';

s:=s||'----------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rate_article('||unistr('\000a')||
'    p_article_id    IN NUMBER,'||unistr('\000a')||
'    p_article_rate  IN OUT NOCOPY NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    UPDATE blog_article_log'||unistr('\000a')||
'      SET article_rate      = (article_rate * rate_click + p_article_rate) / (rate_click + 1),'||unistr('\000a')||
'          articl';

s:=s||'e_rate_int  = ROUND( (article_rate * rate_click + p_article_rate) / (rate_click + 1) ),'||unistr('\000a')||
'          rate_click        = rate_click + 1,'||unistr('\000a')||
'          last_rate         = SYSDATE'||unistr('\000a')||
'    WHERE article_id = p_article_id'||unistr('\000a')||
'    RETURNING article_rate_int INTO p_article_rate'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END rate_article;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------------';

s:=s||'----------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_category_log('||unistr('\000a')||
'    p_category_id  IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    PRAGMA AUTONOMOUS_TRANSACTION;'||unistr('\000a')||
'    INSERT_NULL_VALUE EXCEPTION;'||unistr('\000a')||
'    PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    MERGE INTO blog_category_log a'||unistr('\000a')||
'    USING (SELECT p_category_id AS category_id FROM DUAL) b'||unistr('\000a')||
'    ON (a.category_id = b.category_id)'||unistr('\000a')||
'    WHEN MATCHED THE';

s:=s||'N'||unistr('\000a')||
'    UPDATE SET a.view_count = a.view_count + 1,'||unistr('\000a')||
'      a.last_view = SYSDATE'||unistr('\000a')||
'    WHEN NOT MATCHED THEN'||unistr('\000a')||
'    INSERT (category_id, view_count, last_view)'||unistr('\000a')||
'    VALUES (b.category_id, 1, SYSDATE)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    COMMIT;'||unistr('\000a')||
'  EXCEPTION WHEN INSERT_NULL_VALUE THEN'||unistr('\000a')||
'    NULL;'||unistr('\000a')||
'  END write_category_log;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------------';

s:=s||'----------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_file_log('||unistr('\000a')||
'    p_file_id  IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    PRAGMA AUTONOMOUS_TRANSACTION;'||unistr('\000a')||
'    INSERT_NULL_VALUE EXCEPTION;'||unistr('\000a')||
'    PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    MERGE INTO blog_file_log a'||unistr('\000a')||
'    USING (SELECT p_file_id AS file_id FROM DUAL) b'||unistr('\000a')||
'    ON (a.file_id = b.file_id)'||unistr('\000a')||
'    WHEN MATCHED THEN'||unistr('\000a')||
'    UPDATE SET a.click_cou';

s:=s||'nt = a.click_count + 1,'||unistr('\000a')||
'      last_click = SYSDATE'||unistr('\000a')||
'    WHEN NOT MATCHED THEN'||unistr('\000a')||
'    INSERT (file_id, click_count, last_click)'||unistr('\000a')||
'    VALUES (b.file_id, 1, SYSDATE)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    COMMIT;'||unistr('\000a')||
'  EXCEPTION WHEN INSERT_NULL_VALUE THEN'||unistr('\000a')||
'    NULL;'||unistr('\000a')||
'  END write_file_log;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-----------------------------------------------------------------------';

s:=s||'---------'||unistr('\000a')||
'END "BLOG_LOG";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE  "BLOG_JOB" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'-------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rotate_log;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_country;'||unistr('\000a')||
'--------------------';

s:=s||'------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_activity_logs;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE purge_preview;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rotate_log_job('||unistr('\000a')||
'    p_interval IN PLS_INTEGER DEFAULT NULL'||unistr('\000a')||
'  );'||unistr('\000a')||
'----------------------------------------';

s:=s||'----------------------------------------'||unistr('\000a')||
'  PROCEDURE update_country_job ('||unistr('\000a')||
'    p_drop_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_activity_logs_job ('||unistr('\000a')||
'    p_drop_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE purge_preview_job('||unistr('\000a')||
'    p_dr';

s:=s||'op_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_JOB";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_JOB" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-- Private variables, procedures and functions'||unistr('\000a')||
'----------';

s:=s||'----------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE get_host_ip_info ('||unistr('\000a')||
'    p_ip            IN VARCHAR2,'||unistr('\000a')||
'    p_city          OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_country_code  OUT NOCOPY VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_clob  CLOB;'||unistr('\000a')||
'    l_url   CONSTANT VARCHAR2(32000) := ''http://api.hostip.info/'';'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
' ';

s:=s||'   l_clob := apex_web_service.make_rest_request('||unistr('\000a')||
'                p_url         => l_url,'||unistr('\000a')||
'                p_http_method => ''GET'','||unistr('\000a')||
'                p_parm_name   => apex_util.string_to_table(''ip''),'||unistr('\000a')||
'                p_parm_value  => apex_util.string_to_table(p_ip)'||unistr('\000a')||
'              );'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT EXTRACTVALUE(VALUE(t), ''//gml:name'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS city,'||unistr('\000a')||
'        EXT';

s:=s||'RACTVALUE(VALUE(t), ''//countryAbbrev'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS countryAbbrev'||unistr('\000a')||
'      INTO p_city, p_country_code'||unistr('\000a')||
'      FROM TABLE('||unistr('\000a')||
'        XMLSEQUENCE('||unistr('\000a')||
'          XMLTYPE.CREATEXML(l_clob).EXTRACT('||unistr('\000a')||
'            ''HostipLookupResultSet/gml:featureMember/Hostip'','||unistr('\000a')||
'            ''xmlns:gml="http://www.opengis.net/gml"'''||unistr('\000a')||
'          )'||unistr('\000a')||
'        )'||unistr('\000a')||
'      ) t;'||unistr('\000a')||
'    EXCEPTION WHEN NO_DATA_FOUND TH';

s:=s||'EN'||unistr('\000a')||
'      p_city          := NULL;'||unistr('\000a')||
'      p_country_code  := NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
' '||unistr('\000a')||
'  END get_host_ip_info;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
''||unistr('\000a')||
'-- Global functions and procedures'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------';

s:=s||'-----------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rotate_log'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_new_tbl VARCHAR2(4000);'||unistr('\000a')||
'    l_log_tbl CHAR(1);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'  '||unistr('\000a')||
'    SELECT SUBSTR(table_name, -1) AS log_tbl'||unistr('\000a')||
'    INTO l_log_tbl'||unistr('\000a')||
'    FROM user_synonyms'||unistr('\000a')||
'    WHERE synonym_name = ''BLOG_ACTIVITY_LOG'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF l_log_tbl = ''1'' THEN'||unistr('\000a')||
'      l_new_tbl := ''2'';'||unistr('\000a')||
'    ELSIF l_log_tbl = ''2'' THEN'||unistr('\000a')||
'      l_new_tbl := ''1''';

s:=s||';'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      raise_application_error(-20001, ''Invalid log table.'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    '||unistr('\000a')||
'    EXECUTE IMMEDIATE ''TRUNCATE TABLE BLOG_ACTIVITY_LOG'' || l_new_tbl;'||unistr('\000a')||
'    '||unistr('\000a')||
'    EXECUTE IMMEDIATE ''CREATE OR REPLACE SYNONYM BLOG_ACTIVITY_LOG FOR BLOG_ACTIVITY_LOG'' || l_new_tbl;'||unistr('\000a')||
'  '||unistr('\000a')||
'  END rotate_log;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-----------------------------';

s:=s||'---------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_country'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_city    VARCHAR2(2000);'||unistr('\000a')||
'    l_code    VARCHAR2(2000);'||unistr('\000a')||
'    l_count   NUMBER;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'  '||unistr('\000a')||
'    /* Get distinct ip addreses where is no country information. */'||unistr('\000a')||
'    FOR c1 IN('||unistr('\000a')||
'      SELECT DISTINCT ip_address'||unistr('\000a')||
'      FROM blog_activity_log'||unistr('\000a')||
'      WHERE activity_type = ''NEW_SESSION'''||unistr('\000a')||
'      AND country_code IS NULL'||unistr('\000a')||
'    )';

s:=s||' LOOP'||unistr('\000a')||
'    '||unistr('\000a')||
'      l_count := 0;'||unistr('\000a')||
'      l_city  := NULL;'||unistr('\000a')||
'      l_code  := NULL;'||unistr('\000a')||
'      '||unistr('\000a')||
'      /* Check from logs if ip address already have country information from previous visit */'||unistr('\000a')||
'      BEGIN'||unistr('\000a')||
'        WITH qry AS ('||unistr('\000a')||
'          SELECT'||unistr('\000a')||
'            ROW_NUMBER() OVER(ORDER BY activity_date DESC) AS rn,'||unistr('\000a')||
'            country_city,'||unistr('\000a')||
'            country_code'||unistr('\000a')||
'          FROM blog_v$activity_log'||unistr('\000a')||
'          WHERE ac';

s:=s||'tivity_type = ''NEW_SESSION'''||unistr('\000a')||
'          AND ip_address = c1.ip_address'||unistr('\000a')||
'          AND country_code IS NOT NULL'||unistr('\000a')||
'        )'||unistr('\000a')||
'        SELECT'||unistr('\000a')||
'          country_city,'||unistr('\000a')||
'          country_code'||unistr('\000a')||
'        INTO l_city, l_code'||unistr('\000a')||
'        FROM qry'||unistr('\000a')||
'        WHERE rn = 1'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      /* If no previous visit get country info from hostip.info */'||unistr('\000a')||
'      EXCEPTION WHEN NO_DATA_FOUND THEN    '||unistr('\000a')||
'        get_host_ip_info('||unistr('\000a')||
'       ';

s:=s||'   p_ip            => c1.ip_address,'||unistr('\000a')||
'          p_city          => l_city,'||unistr('\000a')||
'          p_country_code  => l_code'||unistr('\000a')||
'        );'||unistr('\000a')||
'      END;'||unistr('\000a')||
'      '||unistr('\000a')||
'      l_city  := COALESCE(l_city, ''(unknown city)'');'||unistr('\000a')||
'      l_code  := COALESCE(l_code, ''XX'');'||unistr('\000a')||
'      '||unistr('\000a')||
'      /* Update activity log if country code exists in BLOG_COUNTRY table */'||unistr('\000a')||
'      UPDATE blog_activity_log'||unistr('\000a')||
'      SET country_city  = l_city,'||unistr('\000a')||
'        country_co';

s:=s||'de    = l_code'||unistr('\000a')||
'      WHERE activity_type = ''NEW_SESSION'''||unistr('\000a')||
'        AND ip_address  = c1.ip_address'||unistr('\000a')||
'        AND country_code IS NULL'||unistr('\000a')||
'        AND EXISTS ('||unistr('\000a')||
'          SELECT 1'||unistr('\000a')||
'          FROM blog_country c'||unistr('\000a')||
'          WHERE c.country_code = l_code'||unistr('\000a')||
'        )'||unistr('\000a')||
'      ;'||unistr('\000a')||
'      l_count := SQL%ROWCOUNT;'||unistr('\000a')||
'      '||unistr('\000a')||
'      /* If no rows updated, country code is unknown */'||unistr('\000a')||
'      IF l_count = 0 THEN'||unistr('\000a')||
'        l_code := ''XX''';

s:=s||';    '||unistr('\000a')||
'        UPDATE blog_activity_log'||unistr('\000a')||
'        SET country_city  = l_city,'||unistr('\000a')||
'          country_code    = l_code'||unistr('\000a')||
'        WHERE activity_type = ''NEW_SESSION'''||unistr('\000a')||
'          AND ip_address  = c1.ip_address'||unistr('\000a')||
'          AND country_code IS NULL'||unistr('\000a')||
'          ;'||unistr('\000a')||
'        l_count := SQL%ROWCOUNT;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      '||unistr('\000a')||
'      /* Update total visitors from country */'||unistr('\000a')||
'      UPDATE blog_country'||unistr('\000a')||
'      SET visit_count = visit_';

s:=s||'count + l_count'||unistr('\000a')||
'      WHERE country_code = l_code'||unistr('\000a')||
'      ;'||unistr('\000a')||
'      '||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    '||unistr('\000a')||
'  END update_country;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_activity_logs'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    dbms_mview.refresh(''BLOG_ARTICLE_HIT20,BLOG_ARTICLE_TOP20'');'||unistr('\000a')||
'  END update_activity';

s:=s||'_logs;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE purge_preview'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Delete from blog_article_preview rows where session is expired */'||unistr('\000a')||
'    DELETE FROM blog_article_preview p'||unistr('\000a')||
'    WHERE NOT EXISTS ('||unistr('\000a')||
'      SELECT 1 FROM apex_workspace_sessions s'||unistr('\000a')||
'      WHERE';

s:=s||' s.apex_session_id = p.apex_session_id'||unistr('\000a')||
'    );'||unistr('\000a')||
'  END purge_preview;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE rotate_log_job('||unistr('\000a')||
'    p_interval IN PLS_INTEGER DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_interval        SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    c_job             CONSTANT VARCHAR2(30) := ''';

s:=s||'BLOG_ROTATE_LOG'';'||unistr('\000a')||
'    job_not_exists    EXCEPTION;'||unistr('\000a')||
'    PRAGMA            EXCEPTION_INIT(job_not_exists, -27475);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      DBMS_SCHEDULER.DROP_JOB(c_job);'||unistr('\000a')||
'    EXCEPTION WHEN job_not_exists THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF p_interval IS NULL THEN'||unistr('\000a')||
'      l_interval := blog_util.get_param_value(''LOG_ROTATE_DAY'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_interval := p_interval;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_interval';

s:=s||' > 0 THEN'||unistr('\000a')||
'      DBMS_SCHEDULER.CREATE_JOB('||unistr('\000a')||
'        job_name        => c_job,'||unistr('\000a')||
'        job_type        => ''STORED_PROCEDURE'','||unistr('\000a')||
'        job_action      => ''blog_job.rotate_log'','||unistr('\000a')||
'        start_date      => TRUNC(SYSTIMESTAMP),'||unistr('\000a')||
'        enabled         => TRUE,'||unistr('\000a')||
'        repeat_interval => ''FREQ=DAILY;INTERVAL='' || l_interval,'||unistr('\000a')||
'        comments        => ''Rotate blog activity logs'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  EN';

s:=s||'D rotate_log_job;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_country_job ('||unistr('\000a')||
'    p_drop_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    c_job                 CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_COUNTRY'';'||unistr('\000a')||
'    job_not_exists        EXCEPTION;'||unistr('\000a')||
'    PRAGMA                EXC';

s:=s||'EPTION_INIT(job_not_exists, -27475);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      DBMS_SCHEDULER.DROP_JOB(c_job);'||unistr('\000a')||
'    EXCEPTION WHEN job_not_exists THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF NOT p_drop_only THEN'||unistr('\000a')||
'      dbms_scheduler.create_job('||unistr('\000a')||
'        job_name        => c_job,'||unistr('\000a')||
'        job_type        =>''STORED_PROCEDURE'','||unistr('\000a')||
'        job_action      => ''blog_job.update_country'','||unistr('\000a')||
'        start_date      => TRUNC(SYSTIMESTAMP, ';

s:=s||'''HH''),'||unistr('\000a')||
'        repeat_interval => ''FREQ=MINUTELY;BYMINUTE=5,15,25,35,45,55'','||unistr('\000a')||
'        enabled         => TRUE,'||unistr('\000a')||
'        comments        => ''Update blog visitors country'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END update_country_job;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_acti';

s:=s||'vity_logs_job ('||unistr('\000a')||
'    p_drop_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    c_job          CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_ACTIVITY_LOGS'';'||unistr('\000a')||
'    job_not_exists EXCEPTION;'||unistr('\000a')||
'    PRAGMA         EXCEPTION_INIT(job_not_exists, -27475);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      DBMS_SCHEDULER.DROP_JOB(c_job);'||unistr('\000a')||
'    EXCEPTION WHEN job_not_exists THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF NOT p_drop_only THEN'||unistr('\000a')||
'      dbms_scheduler.creat';

s:=s||'e_job('||unistr('\000a')||
'        job_name        => c_job,'||unistr('\000a')||
'        job_type        =>''STORED_PROCEDURE'','||unistr('\000a')||
'        job_action      => ''blog_job.update_activity_logs'','||unistr('\000a')||
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),'||unistr('\000a')||
'        repeat_interval => ''FREQ=HOURLY;BYMINUTE=10'','||unistr('\000a')||
'        enabled         => TRUE,'||unistr('\000a')||
'        comments        => ''Update blog statistic log mviews'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END update_activity_logs_jo';

s:=s||'b;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE purge_preview_job('||unistr('\000a')||
'    p_drop_only BOOLEAN DEFAULT FALSE'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    c_job           CONSTANT VARCHAR2(30) := ''BLOG_PURGE_PREVIEW'';'||unistr('\000a')||
'    job_not_exists  EXCEPTION;'||unistr('\000a')||
'    PRAGMA          EXCEPTION_INIT(job_not_exists, -27475);';

s:=s||''||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      DBMS_SCHEDULER.DROP_JOB(c_job);'||unistr('\000a')||
'    EXCEPTION WHEN job_not_exists THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    IF NOT p_drop_only THEN'||unistr('\000a')||
'      dbms_scheduler.create_job('||unistr('\000a')||
'        job_name        => c_job,'||unistr('\000a')||
'        job_type        => ''STORED_PROCEDURE'','||unistr('\000a')||
'        job_action      => ''blog_job.purge_preview'','||unistr('\000a')||
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),'||unistr('\000a')||
'        repeat_interval => ''FREQ=D';

s:=s||'AILY'','||unistr('\000a')||
'        enabled         => TRUE,'||unistr('\000a')||
'        comments        => ''Purge blog article preview table'''||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END purge_preview_job;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_JOB";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE PACKAGE  "BLOG_INSTALL" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'----------';

s:=s||'----------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_param_data('||unistr('\000a')||
'    p_reader_app_id IN NUMBER,'||unistr('\000a')||
'    p_theme_path    IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE post_install;'||unistr('\000a')||
'-----------------------------';

s:=s||'---------------------------------------------------'||unistr('\000a')||
'  PROCEDURE pre_deinstall;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_INSTALL";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_INSTALL" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PRO';

s:=s||'CEDURE update_param_data('||unistr('\000a')||
'    p_reader_app_id IN NUMBER,'||unistr('\000a')||
'    p_theme_path    IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_alias VARCHAR2(2000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT alias'||unistr('\000a')||
'    INTO l_alias'||unistr('\000a')||
'    FROM apex_applications'||unistr('\000a')||
'    WHERE application_id = p_reader_app_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    UPDATE blog_param'||unistr('\000a')||
'    SET param_value = TO_CHAR(p_reader_app_id)'||unistr('\000a')||
'    WHERE param_id  = ''G_BLOG_READER_APP_ID'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF p_theme_pat';

s:=s||'h IS NULL THEN'||unistr('\000a')||
'      UPDATE blog_param'||unistr('\000a')||
'      SET param_value = ''f?p='' || TO_CHAR(p_reader_app_id) || '':FILES:0:APPLICATION_PROCESS=DOWNLOAD:::P11_FILE_NAME:'''||unistr('\000a')||
'      WHERE param_id  = ''G_THEME_PATH'''||unistr('\000a')||
'      ;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      UPDATE blog_param'||unistr('\000a')||
'      SET param_value = p_theme_path'||unistr('\000a')||
'      WHERE param_id  = ''G_THEME_PATH'''||unistr('\000a')||
'      ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    UPDATE blog_param'||unistr('\000a')||
'    SET param_value = ''f?p='' || l_alias || ''';

s:=s||':RSS:0'''||unistr('\000a')||
'    WHERE param_id  = ''G_RSS_FEED_URL'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    UPDATE blog_param'||unistr('\000a')||
'    SET param_value = apex_util.host_url(''SCRIPT'')'||unistr('\000a')||
'    WHERE param_id  = ''G_BASE_URL'''||unistr('\000a')||
'    ;'||unistr('\000a')||
'    blog_install.post_install;'||unistr('\000a')||
'  END update_param_data;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE pos';

s:=s||'t_install'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    blog_job.update_country_job;'||unistr('\000a')||
'    blog_job.rotate_log_job;'||unistr('\000a')||
'    blog_job.update_activity_logs_job;'||unistr('\000a')||
'    blog_job.purge_preview_job;'||unistr('\000a')||
'    dbms_mview.refresh(''BLOG_PARAM_APP'',''C'');'||unistr('\000a')||
'  END post_install;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE pre_';

s:=s||'deinstall'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    blog_job.update_country_job(TRUE);'||unistr('\000a')||
'    blog_job.rotate_log_job(0);'||unistr('\000a')||
'    blog_job.update_activity_logs_job(TRUE);'||unistr('\000a')||
'    blog_job.purge_preview_job(TRUE);'||unistr('\000a')||
'  END pre_deinstall;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
' END "BLOG_INSTALL";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLAC';

s:=s||'E PACKAGE  "BLOG_ADMIN_APP" '||unistr('\000a')||
'AUTHID DEFINER'||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_collection_name RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE print_article_from_collection;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE table_t';

s:=s||'o_collection ('||unistr('\000a')||
'    p_table       IN APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE article_to_collection ('||unistr('\000a')||
'    p_article_id  IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_article_text ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_success_message IN OUT NO';

s:=s||'COPY VARCHAR2,'||unistr('\000a')||
'    p_message         IN VARCHAR DEFAULT ''Action Processed.'''||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_article_preview ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_author_id       IN NUMBER,'||unistr('\000a')||
'    p_category_id     IN NUMBER,'||unistr('\000a')||
'    p_article_title   IN VARCHAR2,'||unistr('\000a')||
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'-------';

s:=s||'-------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_category_seq RETURN NUMBER;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_author_seq RETURN NUMBER;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_faq_no RETURN NUMBER;'||unistr('\000a')||
'----------------------------';

s:=s||'----------------------------------------------------'||unistr('\000a')||
'  FUNCTION display_param_value_item ('||unistr('\000a')||
'    p_param_id        IN VARCHAR2,'||unistr('\000a')||
'    p_param_type      IN VARCHAR2,'||unistr('\000a')||
'    p_param_nullable  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION set_param_value_item ('||unistr('\000a')||
'    p_param_id          IN VARCHAR2,'||unistr('\000a')||
'    p_yesno             IN VARCHA';

s:=s||'R2,'||unistr('\000a')||
'    p_text_null         IN VARCHAR2,'||unistr('\000a')||
'    p_number_null       IN VARCHAR2,'||unistr('\000a')||
'    p_number_not_null   IN VARCHAR2,'||unistr('\000a')||
'    p_text_not_null     IN VARCHAR2,'||unistr('\000a')||
'    p_textarea_null     IN VARCHAR2,'||unistr('\000a')||
'    p_textarea_not_null IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION login('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2'||unistr('\000a')||
'';

s:=s||'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION check_password('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE post_login;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION ';

s:=s||'is_developer RETURN PLS_INTEGER;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE get_apex_lang_message ('||unistr('\000a')||
'    p_application_id        IN NUMBER,'||unistr('\000a')||
'    p_translation_entry_id  IN NUMBER,'||unistr('\000a')||
'    p_translatable_message  OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_language_code         OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_message_text          OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_md5                ';

s:=s||'   OUT NOCOPY VARCHAR2'||unistr('\000a')||
'   );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE upd_apex_lang_message ('||unistr('\000a')||
'    p_application_id        IN NUMBER,'||unistr('\000a')||
'    p_translation_entry_id  IN NUMBER,'||unistr('\000a')||
'    p_translatable_message  IN VARCHAR2,'||unistr('\000a')||
'    p_language_code         IN VARCHAR2,'||unistr('\000a')||
'    p_message_text          IN VARCHAR2,'||unistr('\000a')||
'    p_md5                   IN VARCHAR2,'||unistr('\000a')||
'    p_succes';

s:=s||'s_message       OUT NOCOPY VARCHAR2'||unistr('\000a')||
'   );'||unistr('\000a')||
'--------------------------------------------------------------------------------  '||unistr('\000a')||
'END "BLOG_ADMIN_APP";'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE PACKAGE BODY  "BLOG_ADMIN_APP" '||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  -- Private constants and functions'||unistr('\000a')||
'  g_article_text_collection CONSTANT VARCHAR2(80) := ''ARTICLE_TEXT_COLLECTION'';'||unistr('\000a')||
'';

s:=s||'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION build_apex_lang_message_md5 ('||unistr('\000a')||
'    p_translation_entry_id  IN NUMBER,'||unistr('\000a')||
'    p_translatable_message  IN VARCHAR2,'||unistr('\000a')||
'    p_language_code         IN VARCHAR2,'||unistr('\000a')||
'    p_message_text          IN VARCHAR2,'||unistr('\000a')||
'    p_col_sep   IN VARCHAR2 DEFAULT';

s:=s||' ''|'''||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    RETURN sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => '||unistr('\000a')||
'      p_translation_entry_id || p_col_sep ||'||unistr('\000a')||
'      p_translatable_message || p_col_sep ||'||unistr('\000a')||
'      p_language_code || p_col_sep ||'||unistr('\000a')||
'      p_message_text || p_col_sep ||'||unistr('\000a')||
'      '''''||unistr('\000a')||
'    ));'||unistr('\000a')||
'  END build_apex_lang_message_md5;'||unistr('\000a')||
'------------------------------------------------------------';

s:=s||'--------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  -- Global procedures and functions'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION table_to_clob ('||unistr('\000a')||
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  ) RETURN CLOB'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    ';

s:=s||'l_len   SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_data  CLOB;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'    l_len := p_table.COUNT;'||unistr('\000a')||
''||unistr('\000a')||
'    IF l_len = 0'||unistr('\000a')||
'    OR COALESCE(LENGTH(p_table(1)), 0) = 0'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      RETURN EMPTY_CLOB();'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
''||unistr('\000a')||
'    dbms_lob.createtemporary('||unistr('\000a')||
'      lob_loc => l_data,'||unistr('\000a')||
'      cache   => TRUE,'||unistr('\000a')||
'      dur     => dbms_lob.session'||unistr('\000a')||
'    );'||unistr('\000a')||
'    dbms_lob.open(l_data, dbms_lob.lob_readwrite);'||unistr('\000a')||
''||unistr('\000a')||
'    FOR i IN 1 .. l_len'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'  ';

s:=s||'    dbms_lob.writeappend('||unistr('\000a')||
'        lob_loc => l_data,'||unistr('\000a')||
'        amount  => LENGTH(p_table(i)),'||unistr('\000a')||
'        buffer  => p_table(i)'||unistr('\000a')||
'      );'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    dbms_lob.close(l_data);'||unistr('\000a')||
'    RETURN l_data;'||unistr('\000a')||
'  END table_to_clob;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE print_clob('||unistr('\000a')||
' ';

s:=s||'   p_clob IN CLOB'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_length      SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_clob_len    SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_offset      SIMPLE_INTEGER := 1;'||unistr('\000a')||
'    l_byte_len    SIMPLE_INTEGER := 0;'||unistr('\000a')||
'    l_temp        VARCHAR2(32767);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'    l_length    := COALESCE(dbms_lob.getlength(p_clob), 0);'||unistr('\000a')||
'    l_clob_len  := l_length;'||unistr('\000a')||
'    l_byte_len  := 30000;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF l_length < l_byte_len THEN'||unistr('\000a')||
'      htp.prn';

s:=s||'(p_clob);'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'    --'||unistr('\000a')||
'      WHILE l_offset < l_length AND l_byte_len > 0'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        /* Get 30k cut */'||unistr('\000a')||
'        l_temp := dbms_lob.substr(p_clob,l_byte_len,l_offset);'||unistr('\000a')||
'        --'||unistr('\000a')||
'        /* Print HTML */'||unistr('\000a')||
'        htp.prn(l_temp);'||unistr('\000a')||
'        --'||unistr('\000a')||
'        /* set the start position for the next cut */'||unistr('\000a')||
'        l_offset := l_offset + l_byte_len;'||unistr('\000a')||
'        --'||unistr('\000a')||
'        /* set the end position if less tha';

s:=s||'n 32k */'||unistr('\000a')||
'        l_clob_len := l_clob_len - l_byte_len;'||unistr('\000a')||
'        IF l_clob_len < l_byte_len THEN'||unistr('\000a')||
'          l_byte_len := l_clob_len;'||unistr('\000a')||
'        END IF;'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END print_clob;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_collection_name RETURN';

s:=s||' VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    RETURN g_article_text_collection;'||unistr('\000a')||
'  END;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE print_article_from_collection'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_clob CLOB;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT clob001'||unistr('\000a')||
'    INTO l_clob'||unistr('\000a')||
'    FROM apex_collections'||unistr('\000a')||
'    WHERE collection_name = g_article';

s:=s||'_text_collection'||unistr('\000a')||
'    AND seq_id = 1'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    print_clob(l_clob);'||unistr('\000a')||
'  END print_article_from_collection ;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE table_to_collection ('||unistr('\000a')||
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    apex_collection.create_or_trunca';

s:=s||'te_collection(g_article_text_collection);'||unistr('\000a')||
'    apex_collection.add_member('||unistr('\000a')||
'      p_collection_name => g_article_text_collection,'||unistr('\000a')||
'      p_clob001         => table_to_clob(p_table)'||unistr('\000a')||
'    );'||unistr('\000a')||
'  END table_to_collection;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE article_to_col';

s:=s||'lection ('||unistr('\000a')||
'    p_article_id IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_clob CLOB;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    apex_collection.create_or_truncate_collection(g_article_text_collection);'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT article_text'||unistr('\000a')||
'      INTO l_clob'||unistr('\000a')||
'      FROM blog_article'||unistr('\000a')||
'      WHERE article_id = p_article_id'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    EXCEPTION WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'      l_clob := NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    apex_collection.add_member('||unistr('\000a')||
'      p_collection_name =>';

wwv_flow_api.append_to_install_script(
  p_id => 11220716262817091 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||' g_article_text_collection,'||unistr('\000a')||
'      p_clob001 => l_clob'||unistr('\000a')||
'    );'||unistr('\000a')||
'  END article_to_collection;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_article_text ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_success_message IN OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_message         IN VARCHAR DEFA';

s:=s||'ULT ''Action Processed.'''||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    MERGE INTO blog_article a'||unistr('\000a')||
'    USING ('||unistr('\000a')||
'      SELECT p_article_id AS article_id,'||unistr('\000a')||
'        clob001'||unistr('\000a')||
'      FROM apex_collections'||unistr('\000a')||
'      WHERE collection_name = g_article_text_collection'||unistr('\000a')||
'        AND seq_id  = 1'||unistr('\000a')||
'    ) b'||unistr('\000a')||
'    ON (a.article_id = b.article_id)'||unistr('\000a')||
'    WHEN MATCHED THEN'||unistr('\000a')||
'    UPDATE SET a.article_text = b.clob001'||unistr('\000a')||
'    WHERE dbms_lob.compare(a.article_text, ';

s:=s||'b.clob001) != 0'||unistr('\000a')||
'      OR dbms_lob.compare(a.article_text, b.clob001) IS NULL'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    IF SQL%ROWCOUNT > 0 THEN'||unistr('\000a')||
'      p_success_message := COALESCE(p_success_message, p_message);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
''||unistr('\000a')||
'  END save_article_text;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_arti';

s:=s||'cle_preview ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_author_id       IN NUMBER,'||unistr('\000a')||
'    p_category_id     IN NUMBER,'||unistr('\000a')||
'    p_article_title   IN VARCHAR2,'||unistr('\000a')||
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    /* Hopefully we can someday share collections between applications */'||unistr('\000a')||
'    blog_admin_app.table_to_collection (p_article_text);'||unistr('\000a')||
'    MERGE INTO blog_article_preview a'||unistr('\000a')||
'    USING';

s:=s||' ('||unistr('\000a')||
'      SELECT p_article_id AS article_id,'||unistr('\000a')||
'        p_author_id       AS author_id,'||unistr('\000a')||
'        p_category_id     AS category_id,'||unistr('\000a')||
'        p_article_title   AS article_title,'||unistr('\000a')||
'        clob001           AS article_text'||unistr('\000a')||
'      FROM apex_collections'||unistr('\000a')||
'      WHERE collection_name = g_article_text_collection'||unistr('\000a')||
'        AND seq_id  = 1'||unistr('\000a')||
'    ) b'||unistr('\000a')||
'    ON (a.apex_session_id = b.article_id)'||unistr('\000a')||
'    WHEN MATCHED THEN'||unistr('\000a')||
'    UPDA';

s:=s||'TE SET a.article_text = b.article_text,'||unistr('\000a')||
'      a.author_id             = b.author_id,'||unistr('\000a')||
'      a.category_id           = b.category_id,'||unistr('\000a')||
'      a.article_title         = b.article_title'||unistr('\000a')||
'    WHEN NOT MATCHED THEN'||unistr('\000a')||
'    INSERT (apex_session_id, author_id, category_id, article_title, article_text)'||unistr('\000a')||
'    VALUES (b.article_id, b.author_id, b.category_id, b.article_title, b.article_text)'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END save_article_';

s:=s||'preview;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_category_seq RETURN NUMBER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_max  NUMBER;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT CEIL(COALESCE(MAX(category_seq) + 1, 1) / 10) * 10'||unistr('\000a')||
'    INTO l_max'||unistr('\000a')||
'    FROM blog_category'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_max;'||unistr('\000a')||
'  END get_next_category_se';

s:=s||'q;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_author_seq RETURN NUMBER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_max  NUMBER;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT CEIL(COALESCE(MAX(author_seq) + 1, 1) / 10) * 10'||unistr('\000a')||
'    INTO l_max'||unistr('\000a')||
'    FROM blog_author'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_max;'||unistr('\000a')||
'  END get_next_author_seq;'||unistr('\000a')||
'-----------';

s:=s||'---------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_next_faq_no RETURN NUMBER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_max  NUMBER;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT COALESCE(MAX(faq_seq) + 1, 1)'||unistr('\000a')||
'    INTO l_max'||unistr('\000a')||
'    FROM blog_faq'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_max;'||unistr('\000a')||
'  END get_next_faq_no;'||unistr('\000a')||
'-------------------------------------------------------';

s:=s||'-------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION display_param_value_item ('||unistr('\000a')||
'    p_param_id        IN VARCHAR2,'||unistr('\000a')||
'    p_param_type      IN VARCHAR2,'||unistr('\000a')||
'    p_param_nullable  IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_num SIMPLE_INTEGER := 0;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT 1'||unistr('\000a')||
'      INTO l_num'||unistr('\000a')||
'      FROM blog_param'||unistr('\000a')||
'      WHERE param_id = p';

s:=s||'_param_id'||unistr('\000a')||
'      AND param_type = p_param_type'||unistr('\000a')||
'      AND param_nullable = p_param_nullable'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    EXCEPTION WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    RETURN TRUE;'||unistr('\000a')||
'  END display_param_value_item;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION set_param_val';

s:=s||'ue_item ('||unistr('\000a')||
'    p_param_id          IN VARCHAR2,'||unistr('\000a')||
'    p_yesno             IN VARCHAR2,'||unistr('\000a')||
'    p_text_null         IN VARCHAR2,'||unistr('\000a')||
'    p_number_null       IN VARCHAR2,'||unistr('\000a')||
'    p_number_not_null   IN VARCHAR2,'||unistr('\000a')||
'    p_text_not_null     IN VARCHAR2,'||unistr('\000a')||
'    p_textarea_null     IN VARCHAR2,'||unistr('\000a')||
'    p_textarea_not_null IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_value VARCHAR2(32700);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    SELECT CASE'||unistr('\000a')||
'      WHEN param_';

s:=s||'type = ''YESNO'' THEN'||unistr('\000a')||
'        p_yesno'||unistr('\000a')||
'      WHEN param_type = ''TEXT'' AND param_nullable = ''Y'' THEN'||unistr('\000a')||
'        p_text_null'||unistr('\000a')||
'      WHEN param_type = ''TEXT'' AND param_nullable = ''N'' THEN'||unistr('\000a')||
'        p_text_not_null'||unistr('\000a')||
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''Y'' THEN'||unistr('\000a')||
'        p_number_null'||unistr('\000a')||
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''N'' THEN'||unistr('\000a')||
'        p_number_not_null'||unistr('\000a')||
'      WHEN param_type = ';

s:=s||'''TEXTAREA'' AND param_nullable = ''Y'' THEN'||unistr('\000a')||
'        p_textarea_null'||unistr('\000a')||
'      WHEN param_type = ''TEXTAREA'' AND param_nullable = ''N'' THEN'||unistr('\000a')||
'        p_textarea_not_null'||unistr('\000a')||
'    END AS param_value'||unistr('\000a')||
'    INTO l_value'||unistr('\000a')||
'    FROM blog_param'||unistr('\000a')||
'    WHERE param_id = p_param_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    RETURN l_value;'||unistr('\000a')||
'  END set_param_value_item;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------';

s:=s||'-----------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION login('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    AUTH_SUCCESS            CONSTANT INTEGER      := 0;'||unistr('\000a')||
'    AUTH_UNKNOWN_USER       CONSTANT INTEGER      := 1;'||unistr('\000a')||
'    AUTH_ACCOUNT_LOCKED     CONSTANT INTEGER      := 2;'||unistr('\000a')||
'    AUTH_ACCOUNT_EXPIRED    CONSTANT INTEGER      := 3;'||unistr('\000a')||
'    AUTH_PASS';

s:=s||'WORD_INCORRECT CONSTANT INTEGER      := 4;'||unistr('\000a')||
'    AUTH_PASSWORD_FIRST_USE CONSTANT INTEGER      := 5;'||unistr('\000a')||
'    AUTH_ATTEMPTS_EXCEEDED  CONSTANT INTEGER      := 6;'||unistr('\000a')||
'    AUTH_INTERNAL_ERROR     CONSTANT INTEGER      := 7;'||unistr('\000a')||
'    l_password              VARCHAR2(4000);'||unistr('\000a')||
'    l_stored_password       VARCHAR2(4000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    -- First, check to see if the user is in the user table and have password'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'     ';

s:=s||' SELECT passwd'||unistr('\000a')||
'      INTO l_stored_password'||unistr('\000a')||
'      FROM blog_author'||unistr('\000a')||
'      WHERE user_name = p_username'||unistr('\000a')||
'      AND active = ''Y'''||unistr('\000a')||
'      AND passwd IS NOT NULL'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    EXCEPTION WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_UNKNOWN_USER);'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    -- Apply the custom hash function to the password'||unistr('\000a')||
'    l_password := blog_pw_hash(p_username, p_password);';

s:=s||''||unistr('\000a')||
'    -- Compare them to see if they are the same and return either TRUE or FALSE'||unistr('\000a')||
'    IF l_password = l_stored_password THEN'||unistr('\000a')||
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_SUCCESS);'||unistr('\000a')||
'      RETURN TRUE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_PASSWORD_INCORRECT);'||unistr('\000a')||
'    RETURN FALSE;'||unistr('\000a')||
'  END login;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------';

s:=s||'----------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION check_password ('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_password              VARCHAR2(4000);'||unistr('\000a')||
'    l_stored_password       VARCHAR2(4000);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    -- First, check to see if the user is in the user table and have password'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT passwd'||unistr('\000a')||
'      INTO l_store';

s:=s||'d_password'||unistr('\000a')||
'      FROM blog_author'||unistr('\000a')||
'      WHERE user_name = p_username'||unistr('\000a')||
'      AND active = ''Y'''||unistr('\000a')||
'      AND passwd IS NOT NULL'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    EXCEPTION WHEN NO_DATA_FOUND THEN'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    -- Apply the custom hash function to the password'||unistr('\000a')||
'    l_password := blog_pw_hash(p_username, p_password);'||unistr('\000a')||
'    -- Compare them to see if they are the same and return either TRUE or FALSE'||unistr('\000a')||
'    IF l_passw';

s:=s||'ord = l_stored_password THEN'||unistr('\000a')||
'      RETURN TRUE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    RETURN FALSE;'||unistr('\000a')||
'  END check_password;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE post_login'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_app_user  VARCHAR2(255);'||unistr('\000a')||
'    l_author_id NUMBER;'||unistr('\000a')||
'    l_app_id    NUMBER;'||unistr('\000a')||
'    l_reader_id NUMBER;'||unistr('\000a')||
'  BEGIN';

s:=s||''||unistr('\000a')||
'    l_app_user  := v(''APP_USER'');'||unistr('\000a')||
'    l_app_id    := nv(''APP_ID'');'||unistr('\000a')||
'    SELECT author_id'||unistr('\000a')||
'      INTO l_author_id'||unistr('\000a')||
'      FROM blog_author'||unistr('\000a')||
'     WHERE user_name = l_app_user'||unistr('\000a')||
'      AND active = ''Y'''||unistr('\000a')||
'      AND passwd IS NOT NULL'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    blog_util.set_items_from_param(l_app_id);'||unistr('\000a')||
'    apex_util.set_session_state(''G_AUTHOR_ID'', l_author_id);'||unistr('\000a')||
'    apex_util.set_session_state(''G_DATE_TIME_FORMAT'', COALESCE(ape';

s:=s||'x_util.get_preference(''DATE_TIME_FORMAT'', l_app_user), ''DD Mon YYYY HH24:MI:SS''));'||unistr('\000a')||
'    IF apex_util.get_preference(''SHOW_HELP'', l_app_user) IS NULL THEN'||unistr('\000a')||
'      apex_util.set_preference('||unistr('\000a')||
'        p_preference => ''SHOW_HELP'','||unistr('\000a')||
'        p_value => ''Y'','||unistr('\000a')||
'        p_user => l_app_user'||unistr('\000a')||
'      );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    l_reader_id := nv(''G_BLOG_READER_APP_ID'');'||unistr('\000a')||
'    FOR c1 IN ('||unistr('\000a')||
'      SELECT alias'||unistr('\000a')||
'      FROM apex_applic';

s:=s||'ations'||unistr('\000a')||
'      WHERE application_id = l_reader_id'||unistr('\000a')||
'    ) LOOP'||unistr('\000a')||
'      apex_util.set_session_state(''G_BLOG_READER_APP_ALIAS'', c1.alias);'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END post_login;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION is_developer RETURN PLS_INTEGER'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    RETURN CASE WHE';

s:=s||'N apex_util.public_check_authorization(''IS_DEVELOPER'') THEN 1 ELSE 0 END;'||unistr('\000a')||
'  END ;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE get_apex_lang_message ('||unistr('\000a')||
'    p_application_id        IN NUMBER,'||unistr('\000a')||
'    p_translation_entry_id  IN NUMBER,'||unistr('\000a')||
'    p_translatable_message  OUT NOCOPY VAR';

s:=s||'CHAR2,'||unistr('\000a')||
'    p_language_code         OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_message_text          OUT NOCOPY VARCHAR2,'||unistr('\000a')||
'    p_md5                   OUT NOCOPY VARCHAR2'||unistr('\000a')||
'   )'||unistr('\000a')||
'   AS'||unistr('\000a')||
'   BEGIN'||unistr('\000a')||
'    FOR c1 IN ('||unistr('\000a')||
'      SELECT translation_entry_id'||unistr('\000a')||
'        ,translatable_message'||unistr('\000a')||
'        ,language_code'||unistr('\000a')||
'        ,message_text'||unistr('\000a')||
'      FROM apex_application_translations'||unistr('\000a')||
'      WHERE application_id = p_application_id'||unistr('\000a')||
'        AND tra';

s:=s||'nslation_entry_id = p_translation_entry_id'||unistr('\000a')||
'    ) LOOP'||unistr('\000a')||
'      p_translatable_message := c1.translatable_message;'||unistr('\000a')||
'      p_language_code := c1.language_code;'||unistr('\000a')||
'      p_message_text := c1.message_text;'||unistr('\000a')||
'      p_md5 := build_apex_lang_message_md5 ('||unistr('\000a')||
'          c1.translation_entry_id,'||unistr('\000a')||
'          c1.translatable_message,'||unistr('\000a')||
'          c1.language_code,'||unistr('\000a')||
'          c1.message_text '||unistr('\000a')||
'      );'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END get_ap';

s:=s||'ex_lang_message;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE upd_apex_lang_message ('||unistr('\000a')||
'    p_application_id        IN NUMBER,'||unistr('\000a')||
'    p_translation_entry_id  IN NUMBER,'||unistr('\000a')||
'    p_translatable_message  IN VARCHAR2,'||unistr('\000a')||
'    p_language_code         IN VARCHAR2,'||unistr('\000a')||
'    p_message_text       ';

s:=s||'   IN VARCHAR2,'||unistr('\000a')||
'    p_md5                   IN VARCHAR2,'||unistr('\000a')||
'    p_success_message       OUT NOCOPY VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'  AS'||unistr('\000a')||
'    l_input_md5 varchar2(32676);'||unistr('\000a')||
'    l_table_md5 varchar2(32676);'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    l_input_md5 := build_apex_lang_message_md5 ('||unistr('\000a')||
'        p_translation_entry_id,'||unistr('\000a')||
'        p_translatable_message,'||unistr('\000a')||
'        p_language_code,'||unistr('\000a')||
'        p_message_text '||unistr('\000a')||
'     );'||unistr('\000a')||
'    IF p_md5 IS NOT NULL THEN'||unistr('\000a')||
'      FOR c1';

s:=s||' IN ('||unistr('\000a')||
'        SELECT translation_entry_id'||unistr('\000a')||
'          ,translatable_message'||unistr('\000a')||
'          ,language_code'||unistr('\000a')||
'          ,message_text'||unistr('\000a')||
'        FROM apex_application_translations'||unistr('\000a')||
'        WHERE application_id = p_application_id'||unistr('\000a')||
'        AND translation_entry_id = p_translation_entry_id'||unistr('\000a')||
'      ) LOOP'||unistr('\000a')||
'          l_table_md5 := build_apex_lang_message_md5 ('||unistr('\000a')||
'              c1.translation_entry_id,'||unistr('\000a')||
'              c1.tran';

s:=s||'slatable_message,'||unistr('\000a')||
'              c1.language_code,'||unistr('\000a')||
'              c1.message_text '||unistr('\000a')||
'           );'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_table_md5 != p_md5 THEN'||unistr('\000a')||
'      raise_application_error (-20001, apex_lang.message(''MSG_LOST_UPDATE'', l_table_md5, p_md5));'||unistr('\000a')||
'    ELSIF p_md5       IS NOT NULL'||unistr('\000a')||
'    AND   l_table_md5 IS NOT NULL'||unistr('\000a')||
'    AND   l_table_md5 = p_md5'||unistr('\000a')||
'    AND   l_input_md5 != p_md5'||unistr('\000a')||
'    THEN'||unistr('\000a')||
'      ap';

s:=s||'ex_lang.update_message('||unistr('\000a')||
'        p_id => p_translation_entry_id,'||unistr('\000a')||
'        p_message_text => p_message_text'||unistr('\000a')||
'      );'||unistr('\000a')||
'      p_success_message := apex_lang.message(''MSG_ACTION_PROCESSED'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END upd_apex_lang_message;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END "BLOG_ADM';

s:=s||'IN_APP";'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.append_to_install_script(
  p_id => 11220716262817091 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE OR REPLACE TRIGGER  "BLOG_RESOURCE_TRG" before'||unistr('\000a')||
'INSERT OR'||unistr('\000a')||
'UPDATE ON BLOG_RESOURCE FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.LINK_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.LINK_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'    :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'    :NEW.changed_by := COALE';

s:=s||'SCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_RESOURCE_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_PARAM" before'||unistr('\000a')||
'INSERT OR'||unistr('\000a')||
'UPDATE ON "BLOG_PARAM" FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_PARAM" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREAT';

s:=s||'E OR REPLACE TRIGGER  "BLOG_LONG_TEXT_TRG" before'||unistr('\000a')||
'INSERT OR'||unistr('\000a')||
'UPDATE ON "BLOG_LONG_TEXT" FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_LONG_TEXT_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_FILE_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BL';

s:=s||'OG_FILE FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.FILE_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.FILE_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  :NEW.file_etag := :NEW.file_id || TO_CHAR(:NEW.changed_on, ''JHH24MISS'');'||unistr('\000a')||
'  :NEW.file_modified_since := TO_CHAR(SYS_EXTRACT_UTC(CA';

s:=s||'ST(:NEW.changed_on AS TIMESTAMP)), ''FMDy, DD Mon YYYY HH24:MI:SS "GMT"'', ''NLS_DATE_LANGUAGE=ENGLISH'');'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_FILE_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_FAQ_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_FAQ FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.FAQ_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.FAQ_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_by := COALESCE(v(''APP_USER''), USER)';

s:=s||';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_FAQ_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_CONTACT_MESSAGE_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_CONTACT_MESSAGE FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.CONTACT_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.CONTACT_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_by := COALESC';

s:=s||'E(v(''APP_USER''), USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_CONTACT_MESSAGE_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_USER_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_COMMENT_USER FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.USER_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.USER_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.';

s:=s||'created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  '||unistr('\000a')||
'  IF :NEW.BLOCKED = ''Y'' THEN'||unistr('\000a')||
'    IF :NEW.BLOCKED_ON IS NULL THEN'||unistr('\000a')||
'      :NEW.BLOCKED_ON := SYSDATE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE '||unistr('\000a')||
'    :NEW.BLOCKED_ON := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  '||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_COMMENT_USER_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_TRG" ';

s:=s||'before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_COMMENT FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.comment_id IS NULL THEN'||unistr('\000a')||
'      :NEW.comment_id := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'  '||unistr('\000a')||
'  IF :NEW.MODERATED = ''Y'' THEN'||unistr('\000a')||
'    IF :NEW.MODERATED_ON IS NULL THEN'||unistr('\000a')||
'      :NEW.MODE';

s:=s||'RATED_ON := SYSDATE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE '||unistr('\000a')||
'    :NEW.MODERATED_ON := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  '||unistr('\000a')||
'  IF :NEW.NOTIFY_EMAIL_SENT = ''Y'' THEN'||unistr('\000a')||
'    IF :NEW.NOTIFY_EMAIL_SENT_ON IS NULL THEN'||unistr('\000a')||
'      :NEW.NOTIFY_EMAIL_SENT_ON := SYSDATE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE '||unistr('\000a')||
'    :NEW.NOTIFY_EMAIL_SENT_ON := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  '||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_COMMENT_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_NOTIFY_TRG" before'||unistr('\000a')||
'  IN';

s:=s||'SERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_COMMENT_NOTIFY FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'   :NEW.created_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_COMMENT_NOTIFY_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_BLOCK_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_COMMENT_BLOCK FOR EACH row'||unistr('\000a')||
'BE';

s:=s||'GIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.BLOCK_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.BLOCK_ID := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''), USER);'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_COMMENT_BLOCK_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_CATEGORY_TRG" before'||unistr('\000a')||
'INSERT OR'||unistr('\000a')||
'UPDATE ON BLOG_CATEGORY FOR E';

s:=s||'ACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.category_id IS NULL THEN'||unistr('\000a')||
'      :NEW.category_id := blog_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER); '||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_CATEGORY_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_AUTHOR_TRG" before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE OR'||unistr('\000a')||
'  DELET';

s:=s||'E ON BLOG_AUTHOR FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.AUTHOR_ID IS NULL THEN'||unistr('\000a')||
'      -- Author is inserted to users table as blocked.'||unistr('\000a')||
'      -- Name who post comment can be then queried from one table.'||unistr('\000a')||
'      -- Also it prevent commenting using author email address.'||unistr('\000a')||
'      INSERT INTO blog_comment_user (email, nick_name, blocked, blocked_on, user_type)'||unistr('\000a')||
'      VALUES (:NEW.email, :NEW.autho';

s:=s||'r_name, ''Y'', SYSDATE, ''A'')'||unistr('\000a')||
'      RETURNING user_id INTO :NEW.author_id'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'    :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'    UPDATE blog_comment_user SET'||unistr('\000a')||
'      nick_name = :NEW.author_name,'||unistr('\000a')||
'      email     = :N';

s:=s||'EW.email'||unistr('\000a')||
'    WHERE user_id = :OLD.author_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF deleting THEN'||unistr('\000a')||
'    DELETE FROM blog_comment_user'||unistr('\000a')||
'    WHERE user_id = :OLD.author_id'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_AUTHOR_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER  "BLOG_ARTICLE_TRG" before'||unistr('\000a')||
'INSERT OR'||unistr('\000a')||
'UPDATE ON BLOG_ARTICLE FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.article_id IS NULL THEN'||unistr('\000a')||
'      :NEW.article_id := b';

s:=s||'log_sgid;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'  :NEW.changed_by := COALESCE(v(''APP_USER''),USER);'||unistr('\000a')||
'  -- Do calculations ready'||unistr('\000a')||
'  :NEW.year_month_num := TO_NUMBER(TO_CHAR(:NEW.created_on,''YYYYMM''));'||unistr('\000a')||
'  :NEW.article_length := COALESCE(dbms_lob.getlength(:NEW.article_text), 0);'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER  "BLOG_ARTICLE_TRG" ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10836201657442447 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '8 Trigger',
  p_sequence=> 80,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--REM INSERTING into BLOG_PARAM'||unistr('\000a')||
'--SET DEFINE OFF;'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''ALLOW_COMMENT'',''Y'',''Allow comments'',''Y'',''If set to "<b>Yes</b>", readers can post comments to any article.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_';

s:=s||'VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''BLOG_EMAIL'',''Y'',''Blog email'',''blog@blogexample.org'',''Email address witch is used notification emails from field.'',''TEXT'',''Y'',''EMAIL'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''COMMENT_V';

s:=s||'ERIFY_QUESTION'',''Y'',''Show math question'',''Y'',''If set to "<b>Yes</b>", small math question is displayed in comment and contact page. This <b>might</b> prevent bots posting comments to articles.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''FILE_DOWNLOAD_ENABLED'',';

s:=s||'''Y'',''Allow file download'',''Y'',''If set to "<b>Yes</b>", access to file repository URL for downloads is allowed.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''FOLLOWUP_EMAIL_BODY'',''Y'',''Followup email body'',''Hi #NICK_NAME#,'||unistr('\000a')||
''||unistr('\000a')||
'You have chosen to receive follow up not';

s:=s||'ification if new comment is posted to article "#ARTICLE_TITLE#".'||unistr('\000a')||
'To follow up the article new comment(s), please go to:'||unistr('\000a')||
'#ARTICLE_URL#'||unistr('\000a')||
''||unistr('\000a')||
'If you wish not get notification email in future please go to:'||unistr('\000a')||
'#UNSUBSCRIBE_URL#'||unistr('\000a')||
''||unistr('\000a')||
'Best regards,'||unistr('\000a')||
'#BLOG_NAME#'',''Email message body for readers who have post comment about new comment/author reply on article.'',''TEXTAREA'',''Y'',''EMAIL'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (';

s:=s||'PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''FOLLOWUP_EMAIL_SUBJ'',''Y'',''Followup email subject'',''New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.'',''Email subject for readers who have post comment about new comment/author reply on article.'',''TEXT'',''Y'',''EMAIL'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,P';

s:=s||'ARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_ARTICLE_ROWS'',''Y'',''Article per pagination'',''3'',''How many articles is shown per pagination e.g. in blog home page.'',''NUMBER'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) ';

s:=s||'values (''G_BASE_URL'',''Y'',''Canonical URL'',''http://vbox-apex/apex/'',''Canonical URL is useful to solve www and non-www duplicate content�where two URLs, identical except that one begins with "www" and other does not, point to the same page.'',''TEXT'',''N'',''SEO'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_';

s:=s||'USE_SKILL) values (''G_BING_WEBMASTER_META'',''Y'',''Bing webmaster tools verification meta tag'',null,null,''TEXT'',''Y'',''SEO'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_BLOG_DESCRIPTION'',''Y'',''Blog description'',''Blogging about all stuff'',''Description of blog. Optionally, controlled by';

s:=s||' preference "<b>Show blog description</b>", this is shown in blog reader.'',''TEXT'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_BLOG_NAME'',''Y'',''Blog name'',''My Blog'',''Blog name displayed in blog reader.'',''TEXT'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE';

s:=s||',PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_BLOG_READER_APP_ID'',''N'',''Blog reader application id'',''290'',''Used for query blog reader application alias. Only for developers.'',''NUMBER'',''N'',''INTERNAL'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PAR';

s:=s||'ENT,PARAM_USE_SKILL) values (''G_COMMENT_ROWS'',''Y'',''Comments per pagination'',''10'',''How many comments is shown per pagination e.g. in blog article page.'',''NUMBER'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_DATE_FORMAT'',''Y'',''Date format'',''fmDD Mon YYYY'',''Blog reader date';

s:=s||' format used e.g. when article is posted.'',''TEXT'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_GOOGLE_ANALYTICS_JS_CODE'',''Y'',''Google Analytics tracking ID'',null,null,''TEXTAREA'',''Y'',''SEO'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_H';

s:=s||'ELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_GOOGLE_WEBMASTER_META'',''Y'',''Google webmaster tools verification meta tag'',null,null,''TEXT'',''Y'',''SEO'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_RSS_FEED_URL'',''Y'',''RSS feed URL'',''f?p=BLOG:RSS:0'',';

s:=s||'''Blog RSS feed URL. Default is f?p=&lt;blog application alias&gt;:RSS:0. Tip: You can "burn" blog feed in <a target="balnk" href="http://feedburner.google.com">Feedburner</a> and use burned feed full URL here.'',''TEXT'',''Y'',''RSS'',''SHOW_RSS_FEED'',''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values';

s:=s||' (''G_THEME_PATH'',''Y'',''Theme location'',''f?p=290:FILES:0:APPLICATION_PROCESS=DOWNLOAD:::P11_FILE_NAME:'',''HTTP server folder where theme is located.'',''TEXT'',''N'',''UI'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''LOGGING_ENABLED'',''Y'',''Log activity'',''Y'',''If set to "<b>Yes</b>", new sess';

s:=s||'ions, article access, category access and users search are logged. Setting this to "<b>No</b>" <u>may</u> increase performance.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''LOG_ROTATE_DAY'',''N'',''Rotate log after days'',''14'',''Logs rotate interval for application l';

s:=s||'ogs. Nothing to do with APEX engine logs. In future release this might be controlled by author. Currently only developer can change this attribute and it do affect only when blog is installed. Changing this already installed blog don''''t have any affects.'',''NUMBER'',''N'',''INTERNAL'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_G';

s:=s||'ROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''MODERATION_ENABLED'',''Y'',''Comments moderate'',''Y'',''If set to "<b>Yes</b>", all comments must be moderated and approved by blog author(s).'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''NEW_COMMENT_EMAIL_BODY'',''Y'',''Author ';

s:=s||'notify email body'',''Hi #AUTHOR_NAME#,'||unistr('\000a')||
''||unistr('\000a')||
'New comment is posted to article "#ARTICLE_TITLE#".'||unistr('\000a')||
'#ARTICLE_URL#'||unistr('\000a')||
''||unistr('\000a')||
'Best regards,'||unistr('\000a')||
'#BLOG_NAME#'',''Email message body for author about new comment on article.'',''TEXTAREA'',''Y'',''EMAIL'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''NEW_COMMENT_EMAIL_';

s:=s||'SUBJ'',''Y'',''Author notify email subject'',''New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.'',''Email subject for author about new comment on article.'',''TEXT'',''Y'',''EMAIL'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''RSS_DESCRIPTION'',''Y'',''RSS feed description'',''My Blog most recent ';

s:=s||'articles'',''Description for blog RSS feed.'',''TEXT'',''Y'',''RSS'',''SHOW_RSS_FEED'',''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SCHEMA_VERSION'',''N'',''Blog engine version id'',''2.9.0.1'',''Used on future releases for upgrade. Only for developers.'',''TEXT'',''N'',''INTERNAL'',null,''A'');'||unistr('\000a')||
'Insert into BLOG_';

s:=s||'PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_ABOUT_PAGE'',''Y'',''Show about page/tab'',''Y'',''If set to "<b>Yes</b>", about page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PA';

s:=s||'RAM_PARENT,PARAM_USE_SKILL) values (''SHOW_AUTHOR_PAGE'',''Y'',''Show authors tab/page'',''Y'',''If set to "<b>Yes</b>", authors page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_BLOG_DESCRIPTION'',''Y'',''Show blog description'',''Y'',''I';

s:=s||'f set to "<b>Yes</b>", blog description is visible in blog reader pages under blog name.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_BLOG_REPORT'',''Y'',''Show blogroll'',''Y'',''If set "<b>Yes</b>", blogroll list is shown on blog reader resource page.'',''YESNO'',''';

s:=s||'N'',''AUTH'',''SHOW_RESOURCE_PAGE'',''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_CONTACT_PAGE'',''N'',''Show contact form tab/page'',''N'',''If set to "<b>Yes</b>", contact form page can be accessed from blog reader.'||unistr('\000a')||
''||unistr('\000a')||
'!!! DO NOT USE. FEATURE NOT IMPLEMENTED !!! '',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'';

s:=s||'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_DISCLAIMER_PAGE'',''Y'',''Show disclaimer page/tab'',''Y'',''If set to "<b>Yes</b>", disclaimer page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TY';

s:=s||'PE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_FAQ_PAGE'',''Y'',''Show FAQ tab/page'',''Y'',''If set to "<b>Yes</b>", frequently asked questions (FAQ) page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_FI';

s:=s||'LE_PAGE'',''Y'',''Show files tab/page'',''Y'',''If set to "<b>Yes</b>", files page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',''FILE_DOWNLOAD_ENABLED'',''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_FOOTER'',''Y'',''Show footer text'',''Y'',''If set to "<b>Yes</b>", footer text is shown in';

s:=s||' every blog reader page. Foter text is maintained from settings -> messages (BLOG_READER_FOOTER).'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_PHOTOS_PAGE'',''Y'',''Show photos tab/page'',''Y'',''If set to "<b>Yes</b>", files page can be accessed from blog reader.';

s:=s||''',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_RESOURCE_PAGE'',''Y'',''Show resources page/tab'',''Y'',''If set to "<b>Yes</b>", resources page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PAR';

s:=s||'AM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SHOW_RESOURCE_REPORT'',''Y'',''Show useful links'',''Y'',''If set to "<b>Yes</b>", useful links list is shown on blog reader resource page.'',''YESNO'',''N'',''AUTH'',''SHOW_RESOURCE_PAGE'',''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARE';

s:=s||'NT,PARAM_USE_SKILL) values (''SHOW_RSS_FEED'',''Y'',''Publish RSS feed'',''Y'',''If set to "<b>Yes</b>", RSS fead is published on URL &G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:RSS. Also RSS feed logo is shown in blog reader global page.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKIL';

s:=s||'L) values (''SHOW_VISITOR_PAGE'',''Y'',''Show visitor page/tab'',''Y'',''If set to "<b>Yes</b>", visitors map page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''SITEMAP_ENABLED'',''Y'',''Publish sitemap'',''Y'',''If set to "<b>Yes</b>", sitemap ';

s:=s||'is published on URL &G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:SITEMAP.'',''YESNO'',''N'',''AUTH'',null,''B'');'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 11220909792820014 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '9 Parameter data',
  p_sequence=> 90,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--REM INSERTING into BLOG_COUNTRY'||unistr('\000a')||
'--SET DEFINE OFF;'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AA'',''Antartica'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AC'',''Antigua and Barbuda'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AD'',''Andorra'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AE'',''United Arab Emirates'');'||unistr('\000a')||
'Insert in';

s:=s||'to BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AF'',''Afghanistan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AG'',''Antigua and Barbuda'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AI'',''Anguilla'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AL'',''Albania'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AM'',''Armenia'');'||unistr('\000a')||
'In';

s:=s||'sert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AN'',''Netherlands Antilles'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AO'',''Angola'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AR'',''Argentina'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AS'',''American Samoa'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AT'',''Au';

s:=s||'stria'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AU'',''Australia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AW'',''Aruba'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AZ'',''Azerbaijan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BA'',''Bosnia and Herzegovina'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (';

s:=s||'''BB'',''Barbados'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BD'',''Bangladesh'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BE'',''Belgium'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BF'',''Burkina Faso'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BG'',''Bulgaria'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (';

s:=s||'''BH'',''Bahrain'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BI'',''Burundi'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BJ'',''Benin'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BM'',''Bermuda'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BN'',''Brunei'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BO'',''Bolivia';

s:=s||''');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BR'',''Brazil'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BS'',''Bahamas, The'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BT'',''Bhutan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BV'',''Bouvet Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BW'',''Botswana';

s:=s||''');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BY'',''Belarus'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BZ'',''Belize'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CA'',''Canada'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CC'',''Cocos (Keeling) Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CD'',''Zai';

s:=s||'re'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CF'',''Central African Republic'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CG'',''Congo'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CH'',''Switzerland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CI'',''Cote d''''Ivoire'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) val';

s:=s||'ues (''CK'',''Cook Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CL'',''Chile'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CM'',''Cameroon'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CN'',''China'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CO'',''Colombia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''C';

s:=s||'R'',''Costa Rica'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CU'',''Cuba'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CV'',''Cape Verde'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CX'',''Christmas Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CY'',''Cyprus'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''';

s:=s||'CZ'',''Czech Republic'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DE'',''Germany'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DJ'',''Djibouti'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DK'',''Denmark'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DM'',''Dominica'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''D';

s:=s||'O'',''Dominican Republic'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DQ'',''Jarvis Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DZ'',''Algeria'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EC'',''Ecuador'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EE'',''Estonia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) val';

s:=s||'ues (''EG'',''Egypt'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EH'',''Western Sahara'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ER'',''Eritrea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ES'',''Spain'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ET'',''Ethiopia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''';

s:=s||'FI'',''Finland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FJ'',''Fiji'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FK'',''Falkland Islands (Islas Malvinas)'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FM'',''Federated States of Micronesia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FO'',''Faroe Islands'');'||unistr('\000a')||
'Insert into BLOG_COU';

s:=s||'NTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FQ'',''Baker Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FR'',''France'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GA'',''Gabon'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GB'',''United Kingdom'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GD'',''Grenada'');'||unistr('\000a')||
'Insert into BLOG_COUN';

s:=s||'TRY (COUNTRY_CODE,COUNTRY_NAME) values (''GE'',''Georgia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GF'',''French Guiana'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GH'',''Ghana'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GI'',''Gibraltar'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GK'',''Guernsey'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY';

s:=s||' (COUNTRY_CODE,COUNTRY_NAME) values (''GL'',''Greenland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GM'',''Gambia, The'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GN'',''Guinea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GO'',''Glorioso Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GP'',''Guadeloupe'');'||unistr('\000a')||
'Insert into BLOG_';

s:=s||'COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GQ'',''Equatorial Guinea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GR'',''Greece'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GS'',''South Georgia and the South Sandwich Is'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GT'',''Guatemala'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''';

s:=s||'GU'',''Guam'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GW'',''Guinea-Bissau'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GY'',''Guyana'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GZ'',''Gaza Strip'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HK'',''Hong Kong'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HM''';

s:=s||',''Heard Island & McDonald Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HN'',''Honduras'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HQ'',''Howland Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HR'',''Croatia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HT'',''Haiti'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTR';

s:=s||'Y_NAME) values (''HU'',''Hungary'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ID'',''Indonesia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IE'',''Ireland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IL'',''Israel'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IM'',''Man, Isle of'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NA';

s:=s||'ME) values (''IN'',''India'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IO'',''British Indian Ocean Territory'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IQ'',''Iraq'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IR'',''Iran'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IS'',''Iceland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNT';

s:=s||'RY_NAME) values (''IT'',''Italy'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IV'',''Ivory Coast'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JE'',''Jersey'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JM'',''Jamaica'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JN'',''Jan Mayen'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME';

s:=s||') values (''JO'',''Jordan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JP'',''Japan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JQ'',''Johnston Atoll'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JU'',''Juan De Nova Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KE'',''Kenya'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_';

s:=s||'NAME) values (''KG'',''Kyrgyzstan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KH'',''Cambodia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KI'',''Kiribati'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KM'',''Comoros'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KN'',''St. Kitts and Nevis'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,C';

s:=s||'OUNTRY_NAME) values (''KO'',''Kosovo'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KP'',''North Korea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KR'',''South Korea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KW'',''Kuwait'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KY'',''Cayman Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_COD';

s:=s||'E,COUNTRY_NAME) values (''KZ'',''Kazakhstan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LA'',''Laos'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LB'',''Lebanon'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LC'',''St. Lucia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LI'',''Liechtenstein'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,';

s:=s||'COUNTRY_NAME) values (''LK'',''Sri Lanka'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LR'',''Liberia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LS'',''Lesotho'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LT'',''Lithuania'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LU'',''Luxembourg'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COU';

s:=s||'NTRY_NAME) values (''LV'',''Latvia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LY'',''Libya'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MA'',''Morocco'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MC'',''Monaco'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MD'',''Moldova'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) val';

s:=s||'ues (''MG'',''Madagascar'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MH'',''Marshall Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MK'',''Macedonia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ML'',''Mali'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MM'',''Myanmar (Burma)'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_';

s:=s||'NAME) values (''MN'',''Mongolia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MO'',''Macau'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MP'',''Northern Mariana Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MQ'',''Martinique'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MR'',''Mauritania'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_C';

s:=s||'ODE,COUNTRY_NAME) values (''MS'',''Montserrat'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MT'',''Malta'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MU'',''Mauritius'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MV'',''Maldives'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MW'',''Malawi'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COU';

s:=s||'NTRY_NAME) values (''MX'',''Mexico'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MY'',''Malaysia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MZ'',''Mozambique'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NA'',''Namibia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NC'',''New Caledonia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUN';

s:=s||'TRY_NAME) values (''NE'',''Niger'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NF'',''Norfolk Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NG'',''Nigeria'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NI'',''Nicaragua'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NL'',''Netherlands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COU';

s:=s||'NTRY_NAME) values (''NO'',''Norway'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NP'',''Nepal'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NR'',''Nauru'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NU'',''Niue'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NZ'',''New Zealand'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) val';

s:=s||'ues (''OM'',''Oman'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PA'',''Panama'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PE'',''Peru'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PF'',''French Polynesia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PG'',''Papua New Guinea'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) va';

s:=s||'lues (''PH'',''Philippines'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PK'',''Pakistan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PL'',''Poland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PM'',''St. Pierre and Miquelon'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PN'',''Pitcairn Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CO';

s:=s||'DE,COUNTRY_NAME) values (''PR'',''Puerto Rico'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PS'',''Occupied Palestinian Territory'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PT'',''Portugal'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PU'',''Palau'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PW'',''Pacific Islands (Palau)'');'||unistr('\000a')||
'Inse';

s:=s||'rt into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PY'',''Paraguay'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''QA'',''Qatar'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RE'',''Reunion'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RO'',''Romania'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RS'',''Serbia'');'||unistr('\000a')||
'Insert into BLOG';

s:=s||'_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RU'',''Russia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RW'',''Rwanda'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SA'',''Saudi Arabia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SB'',''Solomon Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SC'',''Seychelles'');'||unistr('\000a')||
'Insert into ';

s:=s||'BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SD'',''Sudan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SE'',''Sweden'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SG'',''Singapore'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SH'',''St. Helena'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SI'',''Slovenia'');'||unistr('\000a')||
'Insert into BLOG_CO';

s:=s||'UNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SJ'',''Svalbard'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SK'',''Slovakia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SL'',''Sierra Leone'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SM'',''San Marino'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SN'',''Senegal'');'||unistr('\000a')||
'Insert into BLOG_CO';

s:=s||'UNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SO'',''Somalia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SR'',''Suriname'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ST'',''Sao Tome and Principe'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SV'',''El Salvador'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SY'',''Syria'');'||unistr('\000a')||
'Insert into ';

s:=s||'BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SZ'',''Swaziland'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TC'',''Turks and Caicos Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TD'',''Chad'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TF'',''French Southern & Antarctic Lands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) value';

s:=s||'s (''TG'',''Togo'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TH'',''Thailand'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TJ'',''Tajikistan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TK'',''Tokelau'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TM'',''Turkmenistan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''';

s:=s||'TN'',''Tunisia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TO'',''Tonga'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TP'',''East Timor'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TR'',''Turkey'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TT'',''Trinidad and Tobago'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values ';

s:=s||'(''TV'',''Tuvalu'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TW'',''Taiwan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TZ'',''Tanzania, United Republic of'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UA'',''Ukraine'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UG'',''Uganda'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME)';

s:=s||' values (''UK'',''United Kingdom'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UM'',''United States Minor Outlying Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''US'',''United States'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UV'',''Burkina Faso'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UY'',''Uruguay'');'||unistr('\000a')||
'Insert into BLO';

s:=s||'G_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UZ'',''Uzbekistan'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VA'',''Vatican'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VC'',''St. Vincent and the Grenadines'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VE'',''Venezuela'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WE'',''West Ban';

s:=s||'k'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WF'',''Wallis and Futuna'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VG'',''British Virgin Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VI'',''Virgin Islands'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VN'',''Vietnam'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME';

s:=s||') values (''WQ'',''Wake Island'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WS'',''Western Samoa'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VU'',''Vanuatu'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''XX'',''(Unknown)'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''YE'',''Yemen'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME';

s:=s||') values (''YT'',''Mayotte'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''YU'',''Yugoslavia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZA'',''South Africa'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZM'',''Zambia'');'||unistr('\000a')||
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZW'',''Zimbabwe'');'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10836607886469854 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '10 Country data',
  p_sequence=> 100,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--REM INSERTING into BLOG_AUTHOR'||unistr('\000a')||
'--SET DEFINE OFF;'||unistr('\000a')||
'INSERT INTO blog_author('||unistr('\000a')||
'email'||unistr('\000a')||
',user_name'||unistr('\000a')||
',passwd'||unistr('\000a')||
',author_name'||unistr('\000a')||
',author_seq'||unistr('\000a')||
',bio'||unistr('\000a')||
') VALUES ('||unistr('\000a')||
'''admin@bexample.org'''||unistr('\000a')||
',''ADMIN'''||unistr('\000a')||
',blog_pw_hash(''ADMIN'',''admin'')'||unistr('\000a')||
',''Administrator'''||unistr('\000a')||
',1'||unistr('\000a')||
',''<p>'''||unistr('\000a')||
'||''<span style="margin-left:40px">Blog Generic Administrator</span>'''||unistr('\000a')||
'|| ''<img alt="My Blog Administrator" src="#IMAGE_PREFIX#menu/student_bx_128x128.png" style="width:128';

s:=s||'px;height:128px;float:left" />'''||unistr('\000a')||
'|| ''</p>'''||unistr('\000a')||
');';

wwv_flow_api.create_install_script(
  p_id => 10836804004471719 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '11 Insert admin',
  p_sequence=> 110,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--REM INSERTING into BLOG_LONG_TEXT'||unistr('\000a')||
'--SET DEFINE OFF;'||unistr('\000a')||
'Insert into BLOG_LONG_TEXT (LONG_TEXT_ID,LONG_TEXT_DESCRIPTION) values (''ABOUT'',''About page text'');'||unistr('\000a')||
'Insert into BLOG_LONG_TEXT (LONG_TEXT_ID,LONG_TEXT_DESCRIPTION) values (''DISCLAIMER'',''Blog site disclaimer'');'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 10837019519479651 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '12 Long text',
  p_sequence=> 120,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'ALTER TABLE  BLOG_ARTICLE ADD CONSTRAINT BLOG_ARTICLE_FK1 FOREIGN KEY (AUTHOR_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_AUTHOR (AUTHOR_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE ADD CONSTRAINT BLOG_ARTICLE_FK2 FOREIGN KEY (CATEGORY_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_CATEGORY (CATEGORY_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_LOG ADD CONSTRAINT BLOG_ARTICLE_LOG_FK1 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTIC';

s:=s||'LE_ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_AUTHOR ADD CONSTRAINT BLOG_AUTHOR_FK1 FOREIGN KEY (AUTHOR_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_CATEGORY_LOG ADD CONSTRAINT BLOG_CATEGORY_LOG_FK1 FOREIGN KEY (CATEGORY_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_CATEGORY (CATEGORY_ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK1 FOREIG';

s:=s||'N KEY (USER_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK2 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK3 FOREIGN KEY (PARENT_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_COMMENT (COMMENT_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT_NOTIFY ADD CONSTRAINT BLOG_COMME';

s:=s||'NT_NOTIFY_FK1 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT_NOTIFY ADD CONSTRAINT BLOG_COMMENT_NOTIFY_FK2 FOREIGN KEY (USER_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ON DELETE CASCADE DISABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_CONTACT_MESSAGE ADD CONSTRAINT BLOG_CONTACT_MESSAGE_FK1 FOREIGN KEY (USER_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_COM';

s:=s||'MENT_USER (USER_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_FILE_LOG ADD CONSTRAINT BLOG_FILES_LOG_FK1 FOREIGN KEY (FILE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_FILE (FILE_ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_PARAM ADD CONSTRAINT BLOG_PARAM_FK1 FOREIGN KEY (PARAM_PARENT)'||unistr('\000a')||
'      REFERENCES  BLOG_PARAM (PARAM_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_FK1 FOREIGN KEY (ARTICLE_ID';

s:=s||')'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_FK1 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_FK1 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_COMMENT_LOG ADD CONSTRAINT BL';

s:=s||'OG_COMMENT_LOG_FK1 FOREIGN KEY (ARTICLE_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TABLE  BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_FK1 FOREIGN KEY (PARAM_ID)'||unistr('\000a')||
'      REFERENCES  BLOG_PARAM (PARAM_ID) ENABLE'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 10837215206481709 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 10834514095423806 + wwv_flow_api.g_id_offset,
  p_name => '13 Foreign key',
  p_sequence=> 130,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
