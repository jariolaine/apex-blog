set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>4967074027259628303
,p_default_application_id=>209020
,p_default_owner=>'BLOG'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 209020 - Blog Reader
--
-- Application Export:
--   Application:     209020
--   Name:            Blog Reader
--   Date and Time:   17:15 Wednesday September 7, 2016
--   Exported By:     Jari Laine
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.4.00.12
--   Instance ID:     63113759365424
--

-- Application Statistics:
--   Pages:                     22
--     Items:                   46
--     Computations:            46
--     Validations:             16
--     Processes:               25
--     Regions:                 34
--     Buttons:                  6
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                 15
--       Processes:              3
--       Computations:           7
--       Build Options:          1
--     Navigation:
--       Lists:                  6
--     Security:
--       Authentication:         1
--       Authorization:         26
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 4
--         Region:               6
--         Label:                5
--         List:                 3
--         Popup LOV:            1
--         Button:               1
--         Report:               6
--       LOVs:                   2
--       Shortcuts:             20
--       Plug-ins:               9
--     Globalization:
--       Messages:              73
--     Reports:
--   Supporting Objects:  Included
--     Install scripts:         16
--     Validations:              3

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,209020)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'BLOG')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Blog Reader')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BLOG209020')
,p_application_group=>11245122453116684
,p_application_group_name=>'Blog'
,p_application_group_comment=>'APEX blogging platform'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'4DC18F44D89444E71B1FF26A7D89E0F7A174335914DB4B6F88E429DA1B788FB7'
,p_checksum_salt_last_reset=>'20130401112716'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>7200
,p_max_session_idle_sec=>1800
,p_compatibility_mode=>'4.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'&G_DATE_FORMAT.'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(40122212111206859713)
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:19'
,p_application_tab_set=>0
,p_logo_image=>'TEXT:&G_BLOG_NAME.'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'r2.9.0.2'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T:O:W'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'N'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'blog_log.apex_error_handler'
,p_default_error_display_loc=>'INLINE_IN_NOTIFICATION'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20160907171013'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(39886703478971858715)
,p_name=>'PHOTO_GALLERY'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT NULL AS list_level',
'  ,f.description',
'  ,NULL AS link_target',
'  ,''YES'' is_current',
'  ,apex_util.prepare_url(''f?p='' || :APP_ID || '':DOWNLOAD:0:'' || f.file_name, NULL, ''PUBLIC_BOOKMARK'') AS img_url',
'FROM blog_file f',
'WHERE f.file_type = ''GALLERY''',
'  AND f.active = ''Y''',
''))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40120031213803106742)
,p_name=>'CATEGORIES'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  NULL AS link_level',
'  ,apex_escape.html(c.category_name) AS link_text',
'  ,apex_util.prepare_url(''f?p='' || :APP_ALIAS || '':READCAT:0::::CATEGORY:'' || c.category_id, NULL, ''PUBLIC_BOOKMARK'') AS target',
'  ,CASE WHEN :APP_PAGE_ID = 4 AND :CATEGORY = c.category_id',
'   THEN ''YES''',
'   ELSE ''NO''',
'   END AS is_current',
'FROM #OWNER#.blog_category c',
'WHERE EXISTS(',
'  SELECT 1 ',
'  FROM #OWNER#.blog_article a',
'  WHERE a.category_id = c.category_id',
'    AND a.active = ''Y''',
')',
'ORDER BY c.category_seq'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40120031389346109111)
,p_name=>'LATEST_ARTICLES'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'WITH qry AS(',
'  SELECT /*+ first_rows(5) */',
'     ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn',
'    ,a.article_title AS link_text',
'    ,apex_util.prepare_url(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS target',
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id',
'     THEN ''YES''',
'     ELSE ''NO''',
'     END AS is_current',
'  FROM #OWNER#.blog_article_last20 a',
')',
'SELECT',
'  NULL AS link_level',
'  ,qry.link_text',
'  ,qry.target',
'  ,qry.is_current',
'FROM qry',
'WHERE qry.rn <= 5',
'ORDER BY qry.rn'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40120031596272111068)
,p_name=>'MOST_CLICKED_ARTICLES'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'WITH qry AS (',
'  SELECT /*+ first_rows(5) */',
'     ROW_NUMBER() OVER (ORDER BY a.top_article DESC) rn',
'    ,a.article_title AS link_text',
'    ,apex_util.prepare_url(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'')  AS target',
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id',
'     THEN ''YES''',
'     ELSE ''NO''',
'     END AS is_current',
'  FROM #OWNER#.blog_article_top20 a',
') ',
'SELECT',
'  NULL AS link_level',
'  ,qry.link_text',
'  ,qry.target',
'  ,qry.is_current',
'FROM qry',
'WHERE qry.rn <= 5',
'ORDER BY qry.rn'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40120031804584113507)
,p_name=>'MOST_DAY_HIT_ARTICLES'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'WITH qry AS (',
'  SELECT /*+ first_rows(5) */',
'     ROW_NUMBER() OVER (ORDER BY a.top_hit DESC) rn',
'    ,a.article_title AS link_text',
'    ,apex_util.prepare_url(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS target',
'    ,CASE WHEN :APP_PAGE_ID = 3 AND :ARTICLE = a.article_id',
'     THEN ''YES''',
'     ELSE ''NO''',
'     END AS is_current',
'  FROM #OWNER#.blog_article_hit20 a',
')',
'SELECT',
'  NULL AS link_level',
'  ,qry.link_text',
'  ,qry.target',
'  ,qry.is_current',
'FROM qry',
'WHERE qry.rn <= 5',
'ORDER BY qry.rn'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(40123416636996110259)
,p_name=>'TABS'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40123416840104110308)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'HOME'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:HOME:0'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,2,3,4,5,9,23,201'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39896715546336084827)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'DISCLAIMER'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:DISCLAIMER:0'
,p_security_scheme=>wwv_flow_api.id(39896717934259090401)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40076202265973083052)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'RESOURCE'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:RESOURCES:0'
,p_security_scheme=>wwv_flow_api.id(40075865455796876498)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39886699567733693873)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'PHOTO'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:PHOTOS:0'
,p_security_scheme=>wwv_flow_api.id(39886722681325477546)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40076202460365085614)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'FILE'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:FILES:0'
,p_security_scheme=>wwv_flow_api.id(40075870469635356209)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40076202654974088230)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'VISITOR'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:VISITORS:0'
,p_security_scheme=>wwv_flow_api.id(40075862654767816150)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39961035484013746505)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'ABOUT'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:ABOUT:0'
,p_security_scheme=>wwv_flow_api.id(39961033589213713689)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40075882855950196524)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'FAQ'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:FAQ:0'
,p_security_scheme=>wwv_flow_api.id(40075928553054290123)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40075434758774484992)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'AUTHOR'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:AUTHORS:0'
,p_security_scheme=>wwv_flow_api.id(40075870763381359069)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(40062375307519674058)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'CONTACT'
,p_list_item_link_target=>'f?p=&APP_ALIAS.:CONTACT:0'
,p_security_scheme=>wwv_flow_api.id(40062374723693666567)
,p_required_patch=>wwv_flow_api.id(39895229831671791632)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(39875796204732529767)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(39875796311931529767)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(40120024218726039844)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'Yes'
,p_attribute_03=>'N'
,p_attribute_04=>'No'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39886310386943646791)
,p_name=>'FILE_DOWNLOAD_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'FILE_DOWNLOAD_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39886722681325477546)
,p_name=>'SHOW_PHOTOS_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_PHOTOS_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39887430170041971148)
,p_name=>'NOTIFICATION_EMAIL_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'NOTIFICATION_EMAIL_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39890167367057304989)
,p_name=>'RATING_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'RATING_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39890167875647346584)
,p_name=>'TWEET_BTN_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'TWEET_BTN_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39890168169393349569)
,p_name=>'FACEBOOK_BTN_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'FACEBOOK_BTN_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39892672344004451984)
,p_name=>'MODERATION_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'MODERATION_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39892825025177703730)
,p_name=>'SITEMAP_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SITEMAP_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39893287185876696859)
,p_name=>'GOOGLE_PLUS_ONE_BTN_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'GOOGLE_PLUS_ONE_BTN_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39893295070428871214)
,p_name=>'GOOGLE_SHARE_BTN_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'GOOGLE_SHARE_BTN_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39896717934259090401)
,p_name=>'SHOW_DISCLAIMER_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_DISCLAIMER_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39897421636957241920)
,p_name=>'ALLOW_COMMENT'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'ALLOW_COMMENT'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39903243769229075234)
,p_name=>'SHOW_FOOTER'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_FOOTER'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(39961033589213713689)
,p_name=>'SHOW_ABOUT_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_ABOUT_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40052862102538418540)
,p_name=>'COMMENT_VERIFY_QUESTION'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'COMMENT_VERIFY_QUESTION'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40053064895177858729)
,p_name=>'SHOW_BLOG_DESCRIPTION'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_BLOG_DESCRIPTION'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40053065590851875881)
,p_name=>'RSS_FEED_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'RSS_FEED_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40062374723693666567)
,p_name=>'SHOW_CONTACT_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_CONTACT_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40064376212326382094)
,p_name=>'SHOW_BLOG_REPORT'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_BLOG_REPORT'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075597747842057988)
,p_name=>'LOGGING_ENABLED'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'LOGGING_ENABLED'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075862654767816150)
,p_name=>'SHOW_VISITOR_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_VISITOR_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075865455796876498)
,p_name=>'SHOW_RESOURCE_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_RESOURCE_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075870469635356209)
,p_name=>'SHOW_FILE_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_FILE_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075870763381359069)
,p_name=>'SHOW_AUTHOR_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_AUTHOR_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075875655877839131)
,p_name=>'SHOW_RESOURCE_REPORT'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_RESOURCE_REPORT'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(40075928553054290123)
,p_name=>'SHOW_FAQ_PAGE'
,p_scheme_type=>'PLUGIN_ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_attribute_01=>'SHOW_FAQ_PAGE'
,p_error_message=>'This feature is currently disabled.'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(39897070234633044309)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initialize session'
,p_process_sql_clob=>':G_USER_ID := #OWNER#.blog_util.init_session(:APP_ID, :APP_SESSION);'
,p_process_error_message=>'Error on process: Initialize session'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(40123373933172641797)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirect to search page'
,p_process_sql_clob=>'apex_util.redirect_url(''f?p='' || :APP_ALIAS || '':SEARCH:0'');'
,p_process_error_message=>'Error on process: Redirect to search page'
,p_process_when=>'P0_SEARCH'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(40076211364825349835)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirect to archives'
,p_process_sql_clob=>'apex_util.redirect_url(''f?p='' || :APP_ALIAS || '':ARCHIVES:0'');'
,p_process_error_message=>'Error on process: Redirect to archives'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P0_ARCHIVES'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40284979730721417884)
,p_name=>'ARTICLE'
,p_protection_level=>'N'
,p_item_comment=>'Article id'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40285180109428449627)
,p_name=>'CATEGORY'
,p_protection_level=>'N'
,p_item_comment=>'Category id'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40062321206334259501)
,p_name=>'G_ARTICLE_ROWS'
,p_protection_level=>'I'
,p_item_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'How many articles per page shown in home page.',
'This should be stored to BLOG_PARAM_APP materialized view for performance.'))
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40123454619005570504)
,p_name=>'G_BASE_URL'
,p_protection_level=>'I'
,p_item_comment=>'This should be stored to BLOG_PARAM_APP materialized view for performance.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40123454026985566767)
,p_name=>'G_BLOG_NAME'
,p_protection_level=>'I'
,p_item_comment=>'This should be stored to BLOG_PARAM_APP materialized view for performance.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39886018782117160179)
,p_name=>'G_CANONICAL_HREF'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40071062555295062523)
,p_name=>'G_COMMENT_ROWS'
,p_protection_level=>'I'
,p_item_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'How many comments per page show for article.',
'This should be stored to BLOG_PARAM_APP materialized view for performance.'))
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39896723651937355620)
,p_name=>'G_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'This should be stored to BLOG_PARAM_APP materialized view for performance.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40115515484236467478)
,p_name=>'G_HTML_HEADER'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39886676969079100705)
,p_name=>'G_PAGE_TITLE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39886677167138101650)
,p_name=>'G_REGION_TITLE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40123454816202571768)
,p_name=>'G_RSS_FEED_URL'
,p_protection_level=>'I'
,p_item_comment=>'This should be stored to BLOG_PARAM_APP materialized view for performance.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40069967643160419979)
,p_name=>'G_THEME_PATH'
,p_protection_level=>'I'
,p_item_comment=>'This should be stored to BLOG_PARAM_APP materialized view for performance.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40075159246865825756)
,p_name=>'G_USER_ID'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39961709200479795670)
,p_name=>'SUBSCRIBER_ID'
,p_protection_level=>'B'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886672762455027899)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_RSS'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_RSS'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886675567378071111)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_SEARCH'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_SEARCH'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886684491612226994)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_ARCHIVES'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_ARCHIVES'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886686470225282529)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_CATEGORIES'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_CATEGORIES'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886688295001301365)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_LATEST_ARTICLE'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_LATEST_ARTICLES'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886689392832317640)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_MOST_CLICKED'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_MOST_CLICKED'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(39886690175795325528)
,p_computation_sequence=>10
,p_computation_item=>'P0_REGION_TITLE_MOST_HITS'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'apex_lang.message(''REGION_ZERO_TITLE_MOST_HITS'')'
);
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(39961610794568803770)
,p_lov_name=>'ARCHIVE_MONTHS'
,p_lov_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  TO_CHAR(l.year_month,''fmMonth, YYYY "('' || l.article_count || '')"'') AS d,',
'  l.year_month_num',
'FROM blog_archive_lov l',
'ORDER BY l.year_month_num DESC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(39961592487925221873)
,p_lov_name=>'SEARCH_TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(39961592487925221873)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(39961592673550221904)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Title and Text'
,p_lov_return_value=>'ALL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(39961592981284221955)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Only Title'
,p_lov_return_value=>'TITLE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(39961593301417221956)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Only Text'
,p_lov_return_value=>'TEXT'
);
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(40075847456451220850)
,p_group_name=>'GENERAL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(40076000449189847992)
,p_group_name=>'READER'
,p_group_desc=>'These pages activity is reported in blog admin'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(39897321954549875493)
,p_theme_id=>202
,p_name=>'Minimal'
,p_is_popup=>false
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<head>',
'#HEAD#',
'</head>',
'<body>'))
,p_box=>'#BODY#'
,p_footer_template=>'</body></html>'
,p_theme_class_id=>9
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(39935334359879687157)
,p_theme_id=>202
,p_name=>'Error page'
,p_is_popup=>false
,p_css_file_urls=>'&G_THEME_PATH.style.min.css?v=#APP_VERSION#'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'<title>#TITLE#</title>',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />',
'<meta name="robots" value="noindex" />',
'#HEAD#',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'</head>',
'<body #ONLOAD#>',
'#FORM_OPEN#',
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="header-container">',
' <div id="header">',
'  <div id="title">',
'   <h1><a href="&HOME_LINK.">#LOGO#</a></h1>',
'   #REGION_POSITION_03#',
'  </div>',
'  <div id="menu">#REGION_POSITION_04#</div>',
' </div>',
'</div>',
'<div id="page-body">',
'<div id="wrap"> ',
' <div id="center">',
'  #GLOBAL_NOTIFICATION#',
'  #SUCCESS_MESSAGE#',
'  #NOTIFICATION_MESSAGE#',
'  #BODY#',
' </div>',
' <div class="clear"></div>',
'</div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#"><img src="#IMAGE#" alt="#TEXT#" title="#TEXT#"/>#TEXT#</a>',
'',
''))
,p_region_table_cattributes=>'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" '
,p_sidebar_def_reg_pos=>'REGION_POSITION_05'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_03'
,p_theme_class_id=>8
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="errcontainer">',
' <p class="fielddatabold">#MESSAGE#</p>',
' <p class="fielddata"><a href="&HOME_LINK.">#RETURN_TO_APPLICATION#</a></p>',
'</div>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(39961492601395645791)
,p_theme_id=>202
,p_name=>'Login'
,p_is_popup=>false
,p_css_file_urls=>'&G_THEME_PATH.style.min.css?v=#APP_VERSION#'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'<title>#TITLE#</title>',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />',
'<meta name="robots" value="noindex" />',
'#HEAD#',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'</head>',
'<body #ONLOAD#>',
'#FORM_OPEN#',
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="login">',
' <div id="login-messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
' <div id="login-main">#BODY#</div>',
'</div>',
''))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0"'
,p_theme_class_id=>6
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_translate_this_template=>'N'
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(40879158912557170148)
,p_theme_id=>202
,p_name=>'No Tabs with Right Side Bar'
,p_is_popup=>false
,p_css_file_urls=>'&G_THEME_PATH.style.min.css?v=#APP_VERSION#'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'<title>#TITLE#</title>',
'#REGION_POSITION_01#',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="icon" />',
'<link type="image/x-icon" href="&G_THEME_PATH.favicon.ico" rel="shortcut icon" />',
'#HEAD#',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'&G_HTML_HEADER.',
'</head>',
'<body #ONLOAD#>',
'#FORM_OPEN#',
'<a id="PAGE_TOP" name="PAGE_TOP"></a>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="header-container">',
' <div id="header">',
'  <div id="title">',
'   <h1>',
'    <a href="&HOME_LINK.">#LOGO#</a>',
'   </h1>',
'   #REGION_POSITION_03#',
'  </div>',
'  <div id="menu">#REGION_POSITION_04#</div>',
' </div>',
'</div>',
'<div id="mainbody">',
'<div id="wrap"> ',
' <div id="center">',
'  #GLOBAL_NOTIFICATION#',
'  #SUCCESS_MESSAGE#',
'  #NOTIFICATION_MESSAGE#',
'  #BODY#',
' </div>',
' <div class="right">#REGION_POSITION_05#</div>',
' <div class="clear"></div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' #REGION_POSITION_08#',
'</div>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="Remove" />#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#"><img src="#IMAGE#" alt="#TEXT#" title="#TEXT#"/>#TEXT#</a>',
'',
''))
,p_region_table_cattributes=>'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" '
,p_sidebar_def_reg_pos=>'REGION_POSITION_05'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_03'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="errcontainer">',
' <p class="fielddatabold">#MESSAGE#</p>',
' <p class="fielddata"><a href="&HOME_LINK.">#RETURN_TO_APPLICATION#</a></p>',
'</div>'))
,p_grid_type=>'TABLE'
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(40075508050872720857)
,p_template_name=>'Button'
,p_template=>'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-gray" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span>#LABEL#</span></button>'
,p_hot_template=>'<button value="#LABEL#" onclick="#JAVASCRIPT#" class="button-alt1" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span>#LABEL#</span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>202
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(39936948576526595655)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="footer #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'Footer Region'
,p_theme_id=>202
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(40054908876230646712)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="borderlessregion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#><h2>#TITLE#</h2><div class="regionbody">#BODY#</div></div>',
''))
,p_page_plug_template_name=>'Borderless Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>202
,p_theme_class_id=>7
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(40075969247190729176)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="hideMe508 #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'jQuery Modal Region Template'
,p_theme_id=>202
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(40110796863696125902)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="reportsregion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'<h2>#TITLE#</h2>',
'<div class="regionbody">#BODY#</div>',
'</div>',
'',
''))
,p_page_plug_template_name=>'Report Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>202
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(40120032802433124984)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#><h2>#TITLE#</h2>#BODY#</div>',
''))
,p_page_plug_template_name=>'Sidebar Region'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>202
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(40120032998587124987)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#BODY#</div>',
''))
,p_page_plug_template_name=>'Region without Title'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>202
,p_theme_class_id=>11
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(39886703093807758931)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
' <img src="#IMAGE#" #IMAGE_ATTR# alt="#IMAGE_ALT#" />',
' <div class="bjqs-caption">#TEXT#</div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li>',
' <img src="#IMAGE#" #IMAGE_ATTR# alt="#IMAGE_ALT#" />',
' <div class="bjqs-caption">#TEXT#</div>',
'</li>'))
,p_list_template_name=>'Photo Gallery'
,p_theme_id=>202
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul class="bjqs">'
,p_list_template_after_rows=>' </ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(40120032198266120576)
,p_list_template_current=>'<li><span style="font-weight:bold;">#TEXT#</span></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Sidebar List'
,p_theme_id=>202
,p_theme_class_id=>19
,p_list_template_before_rows=>'<ul>'
,p_list_template_after_rows=>' </ul>'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(40879166094889334770)
,p_list_template_current=>'<li class="current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Tab List'
,p_theme_id=>202
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul>'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(39961038376631810701)
,p_row_template_name=>'Long text'
,p_row_template1=>'<div>#LONG_TEXT#</div>'
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>202
,p_theme_class_id=>11
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(39961663273318381048)
,p_row_template_name=>'Articles'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="article">',
' <div class="article-title">',
'  <h2>#ARTICLE_TITLE#</h2>',
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>',
' </div>',
' <div class="article-body">#ARTICLE_TEXT#</div>',
' <br/>',
'</div>'))
,p_row_template_condition1=>'not apex_authorization.is_authorized(''ALLOW_COMMENT'')'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="article">',
' <div class="article-title">',
'  <h2>#ARTICLE_TITLE#</h2>',
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>',
' </div>',
' <div class="article-body">#ARTICLE_TEXT#</div>',
' <div class="comment">#VIEW_COMMENT#</div>',
'</div>'))
,p_row_template_condition2=>'#COMMENT_COUNT# > 0'
,p_row_template3=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="article">',
' <div class="article-title">',
'  <h2>#ARTICLE_TITLE#</h2>',
'  <h3>#CATEGORY_TXT# #CATEGORY_NAME# / #CREATED_ON_TXT# #CREATED_ON# #POSTED_BY_TXT# #AUTHOR_NAME#</h3>',
' </div>',
' <div class="article-body">#ARTICLE_TEXT#</div>',
' <div class="comment">#POST_COMMENT#</div>',
'</div>'))
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#PAGINATION#',
'<span role="alert" style="display:none;" id="modal_LOADER">',
' <img src="#IMAGE_PREFIX#ws/ajax-loader.gif" alt="Processing Request" />',
'</span>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span id="articlepages">#TEXT#</span>'
,p_next_page_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.next.png" alt="#PAGINATION_NEXT#" title="#PAGINATION_NEXT#" /></a>'
,p_previous_page_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.prev.png" alt="#PAGINATION_PREVIOUS#" title="#PAGINATION_PREVIOUS#" /></a>'
,p_next_set_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.next.gif" alt="#PAGINATION_NEXT_SET#" title="#PAGINATION_NEXT_SET#" /></a>'
,p_previous_set_template=>'<a href="#LINK#"><img src="&G_THEME_PATH.prev.gif" alt="#PAGINATION_PREVIOUS_SET#" title="#PAGINATION_PREVIOUS_SET#" /></a>'
,p_theme_id=>202
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(40076502642034533531)
,p_row_template_name=>'FAQ'
,p_row_template1=>'<h3 class="question"><span>#FAQ_NO#</span>&nbsp;#QUESTION#</h3><div class="answer">#ANSWER#</div>'
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>202
,p_theme_class_id=>10
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(40080423644503574383)
,p_row_template_name=>'Authors'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a id="#AUTHOR_ID#" name="#AUTHOR_ID#"></a>',
'<h2 class="author-name">#AUTHOR_NAME#</h2>',
'<div class="author-bio">#BIO#</div>',
''))
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>202
,p_theme_class_id=>8
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(40110839141350442448)
,p_row_template_name=>'Comments'
,p_row_template1=>'<div class="comment-text"><h3>#CREATED_TXT# #CREATED_ON# #POSTED_BY_TXT# #POSTED_BY#</h3>#COMMENT_TEXT#</div>'
,p_row_template_before_rows=>'<div id="comments"><h2>Comments</h2>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
''))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a rel="nofollow" href="#LINK#">#PAGINATION_PREVIOUS#&nbsp;<img src="&G_THEME_PATH.next.png" align="absmiddle" alt="#PAGINATION_PREVIOUS#" /></a>'
,p_previous_page_template=>'<a rel="nofollow" href="#LINK#"><img src="&G_THEME_PATH.prev.png" align="absmiddle" alt="#PAGINATION_NEXT#" />&nbsp;#PAGINATION_NEXT#</a>'
,p_next_set_template=>'<a rel="nofollow" href="#LINK#">#PAGINATION_PREVIOUS#&nbsp;<img src="&G_THEME_PATH.nextset.png" align="absmiddle" alt="#PAGINATION_PREVIOUS#" /></a>'
,p_previous_set_template=>'<a rel="nofollow" href="#LINK#"><img src="&G_THEME_PATH.prevset.png" align="absmiddle" alt="#PAGINATION_NEXT#" />&nbsp;#PAGINATION_NEXT#</a>'
,p_theme_id=>202
,p_theme_class_id=>9
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(40287792719329417690)
,p_row_template_name=>'Horizontal Border'
,p_row_template1=>'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" style="width:100%">#TOP_PAGINATION#<tr><td>',
'<table cellpadding="0" border="0" cellspacing="0" summary="" class="HorizontalBorder" id="report_data_#REGION_STATIC_ID#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table></td></tr>',
'#PAGINATION#',
'<tr><td colspan="#COLCOUNT#">#EXTERNAL_LINK##CSV_LINK#</td></tr></table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span>#TEXT#</span>'
,p_next_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.next.png" alt="Next" /></a>'
,p_previous_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.prev.png" alt="Previous" /></a>'
,p_next_set_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="&G_THEME_PATH.nextset.png" alt="Next" /></a>'
,p_previous_set_template=>'<a href="#LINK#"><img style="vertical-align:middle"" src="&G_THEME_PATH.prevset.png" alt="Previous" /></a>'
,p_theme_id=>202
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(40287792719329417690)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(39897068156335907551)
,p_template_name=>'Optional Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#">'
,p_template_body2=>'</label>'
,p_theme_id=>202
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(39961478580778709119)
,p_template_name=>'Required Label'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><img src="&G_THEME_PATH.required.png" alt="#VALUE_REQUIRED#" /><span class="optionallabel">'
,p_template_body2=>'</span></label>'
,p_theme_id=>202
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(40070701838203592139)
,p_template_name=>'Optional Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a href="##CURRENT_ITEM_NAME#" class="helplabel" tabindex="999">'
,p_template_body2=>'<div class="htmltooltip">#CURRENT_ITEM_HELP_TEXT#</div></a></label>'
,p_theme_id=>202
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(40070701942359593396)
,p_template_name=>'Required Label with Help'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><img src="&G_THEME_PATH.required.png" alt="#VALUE_REQUIRED#" /><a href="##CURRENT_ITEM_NAME#" class="helplabel" tabindex="999">'
,p_template_body2=>'<div>#CURRENT_ITEM_HELP_TEXT#</div></a></label>'
,p_theme_id=>202
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(40879134601304522628)
,p_template_name=>'No Label'
,p_template_body1=>'<span class="hideMe508">'
,p_template_body2=>'</span>'
,p_theme_id=>202
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(40879135891829522629)
,p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif'
,p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<link href="&G_THEME_PATH.style#MIN#.css" rel="stylesheet" type="text/css"/>',
'',
'</head>'))
,p_page_body_attr=>'onload="first_field()" style="margin:0;"'
,p_before_field_text=>'<div class="PopupHead">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next >'
,p_prev_button_text=>'< Previous'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="PopupBody">'
,p_theme_id=>202
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(40879136016414522629)
,p_theme_id=>202
,p_theme_name=>'Blog Blue'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(40879158912557170148)
,p_error_template=>wwv_flow_api.id(39935334359879687157)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(40879128710930522623)
,p_default_button_template=>wwv_flow_api.id(40075508050872720857)
,p_default_region_template=>wwv_flow_api.id(40110796863696125902)
,p_default_report_template=>wwv_flow_api.id(40287792719329417690)
,p_default_label_template=>wwv_flow_api.id(40070701838203592139)
,p_default_list_template=>wwv_flow_api.id(40120032198266120576)
,p_default_option_label=>wwv_flow_api.id(40879134795422522628)
,p_default_required_label=>wwv_flow_api.id(40879135021106522628)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(202),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(39895229831671791632)
,p_build_option_name=>'Not ready'
,p_build_option_status=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885944485991908354)
,p_name=>'REGION_TITLE_FILES'
,p_message_text=>'My Shared Files'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885948262527131894)
,p_name=>'REGION_TITLE_AUTHOR'
,p_message_text=>'About Author'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885949583385198172)
,p_name=>'REGION_TITLE_VISITOR_MAP'
,p_message_text=>'Visitors by Country'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885950388117211196)
,p_name=>'REGION_TITLE_DISCLAIMER'
,p_message_text=>'Disclaimer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885952382485244150)
,p_name=>'REGION_TITLE_FAQ'
,p_message_text=>'Frequently Asked Questions'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885953482257259435)
,p_name=>'REGION_TITLE_ABOUT'
,p_message_text=>'About'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885955277894322285)
,p_name=>'REGION_TITLE_BLOGROLL'
,p_message_text=>'Blogroll'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885955766680327496)
,p_name=>'REGION_TITLE_USEFUL_LINKS'
,p_message_text=>'Useful Links'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39885956963001344330)
,p_name=>'REGION_TITLE_CONTACT'
,p_message_text=>'Contact'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886011474823201452)
,p_name=>'BLOG_FOOTER'
,p_message_text=>'All the information on this website is published in good faith and for general information purpose only. &G_BASE_URL. does not make any warranties about the completeness, reliability and accuracy of this information. Any action you take upon the info'
||'rmation you find on this website (&G_BASE_URL.), is strictly at your own risk. &G_BASE_URL. will not be liable for any losses and/or damages in connection with the use of our website'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886309266686109252)
,p_name=>'MSG_CONTACT_FORM'
,p_message_text=>'Please free to contact us using this form.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886649763928541076)
,p_name=>'TEXT_CATEGORY'
,p_message_text=>'Category'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886650064131556132)
,p_name=>'TEXT_POSTED_ON'
,p_message_text=>'Posted on'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886650289783559470)
,p_name=>'TEXT_POSTED_BY'
,p_message_text=>'by'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886650482019563069)
,p_name=>'TEXT_VIEW_COMMENTS'
,p_message_text=>'View Comments'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886650674255566669)
,p_name=>'TEXT_POST_COMMENT'
,p_message_text=>'Post a Comment'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886650875968581054)
,p_name=>'REGION_TITLE_ARCHIVES'
,p_message_text=>'Archives: %0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886652288008621036)
,p_name=>'REGION_TITLE_COMMENT'
,p_message_text=>'Please Enter Your Comment for Article:<br/><h2>%0</h2>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886662782443836290)
,p_name=>'PAGE_TITLE_AUTHOR'
,p_message_text=>'Author'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886665265825859231)
,p_name=>'PAGE_TITLE_VISITOR'
,p_message_text=>'Visitors'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886666072283871359)
,p_name=>'PAGE_TITLE_FILES'
,p_message_text=>'Files'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886667370114887598)
,p_name=>'PAGE_TITLE_RESOURCES'
,p_message_text=>'Resources'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886668766423919683)
,p_name=>'PAGE_TITLE_COMMENT'
,p_message_text=>'Submit Comment'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886670593140937667)
,p_name=>'PAGE_TITLE_SEARCH_RESULT'
,p_message_text=>'Search Result'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886673784212048164)
,p_name=>'REGION_TITLE_SEARCH_RESULT'
,p_message_text=>'Search Result'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886675276005067194)
,p_name=>'REGION_ZERO_TITLE_SEARCH'
,p_message_text=>'Search'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886688066546299402)
,p_name=>'REGION_ZERO_TITLE_LATEST_ARTICLES'
,p_message_text=>'Latest Articles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886688769984313022)
,p_name=>'REGION_ZERO_TITLE_MOST_CLICKED'
,p_message_text=>'Most Clicked Articles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886689586362320654)
,p_name=>'REGION_ZERO_TITLE_MOST_HITS'
,p_message_text=>'Most Hits per Day'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886690975782340725)
,p_name=>'REGION_TITLE_COMMENTS'
,p_message_text=>'Comments'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886693163896376592)
,p_name=>'PAGE_TITLE_CONTACT'
,p_message_text=>'Contact Form'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886693585234381905)
,p_name=>'PAGE_TITLE_ABOUT'
,p_message_text=>'About'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886695473361402571)
,p_name=>'PAGE_TITLE_DISCLAIMER'
,p_message_text=>'Disclaimer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886698968442617565)
,p_name=>'REGION_TITLE_PHOTOS'
,p_message_text=>'My Photos'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886699193446621172)
,p_name=>'PHOTO_TITLE_PHOTOS'
,p_message_text=>'My Photo Gallery'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886723986654550996)
,p_name=>'MSG_PHOTO_GALLERY'
,p_message_text=>'My favorite pictures.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886726781459842031)
,p_name=>'PAGE_TITLE_FAQ'
,p_message_text=>'FAQ'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39886734192667081964)
,p_name=>'DOWNLOAD_LINK_TITLE'
,p_message_text=>'Download'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887021875276788876)
,p_name=>'PAGE_TITLE_PHOTOS'
,p_message_text=>'Photo Gallery'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887034367636172199)
,p_name=>'HELP_COMMENT_FOLLOWUP_NOTIFY'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Check this box if you want an email sent<br/>when a new comment is posted to this article.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887035269349186632)
,p_name=>'HELP_COMMENT_COMMENT'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter your comment.<br/>Use the formatting buttons to add allowed HTML tags.<br/>Example wrap program code to &lt;code&gt; tags so it is easier to read.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887035971062201039)
,p_name=>'FOLLOWUP_NOTIFY_CHECKBOX'
,p_message_text=>'Notify me of follow-up comments via email.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887415184585482076)
,p_name=>'PAGE_TITLE_CATEGORY'
,p_message_text=>'Category: %0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887415380703483870)
,p_name=>'REGION_TITLE_CATEGORY'
,p_message_text=>'Category: %0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39887425575978775290)
,p_name=>'PAGE_TITLE_ARCHIVES'
,p_message_text=>'Archives: %0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889343892896269346)
,p_name=>'REGION_ZERO_TITLE_RSS'
,p_message_text=>'Subscribe in a Reader'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889345788016438730)
,p_name=>'REGION_ZERO_TITLE_ARCHIVES'
,p_message_text=>'Archives'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889346874848460023)
,p_name=>'REGION_ZERO_TITLE_CATEGORIES'
,p_message_text=>'Categories'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889348581293487420)
,p_name=>'BLOG_DESCRIPTION'
,p_message_text=>'Blogging about all stuff'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889348782575502081)
,p_name=>'RSS_DESCRIPTION'
,p_message_text=>'&G_BLOG_NAME. most recent articles'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889348970041538271)
,p_name=>'NEW_COMMENT_EMAIL_BODY'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Hi #AUTHOR_NAME#,',
'',
'New comment is posted to article "#ARTICLE_TITLE#".',
'#ARTICLE_URL#',
'',
'Best regards,',
'#BLOG_NAME#'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889349193967542368)
,p_name=>'NEW_COMMENT_EMAIL_SUBJ'
,p_message_text=>'New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889349375851550736)
,p_name=>'FOLLOWUP_EMAIL_BODY'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Hi #NICK_NAME#,',
'',
'You have chosen to receive follow up notification if new comment is posted to article "#ARTICLE_TITLE#".',
'To follow up the article new comment(s), please go to:',
'#ARTICLE_URL#',
'',
'If you wish not get notification email in future please go to:',
'#UNSUBSCRIBE_URL#',
'',
'Best regards,',
'#BLOG_NAME#'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39889349570891553041)
,p_name=>'FOLLOWUP_EMAIL_SUBJ'
,p_message_text=>'New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39890152994390238425)
,p_name=>'LABEL_RATE_ARTICLE'
,p_message_text=>'Please rate this articlet. Stars shows current rating for this article.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39890160981544721030)
,p_name=>'DIALOG_ARTICLE_RATED'
,p_message_text=>'Thank you for rating this article.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39890162188186037011)
,p_name=>'LABEL_RATED_ARTICLE'
,p_message_text=>'Stars shows rating for this article. You have already rated this article.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39892667621680849430)
,p_name=>'MSG_NO_HTML'
,p_message_text=>'Note! Message can''t contain HTML command characters (<>").'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39892671638218409063)
,p_name=>'MSG_MODERATION_ENABLED'
,p_message_text=>'Comment moderation has been enabled. All comments must be approved by the blog author.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39892677723695507003)
,p_name=>'MSG_ALLOWED_HTML_TAGS'
,p_message_text=>'You can use <b>, <i>, <u> and <code> HTML tags.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39895589930209463460)
,p_name=>'HELP_COMMENT_NICK_NAME'
,p_message_text=>'Please enter your name.<br/>It will be displayed in comment posted by.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39895592644214472116)
,p_name=>'HELP_COMMENT_LAST_NAME'
,p_message_text=>'Please enter your last name.<br/>It will be displayed in comment posted by.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39895594556926481440)
,p_name=>'HELP_COMMENT_EMAIL'
,p_message_text=>'Please enter your email address.<br/>It will not be displayed for others.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39895595959717495301)
,p_name=>'HELP_COMMENT_WEBSITE'
,p_message_text=>'Optionally please enter your website address.<br/>It will not be displayed for others.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39897212536911383702)
,p_name=>'VALIDATION_COMMENT_LENGTH'
,p_message_text=>'%0 maximum length is %1 characters.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39897212755014390492)
,p_name=>'VALIDATION_COMMENT_FORMAT'
,p_message_text=>'%0 is not valid. Please check e.g. allowed HTML tags are entered properly.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39897251640881456283)
,p_name=>'VALIDATION_MATH_QUESTION'
,p_message_text=>'%0 wasn''t correct.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39936940275436367223)
,p_name=>'GENERAL_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39961533489939037620)
,p_name=>'FAQ_QUESTION'
,p_message_text=>'Q%0.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39961536579476179183)
,p_name=>'MSG_CONFIRM_COMMENT'
,p_message_text=>'Your message will be submitted after you press OK.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39961588380250061074)
,p_name=>'MSG_MATH_QUESTION'
,p_message_text=>'Please answer this simple question before you submit comment.%0'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39961589275912093510)
,p_name=>'MSG_REQUIRED_FIELDS'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'All required fields are marked with asterisk.',
''))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(39961611787011820228)
,p_name=>'MSG_SUBSCRIBE_RSS'
,p_message_text=>'Subscribe in a Reader'
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39886013171360218239)
,p_shortcut_name=>'BLOG_FOOTER'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_plugin_util.replace_substitutions(apex_lang.message(''BLOG_FOOTER''));'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39886019378870176851)
,p_shortcut_name=>'CANONICAL_URL'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN ''<link href="'' || :G_BASE_URL || :G_CANONICAL_HREF ||''" rel="canonical" />'';',
''))
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39886309563882110510)
,p_shortcut_name=>'MSG_CONTACT_FORM'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39886724283203552666)
,p_shortcut_name=>'MSG_PHOTO_GALLERY'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39887034173243169621)
,p_shortcut_name=>'HELP_COMMENT_FOLLOWUP_NOTIFY'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39887035083798179925)
,p_shortcut_name=>'HELP_COMMENT_COMMENT'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39889344768286311138)
,p_shortcut_name=>'BLOG_DESCRIPTION'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39889351892598634069)
,p_shortcut_name=>'RSS_DESCRIPTION'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_plugin_util.replace_substitutions(apex_lang.message(''RSS_DESCRIPTION''));'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39890152664210237186)
,p_shortcut_name=>'LABEL_RATE_ARTICLE'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39890164264883062958)
,p_shortcut_name=>'LABEL_RATED_ARTICLE'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39892668542155855159)
,p_shortcut_name=>'MSG_NO_HTML'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39892672049180449569)
,p_shortcut_name=>'MSG_MODERATION_ENABLED'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39895596651091499316)
,p_shortcut_name=>'HELP_COMMENT_WEBSITE'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39895597044405502391)
,p_shortcut_name=>'HELP_COMMENT_EMAIL'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39895597240955504026)
,p_shortcut_name=>'HELP_COMMENT_LAST_NAME'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39895597438151505324)
,p_shortcut_name=>'HELP_COMMENT_NICK_NAME'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39904521065483239090)
,p_shortcut_name=>'ROBOTS_NOINDEX'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>'<meta name="robots" value="noindex" />'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39961590881913136297)
,p_shortcut_name=>'MSG_CONFIRM_COMMENT'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(39961611490030818876)
,p_shortcut_name=>'MSG_SUBSCRIBE_RSS'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'RETURN apex_escape.html_attribute(apex_lang.message(''MSG_SUBSCRIBE_RSS''));'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(40123034937077970264)
,p_shortcut_name=>'MSG_REQUIRED_FIELDS'
,p_shortcut_type=>'MESSAGE'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(40122212111206859713)
,p_name=>'No Authentication'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/org_blogsite_jaris_google_plus_one_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39892928689057966223)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.GOOGLE_PLUS_ONE_BUTTON'
,p_display_name=>'Google +1 Button'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','ORG.BLOGSITE.JARIS.GOOGLE_PLUS_ONE_BUTTON'),'')
,p_render_function=>'#OWNER#.blog_plugin.render_google_plus_one_button'
,p_standard_attributes=>'VISIBLE:SOURCE:ELEMENT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892929084085983730)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'URL to Google+'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'current_page'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Suggest a default URL which will be included in the +1.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892929479987985645)
,p_plugin_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_display_sequence=>10
,p_display_value=>'Current Page'
,p_return_value=>'current_page'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892929876752987152)
,p_plugin_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_display_sequence=>20
,p_display_value=>'Page URL'
,p_return_value=>'page_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892930273518988606)
,p_plugin_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_display_sequence=>30
,p_display_value=>'Custom URL'
,p_return_value=>'custom_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892930670283990106)
,p_plugin_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_display_sequence=>40
,p_display_value=>'Value of Page Item'
,p_return_value=>'value'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892931564664007888)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Page URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'page_url'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.<'
||'/p>',
'',
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise the URL will not be identified as the same URL. It''s also not allowed to end the page URL with a colon.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892932076944017382)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Custom URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://'
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(39892929084085983730)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom_url'
,p_help_text=>'Enter the URL which should be included in the +1.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892932493969024700)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'standard'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Sets the +1 button size to render. See <a href="https://developers.google.com/+/web/+1button/#button-sizes" target="_blank">button sizes</a> for more information. '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892932792028025567)
,p_plugin_attribute_id=>wwv_flow_api.id(39892932493969024700)
,p_display_sequence=>10
,p_display_value=>'Small'
,p_return_value=>'small'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892933189009027007)
,p_plugin_attribute_id=>wwv_flow_api.id(39892932493969024700)
,p_display_sequence=>20
,p_display_value=>'Medium'
,p_return_value=>'medium'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892933586421028194)
,p_plugin_attribute_id=>wwv_flow_api.id(39892932493969024700)
,p_display_sequence=>30
,p_display_value=>'Standard'
,p_return_value=>'standard'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892933983618029473)
,p_plugin_attribute_id=>wwv_flow_api.id(39892932493969024700)
,p_display_sequence=>40
,p_display_value=>'Tall'
,p_return_value=>'tall'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892934585977043644)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Annotation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'bubble'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Sets the annotation to display next to the button.<br/>',
'<br/>',
'<strong>None</strong> : Do not render additional annotations.<br/>',
'<br/>',
'<strong>Bubble</strong> : Display the number of users who have +1''d the page in a graphic next to the button.<br/>',
'<br/>',
'<strong>Inline</strong> :  Display profile pictures of connected users who have +1''d the page and a count of users who have +1''d the page.',
''))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892934884683044206)
,p_plugin_attribute_id=>wwv_flow_api.id(39892934585977043644)
,p_display_sequence=>10
,p_display_value=>'None'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892935281664045608)
,p_plugin_attribute_id=>wwv_flow_api.id(39892934585977043644)
,p_display_sequence=>20
,p_display_value=>'Bubble'
,p_return_value=>'bubble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892935680370046175)
,p_plugin_attribute_id=>wwv_flow_api.id(39892934585977043644)
,p_display_sequence=>30
,p_display_value=>'Inline'
,p_return_value=>'inline'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892936666112083200)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'450'
,p_display_length=>10
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(39892934585977043644)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'inline'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'If Annotation is set to "Inline", this parameter sets the width in pixels to use for the button and its inline annotation. If the width is omitted, a button and its inline annotation use 450px.',
'',
'See <a href="https://developers.google.com/+/web/+1button/#inline-annotation" target="_blank">Inline annotation widths</a> for examples of how the annotation is displayed for various width settings. '))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892936988313088110)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Align'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'left'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892937286587088903)
,p_plugin_attribute_id=>wwv_flow_api.id(39892936988313088110)
,p_display_sequence=>10
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892937684646089768)
,p_plugin_attribute_id=>wwv_flow_api.id(39892936988313088110)
,p_display_sequence=>20
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39892938062865099859)
,p_plugin_id=>wwv_flow_api.id(39892928689057966223)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Expand to'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Sets the preferred positions to display hover and confirmation bubbles, which are relative to the button. Set this parameter when your page contains certain elements, such as Flash objects, that might interfere with rendering the bubbles.<br/>',
'<br/>',
'For example, <strong>top</strong> will display the hover and confirmation bubbles above the button.<br/>',
'<br/>',
'If omitted, the rendering logic will guess the best position, usually defaulting to below the button by using the <strong>bottom</strong> value. '))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892938393692100761)
,p_plugin_attribute_id=>wwv_flow_api.id(39892938062865099859)
,p_display_sequence=>10
,p_display_value=>'Top'
,p_return_value=>'top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892938791751101663)
,p_plugin_attribute_id=>wwv_flow_api.id(39892938062865099859)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892939190457102341)
,p_plugin_attribute_id=>wwv_flow_api.id(39892938062865099859)
,p_display_sequence=>30
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39892939589163102939)
,p_plugin_attribute_id=>wwv_flow_api.id(39892938062865099859)
,p_display_sequence=>40
,p_display_value=>'Left'
,p_return_value=>'left'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/org_blogsite_jaris_modal_confirm
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39895233837110260103)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'ORG.BLOGSITE.JARIS.MODAL_CONFIRM'
,p_display_name=>'Modal Confirm'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','ORG.BLOGSITE.JARIS.MODAL_CONFIRM'),'&G_THEME_PATH.')
,p_render_function=>'blog_plugin.render_modal_confirm'
,p_standard_attributes=>'REGION:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/item_type/org_blogsite_jaris_comment_textarea
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39897205658922826581)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.COMMENT_TEXTAREA'
,p_display_name=>'Comment Textarea'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','ORG.BLOGSITE.JARIS.COMMENT_TEXTAREA'),'&G_THEME_PATH.')
,p_render_function=>'#OWNER#.blog_plugin.render_comment_textarea'
,p_validation_function=>'#OWNER#.blog_plugin.validate_comment_textarea'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER:ENCRYPT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897208634682944153)
,p_plugin_id=>wwv_flow_api.id(39897205658922826581)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Formatting Buttons'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Show formatting buttons.'
);
end;
/
prompt --application/shared_components/plugins/authorization_type/org_blogsite_jaris_feature_authorization
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39897226755093416614)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'
,p_display_name=>'Feature Enabled'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHORIZATION TYPE','ORG.BLOGSITE.JARIS.FEATURE_AUTHORIZATION'),'')
,p_execution_function=>'#OWNER#.blog_plugin.feature_authorization'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897227048839419531)
,p_plugin_id=>wwv_flow_api.id(39897226755093416614)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Feature Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/item_type/org_blogsite_jaris_math_question_field
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39897238240710137296)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.MATH_QUESTION_FIELD'
,p_display_name=>'Math Question Field'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','ORG.BLOGSITE.JARIS.MATH_QUESTION_FIELD'),'')
,p_render_function=>'blog_plugin.render_math_question_field'
,p_ajax_function=>'blog_plugin.ajax_math_question_field'
,p_validation_function=>'blog_plugin.validate_math_question_field'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:ELEMENT:WIDTH:PLACEHOLDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897248546027226020)
,p_plugin_id=>wwv_flow_api.id(39897238240710137296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item Holding Answer'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Item name witch will hold correct answer.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897238547598149271)
,p_plugin_id=>wwv_flow_api.id(39897238240710137296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'First Number min Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897238842854151529)
,p_plugin_id=>wwv_flow_api.id(39897238240710137296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'First Number max Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'40'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897239139619153017)
,p_plugin_id=>wwv_flow_api.id(39897238240710137296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Second Number min Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39897239435953154749)
,p_plugin_id=>wwv_flow_api.id(39897238240710137296)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Second Number max Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'40'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/item_type/org_blogsite_jaris_google_share_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(39910417095819069632)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.GOOGLE_SHARE_BUTTON'
,p_display_name=>'Google Share Button'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','ORG.BLOGSITE.JARIS.GOOGLE_SHARE_BUTTON'),'')
,p_render_function=>'#OWNER#.blog_plugin.render_google_share_button'
,p_standard_attributes=>'VISIBLE:SOURCE:ELEMENT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910417490847087139)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'URL to Google+'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'current_page'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Suggest a default URL which will be included in the +1.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910417886749089054)
,p_plugin_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_display_sequence=>10
,p_display_value=>'Current Page'
,p_return_value=>'current_page'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910418283514090561)
,p_plugin_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_display_sequence=>20
,p_display_value=>'Page URL'
,p_return_value=>'page_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910418680280092015)
,p_plugin_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_display_sequence=>30
,p_display_value=>'Custom URL'
,p_return_value=>'custom_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910419077045093515)
,p_plugin_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_display_sequence=>40
,p_display_value=>'Value of Page Item'
,p_return_value=>'value'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910419971425111297)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Page URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'page_url'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.<'
||'/p>',
'',
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise the URL will not be identified as the same URL. It''s also not allowed to end the page URL with a colon.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910420483705120791)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Custom URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://'
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(39910417490847087139)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom_url'
,p_help_text=>'Enter the URL which should be included in the +1.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910422992738147053)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Annotation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'bubble'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The annotation to display next to the button.<br/>',
'<br/>',
'',
'<strong>inline</strong> : Display profile pictures of connected users who have shared the page and a count of users who have shared the page.<br/>',
'<br/>',
'<strong>Bubble</strong> : Display the number of users who have shared the page in a graphic next to the button.<br/>',
'<br/>',
'<strong>vertical-bubble</strong> : Display the number of users who have shared the page in a graphic above the button.<br/>',
'<br/>',
'<strong>none</strong> : Do not render any additional annotations. '))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910423291444147615)
,p_plugin_attribute_id=>wwv_flow_api.id(39910422992738147053)
,p_display_sequence=>10
,p_display_value=>'Inline'
,p_return_value=>'inline'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910423688425149017)
,p_plugin_attribute_id=>wwv_flow_api.id(39910422992738147053)
,p_display_sequence=>20
,p_display_value=>'Bubble'
,p_return_value=>'bubble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39893289291878739739)
,p_plugin_attribute_id=>wwv_flow_api.id(39910422992738147053)
,p_display_sequence=>30
,p_display_value=>'Vertical Bubble'
,p_return_value=>'vertical-bubble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910424087131149584)
,p_plugin_attribute_id=>wwv_flow_api.id(39910422992738147053)
,p_display_sequence=>40
,p_display_value=>'None'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910425072873186609)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>10
,p_is_translatable=>false
,p_help_text=>'The maximum width to allocate to the entire share plugin. See <a href="https://developers.google.com/+/web/share/#button-sizes" target="_blank">Button Sizes</a> for more information. '
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39893290192716769653)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Height'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'20'
,p_display_length=>10
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The height to assign the button. This may be 15, 20, 24 or 60. See < href="https://developers.google.com/+/web/share/#button-sizes" target="_blank"<Button Sizes</a> for more information. '
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39893290875894777487)
,p_plugin_attribute_id=>wwv_flow_api.id(39893290192716769653)
,p_display_sequence=>10
,p_display_value=>'15'
,p_return_value=>'15'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39893291274816777955)
,p_plugin_attribute_id=>wwv_flow_api.id(39893290192716769653)
,p_display_sequence=>20
,p_display_value=>'20'
,p_return_value=>'20'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39893291673091778762)
,p_plugin_attribute_id=>wwv_flow_api.id(39893290192716769653)
,p_display_sequence=>30
,p_display_value=>'24'
,p_return_value=>'24'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39893292071797779378)
,p_plugin_attribute_id=>wwv_flow_api.id(39893290192716769653)
,p_display_sequence=>40
,p_display_value=>'60'
,p_return_value=>'60'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910425395074191519)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Align'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'left'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910425693348192312)
,p_plugin_attribute_id=>wwv_flow_api.id(39910425395074191519)
,p_display_sequence=>10
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910426091407193177)
,p_plugin_attribute_id=>wwv_flow_api.id(39910425395074191519)
,p_display_sequence=>20
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(39910426469626203268)
,p_plugin_id=>wwv_flow_api.id(39910417095819069632)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Expand to'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Sets the preferred positions to display hover and confirmation bubbles, which are relative to the button. Set this parameter when your page contains certain elements, such as Flash objects, that might interfere with rendering the bubbles.<br/>',
'<br/>',
'For example, <strong>top</strong> will display the hover and confirmation bubbles above the button.<br/>',
'<br/>',
'If omitted, the rendering logic will guess the best position, usually defaulting to below the button by using the <strong>bottom</strong> value. '))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910426800453204170)
,p_plugin_attribute_id=>wwv_flow_api.id(39910426469626203268)
,p_display_sequence=>10
,p_display_value=>'Top'
,p_return_value=>'top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910427198512205072)
,p_plugin_attribute_id=>wwv_flow_api.id(39910426469626203268)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910427597218205750)
,p_plugin_attribute_id=>wwv_flow_api.id(39910426469626203268)
,p_display_sequence=>30
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(39910427995924206348)
,p_plugin_attribute_id=>wwv_flow_api.id(39910426469626203268)
,p_display_sequence=>40
,p_display_value=>'Left'
,p_return_value=>'left'
);
end;
/
prompt --application/shared_components/plugins/item_type/org_blogsite_jaris_star_rating
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(41610186066317257950)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORG.BLOGSITE.JARIS.STAR_RATING'
,p_display_name=>'Simple Star Rating'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','ORG.BLOGSITE.JARIS.STAR_RATING'),'')
,p_render_function=>'#OWNER#.blog_plugin.render_simple_star_rating'
,p_standard_attributes=>'VISIBLE:READONLY:SOURCE:ENCRYPT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_facebook_like_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(46066039216618108102)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.FACEBOOK_LIKE_BUTTON'
,p_display_name=>'Facebook Like Button'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.FACEBOOK_LIKE_BUTTON'),'')
,p_render_function=>'#OWNER#.blog_plugin.render_facebook_like_button'
,p_standard_attributes=>'VISIBLE:SOURCE:ELEMENT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'	Facebook &quot;Like&quot; button widget based on the definition at <a href="http://developers.facebook.com/docs/reference/plugins/like">http://developers.facebook.com/docs/reference/plugins/like</a></p>',
''))
,p_version_identifier=>'1.1'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066039436703113942)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'URL to Like'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'current_page'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066063430580670312)
,p_plugin_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_display_sequence=>5
,p_display_value=>'Current Page'
,p_return_value=>'current_page'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066040014109126330)
,p_plugin_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_display_sequence=>10
,p_display_value=>'Page URL'
,p_return_value=>'page_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066040417572127321)
,p_plugin_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_display_sequence=>20
,p_display_value=>'Custom URL'
,p_return_value=>'custom_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066070034558983707)
,p_plugin_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_display_sequence=>30
,p_display_value=>'Value of Page Item'
,p_return_value=>'value'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066068131423831459)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Page URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'page_url'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.<'
||'/p>',
'',
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise Facebook will not be able to retrieve the page.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066058329467414558)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Custom URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://'
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(46066039436703113942)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom_url'
,p_help_text=>'Enter the URL which should be liked.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066041123591138518)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Layout Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'standard'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Determines the size and amount of social context next to the Like button.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066041728093139827)
,p_plugin_attribute_id=>wwv_flow_api.id(46066041123591138518)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'standard'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066042133633141468)
,p_plugin_attribute_id=>wwv_flow_api.id(46066041123591138518)
,p_display_sequence=>20
,p_display_value=>'Button Count'
,p_return_value=>'button_count'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066042537789142603)
,p_plugin_attribute_id=>wwv_flow_api.id(46066041123591138518)
,p_display_sequence=>30
,p_display_value=>'Box Count'
,p_return_value=>'box_count'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066043828916149502)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Show Faces'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(46066041123591138518)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'standard'
,p_help_text=>'Show profile pictures below the Like button.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066044432164159896)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>4
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter the width of the Facebook Like button widget. If not entered the following defaults will be used depending on the selected Layout Style:',
'<ul>',
'  <li><strong>Standard:</strong> 450</li>',
'  <li><strong>Button Count:</strong> 90</li>',
'  <li><strong>Box Count:</strong> 55</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066044938397161776)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Verb to Display'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'like'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The verb to display in the Like button.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066045541860162744)
,p_plugin_attribute_id=>wwv_flow_api.id(46066044938397161776)
,p_display_sequence=>10
,p_display_value=>'Like'
,p_return_value=>'like'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066045944977163612)
,p_plugin_attribute_id=>wwv_flow_api.id(46066044938397161776)
,p_display_sequence=>20
,p_display_value=>'Recommend'
,p_return_value=>'recommend'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066046638875171307)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Font'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Specify the font used by the widget.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066047244416172886)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>10
,p_display_value=>'Arial'
,p_return_value=>'arial'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066047617189174535)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>20
,p_display_value=>'Lucida Grande'
,p_return_value=>'lucida grande'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066048022383176019)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>30
,p_display_value=>'Segoe UI'
,p_return_value=>'segoe ui'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066048428617177784)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>40
,p_display_value=>'Tahoma'
,p_return_value=>'tahoma'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066048835543179862)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>50
,p_display_value=>'Trebuchet MS'
,p_return_value=>'trebuchet ms'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066049342815181897)
,p_plugin_attribute_id=>wwv_flow_api.id(46066046638875171307)
,p_display_sequence=>60
,p_display_value=>'Verdana'
,p_return_value=>'verdana'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46066049627709186977)
,p_plugin_id=>wwv_flow_api.id(46066039216618108102)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'light'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Specify the color scheme used by the widget.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066050230479187826)
,p_plugin_attribute_id=>wwv_flow_api.id(46066049627709186977)
,p_display_sequence=>10
,p_display_value=>'Light'
,p_return_value=>'light'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46066050633596188721)
,p_plugin_attribute_id=>wwv_flow_api.id(46066049627709186977)
,p_display_sequence=>20
,p_display_value=>'Dark'
,p_return_value=>'dark'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_twitter_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(47783634088463780005)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.TWITTER_BUTTON'
,p_display_name=>'Twitter Button'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.TWITTER_BUTTON'),'')
,p_render_function=>'#OWNER#.blog_plugin.render_twitter_button'
,p_standard_attributes=>'VISIBLE:SOURCE:ELEMENT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'	Twitter button widget based on the definition at <a href="http://twitter.com/about/resources/tweetbutton">http://twitter.com/about/resources/tweetbutton</a></p>',
''))
,p_version_identifier=>'1.0'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47783634308548785845)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'URL to Tweet'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'current_page'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Suggest a default URL which will be included in the Tweet.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783658302426342215)
,p_plugin_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_display_sequence=>5
,p_display_value=>'Current Page'
,p_return_value=>'current_page'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783634885954798233)
,p_plugin_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_display_sequence=>10
,p_display_value=>'Page URL'
,p_return_value=>'page_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783635289417799224)
,p_plugin_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_display_sequence=>20
,p_display_value=>'Custom URL'
,p_return_value=>'custom_url'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783664906404655610)
,p_plugin_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_display_sequence=>30
,p_display_value=>'Value of Page Item'
,p_return_value=>'value'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47783663003269503362)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Page URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'page_url'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Enter a page URL in the Oracle APEX <code>f?p=</code> syntax. See <a href="http://download.oracle.com/docs/cd/E17556_01/doc/user.40/e15517/concept.htm#BEIFCDGF" target="_blank">Understanding URL syntax</a> in the Oracle APEX online documentation.<'
||'/p>',
'',
'<p><strong>Note:</strong> You can only reference public pages and you have to use <strong>0</strong> as session id, otherwise the URL will not be identified as the same URL. It''s also not allowed to end the page URL with a colon.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47783653201313086461)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Custom URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'http://'
,p_display_length=>50
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(47783634308548785845)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom_url'
,p_help_text=>'Enter the URL which should be included in the Tweet.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47783635995436810421)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Layout Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'vertical'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Determines the style how your Twitter button widget will look like.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783636599938811730)
,p_plugin_attribute_id=>wwv_flow_api.id(47783635995436810421)
,p_display_sequence=>10
,p_display_value=>'Vertical Counter'
,p_return_value=>'vertical'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783637005478813371)
,p_plugin_attribute_id=>wwv_flow_api.id(47783635995436810421)
,p_display_sequence=>20
,p_display_value=>'Horizontal Counter'
,p_return_value=>'horizontal'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(47783637409634814506)
,p_plugin_attribute_id=>wwv_flow_api.id(47783635995436810421)
,p_display_sequence=>30
,p_display_value=>'No Counter'
,p_return_value=>'none'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46890977704551023683)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Tweet Text'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'page_title'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select "Page Title" to include the current page title as text that people will include in their Tweet when they share from your website. Custom allows to specify your own text.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46890978311823025775)
,p_plugin_attribute_id=>wwv_flow_api.id(46890977704551023683)
,p_display_sequence=>10
,p_display_value=>'Page Title'
,p_return_value=>'page_title'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(46890978714940026686)
,p_plugin_attribute_id=>wwv_flow_api.id(46890977704551023683)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46890979786458037438)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Custom Tweet Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_max_length=>140
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(46890977704551023683)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
,p_help_text=>'Specify the text that people will include in their Tweet when they share from your website. Use the placeholder #PAGE_TITLE# for the current page title. Example: Check out "#PAGE_TITLE#"!'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46890980307237043419)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Follow 1'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_is_translatable=>false
,p_help_text=>'Specify the Twitter account which will be @ mentioned in the suggested Tweet.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(46890980811739044748)
,p_plugin_id=>wwv_flow_api.id(47783634088463780005)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Follow 2'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Specify the Twitter account which is recommended for users to follow after they share content from your website.',
'</p>',
'<p>Optional use a colon to separate the Twitter account and an additional description of the account. For example: <code>patrickwolf:Author of many Plug-Ins</p>'))
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(40120088541813336422)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>202
,p_home_url=>'f?p=&APP_ALIAS.:HOME:0'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_global_page_id=>0
,p_nav_list_template_options=>'#DEFAULT#'
,p_content_delivery_network=>'GOOGLE'
,p_javascript_file_urls=>'&G_THEME_PATH.lib.js?v=#APP_VERSION#'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Global page'
,p_page_mode=>'NORMAL'
,p_step_title=>'0'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40075847456451220850)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141226115557'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39886011790509209010)
,p_plug_name=>'Footer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39936948576526595655)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source=>'"BLOG_FOOTER"'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39889350283108598042)
,p_plug_name=>'Page header RSS link'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<link type="application/rss+xml" href="&G_RSS_FEED_URL." rel="alternate" title=""RSS_DESCRIPTION"" />'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_required_role=>wwv_flow_api.id(40053065590851875881)
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40053056082356852416)
,p_plug_name=>'Blog description'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<p>"BLOG_DESCRIPTION"</p>'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_required_role=>wwv_flow_api.id(40053064895177858729)
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40076175746577871243)
,p_plug_name=>'&P0_REGION_TITLE_ARCHIVES.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_05'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40120033516967136011)
,p_plug_name=>'&P0_REGION_TITLE_LATEST_ARTICLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_api.id(40120031389346109111)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(40120032198266120576)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40120034392295147829)
,p_plug_name=>'&P0_REGION_TITLE_MOST_CLICKED.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_api.id(40120031596272111068)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(40120032198266120576)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40120034711341153306)
,p_plug_name=>'&P0_REGION_TITLE_MOST_HITS.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_api.id(40120031804584113507)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(40120032198266120576)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40120035909441190568)
,p_plug_name=>'&P0_REGION_TITLE_CATEGORIES.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_api.id(40120031213803106742)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(40120032198266120576)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40123418811894140852)
,p_plug_name=>'Tabs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_04'
,p_list_id=>wwv_flow_api.id(40123416636996110259)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(40879166094889334770)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40285078429598436487)
,p_plug_name=>'Not Rendered Items. DON''T DELETE THIS REGION !!'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
,p_plug_comment=>'Do not delete this region. Region holds all pages items that we do not like render.'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40290504809703564466)
,p_plug_name=>'&P0_REGION_TITLE_RSS.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p style="margin-left:15px;"><a href="&G_RSS_FEED_URL." rel="alternate" type="application/rss+xml"><img src="&G_THEME_PATH.feed-icon-128x128.png" alt="RSS" title=""MSG_SUBSCRIBE_RSS"" /></a></p>'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_required_role=>wwv_flow_api.id(40053065590851875881)
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
,p_plug_comment=>'<a href="&G_RSS_FEED_URL."><img src="&G_THEME_PATH.images/rss.jpg" alt="RSS Feed" /></a>'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40296628440710459454)
,p_plug_name=>'&P0_REGION_TITLE_SEARCH.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032802433124984)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40296629338266459570)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(40296628440710459454)
,p_button_name=>'P0_SEARCH_BTN'
,p_button_static_id=>'P0_SEARCH_BTN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_button_cattributes=>'style="margin:0"'
,p_request_source=>'P0_SEARCH'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886671269369009498)
,p_name=>'P0_REGION_TITLE_RSS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886673366325041220)
,p_name=>'P0_REGION_TITLE_SEARCH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886684067470223041)
,p_name=>'P0_REGION_TITLE_ARCHIVES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886684676707264345)
,p_name=>'P0_REGION_TITLE_CATEGORIES'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886686783152291705)
,p_name=>'P0_REGION_TITLE_LATEST_ARTICLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886688967181314334)
,p_name=>'P0_REGION_TITLE_MOST_CLICKED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886689783558321861)
,p_name=>'P0_REGION_TITLE_MOST_HITS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40076176553227883976)
,p_name=>'P0_ARCHIVES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40076175746577871243)
,p_use_cache_before_default=>'NO'
,p_source=>'RETURN CASE WHEN :APP_PAGE_ID = 5 THEN :P0_ARCHIVES END'
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ARCHIVE_MONTHS'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  TO_CHAR(l.year_month,''fmMonth, YYYY "('' || l.article_count || '')"'') AS d,',
'  l.year_month_num',
'FROM blog_archive_lov l',
'ORDER BY l.year_month_num DESC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select month -'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40283482031620914377)
,p_name=>'P0_SEARCH_TYPE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40296628440710459454)
,p_item_default=>'ALL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEARCH_TYPE'
,p_lov=>'.'||wwv_flow_api.id(39961592487925221873)||'.'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40296628935792459561)
,p_name=>'P0_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40296628440710459454)
,p_use_cache_before_default=>'NO'
,p_source=>'RETURN CASE WHEN :APP_PAGE_ID = 2 THEN :P0_SEARCH END'
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>80
,p_cHeight=>1
,p_tag_attributes=>'style="width:190px"'
,p_label_alignment=>'ABOVE'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40076228058522203601)
,p_name=>'Before pagination'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#PPR_ARTICLES,#PPR_COMMENTS'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforerefresh'
,p_display_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_display_when_cond=>'1,2,3,4,5'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40076228343187203723)
,p_event_id=>wwv_flow_api.id(40076228058522203601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#modal_LOADER'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40076228466487205902)
,p_name=>'After pagination'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#PPR_ARTICLES,#PPR_COMMENTS'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'CURRENT_PAGE_IN_CONDITION'
,p_display_when_cond=>'1,2,3,4,5'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40076228962625205903)
,p_event_id=>wwv_flow_api.id(40076228466487205902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#articlepages'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'1>=this.affectedElements.children().length && this.affectedElements.empty();',
'SyntaxHighlighter.highlight();',
'if(!/android|iphone|ipod|series60|symbian|windows ce|blackberry/i.test(navigator.userAgent)){',
' $("#center div.article a[href]").filter(function(){return /\.(jpg|png|gif)$/i.test(this.href)}).slimbox({loop:true},null,function(el){return (this==el)||($(this).parents("#center div.article")[0]&&($(this).parents("#center div.article")[0]==$(el).pa'
||'rents("div.article")[0]))})',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40076228745053205903)
,p_event_id=>wwv_flow_api.id(40076228466487205902)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'html,body'
,p_attribute_01=>'this.affectedElements.animate({scrollTop:(3===&APP_PAGE_ID.?$("#COMMENTS"):$("#PAGE_TOP")).offset().top},"fast",function(){$("#modal_LOADER").hide()});'
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Home'
,p_alias=>'HOME'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_BLOG_NAME.'
,p_step_sub_title=>'Application Express Tips&Tricks'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"CANONICAL_URL"',
'<meta content=""BLOG_DESCRIPTION"" name="description" />',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101184619'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40110813135380549151)
,p_name=>'Articles'
,p_region_name=>'PPR_ARTICLES'
,p_template=>wwv_flow_api.id(40120032998587124987)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.article_id',
'  ,a.category_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,a.category_name',
'  ,a.created_on',
'  ,a.author_name',
'  ,a.article_text',
'  ,a.comment_count',
'  ,a.created_on_txt',
'  ,a.posted_by_txt',
'  ,a.category_txt',
'  ,a.view_comment',
'  ,a.post_comment',
'FROM #OWNER#.blog_v$article a',
'ORDER BY a.created_on DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_item=>'G_ARTICLE_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665187048487146)
,p_query_column_id=>1
,p_column_alias=>'ARTICLE_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665300076487146)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903816486743267192)
,p_query_column_id=>3
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895207040193025311)
,p_query_column_id=>4
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#ARTICLE_TITLE#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40080372058668509042)
,p_query_column_id=>5
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_NAME#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40110813757616549189)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903816562719267192)
,p_query_column_id=>7
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075162345908235645)
,p_query_column_id=>8
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665379393487146)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904395162146033043)
,p_query_column_id=>10
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665484957487146)
,p_query_column_id=>11
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961517687174268758)
,p_query_column_id=>12
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665596636487146)
,p_query_column_id=>13
,p_column_alias=>'VIEW_COMMENT'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS'
,p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />'
,p_column_link_attr=>'class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961665694440487146)
,p_query_column_id=>14
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>14
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />'
,p_column_link_attr=>'rel="nofollow" class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886018975647163235)
,p_computation_sequence=>10
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':HOME:0'''
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40053030781434126178)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Error on process: Reset pagination'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Search Result'
,p_alias=>'SEARCH'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220100638'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40110831139939021299)
,p_name=>'&G_REGION_TITLE.'
,p_region_name=>'PPR_ARTICLES'
,p_template=>wwv_flow_api.id(40054908876230646712)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.article_id',
'  ,a.category_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,a.category_name',
'  ,a.created_on',
'  ,a.author_name',
'  ,a.article_text',
'  ,a.comment_count',
'  ,a.created_on_txt',
'  ,a.posted_by_txt',
'  ,a.category_txt',
'  ,a.view_comment',
'  ,a.post_comment',
'FROM #OWNER#.blog_v$article a',
'WHERE :P0_SEARCH IS NOT NULL',
'  AND (',
'   (',
'    :P0_SEARCH_TYPE = ''ALL''',
'    AND (',
'     INSTR(UPPER(a.article_title), UPPER(:P0_SEARCH)) > 0',
'     OR CONTAINS(a.article_text, ''{'' || :P0_SEARCH || ''}'', 1) > 0',
'    )',
'   )',
'   OR (',
'    :P0_SEARCH_TYPE = ''TITLE''',
'    AND INSTR(UPPER(a.article_title), UPPER(:P0_SEARCH)) > 0',
'   )',
'   OR (',
'    :P0_SEARCH_TYPE = ''TEXT''',
'    AND CONTAINS(a.article_text, ''{'' || :P0_SEARCH || ''}'', 2) > 0',
'   ) ',
'  )',
'ORDER BY score(1) + score(2) DESC, a.created_on DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_item=>'G_ARTICLE_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666284004518940)
,p_query_column_id=>1
,p_column_alias=>'ARTICLE_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666377564518940)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903816874019273024)
,p_query_column_id=>3
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895207939102040957)
,p_query_column_id=>4
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#ARTICLE_TITLE#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40080373062487566433)
,p_query_column_id=>5
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_NAME#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40110831962374021301)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903816980388273024)
,p_query_column_id=>7
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075173068241669550)
,p_query_column_id=>8
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_column_hit_highlight=>'&P0_SEARCH.'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666479542518940)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904395358695034597)
,p_query_column_id=>10
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666602547518940)
,p_query_column_id=>11
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961527087273822705)
,p_query_column_id=>12
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666695011518940)
,p_query_column_id=>13
,p_column_alias=>'VIEW_COMMENT'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS'
,p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />'
,p_column_link_attr=>'class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961666784088518941)
,p_query_column_id=>14
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>14
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />'
,p_column_link_attr=>'rel="nofollow" class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886674766928060562)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_SEARCH_RESULT'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39887415486237499973)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_SEARCH_RESULT'')'
,p_computation_error_message=>'Error on: Computation TITLE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40075604741725360689)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Write search log'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_log.write_activity_log(',
'  p_user_id       => :G_USER_ID,',
'  p_session_id    => :APP_SESSION,',
'  p_activity_type => ''SEARCH'',',
'  p_search_type   => :P0_SEARCH_TYPE,',
'  p_search        => :P0_SEARCH',
');'))
,p_process_error_message=>'Error on process: Write search log'
,p_security_scheme=>wwv_flow_api.id(40075597747842057988)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40053030402081122716)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Error on process: Reset pagination'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Read article'
,p_alias=>'READ'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Read Article'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"CANONICAL_URL"',
'<meta content="&P3_DESCRIPTION." name="description" />',
'<meta content="&P3_KEYWORDS." name="keywords" />',
'<meta content="&P3_AUTHOR_NAME." name="author" />'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101234440'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40110836663094349646)
,p_name=>'Read Article'
,p_template=>wwv_flow_api.id(40120032998587124987)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.article_id',
'  ,a.category_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,category_name',
'  ,a.created_on',
'  ,a.author_name',
'  ,a.article_text',
'  ,0 AS comment_count',
'  ,a.created_on_txt',
'  ,a.posted_by_txt',
'  ,a.category_txt',
'  ,a.post_comment',
'FROM #OWNER#.blog_v$article a',
'WHERE a.article_id = :ARTICLE',
'ORDER BY a.created_on',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>1
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961667497338558268)
,p_query_column_id=>1
,p_column_alias=>'ARTICLE_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961667681582558268)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903817289750280918)
,p_query_column_id=>3
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895208361519045817)
,p_query_column_id=>4
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span>#ARTICLE_TITLE#</span>'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40080373642203591114)
,p_query_column_id=>5
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_NAME#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40110837461544349647)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903817385718280919)
,p_query_column_id=>7
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075166640652443518)
,p_query_column_id=>8
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#ARTICLE_TEXT#',
'<a id="COMMENTS" name="COMMENTS"></a>'))
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961699084081691596)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904395588228036131)
,p_query_column_id=>10
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961667876098558268)
,p_query_column_id=>11
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961529483268929805)
,p_query_column_id=>12
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961667983627558268)
,p_query_column_id=>13
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />'
,p_column_link_attr=>'rel="nofollow" class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40110839346013486629)
,p_name=>'&G_REGION_TITLE.'
,p_region_name=>'PPR_COMMENTS'
,p_parent_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_template=>wwv_flow_api.id(40120032998587124987)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'WITH qry AS (',
'  SELECT ',
'    CEIL(ROW_NUMBER() OVER(ORDER BY c.created_on DESC) / :G_COMMENT_ROWS) AS rn',
'    ,c.created_on',
'    ,b.nick_name AS posted_by',
'    ,c.comment_text',
'    ,(SELECT APEX_LANG.message(''TEXT_POSTED_ON'') FROM DUAL) AS created_txt',
'    ,(SELECT APEX_LANG.message(''TEXT_POSTED_BY'') FROM DUAL) AS posted_by_txt',
'  FROM #OWNER#.blog_comment c',
'  JOIN #OWNER#.blog_comment_user b',
'    ON c.user_id = b.user_id',
'  WHERE c.article_id = :ARTICLE',
'    AND c.moderated = ''Y''',
'    AND c.active = ''Y''',
')',
'SELECT',
'  qry.created_on',
'  ,qry.posted_by',
'  ,qry.comment_text',
'  ,qry.created_txt',
'  ,qry.posted_by_txt',
'FROM qry',
'ORDER BY qry.rn,',
'  qry.created_on'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_required_role=>wwv_flow_api.id(39897421636957241920)
,p_display_when_condition=>'ARTICLE'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(40110839141350442448)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No comments yet on this article.'
,p_query_num_rows_item=>'G_COMMENT_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40110839738240486759)
,p_query_column_id=>1
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075178748973212872)
,p_query_column_id=>2
,p_column_alias=>'POSTED_BY'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075178460835207358)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961534577584119272)
,p_query_column_id=>4
,p_column_alias=>'CREATED_TXT'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961671893586666415)
,p_query_column_id=>5
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39890139666922192979)
,p_name=>'P3_FACEBOOK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_use_cache_before_default=>'NO'
,p_source=>':G_BASE_URL||:G_CANONICAL_HREF'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FACEBOOK_LIKE_BUTTON'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="width:110px"'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39890168169393349569)
,p_attribute_01=>'value'
,p_attribute_04=>'button_count'
,p_attribute_07=>'like'
,p_attribute_09=>'light'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39890140266238238802)
,p_name=>'P3_TWEET'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_use_cache_before_default=>'NO'
,p_source=>':G_BASE_URL||:G_CANONICAL_HREF'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TWITTER_BUTTON'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="width:110px"'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39890167875647346584)
,p_attribute_01=>'value'
,p_attribute_04=>'horizontal'
,p_attribute_05=>'page_title'
,p_attribute_07=>'&P3_TWITTER_FOLLOW.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39890155077652674607)
,p_name=>'P3_RATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_prompt=>'"LABEL_RATE_ARTICLE"'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.STAR_RATING'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="padding-top:12px"'
,p_new_grid=>true
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P3_IS_RATED'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(39897068156335907551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39890167367057304989)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39890162476757042282)
,p_name=>'P3_RATED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_prompt=>'"LABEL_RATED_ARTICLE"'
,p_source=>'P3_RATE'
,p_source_type=>'ITEM'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.STAR_RATING'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="padding-top:12px"'
,p_new_grid=>true
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P3_IS_RATED'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(39897068156335907551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39890167367057304989)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39890163884292053995)
,p_name=>'P3_IS_RATED'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39893286488933649934)
,p_name=>'P3_GOOGLE_PLUS_ONE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_use_cache_before_default=>'NO'
,p_source=>':G_BASE_URL||:G_CANONICAL_HREF'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.GOOGLE_PLUS_ONE_BUTTON'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="width:110px"'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39893287185876696859)
,p_attribute_01=>'value'
,p_attribute_04=>'standard'
,p_attribute_05=>'bubble'
,p_attribute_07=>'left'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39893292494835814266)
,p_name=>'P3_GOOGLE_SHARE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40110836663094349646)
,p_use_cache_before_default=>'NO'
,p_source=>':G_BASE_URL||:G_CANONICAL_HREF'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.GOOGLE_SHARE_BUTTON'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cattributes_element=>'style="width:110px"'
,p_begin_on_new_line=>'N'
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(39893295070428871214)
,p_attribute_01=>'value'
,p_attribute_04=>'bubble'
,p_attribute_06=>'24'
,p_attribute_07=>'left'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39893295688710923463)
,p_name=>'P3_TWITTER_FOLLOW'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39895182040848219820)
,p_name=>'P3_KEYWORDS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062318317895297082)
,p_name=>'P3_AUTHOR_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062625126872621153)
,p_name=>'P3_DESCRIPTION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39890164071568059909)
,p_computation_sequence=>10
,p_computation_item=>'P3_IS_RATED'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM apex_collections',
'WHERE collection_name = ''RATED_ARTICLES''',
'AND n001 = :ARTICLE'))
,p_security_scheme=>wwv_flow_api.id(39890167367057304989)
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39903826166575413224)
,p_computation_sequence=>20
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READ:0::::ARTICLE:'' || :ARTICLE, NULL, ''PUBLIC_BOOKMARK'')'
,p_computation_error_message=>'Error on: Computation ARTICLE_URL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40095771108105358818)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Error on process: Reset pagination'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40075585653725380226)
,p_process_sequence=>20
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Write article log'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_log.write_activity_log(',
'  p_user_id       => :G_USER_ID,',
'  p_session_id    => :APP_SESSION,',
'  p_activity_type => ''READ'',',
'  p_related_id    => :ARTICLE',
');',
'#OWNER#.blog_log.write_article_log(:ARTICLE);'))
,p_process_error_message=>'Error on process: Write article log'
,p_security_scheme=>wwv_flow_api.id(40075597747842057988)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39897359148004643428)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unsubscribe'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.unsubscribe(',
'  p_value      => :SUBSCRIBER_ID,',
'  p_user_id    => :G_USER_ID,',
'  p_article_id => :ARTICLE',
');',
'IF :ARTICLE IS NULL OR :G_USER_ID IS NULL THEN',
'  apex_util.redirect_url(:HOME_LINK);',
'END IF;'))
,p_process_error_message=>'Error on process: Unsubscribe'
,p_process_when=>'SUBSCRIBER_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'You have unsubscribed get followup notification from this article.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39887361074264180564)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set items session state'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_article_page_items (',
'  p_article_id     => :ARTICLE,',
'  p_page_title     => :G_PAGE_TITLE,',
'  p_region_title   => :G_REGION_TITLE,',
'  p_keywords       => :P3_KEYWORDS,',
'  p_description    => :P3_DESCRIPTION,',
'  p_author_name    => :P3_AUTHOR_NAME,',
'  p_twitter_follow => :P3_TWITTER_FOLLOW,',
'  p_rate           => :P3_RATE',
');'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39890143882555383084)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RATE_ARTICLE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_rate NUMBER;',
'BEGIN',
'  l_rate := to_number(apex_application.g_x01);',
'  #OWNER#.blog_log.rate_article(:ARTICLE, l_rate);',
'  if not apex_collection.collection_exists(''RATED_ARTICLES'') then',
'    apex_collection.create_collection(''RATED_ARTICLES'');',
'  end if;',
'  if l_rate is not null then',
'    apex_collection.add_member(',
'      p_collection_name => ''RATED_ARTICLES'',',
'      p_n001            => :ARTICLE',
'    );',
'    sys.htp.prn(l_rate);',
'  end if;',
'EXCEPTION WHEN ',
'  VALUE_ERROR OR',
'  INVALID_NUMBER',
'THEN',
'  NULL;',
'END;'))
,p_security_scheme=>wwv_flow_api.id(39890167367057304989)
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Read category'
,p_alias=>'READCAT'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Read Articles for &CATEGORY.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"CANONICAL_URL"',
'<meta content="&P4_CATEGORY_NAME." name="keywords" />'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101184628'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40110826762759025078)
,p_name=>'&G_REGION_TITLE.'
,p_region_name=>'PPR_ARTICLES'
,p_template=>wwv_flow_api.id(40054908876230646712)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.article_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,category_name',
'  ,a.created_on',
'  ,a.author_name',
'  ,a.article_text',
'  ,a.comment_count',
'  ,a.created_on_txt',
'  ,a.posted_by_txt',
'  ,a.category_txt',
'  ,a.view_comment',
'  ,a.post_comment',
'FROM #OWNER#.blog_v$article a',
'WHERE a.category_id = :CATEGORY',
'ORDER BY a.created_on DESC',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_item=>'G_ARTICLE_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961668593444575310)
,p_query_column_id=>1
,p_column_alias=>'ARTICLE_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903817779183285851)
,p_query_column_id=>2
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895208934345058335)
,p_query_column_id=>3
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#ARTICLE_TITLE#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961668703172575310)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span>#CATEGORY_NAME#</span>'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40110827548131025103)
,p_query_column_id=>5
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903817860404285851)
,p_query_column_id=>6
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40075165644414391978)
,p_query_column_id=>7
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961668803919575310)
,p_query_column_id=>8
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904395785425037425)
,p_query_column_id=>9
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961668897886575310)
,p_query_column_id=>10
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961530680448971115)
,p_query_column_id=>11
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961668990891575311)
,p_query_column_id=>12
,p_column_alias=>'VIEW_COMMENT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS'
,p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />'
,p_column_link_attr=>'class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669095404575311)
,p_query_column_id=>13
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />'
,p_column_link_attr=>'rel="nofollow" class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886682666848192883)
,p_name=>'P4_CATEGORY_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39903826681659421463)
,p_computation_sequence=>10
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ALIAS || '':READCAT:0::::CATEGORY:'' || :CATEGORY, NULL, ''PUBLIC_BOOKMARK'')'
,p_computation_error_message=>'Error on: Computation CATEGORY_URL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40095771520225362294)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Error on process: Reset pagination'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40095770617193342557)
,p_process_sequence=>20
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Write category log'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_log.write_activity_log(',
'  p_user_id       => :G_USER_ID,',
'  p_session_id    => :APP_SESSION,',
'  p_activity_type => ''READCAT'',',
'  p_related_id    => :CATEGORY',
');',
'#OWNER#.blog_log.write_category_log(:CATEGORY);'))
,p_process_error_message=>'Error on process: Writing category log'
,p_security_scheme=>wwv_flow_api.id(40075597747842057988)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39887361281190182601)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set items session state'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_category_page_items (',
'  p_category_id   => :CATEGORY,',
'  p_page_title    => :G_PAGE_TITLE,',
'  p_region_title  => :G_REGION_TITLE,',
'  p_category_name => :P4_CATEGORY_NAME',
');'))
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Read archives'
,p_alias=>'ARCHIVES'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Archives'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220100815'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40076197553260016528)
,p_name=>'&G_REGION_TITLE.'
,p_region_name=>'PPR_ARTICLES'
,p_template=>wwv_flow_api.id(40054908876230646712)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.article_id',
'  ,a.category_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,a.category_name',
'  ,a.created_on',
'  ,a.author_name',
'  ,a.article_text',
'  ,a.comment_count',
'  ,a.created_on_txt',
'  ,a.posted_by_txt',
'  ,a.category_txt',
'  ,a.view_comment',
'  ,a.post_comment',
'FROM #OWNER#.blog_v$article a',
'WHERE a.year_month_num = :P0_ARCHIVES',
'ORDER BY a.created_on DESC',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_item=>'G_ARTICLE_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669590628591777)
,p_query_column_id=>1
,p_column_alias=>'ARTICLE_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669691491591777)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903818169047290565)
,p_query_column_id=>3
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895209453743064562)
,p_query_column_id=>4
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#ARTICLE_TITLE#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076198157944016532)
,p_query_column_id=>5
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READCAT:0::::CATEGORY:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_NAME#'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076198058545016531)
,p_query_column_id=>6
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903818278922290566)
,p_query_column_id=>7
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076197837612016531)
,p_query_column_id=>8
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669777411591777)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904395982190038898)
,p_query_column_id=>10
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669871771591777)
,p_query_column_id=>11
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961532180065002542)
,p_query_column_id=>12
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961669995612591777)
,p_query_column_id=>13
,p_column_alias=>'VIEW_COMMENT'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:#ARTICLE_ID##COMMENTS'
,p_column_linktext=>'#VIEW_COMMENT# ( #COMMENT_COUNT# )<img src="&G_THEME_PATH.nav_forum.png" alt="#VIEW_COMMENT#" />'
,p_column_link_attr=>'class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_column_link_checksum_type=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961670087560591777)
,p_query_column_id=>14
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>14
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ALIAS.:NEW_COMMENT:0::::P9_ARTICLE:#ARTICLE_ID#'
,p_column_linktext=>'#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="#POST_COMMENT#" />'
,p_column_link_attr=>'rel="nofollow" class="comment-link"'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39887413463482187986)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_ARCHIVES'', to_char(to_date(:P0_ARCHIVES, ''YYYYMM''), ''fmMonth, YYYY''))'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39897271546355884745)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_ARCHIVES'', to_char(to_date(:P0_ARCHIVES, ''YYYYMM''), ''fmMonth, YYYY''))'
,p_computation_error_message=>'Error on: Computation TITLE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40053030577971125185)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Pagination'
,p_process_sql_clob=>'reset_pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_error_message=>'Error on process: Reset pagination'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Submit comment'
,p_alias=>'NEW_COMMENT'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Submit comment'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(39897421636957241920)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_deep_linking=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101190945'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39961564499365111103)
,p_plug_name=>'&G_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40110796863696125902)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>"MSG_REQUIRED_FIELDS"</p>'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39961567772575111163)
,p_plug_name=>'Confirm dialog'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40075969247190729176)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'"MSG_CONFIRM_COMMENT"'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P9_ARTICLE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39961565893674111155)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_button_name=>'P9_CANCEL'
,p_button_static_id=>'P9_CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BODY'
,p_button_alignment=>'RIGHT-BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ALIAS.:READ:0::::ARTICLE:&P9_ARTICLE.'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39961566094599111156)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_button_name=>'P9_SUBMIT'
,p_button_static_id=>'P9_SUBMIT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'BODY'
,p_button_alignment=>'RIGHT-BOTTOM'
,p_button_condition=>'P9_ARTICLE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39935316386520571884)
,p_branch_name=>'Return to article'
,p_branch_action=>'3'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39897392060521652527)
,p_branch_name=>'Goto home page'
,p_branch_action=>'HOME_LINK'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_URL_IDENT_BY_ITEM'
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P9_ARTICLE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39892724131558178958)
,p_name=>'P9_MODERATION_ENABLED_MSG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_item_default=>'"MSG_MODERATION_ENABLED"'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_security_scheme=>wwv_flow_api.id(39892672344004451984)
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39892728031396376524)
,p_name=>'P9_MATH_QUESTION_ANSWER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(39897068156335907551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39937007661907514934)
,p_name=>'P9_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>80
,p_cHeight=>1
,p_cattributes_element=>'class="hideMe508"'
,p_tag_attributes=>'required'
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(39961478580778709119)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_COMMENT_LAST_NAME"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961564675619111111)
,p_name=>'P9_MATH_QUESTION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Question answer'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.MATH_QUESTION_FIELD'
,p_cSize=>10
,p_cMaxlength=>20
,p_cHeight=>1
,p_tag_attributes=>'style="text-align:right"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_security_scheme=>wwv_flow_api.id(40052862102538418540)
,p_attribute_01=>'P9_MATH_QUESTION_ANSWER'
,p_attribute_02=>'1'
,p_attribute_03=>'46'
,p_attribute_04=>'1'
,p_attribute_05=>'46'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961564876616111135)
,p_name=>'P9_NICK_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NICK_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>80
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_help_text=>'"HELP_COMMENT_NICK_NAME"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961565384442111154)
,p_name=>'P9_WEBSITE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Website'
,p_source=>'WEBSITE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>256
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701838203592139)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_COMMENT_WEBSITE"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961566284056111156)
,p_name=>'P9_EMAIL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>256
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_help_text=>'"HELP_COMMENT_EMAIL"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961566797351111157)
,p_name=>'P9_COMMENT'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Comment'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.COMMENT_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>10
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_help_text=>'"HELP_COMMENT_COMMENT"'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961567279700111158)
,p_name=>'P9_FOLLOWUP_NOTIFY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39961564499365111103)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Notification'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT n.followup_notify',
' FROM #OWNER#.blog_comment_notify n',
'WHERE n.user_id = :G_USER_ID',
'  AND n.article_id = :P9_ARTICLE'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT apex_lang.message(''FOLLOWUP_NOTIFY_CHECKBOX'') as d,',
'  ''Y'' r',
'FROM dual',
''))
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cattributes_element=>'style="padding:8px 0"'
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701838203592139)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_escape_on_http_output=>'N'
,p_security_scheme=>wwv_flow_api.id(39887430170041971148)
,p_help_text=>'"HELP_COMMENT_FOLLOWUP_NOTIFY"'
,p_attribute_01=>'1'
,p_attribute_02=>'VERTICAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961568393171111167)
,p_name=>'P9_ARTICLE_TITLE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961690578747828115)
,p_name=>'P9_ARTICLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961569674043111169)
,p_computation_sequence=>10
,p_computation_item=>'ARTICLE'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P9_ARTICLE'
,p_computation_error_message=>'Error on: Computation ARTICLE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961568694563111168)
,p_computation_sequence=>20
,p_computation_item=>'P9_NICK_NAME'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(:P9_NICK_NAME)'
,p_computation_error_message=>'Error on: Computation NICK'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961568885839111168)
,p_computation_sequence=>30
,p_computation_item=>'P9_EMAIL'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(LOWER(:P9_EMAIL))'
,p_computation_error_message=>'Error on: Computation EMAIL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961569094487111169)
,p_computation_sequence=>40
,p_computation_item=>'P9_WEBSITE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(:P9_WEBSITE)'
,p_computation_error_message=>'Error on: Computation WEBSITE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961569287200111169)
,p_computation_sequence=>50
,p_computation_item=>'P9_FOLLOWUP_NOTIFY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_computation_error_message=>'Error on: Computation FOLLOWUP_NOTIFY'
,p_compute_when=>'P9_FOLLOWUP_NOTIFY'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39961570103355111170)
,p_computation_sequence=>60
,p_computation_item=>'P9_ARTICLE_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT a.article_title',
'FROM #OWNER#.blog_v$article a',
'WHERE a.article_id = :P9_ARTICLE',
''))
,p_computation_error_message=>'Error on: Computation ARTICLE_TITLE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886652479381624972)
,p_computation_sequence=>70
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_COMMENT'', apex_escape.html(:P9_ARTICLE_TITLE))'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886668289072915546)
,p_computation_sequence=>80
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_COMMENT'')'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961570287594111171)
,p_validation_name=>'Not banned'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM #OWNER#.blog_comment_block b',
'WHERE b.active       = ''Y''',
'AND ( ( b.block_type = ''EMAIL''',
'AND b.block_value    = :P9_EMAIL )',
'OR ( b.block_type    = ''IP''',
'AND b.block_value    = owa_util.get_cgi_env(''REMOTE_ADDR'') )',
'OR ( b.block_type    = ''USER_AGENT''',
'AND b.block_value    = owa_util.get_cgi_env(''HTTP_USER_AGENT'') ) )',
'UNION ALL',
'SELECT 1',
'FROM #OWNER#.blog_comment_user u',
'WHERE u.blocked = ''Y''',
'AND u.email     = :P9_EMAIL'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'It is not possible submit comment at this time.'
,p_always_execute=>'N'
,p_error_display_location=>'ON_ERROR_PAGE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961571900689111205)
,p_validation_name=>'P9_ARTICLE is not null'
,p_validation_sequence=>20
,p_validation=>'P9_ARTICLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Commenting is not possible. You have probably open this application in other browser tab or window and session information is cleared. Return to article and try submit comment again.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(39961690578747828115)
,p_error_display_location=>'ON_ERROR_PAGE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39937010086671549052)
,p_validation_name=>'P9_LAST_NAME is null'
,p_validation_sequence=>30
,p_validation=>':P9_LAST_NAME IS NULL'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'It is not possible submit comment at this time.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(39937007661907514934)
,p_error_display_location=>'ON_ERROR_PAGE'
,p_validation_comment=>'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961570882220111203)
,p_validation_name=>'P9_FOLLOWUP_NOTIFY is Y/N'
,p_validation_sequence=>40
,p_validation=>'P9_FOLLOWUP_NOTIFY'
,p_validation2=>'Y,N'
,p_validation_type=>'ITEM_IN_VALIDATION_IN_STRING2'
,p_error_message=>'It is not possible submit comment at this time.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(39961567279700111158)
,p_error_display_location=>'ON_ERROR_PAGE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961570671861111193)
,p_validation_name=>'P9_NICK_NAME is not reserved'
,p_validation_sequence=>50
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM #OWNER#.blog_comment_user u',
'WHERE UPPER(u.nick_name) = UPPER(:P9_NICK_NAME)',
'  AND u.email != :P9_EMAIL'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#LABEL# is already reserved.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(39961564876616111135)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892782535190996455)
,p_validation_name=>'P9_NICK_NAME max length'
,p_validation_sequence=>60
,p_validation=>'LENGTH(:P9_NICK_NAME) <= 80'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 80 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(39961564876616111135)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961570503723111193)
,p_validation_name=>'P9_EMAIL address is valid'
,p_validation_sequence=>70
,p_validation=>'#OWNER#.blog_util.validate_email(:P9_EMAIL);'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter a valid #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(39961566284056111156)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892783151785003943)
,p_validation_name=>'P9_WEBSITE max length'
,p_validation_sequence=>80
,p_validation=>'LENGTH(:P9_WEBSITE) <= 256'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 256 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(39961565384442111154)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892783825690015985)
,p_validation_name=>'P9_COMMENT max length'
,p_validation_sequence=>90
,p_validation=>'LENGTH(:P9_COMMENT) <= 2000'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 2000 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(39961566797351111157)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39961572781708111218)
,p_name=>'Modal confirm dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39961566094599111156)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P9_ARTICLE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39961573097150111243)
,p_event_id=>wwv_flow_api.id(39961572781708111218)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_ORG.BLOGSITE.JARIS.MODAL_CONFIRM'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39961567772575111163)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961571973864111205)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save comment'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.save_comment(',
'  p_apex_session_id => :APP_SESSION,',
'  p_app_alias       => :APP_ALIAS,',
'  p_base_url        => :G_BASE_URL,',
'  p_blog_name       => :G_BLOG_NAME,',
'  p_article_id      => :P9_ARTICLE,',
'  p_article_title   => :P9_ARTICLE_TITLE,',
'  p_user_id         => :G_USER_ID,',
'  p_email           => :P9_EMAIL,',
'  p_nick_name       => :P9_NICK_NAME,',
'  p_website         => :P9_WEBSITE,',
'  p_followup        => :P9_FOLLOWUP_NOTIFY,',
'  -- Plugin "Comment Textarea" saves formatted and escaped comment to variable.',
'  -- Insert that to table.',
'  p_comment         => #OWNER#.blog_plugin.g_formatted_comment',
');'))
,p_process_error_message=>'Error on process: Save comment'
,p_process_when_button_id=>wwv_flow_api.id(39961566094599111156)
,p_process_success_message=>'Thank you for submitting comment.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961572201251111205)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'Error on process: Clear items'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39897284145603576847)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch BLOG_COMMENT_USER'
,p_attribute_02=>'BLOG_COMMENT_USER'
,p_attribute_03=>'G_USER_ID'
,p_attribute_04=>'USER_ID'
,p_process_error_message=>'Error on process: Automated Row Fetch '
,p_process_when=>'G_USER_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Resources'
,p_alias=>'RESOURCES'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Resources'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_inline_css=>'td[headers="LINK_TITLE"]{width:200px;}'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40075865455796876498)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>31536000
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220094949'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40064368205429845307)
,p_name=>'&P10_REGION_TITLE_USEFUL_LINKS.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_css_classes=>'resourcesmargin'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT r.link_title,',
'  r.link_text,',
'  r.link_url',
'FROM #OWNER#.blog_resource r',
'WHERE r.link_type = ''RESOURCE''',
'AND r.active = ''Y''',
'ORDER BY r.link_title'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_required_role=>wwv_flow_api.id(40075875655877839131)
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(40287792719329417690)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>25
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>25
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_query_asc_image=>'arrow_down_gray_light.gif'
,p_query_asc_image_attr=>' width="13" height="12" '
,p_query_desc_image=>'arrow_up_gray_light.gif'
,p_query_desc_image_attr=>' width="13" height="12" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895215035707240062)
,p_query_column_id=>1
,p_column_alias=>'LINK_TITLE'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_link=>'#LINK_URL#'
,p_column_linktext=>'#LINK_TITLE#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40064375420139317651)
,p_query_column_id=>2
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40064375503753317651)
,p_query_column_id=>3
,p_column_alias=>'LINK_URL'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40076243764803462111)
,p_name=>'&P10_REGION_TITLE_BLOGROLL.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select r.link_title,',
'  r.link_text,',
'  r.link_url',
'from #OWNER#.blog_resource r',
'where r.link_type = ''BLOG''',
'and r.active = ''Y''',
'order by r.link_title'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_required_role=>wwv_flow_api.id(40064376212326382094)
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(40287792719329417690)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>25
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>25
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_query_asc_image=>'arrow_down_gray_light.gif'
,p_query_asc_image_attr=>' width="13" height="12" '
,p_query_desc_image=>'arrow_up_gray_light.gif'
,p_query_desc_image_attr=>' width="13" height="12" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895214648431234135)
,p_query_column_id=>1
,p_column_alias=>'LINK_TITLE'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_link=>'#LINK_URL#'
,p_column_linktext=>'#LINK_TITLE#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40064373817169258297)
,p_query_column_id=>2
,p_column_alias=>'LINK_TEXT'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40064373913036258297)
,p_query_column_id=>3
,p_column_alias=>'LINK_URL'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_print_col_width=>'0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886653769868659797)
,p_name=>'P10_REGION_TITLE_BLOGROLL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39886655686005697906)
,p_name=>'P10_REGION_TITLE_USEFUL_LINKS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886654493350679316)
,p_computation_sequence=>10
,p_computation_item=>'P10_REGION_TITLE_BLOGROLL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_BLOGROLL'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886655794023699423)
,p_computation_sequence=>20
,p_computation_item=>'P10_REGION_TITLE_USEFUL_LINKS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_USEFUL_LINKS'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886666981060884846)
,p_computation_sequence=>30
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_RESOURCES'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886021777958238068)
,p_computation_sequence=>40
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':RESOURCES:0'''
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'File repository'
,p_alias=>'FILES'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Files'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'td[headers="LINK"],td[headers="CREATED_ON"]{white-space:nowrap!important;}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40075870469635356209)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101184636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40076257568633487880)
,p_plug_name=>'&G_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40110796863696125902)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT f.file_id',
'  ,f.description',
'  ,f.created_on',
'  ,f.file_name',
'  ,f.file_size',
'  ,(select apex_lang.message(''DOWNLOAD_LINK_TITLE'') from dual) AS link_title',
'FROM #OWNER#.blog_file f',
'WHERE f.active = ''Y''',
'  AND f.file_type = ''FILE''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(40076257742028487887)
,p_name=>'Files'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_max_rows_per_page=>'100'
,p_sort_asc_image_attr=>'style="vertical-align:top"'
,p_sort_desc_image_attr=>'style="vertical-align:top"'
,p_allow_report_saving=>'N'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_show_download=>'N'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'LAINFJAR'
,p_internal_uid=>6466204432002829
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40076677658810656972)
,p_db_column_name=>'FILE_ID'
,p_display_order=>2
,p_column_identifier=>'L'
,p_column_label=>'File ID'
,p_allow_sorting=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'FILE_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40076258267349487906)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>4
,p_column_identifier=>'I'
,p_column_label=>'File Name'
,p_column_link=>'f?p=&APP_ALIAS.:DOWNLOAD:0:#FILE_NAME#'
,p_column_linktext=>'#FILE_NAME#'
,p_column_link_attr=>'rel="nofollow" title="#LINK_TITLE#"'
,p_column_link_checksum_type=>'1'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'FILE_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40076365539534856864)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>5
,p_column_identifier=>'J'
,p_column_label=>'File Size'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_tz_dependent=>'N'
,p_static_id=>'FILE_SIZE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40076257861526487901)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>11
,p_column_identifier=>'B'
,p_column_label=>'Description'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'DESCRIPTION'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40076257941461487905)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>12
,p_column_identifier=>'C'
,p_column_label=>'Created'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_static_id=>'CREATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39886733873055075924)
,p_db_column_name=>'LINK_TITLE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Link Title'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_static_id=>'LINK_TITLE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(40076258345586487906)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64669'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'FILE_NAME:FILE_SIZE:DESCRIPTION:CREATED_ON:FILE_ID:LINK_TITLE'
,p_sort_column_1=>'CREATED_ON'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886657467535729637)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_FILES'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886665580105865696)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_FILES'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886022088081248597)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':FILES:0'''
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Visitors'
,p_alias=>'VISITORS'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Visitors'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40075862654767816150)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220095011'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40033624850612378878)
,p_plug_name=>'&G_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40110796863696125902)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source_type=>'NATIVE_FLASH_MAP'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_header=>'<a href="http://www.hostip.info"><img style="vertical-align:middle;" src="&G_THEME_PATH.hostip-info-86x18.gif" alt="hostip.info" /> My IP Address Lookup </a>'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(40033625030942378886)
,p_default_chart_type=>'Map'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_22269404799758900'
,p_chart_width=>700
,p_chart_height=>450
,p_chart_animation=>'Appear'
,p_display_attr=>':H:::B::N::V:Y:None:::::::::'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E'
,p_pie_attr=>'Outside:::'
,p_map_attr=>'Equirectangular:RegionBounds:REGION_NAME:Y:Y:Series::::N:'
,p_map_source=>'world/world.amap'
,p_margins=>'26:::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_bgtype=>'Trans'
,p_color_scheme=>'7'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:#000000'
,p_y_axis_title_font=>'Tahoma:14:#000000'
,p_gauge_labels_font=>'Tahoma:10:#000000'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(40033625147246378886)
,p_chart_id=>wwv_flow_api.id(40033625030942378886)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT NULL AS link_col',
'  ,v.country_name',
'  ,SUM(v.visit_count) AS visit_count',
' FROM blog_country v',
'WHERE v.country_code != ''XX''',
'  AND v.visit_count > 0',
'GROUP BY NULL',
'  ,v.country_name',
'ORDER BY 3',
''))
,p_series_type=>'Map'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'No data found.'
,p_series_query_row_count_max=>300
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886658170091739785)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_VISITOR_MAP'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886664376511855198)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_VISITOR'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886022684187265548)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':VISITORS:0'''
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'FAQ'
,p_alias=>'FAQ'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'FAQ'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'"CANONICAL_URL"',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40075928553054290123)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101184639'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40076255437682479560)
,p_name=>'&G_REGION_TITLE.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'WITH qry AS (',
'  SELECT ',
'     ROW_NUMBER() OVER(ORDER BY f.faq_seq) AS n',
'    ,f.question',
'    ,f.answer',
'  FROM #OWNER#.blog_faq f',
'  WHERE f.active =  ''Y''',
')',
'SELECT',
'   APEX_LANG.MESSAGE(''FAQ_QUESTION'', qry.n) AS faq_no',
'  ,qry.question',
'  ,qry.answer',
'FROM qry',
'ORDER BY qry.n'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(40076502642034533531)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>50
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39886018264544031606)
,p_query_column_id=>1
,p_column_alias=>'FAQ_NO'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076256342178479568)
,p_query_column_id=>2
,p_column_alias=>'QUESTION'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076256453623479568)
,p_query_column_id=>3
,p_column_alias=>'ANSWER'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886659663427756830)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_FAQ'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886663066337842778)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_FAQ'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886022972541270957)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'''f?p='' || :APP_ALIAS || '':FAQ:0''',
''))
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Authors'
,p_alias=>'AUTHORS'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Authors'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40075870763381359069)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220095030'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(40076260968069499528)
,p_name=>'&G_REGION_TITLE.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ',
'  a.author_name,',
'  a.bio,',
'  a.author_seq,',
'  a.author_id',
'FROM #OWNER#.blog_author a',
'WHERE a.active = ''Y''',
'ORDER BY a.author_seq'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(40080423644503574383)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>5
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076261264550499532)
,p_query_column_id=>1
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40076261355274499532)
,p_query_column_id=>2
,p_column_alias=>'BIO'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39904474688984340637)
,p_query_column_id=>3
,p_column_alias=>'AUTHOR_SEQ'
,p_column_display_sequence=>4
,p_column_heading=>'Author Seq'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(40052958895594667425)
,p_query_column_id=>4
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886660878411817933)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_AUTHOR'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886661787546830011)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_AUTHOR'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886023293232276565)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':AUTHORS:0'''
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Contact form'
,p_alias=>'CONTACT'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40062374723693666567)
,p_required_patch=>wwv_flow_api.id(39895229831671791632)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_browser_cache=>'N'
,p_deep_linking=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101191549'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39961015271625516222)
,p_plug_name=>'Confirm dialog'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40075969247190729176)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'"MSG_CONFIRM_COMMENT"'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(40062392012362350397)
,p_plug_name=>'&G_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40110796863696125902)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>"MSG_CONTACT_FORM"</p>',
'<p>"MSG_REQUIRED_FIELDS"</p>'))
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40062402800306526704)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_button_name=>'P15_CANCEL'
,p_button_static_id=>'P15_CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BODY'
,p_button_alignment=>'RIGHT-BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ALIAS.:HOME:0'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40062401632457431875)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_button_name=>'P15_SUBMIT'
,p_button_static_id=>'P15_SUBMIT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(40062397606235377558)
,p_branch_name=>'Goto home page'
,p_branch_action=>'1'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39892728527705408605)
,p_name=>'P15_MATH_QUESTION_ANSWER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(39897068156335907551)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39892775649379962175)
,p_name=>'P15_NO_HTML_CODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_item_default=>'"MSG_NO_HTML"'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'BELOW'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39897294853821777602)
,p_name=>'P15_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Your Last Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>80
,p_cHeight=>1
,p_cattributes_element=>'class="hideMe508"'
,p_tag_attributes=>'required'
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(39961478580778709119)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_LAST_NAME" It will be displayed in comment posted by.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_item_comment=>'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961019798404893337)
,p_name=>'P15_MATH_QUESTION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Question answer'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.MATH_QUESTION_FIELD'
,p_cSize=>10
,p_cMaxlength=>20
,p_cHeight=>1
,p_tag_attributes=>'style="text-align:right"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(40879134601304522628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_security_scheme=>wwv_flow_api.id(40052862102538418540)
,p_attribute_01=>'P15_MATH_QUESTION_ANSWER'
,p_attribute_02=>'1'
,p_attribute_03=>'46'
,p_attribute_04=>'1'
,p_attribute_05=>'46'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062394227019350515)
,p_name=>'P15_COMMENT'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Your Comment'
,p_display_as=>'PLUGIN_ORG.BLOGSITE.JARIS.COMMENT_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>10
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Enter your message to author(s). "MSG_NO_HTML"'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062394409639350517)
,p_name=>'P15_EMAIL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Your Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>256
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_EMAIL"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062394600842350517)
,p_name=>'P15_NICK_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Your Name'
,p_source=>'NICK_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>80
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701942359593396)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_NICK_NAME"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(40062394801596350517)
,p_name=>'P15_WEBSITE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(40062392012362350397)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Your Website'
,p_source=>'WEBSITE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>256
,p_cHeight=>1
,p_label_alignment=>'ABOVE'
,p_field_template=>wwv_flow_api.id(40070701838203592139)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'"HELP_WEBSITE"'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39897303642149001517)
,p_computation_sequence=>10
,p_computation_item=>'P15_NICK_NAME'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(:P15_NICK_NAME)'
,p_computation_error_message=>'Error on: Computation NICK'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39897303845266002477)
,p_computation_sequence=>20
,p_computation_item=>'P15_EMAIL'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(LOWER(:P15_EMAIL))'
,p_computation_error_message=>'Error on: Computation EMAIL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39897304048729003427)
,p_computation_sequence=>30
,p_computation_item=>'P15_WEBSITE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'TRIM(:P15_WEBSITE)'
,p_computation_error_message=>'Error on: Computation WEBSITE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886691876417355655)
,p_computation_sequence=>40
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_CONTACT'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886692665018372243)
,p_computation_sequence=>50
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_CONTACT'')'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961023402204115245)
,p_validation_name=>'Not banned'
,p_validation_sequence=>10
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM #OWNER#.blog_comment_block b',
'WHERE b.active       = ''Y''',
'AND ( ( b.block_type = ''EMAIL''',
'AND b.block_value    = :P15_EMAIL )',
'OR ( b.block_type    = ''IP''',
'AND b.block_value    = owa_util.get_cgi_env(''REMOTE_ADDR'') )',
'OR ( b.block_type    = ''USER_AGENT''',
'AND b.block_value    = owa_util.get_cgi_env(''HTTP_USER_AGENT'') ) )',
'UNION ALL',
'SELECT 1',
'FROM #OWNER#.blog_comment_user u',
'WHERE u.blocked = ''Y''',
'AND u.email     = :P15_EMAIL'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'It is not possible submit comment at this time.'
,p_always_execute=>'N'
,p_error_display_location=>'ON_ERROR_PAGE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39897295450802778992)
,p_validation_name=>'P15_LAST_NAME is null'
,p_validation_sequence=>20
,p_validation=>':P15_LAST_NAME IS NULL'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'It is not possible submit comment at this time.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(39897294853821777602)
,p_error_display_location=>'ON_ERROR_PAGE'
,p_validation_comment=>'Field is not for human input. It looks field where user should fill last name, but field purpose is prevent bots insert comments. Whole row hidden where item is. Validation checks that this field is always empty.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892779738271919071)
,p_validation_name=>'P15_NICK_NAME max length'
,p_validation_sequence=>30
,p_validation=>'LENGTH(:P15_NICK_NAME) <= 80'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 80 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(40062394600842350517)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961023792930119482)
,p_validation_name=>'P15_NICK_NAME is not reserved'
,p_validation_sequence=>40
,p_validation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT 1',
'FROM #OWNER#.blog_comment_user',
'WHERE UPPER(nick_name) = UPPER(:P15_NICK_NAME)',
'  AND email != :P15_EMAIL'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'#LABEL# is already reserved.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(40062394600842350517)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39961023595949118076)
,p_validation_name=>'P15_EMAIL address is valid'
,p_validation_sequence=>50
,p_validation=>'#OWNER#.blog_util.validate_email(:P15_EMAIL);'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter a valid #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(40062394409639350517)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892780548395929545)
,p_validation_name=>'P15_WEBSITE max length'
,p_validation_sequence=>60
,p_validation=>'LENGTH(:P15_WEBSITE) <= 256'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 256 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(40062394801596350517)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(39892781551821958362)
,p_validation_name=>'P15_COMMENT max length'
,p_validation_sequence=>70
,p_validation=>'LENGTH(:P15_COMMENT) <= 2000'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 2000 characters for #LABEL#.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(40062394227019350515)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39895235455389378423)
,p_name=>'Modal confirm dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40062401632457431875)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39895235752801378427)
,p_event_id=>wwv_flow_api.id(39895235455389378423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_ORG.BLOGSITE.JARIS.MODAL_CONFIRM'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39961015271625516222)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961026674850242502)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save contact message'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.save_contact(',
'  p_user_id         => :G_USER_ID,',
'  p_apex_session_id => :APP_SESSION,',
'  p_email           => :P15_EMAIL,',
'  p_nick_name       => :P15_NICK_NAME,',
'  p_website         => :P15_WEBSITE,',
'  -- Plugin "Comment Textarea" saves formatted and escaped comment to variable.',
'  -- Insert that to table.',
'  p_comment         => #OWNER#.blog_plugin.g_formatted_comment',
');'))
,p_process_error_message=>'Error on process: Save message'
,p_process_when_button_id=>wwv_flow_api.id(40062401632457431875)
,p_process_success_message=>'Thank you for submitting message.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961027075112261503)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'Error on process: Clear items'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39897291060157656744)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch BLOG_COMMENT_USER'
,p_attribute_02=>'BLOG_COMMENT_USER'
,p_attribute_03=>'G_USER_ID'
,p_attribute_04=>'USER_ID'
,p_process_error_message=>'Error on process: Automated Row Fetch '
,p_process_when=>'G_USER_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'About'
,p_alias=>'ABOUT'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'About'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(39961033589213713689)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220095052'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39961562697474103546)
,p_name=>'&G_REGION_TITLE.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT t.long_text',
'FROM #OWNER#.blog_long_text t',
'WHERE t.long_text_id = ''ABOUT''',
'ORDER BY t.long_text_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961038376631810701)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>1
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39903764386720521589)
,p_query_column_id=>1
,p_column_alias=>'LONG_TEXT'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886694267334390168)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_ABOUT'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886693777470385514)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_ABOUT'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886023578783283257)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':ABOUT:0'''
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Disclaimer'
,p_alias=>'DISCLAIMER'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(39896717934259090401)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141220094749'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39896718861260147394)
,p_name=>'&G_REGION_TITLE.'
,p_template=>wwv_flow_api.id(40110796863696125902)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT t.long_text',
'FROM #OWNER#.blog_long_text t',
'WHERE t.long_text_id = ''DISCLAIMER''',
'ORDER BY t.long_text_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961038376631810701)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>1
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39896719029470147399)
,p_query_column_id=>1
,p_column_alias=>'LONG_TEXT'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886694987379396141)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_DISCLAIMER'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886695182418398410)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_DISCLAIMER'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886023862393290837)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':DISCLAIMER:0'''
);
end;
/
prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Photo Gallery'
,p_alias=>'PHOTOS'
,p_page_mode=>'NORMAL'
,p_step_title=>'&G_PAGE_TITLE.'
,p_step_sub_title=>'Photo Gallery'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"CANONICAL_URL"'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(39886722681325477546)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20150101184705'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39886707079158972318)
,p_plug_name=>'&G_REGION_TITLE.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40110796863696125902)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<p>"MSG_PHOTO_GALLERY"</p>'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39886703695142858718)
,p_plug_name=>'Photo Gallery'
,p_parent_plug_id=>wwv_flow_api.id(39886707079158972318)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032998587124987)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(39886703478971858715)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(39886703093807758931)
,p_translate_title=>'N'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886698376613612557)
,p_computation_sequence=>10
,p_computation_item=>'G_REGION_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''REGION_TITLE_PHOTOS'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886698568365612557)
,p_computation_sequence=>20
,p_computation_item=>'G_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_lang.message(''PAGE_TITLE_PHOTOS'')'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(39886698177873612557)
,p_computation_sequence=>30
,p_computation_item=>'G_CANONICAL_HREF'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'''f?p='' || :APP_ALIAS || '':PHOTOS:0'''
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39886706082444935373)
,p_name=>'Set Photo Gallery'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39886706367943935378)
,p_event_id=>wwv_flow_api.id(39886706082444935373)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39886703695142858718)
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'this.affectedElements.bjqs({',
' animtype:"fade",',
' height:400,',
' width:700,',
' usecaptions:true,',
' showcontrols:false,',
' responsive:true,',
' automatic:true',
'});'))
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'RSS feed'
,p_alias=>'RSS'
,p_page_mode=>'NORMAL'
,p_step_title=>'RSS feed'
,p_step_sub_title=>'RSS feed'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_step_template=>wwv_flow_api.id(39897321954549875493)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(40053065590851875881)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20140718133628'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961558002723036243)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Output RSS feed'
,p_process_sql_clob=>'#OWNER#.blog_xml.rss(:APP_ALIAS, :G_BLOG_NAME, :G_BASE_URL);'
,p_process_error_message=>'Error on process:RSS feed'
);
end;
/
prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Sitemap'
,p_alias=>'SITEMAP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Sitemap'
,p_step_sub_title=>'Sitemap'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_step_template=>wwv_flow_api.id(39897321954549875493)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(39892825025177703730)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20141206175628'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961559189149042410)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Output sitemap'
,p_process_sql_clob=>'#OWNER#.blog_xml.sitemap(:APP_ID, :APP_ALIAS, :G_BASE_URL, ''TABS'');'
,p_process_error_message=>'Error on process: Sitemap'
);
end;
/
prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Download'
,p_alias=>'DOWNLOAD'
,p_page_mode=>'NORMAL'
,p_step_title=>'Download'
,p_step_sub_title=>'Download'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_step_template=>wwv_flow_api.id(39897321954549875493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20160907155900'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39889003574392139500)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get file'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.download_file(',
'  p_file_name  => :REQUEST,',
'  p_session_id => :APP_SESSION,',
'  p_user_id    => :G_USER_ID',
');'))
,p_process_error_message=>'Error on process:RSS feed'
);
end;
/
prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Unsubscribe'
,p_alias=>'UNSUBSCRIBE'
,p_page_mode=>'NORMAL'
,p_step_title=>'Unsubscribe'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Unsubscribe'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40076000449189847992)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_step_template=>wwv_flow_api.id(39897321954549875493)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20140719110925'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39961561273808085521)
,p_branch_name=>'Goto article'
,p_branch_action=>'3'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'SUBSCRIBER_ID'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39961561491464085521)
,p_branch_name=>'Goto home page'
,p_branch_action=>'HOME_LINK'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'BRANCH_TO_URL_IDENT_BY_ITEM'
,p_branch_sequence=>20
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40075847456451220850)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_step_template=>wwv_flow_api.id(39961492601395645791)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'U'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20140728121852'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39961476903891704882)
,p_plug_name=>'Login Page'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(40120032998587124987)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39961477472171704883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39961476903891704882)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(40075508050872720857)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961477097266704882)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39961476903891704882)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(39961478580778709119)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961477295584704883)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39961476903891704882)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(39961478580778709119)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961477874005704883)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'  p_username => lower(:P101_USERNAME)',
');'))
,p_process_error_message=>'Error on process: Set Username Cookie'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961477699877704883)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login (',
'  p_username => :P101_USERNAME,',
'  p_password => :P101_PASSWORD',
');'))
,p_process_error_message=>'Error on process: Login'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961478298488704884)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_error_message=>'Error on process: Clear Page(s) Cache'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39961478076274704884)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_error_message=>'Error on process: Get Username Cookie'
);
end;
/
prompt --application/pages/page_00201
begin
wwv_flow_api.create_page(
 p_id=>201
,p_user_interface_id=>wwv_flow_api.id(40120088541813336422)
,p_name=>'Article preview'
,p_alias=>'PREVIEW'
,p_page_mode=>'NORMAL'
,p_step_title=>'Article preview'
,p_step_sub_title=>'Article preview'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(40075847456451220850)
,p_html_page_header=>'"ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20140725083506'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39961555093345014139)
,p_name=>'Read Article'
,p_template=>wwv_flow_api.id(40120032998587124987)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_item_display_point=>'BELOW'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT',
'  a.category_id',
'  ,a.author_id',
'  ,a.article_title',
'  ,c.category_name',
'  ,SYSDATE AS created_on',
'  ,b.author_name',
'  ,a.article_text',
'  ,0 AS comment_count',
'  ,(SELECT APEX_LANG.LANG(''Posted on'') FROM DUAL) AS created_on_txt',
'  ,(SELECT APEX_LANG.LANG(''by'') FROM DUAL) AS posted_by_txt',
'  ,(SELECT APEX_LANG.LANG(''Category'') FROM DUAL) AS category_txt',
'  ,(SELECT APEX_LANG.LANG(''Post a Comment'') FROM DUAL) AS post_comment',
'FROM blog_article_preview a',
'  LEFT JOIN blog_author b ON a.author_id = b.author_id',
'  LEFT JOIN blog_category c ON a.category_id = c.category_id',
'WHERE a.apex_session_id = :P201_ARTICLE',
'ORDER BY a.author_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(39961663273318381048)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No articles found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>1
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961699693083731588)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39896748034472725235)
,p_query_column_id=>2
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>2
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39895215447556249758)
,p_query_column_id=>3
,p_column_alias=>'ARTICLE_TITLE'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span>#ARTICLE_TITLE#</span>'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961699795228731588)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY_NAME'
,p_column_display_sequence=>4
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961555475230014153)
,p_query_column_id=>5
,p_column_alias=>'CREATED_ON'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39896748152158725235)
,p_query_column_id=>6
,p_column_alias=>'AUTHOR_NAME'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961555381321014153)
,p_query_column_id=>7
,p_column_alias=>'ARTICLE_TEXT'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961699873317731588)
,p_query_column_id=>8
,p_column_alias=>'COMMENT_COUNT'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39896748458613729286)
,p_query_column_id=>9
,p_column_alias=>'CREATED_ON_TXT'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961700000714731588)
,p_query_column_id=>10
,p_column_alias=>'POSTED_BY_TXT'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961577793627205964)
,p_query_column_id=>11
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39961700196917731588)
,p_query_column_id=>12
,p_column_alias=>'POST_COMMENT'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="comment-link">#POST_COMMENT#<img src="&G_THEME_PATH.nav_feedback.png" alt="" /></span>'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39961693094632911899)
,p_name=>'P201_ARTICLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(40285078429598436487)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(39886630176487953529)
,p_welcome_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This application installer will guide you through the process of creating database objects, meta data, image files, JavaScript and CSS necessary to run the APEX Blogging Platform application.',
''))
,p_license_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<b>APEX Blogging Platform</b><br/>',
'Version : 2.9.0.2 (APEX 5) <br/>',
'Date : 07.09.2016<br/>',
'License : https://sourceforge.net/p/apex-blog/wiki/License/ <br/>',
''))
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_install_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'APEX Blogging Platform supporting objects have been installed successfully.',
'',
'To get started, login to blog admin application.',
'Account have been set up so you can log in as sample administrator using the following username / password:',
'admin / admin',
''))
,p_install_failure_message=>'Installation of database objects and meta data has failed.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Upgrade script will recreate all previously installed database packages.  Your changes to those objects will be lost!</p>',
'<p>Please confirm that you would like to install this application''s supporting objects.</p>'))
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from sys.user_procedures p',
'where p.object_type = ''PACKAGE''',
'and p.object_name = ''BLOG_INSTALL''',
'and p.procedure_name = ''UPDATE_PARAM_DATA''',
'and exists (',
'  select 1',
'  from sys.user_objects o',
'  where o.object_id = p.object_id',
'  and o.object_type = p.object_type ',
'  and o.object_name = p.object_name',
')'))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  blog_install.set_jobs(true);',
'END;',
'/',
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK3"',
'/',
'ALTER TABLE "BLOG_ARTICLE_LOG" DROP CONSTRAINT "BLOG_ARTICLE_LOG_FK1"',
'/',
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK2"',
'/',
'ALTER TABLE "BLOG_COMMENT_NOTIFY" DROP CONSTRAINT "BLOG_COMMENT_NOTIFY_FK1"',
'/',
'ALTER TABLE "BLOG_FILE_LOG" DROP CONSTRAINT "BLOG_FILES_LOG_FK1"',
'/',
'ALTER TABLE "BLOG_ARTICLE" DROP CONSTRAINT "BLOG_ARTICLE_FK1"',
'/',
'ALTER TABLE "BLOG_CONTACT_MESSAGE" DROP CONSTRAINT "BLOG_CONTACT_MESSAGE_FK1";',
'/',
'ALTER TABLE "BLOG_AUTHOR" DROP CONSTRAINT "BLOG_AUTHOR_FK1"',
'/',
'ALTER TABLE "BLOG_COMMENT" DROP CONSTRAINT "BLOG_COMMENT_FK1"',
'/',
'ALTER TABLE "BLOG_COMMENT_NOTIFY" DROP CONSTRAINT "BLOG_COMMENT_NOTIFY_FK2"',
'/',
'ALTER TABLE "BLOG_CATEGORY_LOG" DROP CONSTRAINT "BLOG_CATEGORY_LOG_FK1"',
'/',
'ALTER TABLE "BLOG_ARTICLE" DROP CONSTRAINT "BLOG_ARTICLE_FK2"',
'/',
'ALTER TABLE  BLOG_PARAM_APP DROP CONSTRAINT BLOG_PARAM_APP_FK1',
'/',
'DROP TABLE "BLOG_COMMENT"',
'/    ',
'DROP TABLE "BLOG_FAQ"',
'/    ',
'DROP TABLE "BLOG_FILE_LOG"',
'/    ',
'DROP TABLE "BLOG_COMMENT_BLOCK"',
'/    ',
'DROP TABLE "BLOG_CONTACT_MESSAGE"',
'/',
'DROP TABLE "BLOG_ACTIVITY_LOG2"',
'/',
'DROP TABLE "BLOG_PARAM"',
'/    ',
'DROP TABLE "BLOG_COUNTRY"',
'/',
'DROP TABLE "BLOG_ARTICLE"',
'/',
'DROP TABLE "BLOG_FILE"',
'/',
'DROP TABLE "BLOG_ARTICLE_PREVIEW"',
'/',
'DROP TABLE "BLOG_AUTHOR"',
'/',
'DROP TABLE "BLOG_COMMENT_USER"',
'/',
'DROP TABLE "BLOG_CATEGORY"',
'/',
'DROP TABLE "BLOG_ARTICLE_LOG"',
'/',
'DROP TABLE "BLOG_CATEGORY_LOG"',
'/',
'DROP TABLE "BLOG_RESOURCE"',
'/',
'DROP TABLE "BLOG_ACTIVITY_LOG1"',
'/',
'DROP TABLE "BLOG_COMMENT_NOTIFY"',
'/',
'DROP TABLE "BLOG_LONG_TEXT";',
'/',
'DROP TABLE "BLOG_HTTP410"',
'/',
'DROP VIEW "BLOG_V$ACTIVITY"',
'/    ',
'DROP VIEW "BLOG_V$ACTIVITY_LOG"',
'/    ',
'DROP VIEW "BLOG_V$ARTICLE"',
'/    ',
'DROP SYNONYM "BLOG_ACTIVITY_LOG"',
'/',
'DROP SEQUENCE "BLOG_SEQ"',
'/    ',
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_TOP20"',
'/',
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_LAST20"',
'/    ',
'DROP MATERIALIZED VIEW "BLOG_ARTICLE_HIT20"',
'/    ',
'DROP MATERIALIZED VIEW "BLOG_ARCHIVE_LOV"',
'/',
'DROP MATERIALIZED VIEW "BLOG_COMMENT_LOG"',
'/',
'DROP MATERIALIZED VIEW BLOG_PARAM_APP',
'/',
'DROP PACKAGE BLOG_ADMIN_APP',
'/    ',
'DROP PACKAGE BLOG_JOB',
'/',
'DROP PACKAGE BLOG_PLUGIN',
'/',
'DROP PACKAGE BLOG_LOG',
'/    ',
'DROP PACKAGE BLOG_UTIL',
'/    ',
'DROP PACKAGE BLOG_XML',
'/',
'DROP PACKAGE BLOG_INSTALL',
'/    ',
'DROP FUNCTION BLOG_SGID',
'/',
'DROP FUNCTION BLOG_PW_HASH',
'/',
''))
,p_required_free_kb=>6400
,p_required_sys_privs=>'CREATE MATERIALIZED VIEW:CREATE PROCEDURE:CREATE SEQUENCE:CREATE SYNONYM:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
end;
/
prompt --application/deployment/install
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890502782606935217)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'1 Table'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE TABLE  BLOG_ACTIVITY_LOG1',
'(    ACTIVITY_DATE DATE DEFAULT SYSDATE,',
'ACTIVITY_TYPE VARCHAR2(40 CHAR),',
'APEX_SESSION_ID NUMBER(38,0),',
'RELATED_ID NUMBER(38,0),',
'IP_ADDRESS VARCHAR2(500 CHAR),',
'USER_ID NUMBER(38,0),',
'LATITUDE NUMBER(9,6),',
'LONGITUDE NUMBER(9,6),',
'COUNTRY_CODE VARCHAR2(2 CHAR),',
'COUNTRY_REGION VARCHAR2(256 CHAR),',
'COUNTRY_CITY VARCHAR2(256 CHAR),',
'HTTP_USER_AGENT VARCHAR2(2000 CHAR),',
'HTTP_REFERER VARCHAR2(2000 CHAR),',
'SEARCH_TYPE VARCHAR2(80 CHAR),',
'SEARCH_CRITERIA VARCHAR2(4000 CHAR),',
'ADDITIONAL_INFO VARCHAR2(4000 CHAR)',
') NOLOGGING',
'/',
'CREATE TABLE  BLOG_ACTIVITY_LOG2',
'(    ACTIVITY_DATE DATE DEFAULT SYSDATE,',
'ACTIVITY_TYPE VARCHAR2(40 CHAR),',
'APEX_SESSION_ID NUMBER(38,0),',
'RELATED_ID NUMBER(38,0),',
'IP_ADDRESS VARCHAR2(500 CHAR),',
'USER_ID NUMBER(38,0),',
'LATITUDE NUMBER(9,6),',
'LONGITUDE NUMBER(9,6),',
'COUNTRY_CODE VARCHAR2(2 CHAR),',
'COUNTRY_REGION VARCHAR2(256 CHAR),',
'COUNTRY_CITY VARCHAR2(256 CHAR),',
'HTTP_USER_AGENT VARCHAR2(2000 CHAR),',
'HTTP_REFERER VARCHAR2(2000 CHAR),',
'SEARCH_TYPE VARCHAR2(80 CHAR),',
'SEARCH_CRITERIA VARCHAR2(4000 CHAR),',
'ADDITIONAL_INFO VARCHAR2(4000 CHAR)',
') NOLOGGING',
'/',
'CREATE TABLE  BLOG_COMMENT_USER',
'(    USER_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'EMAIL VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'NICK_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'BLOCKED VARCHAR2(1 BYTE) DEFAULT ''N'' NOT NULL ENABLE,',
'BLOCKED_ON DATE,',
'WEBSITE VARCHAR2(256 CHAR),',
'USER_TYPE VARCHAR2(1 BYTE) DEFAULT ''R'' NOT NULL ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_PK PRIMARY KEY (USER_ID) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_UK1 UNIQUE (EMAIL) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_UK2 UNIQUE (NICK_NAME) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_CK1 CHECK (USER_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_CK2 CHECK (BLOCKED IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_CK3 CHECK ((BLOCKED = ''N'' AND BLOCKED_ON IS NULL) OR (BLOCKED = ''Y'' AND BLOCKED_ON IS NOT NULL)) ENABLE,',
'CONSTRAINT BLOG_COMMENT_USER_CK4 CHECK (USER_TYPE IN(''R'', ''A'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_AUTHOR',
'(    AUTHOR_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'EMAIL VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'TWITTER VARCHAR2(256 CHAR),',
'USER_NAME VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'PASSWD VARCHAR2(2000 CHAR),',
'AUTHOR_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'BIO VARCHAR2(4000 CHAR),',
'AUTHOR_SEQ NUMBER(38,0) NOT NULL ENABLE,',
'EMAIL_NOTIFY VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'CONSTRAINT BLOG_AUTHOR_PK PRIMARY KEY (AUTHOR_ID) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_UK1 UNIQUE (EMAIL) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_UK2 UNIQUE (USER_NAME) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_UK3 UNIQUE (AUTHOR_SEQ) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_CK1 CHECK (AUTHOR_ID > 0) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_CK2 CHECK (AUTHOR_SEQ > 0) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_CK3 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_AUTHOR_CK4 CHECK (EMAIL_NOTIFY IN(''Y'', ''N'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_CATEGORY',
'(    CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'CATEGORY_NAME VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CATEGORY_SEQ NUMBER(38,0) NOT NULL ENABLE,',
'CONSTRAINT BLOG_CATEGORY_PK PRIMARY KEY (CATEGORY_ID) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_UK1 UNIQUE (CATEGORY_NAME) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_UK2 UNIQUE (CATEGORY_SEQ) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_CK1 CHECK (CATEGORY_ID > 0) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_CK3 CHECK (CATEGORY_SEQ > 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_ARTICLE',
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'AUTHOR_ID NUMBER(38,0) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''N'' NOT NULL ENABLE,',
'CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,',
'ARTICLE_TITLE VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'ARTICLE_TEXT CLOB,',
'DESCRIPTION VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'ARTICLE_LENGTH NUMBER(38,0) NOT NULL ENABLE,',
'YEAR_MONTH_NUM NUMBER(6,0) NOT NULL ENABLE,',
'VALID_FROM DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'KEYWORDS VARCHAR2(256 CHAR) NOT NULL,',
'HASTAGS VARCHAR2(256 CHAR),',
'CONSTRAINT BLOG_ARTICLE_PK PRIMARY KEY (ARTICLE_ID) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_CK1 CHECK (ARTICLE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_CK2 CHECK (AUTHOR_ID > 0) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_CK3 CHECK (CATEGORY_ID > 0) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_CK4 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_CK5 CHECK (ARTICLE_LENGTH >= 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_ARTICLE_LOG',
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,',
'VIEW_COUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,',
'ARTICLE_RATE NUMBER DEFAULT 0 NOT NULL ENABLE,',
'ARTICLE_RATE_INT NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,',
'RATE_CLICK NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,',
'LAST_VIEW DATE,',
'LAST_RATE DATE,',
'CONSTRAINT BLOG_ARTICLE_LOG_PK PRIMARY KEY (ARTICLE_ID) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_LOG_CK1 CHECK (ARTICLE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_LOG_CK2 CHECK (VIEW_COUNT >= 0) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_LOG_CK3 CHECK (ARTICLE_RATE BETWEEN 0 AND 5) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_LOG_CK4 CHECK (ARTICLE_RATE_INT BETWEEN 0 AND 5) ENABLE,',
'CONSTRAINT BLOG_ARTICLE_LOG_CK5 CHECK (RATE_CLICK >= 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_ARTICLE_PREVIEW',
'(    APEX_SESSION_ID NUMBER(38,0) NOT NULL ENABLE,',
'AUTHOR_ID NUMBER(38,0),',
'CATEGORY_ID NUMBER(38,0),',
'ARTICLE_TITLE VARCHAR2(256 CHAR),',
'ARTICLE_TEXT CLOB,',
'CONSTRAINT BLOG_ARTICLE_PREVIEW_PK PRIMARY KEY (APEX_SESSION_ID) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_CATEGORY_LOG',
'(    CATEGORY_ID NUMBER(38,0) NOT NULL ENABLE,',
'VIEW_COUNT NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,',
'LAST_VIEW DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CONSTRAINT BLOG_CATEGORY_LOG_PK PRIMARY KEY (CATEGORY_ID) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_LOG_CK1 CHECK (CATEGORY_ID > 0) ENABLE,',
'CONSTRAINT BLOG_CATEGORY_LOG_CK2 CHECK (VIEW_COUNT > 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_COMMENT',
'(    COMMENT_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'USER_ID NUMBER(38,0) NOT NULL ENABLE,',
'APEX_SESSION_ID NUMBER(38,0) NOT NULL ENABLE,',
'ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,',
'COMMENT_TEXT VARCHAR2(4000 CHAR) NOT NULL ENABLE,',
'MODERATED VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'MODERATED_ON DATE DEFAULT SYSDATE,',
'PARENT_ID NUMBER(38,0),',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'NOTIFY_EMAIL_SENT VARCHAR2(1 BYTE) DEFAULT ''N'' NOT NULL ENABLE,',
'NOTIFY_EMAIL_SENT_ON DATE,',
'CONSTRAINT BLOG_COMMENT_PK PRIMARY KEY (COMMENT_ID) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK1 CHECK (COMMENT_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK2 CHECK (USER_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK3 CHECK (ARTICLE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK4 CHECK (PARENT_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK5 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK6 CHECK (MODERATED IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK7 CHECK (MODERATED=''N'' AND MODERATED_ON IS NULL OR MODERATED=''Y'' AND MODERATED_ON IS NOT NULL) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK9 CHECK (NOTIFY_EMAIL_SENT=''N'' AND NOTIFY_EMAIL_SENT_ON IS NULL OR NOTIFY_EMAIL_SENT=''Y'' AND NOTIFY_EMAIL_SENT_ON IS NOT NULL) ENABLE,',
'CONSTRAINT BLOG_COMMENT_CK8 CHECK (NOTIFY_EMAIL_SENT IN(''Y'',''N'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_COMMENT_BLOCK',
'(    BLOCK_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'BLOCK_TYPE VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'BLOCK_VALUE VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'CONSTRAINT BLOG_COMMENT_BLOCK_PK PRIMARY KEY (BLOCK_ID) ENABLE,',
'CONSTRAINT BLOG_COMMENT_BLOCK_UK1 UNIQUE (BLOCK_VALUE) ENABLE,',
'CONSTRAINT BLOG_COMMENT_BLOCK_CK1 CHECK (BLOCK_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_BLOCK_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_COMMENT_BLOCK_CK3 CHECK (BLOCK_TYPE IN(''EMAIL'', ''IP'', ''USER_AGENT'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_COMMENT_NOTIFY',
'(    ARTICLE_ID NUMBER(38,0) NOT NULL ENABLE,',
'USER_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'FOLLOWUP_NOTIFY VARCHAR2(1 BYTE) NOT NULL ENABLE,',
'CONSTRAINT BLOG_COMMENT_NOTIFY_PK PRIMARY KEY (ARTICLE_ID, USER_ID) ENABLE,',
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK1 CHECK (ARTICLE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK2 CHECK (USER_ID > 0) ENABLE,',
'CONSTRAINT BLOG_COMMENT_NOTIFY_CK3 CHECK (FOLLOWUP_NOTIFY IN(''Y'',''N'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_CONTACT_MESSAGE',
'(    CONTACT_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'PROCESSED VARCHAR2(1 BYTE) DEFAULT ''N'' NOT NULL ENABLE,',
'USER_ID NUMBER(38,0) NOT NULL ENABLE,',
'APEX_SESSION_ID NUMBER(38,0) NOT NULL ENABLE,',
'MESSAGE VARCHAR2(4000 CHAR) NOT NULL ENABLE,',
'CONSTRAINT BLOG_CONTACT_MESSAGE_PK PRIMARY KEY (CONTACT_ID) ENABLE,',
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK1 CHECK (CONTACT_ID > 0) ENABLE,',
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK2 CHECK (USER_ID > 0) ENABLE,',
'CONSTRAINT BLOG_CONTACT_MESSAGE_CK3 CHECK (PROCESSED IN(''Y'', ''N'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_COUNTRY',
'(    COUNTRY_CODE VARCHAR2(2 CHAR) NOT NULL ENABLE,',
'COUNTRY_NAME VARCHAR2(60 CHAR) NOT NULL ENABLE,',
'VISIT_COUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,',
'CONSTRAINT BLOG_COUNTRY_PK PRIMARY KEY (COUNTRY_CODE) ENABLE,',
'CONSTRAINT BLOG_COUNTRY_CK1 CHECK (VISIT_COUNT >= 0) ENABLE',
') ORGANIZATION INDEX NOCOMPRESS',
'/',
'CREATE TABLE  BLOG_FAQ',
'(    FAQ_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'FAQ_SEQ NUMBER(38,0) NOT NULL ENABLE,',
'QUESTION VARCHAR2(4000 CHAR) NOT NULL ENABLE,',
'ANSWER VARCHAR2(4000 CHAR) NOT NULL ENABLE,',
'CONSTRAINT BLOG_FAQ_PK PRIMARY KEY (FAQ_ID) ENABLE,',
'CONSTRAINT BLOG_FAQ_UK1 UNIQUE (FAQ_SEQ) ENABLE,',
'CONSTRAINT BLOG_FAQ_CK1 CHECK (FAQ_ID > 0) ENABLE,',
'CONSTRAINT BLOG_FAQ_CK2 CHECK (ACTIVE IN(''Y'',''N'')) ENABLE,',
'CONSTRAINT BLOG_FAQ_CK3 CHECK (FAQ_SEQ > 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_FILE',
'(    FILE_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'--FILE_SEQ NUMBER(38,0) NOT NULL ENABLE,',
'FILE_NAME VARCHAR2(60 CHAR),',
'MIME_TYPE VARCHAR2(256 CHAR),',
'FILE_SIZE NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,',
'DAD_CHARSET VARCHAR2(256 CHAR),',
'FILE_TYPE VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'BLOB_CONTENT BLOB NOT NULL ENABLE,',
'DESCRIPTION VARCHAR2(4000 CHAR),',
'FILE_ETAG VARCHAR2(50 CHAR) NOT NULL ENABLE,',
'FILE_MODIFIED_SINCE VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'CONSTRAINT BLOG_FILE_PK PRIMARY KEY (FILE_ID) ENABLE,',
'CONSTRAINT BLOG_FILE_UK1 UNIQUE (FILE_NAME) ENABLE,',
'--CONSTRAINT BLOG_FILE_UK2 UNIQUE (FILE_SEQ,FILE_TYPE) ENABLE,',
'CONSTRAINT BLOG_FILE_CK1 CHECK (FILE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_FILE_CK2 CHECK (ACTIVE IN(''Y'',''N'')) ENABLE,',
'CONSTRAINT BLOG_FILE_CK4 CHECK (FILE_SIZE >= 0) ENABLE,',
'CONSTRAINT BLOG_FILE_CK3 CHECK (FILE_TYPE IN(''IMAGE'',''FILE'',''THEME'',''GALLERY'')) ENABLE',
'--,CONSTRAINT BLOG_FILE_CK4 CHECK (FILE_SEQ > 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_FILE_LOG',
'(    FILE_ID NUMBER(38,0) NOT NULL ENABLE,',
'CLICK_COUNT NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,',
'LAST_CLICK DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CONSTRAINT BLOG_FILE_LOG_PK PRIMARY KEY (FILE_ID) ENABLE,',
'CONSTRAINT BLOG_FILE_LOG_CK1 CHECK (FILE_ID > 0) ENABLE,',
'CONSTRAINT BLOG_FILE_LOG_CK2 CHECK (CLICK_COUNT > 0) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_LONG_TEXT',
'(    LONG_TEXT_ID VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'LONG_TEXT_DESCRIPTION VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'LONG_TEXT CLOB,',
'CONSTRAINT BLOG_LONG_TEXT_PK PRIMARY KEY (LONG_TEXT_ID) ENABLE,',
'CONSTRAINT BLOG_LONG_TEXT_CK1 CHECK (LONG_TEXT_ID IN(''ABOUT'',''DISCLAIMER'')) ENABLE',
')',
'/',
'CREATE TABLE  BLOG_PARAM',
'(    PARAM_ID VARCHAR2(30 CHAR) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'EDITABLE VARCHAR2(1 BYTE) NOT NULL ENABLE,',
'PARAM_NAME VARCHAR2(60 CHAR) NOT NULL ENABLE,',
'PARAM_VALUE VARCHAR2(4000 CHAR),',
'PARAM_HELP VARCHAR2(4000 CHAR),',
'PARAM_TYPE VARCHAR2(20 CHAR) NOT NULL ENABLE,',
'PARAM_NULLABLE VARCHAR2(1 BYTE) NOT NULL ENABLE,',
'PARAM_GROUP VARCHAR2(10 CHAR) NOT NULL ENABLE,',
'PARAM_USE_SKILL VARCHAR2(1 BYTE) DEFAULT ''B'' NOT NULL ENABLE,',
'PARAM_PARENT VARCHAR2(40 CHAR),',
'CONSTRAINT BLOG_PARAM_PK PRIMARY KEY (PARAM_ID) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK1 CHECK (EDITABLE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK2 CHECK (PARAM_NULLABLE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK3 CHECK (PARAM_TYPE IN(''TEXT'',''TEXTAREA'',''NUMBER'',''YESNO'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK4 CHECK ((PARAM_NULLABLE = ''N'' AND PARAM_VALUE IS NOT NULL) OR (PARAM_NULLABLE = ''Y'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK5 CHECK ((PARAM_TYPE = ''YESNO'' AND PARAM_VALUE IS NOT NULL) OR (PARAM_TYPE != ''YESNO'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK6 CHECK ((PARAM_TYPE =''YESNO'' AND PARAM_NULLABLE = ''N'') OR (PARAM_TYPE !=''YESNO'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK7 CHECK (PARAM_GROUP IN(''SEO'', ''UI'', ''EMAIL'', ''LOG'', ''AUTH'', ''RSS'', ''INTERNAL'', ''COMMENT'')) ENABLE,',
'CONSTRAINT BLOG_PARAM_CK8 CHECK (PARAM_USE_SKILL IN(''A'', ''B'')) ENABLE',
')',
'/',
'COMMENT ON COLUMN BLOG_PARAM.PARAM_TYPE IS ''Values defined in blog admin app PARAM_TYPE list of values''',
'/',
'COMMENT ON COLUMN BLOG_PARAM.PARAM_GROUP IS ''Values defined in blog admin app PARAM_GROUP list of values''',
'/',
'COMMENT ON COLUMN BLOG_PARAM.PARAM_USE_SKILL IS ''Values defined in blog admin app PARAM_USE_SKILL list of values''',
'/',
'CREATE TABLE  BLOG_RESOURCE',
'(    LINK_ID NUMBER(38,0) NOT NULL ENABLE,',
'CREATED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CREATED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'CHANGED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'CHANGED_BY VARCHAR2(80 CHAR) NOT NULL ENABLE,',
'ACTIVE VARCHAR2(1 BYTE) DEFAULT ''Y'' NOT NULL ENABLE,',
'LINK_SEQ NUMBER(38,0) NOT NULL ENABLE,',
'LINK_TYPE VARCHAR2(40 CHAR) NOT NULL ENABLE,',
'LINK_TITLE VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'LINK_TEXT VARCHAR2(4000 CHAR) NOT NULL ENABLE,',
'LINK_URL VARCHAR2(256 CHAR) NOT NULL ENABLE,',
'CONSTRAINT BLOG_RESOURCE_PK PRIMARY KEY (LINK_ID) ENABLE,',
'CONSTRAINT BLOG_RESOURCE_UK1 UNIQUE (LINK_SEQ, LINK_TYPE) ENABLE,',
'CONSTRAINT BLOG_RESOURCE_CK1 CHECK (LINK_ID > 0) ENABLE,',
'CONSTRAINT BLOG_RESOURCE_CK2 CHECK (ACTIVE IN(''Y'', ''N'')) ENABLE,',
'CONSTRAINT BLOG_RESOURCE_CK3 CHECK (LINK_TYPE IN(''BLOG'',''FAVORITE'',''RESOURCE'')) ENABLE,',
'CONSTRAINT BLOG_RESOURCE_CK4 CHECK (LINK_SEQ > 0) ENABLE',
')',
'/',
'CREATE TABLE BLOG_HTTP410',
'(    DELETED_ID VARCHAR2(256 CHAR) NOT NULL ENABLE, ',
'ID_SOURCE VARCHAR2(30 CHAR) NOT NULL ENABLE, ',
'DELETED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,',
'--CONSTRAINT BLOG_HTTP410_PK PRIMARY KEY ("DELETED_ID"), ',
'CONSTRAINT BLOG_HTTP410_CK1 CHECK (ID_SOURCE IN(''ARTICLE'',''CATEGORY'',''FILE'')) ENABLE',
')',
'/',
'',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39896041466269770486)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'p2902_02012015'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_condition_type=>'PLSQL_EXPRESSION'
,p_condition=>'blog_util.get_param_value(''SCHEMA_VERSION'') = ''2.9.0.1'''
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'-- Jari Laine / 02.01.2015',
'-- Patch APEX Blogging Platform 2.9.0.1',
'--',
'-- Remove constraints relating bugs:',
'-- Bug #4. https://sourceforge.net/p/apex-blog/tickets/4/',
'-- Bug #8. https://sourceforge.net/p/apex-blog/tickets/8/',
'-- Bug #7. https://sourceforge.net/p/apex-blog/tickets/7/',
'begin',
'  for c1 in (',
'    select table_name',
'    ,constraint_name',
'    from sys.user_constraints',
'    where constraint_name in (',
'       ''BLOG_ARTICLE_HIT20_FK1''',
'      ,''BLOG_ARTICLE_LAST20_FK1''',
'      ,''BLOG_ARTICLE_TOP20_FK1''',
'      ,''BLOG_COMMENT_LOG_FK1''',
'      ,''BLOG_HTTP410_CK1''',
'      ,''BLOG_FILE_LOG_CK2''',
'    )',
'  ) loop',
'    begin',
'      execute immediate ''alter table '' || c1.table_name || '' drop constraint '' || c1.constraint_name;',
'    exception when others then',
'      null;',
'    end;',
'  end loop;',
'end;',
'/',
'-- Bug #5. https://sourceforge.net/p/apex-blog/tickets/5/',
'alter table blog_faq modify active default ''Y''',
'/',
'-- Bug #6. https://sourceforge.net/p/apex-blog/tickets/6/',
'alter table blog_file_log modify click_count default 1',
'/',
'-- Bug #7. https://sourceforge.net/p/apex-blog/tickets/7/',
'alter table blog_file_log add constraint blog_file_log_ck2 check (click_count > 0)',
'/',
'-- Bug #8. https://sourceforge.net/p/apex-blog/tickets/8/',
'alter table blog_http410 add constraint blog_http410_ck1 check (id_source IN(''ARTICLE'',''CATEGORY'',''FILE''))',
'/',
'-- Bug #9. https://sourceforge.net/p/apex-blog/tickets/9/',
'CREATE OR REPLACE TRIGGER blog_category_trg before',
'INSERT OR',
'UPDATE OR',
'DELETE ON blog_category FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.category_id IS NULL THEN',
'      :NEW.category_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'  IF deleting THEN',
'    INSERT INTO blog_http410(deleted_id, id_source)',
'    VALUES (to_char(:OLD.category_id), ''CATEGORY'');',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_category_trg ENABLE',
'/',
'-- Bug #10. https://sourceforge.net/p/apex-blog/tickets/10/',
'CREATE OR REPLACE TRIGGER blog_article_a_trg after',
'INSERT ON blog_article FOR EACH row',
'BEGIN',
'  INSERT INTO blog_article_log(article_id) VALUES(:NEW.article_id);',
'END;',
'/',
'ALTER TRIGGER blog_article_a_trg ENABLE',
'/',
'-- Upgrade APEX Blogging Platform to version 2.9.0.2',
'--',
'-- Store application versions and admin application id.',
'INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''G_BLOG_ADMIN_APP_ID'',''N'',''Blog admin application id'',''291'',''Only for developers.'',''NUMBER'',''N'',''I'
||'NTERNAL'',null,''A'')',
'/',
'INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''ADMIN_VERSION'',''N'',''Blog admin application version id'',''a2.9.0.2'',''Used on future releases for up'
||'grade. Only for developers.'',''TEXT'',''N'',''INTERNAL'',null,''A'')',
'/',
'INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values (''READER_VERSION'',''N'',''Blog reader application version id'',''r2.9.0.2'',''Used on future releases for '
||'upgrade. Only for developers.'',''TEXT'',''N'',''INTERNAL'',null,''A'')',
'/',
'-- Google +1 and Share button.',
'INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) VALUES (''GOOGLE_PLUS_ONE_BTN_ENABLED'',''Y'',''Google +1 button'',''Y'',''If set to "<b>Yes</b>", Google +1 button'
||' is shown on article page.'',''YESNO'',''N'',''COMMENT'',null,''B'')',
'/',
'INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) VALUES (''GOOGLE_SHARE_BTN_ENABLED'',''Y'',''Google Share button'',''Y'',''If set to "<b>Yes</b>", Google Share but'
||'ton is shown on article page.'',''YESNO'',''N'',''COMMENT'',null,''B'')',
'/',
'-- Author Twitter account. Used on Twitter button',
'ALTER TABLE BLOG_AUTHOR ADD (TWITTER VARCHAR2(256 CHAR))',
'/',
'-- Author Twitter account.',
'CREATE OR REPLACE FORCE VIEW blog_v$article',
'AS',
'  SELECT a.article_id',
'  ,c.category_id',
'  ,b.author_id',
'  ,b.author_name',
'  ,b.twitter AS author_twitter',
'  ,a.article_title',
'  ,a.description',
'  ,c.category_name',
'  ,a.keywords',
'  ,a.hastags',
'  ,a.article_text',
'  ,a.active',
'  ,a.created_on',
'  ,a.changed_on',
'  ,a.year_month_num',
'  ,CASE WHEN d.comment_count IS NULL THEN',
'    0',
'  ELSE',
'    d.comment_count',
'  END AS comment_count',
'  ,(SELECT apex_lang.message(''TEXT_POSTED_ON'') FROM DUAL) AS created_on_txt',
'  ,(SELECT apex_lang.message(''TEXT_POSTED_BY'') FROM DUAL) AS posted_by_txt',
'  ,(SELECT apex_lang.message(''TEXT_CATEGORY'') FROM DUAL) AS category_txt',
'  ,(SELECT apex_lang.message(''TEXT_VIEW_COMMENTS'') FROM DUAL) AS view_comment',
'  ,(SELECT apex_lang.message(''TEXT_POST_COMMENT'') FROM DUAL) AS post_comment',
'FROM blog_article a',
'  JOIN blog_author b ON a.author_id = b.author_id',
'  JOIN blog_category c ON a.category_id = c.category_id',
'  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id',
'WHERE a.active = ''Y''',
'  AND b.active = ''Y''',
'  AND c.active = ''Y''',
'  AND a.valid_from <= SYSDATE',
'WITH READ ONLY CONSTRAINT blog_v$article_ro',
'/',
'-- Update schema version',
'update blog_param set param_value = ''s2.9.0.2'' where param_id = ''SCHEMA_VERSION''',
'/',
'',
'-- Packages',
'CREATE OR REPLACE PACKAGE  "BLOG_XML" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  FUNCTION show_entry(',
'    p_build_option_id         IN VARCHAR2,',
'    p_authorization_scheme_id IN VARCHAR2,',
'    p_condition_type_code     IN VARCHAR2,',
'    p_condition_expression1   IN VARCHAR2,',
'    p_condition_expression2   IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE rss(',
'    p_app_alias IN VARCHAR2,',
'    p_blog_name IN VARCHAR2,',
'    p_base_url  IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE sitemap(',
'    p_app_id    IN NUMBER,',
'    p_app_alias IN VARCHAR2,',
'    p_base_url  IN VARCHAR2,',
'    p_tab_list  IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_XML";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_XML" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION show_entry(',
'    p_build_option_id         IN VARCHAR2,',
'    p_authorization_scheme_id IN VARCHAR2,',
'    p_condition_type_code     IN VARCHAR2,',
'    p_condition_expression1   IN VARCHAR2,',
'    p_condition_expression2   IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_retval  BOOLEAN;',
'  BEGIN',
'    l_retval := apex_plugin_util.is_component_used (',
'      p_build_option_id         => p_build_option_id,',
'      p_authorization_scheme_id => p_authorization_scheme_id,',
'      p_condition_type          => p_condition_type_code,',
'      p_condition_expression1   => p_condition_expression1,',
'      p_condition_expression2   => p_condition_expression2',
'    );',
'    RETURN apex_debug.tochar(l_retval);',
'  END show_entry;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rss(',
'    p_app_alias IN VARCHAR2,',
'    p_blog_name IN VARCHAR2,',
'    p_base_url  IN VARCHAR2',
'  )',
'  AS',
'    l_xml         BLOB;',
'    l_url         VARCHAR2(255);',
'    l_rss_desc    VARCHAR2(255);',
'    l_rss_url     VARCHAR2(255);',
'    l_home_url    VARCHAR2(255);',
'    l_article_url VARCHAR2(255);',
'    l_webmaster   VARCHAR2(255);',
'    l_rss_lang    VARCHAR2(5);',
'    c_version     CONSTANT VARCHAR2(5) := ''2.0'';',
'  BEGIN',
'    l_rss_lang    := apex_application.g_browser_language;',
'    l_rss_desc    := apex_plugin_util.replace_substitutions(apex_lang.message(''RSS_DESCRIPTION''));',
'    ',
'    l_url         := ''f?p='' || p_app_alias || '':'';',
'    l_rss_url     := p_base_url || l_url || ''RSS'';',
'    l_home_url    := p_base_url || l_url || ''HOME'';',
'    l_article_url := l_url || ''READ:0::::ARTICLE:'';',
'    SELECT xmlelement("rss", xmlattributes(c_version AS "version", ''http://www.w3.org/2005/Atom'' AS "xmlns:atom", ''http://purl.org/dc/elements/1.1/'' AS "xmlns:dc"),',
'      xmlelement("channel",',
'        xmlelement("atom:link", xmlattributes(l_rss_url AS "href", ''self'' AS "rel", ''application/rss+xml'' AS "type")),',
'        xmlforest(',
'          p_blog_name AS "title"',
'          ,l_home_url AS "link"',
'          ,l_rss_desc AS "description"',
'          ,l_rss_lang AS "language"',
'        ),',
'        xmlagg(',
'          xmlelement("item",',
'            xmlelement("title", l.rss_title),',
'            xmlelement("dc:creator", l.posted_by),',
'            xmlelement("category", l.rss_category),',
'            xmlelement("link", p_base_url || apex_util.prepare_url(l_article_url || l.article_id, NULL, ''PUBLIC_BOOKMARK'')),',
'            xmlelement("description", l.rss_description),',
'            xmlelement("pubDate", l.rss_pubdate),',
'            xmlelement("guid", xmlattributes(''false'' AS "isPermaLink"), l.rss_guid)',
'          ) ORDER BY created_on DESC',
'        )',
'      )',
'    ).getblobval(nls_charset_id(''AL32UTF8''))',
'    INTO l_xml',
'    FROM blog_article_last20 l',
'    ;',
'    owa_util.mime_header(''application/rss+xml'', TRUE);',
'    wpg_docload.download_file(l_xml);',
'    apex_application.stop_apex_engine;',
'  END rss;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE sitemap(',
'    p_app_id    IN NUMBER,',
'    p_app_alias IN VARCHAR2,',
'    p_base_url  IN VARCHAR2,',
'    p_tab_list  IN VARCHAR2',
'  )',
'  AS',
'    l_xml             BLOB;',
'    l_article_url     VARCHAR2(255);',
'    l_category_url    VARCHAR2(255);',
'  BEGIN',
'    l_article_url   := ''f?p='' || p_app_alias || '':READ:0::::ARTICLE:'';',
'    l_category_url  := ''f?p='' || p_app_alias || '':READCAT:0::::CATEGORY:'';',
'    WITH article_cat AS(',
'      SELECT category_id,',
'        MAX(changed_on) AS changed_on',
'      FROM blog_v$article b',
'      GROUP BY category_id',
'    ), sitemap_query AS (',
'      SELECT 1 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY e.display_sequence) AS rnum,',
'        apex_plugin_util.replace_substitutions(e.entry_target) AS url,',
'        (SELECT MAX(changed_on) FROM article_cat) AS lastmod',
'      FROM APEX_APPLICATION_LIST_ENTRIES e',
'      WHERE e.application_id = p_app_id',
'        AND e.list_name      = p_tab_list',
'        AND',
'          blog_xml.show_entry(',
'            (SELECT o.build_option_id FROM apex_application_build_options o WHERE o.build_option_name = e.build_option),',
'            e.authorization_scheme_id,',
'            e.condition_type_code,',
'            e.condition_expression1,',
'            e.condition_expression2',
'           ) = ''true''',
'      UNION ALL',
'      SELECT 2 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY a.created_on) AS rnum,',
'        apex_util.prepare_url(l_article_url || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS url,',
'        a.changed_on AS lastmod',
'      FROM blog_v$article a',
'      UNION ALL',
'      SELECT 3 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY c.category_seq) AS rnum,',
'        apex_util.prepare_url(l_category_url || c.category_id, NULL, ''PUBLIC_BOOKMARK'') AS url,',
'        a.changed_on AS lastmod',
'      FROM blog_category c',
'      JOIN article_cat a',
'        ON c.category_id = a.category_id',
'       AND c.active = ''Y''',
'    )',
'    SELECT XMLElement("urlset", XMLAttributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' AS "xmlns"),',
'        (',
'          XMLAgg(',
'              XMLElement("url"',
'              ,XMLElement("loc", p_base_url || url)',
'              ,XMLElement("lastmod", TO_CHAR(lastmod, ''YYYY-MM-DD''))',
'              ,XMLElement("changefreq", ''monthly'')',
'              ,XMLElement("priority", ''0.5'')',
'            ) ORDER BY grp,rnum',
'          )',
'        )',
'      ).getblobval(nls_charset_id(''AL32UTF8''))',
'    INTO l_xml',
'    FROM sitemap_query',
'    ;',
'    owa_util.mime_header(''application/xml'', TRUE);',
'    wpg_docload.download_file(l_xml);',
'    apex_application.stop_apex_engine;',
'  END sitemap;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_XML";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_UTIL" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  FUNCTION init_session (',
'    p_app_id          IN NUMBER,',
'    p_session_id      IN NUMBER',
'  ) RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_param_value (',
'    p_param_id        IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_items_from_param (',
'    p_app_id          IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_comment(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_followup        IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_contact (',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_readers (',
'    p_comment_id      IN NUMBER,',
'    p_user_id         IN NUMBER,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE unsubscribe (',
'    p_value           IN OUT NOCOPY VARCHAR2,',
'    p_user_id         OUT NOCOPY NUMBER,',
'    p_article_id      OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE download_file (',
'    p_file_name       IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_user_id         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_email (',
'    p_email           IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_article_page_items (',
'    p_article_id      IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_keywords        OUT NOCOPY VARCHAR2,',
'    p_description     OUT NOCOPY VARCHAR2,',
'    p_author_name     OUT NOCOPY VARCHAR2,',
'    p_twitter_follow  OUT NOCOPY VARCHAR2,',
'    p_rate            OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_category_page_items (',
'    p_category_id     IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_category_name   OUT NOCOPY VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_UTIL";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_UTIL" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  TYPE t_author IS RECORD (',
'    n_author_id     NUMBER(38),',
'    v_author_name   VARCHAR2(80),',
'    v_email         VARCHAR2(120),',
'    v_email_notify  VARCHAR2(1)',
'  );',
'  TYPE t_email  IS RECORD (',
'    v_from          VARCHAR2(120),',
'    v_subj          VARCHAR2(255),',
'    v_body          VARCHAR2(32700)',
'  );',
'  g_cookie_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), 12);',
'  g_watche_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), -1);',
'  g_cookie_name       CONSTANT VARCHAR2(30)   := ''__uid'';',
'  g_cookie_version    CONSTANT VARCHAR2(30)   := ''1.0'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_user_name (',
'    p_user_id IN NUMBER',
'  ) RETURN VARCHAR2',
'  AS',
'    l_user_name VARCHAR2(255);',
'  BEGIN',
'    SELECT nick_name',
'    INTO l_user_name',
'    FROM blog_comment_user',
'    WHERE user_id = p_user_id',
'    ;',
'    RETURN l_user_name;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    VALUE_ERROR OR',
'    INVALID_NUMBER',
'  THEN',
'    apex_debug.warn(''blog_util.get_user_name(p_user_id => %s); error: %s'', COALESCE(to_char(p_user_id), ''NULL''), sqlerrm);',
'    RETURN NULL;',
'  END get_user_name;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_article_author(',
'    p_article_id IN NUMBER',
'  ) RETURN t_author',
'  AS',
'    l_author  t_author;',
'  BEGIN',
'    SELECT u.author_id,',
'      author_name,',
'      email,',
'      email_notify',
'      INTO l_author',
'    FROM blog_author u',
'    WHERE u.active = ''Y''',
'      AND EXISTS(',
'      SELECT 1',
'      FROM blog_v$article a',
'      WHERE a.article_id = p_article_id',
'      AND a.author_id = u.author_id',
'    );',
'    RETURN l_author;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    VALUE_ERROR OR',
'    INVALID_NUMBER',
'  THEN',
'    apex_debug.warn(''blog_util.get_author_record_by_article(p_article_id => %s); error: %s'', coalesce(to_char(p_article_id), ''NULL''), sqlerrm);',
'    RETURN NULL;',
'  END get_article_author;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION raw_to_table(',
'    p_value     IN RAW,',
'    p_separator IN VARCHAR2 DEFAULT '':''',
'  ) RETURN apex_application_global.vc_arr2',
'  AS',
'    l_value VARCHAR2(32700);',
'  BEGIN',
'    l_value := sys.utl_raw.cast_to_varchar2(p_value);',
'    l_value := sys.utl_url.unescape(l_value);',
'    RETURN apex_util.string_to_table(l_value, COALESCE(p_separator, '':''));',
'  END raw_to_table;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_cookie(',
'    p_user_id IN NUMBER',
'  )',
'  AS',
'  BEGIN',
'    sys.owa_util.mime_header(''text/html'', FALSE);',
'    -- The first element in the table is the cookie version',
'    -- The second element in the table is the user id',
'    sys.owa_cookie.send(',
'      name    => blog_util.g_cookie_name,',
'      value   => sys.utl_raw.cast_to_raw(blog_util.g_cookie_version || '':'' || p_user_id),',
'      expires => blog_util.g_cookie_expires',
'    );',
'    --sys.owa_util.http_header_close;',
'  END set_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_cookie',
'  RETURN NUMBER',
'  AS',
'    l_user_id     NUMBER(38,0);',
'    l_cookie_val  VARCHAR2(2000);',
'    l_cookie_vals apex_application_global.vc_arr2;',
'  BEGIN',
'    l_cookie_val := apex_authentication.get_login_username_cookie(blog_util.g_cookie_name);',
'    IF l_cookie_val IS NOT NULL THEN',
'      l_cookie_vals := blog_util.raw_to_table(l_cookie_val);',
'      -- The first element in the table is the cookie version',
'      IF l_cookie_vals(1) = blog_util.g_cookie_version THEN',
'        -- The second element in the table is the user id',
'        l_user_id := to_number(l_cookie_vals(2));',
'      END IF;',
'    END IF;',
'    RETURN l_user_id;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    apex_debug.warn(''blog_util.get_cookie; error: %s'', sqlerrm);',
'    RETURN NULL;',
'  END get_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_email_message (',
'    p_article_title IN VARCHAR2,',
'    p_article_url   IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2,',
'    p_author_name   IN VARCHAR2,',
'    p_subj          IN VARCHAR2,',
'    p_body          IN VARCHAR2',
'  ) RETURN t_email',
'  AS',
'    TYPE tabtype IS TABLE OF VARCHAR2(255) INDEX BY VARCHAR2(40);',
'    l_arr   tabtype;',
'    l_key   VARCHAR2(40);',
'    l_email t_email;',
'  BEGIN',
'    l_email.v_subj            := apex_lang.message(p_subj);',
'    l_email.v_body            := apex_lang.message(p_body);',
'    l_arr(''#BLOG_NAME#'')      := p_blog_name;',
'    l_arr(''#ARTICLE_TITLE#'')  := p_article_title;',
'    l_arr(''#AUTHOR_NAME#'')    := p_author_name;',
'    l_arr(''#ARTICLE_URL#'')    := p_article_url;  ',
'    l_key := l_arr.FIRST;',
'    -- Substitude message',
'    WHILE l_key IS NOT NULL LOOP',
'      l_email.v_subj := regexp_replace( l_email.v_subj, l_key, l_arr(l_key), 1, 0, ''i'' );',
'      l_email.v_body := regexp_replace( l_email.v_body, l_key, l_arr(l_key), 1, 0, ''i'' );',
'      l_key := l_arr.NEXT(l_key);',
'    END LOOP;',
'    /* Get blog email */',
'    l_email.v_from := blog_util.get_param_value(''BLOG_EMAIL'');',
'    --',
'    RETURN l_email;',
'  END get_email_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_article_url(',
'    p_article_id  IN NUMBER,',
'    p_app_alias   IN VARCHAR2,',
'    p_base_url    IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2',
'  AS',
'    l_url VARCHAR2(2000);',
'  BEGIN',
'    l_url := ''f?p='' || p_app_alias || '':READ:0::::ARTICLE:'' || p_article_id;',
'    l_url := apex_util.prepare_url(p_url => l_url, p_checksum_type => ''PUBLIC_BOOKMARK'');',
'    l_url := p_base_url || l_url;',
'    RETURN l_url;',
'  END get_article_url;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_unsubscribe_url (',
'    p_user_id     IN NUMBER,',
'    p_article_id  IN NUMBER,',
'    p_app_alias   IN VARCHAR2,',
'    p_base_url    IN VARCHAR2,',
'    p_page_alias  IN VARCHAR2 DEFAULT ''UNSUBSCRIBE'',',
'    p_session_id  IN NUMBER DEFAULT 0',
'  ) RETURN VARCHAR2',
'  AS',
'    l_url       VARCHAR2(2000);',
'    l_value     VARCHAR2(2000);',
'  BEGIN',
'    l_value := sys.utl_raw.cast_to_raw(p_user_id || '':'' || p_article_id);',
'    l_url   := ''f?p='' || p_app_alias || '':UNSUBSCRIBE:'' || p_session_id || ''::::SUBSCRIBER_ID:'' || l_value;',
'    l_url   := apex_util.prepare_url(p_url => l_url, p_checksum_type => ''PUBLIC_BOOKMARK'');',
'    l_url   := p_base_url || l_url;',
'    RETURN l_url;',
'  END get_unsubscribe_url;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_user_attr(',
'    p_user_id     OUT NOCOPY NUMBER,',
'    p_email       IN VARCHAR2,',
'    p_nick_name   IN VARCHAR2,',
'    p_website     IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    BEGIN',
'      INSERT INTO blog_comment_user (email, nick_name, website)',
'        VALUES (p_email, p_nick_name, p_website)',
'      RETURNING user_id INTO p_user_id',
'      ;',
'    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN',
'      UPDATE blog_comment_user',
'        SET nick_name = p_nick_name,',
'          website = p_website',
'        WHERE email = p_email',
'      RETURNING user_id INTO p_user_id',
'      ;',
'    END;',
'  END save_user_attr;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_notify_user (',
'    p_user_id         IN NUMBER,',
'    p_article_id      IN NUMBER,',
'    p_followup        IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    MERGE INTO blog_comment_notify a',
'    USING (',
'      SELECT p_user_id AS user_id,',
'        p_article_id AS article_id,',
'        p_followup  AS followup_notify',
'      FROM DUAL',
'    ) b',
'    ON (a.user_id = b.user_id AND a.article_id = b.article_id)',
'    WHEN MATCHED THEN',
'      UPDATE SET a.followup_notify = b.followup_notify',
'    WHEN NOT MATCHED THEN',
'      INSERT (user_id, article_id, followup_notify)',
'      VALUES (b.user_id, b.article_id, b.followup_notify)',
'    ;',
'  END save_notify_user;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_author (',
'    p_article_title IN VARCHAR2,',
'    p_article_url   IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2,',
'    p_author_name   IN VARCHAR2,',
'    p_author_email  IN VARCHAR2',
'  )',
'  AS',
'    l_email t_email;',
'  BEGIN',
'    /* Get email subject and body to variable */',
'    l_email := blog_util.get_email_message(',
'      p_article_title => p_article_title,',
'      p_article_url   => p_article_url,',
'      p_blog_name     => p_blog_name,',
'      p_author_name   => p_author_name,',
'      p_subj          => ''NEW_COMMENT_EMAIL_SUBJ'',',
'      p_body          => ''NEW_COMMENT_EMAIL_BODY''',
'    );',
'    /* Send mail to author */',
'    apex_mail.send (',
'      p_from => l_email.v_from,',
'      p_to   => p_author_email,',
'      p_subj => l_email.v_subj,',
'      p_body => l_email.v_body',
'    );',
'    /* we do have time wait email sending */',
'    --APEX_MAIL.PUSH_QUEUE;',
'  END notify_author;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE raise_http_error(',
'    p_id          IN VARCHAR2,',
'    p_error_code  IN NUMBER DEFAULT 404,',
'    p_reason      IN VARCHAR2 DEFAULT ''Not Found''',
'  )',
'  AS',
'  BEGIN',
'    apex_debug.warn(''HTTP %s %s id: %s'', p_error_code, p_reason, coalesce(p_id, ''(NULL)''));',
'    sys.owa_util.status_line(',
'      nstatus       => p_error_code,',
'      creason       => p_reason,',
'      bclose_header => true',
'    );',
'    apex_application.stop_apex_engine;',
'  END raise_http_error;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE check_http410(',
'    p_id  IN VARCHAR2',
'  )',
'  AS',
'    l_count PLS_INTEGER;',
'  BEGIN',
'    SELECT COUNT(1)',
'    INTO l_count',
'    FROM blog_http410 c',
'    WHERE c.deleted_id = p_id',
'    ;',
'    blog_util.raise_http_error(p_id, 410, ''Gone'');',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    blog_util.raise_http_error(p_id);',
'  END check_http410;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global functions and procedures',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION init_session (',
'    p_app_id      IN NUMBER,',
'    p_session_id  IN NUMBER',
'  ) RETURN NUMBER',
'  AS',
'    l_user_id     NUMBER(38);',
'    l_user_name   VARCHAR2(255);',
'  BEGIN',
'    blog_util.set_items_from_param(p_app_id);',
'    l_user_id := blog_util.get_cookie;',
'    IF l_user_id IS NOT NULL THEN',
'      l_user_name := blog_util.get_user_name(l_user_id);',
'      IF l_user_name IS NOT NULL THEN',
'        /* Set APP_USER */',
'        apex_custom_auth.set_user(upper(l_user_name));',
'      ELSE',
'        l_user_id := NULL;',
'      END IF;',
'    END IF;',
'    IF apex_authorization.is_authorized(''LOGGING_ENABLED'') THEN',
'      blog_log.write_activity_log(',
'        p_user_id       => l_user_id,',
'        p_session_id    => p_session_id,',
'        p_ip_address    => sys.owa_util.get_cgi_env(''REMOTE_ADDR''),',
'        p_user_agent    => sys.owa_util.get_cgi_env(''HTTP_USER_AGENT''),',
'        p_referer       => sys.owa_util.get_cgi_env(''HTTP_REFERER''),',
'        p_activity_type => ''NEW_SESSION''',
'      );',
'    END IF;',
'    RETURN l_user_id;',
'  END init_session;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_param_value(',
'    p_param_id IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_value VARCHAR2(4000);',
'  BEGIN',
'    SELECT param_value',
'    INTO l_value',
'    FROM blog_param',
'    WHERE param_id = p_param_id',
'    ;',
'    RETURN l_value;',
'  END get_param_value;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_items_from_param(',
'    p_app_id IN NUMBER',
'  ) AS',
'  --PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    FOR c1 IN (',
'      SELECT',
'        p.param_id,',
'        p.param_value',
'      FROM blog_param p',
'      WHERE p.param_value IS NOT NULL',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_param_app a',
'          WHERE a.application_id = p_app_id',
'          AND a.param_id = p.param_id',
'        )',
'    ) LOOP',
'      apex_util.set_session_state(c1.param_id, c1.param_value);',
'    END LOOP;',
'  END set_items_from_param;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_comment(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_followup        IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  )',
'  AS',
'    l_article_url VARCHAR2(4000);',
'    l_comment_id  NUMBER(38);',
'    l_publish     VARCHAR2(1) := ''N'';',
'    l_author      t_author;',
'  BEGIN',
'    /* Set AP'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39896041466269770486)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'P_USER */',
'    apex_custom_auth.set_user(upper(p_nick_name));',
'    --',
'    /* Insert or update user */',
'    blog_util.save_user_attr(',
'      p_user_id     => p_user_id,',
'      p_email       => p_email,',
'      p_nick_name   => p_nick_name,',
'      p_website     => p_website',
'    );',
'    /* Save should user be notified when new comment is posted */',
'    blog_util.save_notify_user(',
'      p_user_id     => p_user_id,',
'      p_article_id  => p_article_id,',
'      p_followup    => p_followup',
'    );',
'    /* Set user id to cookie */',
'    blog_util.set_cookie(p_user_id);',
'    --',
'    /* Should author moderate comment before it is published */',
'    IF NOT apex_authorization.is_authorized(''MODERATION_ENABLED'') THEN',
'      l_publish := ''Y'';',
'    END IF;',
'    --',
'    /* Inser comment to table */',
'    INSERT INTO blog_comment',
'    (user_id, apex_session_id, article_id, comment_text, moderated)',
'    VALUES',
'    (p_user_id, p_apex_session_id, p_article_id, p_comment , l_publish)',
'    RETURNING comment_id INTO l_comment_id',
'    ;',
'    --',
'    /* Update user id to activity log */',
'    UPDATE blog_activity_log',
'    SET user_id = p_user_id',
'    WHERE apex_session_id = p_apex_session_id',
'      AND user_id IS NULL',
'    ;',
'    --',
'    /* Send email about new comment to readers */',
'    IF apex_authorization.is_authorized(''NOTIFICATION_EMAIL_ENABLED'') THEN',
'      IF l_publish = ''Y'' THEN',
'        blog_util.notify_readers (',
'          p_comment_id    => l_comment_id,',
'          p_user_id       => p_user_id,',
'          p_article_id    => p_article_id,',
'          p_article_title => p_article_title,',
'          p_app_alias     => p_app_alias,',
'          p_base_url      => p_base_url,',
'          p_blog_name     => p_blog_name',
'        );',
'      END IF;',
'    --',
'      /* Get author details for notification emails */',
'      l_author := blog_util.get_article_author(p_article_id);',
'      --',
'      /* Send email about new comment to author */',
'      /* If we have author email and author is active and like have notifications */',
'      IF  l_author.v_email IS NOT NULL AND l_author.v_email_notify = ''Y''',
'      THEN',
'        /* Get article url */',
'        l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);',
'        --',
'        blog_util.notify_author (',
'          p_article_title => p_article_title,',
'          p_article_url   => l_article_url,',
'          p_blog_name     => p_blog_name,',
'          p_author_name   => l_author.v_author_name,',
'          p_author_email  => l_author.v_email',
'        );',
'      END IF;',
'    END IF;',
'    /* Refresh comment log */',
'    dbms_mview.refresh(''BLOG_COMMENT_LOG'');',
'  END save_comment;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_contact(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    /* Set APP_USER */',
'    apex_custom_auth.set_user(upper(p_nick_name));',
'    /* Insert or update user */',
'    blog_util.save_user_attr(',
'      p_user_id     => p_user_id,',
'      p_email       => p_email,',
'      p_nick_name   => p_nick_name,',
'      p_website     => p_website',
'    );',
'    /* Inser message to table */',
'    INSERT INTO blog_contact_message',
'    (user_id, apex_session_id, message)',
'    VALUES',
'    (p_user_id, p_apex_session_id, p_comment)',
'    ;',
'     /* Set user id to cookie */',
'    blog_util.set_cookie(p_user_id);',
'  END save_contact;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_readers (',
'    p_comment_id    IN NUMBER,',
'    p_user_id       IN NUMBER,',
'    p_article_id    IN NUMBER,',
'    p_article_title IN VARCHAR2,',
'    p_app_alias     IN VARCHAR2,',
'    p_base_url      IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2',
'  )',
'  AS',
'    l_article_url     VARCHAR2(2000);',
'    l_unsubscribe_url VARCHAR2(2000);',
'    l_user_email      t_email;',
'    l_email           t_email;',
'  BEGIN',
'    /* Get article url */',
'    l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);',
'    /* Get email subject and body to variables */',
'    l_email := blog_util.get_email_message(',
'      p_article_title => p_article_title,',
'      p_article_url   => l_article_url,',
'      p_blog_name     => p_blog_name,',
'      p_author_name   => ''#AUTHOR_NAME#'',',
'      p_subj          => ''FOLLOWUP_EMAIL_SUBJ'',',
'      p_body          => ''FOLLOWUP_EMAIL_BODY''',
'    );',
'    /* Loop trough all users that like have notification */',
'    FOR c1 IN (',
'      SELECT email,',
'        nick_name,',
'        user_id',
'      FROM blog_comment_user u',
'      WHERE u.user_id != p_user_id',
'        AND u.blocked = ''N''',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_comment_notify n',
'          WHERE n.user_id = u.user_id',
'          AND n.article_id = p_article_id',
'          AND n.followup_notify = ''Y''',
'          AND n.changed_on > g_watche_expires',
'        )',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_comment c',
'          WHERE c.article_id = p_article_id',
'          AND c.comment_id = p_comment_id',
'          AND c.active = ''Y''',
'          AND c.moderated = ''Y''',
'          AND c.notify_email_sent = ''N''',
'        )',
'    ) LOOP',
'      /* User specific unsubscribe url */',
'      l_unsubscribe_url := blog_util.get_unsubscribe_url(',
'        p_user_id     => c1.user_id,',
'        p_article_id  => p_article_id,',
'        p_app_alias   => p_app_alias,',
'        p_base_url    => p_base_url',
'      );',
'      /* Make user specific substitutions */',
'      l_user_email.v_subj := regexp_replace(l_email.v_subj, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');',
'      l_user_email.v_body := regexp_replace(l_email.v_body, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');',
'      l_user_email.v_body := regexp_replace(l_user_email.v_body, ''#UNSUBSCRIBE_URL#'', l_unsubscribe_url, 1, 0, ''i'');',
'      /* Send mail to user */',
'      apex_mail.send (',
'        p_from => l_email.v_from,',
'        p_to   => c1.email,',
'        p_subj => l_user_email.v_subj,',
'        p_body => l_user_email.v_body',
'      );',
'    END LOOP;',
'    /* we do have time wait email sending */',
'    --APEX_MAIL.PUSH_QUEUE;',
'    UPDATE blog_comment',
'      SET notify_email_sent = ''Y''',
'    WHERE comment_id = p_comment_id',
'      AND active = ''Y''',
'      AND moderated = ''Y''',
'      AND notify_email_sent = ''N''',
'    ;',
'  END notify_readers;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE unsubscribe(',
'    p_value       IN OUT NOCOPY VARCHAR2,',
'    p_user_id     OUT NOCOPY NUMBER,',
'    p_article_id  OUT NOCOPY NUMBER',
'  )',
'  AS',
'    l_user_name VARCHAR2(255);',
'    l_arr       apex_application_global.vc_arr2;',
'  BEGIN',
'    l_arr         := blog_util.raw_to_table(p_value);',
'    p_value       := NULL;',
'    p_user_id     := l_arr(1);',
'    p_article_id  := l_arr(2);',
'    IF p_user_id IS NOT NULL THEN',
'      l_user_name := blog_util.get_user_name(p_user_id);',
'    END IF;',
'    IF p_user_id IS NOT NULL',
'    AND l_user_name IS NOT NULL',
'    AND p_article_id IS NOT NULL',
'    THEN',
'      /* Set APP_USER */',
'      apex_custom_auth.set_user(upper(l_user_name));',
'      blog_util.save_notify_user(',
'        p_user_id    => p_user_id,',
'        p_article_id => p_article_id,',
'        p_followup   => ''N''',
'      );',
'    ELSE',
'      blog_util.raise_http_error(p_value);',
'    END IF;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_value);',
'  END unsubscribe;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE download_file (',
'    p_file_name   IN VARCHAR2,',
'    p_session_id  IN NUMBER,',
'    p_user_id     IN VARCHAR2',
'  )',
'  AS',
'    l_file_name       VARCHAR2(2000);',
'    l_utc             TIMESTAMP;',
'    l_file_cached     BOOLEAN;',
'    l_file_rowtype    blog_file%ROWTYPE;',
'    l_arr             apex_application_global.vc_arr2;',
'    c_date_lang       CONSTANT VARCHAR2(255) := ''NLS_DATE_LANGUAGE=ENGLISH'';',
'    c_date_format     CONSTANT VARCHAR2(255) := ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'';',
'    --SESSION_NOT_VALID EXCEPTION;',
'    FILE_NOT_ACTIVE   EXCEPTION;',
'    --PRAGMA EXCEPTION_INIT(SESSION_NOT_VALID, -20001);',
'    PRAGMA EXCEPTION_INIT(FILE_NOT_ACTIVE, -20002);',
'  BEGIN',
'    /*',
'    IF NOT apex_custom_auth.is_session_valid THEN',
'      apex_debug.warn(''File download session is not valid: %s'', p_session_id);',
'      raise_application_error(-20001, ''Unauthorized access - file will not be retrieved.'');',
'    END IF;',
'    */',
'    l_file_cached := FALSE;',
'    l_arr := apex_util.string_to_table(p_file_name, ''?'');',
'    l_file_name := l_arr(1);',
'    l_utc := SYS_EXTRACT_UTC(SYSTIMESTAMP);',
'    SELECT *',
'    INTO l_file_rowtype',
'    FROM blog_file',
'    WHERE file_name = l_file_name',
'    ;',
'    IF NOT l_file_rowtype.active = ''Y'' THEN',
'      raise_application_error(-20002, ''File is not available for download.'');',
'    END IF;',
'    sys.owa_util.mime_header(COALESCE (l_file_rowtype.mime_type, ''application/octet''), FALSE);',
'    IF l_file_rowtype.file_type != ''FILE'' THEN',
'      /* File type is not FILE, then use cache e.g. for images, css and JavaScript */',
'      /* Cache and ETag headers */',
'      sys.htp.p(''Cache-Control: public, max-age=31536000'');',
'      sys.htp.p(''Date: ''    || to_char(l_utc, c_date_format, c_date_lang));',
'      sys.htp.p(''Expires: '' || to_char(l_utc + 365, c_date_format, c_date_lang));',
'      sys.htp.p(''ETag: "''   || l_file_rowtype.file_etag || ''"'');',
'      /* Check if file is modified after last download */',
'      IF sys.owa_util.get_cgi_env(''HTTP_IF_MODIFIED_SINCE'') = l_file_rowtype.file_modified_since',
'      OR sys.owa_util.get_cgi_env(''HTTP_IF_NONE_MATCH'')  = l_file_rowtype.file_etag',
'      THEN',
'        sys.owa_util.status_line(',
'          nstatus       => 304,',
'          creason       => ''Not Modified'',',
'          bclose_header => FALSE',
'        );',
'        l_file_cached := TRUE;',
'      ELSE',
'        sys.htp.p(''Last-Modified : '' || l_file_rowtype.file_modified_since);',
'      END IF;',
'    ELSE',
'      IF apex_authorization.is_authorized(''LOGGING_ENABLED'') THEN',
'        /* Log file download */',
'        blog_log.write_file_log(l_file_rowtype.file_id);',
'        blog_log.write_activity_log(',
'          p_user_id       => p_user_id,',
'          p_session_id    => p_session_id,',
'          p_activity_type => ''DOWNLOAD'',',
'          p_related_id    => l_file_rowtype.file_id',
'        );',
'      END IF;',
'      sys.htp.p(''Content-Disposition: attachment; filename="'' || l_file_rowtype.file_name || ''"'');',
'    END IF;',
'    IF NOT l_file_cached THEN',
'      sys.htp.p(''Content-length: '' || l_file_rowtype.file_size);',
'      sys.wpg_docload.download_file(l_file_rowtype.blob_content);',
'    END IF;',
'    sys.owa_util.http_header_close;',
'    apex_application.stop_apex_engine;',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(l_file_name);',
'  WHEN',
'    VALUE_ERROR OR',
'    INVALID_NUMBER OR',
'    FILE_NOT_ACTIVE',
'  THEN',
'    blog_util.raise_http_error(l_file_name);',
'  END download_file;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_email(',
'    p_email     IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    l_is_valid    BOOLEAN := TRUE;',
'    l_dot_pos     SIMPLE_INTEGER := 0;',
'    l_at_pos      SIMPLE_INTEGER := 0;',
'    l_str_length  SIMPLE_INTEGER := 0;',
'  BEGIN',
'    IF p_email IS NOT NULL THEN',
'      l_dot_pos     := instr(p_email ,''.'');',
'      l_at_pos      := instr(p_email ,''@'');',
'      l_str_length  := LENGTH(p_email);',
'      IF (',
'        (l_dot_pos = 0)',
'        OR (l_at_pos = 0)',
'        --OR (l_dot_pos = l_at_pos - 1)',
'        OR (l_dot_pos = l_at_pos + 1)',
'        OR (l_at_pos = 1)',
'        OR (l_at_pos = l_str_length)',
'        OR (l_dot_pos = l_str_length)',
'        OR (l_str_length > 256)',
'      )',
'      THEN',
'        l_is_valid := FALSE;',
'      END IF;',
'      IF l_is_valid THEN',
'        l_is_valid := NOT instr(substr(p_email ,l_at_pos) ,''.'') = 0;',
'      END IF;',
'    END IF;',
'    RETURN l_is_valid;',
'  END validate_email;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_article_page_items (',
'    p_article_id      IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_keywords        OUT NOCOPY VARCHAR2,',
'    p_description     OUT NOCOPY VARCHAR2,',
'    p_author_name     OUT NOCOPY VARCHAR2,',
'    p_twitter_follow  OUT NOCOPY VARCHAR2,',
'    p_rate            OUT NOCOPY NUMBER    ',
'  ) ',
'  AS',
'    l_article_id    NUMBER;',
'    l_category_name VARCHAR2(256);',
'  BEGIN',
'    /* Input parameter p_category_id is string because we handle invalid number exception */',
'    l_article_id := to_number(p_article_id);',
'    SELECT a.article_title,',
'      a.category_name,',
'      a.keywords,',
'      a.description,',
'      a.author_name,',
'      a.author_twitter,',
'      l.article_rate_int',
'    INTO p_page_title,',
'      l_category_name,',
'      p_keywords,',
'      p_description,',
'      p_author_name,',
'      p_twitter_follow,',
'      p_rate',
'    FROM blog_v$article a',
'    LEFT JOIN blog_article_log l',
'    ON a.article_id = l.article_id',
'    WHERE a.article_id = l_article_id',
'    ;',
'    p_region_title  := apex_lang.message(''REGION_TITLE_COMMENTS'');',
'    p_keywords      := ltrim(trim(BOTH '','' FROM p_keywords) || '','' || l_category_name, '','');',
'    p_rate          := coalesce(p_rate, 0);',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(p_article_id);',
'  WHEN',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_article_id);',
'  END get_article_page_items;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_category_page_items (',
'    p_category_id   IN VARCHAR2,',
'    p_page_title    OUT NOCOPY VARCHAR2,',
'    p_region_title  OUT NOCOPY VARCHAR2,',
'    p_category_name OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_category_id NUMBER;',
'  BEGIN',
'    /* Input parameter p_category_id is string because we handle invalid number exception */',
'    l_category_id := to_number(p_category_id);',
'    SELECT c.category_name',
'    INTO p_category_name',
'    FROM blog_category c',
'    WHERE c.category_id = l_category_id',
'    ;',
'    p_page_title    := apex_lang.message(''PAGE_TITLE_CATEGORY'', p_category_name);',
'    p_region_title  := apex_lang.message(''REGION_TITLE_CATEGORY'', apex_escape.html(p_category_name));',
'    p_category_name := p_category_name;',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(p_category_id);',
'  WHEN',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_category_id);',
'  END get_category_page_items;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_UTIL";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_PLUGIN" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'  g_formatted_comment VARCHAR2(32700);',
'  g_question_answer   PLS_INTEGER;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_comment_textarea(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION validate_comment_textarea(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION feature_authorization (',
'    p_authorization in apex_plugin.t_authorization,',
'    p_plugin        in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_authorization_exec_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_math_question_field(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION ajax_math_question_field(',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_page_item_ajax_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_math_question_field(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_simple_star_rating (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_modal_confirm(',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_dynamic_action_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_plus_one_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_share_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_facebook_like_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_twitter_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'END "BLOG_PLUGIN";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_PLUGIN" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  g_whitelist_tags        CONSTANT VARCHAR2(200)  := ''<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>'';',
'  g_code_open             CONSTANT VARCHAR2(30)   := ''<code>'';',
'  g_code_close            CONSTANT VARCHAR2(30)   := ''</code>'';',
'  g_syntaxhighlight_open  CONSTANT VARCHAR2(100)  := ''<pre class="brush:plain" style="background-color:#eeeeee;padding:2px;">'';',
'  g_syntaxhighlight_close CONSTANT VARCHAR2(30)   := ''</pre>'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION format_comment(',
'    p_comment         IN VARCHAR2,',
'    p_whitelist_tags  IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_comment               VARCHAR2(32700);',
'    l_temp                  VARCHAR2(32700);',
'    l_len_s                 NUMBER := 0;',
'    l_len_e                 NUMBER := 0;',
'    l_count_open            SIMPLE_INTEGER := 0;',
'    l_count_close           SIMPLE_INTEGER := 0;',
'    l_start                 SIMPLE_INTEGER := 0;',
'    l_end                   SIMPLE_INTEGER := 0;',
'    l_comment_arr           apex_application_global.vc_arr2;',
'    l_code_arr              apex_application_global.vc_arr2;',
'  BEGIN',
'    l_len_s := LENGTH(g_code_open);',
'    l_len_e := LENGTH(g_code_close);',
'    /* Change all hash marks so we can escape those later*/',
'    l_comment := REPLACE(p_comment, ''#'', ''$@#HASH#@$'');',
'    /* escape comment html */',
'    l_comment := APEX_ESCAPE.HTML_WHITELIST (',
'      p_html            => l_comment,',
'      p_whitelist_tags  => p_whitelist_tags',
'    );',
'    /* Escape hash to e.g. prevent APEX substitutions */',
'    l_comment := REPLACE(l_comment, ''$@#HASH#@$'', ''&#x23;'');',
'    /* check code tag count */',
'    l_count_open  := regexp_count(l_comment, g_code_open);',
'    l_count_close := regexp_count(l_comment, g_code_close);',
'    /* Process code tags */',
'    IF l_count_open = l_count_close THEN',
'      /* Store text inside code tags to array while format rest of message*/',
'      FOR i IN 1 .. l_count_open',
'      LOOP',
'        l_start       := INSTR(l_comment, g_code_open);',
'        l_end         := INSTR(l_comment, g_code_close);',
'        l_code_arr(i) := g_syntaxhighlight_open',
'                      || SUBSTR(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)',
'                      || g_syntaxhighlight_close;',
'        l_comment     := SUBSTR(l_comment, 1, l_start -1)',
'                      || chr(10)',
'                      || ''$@#'' || i || ''#@$''',
'                      || chr(10)',
'                      || SUBSTR(l_comment, l_end + l_len_e);',
'      END LOOP;',
'      /* Format message */',
'      l_comment_arr := APEX_UTIL.STRING_TO_TABLE(l_comment, chr(10));',
'      l_comment := NULL;',
'      FOR i IN 1 .. l_comment_arr.COUNT',
'      LOOP',
'        /* Remove empty lines and do not add extra tags for code */',
'        l_temp := TRIM(l_comment_arr(i));',
'        IF REGEXP_LIKE(l_temp, ''^\$\@\#[0-9]+\#\@\$$'') THEN',
'          l_comment := l_comment || l_temp;',
'        ELSIF l_temp IS NOT NULL THEN',
'          l_comment := l_comment || ''<p>'' || l_temp || ''</p>'';',
'        END IF;',
'      END LOOP;',
'      /* insert code tags back to comment */',
'      FOR i IN 1 .. l_code_arr.COUNT',
'      LOOP',
'        l_comment := REPLACE(l_comment, ''$@#'' || i || ''#@$'', l_code_arr(i));',
'      END LOOP;',
'    END IF;',
'    RETURN l_comment;',
'  END format_comment;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_comment_textarea(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    l_name        VARCHAR2(30);',
'    l_code        VARCHAR2(30);',
'    l_bold        VARCHAR2(30);',
'    l_italics     VARCHAR2(30);',
'    l_underline   VARCHAR2(30);',
'    l_styles      VARCHAR2(255);',
'    l_formatting  VARCHAR2(10);',
'    l_result      apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');',
'    IF p_is_readonly OR p_is_printer_friendly THEN',
'      -- emit hidden textarea if necessary',
'      apex_plugin_util.print_hidden_if_readonly (',
'        p_item_name => p_item.name,',
'        p_value => p_value,',
'        p_is_readonly => p_is_readonly,',
'        p_is_printer_friendly => p_is_printer_friendly',
'      );',
'      -- emit display span with the value',
'      apex_plugin_util.print_display_only (',
'        p_item_name => p_item.name,',
'        p_display_value => p_value,',
'        p_show_line_breaks => false,',
'        p_escape => true,',
'        p_attributes => p_item.element_attributes',
'      );',
'    ELSE',
'      -- Because the page item saves state, we have to call get_input_name_for_page_item',
'      -- which generates the internal hidden p_arg_names textarea. It will also RETURN the',
'      -- HTML textarea name which we have to use when we render the HTML input textarea.',
'      l_name := apex_plugin.get_input_name_for_page_item(false);',
'      ',
'      l_code      := apex_lang.lang(''Code'');',
'      l_bold      := apex_lang.lang(''Bold'');',
'      l_italics   := apex_lang.lang(''Italics'');',
'      l_underline := apex_lang.lang(''Underline'');',
'      IF l_formatting = ''Y'' THEN',
'        sys.htp.p(''<ul class="format-btn">'');',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''b'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_bold  || ''" ''',
'          || ''title="'' || l_bold  || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-bold-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''i'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_italics ||''" ''',
'          || ''title="'' || l_italics ||''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-italics-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''u'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_underline || ''" ''',
'          || ''title="'' || l_underline || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-underline-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''code'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_code  || '' " ''',
'          || ''title="'' || l_code  || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[code-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(''</ul>'');',
'        sys.htp.p(',
'          ''<div>''',
'          || APEX_ESCAPE.HTML (apex_lang.message(''MSG_ALLOWED_HTML_TAGS''))',
'          || ''</div>''',
'        );',
'      END IF;',
'      sys.htp.prn(''<textarea ''',
'        || apex_plugin_util.get_element_attributes(p_item, l_name, ''textarea'')',
'        || ''cols="'' || p_item.element_width ||''" ''',
'        || ''rows="'' || p_item.element_height ||''" ''',
'        || ''maxlength="'' || p_item.element_max_length || ''">''',
'      );',
'      apex_plugin_util.print_escaped_value(p_value);',
'      sys.htp.p(''</textarea>'');',
'      -- Tell APEX that this textarea is navigable',
'      l_result.is_navigable := true;',
'    END IF;',
'    RETURN l_result;',
'  END render_comment_textarea;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_comment_textarea(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result',
'  AS',
'    l_formatting  VARCHAR2(10);',
'    l_tmp_item    VARCHAR2(30);',
'    l_comment     XMLTYPE;',
'    l_is_valid    BOOLEAN;',
'    l_result      apex_plugin.t_page_item_validation_result;',
'    xml_parse_err EXCEPTION;',
'    PRAGMA EXCEPTION_INIT (xml_parse_err , -31011);',
'  BEGIN',
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');',
'    l_tmp_item := p_item.attribute_02;',
'    blog_plugin.g_formatted_comment := p_value;',
'    /* Remove some ascii codes */',
'    FOR i IN 0 .. 31',
'    LOOP',
'      IF i != 10 THEN',
'        blog_plugin.g_formatted_comment := TRIM(REPLACE(blog_plugin.g_formatted_comment, chr(i)));',
'      END IF;',
'    END LOOP;',
'    IF blog_plugin.g_formatted_comment IS NULL THEN',
'      RETURN NULL;',
'    END IF;',
'    IF LENGTH(blog_plugin.g_formatted_comment) >= p_item.element_max_length THEN',
'      l_is_valid := FALSE;',
'      l_result.message := apex_lang.message(''VALIDATION_COMMENT_LENGTH'', p_item.plain_label, p_item.element_max_length);',
'    ELSE',
'      l_is_valid := TRUE;',
'    END IF;',
'    IF l_is_valid THEN',
'      /* Format value */',
'      IF l_formatting = ''Y'' THEN',
'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, g_whitelist_tags);',
'      ELSE',
'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, NULL);',
'      END IF;',
'      /* Validate value html tags */',
'      BEGIN',
'        l_comment := xmlType.createXML(',
'            ''<root><row>'' ',
'          || blog_plugin.g_formatted_comment',
'          || ''</row></root>''',
'        );',
'      EXCEPTION',
'      WHEN xml_parse_err THEN',
'        l_is_valid := FALSE;',
'        apex_debug.error(''%s : %s'', sys.dbms_utility.format_error_backtrace, sqlerrm);',
'      WHEN OTHERS THEN',
'        apex_debug.error(''%s : %s'', sys.dbms_utility.format_error_backtrace, sqlerrm);',
'        l_is_valid := FALSE;',
'      END;',
'      IF NOT l_is_valid THEN',
'        l_is_valid := FALSE;',
'        l_result.message := apex_lang.message(''VALIDATION_COMMENT_FORMAT'', p_item.plain_label);',
'      END IF;',
'    END IF;',
'    RETURN l_result;',
'  END validate_comment_textarea;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION feature_authorization (',
'    p_authorization in apex_plugin.t_authorization,',
'    p_plugin        in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_authoriza'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39896041466269770486)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'tion_exec_result',
'  AS',
'    l_count         NUMBER;',
'    l_feature_name  VARCHAR(100);',
'    l_result        apex_plugin.t_authorization_exec_result; -- result object to RETURN',
'  BEGIN',
'    l_feature_name := p_authorization.attribute_01;',
'    SELECT COUNT(1)',
'    INTO l_count',
'    FROM blog_param c',
'    LEFT JOIN blog_param p ON c.param_parent = p.param_id',
'    WHERE c.param_id = l_feature_name',
'      AND c.param_value = ''Y'' ',
'      AND CASE WHEN p.param_type = ''YESNO''',
'      THEN p.param_value ELSE ''Y'' END = ''Y''',
'    ;',
'    l_result.is_authorized := l_count > 0;',
'    RETURN l_result;',
'END feature_authorization;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_math_question_field(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    l_name        VARCHAR2(30);',
'    l_answer_item VARCHAR2(30);',
'    l_result      apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    l_name        := apex_plugin.get_input_name_for_page_item(false);',
'    l_answer_item := p_item.attribute_01;',
'    ',
'    IF p_is_readonly OR p_is_printer_friendly THEN',
'      -- emit hidden textarea if necessary',
'      apex_plugin_util.print_hidden_if_readonly (',
'        p_item_name => p_item.name,',
'        p_value => p_value,',
'        p_is_readonly => p_is_readonly,',
'        p_is_printer_friendly => p_is_printer_friendly',
'      );',
'      -- emit display span with the value',
'      apex_plugin_util.print_display_only (',
'        p_item_name => p_item.name,',
'        p_display_value => p_value,',
'        p_show_line_breaks => false,',
'        p_escape => true,',
'        p_attributes => p_item.element_attributes',
'      );',
'    ELSE',
'      sys.htp.p(''<input type="text" ''',
'        || ''size="'' || p_item.element_width ||''" ''',
'        || ''maxlength="'' || p_item.element_max_length || ''" ''',
'        || apex_plugin_util.get_element_attributes(p_item, l_name, ''text_field'')',
'        || ''value="" />''',
'      );',
'      apex_javascript.add_onload_code (',
'        p_code => ''apex.server.plugin("'' || apex_plugin.get_ajax_identifier || ''",{},{''',
'        || ''dataType:"html",''',
'        || ''success:function(data){''',
'        || ''$("''',
'        || apex_plugin_util.page_item_names_to_jquery(p_item.name) ',
'        || ''").before(data).siblings("label,br").remove()}''',
'        || ''});''',
'      );',
'      -- Tell APEX that this textarea is navigable',
'      l_result.is_navigable := true;',
'    END IF;',
'    RETURN l_result;',
'  END render_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION ajax_math_question_field(',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_page_item_ajax_result',
'  AS',
'    l_tmp         VARCHAR2(255);',
'    l_answer_item VARCHAR2(30);',
'    l_min_1       PLS_INTEGER := 1;',
'    l_max_1       PLS_INTEGER := 1;',
'    l_min_2       PLS_INTEGER := 1;',
'    l_max_2       PLS_INTEGER := 1;',
'    l_arr         apex_application_global.vc_arr2;',
'    l_result      apex_plugin.t_page_item_ajax_result;',
'  BEGIN',
'    l_answer_item := p_item.attribute_01;',
'    l_min_1       := p_item.attribute_02;',
'    l_max_1       := p_item.attribute_03;',
'    l_min_2       := p_item.attribute_04;',
'    l_max_2       := p_item.attribute_05;',
'    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_1, l_max_1));',
'    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_2, l_max_2));',
'    FOR n IN 1 .. 2',
'    LOOP',
'      l_arr(n) := ROUND(sys.dbms_random.VALUE(1, 40));',
'      FOR i IN 1 .. LENGTH(l_arr(n))',
'      LOOP',
'        l_tmp := l_tmp || ''&#'' || ASCII(SUBSTR(l_arr(n), i, 1));',
'      END LOOP;',
'      IF n = 1 THEN',
'        l_tmp := l_tmp || ''&nbsp;&#'' || ASCII(''+'') || ''&nbsp;'';',
'      END IF;',
'    END LOOP;',
'    -- Write header for the output.',
'    sys.owa_util.mime_header(''text/html'', false);',
'    sys.htp.p(''Cache-Control: no-cache'');',
'    sys.htp.p(''Pragma: no-cache'');',
'    --sys.htp.p(''X-Robots-Tag    noindex,follow'');',
'    sys.owa_util.http_header_close;',
'    sys.htp.p(''<p>'' || apex_lang.message(''MSG_MATH_QUESTION'', ''</p><span>'' ||l_tmp || ''&nbsp;&#'' || ASCII(''='') || ''</span>''));',
'    /* set correct answer to item session state */',
'    apex_util.set_session_state(l_answer_item, TO_NUMBER(l_arr(1)) + TO_NUMBER(l_arr(2)));',
'    RETURN l_result;',
'  EXCEPTION WHEN OTHERS',
'  THEN',
'    sys.htp.prn(wwv_flow_lang.system_message(''ajax_server_error''));',
'    RETURN l_result;',
'  END ajax_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_math_question_field(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result',
'  AS',
'    l_answer_item VARCHAR2(30);',
'    l_value       SIMPLE_INTEGER := 0;',
'    l_answer      SIMPLE_INTEGER := 0;',
'    l_is_valid    BOOLEAN;',
'    l_result      apex_plugin.t_page_item_validation_result;',
'  BEGIN',
'    l_answer_item := p_item.attribute_01;',
'    IF p_value IS NULL THEN',
'      RETURN NULL;',
'    END IF;',
'    BEGIN',
'      l_is_valid := TO_NUMBER(p_value) = nv(l_answer_item);',
'    EXCEPTION WHEN ',
'    VALUE_ERROR OR ',
'    INVALID_NUMBER',
'    THEN',
'      l_is_valid := FALSE;',
'    END;',
'    IF NOT l_is_valid THEN',
'      l_result.message := apex_lang.message(''VALIDATION_MATH_QUESTION'', p_item.plain_label);',
'    END IF;',
'    RETURN l_result;',
'  END validate_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_simple_star_rating (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS ',
'    l_result apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    sys.htp.prn(',
'      ''<div id="'' || p_item.name || ''" class="rating" data-val="'' || p_value || ''">''',
'      || ''<ul>''',
'    );',
'    for i in 1 .. 5 loop',
'        sys.htp.prn(',
'          ''<li id="'' || p_item.name ||''_'' || i || ''" title="'' || i || ''" ''',
'          || case when l_result.is_navigable then',
'            case when i <=  p_value then ''class="active enabled"'' else ''class="enabled"'' end',
'          else',
'            case when i <=  p_value then ''class="active"'' end',
'          end',
'          || ''/></li>''',
'        );',
'    end loop;',
'    sys.htp.prn(''</ul>'');',
'    if not p_is_readonly then',
'      apex_javascript.add_onload_code (p_code => ''$("''',
'        || apex_plugin_util.page_item_names_to_jquery(p_item.name) ',
'        || ''").starRating();''',
'      );',
'      sys.htp.p(',
'        ''<div id="'' || p_item.name ||''_DIALOG" class="hideMe508">''',
'        || apex_lang.message(''DIALOG_ARTICLE_RATED'')',
'        || ''</div>''',
'      );',
'      apex_javascript.add_3rd_party_library_file (',
'        p_library   => apex_javascript.c_library_jquery_ui,',
'        p_file_name => ''jquery.ui.button''',
'      );',
'    end if;',
'    sys.htp.p(''</div>'');',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_simple_star_rating;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_modal_confirm(',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_dynamic_action_render_result',
'  AS',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'  BEGIN',
'    apex_javascript.add_inline_code (',
'      p_code => ''function org_blogsite_jaris_modal_confirm(){''',
'        || ''this.affectedElements.data("request",this.triggeringElement.id).dialog({''',
'        || ''modal:true,''',
'        || ''buttons:{''',
'        || ''"'' || apex_lang.lang(''OK'') || ''":function(){$(this).dialog("close");apex.submit($(this).data("request"));},''',
'        || ''"'' || apex_lang.lang(''Cancel'') || ''":function(){$(this).dialog("close")}''',
'        || ''}})}''',
'      ,p_key  => ''org.blogsite.jaris.modal_confirm''',
'    );',
'    apex_javascript.add_3rd_party_library_file (',
'      p_library   => apex_javascript.c_library_jquery_ui,',
'      p_file_name => ''jquery.ui.button''',
'    );',
'    l_result.javascript_function := ''org_blogsite_jaris_modal_confirm'';',
'    RETURN l_result;',
'  END render_modal_confirm;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_plus_one_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_plus varchar2(20)    := coalesce(p_item.attribute_01, ''current_page'');',
'    l_page_url    varchar2(4000)  := p_item.attribute_02;',
'    l_custom_url  varchar2(4000)  := p_item.attribute_03;',
'    l_size        varchar2(20)    := coalesce(p_item.attribute_04, ''standard'');',
'    l_annotation  varchar2(20)    := coalesce(p_item.attribute_05, ''bubble'');',
'    l_width       varchar2(256)   := p_item.attribute_06;',
'    l_align       varchar2(20)    := coalesce(p_item.attribute_07, ''left'');',
'    l_expandto    varchar2(100)   := p_item.attribute_08;',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Google +1 URL based on our URL setting.',
'    -- Note: Always use session 0, otherwise Google +1 will always register a different URL.',
'    l_url := case l_url_to_plus',
'               when ''current_page'' then c_host || ''f?p='' || apex_application.g_flow_id || '':'' || apex_application.g_flow_step_id || '':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- Output the Google +1 button widget',
'    -- See https://developers.google.com/+/web/+1button/ for syntax',
'    sys.htp.prn (',
'      ''<script src="https://apis.google.com/js/platform.js" async defer></script>'' ||',
'      ''''',
'      || ''<div class="g-plusone"''',
'      || '' data-href="'' || l_url || ''"''',
'      || '' data-size="'' || apex_escape.html_attribute(l_size) || ''"''',
'      || '' data-annotation="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || case when l_annotation = ''inline'' then',
'          '' data-width="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'         end',
'      || '' data-align="'' || apex_escape.html_attribute(l_align) || ''"''',
'      || '' data-expandTo="'' || apex_escape.html_attribute(replace(l_expandto, '':'', '','')) || ''"''',
'      || ''></div>''',
'    );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_google_plus_one_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_share_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_plus varchar2(20)    := coalesce(p_item.attribute_01, ''current_page'');',
'    l_page_url    varchar2(4000)  := p_item.attribute_02;',
'    l_custom_url  varchar2(4000)  := p_item.attribute_03;',
'    l_annotation  varchar2(20)    := coalesce(p_item.attribute_04, ''bubble'');',
'    l_width       varchar2(256)   := p_item.attribute_05;',
'    l_height      varchar2(256)   := coalesce(p_item.attribute_06, ''20'');',
'    l_align       varchar2(20)    := coalesce(p_item.attribute_07, ''left'');',
'    l_expandto    varchar2(100)   := p_item.attribute_08;',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Google Share based on our URL setting.',
'    -- Note: Always use session 0, otherwise Google Share will always register a different URL.',
'    l_url := case l_url_to_plus',
'               when ''current_page'' then c_host || ''f?p='' || apex_application.g_flow_id || '':'' || apex_application.g_flow_step_id || '':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- Output the Google Share button widget',
'    -- See https://developers.google.com/+/web/+1button/ for syntax',
'    sys.htp.prn (',
'      ''<script src="https://apis.google.com/js/platform.js" async defer></script>'' ||',
'      ''''',
'      || ''<div class="g-plus" data-action="share"''',
'      || '' data-href="'' || l_url || ''"''',
'      || '' data-annotation="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || '' data-width="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || '' data-height="'' || apex_escape.html_attribute(l_height) || ''"''',
'      || '' data-align="'' || apex_escape.html_attribute(l_align) || ''"''',
'      || '' data-expandTo="'' || apex_escape.html_attribute(replace(l_expandto, '':'', '','')) || ''"''',
'      || ''></div>''',
'    );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_google_share_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--==============================================================================',
'-- Renders the Facebook "Like" button widget based on the configuration of the',
'-- page item.',
'--==============================================================================',
'  FUNCTION render_facebook_like_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_like  varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');',
'    l_page_url     varchar2(4000) := p_item.attribute_02;',
'    l_custom_url   varchar2(4000) := p_item.attribute_03;',
'    l_layout_style varchar2(15)   := nvl(p_item.attribute_04, ''standard'');',
'    l_show_faces   boolean        := (nvl(p_item.attribute_05, ''Y'') = ''Y'');',
'    l_width        number         := p_item.attribute_06;',
'    l_verb         varchar2(15)   := nvl(p_item.attribute_07, ''like'');',
'    l_font         varchar2(15)   := p_item.attribute_08;',
'    l_color_scheme varchar2(15)   := nvl(p_item.attribute_09, ''light'');',
'    ',
'    l_url          varchar2(4000);',
'    l_height       number;',
'    l_result       apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'      ',
'    -- Get the width and the height depending on the picked layout style',
'    if l_width is null then',
'        l_width := case l_layout_style',
'                     when ''standard''     then 450',
'                     when ''button_count'' then 90',
'                     when ''box_count''    then 55',
'                   end;',
'    end if;',
'    ',
'    l_height := case l_layout_style',
'                  when ''standard''     then case when l_show_faces then 80 else 35 end',
'                  when ''button_count'' then 20',
'                  when ''box_count''    then 65',
'                end;',
'    -- Base URL for the "Like" widget.',
'    -- See http://developers.facebook.com/docs/reference/plugins/like',
'    -- for a documentation of the URL syntax',
'    l_url := ''//www.facebook.com/plugins/like.php?href='';',
'    ',
'    -- Generate the "Like" URL based on our URL to Like setting.',
'    -- Note: Always use session 0, otherwise Facebook will not be able to get the page.',
'    l_url := l_url||',
'             utl_url.escape (',
'                 url => case l_url_to_like',
'                          when ''current_page'' then c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0''',
'                          when ''page_url''     then c_host||l_page_url',
'                          when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'                          when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'                        end,',
'                 escape_reserved_chars => true)||',
'             ''&amp;'';',
'    -- Add the display options for the "Like" button widget',
'    l_url := l_url||',
'             ''layout=''||l_layout_style||''&amp;''||',
'             case when l_layout_style = ''standard'' then',
'                 ''show_faces=''||case when l_show_faces then ''true'' else ''false'' end||''&amp;''',
'             end||',
'             ''width=''||l_width||''&amp;''||',
'             ''action=''||l_verb||''&amp;''||',
'             case when l_font is not null then ''font=''||l_font||''&amp;'' end||',
'             ''colorscheme=''||l_color_scheme||''&amp;''||',
'             ''height=''||l_height;',
'    -- Output the Facebook Like button widget',
'    sys.htp.prn(''<iframe src="''||l_url||''" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:''||l_width||''px; height:''||l_height||''px;" allowTransparency="true"></iframe>'');',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_facebook_like_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--==============================================================================',
'-- Renders the Twitter button widget based on the configuration of the',
'-- page item.',
'--==============================================================================',
'  FUNCTION render_twitter_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_like     varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');',
'    l_page_url        varchar2(4000) := p_item.attribute_02;',
'    l_custom_url      varchar2(4000) := p_item.attribute_03;',
'    l_layout_style    varchar2(15)   := nvl(p_item.attribute_04, ''vertical'');',
'    l_tweet_text_type varchar2(10)   := nvl(p_item.attribute_05, ''page_title'');',
'    l_custom_text     varchar2(140)  := sys.htf.escape_sc(p_item.attribute_06);',
'    l_follow1         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_07);',
'    l_follow2         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_08);',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Tweet URL based on our URL setting.',
'    -- Note: Always use session 0, otherwise Twitter will always register a different URL.',
'    l_url := case l_url_to_like',
'               when ''current_page'' then c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- For a custom text we have to replace the #PAGE_TITLE# placeholder with the correct',
'    -- language dependent page title of the current page.',
'    if l_tweet_text_type = ''custom'' then',
'        if instr(l_custom_text, ''#PAGE_TITLE'') > 0 then',
'            select replace(l_custom_text, ''#PAGE_TITLE#'', apex_application.do_substitutions(page_title, ''ESC''))',
'              into l_custom_text',
'              from apex_application_pages',
'             where application_id = nvl(apex_application.g_translated_flow_id, apex_application.g_flow_id)',
'               and page_id        = nvl(apex_application.g_translated_page_id, apex_application.g_flow_step_id);',
'        end if;',
'    end if;',
'    -- Output the Twitter button widget',
'    -- See http://twitter.com/about/resources/tweetbutton for syntax',
'    sys.htp.prn (',
'        ''<a href="//twitter.com/share" class="twitter-share-button" data-url="''||sys.htf.escape_sc(l_url)||''" ''||',
'        case when l_tweet_text_type = ''custom'' then ''data-text="''||l_custom_text||''" '' end||',
'        ''data-count="''||l_layout_style||''" ''||',
'        case when l_follow1 is not null then ''data-via="''||l_follow1||''" '' end||',
'        case when l_follow2 is not null then ''data-related="''||l_follow2||''" '' end||',
'        ''>Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>'' );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_twitter_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_PLUGIN";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_LOG" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'  FUNCTION apex_error_handler(',
'    p_error IN apex_error.t_error',
'  ) RETURN apex_error.t_error_result;',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_activity_log(',
'    p_user_id         IN NUMBER,',
'    p_activity_type   IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_related_id      IN NUMBER DEFAULT 0,',
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,',
'    p_user_agent      IN VARCHAR2 DEFAULT NULL,',
'    p_referer         IN VARCHAR2 DEFAULT NULL,',
'    p_search_type     IN VARCHAR2 DEFAULT NULL,',
'    p_search          IN VARCHAR2 DEFAULT NULL,',
'    p_country_code    IN VARCHAR2 DEFAULT NULL,',
'    p_region          IN VARCHAR2 DEFAULT NULL,',
'    p_city            IN VARCHAR2 DEFAULT NULL,',
'    p_latitude        IN NUMBER DEFAULT NULL,',
'    p_longitude       IN NUMBER DEFAULT NULL,',
'    p_additional_info IN VARCHAR2 DEFAULT NULL',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_article_log(',
'    p_article_id      IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE rate_article(',
'    p_article_id      IN NUMBER,',
'    p_article_rate    IN OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_category_log(',
'    p_category_id     IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_file_log(',
'    p_file_id         IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_LOG";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_LOG" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  INSERT_NULL_VALUE EXCEPTION;',
'  PARENT_NOT_FOUND  EXCEPTION;',
'  PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);',
'  PRAGMA EXCEPTION_INIT(PARENT_NOT_FOUND, -2291);',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION apex_error_handler(',
'    p_error IN apex_error.t_error',
'  ) RETURN apex_error.t_error_result',
'  AS',
'    l_result          apex_error.t_error_result;',
'    l_error           apex_error.t_error;',
'    l_reference_id    PLS_INTEGER;',
'    l_constraint_name VARCHAR2(255);',
'    l_err_msg         VARCHAR2(32700);',
'  BEGIN',
'    l_result := apex_error.init_error_result ( p_error => p_error );',
'    -- If it''s an internal error raised by APEX, like an invalid statement or',
'    -- code which can''t be executed, the error text might contain security sensitive',
'    -- information. To avoid this security problem we can rewrite the error to',
'    -- a generic error message and log the original error message for further',
'    -- investigation by the help desk.',
'    IF p_error.is_internal_error THEN',
'      -- Access Denied errors raised by application or page authorization should',
'      -- still show up with the original error message',
'      IF NOT p_error.apex_error_code LIKE ''APEX.SESSION_STATE.%''',
'      AND NOT p_error.apex_error_code = ''APEX.AUTHORIZATION.ACCESS_DENIED''',
'      AND NOT p_error.apex_error_code = ''APEX.PAGE.DUPLICATE_SUBMIT''',
'      AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE''',
'      AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY''',
'      THEN',
'        -- log error for example with an autonomous transaction and return',
'        -- l_reference_id as reference#',
'        -- l_reference_id := log_error (',
'        --                       p_error => p_error );',
'        --',
'        -- Change the message to the generic error message which doesn''t expose',
'        -- any sensitive information.',
'        -- log error to application debug information',
'        apex_debug.error(',
'          ''Error handler: %s %s %s'',',
'           p_error.apex_error_code,',
'           l_result.message,',
'           l_result.additional_info',
'        );',
'        l_result.message := apex_lang.message(''GENERAL_ERROR'');',
'        l_result.additional_info := NULL;',
'      END IF;',
'    ELSE',
'      /*',
'      -- Show the error as inline error',
'      l_result.display_location :=',
'      CASE',
'      WHEN l_result.display_location = apex_error.c_on_error_page THEN',
'        apex_error.c_inline_in_notification',
'      ELSE',
'        l_result.display_location',
'      END;',
'      */',
'      -- If it''s a constraint violation like',
'      --',
'      --   -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated',
'      --   -) : transaction rolled back (-> can hide a deferred constraint)',
'      --   -) : check constraint violated',
'      --   -) : integrity constraint violated - parent key not found',
'      --   -) : integrity constraint violated - child record found',
'      --',
'      -- we try to get a friendly error message from our constraint lookup configuration.',
'      -- If we don''t find the constraint in our lookup table we fallback to',
'      -- the original ORA error message.',
'      IF p_error.ora_sqlcode IN (-1, -2091, -2290, -2291, -2292) THEN',
'        l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );',
'        l_err_msg := apex_lang.message(l_constraint_name);',
'        -- not every constraint has to be in our lookup table',
'        IF NOT l_err_msg = l_constraint_name THEN',
'          l_result.message := l_err_msg;',
'        END IF;',
'      END IF;',
'      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, ''...'')',
'      -- in a table trigger or in a PL/SQL package called by a process and we',
'      -- haven''t found the error in our lookup table, then we just want to see',
'      -- the actual error text and not the full error stack with all the ORA error numbers.',
'      IF p_error.ora_sqlcode IS NOT NULL AND l_result.message = p_error.message THEN',
'        l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );',
'      END IF;',
'      -- If no associated page item/tabular form column has been set, we can use',
'      -- apex_error.auto_set_associated_item to automatically guess the affected',
'      -- error field by examine the ORA error for const'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39896041466269770486)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'raint names or column names.',
'      IF l_result.page_item_name IS NULL AND l_result.column_alias IS NULL THEN',
'        apex_error.auto_set_associated_item ( p_error => p_error, p_error_result => l_result );',
'      END IF;',
'    END IF;',
'    RETURN l_result;',
'  END apex_error_handler;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_activity_log(',
'    p_user_id         IN NUMBER,',
'    p_activity_type   IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_related_id      IN NUMBER DEFAULT 0,',
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,',
'    p_user_agent      IN VARCHAR2 DEFAULT NULL,',
'    p_referer         IN VARCHAR2 DEFAULT NULL,',
'    p_search_type     IN VARCHAR2 DEFAULT NULL,',
'    p_search          IN VARCHAR2 DEFAULT NULL,',
'    p_country_code    IN VARCHAR2 DEFAULT NULL,',
'    p_region          IN VARCHAR2 DEFAULT NULL,',
'    p_city            IN VARCHAR2 DEFAULT NULL,',
'    p_latitude        IN NUMBER DEFAULT NULL,',
'    p_longitude       IN NUMBER DEFAULT NULL,',
'    p_additional_info IN VARCHAR2 DEFAULT NULL',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    INSERT /*+ append */ INTO blog_activity_log (',
'      ACTIVITY_TYPE,',
'      APEX_SESSION_ID,',
'      IP_ADDRESS,',
'      RELATED_ID,',
'      USER_ID,',
'      LATITUDE,',
'      LONGITUDE,',
'      COUNTRY_CODE,',
'      COUNTRY_REGION,',
'      COUNTRY_CITY,',
'      HTTP_USER_AGENT,',
'      HTTP_REFERER,',
'      SEARCH_TYPE,',
'      SEARCH_CRITERIA,',
'      ADDITIONAL_INFO',
'    ) VALUES (',
'      p_activity_type,',
'      p_session_id,',
'      p_ip_address,',
'      p_related_id,',
'      p_user_id,',
'      p_latitude,',
'      p_longitude,',
'      p_country_code,',
'      p_region,',
'      p_city,',
'      p_user_agent,',
'      p_referer,',
'      p_search_type,',
'      p_search,',
'      p_additional_info',
'    );',
'    COMMIT;',
'  END write_activity_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_article_log(',
'    p_article_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    UPDATE blog_article_log',
'    SET view_count = view_count + 1,',
'        last_view = SYSDATE',
'    WHERE article_id = p_article_id',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN ',
'  VALUE_ERROR OR',
'  INVALID_NUMBER OR',
'  PARENT_NOT_FOUND OR',
'  INSERT_NULL_VALUE',
'  THEN',
'      apex_debug.warn(''blog_log.write_article_log(p_article_id => %s); error: %s'', COALESCE(to_char(p_article_id), ''NULL''), sqlerrm);',
'  END write_article_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rate_article(',
'    p_article_id    IN NUMBER,',
'    p_article_rate  IN OUT NOCOPY NUMBER',
'  )',
'  AS',
'    l_rate NUMBER;',
'  BEGIN',
'    UPDATE blog_article_log',
'      SET article_rate      = (article_rate * rate_click + p_article_rate) / (rate_click + 1),',
'          article_rate_int  = ROUND( (article_rate * rate_click + p_article_rate) / (rate_click + 1) ),',
'          rate_click        = rate_click + 1,',
'          last_rate         = SYSDATE',
'    WHERE article_id = p_article_id',
'    RETURNING article_rate_int INTO l_rate',
'    ;',
'    sys.htp.prn(l_rate);',
'  END rate_article;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_category_log(',
'    p_category_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    MERGE INTO blog_category_log a',
'    USING (SELECT p_category_id AS category_id FROM DUAL) b',
'    ON (a.category_id = b.category_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.view_count = a.view_count + 1,',
'      a.last_view = SYSDATE',
'    WHEN NOT MATCHED THEN',
'    INSERT (category_id) VALUES (b.category_id)',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN',
'    VALUE_ERROR OR',
'    INVALID_NUMBER OR',
'    PARENT_NOT_FOUND OR',
'    INSERT_NULL_VALUE',
'  THEN',
'    apex_debug.warn(''blog_log.write_category_log(p_category_id => %s); error: %s'', COALESCE(to_char(p_category_id), ''NULL''), sqlerrm);',
'  END write_category_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_file_log(',
'    p_file_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    MERGE INTO blog_file_log a',
'    USING (SELECT p_file_id AS file_id FROM DUAL) b',
'    ON (a.file_id = b.file_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.click_count = a.click_count + 1,',
'      last_click = SYSDATE',
'    WHEN NOT MATCHED THEN',
'    INSERT (file_id) VALUES (b.file_id)',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN',
'  VALUE_ERROR OR',
'  INVALID_NUMBER OR',
'  PARENT_NOT_FOUND OR',
'  INSERT_NULL_VALUE',
'  THEN',
'    apex_debug.warn(''blog_log.write_file_log(p_file_id => %s); error: %s'', COALESCE(to_char(p_file_id), ''NULL''), sqlerrm);',
'  END write_file_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_LOG";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_JOB" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs;',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview;',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE,',
'    p_interval IN PLS_INTEGER DEFAULT NULL',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_JOB";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_JOB" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_host_ip_info (',
'    p_ip            IN VARCHAR2,',
'    p_city          OUT NOCOPY VARCHAR2,',
'    p_country_code  OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_clob  CLOB;',
'    l_url   CONSTANT VARCHAR2(32000) := ''http://api.hostip.info/'';',
'  BEGIN',
'    l_clob := apex_web_service.make_rest_request(',
'                p_url         => l_url,',
'                p_http_method => ''GET'',',
'                p_parm_name   => apex_util.string_to_table(''ip''),',
'                p_parm_value  => apex_util.string_to_table(p_ip)',
'              );',
'    BEGIN',
'      SELECT EXTRACTVALUE(VALUE(t), ''//gml:name'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS city,',
'        EXTRACTVALUE(VALUE(t), ''//countryAbbrev'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS countryAbbrev',
'      INTO p_city, p_country_code',
'      FROM TABLE(',
'        XMLSEQUENCE(',
'          XMLTYPE.CREATEXML(l_clob).EXTRACT(',
'            ''HostipLookupResultSet/gml:featureMember/Hostip'',',
'            ''xmlns:gml="http://www.opengis.net/gml"''',
'          )',
'        )',
'      ) t;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      p_city          := NULL;',
'      p_country_code  := NULL;',
'    END;',
' ',
'  END get_host_ip_info;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global functions and procedures',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log',
'  AS',
'    l_new_tbl VARCHAR2(4000);',
'    l_log_tbl CHAR(1);',
'  BEGIN',
'  ',
'    SELECT SUBSTR(table_name, -1) AS log_tbl',
'    INTO l_log_tbl',
'    FROM user_synonyms',
'    WHERE synonym_name = ''BLOG_ACTIVITY_LOG''',
'    ;',
'    ',
'    IF l_log_tbl = ''1'' THEN',
'      l_new_tbl := ''2'';',
'    ELSIF l_log_tbl = ''2'' THEN',
'      l_new_tbl := ''1'';',
'    ELSE',
'      raise_application_error(-20001, ''Invalid log table.'');',
'    END IF;',
'    ',
'    EXECUTE IMMEDIATE ''TRUNCATE TABLE BLOG_ACTIVITY_LOG'' || l_new_tbl;',
'    ',
'    EXECUTE IMMEDIATE ''CREATE OR REPLACE SYNONYM BLOG_ACTIVITY_LOG FOR BLOG_ACTIVITY_LOG'' || l_new_tbl;',
'  ',
'  END rotate_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country',
'  AS',
'    l_city    VARCHAR2(2000);',
'    l_code    VARCHAR2(2000);',
'    l_count   NUMBER;',
'  BEGIN',
'  ',
'    /* Get distinct ip addreses where is no country information. */',
'    FOR c1 IN(',
'      SELECT DISTINCT ip_address',
'      FROM blog_activity_log',
'      WHERE activity_type = ''NEW_SESSION''',
'      AND country_code IS NULL',
'    ) LOOP',
'    ',
'      l_count := 0;',
'      l_city  := NULL;',
'      l_code  := NULL;',
'      ',
'      /* Check from logs if ip address already have country information from previous visit */',
'      BEGIN',
'        WITH qry AS (',
'          SELECT',
'            ROW_NUMBER() OVER(ORDER BY activity_date DESC) AS rn,',
'            country_city,',
'            country_code',
'          FROM blog_v$activity_log',
'          WHERE activity_type = ''NEW_SESSION''',
'          AND ip_address = c1.ip_address',
'          AND country_code IS NOT NULL',
'        )',
'        SELECT',
'          country_city,',
'          country_code',
'        INTO l_city, l_code',
'        FROM qry',
'        WHERE rn = 1',
'        ;',
'      /* If no previous visit get country info from hostip.info */',
'      EXCEPTION WHEN NO_DATA_FOUND THEN    ',
'        get_host_ip_info(',
'          p_ip            => c1.ip_address,',
'          p_city          => l_city,',
'          p_country_code  => l_code',
'        );',
'      END;',
'      ',
'      l_city  := COALESCE(l_city, ''(unknown city)'');',
'      l_code  := COALESCE(l_code, ''XX'');',
'      ',
'      /* Update activity log if country code exists in BLOG_COUNTRY table */',
'      UPDATE blog_activity_log',
'      SET country_city  = l_city,',
'        country_code    = l_code',
'      WHERE activity_type = ''NEW_SESSION''',
'        AND ip_address  = c1.ip_address',
'        AND country_code IS NULL',
'        AND EXISTS (',
'          SELECT 1',
'          FROM blog_country c',
'          WHERE c.country_code = l_code',
'        )',
'      ;',
'      l_count := SQL%ROWCOUNT;',
'      ',
'      /* If no rows updated, country code is unknown */',
'      IF l_count = 0 THEN',
'        l_code := ''XX'';    ',
'        UPDATE blog_activity_log',
'        SET country_city  = l_city,',
'          country_code    = l_code',
'        WHERE activity_type = ''NEW_SESSION''',
'          AND ip_address  = c1.ip_address',
'          AND country_code IS NULL',
'          ;',
'        l_count := SQL%ROWCOUNT;',
'      END IF;',
'      ',
'      /* Update total visitors from country */',
'      UPDATE blog_country',
'      SET visit_count = visit_count + l_count',
'      WHERE country_code = l_code',
'      ;',
'      ',
'    END LOOP;',
'    ',
'  END update_country;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs',
'  AS',
'  BEGIN',
'    dbms_mview.refresh(''BLOG_ARTICLE_HIT20,BLOG_ARTICLE_TOP20'');',
'  END update_activity_logs;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview',
'  AS',
'  BEGIN',
'    /* Delete from blog_article_preview rows where session is expired */',
'    DELETE FROM blog_article_preview p',
'    WHERE NOT EXISTS (',
'      SELECT 1 FROM apex_workspace_sessions s',
'      WHERE s.apex_session_id = p.apex_session_id',
'    );',
'  END purge_preview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log_job(',
'    p_drop_job IN BOOLEAN DEFAULT FALSE,',
'    p_interval IN PLS_INTEGER DEFAULT NULL',
'  )',
'  AS',
'    l_interval        SIMPLE_INTEGER := 0;',
'    c_job             CONSTANT VARCHAR2(30) := ''BLOG_ROTATE_LOG'';',
'    job_not_exists    EXCEPTION;',
'    PRAGMA            EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF p_interval IS NULL OR p_interval < 1 THEN',
'      l_interval := blog_util.get_param_value(''LOG_ROTATE_DAY'');',
'    ELSE',
'      l_interval := p_interval;',
'    END IF;',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        => ''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.rotate_log'',',
'        start_date      => TRUNC(SYSTIMESTAMP),',
'        enabled         => TRUE,',
'        repeat_interval => ''FREQ=DAILY;INTERVAL='' || l_interval || '';BYMINUTE=5'',',
'        comments        => ''Rotate blog activity logs''',
'      );',
'    END IF;',
'  END rotate_log_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country_job (',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job                 CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_COUNTRY'';',
'    job_not_exists        EXCEPTION;',
'    PRAGMA                EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        =>''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.update_country'',',
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),',
'        repeat_interval => ''FREQ=MINUTELY;INTERVAL=10'',',
'        enabled         => TRUE,',
'        comments        => ''Update blog visitors country''',
'      );',
'    END IF;',
'  END update_country_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs_job (',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job          CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_ACTIVITY_LOGS'';',
'    job_not_exists EXCEPTION;',
'    PRAGMA         EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        =>''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.update_activity_logs'',',
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),',
'        repeat_interval => ''FREQ=MINUTELY;INTERVAL=15'',',
'        enabled         => TRUE,',
'        comments        => ''Update blog statistic log mviews''',
'      );',
'    END IF;',
'  END update_activity_logs_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview_job(',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job           CONSTANT VARCHAR2(30) := ''BLOG_PURGE_PREVIEW'';',
'    job_not_exists  EXCEPTION;',
'    PRAGMA          EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        => ''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.purge_preview'',',
'        start_date      => TRUNC(SYSTIMESTAMP),',
'        repeat_interval => ''FREQ=DAILY'',',
'        enabled         => TRUE,',
'        comments        => ''Purge blog article preview table''',
'      );',
'    END IF;',
'  END purge_preview_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_JOB";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_INSTALL" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  i sys.dbms_sql.varchar2_table;',
'  e sys.dbms_sql.varchar2_table;',
'  b BLOB;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_param_data(',
'    p_theme_path    IN VARCHAR2 DEFAULT NULL,',
'    p_upgrade       IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION varchar2_to_blob(',
'    p_varchar2_tab IN sys.dbms_sql.varchar2_table',
'  ) RETURN BLOB;',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_jobs (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION get_version (',
'    p_option  IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'END "BLOG_INSTALL";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_INSTALL" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_param_data(',
'    p_theme_path    IN VARCHAR2 DEFAULT NULL,',
'    p_upgrade       IN BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    l_reader_id NUMBER;',
'    l_admin_id  NUMBER;',
'    l_app_alias VARCHAR2(2000);',
'    l_base_url  VARCHAR2(2000);',
'  BEGIN',
'    l_base_url := apex_util.host_url(''SCRIPT'');',
'    BEGIN',
'      SELECT application_id',
'      INTO l_reader_id',
'      FROM apex_applications',
'      WHERE version = (select blog_util.get_param_value(''READER_VERSION'') from dual)',
'        AND application_group = ''Blog''',
'        AND application_name = ''Blog Reader''',
'      ;',
'    EXCEPTION WHEN ',
'      NO_DATA_FOUND ',
'    THEN',
'      raise_application_error(-20001, ''Blog reader application not exists.'');',
'    END;',
'    BEGIN',
'      SELECT application_id',
'      INTO l_admin_id',
'      FROM apex_applications',
'      WHERE version = (select blog_util.get_param_value(''ADMIN_VERSION'') from dual)',
'        AND application_group = ''Blog''',
'        AND application_name = ''Blog Administration''',
'      ;',
'    EXCEPTION WHEN ',
'      NO_DATA_FOUND',
'    THEN',
'      raise_application_error(-20002, ''Blog admin application not exists.'');',
'    END;',
'    ',
'    SELECT alias',
'    INTO l_app_alias',
'    FROM apex_applications',
'    WHERE application_id = l_reader_id',
'    ;',
'    UPDATE blog_param',
'    SET param_value = TO_CHAR(l_reader_id)',
'    WHERE param_id  = ''G_BLOG_READER_APP_ID''',
'    ;',
'    UPDATE blog_param',
'    SET param_value = TO_CHAR(l_admin_id)',
'    WHERE param_id  = ''G_BLOG_ADMIN_APP_ID''',
'    ;',
'    IF NOT p_upgrade THEN',
'      UPDATE blog_param',
'      SET param_value = coalesce(p_theme_path,''f?p='' || TO_CHAR(l_reader_id) || '':DOWNLOAD:0:'')',
'      WHERE param_id  = ''G_THEME_PATH''',
'      ;',
'      UPDATE blog_param',
'      SET param_value = l_base_url || ''f?p='' || l_app_alias || '':RSS''',
'      WHERE param_id  = ''G_RSS_FEED_URL''',
'      ;',
'      UPDATE blog_param',
'      SET param_value = l_base_url',
'      WHERE param_id  = ''G_BASE_URL''',
'      ;',
'      dbms_mview.refresh(''BLOG_PARAM_APP'',''C'');',
'    END IF;',
'  END update_param_data;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION varchar2_to_blob(',
'    p_varchar2_tab IN sys.dbms_sql.varchar2_table',
'  ) RETURN BLOB',
'  AS',
'    l_blob BLOB;',
'    l_size NUMBER;',
'  BEGIN',
'    dbms_lob.createtemporary(l_blob, true, dbms_lob.session);',
'    FOR i IN 1 .. p_varchar2_tab.count',
'    LOOP',
'      l_size := length(p_varchar2_tab(i)) / 2;',
'      dbms_lob.writeappend(l_blob, l_size, hextoraw(p_varchar2_tab(i)));',
'    END LOOP;',
'    RETURN l_blob;',
'  EXCEPTION WHEN OTHERS THEN',
'    dbms_lob.close(l_blob);',
'    RETURN NULL;',
'  END varchar2_to_blob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_jobs (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'  BEGIN',
'    blog_job.rotate_log_job(p_drop_job);',
'    blog_job.purge_preview_job(p_drop_job);',
'    blog_job.update_country_job(p_drop_job);',
'    blog_job.update_activity_logs_job(p_drop_job);',
'  END set_jobs;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_version (',
'    p_option  IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2',
'  AS',
'    l_version VARCHAR2(256);',
'  BEGIN',
'    IF p_option = ''READER'' THEN',
'      BEGIN',
'        SELECT s.version',
'         INTO l_version',
'         FROM apex_applications s',
'        WHERE s.application_id = (select blog_util.get_param_value(''G_BLOG_READER_APP_ID'') from dual)',
'          AND s.version = (select blog_util.get_param_value(''READER_VERSION'') from dual)',
'        ;',
'      EXCEPTION WHEN NO_DATA_FOUND THEN',
'        raise_application_error(-20001, ''Blog reader application not exists.'');',
'      END;',
'    ELSIF p_option = ''ADMIN'' THEN',
'      BEGIN',
'        SELECT s.version',
'         INTO l_version',
'         FROM apex_applications s',
'        WHERE s.application_id = (select blog_util.get_param_value(''G_BLOG_ADMIN_APP_ID'') from dual)',
'          AND s.version = (select blog_util.get_param_value(''ADMIN_VERSION'') from dual)',
'        ;',
'      EXCEPTION WHEN NO_DATA_FOUND THEN',
'        raise_application_error(-20001, ''Blog admin application not exists.'');',
'      END;',
'    ELSE',
'      l_version :=  blog_util.get_param_value(''SCHEMA_VERSION'');',
'    END IF;',
'    RETURN l_version;    ',
'  END get_version;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_INSTALL";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_ADMIN_APP" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  PROCEDURE refresh_article_mview;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_collection_name RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_article_from_collection;',
'--------------------------------------------------------------------------------',
'  PROCEDURE table_to_collection (',
'    p_table       IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE article_to_collection (',
'    p_article_id  IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_text (',
'    p_article_id      IN NUMBER,',
'    p_success_message IN OUT NOCOPY VARCHAR2,',
'    p_message         IN VARCHAR DEFAULT ''Action Processed.''',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_preview (',
'    p_article_id      IN NUMBER,',
'    p_author_id       IN NUMBER,',
'    p_category_id     IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  );',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE create_new_category(',
'    p_category_name IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_category_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_faq_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_author_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_resource_sequence;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_category_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_author_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_faq_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_resource_seq (',
'    p_link_type IN VARCHAR2',
'  ) RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION set_param_value_item (',
'    p_param_id          IN VARCHAR2,',
'    p_yesno             IN VARCHAR2,',
'    p_text_null         IN VARCHAR2,',
'    p_number_null       IN VARCHAR2,',
'    p_number_not_null   IN VARCHAR2,',
'    p_text_not_null     IN VARCHAR2,',
'    p_textarea_null     IN VARCHAR2,',
'    p_textarea_not_null IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  FUNCTION login(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  FUNCTION check_password(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  PROCEDURE post_login;',
'--------------------------------------------------------------------------------',
'  FUNCTION is_developer RETURN PLS_INTEGER;',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  OUT NOCOPY VARCHAR2,',
'    p_language_code         OUT NOCOPY VARCHAR2,',
'    p_message_text          OUT NOCOPY VARCHAR2,',
'    p_md5                   OUT NOCOPY VARCHAR2',
'   );',
'--------------------------------------------------------------------------------',
'  PROCEDURE upd_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_md5                   IN VARCHAR2,',
'    p_success_message       OUT NOCOPY VARCHAR2',
'   );',
'--------------------------------------------------------------------------------  ',
'END "BLOG_ADMIN_APP";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_ADMIN_APP" ',
'AS',
'--------------------------------------------------------------------------------',
'  -- Private constants and functions',
'  g_article_text_collection CONSTANT VARCHAR2(80) := ''ARTICLE_TEXT_COLLECTION'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION build_apex_lang_message_md5 (',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_col_sep   IN VARCHAR2 DEFAULT ''|''',
'  ) RETURN VARCHAR2',
'  AS',
'  BEGIN',
'    RETURN sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => ',
'      p_translation_entry_id || p_col_sep ||',
'      p_translatable_message || p_col_sep ||',
'      p_language_code || p_col_sep ||',
'      p_message_text || p_col_sep ||',
'      ''''',
'    ));',
'  END build_apex_lang_message_md5;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  -- Global procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE refresh_article_mview',
'  AS',
'  BEGIN',
'    dbms_mview.refresh(''BLOG_ARCHIVE_LOV,BLOG_ARTICLE_HIT20,BLOG_ARTICLE_LAST20,BLOG_ARTICLE_TOP20'',''CCCC'');',
'  END refresh_article_mview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION table_to_clob (',
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  ) RETURN CLOB',
'  AS',
'    l_len   SIMPLE_INTEGER := 0;',
'    l_data  CLOB;',
'  BEGIN',
'    l_len := p_table.COUNT;',
'    IF l_len = 0',
'    OR COALESCE(LENGTH(p_table(1)), 0) = 0',
'    THEN',
'      RETURN EMPTY_CLOB();',
'    END IF;',
'    dbms_lob.createtemporary(',
'      lob_loc => l_data,',
'      cache   => TRUE,',
'      dur     => dbms_lob.session',
'    );',
'    dbms_lob.open(l_data, dbms_lob.lob_readwrite);',
'    FOR i IN 1 .. l_len',
'    LOOP',
'      dbms_lob.writeappend(',
'        lob_loc => l_data,',
'        amount  => LENGTH(p_table(i)),',
'        buffer  => p_table(i)',
'      );',
'    END LOOP;',
'    dbms_lob.close(l_data);',
'    RETURN l_data;',
'  END table_to_clob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_clob(',
'    p_clob IN CLOB',
'  )',
'  AS',
'    l_length      SIMPLE_INTEGER := 0;',
'    l_clob_len    SIMPLE_INTEGER := 0;',
'    l_offset      SIMPLE_INTEGER := 1;',
'    l_byte_len    SIMPLE_INTEGER := 0;',
'    l_temp        VARCHAR2(32767);',
'  BEGIN',
'  --',
'    l_length    := COALESCE(dbms_lob.getlength(p_clob), 0);',
'    l_clob_len  := l_length;',
'    l_byte_len '))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39896041466269770486)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' := 30000;',
'    --',
'    IF l_length < l_byte_len THEN',
'      sys.htp.prn(p_clob);',
'    ELSE',
'    --',
'      WHILE l_offset < l_length AND l_byte_len > 0',
'      LOOP',
'        /* Get 30k cut */',
'        l_temp := sys.dbms_lob.substr(p_clob,l_byte_len,l_offset);',
'        --',
'        /* Print HTML */',
'        sys.htp.prn(l_temp);',
'        --',
'        /* set the start position for the next cut */',
'        l_offset := l_offset + l_byte_len;',
'        --',
'        /* set the end position if less than 32k */',
'        l_clob_len := l_clob_len - l_byte_len;',
'        IF l_clob_len < l_byte_len THEN',
'          l_byte_len := l_clob_len;',
'        END IF;',
'      END LOOP;',
'    --',
'    END IF;',
'  END print_clob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_collection_name RETURN VARCHAR2',
'  AS',
'  BEGIN',
'    RETURN g_article_text_collection;',
'  END;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_article_from_collection',
'  AS',
'    l_clob CLOB;',
'  BEGIN',
'    SELECT clob001',
'    INTO l_clob',
'    FROM apex_collections',
'    WHERE collection_name = g_article_text_collection',
'    AND seq_id = 1',
'    ;',
'    print_clob(l_clob);',
'  END print_article_from_collection ;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE table_to_collection (',
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  )',
'  AS',
'  BEGIN',
'    apex_collection.create_or_truncate_collection(g_article_text_collection);',
'    apex_collection.add_member(',
'      p_collection_name => g_article_text_collection,',
'      p_clob001         => table_to_clob(p_table)',
'    );',
'  END table_to_collection;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE article_to_collection (',
'    p_article_id IN NUMBER',
'  )',
'  AS',
'    l_clob CLOB;',
'  BEGIN',
'    apex_collection.create_or_truncate_collection(g_article_text_collection);',
'    BEGIN',
'      SELECT article_text',
'      INTO l_clob',
'      FROM blog_article',
'      WHERE article_id = p_article_id',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      l_clob := NULL;',
'    END;',
'    apex_collection.add_member(',
'      p_collection_name => g_article_text_collection,',
'      p_clob001 => l_clob',
'    );',
'  END article_to_collection;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_text (',
'    p_article_id      IN NUMBER,',
'    p_success_message IN OUT NOCOPY VARCHAR2,',
'    p_message         IN VARCHAR DEFAULT ''Action Processed.''',
'  )',
'  AS',
'  BEGIN',
'    MERGE INTO blog_article a',
'    USING (',
'      SELECT p_article_id AS article_id,',
'        clob001',
'      FROM apex_collections',
'      WHERE collection_name = g_article_text_collection',
'        AND seq_id  = 1',
'    ) b',
'    ON (a.article_id = b.article_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.article_text = b.clob001',
'    WHERE sys.dbms_lob.compare(a.article_text, b.clob001) != 0',
'      OR sys.dbms_lob.compare(a.article_text, b.clob001) IS NULL',
'    ;',
'    IF SQL%ROWCOUNT > 0 THEN',
'      p_success_message := COALESCE(p_success_message, p_message);',
'    END IF;',
'  END save_article_text;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_preview (',
'    p_article_id      IN NUMBER,',
'    p_author_id       IN NUMBER,',
'    p_category_id     IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  )',
'  AS',
'  BEGIN',
'    /* Hopefully we can someday share collections between applications */',
'    blog_admin_app.table_to_collection (p_article_text);',
'    MERGE INTO blog_article_preview a',
'    USING (',
'      SELECT p_article_id AS article_id,',
'        p_author_id       AS author_id,',
'        p_category_id     AS category_id,',
'        p_article_title   AS article_title,',
'        clob001           AS article_text',
'      FROM apex_collections',
'      WHERE collection_name = g_article_text_collection',
'        AND seq_id  = 1',
'    ) b',
'    ON (a.apex_session_id = b.article_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.article_text = b.article_text,',
'      a.author_id             = b.author_id,',
'      a.category_id           = b.category_id,',
'      a.article_title         = b.article_title',
'    WHEN NOT MATCHED THEN',
'    INSERT (apex_session_id, author_id, category_id, article_title, article_text)',
'    VALUES (b.article_id, b.author_id, b.category_id, b.article_title, b.article_text)',
'    ;',
'  END save_article_preview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE create_new_category(',
'    p_category_name IN VARCHAR2',
'  )',
'  AS',
'    l_category_id NUMBER;',
'  BEGIN',
'    INSERT INTO blog_category (category_name, category_seq)',
'    VALUES(p_category_name, blog_admin_app.get_next_category_seq)',
'    RETURNING category_id INTO l_category_id;',
'    sys.htp.prn(l_category_id);',
'  EXCEPTION WHEN DUP_VAL_ON_INDEX THEN',
'    sys.htp.prn(apex_lang.message(''MSG_CATEGORY_EXISTS''));',
'  END create_new_category;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_category_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_category a',
'    USING (',
'      SELECT c.category_id,',
'        ROW_NUMBER() OVER(ORDER BY c.category_seq) * 10 AS new_seq',
'      FROM blog_category c',
'    ) b',
'    ON (a.category_id = b.category_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.category_seq = b.new_seq',
'    ;',
'  END cleanup_category_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_faq_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_faq a',
'    USING (',
'      SELECT c.faq_id,',
'        ROW_NUMBER() OVER(ORDER BY c.faq_seq) * 10 AS new_seq',
'      FROM blog_faq c',
'    ) b',
'    ON (a.faq_id = b.faq_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.faq_seq = b.new_seq',
'    ;',
'  END cleanup_faq_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_author_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_author a',
'    USING (',
'      SELECT c.author_id,',
'        ROW_NUMBER() OVER(ORDER BY c.author_seq) * 10 AS new_seq',
'      FROM blog_author c',
'    ) b',
'    ON (a.author_id = b.author_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.author_seq = b.new_seq',
'    ;',
'  END cleanup_author_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_resource_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_resource a',
'    USING (',
'      SELECT c.link_id,',
'        ROW_NUMBER() OVER(PARTITION BY c.link_type ORDER BY c.link_seq) * 10 AS new_seq',
'      FROM blog_resource c',
'    ) b',
'    ON (a.link_id = b.link_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.link_seq = b.new_seq',
'    ;',
'  END cleanup_resource_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_category_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(category_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_category',
'    ;',
'    RETURN l_max;',
'  END get_next_category_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_author_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(author_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_author',
'    ;',
'    RETURN l_max;',
'  END get_next_author_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_faq_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(faq_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_faq',
'    ;',
'    RETURN l_max;',
'  END get_next_faq_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_resource_seq (',
'    p_link_type IN VARCHAR2',
'  ) RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(link_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_resource',
'    WHERE link_type = p_link_type',
'    ;',
'    RETURN l_max;',
'  END get_next_resource_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION set_param_value_item (',
'    p_param_id          IN VARCHAR2,',
'    p_yesno             IN VARCHAR2,',
'    p_text_null         IN VARCHAR2,',
'    p_number_null       IN VARCHAR2,',
'    p_number_not_null   IN VARCHAR2,',
'    p_text_not_null     IN VARCHAR2,',
'    p_textarea_null     IN VARCHAR2,',
'    p_textarea_not_null IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_value VARCHAR2(32700);',
'  BEGIN',
'    SELECT CASE',
'      WHEN param_type = ''YESNO'' THEN',
'        p_yesno',
'      WHEN param_type = ''TEXT'' AND param_nullable = ''Y'' THEN',
'        p_text_null',
'      WHEN param_type = ''TEXT'' AND param_nullable = ''N'' THEN',
'        p_text_not_null',
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''Y'' THEN',
'        p_number_null',
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''N'' THEN',
'        p_number_not_null',
'      WHEN param_type = ''TEXTAREA'' AND param_nullable = ''Y'' THEN',
'        p_textarea_null',
'      WHEN param_type = ''TEXTAREA'' AND param_nullable = ''N'' THEN',
'        p_textarea_not_null',
'    END AS param_value',
'    INTO l_value',
'    FROM blog_param',
'    WHERE param_id = p_param_id',
'    ;',
'    RETURN l_value;',
'  END set_param_value_item;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION login(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    AUTH_SUCCESS            CONSTANT INTEGER      := 0;',
'    AUTH_UNKNOWN_USER       CONSTANT INTEGER      := 1;',
'    AUTH_ACCOUNT_LOCKED     CONSTANT INTEGER      := 2;',
'    AUTH_ACCOUNT_EXPIRED    CONSTANT INTEGER      := 3;',
'    AUTH_PASSWORD_INCORRECT CONSTANT INTEGER      := 4;',
'    AUTH_PASSWORD_FIRST_USE CONSTANT INTEGER      := 5;',
'    AUTH_ATTEMPTS_EXCEEDED  CONSTANT INTEGER      := 6;',
'    AUTH_INTERNAL_ERROR     CONSTANT INTEGER      := 7;',
'    l_password              VARCHAR2(4000);',
'    l_stored_password       VARCHAR2(4000);',
'  BEGIN',
'    -- First, check to see if the user is in the user table and have password',
'    BEGIN',
'      SELECT passwd',
'      INTO l_stored_password',
'      FROM blog_author',
'      WHERE user_name = p_username',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_UNKNOWN_USER);',
'      RETURN FALSE;',
'    END;',
'    -- Apply the custom hash function to the password',
'    l_password := blog_pw_hash(p_username, p_password);',
'    -- Compare them to see if they are the same and return either TRUE or FALSE',
'    IF l_password = l_stored_password THEN',
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_SUCCESS);',
'      RETURN TRUE;',
'    END IF;',
'    APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_PASSWORD_INCORRECT);',
'    RETURN FALSE;',
'  END login;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION check_password (',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    l_password              VARCHAR2(4000);',
'    l_stored_password       VARCHAR2(4000);',
'  BEGIN',
'    -- First, check to see if the user is in the user table and have password',
'    BEGIN',
'      SELECT passwd',
'      INTO l_stored_password',
'      FROM blog_author',
'      WHERE user_name = p_username',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      RETURN FALSE;',
'    END;',
'    -- Apply the custom hash function to the password',
'    l_password := blog_pw_hash(p_username, p_password);',
'    -- Compare them to see if they are the same and return either TRUE or FALSE',
'    IF l_password = l_stored_password THEN',
'      RETURN TRUE;',
'    END IF;',
'    RETURN FALSE;',
'  END check_password;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE post_login',
'  AS',
'    l_app_user  VARCHAR2(255);',
'    l_author_id NUMBER;',
'    l_app_id    NUMBER;',
'    l_reader_id NUMBER;',
'  BEGIN',
'    l_app_user  := v(''APP_USER'');',
'    l_app_id    := nv(''APP_ID'');',
'    SELECT author_id',
'      INTO l_author_id',
'      FROM blog_author',
'     WHERE user_name = l_app_user',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'    ;',
'    blog_util.set_items_from_param(l_app_id);',
'    apex_util.set_session_state(''G_AUTHOR_ID'', l_author_id);',
'    apex_util.set_session_state(''G_DATE_TIME_FORMAT'', COALESCE(apex_util.get_preference(''DATE_TIME_FORMAT'', l_app_user), ''DD Mon YYYY HH24:MI:SS''));',
'    IF apex_util.get_preference(''SHOW_HELP'', l_app_user) IS NULL THEN',
'      apex_util.set_preference(',
'        p_preference => ''SHOW_HELP'',',
'        p_value => ''Y'',',
'        p_user => l_app_user',
'      );',
'    END IF;',
'    l_reader_id := nv(''G_BLOG_READER_APP_ID'');',
'    FOR c1 IN (',
'      SELECT alias',
'      FROM apex_applications',
'      WHERE application_id = l_reader_id',
'    ) LOOP',
'      apex_util.set_session_state(''G_BLOG_READER_APP_ALIAS'', c1.alias);',
'    END LOOP;',
'  END post_login;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION is_developer RETURN PLS_INTEGER',
'  AS',
'  BEGIN',
'    RETURN CASE WHEN apex_authorization.is_authorized(''IS_DEVELOPER'') THEN 1 ELSE 0 END;',
'  END ;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  OUT NOCOPY VARCHAR2,',
'    p_language_code         OUT NOCOPY VARCHAR2,',
'    p_message_text          OUT NOCOPY VARCHAR2,',
'    p_md5                   OUT NOCOPY VARCHAR2',
'   )',
'   AS',
'   BEGIN',
'    FOR c1 IN (',
'      SELECT translation_entry_id',
'        ,translatable_message',
'        ,language_code',
'        ,message_text',
'      FROM apex_application_translations',
'      WHERE application_id = p_application_id',
'        AND translation_entry_id = p_translation_entry_id',
'    ) LOOP',
'      p_translatable_message := c1.translatable_message;',
'      p_language_code := c1.language_code;',
'      p_message_text := c1.message_text;',
'      p_md5 := build_apex_lang_message_md5 (',
'          c1.translation_entry_id,',
'          c1.translatable_message,',
'          c1.language_code,',
'          c1.message_text ',
'      );',
'    END LOOP;',
'  END get_apex_lang_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE upd_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_md5                   IN VARCHAR2,',
'    p_success_message       OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_input_md5 varchar2(32676);',
'    l_table_md5 varchar2(32676);',
'  BEGIN',
'    l_input_md5 := build_apex_lang_message_md5 (',
'        p_translation_entry_id,',
'        p_translatable_message,',
'        p_language_code,',
'        p_message_text ',
'     );',
'    IF p_md5 IS NOT NULL THEN',
'      FOR c1 IN (',
'        SELECT translation_entry_id',
'          ,translatable_message',
'          ,language_code',
'          ,message_text',
'        FROM apex_application_translations',
'        WHERE application_id = p_application_id',
'        AND translation_entry_id = p_translation_entry_id',
'      ) LOOP',
'          l_table_md5 := build_apex_lang_message_md5 (',
'              c1.translation_entry_id,',
'              c1.translatable_message,',
'              c1.language_code,',
'              c1.message_text ',
'           );',
'      END LOOP;',
'    END IF;',
'    IF l_table_md5 != p_md5 THEN',
'      raise_application_error (-20001, apex_lang.message(''MSG_LOST_UPDATE'', l_table_md5, p_md5));',
'    ELSIF p_md5       IS NOT NULL',
'    AND   l_table_md5 IS NOT NULL',
'    AND   l_table_md5 = p_md5',
'    AND   l_input_md5 != p_md5',
'    THEN',
'      apex_lang.update_message(',
'        p_id => p_translation_entry_id,',
'        p_message_text => p_message_text',
'      );',
'      p_success_message := apex_lang.message(''MSG_ACTION_PROCESSED'');',
'    END IF;',
'  END upd_apex_lang_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_ADMIN_APP";',
'/',
'',
'-- Post install',
'BEGIN',
'  blog_install.update_param_data(p_upgrade => true);',
'END;',
'/'))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890502976352938053)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'2 Index'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE INDEX  "BLOG_ARTICLE_CTX" ON  "BLOG_ARTICLE" ("ARTICLE_TEXT") ',
'INDEXTYPE IS "CTXSYS"."CONTEXT"  PARAMETERS (''FILTER CTXSYS.NULL_FILTER SECTION GROUP CTXSYS.HTML_SECTION_GROUP SYNC (ON COMMIT)'')',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX1" ON  "BLOG_ARTICLE" ("AUTHOR_ID")',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX2" ON  "BLOG_ARTICLE" ("CATEGORY_ID")',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX3" ON  "BLOG_ARTICLE" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX4" ON  "BLOG_ARTICLE" ("YEAR_MONTH_NUM")',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX5" ON  "BLOG_ARTICLE" ("CREATED_ON")',
'/',
'CREATE INDEX  "BLOG_ARTICLE_IDX6" ON  "BLOG_ARTICLE" ("VALID_FROM")',
'/',
'CREATE INDEX  "BLOG_AUTHOR_IDX1" ON  "BLOG_AUTHOR" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_CATEGORY_IDX1" ON  "BLOG_CATEGORY" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_COMMENT_BLOCK_IDX1" ON  "BLOG_COMMENT_BLOCK" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX1" ON  "BLOG_COMMENT" ("USER_ID")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX2" ON  "BLOG_COMMENT" ("ARTICLE_ID")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX3" ON  "BLOG_COMMENT" ("PARENT_ID")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX4" ON  "BLOG_COMMENT" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX5" ON  "BLOG_COMMENT" ("MODERATED")',
'/',
'CREATE INDEX  "BLOG_COMMENT_IDX6" ON  "BLOG_COMMENT" ("CREATED_ON" DESC)',
'/',
'CREATE INDEX  "BLOG_COMMENT_NOTIFY_IDX1" ON  "BLOG_COMMENT_NOTIFY" ("FOLLOWUP_NOTIFY")',
'/',
'CREATE INDEX  "BLOG_COMMENT_USER_IDX1" ON  "BLOG_COMMENT_USER" ("BLOCKED")',
'/',
'CREATE INDEX  "BLOG_COUNTRY_IDX1" ON  "BLOG_COUNTRY" ("COUNTRY_NAME")',
'/',
'CREATE INDEX  "BLOG_COUNTRY_IDX2" ON  "BLOG_COUNTRY" ("VISIT_COUNT")',
'/',
'CREATE INDEX  "BLOG_FAQ_IDX1" ON  "BLOG_FAQ" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_FILE_IDX1" ON  "BLOG_FILE" ("ACTIVE")',
'/',
'CREATE INDEX  "BLOG_FILE_IDX2" ON  "BLOG_FILE" ("FILE_TYPE")',
'/',
'CREATE INDEX  "BLOG_PARAM_IDX1" ON  "BLOG_PARAM" ("PARAM_PARENT")',
'/',
'CREATE INDEX  "BLOG_RESOURCE_IDX1" ON  "BLOG_RESOURCE" ("LINK_TYPE")',
'/',
'CREATE INDEX  "BLOG_RESOURCE_IDX2" ON  "BLOG_RESOURCE" ("ACTIVE")',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890503173333939448)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'3 Sequence'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE SEQUENCE BLOG_SEQ MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 1 CACHE 50 NOORDER CYCLE',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890503370098940970)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'4 Synonym'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE SYNONYM  "BLOG_ACTIVITY_LOG" FOR  "BLOG_ACTIVITY_LOG1"',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890503566647942583)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'5 Function'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE FUNCTION  "BLOG_SGID" RETURN NUMBER',
'AUTHID DEFINER',
'AS',
'BEGIN',
'  RETURN TO_NUMBER(TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') || LPAD(blog_seq.nextval,4,0));',
'END "BLOG_SGID";',
'/',
'',
'    ',
'begin',
'execute immediate ''',
'CREATE OR REPLACE FUNCTION "BLOG_PW_HASH" (',
'  p_username IN VARCHAR2,',
'  p_password IN VARCHAR2',
') RETURN VARCHAR2',
'AUTHID DEFINER',
'AS',
'/* This function should be wrapped, as the hash algorhythm for password is exposed. */',
'  l_password VARCHAR2(4000);',
'  l_salt     VARCHAR2(255) := '''''' || sys.dbms_random.string(''A'',40) || '''''';',
'BEGIN',
'  l_password  :=',
'        SUBSTR(l_salt, 8, 13)',
'    ||  sys.utl_raw.cast_to_raw(p_password)',
'    ||  SUBSTR(l_salt, 4, 10)',
'    ||  SUBSTR(l_salt, 22, 28)',
'    ||  sys.utl_raw.cast_to_raw(p_username)',
'    ||  SUBSTR(l_salt, 18, 26)',
'  ;',
'  l_password := sys.utl_raw.cast_to_raw(l_password);',
'  l_password := sys.dbms_obfuscation_toolkit.md5(input_string => l_password);',
'  RETURN l_password;',
'END "BLOG_PW_HASH";',
''';',
'end;',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39886978707192314701)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'6 View'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_param_app',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS',
'SELECT a.application_id',
'  ,a.item_name AS param_id',
'FROM apex_application_items a',
'WHERE EXISTS (SELECT 1 FROM blog_param p WHERE p.param_id = a.item_name)',
'/',
'ALTER TABLE BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_PK PRIMARY KEY (APPLICATION_ID, PARAM_ID)',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_comment_log',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS',
'SELECT c.article_id,',
'  COUNT(1) AS total_comment_count,',
'  SUM(CASE WHEN c.moderated = ''Y'' AND c.active = ''Y'' THEN 1 ELSE 0 END) AS comment_count,',
'  MAX(CASE WHEN c.moderated = ''Y'' AND c.active = ''Y'' THEN c.created_on END) AS last_comment,',
'  SUM(CASE WHEN c.moderated = ''Y'' THEN 1 ELSE 0 END) AS moderated_comment_count,',
'  MAX(CASE WHEN c.moderated = ''Y'' THEN c.created_on END) AS last_moderated_comment,',
'  SUM(CASE WHEN c.active = ''Y'' THEN 1 ELSE 0 END) AS active_comment_count,',
'  MAX(CASE WHEN c.active = ''Y'' THEN c.created_on END) AS last_active_comment',
'FROM blog_comment c',
'GROUP BY c.article_id',
'/',
'ALTER TABLE BLOG_COMMENT_LOG ADD CONSTRAINT BLOG_COMMENT_LOG_PK PRIMARY KEY (ARTICLE_ID)',
'/',
'ALTER TABLE BLOG_COMMENT_LOG MODIFY TOTAL_COMMENT_COUNT NOT NULL',
'/',
'ALTER TABLE BLOG_COMMENT_LOG MODIFY COMMENT_COUNT NOT NULL',
'/',
'ALTER TABLE BLOG_COMMENT_LOG MODIFY MODERATED_COMMENT_COUNT NOT NULL',
'/',
'ALTER TABLE BLOG_COMMENT_LOG MODIFY ACTIVE_COMMENT_COUNT NOT NULL',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE OR REPLACE FORCE VIEW blog_v$article',
'AS ',
'  SELECT a.article_id',
'  ,c.category_id',
'  ,b.author_id',
'  ,b.author_name',
'  ,b.twitter AS author_twitter',
'  ,a.article_title',
'  ,a.description',
'  ,c.category_name',
'  ,a.keywords',
'  ,a.hastags',
'  ,a.article_text',
'  ,a.active',
'  ,a.created_on',
'  ,a.changed_on',
'  ,a.year_month_num',
'  ,CASE WHEN d.comment_count IS NULL THEN',
'    0',
'  ELSE',
'    d.comment_count',
'  END AS comment_count',
'  ,(SELECT apex_lang.message(''TEXT_POSTED_ON'') FROM DUAL) AS created_on_txt',
'  ,(SELECT apex_lang.message(''TEXT_POSTED_BY'') FROM DUAL) AS posted_by_txt',
'  ,(SELECT apex_lang.message(''TEXT_CATEGORY'') FROM DUAL) AS category_txt',
'  ,(SELECT apex_lang.message(''TEXT_VIEW_COMMENTS'') FROM DUAL) AS view_comment',
'  ,(SELECT apex_lang.message(''TEXT_POST_COMMENT'') FROM DUAL) AS post_comment',
'FROM blog_article a',
'  JOIN blog_author b ON a.author_id = b.author_id',
'  JOIN blog_category c ON a.category_id = c.category_id',
'  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id',
'WHERE a.active = ''Y''',
'  AND b.active = ''Y''',
'  AND c.active = ''Y''',
'  AND a.valid_from <= SYSDATE',
'WITH READ ONLY CONSTRAINT blog_v$article_ro',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_archive_lov',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS',
'SELECT a.year_month_num',
'    ,TRUNC(a.created_on,''MM'') AS year_month',
'    ,COUNT(1) AS article_count',
'  FROM blog_v$article a',
'  GROUP BY a.year_month_num,',
'    TRUNC(a.created_on,''MM'')',
'/',
'ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT BLOG_ARCHIVE_LOV_PK PRIMARY KEY (YEAR_MONTH_NUM)',
'/',
'ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT  BLOG_ARCHIVE_LOV_UK1 UNIQUE (YEAR_MONTH)',
'/',
'ALTER TABLE BLOG_ARCHIVE_LOV MODIFY YEAR_MONTH NOT NULL',
'/',
'ALTER TABLE BLOG_ARCHIVE_LOV MODIFY ARTICLE_COUNT NOT NULL',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_article_top20',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS ',
'WITH qry AS (',
'  SELECT /*+ FIRST_ROWS(20) */',
'    ROW_NUMBER() OVER(ORDER BY l.view_count DESC) AS top_article,',
'    a.article_id,',
'    a.article_title,',
'    l.view_count,',
'    l.last_view,',
'    a.created_on,',
'    SUM(l.view_count) OVER() AS total_views',
'  FROM blog_v$article a',
'  JOIN blog_article_log l',
'  ON a.article_id = l.article_id',
'  WHERE l.view_count > 0',
')',
'SELECT',
'  qry.article_id,',
'  apex_escape.html(qry.article_title) AS article_title,',
'  qry.view_count,',
'  qry.last_view,',
'  (qry.view_count / qry.total_views) * 100 AS view_pct,',
'  qry.created_on,',
'  qry.top_article',
'FROM qry',
'WHERE qry.top_article <= 20',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_PK PRIMARY KEY (ARTICLE_ID)',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_UK1 UNIQUE (TOP_ARTICLE)',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY ARTICLE_TITLE NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY LAST_VIEW NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY VIEW_PCT NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY TOP_ARTICLE NOT NULL',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_article_last20',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS',
'WITH qry AS (',
'  SELECT /*+ FIRST_ROWS(20) */',
'    ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn,',
'    a.article_id,',
'    a.article_title,',
'    a.description,',
'    a.author_name,',
'    a.category_name,',
'    a.created_on',
'  FROM blog_v$article a',
')',
'SELECT',
'  qry.article_id,',
'  apex_escape.html(qry.article_title) AS article_title,',
'  apex_escape.html(qry.description)   AS description,',
'  qry.author_name                     AS posted_by,',
'  apex_escape.html(qry.category_name) AS category_name,',
'  qry.created_on,',
'  qry.article_title                   AS rss_title,',
'  qry.description                     AS rss_description,',
'  qry.category_name                   AS rss_category,',
'  to_char(sys_extract_utc(cast(qry.created_on as timestamp)), ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'', ''NLS_DATE_LANGUAGE=ENGLISH'') AS rss_pubdate,',
'  qry.article_id || to_char(sys_extract_utc(cast(qry.created_on as timestamp)), ''JHH24MISS'') AS rss_guid',
'FROM qry',
'WHERE qry.rn <= 20',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_PK PRIMARY KEY (ARTICLE_ID)',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY ARTICLE_TITLE NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY DESCRIPTION NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY CATEGORY_NAME NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY RSS_PUBDATE NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY RSS_GUID NOT NULL',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE OR REPLACE FORCE VIEW blog_v$activity_log',
'AS ',
'  SELECT',
'    activity_date ,',
'    activity_type,',
'    apex_session_id,',
'    ip_address,',
'    related_id,',
'    user_id,',
'    latitude,',
'    longitude,',
'    country_code,',
'    country_region,',
'    country_city,',
'    http_user_agent,',
'    http_referer,',
'    search_type,',
'    search_criteria,',
'	additional_info',
'FROM blog_activity_log1',
'UNION ALL',
'SELECT',
'    activity_date,',
'    activity_type,',
'    apex_session_id,',
'    ip_address,',
'    related_id,',
'    user_id,',
'    latitude,',
'    longitude,',
'    country_code,',
'    country_region,',
'    country_city,',
'    http_user_agent,',
'    http_referer,',
'    search_type,',
'    search_criteria,',
'	additional_info',
'FROM blog_activity_log2',
'WITH READ ONLY CONSTRAINT blog_v$activity_log_ro',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE OR REPLACE FORCE VIEW blog_v$activity',
'AS ',
'  SELECT l.activity_date',
'  ,l.activity_type',
'  ,n.apex_session_id',
'  ,n.ip_address',
'  ,l.related_id',
'  ,l.user_id',
'  ,u.email',
'  ,u.nick_name',
'  ,u.website',
'  ,n.latitude',
'  ,n.longitude',
'  ,n.country_code',
'  ,c.country_name',
'  ,n.country_region',
'  ,n.country_city',
'  ,n.http_user_agent',
'  ,l.http_referer',
'  ,l.search_type',
'  ,l.search_criteria',
'  ,l.additional_info',
'FROM blog_v$activity_log l',
'JOIN blog_v$activity_log n',
'  ON l.apex_session_id = n.apex_session_id',
' AND n.activity_type = ''NEW_SESSION''',
'LEFT JOIN blog_country c ',
'  ON n.country_code = c.country_code',
'LEFT JOIN blog_comment_user u',
'  ON l.user_id = u.user_id',
'WITH READ ONLY CONSTRAINT blog_v$activity_ro',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------',
'CREATE MATERIALIZED VIEW blog_article_hit20',
'  NOLOGGING',
'  BUILD IMMEDIATE',
'  USING NO INDEX',
'  REFRESH COMPLETE ON DEMAND',
'AS',
'WITH al AS (',
'  SELECT l.related_id AS article_id,',
'    TRUNC(l.activity_date) AS activity_date,',
'    COUNT(1) AS view_count',
'  FROM blog_v$activity_log l',
'  WHERE l.activity_type = ''READ''',
'  GROUP BY l.related_id,TRUNC(l.activity_date)',
'), hit AS (',
'  SELECT al.article_id,',
'    SUM(al.view_count) / COUNT(1) AS hit_ratio',
'  FROM al',
'  GROUP BY al.article_id',
'), qry AS (',
'  SELECT /*+ FIRST_ROWS(20) */',
'    ROW_NUMBER() OVER(ORDER BY hit.hit_ratio DESC) AS rn,',
'    a.article_id,',
'    a.article_title,',
'    hit.hit_ratio',
'  FROM blog_v$article a',
'  JOIN hit',
'  ON a.article_id = hit.article_id',
')',
'SELECT',
'  qry.article_id,',
'   apex_escape.html(qry.article_title) AS article_title,',
'  qry.hit_ratio,',
'  qry.rn AS top_hit',
'FROM qry',
'WHERE qry.rn <= 20',
'/',
'ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_PK PRIMARY KEY (ARTICLE_ID)',
'/',
'ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY ARTICLE_TITLE NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY HIT_RATIO NOT NULL',
'/',
'ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY TOP_HIT NOT NULL',
'/',
'--------------------------------------------------------------',
'--------------------------------------------------------------'))
);
end;
/
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39888428900552479804)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'7 Package'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE PACKAGE  "BLOG_LOG" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'  FUNCTION apex_error_handler(',
'    p_error IN apex_error.t_error',
'  ) RETURN apex_error.t_error_result;',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_activity_log(',
'    p_user_id         IN NUMBER,',
'    p_activity_type   IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_related_id      IN NUMBER DEFAULT 0,',
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,',
'    p_user_agent      IN VARCHAR2 DEFAULT NULL,',
'    p_referer         IN VARCHAR2 DEFAULT NULL,',
'    p_search_type     IN VARCHAR2 DEFAULT NULL,',
'    p_search          IN VARCHAR2 DEFAULT NULL,',
'    p_country_code    IN VARCHAR2 DEFAULT NULL,',
'    p_region          IN VARCHAR2 DEFAULT NULL,',
'    p_city            IN VARCHAR2 DEFAULT NULL,',
'    p_latitude        IN NUMBER DEFAULT NULL,',
'    p_longitude       IN NUMBER DEFAULT NULL,',
'    p_additional_info IN VARCHAR2 DEFAULT NULL',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_article_log(',
'    p_article_id      IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE rate_article(',
'    p_article_id      IN NUMBER,',
'    p_article_rate    IN OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_category_log(',
'    p_category_id     IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_file_log(',
'    p_file_id         IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_LOG";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_LOG" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  INSERT_NULL_VALUE EXCEPTION;',
'  PARENT_NOT_FOUND  EXCEPTION;',
'  PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);',
'  PRAGMA EXCEPTION_INIT(PARENT_NOT_FOUND, -2291);',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION apex_error_handler(',
'    p_error IN apex_error.t_error',
'  ) RETURN apex_error.t_error_result',
'  AS',
'    l_result          apex_error.t_error_result;',
'    l_error           apex_error.t_error;',
'    l_reference_id    PLS_INTEGER;',
'    l_constraint_name VARCHAR2(255);',
'    l_err_msg         VARCHAR2(32700);',
'  BEGIN',
'    l_result := apex_error.init_error_result ( p_error => p_error );',
'    -- If it''s an internal error raised by APEX, like an invalid statement or',
'    -- code which can''t be executed, the error text might contain security sensitive',
'    -- information. To avoid this security problem we can rewrite the error to',
'    -- a generic error message and log the original error message for further',
'    -- investigation by the help desk.',
'    IF p_error.is_internal_error THEN',
'      -- Access Denied errors raised by application or page authorization should',
'      -- still show up with the original error message',
'      IF NOT p_error.apex_error_code LIKE ''APEX.SESSION_STATE.%''',
'      AND NOT p_error.apex_error_code = ''APEX.AUTHORIZATION.ACCESS_DENIED''',
'      AND NOT p_error.apex_error_code = ''APEX.PAGE.DUPLICATE_SUBMIT''',
'      AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE''',
'      AND NOT p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY''',
'      THEN',
'        -- log error for example with an autonomous transaction and return',
'        -- l_reference_id as reference#',
'        -- l_reference_id := log_error (',
'        --                       p_error => p_error );',
'        --',
'        -- Change the message to the generic error message which doesn''t expose',
'        -- any sensitive information.',
'        -- log error to application debug information',
'        apex_debug.error(',
'          ''Error handler: %s %s %s'',',
'           p_error.apex_error_code,',
'           l_result.message,',
'           l_result.additional_info',
'        );',
'        l_result.message := apex_lang.message(''GENERAL_ERROR'');',
'        l_result.additional_info := NULL;',
'      END IF;',
'    ELSE',
'      /*',
'      -- Show the error as inline error',
'      l_result.display_location :=',
'      CASE',
'      WHEN l_result.display_location = apex_error.c_on_error_page THEN',
'        apex_error.c_inline_in_notification',
'      ELSE',
'        l_result.display_location',
'      END;',
'      */',
'      -- If it''s a constraint violation like',
'      --',
'      --   -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated',
'      --   -) : transaction rolled back (-> can hide a deferred constraint)',
'      --   -) : check constraint violated',
'      --   -) : integrity constraint violated - parent key not found',
'      --   -) : integrity constraint violated - child record found',
'      --',
'      -- we try to get a friendly error message from our constraint lookup configuration.',
'      -- If we don''t find the constraint in our lookup table we fallback to',
'      -- the original ORA error message.',
'      IF p_error.ora_sqlcode IN (-1, -2091, -2290, -2291, -2292) THEN',
'        l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );',
'        l_err_msg := apex_lang.message(l_constraint_name);',
'        -- not every constraint has to be in our lookup table',
'        IF NOT l_err_msg = l_constraint_name THEN',
'          l_result.message := l_err_msg;',
'        END IF;',
'      END IF;',
'      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, ''...'')',
'      -- in a table trigger or in a PL/SQL package called by a process and we',
'      -- haven''t found the error in our lookup table, then we just want to see',
'      -- the actual error text and not the full error stack with all the ORA error numbers.',
'      IF p_error.ora_sqlcode IS NOT NULL AND l_result.message = p_error.message THEN',
'        l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );',
'      END IF;',
'      -- If no associated page item/tabular form column has been set, we can use',
'      -- apex_error.auto_set_associated_item to automatically guess the affected',
'      -- error field by examine the ORA error for constraint names or column names.',
'      IF l_result.page_item_name IS NULL AND l_result.column_alias IS NULL THEN',
'        apex_error.auto_set_associated_item ( p_error => p_error, p_error_result => l_result );',
'      END IF;',
'    END IF;',
'    RETURN l_result;',
'  END apex_error_handler;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_activity_log(',
'    p_user_id         IN NUMBER,',
'    p_activity_type   IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_related_id      IN NUMBER DEFAULT 0,',
'    p_ip_address      IN VARCHAR2 DEFAULT NULL,',
'    p_user_agent      IN VARCHAR2 DEFAULT NULL,',
'    p_referer         IN VARCHAR2 DEFAULT NULL,',
'    p_search_type     IN VARCHAR2 DEFAULT NULL,',
'    p_search          IN VARCHAR2 DEFAULT NULL,',
'    p_country_code    IN VARCHAR2 DEFAULT NULL,',
'    p_region          IN VARCHAR2 DEFAULT NULL,',
'    p_city            IN VARCHAR2 DEFAULT NULL,',
'    p_latitude        IN NUMBER DEFAULT NULL,',
'    p_longitude       IN NUMBER DEFAULT NULL,',
'    p_additional_info IN VARCHAR2 DEFAULT NULL',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    INSERT /*+ append */ INTO blog_activity_log (',
'      ACTIVITY_TYPE,',
'      APEX_SESSION_ID,',
'      IP_ADDRESS,',
'      RELATED_ID,',
'      USER_ID,',
'      LATITUDE,',
'      LONGITUDE,',
'      COUNTRY_CODE,',
'      COUNTRY_REGION,',
'      COUNTRY_CITY,',
'      HTTP_USER_AGENT,',
'      HTTP_REFERER,',
'      SEARCH_TYPE,',
'      SEARCH_CRITERIA,',
'      ADDITIONAL_INFO',
'    ) VALUES (',
'      p_activity_type,',
'      p_session_id,',
'      p_ip_address,',
'      p_related_id,',
'      p_user_id,',
'      p_latitude,',
'      p_longitude,',
'      p_country_code,',
'      p_region,',
'      p_city,',
'      p_user_agent,',
'      p_referer,',
'      p_search_type,',
'      p_search,',
'      p_additional_info',
'    );',
'    COMMIT;',
'  END write_activity_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_article_log(',
'    p_article_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    UPDATE blog_article_log',
'    SET view_count = view_count + 1,',
'        last_view = SYSDATE',
'    WHERE article_id = p_article_id',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN ',
'  VALUE_ERROR OR',
'  INVALID_NUMBER OR',
'  PARENT_NOT_FOUND OR',
'  INSERT_NULL_VALUE',
'  THEN',
'      apex_debug.warn(''blog_log.write_article_log(p_article_id => %s); error: %s'', COALESCE(to_char(p_article_id), ''NULL''), sqlerrm);',
'  END write_article_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rate_article(',
'    p_article_id    IN NUMBER,',
'    p_article_rate  IN OUT NOCOPY NUMBER',
'  )',
'  AS',
'    l_rate NUMBER;',
'  BEGIN',
'    UPDATE blog_article_log',
'      SET article_rate      = (article_rate * rate_click + p_article_rate) / (rate_click + 1),',
'          article_rate_int  = ROUND( (article_rate * rate_click + p_article_rate) / (rate_click + 1) ),',
'          rate_click        = rate_click + 1,',
'          last_rate         = SYSDATE',
'    WHERE article_id = p_article_id',
'    RETURNING article_rate_int INTO l_rate',
'    ;',
'    sys.htp.prn(l_rate);',
'  END rate_article;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_category_log(',
'    p_category_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    MERGE INTO blog_category_log a',
'    USING (SELECT p_category_id AS category_id FROM DUAL) b',
'    ON (a.category_id = b.category_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.view_count = a.view_count + 1,',
'      a.last_view = SYSDATE',
'    WHEN NOT MATCHED THEN',
'    INSERT (category_id) VALUES (b.category_id)',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN',
'    VALUE_ERROR OR',
'    INVALID_NUMBER OR',
'    PARENT_NOT_FOUND OR',
'    INSERT_NULL_VALUE',
'  THEN',
'    apex_debug.warn(''blog_log.write_category_log(p_category_id => %s); error: %s'', COALESCE(to_char(p_category_id), ''NULL''), sqlerrm);',
'  END write_category_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE write_file_log(',
'    p_file_id  IN NUMBER',
'  )',
'  AS',
'    PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    MERGE INTO blog_file_log a',
'    USING (SELECT p_file_id AS file_id FROM DUAL) b',
'    ON (a.file_id = b.file_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.click_count = a.click_count + 1,',
'      last_click = SYSDATE',
'    WHEN NOT MATCHED THEN',
'    INSERT (file_id) VALUES (b.file_id)',
'    ;',
'    COMMIT;',
'  EXCEPTION WHEN',
'  VALUE_ERROR OR',
'  INVALID_NUMBER OR',
'  PARENT_NOT_FOUND OR',
'  INSERT_NULL_VALUE',
'  THEN',
'    apex_debug.warn(''blog_log.write_file_log(p_file_id => %s); error: %s'', COALESCE(to_char(p_file_id), ''NULL''), sqlerrm);',
'  END write_file_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_LOG";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_XML" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  FUNCTION show_entry(',
'    p_build_option_id         IN VARCHAR2,',
'    p_authorization_scheme_id IN VARCHAR2,',
'    p_condition_type_code     IN VARCHAR2,',
'    p_condition_expression1   IN VARCHAR2,',
'    p_condition_expression2   IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE rss(',
'    p_app_alias IN VARCHAR2,',
'    p_blog_name IN VARCHAR2,',
'    p_base_url  IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE sitemap(',
'    p_app_id    IN NUMBER,',
'    p_app_alias IN VARCHAR2,',
'    p_base_url  IN VARCHAR2,',
'    p_tab_list  IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_XML";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_XML" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION show_entry(',
'    p_build_option_id         IN VARCHAR2,',
'    p_authorization_scheme_id IN VARCHAR2,',
'    p_condition_type_code     IN VARCHAR2,',
'    p_condition_expression1   IN VARCHAR2,',
'    p_condition_expression2   IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_retval  BOOLEAN;',
'  BEGIN',
'    l_retval := apex_plugin_util.is_component_used (',
'      p_build_option_id         => p_build_option_id,',
'      p_authorization_scheme_id => p_authorization_scheme_id,',
'      p_condition_type          => p_condition_type_code,',
'      p_condition_expression1   => p_condition_expression1,',
'      p_condition_expression2   => p_condition_expression2',
'    );',
'    RETURN apex_debug.tochar(l_retval);',
'  END show_entry;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rss(',
'    p_app_alias IN VARCHAR2,',
'    p_blog_name IN VARCHAR2,',
'    p_base_url  IN VARCHAR2',
'  )',
'  AS',
'    l_xml         BLOB;',
'    l_url         VARCHAR2(255);',
'    l_rss_desc    VARCHAR2(255);',
'    l_rss_url     VARCHAR2(255);',
'    l_home_url    VARCHAR2(255);',
'    l_article_url VARCHAR2(255);',
'    l_webmaster   VARCHAR2(255);',
'    l_rss_lang    VARCHAR2(5);',
'    c_version     CONSTANT VARCHAR2(5) := ''2.0'';',
'  BEGIN',
'    l_rss_lang    := apex_application.g_browser_language;',
'    l_rss_desc    := apex_plugin_util.replace_substitutions(apex_lang.message(''RSS_DESCRIPTION''));',
'    ',
'    l_url         := ''f?p='' || p_app_alias || '':'';',
'    l_rss_url     := p_base_url || l_url || ''RSS'';',
'    l_home_url    := p_base_url || l_url || ''HOME'';',
'    l_article_url := l_url || ''READ:0::::ARTICLE:'';',
'    SELECT xmlelement("rss", xmlattributes(c_version AS "version", ''http://www.w3.org/2005/Atom'' AS "xmlns:atom", ''http://purl.org/dc/elements/1.1/'' AS "xmlns:dc"),',
'      xmlelement("channel",',
'        xmlelement("atom:link", xmlattributes(l_rss_url AS "href", ''self'' AS "rel", ''application/rss+xml'' AS "type")),',
'        xmlforest(',
'          p_blog_name AS "title"',
'          ,l_home_url AS "link"',
'          ,l_rss_desc AS "description"',
'          ,l_rss_lang AS "language"',
'        ),',
'        xmlagg(',
'          xmlelement("item",',
'            xmlelement("title", l.rss_title),',
'            xmlelement("dc:creator", l.posted_by),',
'            xmlelement("category", l.rss_category),',
'            xmlelement("link", p_base_url || apex_util.prepare_url(l_article_url || l.article_id, NULL, ''PUBLIC_BOOKMARK'')),',
'            xmlelement("description", l.rss_description),',
'            xmlelement("pubDate", l.rss_pubdate),',
'            xmlelement("guid", xmlattributes(''false'' AS "isPermaLink"), l.rss_guid)',
'          ) ORDER BY created_on DESC',
'        )',
'      )',
'    ).getblobval(nls_charset_id(''AL32UTF8''))',
'    INTO l_xml',
'    FROM blog_article_last20 l',
'    ;',
'	sys.htp.flush;',
'	sys.htp.init;',
'    owa_util.mime_header(''application/rss+xml'', TRUE);',
'    wpg_docload.download_file(l_xml);',
'    apex_application.stop_apex_engine;',
'  END rss;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE sitemap(',
'    p_app_id    IN NUMBER,',
'    p_app_alias IN VARCHAR2,',
'    p_base_url  IN VARCHAR2,',
'    p_tab_list  IN VARCHAR2',
'  )',
'  AS',
'    l_xml             BLOB;',
'    l_article_url     VARCHAR2(255);',
'    l_category_url    VARCHAR2(255);',
'  BEGIN',
'    l_article_url   := ''f?p='' || p_app_alias || '':READ:0::::ARTICLE:'';',
'    l_category_url  := ''f?p='' || p_app_alias || '':READCAT:0::::CATEGORY:'';',
'    WITH article_cat AS(',
'      SELECT category_id,',
'        MAX(changed_on) AS changed_on',
'      FROM blog_v$article b',
'      GROUP BY category_id',
'    ), sitemap_query AS (',
'      SELECT 1 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY e.display_sequence) AS rnum,',
'        apex_plugin_util.replace_substitutions(e.entry_target) AS url,',
'        (SELECT MAX(changed_on) FROM article_cat) AS lastmod',
'      FROM APEX_APPLICATION_LIST_ENTRIES e',
'      WHERE e.application_id = p_app_id',
'        AND e.list_name      = p_tab_list',
'        AND',
'          blog_xml.show_entry(',
'            (SELECT o.build_option_id FROM apex_application_build_options o WHERE o.build_option_name = e.build_option),',
'            e.authorization_scheme_id,',
'            e.condition_type_code,',
'            e.condition_expression1,',
'            e.condition_expression2',
'           ) = ''true''',
'      UNION ALL',
'      SELECT 2 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY a.created_on) AS rnum,',
'        apex_util.prepare_url(l_article_url || a.article_id, NULL, ''PUBLIC_BOOKMARK'') AS url,',
'        a.changed_on AS lastmod',
'      FROM blog_v$article a',
'      UNION ALL',
'      SELECT 3 AS grp,',
'        ROW_NUMBER() OVER(ORDER BY c.category_seq) AS rnum,',
'        apex_util.prepare_url(l_category_url || c.category_id, NULL, ''PUBLIC_BOOKMARK'') AS url,',
'        a.changed_on AS lastmod',
'      FROM blog_category c',
'      JOIN article_cat a',
'        ON c.category_id = a.category_id',
'       AND c.active = ''Y''',
'    )',
'    SELECT XMLElement("urlset", XMLAttributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' AS "xmlns"),',
'        (',
'          XMLAgg(',
'              XMLElement("url"',
'              ,XMLElement("loc", p_base_url || url)',
'              ,XMLElement("lastmod", TO_CHAR(lastmod, ''YYYY-MM-DD''))',
'              ,XMLElement("changefreq", ''monthly'')',
'              ,XMLElement("priority", ''0.5'')',
'            ) ORDER BY grp,rnum',
'          )',
'        )',
'      ).getblobval(nls_charset_id(''AL32UTF8''))',
'    INTO l_xml',
'    FROM sitemap_query',
'    ;',
'	sys.htp.flush;',
'	sys.htp.init;',
'    owa_util.mime_header(''application/xml'', TRUE);',
'    wpg_docload.download_file(l_xml);',
'    apex_application.stop_apex_engine;',
'  END sitemap;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_XML";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_UTIL" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  FUNCTION init_session (',
'    p_app_id          IN NUMBER,',
'    p_session_id      IN NUMBER',
'  ) RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_param_value (',
'    p_param_id        IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_items_from_param (',
'    p_app_id          IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_comment(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_followup        IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_contact (',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_readers (',
'    p_comment_id      IN NUMBER,',
'    p_user_id         IN NUMBER,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE unsubscribe (',
'    p_value           IN OUT NOCOPY VARCHAR2,',
'    p_user_id         OUT NOCOPY NUMBER,',
'    p_article_id      OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE download_file (',
'    p_file_name       IN VARCHAR2,',
'    p_session_id      IN NUMBER,',
'    p_user_id         IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_email (',
'    p_email           IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_article_page_items (',
'    p_article_id      IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_keywords        OUT NOCOPY VARCHAR2,',
'    p_description     OUT NOCOPY VARCHAR2,',
'    p_author_name     OUT NOCOPY VARCHAR2,',
'    p_twitter_follow  OUT NOCOPY VARCHAR2,',
'    p_rate            OUT NOCOPY NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_category_page_items (',
'    p_category_id     IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_category_name   OUT NOCOPY VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_UTIL";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_UTIL" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  TYPE t_author IS RECORD (',
'    n_author_id     NUMBER(38),',
'    v_author_name   VARCHAR2(80),',
'    v_email         VARCHAR2(120),',
'    v_email_notify  VARCHAR2(1)',
'  );',
'  TYPE t_email  IS RECORD (',
'    v_from          VARCHAR2(120),',
'    v_subj          VARCHAR2(255),',
'    v_body          VARCHAR2(32700)',
'  );',
'  g_cookie_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), 12);',
'  g_watche_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), -1);',
'  g_cookie_name       CONSTANT VARCHAR2(30)   := ''__uid'';',
'  g_cookie_version    CONSTANT VARCHAR2(30)   := ''1.0'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_user_name (',
'    p_user_id IN NUMBER',
'  ) RETURN VARCHAR2',
'  AS',
'    l_user_name VARCHAR2(255);',
'  BEGIN',
'    SELECT nick_name',
'    INTO l_user_name',
'    FROM blog_comment_user',
'    WHERE user_id = p_user_id',
'    ;',
'    RETURN l_user_name;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    VALUE_ERROR OR',
'    INVALID_NUMBER',
'  THEN',
'    apex_debug.warn(''blog_util.get_user_name(p_user_id => %s); error: %s'', COALESCE(to_char(p_user_id), ''NULL''), sqlerrm);',
'    RETURN NULL;',
'  END get_user_name;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_article_author(',
'    p_article_id IN NUMBER',
'  ) RETURN t_author',
'  AS',
'    l_author  t_author;',
'  BEGIN',
'    SELECT u.author_id,',
'      author_name,',
'      email,',
'      email_notify',
'      INTO l_author',
'    FROM blog_author u',
'    WHERE u.active = ''Y''',
'      AND EXISTS(',
'      SELECT 1',
'      FROM blog_v$article a',
'      WHERE a.article_id = p_article_id',
'      AND a.author_id = u.author_id',
'    );',
'    RETURN l_author;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    VALUE_ERROR OR',
'    INVALID_NUMBER',
'  THEN',
'    apex_debug.warn(''blog_util.get_author_record_by_article(p_article_id => %s); error: %s'', coalesce(to_char(p_article_id), ''NULL''), sqlerrm);',
'    RETURN NULL;',
'  END get_article_author;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION raw_to_table(',
'    p_value     IN RAW,',
'    p_separator IN VARCHAR2 DEFAULT '':''',
'  ) RETURN apex_application_global.vc_arr2',
'  AS',
'    l_value VARCHAR2(32700);',
'  BEGIN',
'    l_value := sys.utl_raw.cast_to_varchar2(p_value);',
'    l_value := sys.utl_url.unescape(l_value);',
'    RETURN apex_util.string_to_table(l_value, COALESCE(p_separator, '':''));',
'  END raw_to_table;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_cookie(',
'    p_user_id IN NUMBER',
'  )',
'  AS',
'  BEGIN',
'    sys.owa_util.mime_header(''text/html'', FALSE);',
'    -- The first element in the table is the cookie version',
'    -- The second element in the table is the user id',
'    sys.owa_cookie.send(',
'      name    => blog_util.g_cookie_name,',
'      value   => sys.utl_raw.cast_to_raw(blog_util.g_cookie_version || '':'' || p_user_id),',
'      expires => blog_util.g_cookie_expires',
'    );',
'    --sys.owa_util.http_header_close;',
'  END set_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_cookie',
'  RETURN NUMBER',
'  AS',
'    l_user_id     NUMBER(38,0);',
'    l_cookie_val  VARCHAR2(2000);',
'    l_cookie_vals apex_application_global.vc_arr2;',
'  BEGIN',
'    l_cookie_val := apex_authentication.get_login_username_cookie(blog_util.g_cookie_name);',
'    IF l_cookie_val IS NOT NULL THEN',
'      l_cookie_vals := blog_util.raw_to_table(l_cookie_val);',
'      -- The first element in the table is the cookie version',
'      IF l_cookie_vals(1) = blog_util.g_cookie_version THEN',
'        -- The second element in the table is the user id',
'        l_user_id := to_number(l_cookie_vals(2));',
'      END IF;',
'    END IF;',
'    RETURN l_user_id;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    apex_debug.warn(''blog_util.get_cookie; error: %s'', sqlerrm);',
'    RETURN NULL;',
'  END get_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_email_message (',
'    p_article_title IN VARCHAR2,',
'    p_article_url   IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2,',
'    p_author_name   IN VARCHAR2,',
'    p_subj          IN VARCHAR2,',
'    p_body          IN VARCHAR2',
'  ) RETURN t_email',
'  AS',
'    TYPE tabtype IS TABLE OF VARCHAR2(255) INDEX BY VARCHAR2(40);',
'    l_arr   tabtype;',
'    l_key   VARCHAR2(40);',
'    l_email t_email;',
'  BEGIN',
'    l_email.v_subj            := apex_lang.message(p_subj);',
'    l_email.v_body            := apex_lang.message(p_body);',
'    l_arr(''#BLOG_NAME#'')      := p_blog_name;',
'    l_arr(''#ARTICLE_TITLE#'')  := p_article_title;',
'    l_arr(''#AUTHOR_NAME#'')    := p_author_name;',
'    l_arr(''#ARTICLE_URL#'')    := p_article_url;  ',
'    l_key := l_arr.FIRST;',
'    -- Substitude message',
'    WHILE l_key IS NOT NULL LOOP',
'      l_email.v_subj := regexp_replace( l_email.v_subj, l_key, l_arr(l_key), 1, 0, ''i'' );',
'      l_email.v_body := regexp_replace( l_email.v_body, l_key, l_arr(l_key), 1, 0, ''i'' );',
'      l_key := l_arr.NEXT(l_key);',
'    END LOOP;',
'    /* Get blog email */',
'    l_email.v_from := blog_util.get_param_value(''BLOG_EMAIL'');',
'    --',
'    RETURN l_email;',
'  END get_email_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_article_url(',
'    p_article_id  IN NUMBER,',
'    p_app_alias   IN VARCHAR2,',
'    p_base_url    IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2',
'  AS',
'    l_url VARCHAR2(2000);',
'  BEGIN',
'    l_url := ''f?p='' || p_app_alias || '':READ:0::::ARTICLE:'' || p_article_id;',
'    l_url := apex_util.prepare_url(p_url => l_url, p_checksum_type => ''PUBLIC_BOOKMARK'');',
'    l_url := p_base_url || l_url;',
'    RETURN l_url;',
'  END get_article_url;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_unsubscribe_url (',
'    p_user_id     IN NUMBER,',
'    p_article_id  IN NUMBER,',
'    p_app_alias   IN VARCHAR2,',
'    p_base_url    IN VARCHAR2,',
'    p_page_alias  IN VARCHAR2 DEFAULT ''UNSUBSCRIBE'',',
'    p_session_id  IN NUMBER DEFAULT 0',
'  ) RETURN VARCHAR2',
'  AS',
'    l_url       VARCHAR2(2000);',
'    l_value     VARCHAR2(2000);',
'  BEGIN',
'    l_value := sys.utl_raw.cast_to_raw(p_user_id || '':'' || p_article_id);',
'    l_url   := ''f?p='' || p_app_alias || '':UNSUBSCRIBE:'' || p_session_id || ''::::SUBSCRIBER_ID:'' || l_value;',
'    l_url   := apex_util.prepare_url(p_url => l_url, p_checksum_type => ''PUBLIC_BOOKMARK'');',
'    l_url   := p_base_url || l_url;',
'    RETURN l_url;',
'  END get_unsubscribe_url;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_user_attr(',
'    p_user_id     OUT NOCOPY NUMBER,',
'    p_email       IN VARCHAR2,',
'    p_nick_name   IN VARCHAR2,',
'    p_website     IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    BEGIN',
'      INSERT INTO blog_comment_user (email, nick_name, website)',
'        VALUES (p_email, p_nick_name, p_website)',
'      RETURNING user_id INTO p_user_id',
'      ;',
'    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN',
'      UPDATE blog_comment_user',
'        SET nick_name = p_nick_name,',
'          website = p_website',
'        WHERE email = p_email',
'      RETURNING user_id INTO p_user_id',
'      ;',
'    END;',
'  END save_user_attr;',
'-----------------------------------------------------------------------'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39888428900552479804)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'---------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_notify_user (',
'    p_user_id         IN NUMBER,',
'    p_article_id      IN NUMBER,',
'    p_followup        IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    MERGE INTO blog_comment_notify a',
'    USING (',
'      SELECT p_user_id AS user_id,',
'        p_article_id AS article_id,',
'        p_followup  AS followup_notify',
'      FROM DUAL',
'    ) b',
'    ON (a.user_id = b.user_id AND a.article_id = b.article_id)',
'    WHEN MATCHED THEN',
'      UPDATE SET a.followup_notify = b.followup_notify',
'    WHEN NOT MATCHED THEN',
'      INSERT (user_id, article_id, followup_notify)',
'      VALUES (b.user_id, b.article_id, b.followup_notify)',
'    ;',
'  END save_notify_user;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_author (',
'    p_article_title IN VARCHAR2,',
'    p_article_url   IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2,',
'    p_author_name   IN VARCHAR2,',
'    p_author_email  IN VARCHAR2',
'  )',
'  AS',
'    l_email t_email;',
'  BEGIN',
'    /* Get email subject and body to variable */',
'    l_email := blog_util.get_email_message(',
'      p_article_title => p_article_title,',
'      p_article_url   => p_article_url,',
'      p_blog_name     => p_blog_name,',
'      p_author_name   => p_author_name,',
'      p_subj          => ''NEW_COMMENT_EMAIL_SUBJ'',',
'      p_body          => ''NEW_COMMENT_EMAIL_BODY''',
'    );',
'    /* Send mail to author */',
'    apex_mail.send (',
'      p_from => l_email.v_from,',
'      p_to   => p_author_email,',
'      p_subj => l_email.v_subj,',
'      p_body => l_email.v_body',
'    );',
'    /* we do have time wait email sending */',
'    --APEX_MAIL.PUSH_QUEUE;',
'  END notify_author;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE raise_http_error(',
'    p_id          IN VARCHAR2,',
'    p_error_code  IN NUMBER DEFAULT 404,',
'    p_reason      IN VARCHAR2 DEFAULT ''Not Found''',
'  )',
'  AS',
'  BEGIN',
'    apex_debug.warn(''HTTP %s %s id: %s'', p_error_code, p_reason, coalesce(p_id, ''(NULL)''));',
'    sys.owa_util.status_line(',
'      nstatus       => p_error_code,',
'      creason       => p_reason,',
'      bclose_header => true',
'    );',
'    apex_application.stop_apex_engine;',
'  END raise_http_error;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE check_http410(',
'    p_id  IN VARCHAR2',
'  )',
'  AS',
'    l_count PLS_INTEGER;',
'  BEGIN',
'    SELECT COUNT(1)',
'    INTO l_count',
'    FROM blog_http410 c',
'    WHERE c.deleted_id = p_id',
'    ;',
'    blog_util.raise_http_error(p_id, 410, ''Gone'');',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    blog_util.raise_http_error(p_id);',
'  END check_http410;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global functions and procedures',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION init_session (',
'    p_app_id      IN NUMBER,',
'    p_session_id  IN NUMBER',
'  ) RETURN NUMBER',
'  AS',
'    l_user_id     NUMBER(38);',
'    l_user_name   VARCHAR2(255);',
'  BEGIN',
'    blog_util.set_items_from_param(p_app_id);',
'    l_user_id := blog_util.get_cookie;',
'    IF l_user_id IS NOT NULL THEN',
'      l_user_name := blog_util.get_user_name(l_user_id);',
'      IF l_user_name IS NOT NULL THEN',
'        /* Set APP_USER */',
'        apex_custom_auth.set_user(upper(l_user_name));',
'      ELSE',
'        l_user_id := NULL;',
'      END IF;',
'    END IF;',
'    IF apex_authorization.is_authorized(''LOGGING_ENABLED'') THEN',
'      blog_log.write_activity_log(',
'        p_user_id       => l_user_id,',
'        p_session_id    => p_session_id,',
'        p_ip_address    => sys.owa_util.get_cgi_env(''REMOTE_ADDR''),',
'        p_user_agent    => sys.owa_util.get_cgi_env(''HTTP_USER_AGENT''),',
'        p_referer       => sys.owa_util.get_cgi_env(''HTTP_REFERER''),',
'        p_activity_type => ''NEW_SESSION''',
'      );',
'    END IF;',
'    RETURN l_user_id;',
'  END init_session;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_param_value(',
'    p_param_id IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_value VARCHAR2(4000);',
'  BEGIN',
'    SELECT param_value',
'    INTO l_value',
'    FROM blog_param',
'    WHERE param_id = p_param_id',
'    ;',
'    RETURN l_value;',
'  END get_param_value;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_items_from_param(',
'    p_app_id IN NUMBER',
'  ) AS',
'  --PRAGMA AUTONOMOUS_TRANSACTION;',
'  BEGIN',
'    FOR c1 IN (',
'      SELECT',
'        p.param_id,',
'        p.param_value',
'      FROM blog_param p',
'      WHERE p.param_value IS NOT NULL',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_param_app a',
'          WHERE a.application_id = p_app_id',
'          AND a.param_id = p.param_id',
'        )',
'    ) LOOP',
'      apex_util.set_session_state(c1.param_id, c1.param_value);',
'    END LOOP;',
'  END set_items_from_param;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_comment(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_app_alias       IN VARCHAR2,',
'    p_base_url        IN VARCHAR2,',
'    p_blog_name       IN VARCHAR2,',
'    p_article_id      IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_followup        IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  )',
'  AS',
'    l_article_url VARCHAR2(4000);',
'    l_comment_id  NUMBER(38);',
'    l_publish     VARCHAR2(1) := ''N'';',
'    l_author      t_author;',
'  BEGIN',
'    /* Set APP_USER */',
'    apex_custom_auth.set_user(upper(p_nick_name));',
'    --',
'    /* Insert or update user */',
'    blog_util.save_user_attr(',
'      p_user_id     => p_user_id,',
'      p_email       => p_email,',
'      p_nick_name   => p_nick_name,',
'      p_website     => p_website',
'    );',
'    /* Save should user be notified when new comment is posted */',
'    blog_util.save_notify_user(',
'      p_user_id     => p_user_id,',
'      p_article_id  => p_article_id,',
'      p_followup    => p_followup',
'    );',
'    /* Set user id to cookie */',
'    blog_util.set_cookie(p_user_id);',
'    --',
'    /* Should author moderate comment before it is published */',
'    IF NOT apex_authorization.is_authorized(''MODERATION_ENABLED'') THEN',
'      l_publish := ''Y'';',
'    END IF;',
'    --',
'    /* Inser comment to table */',
'    INSERT INTO blog_comment',
'    (user_id, apex_session_id, article_id, comment_text, moderated)',
'    VALUES',
'    (p_user_id, p_apex_session_id, p_article_id, p_comment , l_publish)',
'    RETURNING comment_id INTO l_comment_id',
'    ;',
'    --',
'    /* Update user id to activity log */',
'    UPDATE blog_activity_log',
'    SET user_id = p_user_id',
'    WHERE apex_session_id = p_apex_session_id',
'      AND user_id IS NULL',
'    ;',
'    --',
'    /* Send email about new comment to readers */',
'    IF apex_authorization.is_authorized(''NOTIFICATION_EMAIL_ENABLED'') THEN',
'      IF l_publish = ''Y'' THEN',
'        blog_util.notify_readers (',
'          p_comment_id    => l_comment_id,',
'          p_user_id       => p_user_id,',
'          p_article_id    => p_article_id,',
'          p_article_title => p_article_title,',
'          p_app_alias     => p_app_alias,',
'          p_base_url      => p_base_url,',
'          p_blog_name     => p_blog_name',
'        );',
'      END IF;',
'    --',
'      /* Get author details for notification emails */',
'      l_author := blog_util.get_article_author(p_article_id);',
'      --',
'      /* Send email about new comment to author */',
'      /* If we have author email and author is active and like have notifications */',
'      IF  l_author.v_email IS NOT NULL AND l_author.v_email_notify = ''Y''',
'      THEN',
'        /* Get article url */',
'        l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);',
'        --',
'        blog_util.notify_author (',
'          p_article_title => p_article_title,',
'          p_article_url   => l_article_url,',
'          p_blog_name     => p_blog_name,',
'          p_author_name   => l_author.v_author_name,',
'          p_author_email  => l_author.v_email',
'        );',
'      END IF;',
'    END IF;',
'    /* Refresh comment log */',
'    dbms_mview.refresh(''BLOG_COMMENT_LOG'');',
'  END save_comment;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_contact(',
'    p_user_id         IN OUT NOCOPY NUMBER,',
'    p_apex_session_id IN NUMBER,',
'    p_email           IN VARCHAR2,',
'    p_nick_name       IN VARCHAR2,',
'    p_website         IN VARCHAR2,',
'    p_comment         IN VARCHAR2',
'  )',
'  AS',
'  BEGIN',
'    /* Set APP_USER */',
'    apex_custom_auth.set_user(upper(p_nick_name));',
'    /* Insert or update user */',
'    blog_util.save_user_attr(',
'      p_user_id     => p_user_id,',
'      p_email       => p_email,',
'      p_nick_name   => p_nick_name,',
'      p_website     => p_website',
'    );',
'    /* Inser message to table */',
'    INSERT INTO blog_contact_message',
'    (user_id, apex_session_id, message)',
'    VALUES',
'    (p_user_id, p_apex_session_id, p_comment)',
'    ;',
'     /* Set user id to cookie */',
'    blog_util.set_cookie(p_user_id);',
'  END save_contact;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE notify_readers (',
'    p_comment_id    IN NUMBER,',
'    p_user_id       IN NUMBER,',
'    p_article_id    IN NUMBER,',
'    p_article_title IN VARCHAR2,',
'    p_app_alias     IN VARCHAR2,',
'    p_base_url      IN VARCHAR2,',
'    p_blog_name     IN VARCHAR2',
'  )',
'  AS',
'    l_article_url     VARCHAR2(2000);',
'    l_unsubscribe_url VARCHAR2(2000);',
'    l_user_email      t_email;',
'    l_email           t_email;',
'  BEGIN',
'    /* Get article url */',
'    l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);',
'    /* Get email subject and body to variables */',
'    l_email := blog_util.get_email_message(',
'      p_article_title => p_article_title,',
'      p_article_url   => l_article_url,',
'      p_blog_name     => p_blog_name,',
'      p_author_name   => ''#AUTHOR_NAME#'',',
'      p_subj          => ''FOLLOWUP_EMAIL_SUBJ'',',
'      p_body          => ''FOLLOWUP_EMAIL_BODY''',
'    );',
'    /* Loop trough all users that like have notification */',
'    FOR c1 IN (',
'      SELECT email,',
'        nick_name,',
'        user_id',
'      FROM blog_comment_user u',
'      WHERE u.user_id != p_user_id',
'        AND u.blocked = ''N''',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_comment_notify n',
'          WHERE n.user_id = u.user_id',
'          AND n.article_id = p_article_id',
'          AND n.followup_notify = ''Y''',
'          AND n.changed_on > g_watche_expires',
'        )',
'        AND EXISTS(',
'          SELECT 1',
'          FROM blog_comment c',
'          WHERE c.article_id = p_article_id',
'          AND c.comment_id = p_comment_id',
'          AND c.active = ''Y''',
'          AND c.moderated = ''Y''',
'          AND c.notify_email_sent = ''N''',
'        )',
'    ) LOOP',
'      /* User specific unsubscribe url */',
'      l_unsubscribe_url := blog_util.get_unsubscribe_url(',
'        p_user_id     => c1.user_id,',
'        p_article_id  => p_article_id,',
'        p_app_alias   => p_app_alias,',
'        p_base_url    => p_base_url',
'      );',
'      /* Make user specific substitutions */',
'      l_user_email.v_subj := regexp_replace(l_email.v_subj, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');',
'      l_user_email.v_body := regexp_replace(l_email.v_body, ''#NICK_NAME#'', c1.nick_name, 1, 0, ''i'');',
'      l_user_email.v_body := regexp_replace(l_user_email.v_body, ''#UNSUBSCRIBE_URL#'', l_unsubscribe_url, 1, 0, ''i'');',
'      /* Send mail to user */',
'      apex_mail.send (',
'        p_from => l_email.v_from,',
'        p_to   => c1.email,',
'        p_subj => l_user_email.v_subj,',
'        p_body => l_user_email.v_body',
'      );',
'    END LOOP;',
'    /* we do have time wait email sending */',
'    --APEX_MAIL.PUSH_QUEUE;',
'    UPDATE blog_comment',
'      SET notify_email_sent = ''Y''',
'    WHERE comment_id = p_comment_id',
'      AND active = ''Y''',
'      AND moderated = ''Y''',
'      AND notify_email_sent = ''N''',
'    ;',
'  END notify_readers;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE unsubscribe(',
'    p_value       IN OUT NOCOPY VARCHAR2,',
'    p_user_id     OUT NOCOPY NUMBER,',
'    p_article_id  OUT NOCOPY NUMBER',
'  )',
'  AS',
'    l_user_name VARCHAR2(255);',
'    l_arr       apex_application_global.vc_arr2;',
'  BEGIN',
'    l_arr         := blog_util.raw_to_table(p_value);',
'    p_value       := NULL;',
'    p_user_id     := l_arr(1);',
'    p_article_id  := l_arr(2);',
'    IF p_user_id IS NOT NULL THEN',
'      l_user_name := blog_util.get_user_name(p_user_id);',
'    END IF;',
'    IF p_user_id IS NOT NULL',
'    AND l_user_name IS NOT NULL',
'    AND p_article_id IS NOT NULL',
'    THEN',
'      /* Set APP_USER */',
'      apex_custom_auth.set_user(upper(l_user_name));',
'      blog_util.save_notify_user(',
'        p_user_id    => p_user_id,',
'        p_article_id => p_article_id,',
'        p_followup   => ''N''',
'      );',
'    ELSE',
'      blog_util.raise_http_error(p_value);',
'    END IF;',
'  EXCEPTION WHEN',
'    NO_DATA_FOUND OR',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_value);',
'  END unsubscribe;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE download_file (',
'    p_file_name   IN VARCHAR2,',
'    p_session_id  IN NUMBER,',
'    p_user_id     IN VARCHAR2',
'  )',
'  AS',
'    l_file_name       VARCHAR2(2000);',
'    l_utc             TIMESTAMP;',
'    l_file_cached     BOOLEAN;',
'    l_file_rowtype    blog_file%ROWTYPE;',
'    l_arr             apex_application_global.vc_arr2;',
'    c_date_lang       CONSTANT VARCHAR2(255) := ''NLS_DATE_LANGUAGE=ENGLISH'';',
'    c_date_format     CONSTANT VARCHAR2(255) := ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'';',
'    --SESSION_NOT_VALID EXCEPTION;',
'    FILE_NOT_ACTIVE   EXCEPTION;',
'    --PRAGMA EXCEPTION_INIT(SESSION_NOT_VALID, -20001);',
'    PRAGMA EXCEPTION_INIT(FILE_NOT_ACTIVE, -20002);',
'  BEGIN',
'    /*',
'    IF NOT apex_custom_auth.is_session_valid THEN',
'      apex_debug.warn(''File download session is not valid: %s'', p_session_id);',
'      raise_application_error(-20001, ''Unauthorized access - file will not be retrieved.'');',
'    END IF;',
'    */',
'	',
'	sys.htp.flush;',
'	sys.htp.init;',
'	',
'    l_file_cached := FALSE;',
'    l_arr := apex_util.string_to_table(p_file_name, ''?'');',
'    l_file_name := l_arr(1);',
'    l_utc := SYS_EXTRACT_UTC(SYSTIMESTAMP);',
'    SELECT *',
'    INTO l_file_rowtype',
'    FROM blog_file',
'    WHERE file_name = l_file_name',
'    ;',
'    IF NOT l_file_rowtype.active = ''Y'' THEN',
'      raise_application_error(-20002, ''File is not available for download.'');',
'    END IF;',
'    sys.owa_util.mime_header(COALESCE (l_file_rowtype.mime_type, ''application/octet''), FALSE);',
'    IF l_file_rowtype.file_type != ''FILE'' THEN',
'      /* File type is not FILE, then use cache e.g. for images, css and JavaScript */',
'      /* Cache and ETag headers */',
'      sys.htp.p(''Cache-Control: public, max-age=31536000'');',
'      sys.htp.p(''Date: ''    || to_char(l_utc, c_date_format, c_date_lang));',
'      sys.htp.p(''Expires: '' || to_char(l_utc + 365, c_date_format, c_date_lang));',
'      sys.htp.p(''ETag: "''   || l_file_rowtype.file_etag || ''"'');',
'      /* Check if file is modified after last download */',
'      IF sys.owa_util.get_cgi_env(''HTTP_IF_MODIFIED_SINCE'') = l_file_rowtype.file_modified_since',
'      OR sys.owa_util.get_cgi_env(''HTTP_IF_NONE_MATCH'')  = l_file_rowtype.file_etag',
'      THEN',
'        sys.owa_util.status_line(',
'          nstatus       => 304,',
'          creason       => ''Not Modified'',',
'          bclose_header => FALSE',
'        );',
'        l_file_cached := TRUE;',
'      ELSE',
'        sys.htp.p(''Last-Modified : '' || l_file_rowtype.file_modified_since);',
'      END IF;',
'    ELSE',
'      IF apex_authorization.is_authorized(''LOGGING_ENABLED'') THEN',
'        /* Log file download */',
'        blog_log.write_file_log(l_file_rowtype.file_id);',
'        blog_log.write_activity_log(',
'          p_user_id       => p_user_id,',
'          p_session_id    => p_session_id,',
'          p_activity_type => ''DOWNLOAD'',',
'          p_related_id    => l_file_rowtype.file_id',
'        );',
'      END IF;',
'      sys.htp.p(''Content-Disposition: attachment; filename="'' || l_file_rowtype.file_name || ''"'');',
'    END IF;',
'    IF NOT l_file_cached THEN',
'      sys.htp.p(''Content-length: '' || l_file_rowtype.file_size);',
'      sys.wpg_docload.download_file(l_file_rowtype.blob_content);',
'    END IF;',
'    sys.owa_util.http_header_close;',
'    apex_application.stop_apex_engine;',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(l_file_name);',
'  WHEN',
'    VALUE_ERROR OR',
'    INVALID_NUMBER OR',
'    FILE_NOT_ACTIVE',
'  THEN',
'    blog_util.raise_http_error(l_file_name);',
'  END download_file;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_email(',
'    p_email     IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    l_is_valid    BOOLEAN := TRUE;',
'    l_dot_pos     SIMPLE_INTEGER := 0;',
'    l_at_pos      SIMPLE_INTEGER := 0;',
'    l_str_length  SIMPLE_INTEGER := 0;',
'  BEGIN',
'    IF p_email IS NOT NULL THEN',
'      l_dot_pos     := instr(p_email ,''.'');',
'      l_at_pos      := instr(p_email ,''@'');',
'      l_str_length  := LENGTH(p_email);',
'      IF (',
'        (l_dot_pos = 0)',
'        OR (l_at_pos = 0)',
'        --OR (l_dot_pos = l_at_pos - 1)',
'        OR (l_dot_pos = l_at_pos + 1)',
'        OR (l_at_pos = 1)',
'        OR (l_at_pos = l_str_length)',
'        OR (l_dot_pos = l_str_length)',
'        OR (l_str_length > 256)',
'      )',
'      THEN',
'        l_is_valid := FALSE;',
'      END IF;',
'      IF l_is_valid THEN',
'        l_is_valid := NOT instr(substr(p_email ,l_at_pos) ,''.'') = 0;',
'      END IF;',
'    END IF;',
'    RETURN l_is_valid;',
'  END validate_email;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_article_page_items (',
'    p_article_id      IN VARCHAR2,',
'    p_page_title      OUT NOCOPY VARCHAR2,',
'    p_region_title    OUT NOCOPY VARCHAR2,',
'    p_keywords        OUT NOCOPY VARCHAR2,',
'    p_description     OUT NOCOPY VARCHAR2,',
'    p_author_name     OUT NOCOPY VARCHAR2,',
'    p_twitter_follow  OUT NOCOPY VARCHAR2,',
'    p_rate            OUT NOCOPY NUMBER    ',
'  ) ',
'  AS',
'    l_article_id    NUMBER;',
'    l_category_name VARCHAR2(256);',
'  BEGIN',
'    /* Input parameter p_category_id is string because we handle invalid number exception */',
'    l_article_id := to_number(p_article_id);',
'    SELECT a.article_title,',
'      a.category_name,',
'      a.keywords,',
'      a.description,',
'      a.author_name,',
'      a.author_twitter,',
'      l.article_rate_int',
'    INTO p_page_title,',
'      l_category_name,',
'      p_keywords,',
'      p_description,',
'      p_author_name,',
'      p_twitter_follow,',
'      p_rate',
'    FROM blog_v$article a',
'    LEFT JOIN blog_article_log l',
'    ON a.article_id = l.article_id',
'    WHERE a.article_id = l_article_id',
'    ;',
'    p_region_title  := apex_lang.message(''REGION_TITLE_COMMENTS'');',
'    p_keywords      := ltrim(trim(BOTH '','' FROM p_keywords) || '','' || l_category_name, '','');',
'    p_rate          := coalesce(p_rate, 0);',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(p_article_id);',
'  WHEN',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_article_id);',
'  END get_article_page_items;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_category_page_items (',
'    p_category_id   IN VARCHAR2,',
'    p_page_title    OUT NOCOPY VARCHAR2,',
'    p_region_title  OUT NOCOPY VARCHAR2,',
'    p_category_name OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_category_id NUMBER;',
'  BEGIN',
'    /* Input parameter p_category_id is string because we handle invalid number exception */',
'    l_category_id := to_number(p_category_id);',
'    SELECT c.category_name',
'    INTO p_category_name',
'    FROM blog_category c',
'    WHERE c.category_id = l_category_id',
'    ;',
'    p_page_title    := apex_lang.message(''PAGE_TITLE_CATEGORY'', p_category_name);',
'    p_region_title  := apex_lang.message(''REGION_TITLE_CATEGORY'', apex_escape.html(p_category_name));',
'    p_category_name := p_category_name;',
'  EXCEPTION WHEN ',
'    NO_DATA_FOUND',
'  THEN',
'    check_http410(p_category_id);',
'  WHEN',
'    INVALID_NUMBER OR',
'    VALUE_ERROR',
'  THEN',
'    blog_util.raise_http_error(p_category_id);',
'  END get_category_page_items;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_UTIL";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_PLUGIN" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'  g_formatted_comment VARCHAR2(32700);',
'  g_question_answer   PLS_INTEGER;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_comment_textarea(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION validate_comment_textarea(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION feature_authorization (',
'    p_authorization in apex_plugin.t_authorization,',
'    p_plugin        in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_authorization_exec_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_math_question_field(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION ajax_math_question_field(',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_page_item_ajax_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_math_question_field(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_simple_star_rating (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_modal_confirm(',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_dynamic_action_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_plus_one_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_share_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_facebook_like_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'  FUNCTION render_twitter_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result;',
'-------------------------------------------------------------------------------',
'END "BLOG_PLUGIN";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_PLUGIN" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  g_whitelist_tags        CONSTANT VARCHAR2(200)  := ''<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>'';',
'  g_code_open             CONSTANT VARCHAR2(30)   := ''<code>'';',
'  g_code_close            CONSTANT VARCHAR2(30)   := ''</code>'';',
'  g_syntaxhighlight_open  CONSTANT VARCHAR2(100)  := ''<pre class="brush:plain" style="background-color:#eeeeee;padding:2px;">'';',
'  g_syntaxhighlight_close CONSTANT VARCHAR2(30)   := ''</pre>'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION format_comment(',
'    p_comment         IN VARCHAR2,',
'    p_whitelist_tags  IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_comment               VARCHAR2(32700);',
'    l_temp                  VARCHAR2(32700);',
'    l_len_s                 NUMBER := 0;',
'    l_len_e                 NUMBER := 0;',
'    l_count_open            SIMPLE_INTEGER := 0;',
'    l_count_close           SIMPLE_INTEGER := 0;',
'    l_start                 SIMPLE_INTEGER := 0;',
'    l_end                   SIMPLE_INTEGER := 0;',
'    l_comment_arr           apex_application_global.vc_arr2;',
'    l_code_arr              apex_application_global.vc_arr2;',
'  BEGIN',
'    l_len_s := LENGTH(g_code_open);',
'    l_len_e := LENGTH(g_code_close);',
'    /* Change all hash marks so we can escape those later*/',
'    l_comment := REPLACE(p_comment, ''#'', ''$@#HASH#@$'');',
'    /* escape comment html */',
'    l_comment := APEX_ESCAPE.HTML_WHITELIST (',
'      p_html            => l_comment,',
'      p_whitelist_tags  => p_whitelist_tags',
'    );',
'    /* Escape hash to e.g. prevent APEX substitutions */',
'    l_comment := REPLACE(l_comment, ''$@#HASH#@$'', ''&#x23;'');',
'    /* check code tag count */',
'    l_count_open  := regexp_count(l_comment, g_code_open);',
'    l_count_close := regexp_count(l_comment, g_code_close);',
'    /* Process code tags */',
'    IF l_count_open = l_count_close THEN',
'      /* Store text inside code tags to array while format rest of message*/',
'      FOR i IN 1 .. l_count_open',
'      LOOP',
'        l_start       := INSTR(l_comment, g_code_open);',
'        l_end         := INSTR(l_comment, g_code_close);',
'        l_code_arr(i) := g_syntaxhighlight_open',
'                      || SUBSTR(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)',
'                      || g_syntaxhighlight_close;',
'        l_comment     := SUBSTR(l_comment, 1, l_start -1)',
'                      || chr(10)',
'                      || ''$@#'' || i || ''#@$''',
'                      || chr(10)',
'                      || SUBSTR(l_comment, l_end + l_len_e);',
'      END LOOP;',
'      /* Format message */',
'      l_comment_arr := APEX_UTIL.STRING_TO_TABLE(l_comment, chr(10));',
'      l_comment := NULL;',
'      FOR i IN 1 .. l_comment_arr.COUNT',
'      LOOP',
'        /* Remove empty lines and do not add extra tags for code */',
'        l_temp := TRIM(l_comment_arr(i));',
'        IF REGEXP_LIKE(l_temp, ''^\$\@\#[0-9]+\#\@\$$'') THEN',
'          l_comment := l_comment || l_temp;',
'        ELSIF l_temp IS NOT NULL THEN',
'          l_comment := l_comment || ''<p>'' || l_temp || ''</p>'';',
'        END IF;',
'      END LOOP;',
'      /* insert code tags back to comment */',
'      FOR i IN 1 .. l_code_arr.COUNT',
'      LOOP',
'        l_comment := REPLACE(l_comment, ''$@#'' || i || ''#@$'', l_code_arr(i));',
'      END LOOP;',
'    END IF;',
'    RETURN l_comment;',
'  END format_comment;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_comment_textarea(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) '))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39888428900552479804)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    l_name        VARCHAR2(30);',
'    l_code        VARCHAR2(30);',
'    l_bold        VARCHAR2(30);',
'    l_italics     VARCHAR2(30);',
'    l_underline   VARCHAR2(30);',
'    l_styles      VARCHAR2(255);',
'    l_formatting  VARCHAR2(10);',
'    l_result      apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');',
'    IF p_is_readonly OR p_is_printer_friendly THEN',
'      -- emit hidden textarea if necessary',
'      apex_plugin_util.print_hidden_if_readonly (',
'        p_item_name => p_item.name,',
'        p_value => p_value,',
'        p_is_readonly => p_is_readonly,',
'        p_is_printer_friendly => p_is_printer_friendly',
'      );',
'      -- emit display span with the value',
'      apex_plugin_util.print_display_only (',
'        p_item_name => p_item.name,',
'        p_display_value => p_value,',
'        p_show_line_breaks => false,',
'        p_escape => true,',
'        p_attributes => p_item.element_attributes',
'      );',
'    ELSE',
'      -- Because the page item saves state, we have to call get_input_name_for_page_item',
'      -- which generates the internal hidden p_arg_names textarea. It will also RETURN the',
'      -- HTML textarea name which we have to use when we render the HTML input textarea.',
'      l_name := apex_plugin.get_input_name_for_page_item(false);',
'      ',
'      l_code      := apex_lang.lang(''Code'');',
'      l_bold      := apex_lang.lang(''Bold'');',
'      l_italics   := apex_lang.lang(''Italics'');',
'      l_underline := apex_lang.lang(''Underline'');',
'      IF l_formatting = ''Y'' THEN',
'        sys.htp.p(''<ul class="format-btn">'');',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''b'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_bold  || ''" ''',
'          || ''title="'' || l_bold  || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-bold-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''i'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_italics ||''" ''',
'          || ''title="'' || l_italics ||''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-italics-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''u'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_underline || ''" ''',
'          || ''title="'' || l_underline || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[text-underline-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(',
'          q''[<li><img onclick="addStyleTag(''code'','']'' || p_item.name || q''['');" ]''',
'          || ''alt="'' || l_code  || '' " ''',
'          || ''title="'' || l_code  || ''" ''',
'          || ''src="'' || p_plugin.file_prefix || q''[code-20x22.png" /></li>]''',
'        );',
'        sys.htp.p(''</ul>'');',
'        sys.htp.p(',
'          ''<div>''',
'          || APEX_ESCAPE.HTML (apex_lang.message(''MSG_ALLOWED_HTML_TAGS''))',
'          || ''</div>''',
'        );',
'      END IF;',
'      sys.htp.prn(''<textarea ''',
'        || apex_plugin_util.get_element_attributes(p_item, l_name, ''textarea'')',
'        || ''cols="'' || p_item.element_width ||''" ''',
'        || ''rows="'' || p_item.element_height ||''" ''',
'        || ''maxlength="'' || p_item.element_max_length || ''">''',
'      );',
'      apex_plugin_util.print_escaped_value(p_value);',
'      sys.htp.p(''</textarea>'');',
'      -- Tell APEX that this textarea is navigable',
'      l_result.is_navigable := true;',
'    END IF;',
'    RETURN l_result;',
'  END render_comment_textarea;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_comment_textarea(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result',
'  AS',
'    l_formatting  VARCHAR2(10);',
'    l_tmp_item    VARCHAR2(30);',
'    l_comment     XMLTYPE;',
'    l_is_valid    BOOLEAN;',
'    l_result      apex_plugin.t_page_item_validation_result;',
'    xml_parse_err EXCEPTION;',
'    PRAGMA EXCEPTION_INIT (xml_parse_err , -31011);',
'  BEGIN',
'    l_formatting := COALESCE(p_item.attribute_01, ''Y'');',
'    l_tmp_item := p_item.attribute_02;',
'    blog_plugin.g_formatted_comment := p_value;',
'    /* Remove some ascii codes */',
'    FOR i IN 0 .. 31',
'    LOOP',
'      IF i != 10 THEN',
'        blog_plugin.g_formatted_comment := TRIM(REPLACE(blog_plugin.g_formatted_comment, chr(i)));',
'      END IF;',
'    END LOOP;',
'    IF blog_plugin.g_formatted_comment IS NULL THEN',
'      RETURN NULL;',
'    END IF;',
'    IF LENGTH(blog_plugin.g_formatted_comment) >= p_item.element_max_length THEN',
'      l_is_valid := FALSE;',
'      l_result.message := apex_lang.message(''VALIDATION_COMMENT_LENGTH'', p_item.plain_label, p_item.element_max_length);',
'    ELSE',
'      l_is_valid := TRUE;',
'    END IF;',
'    IF l_is_valid THEN',
'      /* Format value */',
'      IF l_formatting = ''Y'' THEN',
'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, g_whitelist_tags);',
'      ELSE',
'        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, NULL);',
'      END IF;',
'      /* Validate value html tags */',
'      BEGIN',
'        l_comment := xmlType.createXML(',
'            ''<root><row>'' ',
'          || blog_plugin.g_formatted_comment',
'          || ''</row></root>''',
'        );',
'      EXCEPTION',
'      WHEN xml_parse_err THEN',
'        l_is_valid := FALSE;',
'        apex_debug.error(''%s : %s'', sys.dbms_utility.format_error_backtrace, sqlerrm);',
'      WHEN OTHERS THEN',
'        apex_debug.error(''%s : %s'', sys.dbms_utility.format_error_backtrace, sqlerrm);',
'        l_is_valid := FALSE;',
'      END;',
'      IF NOT l_is_valid THEN',
'        l_is_valid := FALSE;',
'        l_result.message := apex_lang.message(''VALIDATION_COMMENT_FORMAT'', p_item.plain_label);',
'      END IF;',
'    END IF;',
'    RETURN l_result;',
'  END validate_comment_textarea;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION feature_authorization (',
'    p_authorization in apex_plugin.t_authorization,',
'    p_plugin        in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_authorization_exec_result',
'  AS',
'    l_count         NUMBER;',
'    l_feature_name  VARCHAR(100);',
'    l_result        apex_plugin.t_authorization_exec_result; -- result object to RETURN',
'  BEGIN',
'    l_feature_name := p_authorization.attribute_01;',
'    SELECT COUNT(1)',
'    INTO l_count',
'    FROM blog_param c',
'    LEFT JOIN blog_param p ON c.param_parent = p.param_id',
'    WHERE c.param_id = l_feature_name',
'      AND c.param_value = ''Y'' ',
'      AND CASE WHEN p.param_type = ''YESNO''',
'      THEN p.param_value ELSE ''Y'' END = ''Y''',
'    ;',
'    l_result.is_authorized := l_count > 0;',
'    RETURN l_result;',
'END feature_authorization;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_math_question_field(',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    l_name        VARCHAR2(30);',
'    l_answer_item VARCHAR2(30);',
'    l_result      apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    l_name        := apex_plugin.get_input_name_for_page_item(false);',
'    l_answer_item := p_item.attribute_01;',
'    ',
'    IF p_is_readonly OR p_is_printer_friendly THEN',
'      -- emit hidden textarea if necessary',
'      apex_plugin_util.print_hidden_if_readonly (',
'        p_item_name => p_item.name,',
'        p_value => p_value,',
'        p_is_readonly => p_is_readonly,',
'        p_is_printer_friendly => p_is_printer_friendly',
'      );',
'      -- emit display span with the value',
'      apex_plugin_util.print_display_only (',
'        p_item_name => p_item.name,',
'        p_display_value => p_value,',
'        p_show_line_breaks => false,',
'        p_escape => true,',
'        p_attributes => p_item.element_attributes',
'      );',
'    ELSE',
'      sys.htp.p(''<input type="text" ''',
'        || ''size="'' || p_item.element_width ||''" ''',
'        || ''maxlength="'' || p_item.element_max_length || ''" ''',
'        || apex_plugin_util.get_element_attributes(p_item, l_name, ''text_field'')',
'        || ''value="" />''',
'      );',
'      apex_javascript.add_onload_code (',
'        p_code => ''apex.server.plugin("'' || apex_plugin.get_ajax_identifier || ''",{},{''',
'        || ''dataType:"html",''',
'        || ''success:function(data){''',
'        || ''$("''',
'        || apex_plugin_util.page_item_names_to_jquery(p_item.name) ',
'        || ''").before(data).siblings("label,br").remove()}''',
'        || ''});''',
'      );',
'      -- Tell APEX that this textarea is navigable',
'      l_result.is_navigable := true;',
'    END IF;',
'    RETURN l_result;',
'  END render_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION ajax_math_question_field(',
'    p_item   in apex_plugin.t_page_item,',
'    p_plugin in apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_page_item_ajax_result',
'  AS',
'    l_tmp         VARCHAR2(255);',
'    l_answer_item VARCHAR2(30);',
'    l_min_1       PLS_INTEGER := 1;',
'    l_max_1       PLS_INTEGER := 1;',
'    l_min_2       PLS_INTEGER := 1;',
'    l_max_2       PLS_INTEGER := 1;',
'    l_arr         apex_application_global.vc_arr2;',
'    l_result      apex_plugin.t_page_item_ajax_result;',
'  BEGIN',
'    l_answer_item := p_item.attribute_01;',
'    l_min_1       := p_item.attribute_02;',
'    l_max_1       := p_item.attribute_03;',
'    l_min_2       := p_item.attribute_04;',
'    l_max_2       := p_item.attribute_05;',
'    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_1, l_max_1));',
'    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_2, l_max_2));',
'    FOR n IN 1 .. 2',
'    LOOP',
'      l_arr(n) := ROUND(sys.dbms_random.VALUE(1, 40));',
'      FOR i IN 1 .. LENGTH(l_arr(n))',
'      LOOP',
'        l_tmp := l_tmp || ''&#'' || ASCII(SUBSTR(l_arr(n), i, 1));',
'      END LOOP;',
'      IF n = 1 THEN',
'        l_tmp := l_tmp || ''&nbsp;&#'' || ASCII(''+'') || ''&nbsp;'';',
'      END IF;',
'    END LOOP;',
'    -- Write header for the output.',
'    sys.owa_util.mime_header(''text/html'', false);',
'    sys.htp.p(''Cache-Control: no-cache'');',
'    sys.htp.p(''Pragma: no-cache'');',
'    --sys.htp.p(''X-Robots-Tag    noindex,follow'');',
'    sys.owa_util.http_header_close;',
'    sys.htp.p(''<p>'' || apex_lang.message(''MSG_MATH_QUESTION'', ''</p><span>'' ||l_tmp || ''&nbsp;&#'' || ASCII(''='') || ''</span>''));',
'    /* set correct answer to item session state */',
'    apex_util.set_session_state(l_answer_item, TO_NUMBER(l_arr(1)) + TO_NUMBER(l_arr(2)));',
'    RETURN l_result;',
'  EXCEPTION WHEN OTHERS',
'  THEN',
'    sys.htp.prn(wwv_flow_lang.system_message(''ajax_server_error''));',
'    RETURN l_result;',
'  END ajax_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION validate_math_question_field(',
'    p_item   IN apex_plugin.t_page_item,',
'    p_plugin IN apex_plugin.t_plugin,',
'    p_value  IN VARCHAR2',
'  ) RETURN apex_plugin.t_page_item_validation_result',
'  AS',
'    l_answer_item VARCHAR2(30);',
'    l_value       SIMPLE_INTEGER := 0;',
'    l_answer      SIMPLE_INTEGER := 0;',
'    l_is_valid    BOOLEAN;',
'    l_result      apex_plugin.t_page_item_validation_result;',
'  BEGIN',
'    l_answer_item := p_item.attribute_01;',
'    IF p_value IS NULL THEN',
'      RETURN NULL;',
'    END IF;',
'    BEGIN',
'      l_is_valid := TO_NUMBER(p_value) = nv(l_answer_item);',
'    EXCEPTION WHEN ',
'    VALUE_ERROR OR ',
'    INVALID_NUMBER',
'    THEN',
'      l_is_valid := FALSE;',
'    END;',
'    IF NOT l_is_valid THEN',
'      l_result.message := apex_lang.message(''VALIDATION_MATH_QUESTION'', p_item.plain_label);',
'    END IF;',
'    RETURN l_result;',
'  END validate_math_question_field;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_simple_star_rating (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS ',
'    l_result apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    sys.htp.prn(',
'      ''<div id="'' || p_item.name || ''" class="rating" data-val="'' || p_value || ''">''',
'      || ''<ul>''',
'    );',
'    for i in 1 .. 5 loop',
'        sys.htp.prn(',
'          ''<li id="'' || p_item.name ||''_'' || i || ''" title="'' || i || ''" ''',
'          || case when l_result.is_navigable then',
'            case when i <=  p_value then ''class="active enabled"'' else ''class="enabled"'' end',
'          else',
'            case when i <=  p_value then ''class="active"'' end',
'          end',
'          || ''/></li>''',
'        );',
'    end loop;',
'    sys.htp.prn(''</ul>'');',
'    if not p_is_readonly then',
'      apex_javascript.add_onload_code (p_code => ''$("''',
'        || apex_plugin_util.page_item_names_to_jquery(p_item.name) ',
'        || ''").starRating();''',
'      );',
'      sys.htp.p(',
'        ''<div id="'' || p_item.name ||''_DIALOG" class="hideMe508">''',
'        || apex_lang.message(''DIALOG_ARTICLE_RATED'')',
'        || ''</div>''',
'      );',
'      apex_javascript.add_3rd_party_library_file (',
'        p_library   => apex_javascript.c_library_jquery_ui,',
'        p_file_name => ''jquery.ui.button''',
'      );',
'    end if;',
'    sys.htp.p(''</div>'');',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_simple_star_rating;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_modal_confirm(',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
'  ) RETURN apex_plugin.t_dynamic_action_render_result',
'  AS',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'  BEGIN',
'    apex_javascript.add_inline_code (',
'      p_code => ''function org_blogsite_jaris_modal_confirm(){''',
'        || ''this.affectedElements.data("request",this.triggeringElement.id).dialog({''',
'        || ''modal:true,''',
'        || ''buttons:{''',
'        || ''"'' || apex_lang.lang(''OK'') || ''":function(){$(this).dialog("close");apex.submit($(this).data("request"));},''',
'        || ''"'' || apex_lang.lang(''Cancel'') || ''":function(){$(this).dialog("close")}''',
'        || ''}})}''',
'      ,p_key  => ''org.blogsite.jaris.modal_confirm''',
'    );',
'    apex_javascript.add_3rd_party_library_file (',
'      p_library   => apex_javascript.c_library_jquery_ui,',
'      p_file_name => ''jquery.ui.button''',
'    );',
'    l_result.javascript_function := ''org_blogsite_jaris_modal_confirm'';',
'    RETURN l_result;',
'  END render_modal_confirm;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_plus_one_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_plus varchar2(20)    := coalesce(p_item.attribute_01, ''current_page'');',
'    l_page_url    varchar2(4000)  := p_item.attribute_02;',
'    l_custom_url  varchar2(4000)  := p_item.attribute_03;',
'    l_size        varchar2(20)    := coalesce(p_item.attribute_04, ''standard'');',
'    l_annotation  varchar2(20)    := coalesce(p_item.attribute_05, ''bubble'');',
'    l_width       varchar2(256)   := p_item.attribute_06;',
'    l_align       varchar2(20)    := coalesce(p_item.attribute_07, ''left'');',
'    l_expandto    varchar2(100)   := p_item.attribute_08;',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Google +1 URL based on our URL setting.',
'    -- Note: Always use session 0, otherwise Google +1 will always register a different URL.',
'    l_url := case l_url_to_plus',
'               when ''current_page'' then c_host || ''f?p='' || apex_application.g_flow_id || '':'' || apex_application.g_flow_step_id || '':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- Output the Google +1 button widget',
'    -- See https://developers.google.com/+/web/+1button/ for syntax',
'    sys.htp.prn (',
'      ''<script src="https://apis.google.com/js/platform.js" async defer></script>'' ||',
'      ''''',
'      || ''<div class="g-plusone"''',
'      || '' data-href="'' || l_url || ''"''',
'      || '' data-size="'' || apex_escape.html_attribute(l_size) || ''"''',
'      || '' data-annotation="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || case when l_annotation = ''inline'' then',
'          '' data-width="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'         end',
'      || '' data-align="'' || apex_escape.html_attribute(l_align) || ''"''',
'      || '' data-expandTo="'' || apex_escape.html_attribute(replace(l_expandto, '':'', '','')) || ''"''',
'      || ''></div>''',
'    );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_google_plus_one_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION render_google_share_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_plus varchar2(20)    := coalesce(p_item.attribute_01, ''current_page'');',
'    l_page_url    varchar2(4000)  := p_item.attribute_02;',
'    l_custom_url  varchar2(4000)  := p_item.attribute_03;',
'    l_annotation  varchar2(20)    := coalesce(p_item.attribute_04, ''bubble'');',
'    l_width       varchar2(256)   := p_item.attribute_05;',
'    l_height      varchar2(256)   := coalesce(p_item.attribute_06, ''20'');',
'    l_align       varchar2(20)    := coalesce(p_item.attribute_07, ''left'');',
'    l_expandto    varchar2(100)   := p_item.attribute_08;',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Google Share based on our URL setting.',
'    -- Note: Always use session 0, otherwise Google Share will always register a different URL.',
'    l_url := case l_url_to_plus',
'               when ''current_page'' then c_host || ''f?p='' || apex_application.g_flow_id || '':'' || apex_application.g_flow_step_id || '':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- Output the Google Share button widget',
'    -- See https://developers.google.com/+/web/+1button/ for syntax',
'    sys.htp.prn (',
'      ''<script src="https://apis.google.com/js/platform.js" async defer></script>'' ||',
'      ''''',
'      || ''<div class="g-plus" data-action="share"''',
'      || '' data-href="'' || l_url || ''"''',
'      || '' data-annotation="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || '' data-width="'' || apex_escape.html_attribute(l_annotation) || ''"''',
'      || '' data-height="'' || apex_escape.html_attribute(l_height) || ''"''',
'      || '' data-align="'' || apex_escape.html_attribute(l_align) || ''"''',
'      || '' data-expandTo="'' || apex_escape.html_attribute(replace(l_expandto, '':'', '','')) || ''"''',
'      || ''></div>''',
'    );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_google_share_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--==============================================================================',
'-- Renders the Facebook "Like" button widget based on the configuration of the',
'-- page item.',
'--==============================================================================',
'  FUNCTION render_facebook_like_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_like  varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');',
'    l_page_url     varchar2(4000) := p_item.attribute_02;',
'    l_custom_url   varchar2(4000) := p_item.attribute_03;',
'    l_layout_style varchar2(15)   := nvl(p_item.attribute_04, ''standard'');',
'    l_show_faces   boolean        := (nvl(p_item.attribute_05, ''Y'') = ''Y'');',
'    l_width        number         := p_item.attribute_06;',
'    l_verb         varchar2(15)   := nvl(p_item.attribute_07, ''like'');',
'    l_font         varchar2(15)   := p_item.attribute_08;',
'    l_color_scheme varchar2(15)   := nvl(p_item.attribute_09, ''light'');',
'    ',
'    l_url          varchar2(4000);',
'    l_height       number;',
'    l_result       apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'      ',
'    -- Get the width and the height depending on the picked layout style',
'    if l_width is null then',
'        l_width := case l_layout_style',
'                     when ''standard''     then 450',
'                     when ''button_count'' then 90',
'                     when ''box_count''    then 55',
'                   end;',
'    end if;',
'    ',
'    l_height := case l_layout_style',
'                  when ''standard''     then case when l_show_faces then 80 else 35 end',
'                  when ''button_count'' then 20',
'                  when ''box_count''    then 65',
'                end;',
'    -- Base URL for the "Like" widget.',
'    -- See http://developers.facebook.com/docs/reference/plugins/like',
'    -- for a documentation of the URL syntax',
'    l_url := ''//www.facebook.com/plugins/like.php?href='';',
'    ',
'    -- Generate the "Like" URL based on our URL to Like setting.',
'    -- Note: Always use session 0, otherwise Facebook will not be able to get the page.',
'    l_url := l_url||',
'             utl_url.escape (',
'                 url => case l_url_to_like',
'                          when ''current_page'' then c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0''',
'                          when ''page_url''     then c_host||l_page_url',
'                          when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'                          when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'                        end,',
'                 escape_reserved_chars => true)||',
'             ''&amp;'';',
'    -- Add the display options for the "Like" button widget',
'    l_url := l_url||',
'             ''layout=''||l_layout_style||''&amp;''||',
'             case when l_layout_style = ''standard'' then',
'                 ''show_faces=''||case when l_show_faces then ''true'' else ''false'' end||''&amp;''',
'             end||',
'             ''width=''||l_width||''&amp;''||',
'             ''action=''||l_verb||''&amp;''||',
'             case when l_font is not null then ''font=''||l_font||''&amp;'' end||',
'             ''colorscheme=''||l_color_scheme||''&amp;''||',
'             ''height=''||l_height;',
'    -- Output the Facebook Like button widget',
'    sys.htp.prn(''<iframe src="''||l_url||''" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:''||l_width||''px; height:''||l_height||''px;" allowTransparency="true"></iframe>'');',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_facebook_like_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--==============================================================================',
'-- Renders the Twitter button widget based on the configuration of the',
'-- page item.',
'--==============================================================================',
'  FUNCTION render_twitter_button (',
'    p_item                IN apex_plugin.t_page_item,',
'    p_plugin              IN apex_plugin.t_plugin,',
'    p_value               IN VARCHAR2,',
'    p_is_readonly         IN BOOLEAN,',
'    p_is_printer_friendly IN BOOLEAN',
'  ) RETURN apex_plugin.t_page_item_render_result',
'  AS',
'    c_host constant varchar2(4000) := apex_util.host_url(''SCRIPT'');',
'    ',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable.',
'    -- We are using the same defaults for the required attributes as in the',
'    -- plug-in attribute configuration, because they can still be null.',
'    -- Note: Keep them in sync!',
'    l_url_to_like     varchar2(20)   := nvl(p_item.attribute_01, ''current_page'');',
'    l_page_url        varchar2(4000) := p_item.attribute_02;',
'    l_custom_url      varchar2(4000) := p_item.attribute_03;',
'    l_layout_style    varchar2(15)   := nvl(p_item.attribute_04, ''vertical'');',
'    l_tweet_text_type varchar2(10)   := nvl(p_item.attribute_05, ''page_title'');',
'    l_custom_text     varchar2(140)  := sys.htf.escape_sc(p_item.attribute_06);',
'    l_follow1         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_07);',
'    l_follow2         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_08);',
'    ',
'    l_url             varchar2(4000);',
'    l_result          apex_plugin.t_page_item_render_result;',
'  BEGIN',
'    -- Don''t show the widget if we are running in printer friendly mode',
'    if p_is_printer_friendly then',
'        RETURN null;',
'    end if;',
'    ',
'    -- Generate the Tweet URL based on our URL setting.',
'    -- Note: Always use session 0, otherwise Twitter will always register a different URL.',
'    l_url := case l_url_to_like',
'               when ''current_page'' then c_host||''f?p=''||apex_application.g_flow_id||'':''||apex_application.g_flow_step_id||'':0''',
'               when ''page_url''     then c_host||l_page_url',
'               when ''custom_url''   then replace(l_custom_url, ''#HOST#'', c_host)',
'               when ''value''        then replace(p_value, ''#HOST#'', c_host)',
'             end;',
'    -- For a custom text we have to replace the #PAGE_TITLE# placeholder with the correct',
'    -- language dependent page title of the current page.',
'    if l_tweet_text_type = ''custom'' then',
'        if instr(l_custom_text, ''#PAGE_TITLE'') > 0 then',
'            select replace(l_custom_text, ''#PAGE_TITLE#'', apex_application.do_substitutions(page_title, ''ESC''))',
'              into l_custom_text',
'              from apex_application_pages',
'             where application_id = nvl(apex_application.g_translated_flow_id, apex_application.g_flow_id)',
'               and page_id        = nvl(apex_application.g_translated_page_id, apex_application.g_flow_step_id);',
'        end if;',
'    end if;',
'    -- Output the Twitter button widget',
'    -- See http://twitter.com/about/resources/tweetbutton for syntax',
'    sys.htp.prn (',
'        ''<a href="//twitter.com/share" class="twitter-share-button" data-url="''||sys.htf.escape_sc(l_url)||''" ''||',
'        case when l_tweet_text_type = ''custom'' then ''data-text="''||l_custom_text||''" '' end||',
'        ''data-count="''||l_layout_style||''" ''||',
'        case when l_follow1 is not null then ''data-via="''||l_follow1||''" '' end||',
'        case when l_follow2 is not null then ''data-related="''||l_follow2||''" '' end||',
'        ''>Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>'' );',
'    -- Tell APEX that this field is NOT navigable',
'    l_result.is_navigable := false;',
'    RETURN l_result;',
'  END render_twitter_button;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_PLUGIN";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_JOB" ',
'AUTHID DEFINER',
'AS',
'-------------------------------------------------------------------------------',
'--------------'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39888428900552479804)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'------------------------------------------------------------------',
'  PROCEDURE rotate_log;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs;',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview;',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE,',
'    p_interval IN PLS_INTEGER DEFAULT NULL',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview_job (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'END "BLOG_JOB";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_JOB" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Private variables, procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_host_ip_info (',
'    p_ip            IN VARCHAR2,',
'    p_city          OUT NOCOPY VARCHAR2,',
'    p_country_code  OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_clob  CLOB;',
'    l_url   CONSTANT VARCHAR2(32000) := ''http://api.hostip.info/'';',
'  BEGIN',
'    l_clob := apex_web_service.make_rest_request(',
'                p_url         => l_url,',
'                p_http_method => ''GET'',',
'                p_parm_name   => apex_util.string_to_table(''ip''),',
'                p_parm_value  => apex_util.string_to_table(p_ip)',
'              );',
'    BEGIN',
'      SELECT EXTRACTVALUE(VALUE(t), ''//gml:name'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS city,',
'        EXTRACTVALUE(VALUE(t), ''//countryAbbrev'', ''xmlns:gml="http://www.opengis.net/gml"'')  AS countryAbbrev',
'      INTO p_city, p_country_code',
'      FROM TABLE(',
'        XMLSEQUENCE(',
'          XMLTYPE.CREATEXML(l_clob).EXTRACT(',
'            ''HostipLookupResultSet/gml:featureMember/Hostip'',',
'            ''xmlns:gml="http://www.opengis.net/gml"''',
'          )',
'        )',
'      ) t;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      p_city          := NULL;',
'      p_country_code  := NULL;',
'    END;',
' ',
'  END get_host_ip_info;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'-- Global functions and procedures',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log',
'  AS',
'    l_new_tbl VARCHAR2(4000);',
'    l_log_tbl CHAR(1);',
'  BEGIN',
'  ',
'    SELECT SUBSTR(table_name, -1) AS log_tbl',
'    INTO l_log_tbl',
'    FROM user_synonyms',
'    WHERE synonym_name = ''BLOG_ACTIVITY_LOG''',
'    ;',
'    ',
'    IF l_log_tbl = ''1'' THEN',
'      l_new_tbl := ''2'';',
'    ELSIF l_log_tbl = ''2'' THEN',
'      l_new_tbl := ''1'';',
'    ELSE',
'      raise_application_error(-20001, ''Invalid log table.'');',
'    END IF;',
'    ',
'    EXECUTE IMMEDIATE ''TRUNCATE TABLE BLOG_ACTIVITY_LOG'' || l_new_tbl;',
'    ',
'    EXECUTE IMMEDIATE ''CREATE OR REPLACE SYNONYM BLOG_ACTIVITY_LOG FOR BLOG_ACTIVITY_LOG'' || l_new_tbl;',
'  ',
'  END rotate_log;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country',
'  AS',
'    l_city    VARCHAR2(2000);',
'    l_code    VARCHAR2(2000);',
'    l_count   NUMBER;',
'  BEGIN',
'  ',
'    /* Get distinct ip addreses where is no country information. */',
'    FOR c1 IN(',
'      SELECT DISTINCT ip_address',
'      FROM blog_activity_log',
'      WHERE activity_type = ''NEW_SESSION''',
'      AND country_code IS NULL',
'    ) LOOP',
'    ',
'      l_count := 0;',
'      l_city  := NULL;',
'      l_code  := NULL;',
'      ',
'      /* Check from logs if ip address already have country information from previous visit */',
'      BEGIN',
'        WITH qry AS (',
'          SELECT',
'            ROW_NUMBER() OVER(ORDER BY activity_date DESC) AS rn,',
'            country_city,',
'            country_code',
'          FROM blog_v$activity_log',
'          WHERE activity_type = ''NEW_SESSION''',
'          AND ip_address = c1.ip_address',
'          AND country_code IS NOT NULL',
'        )',
'        SELECT',
'          country_city,',
'          country_code',
'        INTO l_city, l_code',
'        FROM qry',
'        WHERE rn = 1',
'        ;',
'      /* If no previous visit get country info from hostip.info */',
'      EXCEPTION WHEN NO_DATA_FOUND THEN    ',
'        get_host_ip_info(',
'          p_ip            => c1.ip_address,',
'          p_city          => l_city,',
'          p_country_code  => l_code',
'        );',
'      END;',
'      ',
'      l_city  := COALESCE(l_city, ''(unknown city)'');',
'      l_code  := COALESCE(l_code, ''XX'');',
'      ',
'      /* Update activity log if country code exists in BLOG_COUNTRY table */',
'      UPDATE blog_activity_log',
'      SET country_city  = l_city,',
'        country_code    = l_code',
'      WHERE activity_type = ''NEW_SESSION''',
'        AND ip_address  = c1.ip_address',
'        AND country_code IS NULL',
'        AND EXISTS (',
'          SELECT 1',
'          FROM blog_country c',
'          WHERE c.country_code = l_code',
'        )',
'      ;',
'      l_count := SQL%ROWCOUNT;',
'      ',
'      /* If no rows updated, country code is unknown */',
'      IF l_count = 0 THEN',
'        l_code := ''XX'';    ',
'        UPDATE blog_activity_log',
'        SET country_city  = l_city,',
'          country_code    = l_code',
'        WHERE activity_type = ''NEW_SESSION''',
'          AND ip_address  = c1.ip_address',
'          AND country_code IS NULL',
'          ;',
'        l_count := SQL%ROWCOUNT;',
'      END IF;',
'      ',
'      /* Update total visitors from country */',
'      UPDATE blog_country',
'      SET visit_count = visit_count + l_count',
'      WHERE country_code = l_code',
'      ;',
'      ',
'    END LOOP;',
'    ',
'  END update_country;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs',
'  AS',
'  BEGIN',
'    dbms_mview.refresh(''BLOG_ARTICLE_HIT20,BLOG_ARTICLE_TOP20'');',
'  END update_activity_logs;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview',
'  AS',
'  BEGIN',
'    /* Delete from blog_article_preview rows where session is expired */',
'    DELETE FROM blog_article_preview p',
'    WHERE NOT EXISTS (',
'      SELECT 1 FROM apex_workspace_sessions s',
'      WHERE s.apex_session_id = p.apex_session_id',
'    );',
'  END purge_preview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE rotate_log_job(',
'    p_drop_job IN BOOLEAN DEFAULT FALSE,',
'    p_interval IN PLS_INTEGER DEFAULT NULL',
'  )',
'  AS',
'    l_interval        SIMPLE_INTEGER := 0;',
'    c_job             CONSTANT VARCHAR2(30) := ''BLOG_ROTATE_LOG'';',
'    job_not_exists    EXCEPTION;',
'    PRAGMA            EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF p_interval IS NULL OR p_interval < 1 THEN',
'      l_interval := blog_util.get_param_value(''LOG_ROTATE_DAY'');',
'    ELSE',
'      l_interval := p_interval;',
'    END IF;',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        => ''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.rotate_log'',',
'        start_date      => TRUNC(SYSTIMESTAMP),',
'        enabled         => TRUE,',
'        repeat_interval => ''FREQ=DAILY;INTERVAL='' || l_interval || '';BYMINUTE=5'',',
'        comments        => ''Rotate blog activity logs''',
'      );',
'    END IF;',
'  END rotate_log_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_country_job (',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job                 CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_COUNTRY'';',
'    job_not_exists        EXCEPTION;',
'    PRAGMA                EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        =>''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.update_country'',',
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),',
'        repeat_interval => ''FREQ=MINUTELY;INTERVAL=10'',',
'        enabled         => TRUE,',
'        comments        => ''Update blog visitors country''',
'      );',
'    END IF;',
'  END update_country_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_activity_logs_job (',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job          CONSTANT VARCHAR2(30) := ''BLOG_UPDATE_ACTIVITY_LOGS'';',
'    job_not_exists EXCEPTION;',
'    PRAGMA         EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    ',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        =>''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.update_activity_logs'',',
'        start_date      => TRUNC(SYSTIMESTAMP, ''HH''),',
'        repeat_interval => ''FREQ=MINUTELY;INTERVAL=15'',',
'        enabled         => TRUE,',
'        comments        => ''Update blog statistic log mviews''',
'      );',
'    END IF;',
'  END update_activity_logs_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE purge_preview_job(',
'    p_drop_job BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    c_job           CONSTANT VARCHAR2(30) := ''BLOG_PURGE_PREVIEW'';',
'    job_not_exists  EXCEPTION;',
'    PRAGMA          EXCEPTION_INIT(job_not_exists, -27475);',
'  BEGIN',
'    BEGIN',
'      sys.dbms_scheduler.drop_job(c_job);',
'    EXCEPTION WHEN job_not_exists THEN',
'      NULL;',
'    END;',
'    IF NOT p_drop_job THEN',
'      sys.dbms_scheduler.create_job(',
'        job_name        => c_job,',
'        job_type        => ''STORED_PROCEDURE'',',
'        job_action      => ''blog_job.purge_preview'',',
'        start_date      => TRUNC(SYSTIMESTAMP),',
'        repeat_interval => ''FREQ=DAILY'',',
'        enabled         => TRUE,',
'        comments        => ''Purge blog article preview table''',
'      );',
'    END IF;',
'  END purge_preview_job;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_JOB";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_INSTALL" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  i sys.dbms_sql.varchar2_table;',
'  e sys.dbms_sql.varchar2_table;',
'  b BLOB;',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_param_data(',
'    p_theme_path    IN VARCHAR2 DEFAULT NULL,',
'    p_upgrade       IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION varchar2_to_blob(',
'    p_varchar2_tab IN sys.dbms_sql.varchar2_table',
'  ) RETURN BLOB;',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_jobs (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  );',
'--------------------------------------------------------------------------------',
'  FUNCTION get_version (',
'    p_option  IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'END "BLOG_INSTALL";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_INSTALL" ',
'AS',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE update_param_data(',
'    p_theme_path    IN VARCHAR2 DEFAULT NULL,',
'    p_upgrade       IN BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'    l_reader_id NUMBER;',
'    l_admin_id  NUMBER;',
'    l_app_alias VARCHAR2(2000);',
'    l_base_url  VARCHAR2(2000);',
'  BEGIN',
'    l_base_url := apex_util.host_url(''SCRIPT'');',
'    BEGIN',
'      SELECT application_id',
'      INTO l_reader_id',
'      FROM apex_applications',
'      WHERE version = (select blog_util.get_param_value(''READER_VERSION'') from dual)',
'        AND application_group = ''Blog''',
'        AND application_name = ''Blog Reader''',
'      ;',
'    EXCEPTION WHEN ',
'      NO_DATA_FOUND ',
'    THEN',
'      raise_application_error(-20001, ''Blog reader application not exists.'');',
'    END;',
'    BEGIN',
'      SELECT application_id',
'      INTO l_admin_id',
'      FROM apex_applications',
'      WHERE version = (select blog_util.get_param_value(''ADMIN_VERSION'') from dual)',
'        AND application_group = ''Blog''',
'        AND application_name = ''Blog Administration''',
'      ;',
'    EXCEPTION WHEN ',
'      NO_DATA_FOUND',
'    THEN',
'      raise_application_error(-20002, ''Blog admin application not exists.'');',
'    END;',
'    ',
'    SELECT alias',
'    INTO l_app_alias',
'    FROM apex_applications',
'    WHERE application_id = l_reader_id',
'    ;',
'    UPDATE blog_param',
'    SET param_value = TO_CHAR(l_reader_id)',
'    WHERE param_id  = ''G_BLOG_READER_APP_ID''',
'    ;',
'    UPDATE blog_param',
'    SET param_value = TO_CHAR(l_admin_id)',
'    WHERE param_id  = ''G_BLOG_ADMIN_APP_ID''',
'    ;',
'    IF NOT p_upgrade THEN',
'      UPDATE blog_param',
'      SET param_value = coalesce(p_theme_path,''f?p='' || TO_CHAR(l_reader_id) || '':DOWNLOAD:0:'')',
'      WHERE param_id  = ''G_THEME_PATH''',
'      ;',
'      UPDATE blog_param',
'      SET param_value = l_base_url || ''f?p='' || l_app_alias || '':RSS''',
'      WHERE param_id  = ''G_RSS_FEED_URL''',
'      ;',
'      UPDATE blog_param',
'      SET param_value = l_base_url',
'      WHERE param_id  = ''G_BASE_URL''',
'      ;',
'      dbms_mview.refresh(''BLOG_PARAM_APP'',''C'');',
'    END IF;',
'  END update_param_data;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION varchar2_to_blob(',
'    p_varchar2_tab IN sys.dbms_sql.varchar2_table',
'  ) RETURN BLOB',
'  AS',
'    l_blob BLOB;',
'    l_size NUMBER;',
'  BEGIN',
'    dbms_lob.createtemporary(l_blob, true, dbms_lob.session);',
'    FOR i IN 1 .. p_varchar2_tab.count',
'    LOOP',
'      l_size := length(p_varchar2_tab(i)) / 2;',
'      dbms_lob.writeappend(l_blob, l_size, hextoraw(p_varchar2_tab(i)));',
'    END LOOP;',
'    RETURN l_blob;',
'  EXCEPTION WHEN OTHERS THEN',
'    dbms_lob.close(l_blob);',
'    RETURN NULL;',
'  END varchar2_to_blob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE set_jobs (',
'    p_drop_job IN BOOLEAN DEFAULT FALSE',
'  )',
'  AS',
'  BEGIN',
'    blog_job.rotate_log_job(p_drop_job);',
'    blog_job.purge_preview_job(p_drop_job);',
'    blog_job.update_country_job(p_drop_job);',
'    blog_job.update_activity_logs_job(p_drop_job);',
'  END set_jobs;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_version (',
'    p_option  IN VARCHAR2 DEFAULT NULL',
'  ) RETURN VARCHAR2',
'  AS',
'    l_version VARCHAR2(256);',
'  BEGIN',
'    IF p_option = ''READER'' THEN',
'      BEGIN',
'        SELECT s.version',
'         INTO l_version',
'         FROM apex_applications s',
'        WHERE s.application_id = (select blog_util.get_param_value(''G_BLOG_READER_APP_ID'') from dual)',
'          AND s.version = (select blog_util.get_param_value(''READER_VERSION'') from dual)',
'        ;',
'      EXCEPTION WHEN NO_DATA_FOUND THEN',
'        raise_application_error(-20001, ''Blog reader application not exists.'');',
'      END;',
'    ELSIF p_option = ''ADMIN'' THEN',
'      BEGIN',
'        SELECT s.version',
'         INTO l_version',
'         FROM apex_applications s',
'        WHERE s.application_id = (select blog_util.get_param_value(''G_BLOG_ADMIN_APP_ID'') from dual)',
'          AND s.version = (select blog_util.get_param_value(''ADMIN_VERSION'') from dual)',
'        ;',
'      EXCEPTION WHEN NO_DATA_FOUND THEN',
'        raise_application_error(-20001, ''Blog admin application not exists.'');',
'      END;',
'    ELSE',
'      l_version :=  blog_util.get_param_value(''SCHEMA_VERSION'');',
'    END IF;',
'    RETURN l_version;    ',
'  END get_version;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_INSTALL";',
'/',
'',
'CREATE OR REPLACE PACKAGE  "BLOG_ADMIN_APP" ',
'AUTHID DEFINER',
'AS',
'--------------------------------------------------------------------------------',
'  PROCEDURE refresh_article_mview;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_collection_name RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_article_from_collection;',
'--------------------------------------------------------------------------------',
'  PROCEDURE table_to_collection (',
'    p_table       IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE article_to_collection (',
'    p_article_id  IN NUMBER',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_text (',
'    p_article_id      IN NUMBER,',
'    p_success_message IN OUT NOCOPY VARCHAR2,',
'    p_message         IN VARCHAR DEFAULT ''Action Processed.''',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_preview (',
'    p_article_id      IN NUMBER,',
'    p_author_id       IN NUMBER,',
'    p_category_id     IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  );',
'--------------------------------------------------------------------------------  ',
'  PROCEDURE create_new_category(',
'    p_category_name IN VARCHAR2',
'  );',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_category_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_faq_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_author_sequence;',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_resource_sequence;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_category_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_author_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_faq_seq RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_resource_seq (',
'    p_link_type IN VARCHAR2',
'  ) RETURN NUMBER;',
'--------------------------------------------------------------------------------',
'  FUNCTION set_param_value_item (',
'    p_param_id          IN VARCHAR2,',
'    p_yesno             IN VARCHAR2,',
'    p_text_null         IN VARCHAR2,',
'    p_number_null       IN VARCHAR2,',
'    p_number_not_null   IN VARCHAR2,',
'    p_text_not_null     IN VARCHAR2,',
'    p_textarea_null     IN VARCHAR2,',
'    p_textarea_not_null IN VARCHAR2',
'  ) RETURN VARCHAR2;',
'--------------------------------------------------------------------------------',
'  FUNCTION login(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  FUNCTION check_password(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN;',
'--------------------------------------------------------------------------------',
'  PROCEDURE post_login;',
'--------------------------------------------------------------------------------',
'  FUNCTION is_developer RETURN PLS_INTEGER;',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  OUT NOCOPY VARCHAR2,',
'    p_language_code         OUT NOCOPY VARCHAR2,',
'    p_message_text          OUT NOCOPY VARCHAR2,',
'    p_md5                   OUT NOCOPY VARCHAR2',
'   );',
'--------------------------------------------------------------------------------',
'  PROCEDURE upd_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_md5                   IN VARCHAR2,',
'    p_success_message       OUT NOCOPY VARCHAR2',
'   );',
'--------------------------------------------------------------------------------  ',
'END "BLOG_ADMIN_APP";',
'/',
'CREATE OR REPLACE PACKAGE BODY  "BLOG_ADMIN_APP" ',
'AS',
'--------------------------------------------------------------------------------',
'  -- Private constants and functions',
'  g_article_text_collection CONSTANT VARCHAR2(80) := ''ARTICLE_TEXT_COLLECTION'';',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION build_apex_lang_message_md5 (',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_col_sep   IN VARCHAR2 DEFAULT ''|''',
'  ) RETURN VARCHAR2',
'  AS',
'  BEGIN',
'    RETURN sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => ',
'      p_translation_entry_id || p_col_sep ||',
'      p_translatable_message || p_col_sep ||',
'      p_language_code || p_col_sep ||',
'      p_message_text || p_col_sep ||',
'      ''''',
'    ));',
'  END build_apex_lang_message_md5;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  -- Global procedures and functions',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE refresh_article_mview',
'  AS',
'  BEGIN',
'    dbms_mview.refresh(''BLOG_ARCHIVE_LOV,BLOG_ARTICLE_HIT20,BLOG_ARTICLE_LAST20,BLOG_ARTICLE_TOP20'',''CCCC'');',
'  END refresh_article_mview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION table_to_clob (',
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  ) RETURN CLOB',
'  AS',
'    l_len   SIMPLE_INTEGER := 0;',
'    l_data  CLOB;',
'  BEGIN',
'    l_len := p_table.COUNT;',
'    IF l_len = 0',
'    OR COALESCE(LENGTH(p_table(1)), 0) = 0',
'    THEN',
'      RETURN EMPTY_CLOB();',
'    END IF;',
'    dbms_lob.createtemporary(',
'      lob_loc => l_data,',
'      cache   => TRUE,',
'      dur     => dbms_lob.session',
'    );',
'    dbms_lob.open(l_data, dbms_lob.lob_readwrite);',
'    FOR i IN 1 .. l_len',
'    LOOP',
'      dbms_lob.writeappend(',
'        lob_loc => l_data,',
'        amount  => LENGTH(p_table(i)),',
'        buffer  => p_table(i)',
'      );',
'    END LOOP;',
'    dbms_lob.close(l_data);',
'    RETURN l_data;',
'  END table_to_clob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_clob(',
'    p_clob IN CLOB',
'  )',
'  AS',
'    l_length      SIMPLE_INTEGER := 0;',
'    l_clob_len    SIMPLE_INTEGER := 0;',
'    l_offset      SIMPLE_INTEGER := 1;',
'    l_byte_len    SIMPLE_INTEGER := 0;',
'    l_temp        VARCHAR2(32767);',
'  BEGIN',
'  --',
'    l_length    := COALESCE(dbms_lob.getlength(p_clob), 0);',
'    l_clob_len  := l_length;',
'    l_byte_len  := 30000;',
'    --',
'    IF l_length < l_byte_len THEN',
'      sys.htp.prn(p_clob);',
'    ELSE',
'    --',
'      WHILE l_offset < l_length AND l_byte_len > 0',
'      LOOP',
'        /* Get 30k cut */',
'        l_temp := sys.dbms_lob.substr(p_clob,l_byte_len,l_offset);',
'        --',
'        /* Print HTML */',
'        sys.htp.prn(l_temp);',
'        --',
'        /* set the start position for the next cut */',
'        l_offset := l_offset + l_byte_len;',
'        --',
'        /* set the end position if less than 32k */',
'        l_clob_len := l_clob_len - l_byte_len;',
'        IF l_clob_len < l_byte_len THEN',
'          l_byte_len := l_clob_len;',
'        END IF;',
'      END LOOP;',
'    --',
'    END IF;',
'  END print_clob;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_collection_name RETURN VARCHAR2',
'  AS',
'  BEGIN',
'    RETURN g_article_text_collection;',
'  END;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE print_article_from_collection',
'  AS',
'    l_clob CLOB;',
'  BEGIN',
'    SELECT clob001',
'    INTO l_clob',
'    FROM apex_collections',
'    WHERE collection_name = g_article_text_collection',
'    AND seq_id = 1',
'    ;',
'    print_clob(l_clob);',
'  END print_article_from_collection ;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE table_to_collection (',
'    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  )',
'  AS',
'  BEGIN',
'    apex_collection.create_or_truncate_collection(g_article_text_collection);',
'    apex_collection.add_member(',
'      p_collection_name => g_article_text_collection,',
'      p_clob001         => table_to_clob(p_table)',
'    );',
'  END table_to_collection;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE article_to_collection (',
'    p_article_id IN NUMBER',
'  )',
'  AS',
'    l_clob CLOB;',
'  BEGIN',
'    apex_collection.create_or_truncate_collection(g_article_text_collection);',
'    BEGIN',
'      SELECT article_text',
'      INTO l_clob',
'      FROM blog_article',
'      WHERE article_id = p_article_id',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      l_clob := NULL;',
'    END;',
'    apex_collection.add_member(',
'      p_collection_name => g_article_text_collection,',
'      p_clob001 => l_clob',
'    );',
'  END article_to_collection;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_text (',
'    p_article_id      IN NUMBER,',
'    p_success_message IN OUT NOCOPY VARCHAR2,',
'    p_message         IN VARCHAR DEFAULT ''Action Processed.''',
'  )',
'  AS',
'  BEGIN',
'    MERGE INTO blog_article a',
'    USING (',
'      SELECT p_article_id AS article_id,',
'        clob001',
'      FROM apex_collections',
'      WHERE collection_name = g_article_text_collection',
'        AND seq_id  = 1',
'    ) b',
'    ON (a.article_id = b.article_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.article_text = b.clob001',
'    WHERE sys.dbms_lob.compare(a.article_text, b.clob001) != 0',
'      OR sys.dbms_lob.compare(a.article_text, b.clob001) IS NULL',
'    ;',
'    IF SQL%ROWCOUNT > 0 THEN',
'      p_success_message := COALESCE(p_success_message, p_message);',
'    END IF;',
'  END save_article_text;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE save_article_preview (',
'    p_article_id      IN NUMBER,',
'    p_author_id       IN NUMBER,',
'    p_category_id     IN NUMBER,',
'    p_article_title   IN VARCHAR2,',
'    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2',
'  )',
'  AS',
'  BEGIN',
'    /* Hopefully we can someday share collections between applications */',
'    blog_admin_app.table_to_collection (p_article_text);',
'    MERGE INTO blog_article_preview a',
'    USING (',
'      SELECT p_article_id AS article_id,',
'        p_author_id       AS author_id,',
'        p_category_id     AS category_id,',
'        p_article_title   AS article_title,',
'        clob001           AS article_text',
'      FROM apex_collections',
'      WHERE collection_name = g_article_text_collection',
'        AND seq_id  = 1',
'    ) b',
'    ON (a.apex_session_id = b.article_id)',
'    WHEN MATCHED THEN',
'    UPDATE SET a.article_text = b.article_text,',
'      a.author_id             = b.author_id,',
'      a.category_id           = b.category_id,',
'      a.article_title         = b.article_title',
'    WHEN NOT MATCHED THEN',
'    INSERT (apex_session_id, author_id, category_id, article_title, article_text)',
'    VALUES (b.article_id, b.author_id, b.category_id, b.article_title, b.article_text)',
'    ;',
'  END save_article_preview;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE create_new_category(',
'    p_category_name IN VARCHAR2',
'  )',
'  AS',
'    l_category_id NUMBER;',
'  BEGIN',
'    INSERT INTO blog_category (category_name, category_seq)',
'    VALUES(p_category_name, blog_admin_app.get_next_category_seq)',
'    RETURNING category_id INTO '))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39888428900552479804)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'l_category_id;',
'    sys.htp.prn(l_category_id);',
'  EXCEPTION WHEN DUP_VAL_ON_INDEX THEN',
'    sys.htp.prn(apex_lang.message(''MSG_CATEGORY_EXISTS''));',
'  END create_new_category;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_category_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_category a',
'    USING (',
'      SELECT c.category_id,',
'        ROW_NUMBER() OVER(ORDER BY c.category_seq) * 10 AS new_seq',
'      FROM blog_category c',
'    ) b',
'    ON (a.category_id = b.category_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.category_seq = b.new_seq',
'    ;',
'  END cleanup_category_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_faq_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_faq a',
'    USING (',
'      SELECT c.faq_id,',
'        ROW_NUMBER() OVER(ORDER BY c.faq_seq) * 10 AS new_seq',
'      FROM blog_faq c',
'    ) b',
'    ON (a.faq_id = b.faq_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.faq_seq = b.new_seq',
'    ;',
'  END cleanup_faq_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_author_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_author a',
'    USING (',
'      SELECT c.author_id,',
'        ROW_NUMBER() OVER(ORDER BY c.author_seq) * 10 AS new_seq',
'      FROM blog_author c',
'    ) b',
'    ON (a.author_id = b.author_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.author_seq = b.new_seq',
'    ;',
'  END cleanup_author_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE cleanup_resource_sequence',
'  AS',
'  BEGIN',
'    MERGE INTO blog_resource a',
'    USING (',
'      SELECT c.link_id,',
'        ROW_NUMBER() OVER(PARTITION BY c.link_type ORDER BY c.link_seq) * 10 AS new_seq',
'      FROM blog_resource c',
'    ) b',
'    ON (a.link_id = b.link_id)',
'    WHEN MATCHED THEN UPDATE ',
'    SET a.link_seq = b.new_seq',
'    ;',
'  END cleanup_resource_sequence;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_category_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(category_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_category',
'    ;',
'    RETURN l_max;',
'  END get_next_category_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_author_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(author_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_author',
'    ;',
'    RETURN l_max;',
'  END get_next_author_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_faq_seq RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(faq_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_faq',
'    ;',
'    RETURN l_max;',
'  END get_next_faq_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION get_next_resource_seq (',
'    p_link_type IN VARCHAR2',
'  ) RETURN NUMBER',
'  AS',
'    l_max  NUMBER;',
'  BEGIN',
'    SELECT CEIL(COALESCE(MAX(link_seq) + 1, 1) / 10) * 10',
'    INTO l_max',
'    FROM blog_resource',
'    WHERE link_type = p_link_type',
'    ;',
'    RETURN l_max;',
'  END get_next_resource_seq;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION set_param_value_item (',
'    p_param_id          IN VARCHAR2,',
'    p_yesno             IN VARCHAR2,',
'    p_text_null         IN VARCHAR2,',
'    p_number_null       IN VARCHAR2,',
'    p_number_not_null   IN VARCHAR2,',
'    p_text_not_null     IN VARCHAR2,',
'    p_textarea_null     IN VARCHAR2,',
'    p_textarea_not_null IN VARCHAR2',
'  ) RETURN VARCHAR2',
'  AS',
'    l_value VARCHAR2(32700);',
'  BEGIN',
'    SELECT CASE',
'      WHEN param_type = ''YESNO'' THEN',
'        p_yesno',
'      WHEN param_type = ''TEXT'' AND param_nullable = ''Y'' THEN',
'        p_text_null',
'      WHEN param_type = ''TEXT'' AND param_nullable = ''N'' THEN',
'        p_text_not_null',
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''Y'' THEN',
'        p_number_null',
'      WHEN param_type = ''NUMBER'' AND param_nullable = ''N'' THEN',
'        p_number_not_null',
'      WHEN param_type = ''TEXTAREA'' AND param_nullable = ''Y'' THEN',
'        p_textarea_null',
'      WHEN param_type = ''TEXTAREA'' AND param_nullable = ''N'' THEN',
'        p_textarea_not_null',
'    END AS param_value',
'    INTO l_value',
'    FROM blog_param',
'    WHERE param_id = p_param_id',
'    ;',
'    RETURN l_value;',
'  END set_param_value_item;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION login(',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    AUTH_SUCCESS            CONSTANT INTEGER      := 0;',
'    AUTH_UNKNOWN_USER       CONSTANT INTEGER      := 1;',
'    AUTH_ACCOUNT_LOCKED     CONSTANT INTEGER      := 2;',
'    AUTH_ACCOUNT_EXPIRED    CONSTANT INTEGER      := 3;',
'    AUTH_PASSWORD_INCORRECT CONSTANT INTEGER      := 4;',
'    AUTH_PASSWORD_FIRST_USE CONSTANT INTEGER      := 5;',
'    AUTH_ATTEMPTS_EXCEEDED  CONSTANT INTEGER      := 6;',
'    AUTH_INTERNAL_ERROR     CONSTANT INTEGER      := 7;',
'    l_password              VARCHAR2(4000);',
'    l_stored_password       VARCHAR2(4000);',
'  BEGIN',
'    -- First, check to see if the user is in the user table and have password',
'    BEGIN',
'      SELECT passwd',
'      INTO l_stored_password',
'      FROM blog_author',
'      WHERE user_name = p_username',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_UNKNOWN_USER);',
'      RETURN FALSE;',
'    END;',
'    -- Apply the custom hash function to the password',
'    l_password := blog_pw_hash(p_username, p_password);',
'    -- Compare them to see if they are the same and return either TRUE or FALSE',
'    IF l_password = l_stored_password THEN',
'      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_SUCCESS);',
'      RETURN TRUE;',
'    END IF;',
'    APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_PASSWORD_INCORRECT);',
'    RETURN FALSE;',
'  END login;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION check_password (',
'    p_username IN VARCHAR2,',
'    p_password IN VARCHAR2',
'  ) RETURN BOOLEAN',
'  AS',
'    l_password              VARCHAR2(4000);',
'    l_stored_password       VARCHAR2(4000);',
'  BEGIN',
'    -- First, check to see if the user is in the user table and have password',
'    BEGIN',
'      SELECT passwd',
'      INTO l_stored_password',
'      FROM blog_author',
'      WHERE user_name = p_username',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'      ;',
'    EXCEPTION WHEN NO_DATA_FOUND THEN',
'      RETURN FALSE;',
'    END;',
'    -- Apply the custom hash function to the password',
'    l_password := blog_pw_hash(p_username, p_password);',
'    -- Compare them to see if they are the same and return either TRUE or FALSE',
'    IF l_password = l_stored_password THEN',
'      RETURN TRUE;',
'    END IF;',
'    RETURN FALSE;',
'  END check_password;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE post_login',
'  AS',
'    l_app_user  VARCHAR2(255);',
'    l_author_id NUMBER;',
'    l_app_id    NUMBER;',
'    l_reader_id NUMBER;',
'  BEGIN',
'    l_app_user  := v(''APP_USER'');',
'    l_app_id    := nv(''APP_ID'');',
'    SELECT author_id',
'      INTO l_author_id',
'      FROM blog_author',
'     WHERE user_name = l_app_user',
'      AND active = ''Y''',
'      AND passwd IS NOT NULL',
'    ;',
'    blog_util.set_items_from_param(l_app_id);',
'    apex_util.set_session_state(''G_AUTHOR_ID'', l_author_id);',
'    apex_util.set_session_state(''G_DATE_TIME_FORMAT'', COALESCE(apex_util.get_preference(''DATE_TIME_FORMAT'', l_app_user), ''DD Mon YYYY HH24:MI:SS''));',
'    IF apex_util.get_preference(''SHOW_HELP'', l_app_user) IS NULL THEN',
'      apex_util.set_preference(',
'        p_preference => ''SHOW_HELP'',',
'        p_value => ''Y'',',
'        p_user => l_app_user',
'      );',
'    END IF;',
'    l_reader_id := nv(''G_BLOG_READER_APP_ID'');',
'    FOR c1 IN (',
'      SELECT alias',
'      FROM apex_applications',
'      WHERE application_id = l_reader_id',
'    ) LOOP',
'      apex_util.set_session_state(''G_BLOG_READER_APP_ALIAS'', c1.alias);',
'    END LOOP;',
'  END post_login;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  FUNCTION is_developer RETURN PLS_INTEGER',
'  AS',
'  BEGIN',
'    RETURN CASE WHEN apex_authorization.is_authorized(''IS_DEVELOPER'') THEN 1 ELSE 0 END;',
'  END ;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE get_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  OUT NOCOPY VARCHAR2,',
'    p_language_code         OUT NOCOPY VARCHAR2,',
'    p_message_text          OUT NOCOPY VARCHAR2,',
'    p_md5                   OUT NOCOPY VARCHAR2',
'   )',
'   AS',
'   BEGIN',
'    FOR c1 IN (',
'      SELECT translation_entry_id',
'        ,translatable_message',
'        ,language_code',
'        ,message_text',
'      FROM apex_application_translations',
'      WHERE application_id = p_application_id',
'        AND translation_entry_id = p_translation_entry_id',
'    ) LOOP',
'      p_translatable_message := c1.translatable_message;',
'      p_language_code := c1.language_code;',
'      p_message_text := c1.message_text;',
'      p_md5 := build_apex_lang_message_md5 (',
'          c1.translation_entry_id,',
'          c1.translatable_message,',
'          c1.language_code,',
'          c1.message_text ',
'      );',
'    END LOOP;',
'  END get_apex_lang_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'  PROCEDURE upd_apex_lang_message (',
'    p_application_id        IN NUMBER,',
'    p_translation_entry_id  IN NUMBER,',
'    p_translatable_message  IN VARCHAR2,',
'    p_language_code         IN VARCHAR2,',
'    p_message_text          IN VARCHAR2,',
'    p_md5                   IN VARCHAR2,',
'    p_success_message       OUT NOCOPY VARCHAR2',
'  )',
'  AS',
'    l_input_md5 varchar2(32676);',
'    l_table_md5 varchar2(32676);',
'  BEGIN',
'    l_input_md5 := build_apex_lang_message_md5 (',
'        p_translation_entry_id,',
'        p_translatable_message,',
'        p_language_code,',
'        p_message_text ',
'     );',
'    IF p_md5 IS NOT NULL THEN',
'      FOR c1 IN (',
'        SELECT translation_entry_id',
'          ,translatable_message',
'          ,language_code',
'          ,message_text',
'        FROM apex_application_translations',
'        WHERE application_id = p_application_id',
'        AND translation_entry_id = p_translation_entry_id',
'      ) LOOP',
'          l_table_md5 := build_apex_lang_message_md5 (',
'              c1.translation_entry_id,',
'              c1.translatable_message,',
'              c1.language_code,',
'              c1.message_text ',
'           );',
'      END LOOP;',
'    END IF;',
'    IF l_table_md5 != p_md5 THEN',
'      raise_application_error (-20001, apex_lang.message(''MSG_LOST_UPDATE'', l_table_md5, p_md5));',
'    ELSIF p_md5       IS NOT NULL',
'    AND   l_table_md5 IS NOT NULL',
'    AND   l_table_md5 = p_md5',
'    AND   l_input_md5 != p_md5',
'    THEN',
'      apex_lang.update_message(',
'        p_id => p_translation_entry_id,',
'        p_message_text => p_message_text',
'      );',
'      p_success_message := apex_lang.message(''MSG_ACTION_PROCESSED'');',
'    END IF;',
'  END upd_apex_lang_message;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'END "BLOG_ADMIN_APP";',
'/',
'',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890504188848947492)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'8 Trigger'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE TRIGGER blog_resource_trg before',
'INSERT OR',
'UPDATE ON blog_resource FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.link_id IS NULL THEN',
'      :NEW.link_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_resource_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_param_trg before',
'INSERT OR',
'UPDATE ON blog_param FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'     :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_param_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_long_text_trg before',
'INSERT OR',
'UPDATE ON blog_long_text FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_long_text_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_file_trg before',
' INSERT OR',
' UPDATE OR',
' DELETE ON blog_file FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.file_id IS NULL THEN',
'      :NEW.file_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'  IF deleting THEN',
'    INSERT INTO blog_http410(deleted_id, id_source)',
'    VALUES (:OLD.file_name, ''FILE'');',
'  ELSE',
'    :NEW.file_etag := :NEW.file_id || TO_CHAR(SYS_EXTRACT_UTC(CAST(:NEW.changed_on AS TIMESTAMP)), ''JHH24MISS'');',
'    :NEW.file_modified_since := TO_CHAR(SYS_EXTRACT_UTC(CAST(:NEW.changed_on AS TIMESTAMP)), ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'', ''NLS_DATE_LANGUAGE=ENGLISH'');',
'    :NEW.file_size := COALESCE(dbms_lob.getlength(:NEW.blob_content), 0);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_file_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_faq_trg before',
' INSERT OR',
' UPDATE ON blog_faq FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.faq_id IS NULL THEN',
'      :NEW.faq_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_faq_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_contact_message_trg before',
' INSERT OR',
' UPDATE ON blog_contact_message FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.contact_id IS NULL THEN',
'      :NEW.contact_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'   :NEW.changed_on := SYSDATE;',
'   :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_contact_message_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_comment_user_trg before',
' INSERT OR',
' UPDATE ON blog_comment_user FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.user_id IS NULL THEN',
'      :NEW.user_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'   :NEW.changed_on := SYSDATE;',
'   :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'  IF :NEW.blocked = ''Y'' THEN',
'    IF :NEW.blocked_on IS NULL THEN',
'      :NEW.blocked_on := SYSDATE;',
'    END IF;',
'  ELSE',
'    :NEW.blocked_on := NULL;',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_comment_user_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_comment_trg before',
' INSERT OR',
' UPDATE ON blog_comment FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.comment_id IS NULL THEN',
'      :NEW.comment_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'   :NEW.changed_on := SYSDATE;',
'   :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'  END IF;',
'',
'  IF :NEW.moderated = ''Y'' THEN',
'    IF :NEW.moderated_on IS NULL THEN',
'      :NEW.moderated_on := SYSDATE;',
'    END IF;',
'  ELSE',
'    :NEW.moderated_on := NULL;',
'  END IF;',
'  IF :NEW.notify_email_sent = ''Y'' THEN',
'    IF :NEW.notify_email_sent_on IS NULL THEN',
'      :NEW.notify_email_sent_on := SYSDATE;',
'    END IF;',
'  ELSE',
'    :NEW.notify_email_sent_on := NULL;',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_comment_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_comment_notify_trg before',
' INSERT OR',
' UPDATE ON blog_comment_notify FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'   END IF;',
'   IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_comment_notify_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_comment_block_trg before',
' INSERT OR',
' UPDATE ON blog_comment_block FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.block_id IS NULL THEN',
'      :NEW.block_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''), USER);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_comment_block_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_category_trg before',
'INSERT OR',
'UPDATE OR',
'DELETE ON blog_category FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.category_id IS NULL THEN',
'      :NEW.category_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'  IF deleting THEN',
'    INSERT INTO blog_http410(deleted_id, id_source)',
'    VALUES (to_char(:OLD.category_id), ''CATEGORY'');',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_category_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_author_trg before',
' INSERT OR',
' UPDATE OR',
' DELETE ON blog_author FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.author_id IS NULL THEN',
'    -- Author is inserted to users table as blocked.',
'    -- Posted by for comments can be then queried from one table.',
'    -- Also it prevent commenting using author email address.',
'      INSERT INTO blog_comment_user (email, nick_name, blocked, blocked_on, user_type)',
'      VALUES (:NEW.email, :NEW.author_name, ''Y'', SYSDATE, ''A'')',
'      RETURNING user_id INTO :NEW.author_id;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    UPDATE blog_comment_user',
'    SET nick_name = :NEW.author_name,',
'            email = :NEW.email',
'    WHERE user_id = :NEW.author_id;',
'  END IF;',
'  IF deleting THEN',
'    DELETE FROM blog_comment_user',
'    WHERE user_id = :OLD.author_id;',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_author_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_article_trg before',
'INSERT OR',
'UPDATE OR',
'DELETE ON blog_article FOR EACH row',
'BEGIN',
'  IF inserting THEN',
'    IF :NEW.article_id IS NULL THEN',
'      :NEW.article_id := blog_sgid;',
'    END IF;',
'    IF :NEW.created_by IS NULL THEN',
'      :NEW.created_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    IF :NEW.changed_by IS NULL THEN',
'      :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'    END IF;',
'    :NEW.year_month_num := TO_NUMBER(TO_CHAR(:NEW.created_on,''YYYYMM''));',
'  END IF;',
'  IF updating THEN',
'    :NEW.changed_on := SYSDATE;',
'    :NEW.changed_by := COALESCE(v(''APP_USER''),USER);',
'  END IF;',
'  IF deleting THEN',
'    INSERT INTO blog_http410(deleted_id, id_source)',
'    VALUES (to_char(:OLD.article_id), ''ARTICLE'');',
'  ELSE',
'    :NEW.article_length := COALESCE(dbms_lob.getlength(:NEW.article_text), 0);',
'  END IF;',
'END;',
'/',
'ALTER TRIGGER blog_article_trg ENABLE',
'/',
'',
'CREATE OR REPLACE TRIGGER blog_article_a_trg after',
'INSERT ON blog_article FOR EACH row',
'BEGIN',
'  INSERT INTO blog_article_log(article_id) VALUES(:NEW.article_id);',
'END;',
'/',
'ALTER TRIGGER blog_article_a_trg ENABLE',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890504385182949193)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'9 Parameter data'
,p_sequence=>90
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--REM INSERTING into BLOG_PARAM',
'--SET DEFINE OFF;',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''ADMIN_VERSION'',''N'',''Blog admin application version id'',''a2.9.0.2'',''Used on future releases for up'
||'grade. Only for developers.'',''TEXT'',''N'',''INTERNAL'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''ALLOW_COMMENT'',''Y'',''Allow comments'',''Y'',''If set to "<b>Yes</b>", readers can post comments to any'
||' article.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''BLOG_EMAIL'',''Y'',''Blog email'',''blog@example.com'',''Email address witch is used notification emails '
||'from field.'',''TEXT'',''Y'',''EMAIL'',''B'',''NOTIFICATION_EMAIL_ENABLED'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''COMMENT_VERIFY_QUESTION'',''Y'',''Show math question'',''Y'',''If set to "<b>Yes</b>", small math questio'
||'n is displayed in comment and contact page.<br/>This <b>might</b> prevent bots posting comments to articles.'',''YESNO'',''N'',''COMMENT'',''B'',''ALLOW_COMMENT'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''FACEBOOK_BTN_ENABLED'',''Y'',''Facebook like button'',''Y'',''If set to "<b>Yes</b>", Facebook like butto'
||'n is shown on article page.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''FILE_DOWNLOAD_ENABLED'',''Y'',''Allow file download'',''Y'',''If set to "<b>Yes</b>", access to file repo'
||'sitory URL for downloads is allowed.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_ARTICLE_ROWS'',''Y'',''Article per pagination'',''3'',''How many articles is shown per pagination e.g. '
||'in blog home page.'',''NUMBER'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_BASE_URL'',''Y'',''Canonical URL'',''http://vbox-apex/apex/'',''Canonical URL is useful to solve www an'
||'d non-www duplicate content where two URLs,<br/>identical except that one begins with "www" and other does not, point to the same page.'',''TEXT'',''N'',''SEO'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_BLOG_ADMIN_APP_ID'',''N'',''Blog admin application id'',''291'',''Only for developers.'',''NUMBER'',''N'',''I'
||'NTERNAL'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_BLOG_NAME'',''Y'',''Blog name'',''My Blog'',''Blog name displayed in blog reader.'',''TEXT'',''N'',''UI'',''B'','
||'null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_BLOG_READER_APP_ID'',''N'',''Blog reader application id'',''290'',''Only for developers.'',''NUMBER'',''N'','
||'''INTERNAL'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_COMMENT_ROWS'',''Y'',''Comments per pagination'',''10'',''How many comments is shown per pagination e.g'
||'. in blog article page.'',''NUMBER'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_DATE_FORMAT'',''Y'',''Date format'',''fmDD Mon YYYY'',''Blog reader date format used e.g. when article '
||'is posted.'',''TEXT'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_HTML_HEADER'',''Y'',''Extra HTML header attributes'',null,''You can enter e.g. extra meta tags and Ja'
||'vaScript for HTML header.<br/>Common use is place e.g. Google Analytic JavaScript and/or Google webmaster verification meta tag here.<br/><br/>All what you enter here are included to HTML header as is.<br/>For e.g. Google Analytic JavaScript include '
||'also &lt;script&gt; tags and Google webmaster verification place whole meta tag.'',''TEXTAREA'',''Y'',''SEO'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''GOOGLE_PLUS_ONE_BTN_ENABLED'',''Y'',''Google +1 button'',''Y'',''If set to "<b>Yes</b>", Google +1 button'
||' is shown on article page.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''GOOGLE_SHARE_BTN_ENABLED'',''Y'',''Google Share button'',''Y'',''If set to "<b>Yes</b>", Google Share but'
||'ton is shown on article page.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_RSS_FEED_URL'',''Y'',''RSS feed URL'',''http://vbox-apex/apex/f?p=BLOG:RSS'',''Blog RSS feed URL. Defau'
||'lt is &G_BASE_URL.f?p=&lt;blog application alias&gt;:RSS.<br/>Tip: You can "burn" blog feed in <a target="blank" href="http://feedburner.google.com">Feedburner</a> and use burned feed full URL here.'',''TEXT'',''Y'',''RSS'',''B'',''RSS_FEED_ENABLED'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''G_THEME_PATH'',''Y'',''Theme location'',''f?p=290:DOWNLOAD:0:'',''HTTP server folder where theme is locat'
||'ed.'',''TEXT'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''LOGGING_ENABLED'',''Y'',''Log activity'',''Y'',''If set to "<b>Yes</b>", new sessions, article access, ca'
||'tegory access and users search are logged.<br/>Setting this to "<b>No</b>" <u>may</u> increase performance.'',''YESNO'',''N'',''LOG'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''LOG_ROTATE_DAY'',''N'',''Rotate log after days'',''14'',''Logs rotate interval for application logs. This'
||' preference do not affect APEX engine logs.<br/>Currently only developer can change this attribute and it do affect only when blog is installed.<br/>Changing this already installed blog don''''t have any affect.'',''NUMBER'',''N'',''LOG'',''A'',''LOGGING_ENABLED'
||''');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''MODERATION_ENABLED'',''Y'',''Moderate comments'',''Y'',''If set to "<b>Yes</b>", all comments must be mod'
||'erated and approved by blog author(s).'',''YESNO'',''N'',''COMMENT'',''B'',''ALLOW_COMMENT'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''NOTIFICATION_EMAIL_ENABLED'',''Y'',''Send notification emails'',''Y'',''If set to "<b>Yes</b>", notificat'
||'ion emails are send when new comment is posted.<br/>Set to "<b>No</b>" if you do not have SMTP server configured.'',''YESNO'',''N'',''EMAIL'',''B'',''ALLOW_COMMENT'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''RATING_ENABLED'',''Y'',''Rate article'',''Y'',''If set to "<b>Yes</b>", rating is shown on article page a'
||'nd users can rate article.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''READER_VERSION'',''N'',''Blog reader application version id'',''r2.9.0.2'',''Used on future releases for '
||'upgrade. Only for developers.'',''TEXT'',''N'',''INTERNAL'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''RSS_FEED_ENABLED'',''Y'',''Publish RSS feed'',''Y'',''If set to "<b>Yes</b>", RSS fead is published on UR'
||'L &G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:RSS.<br/>Also RSS feed logo is shown in blog reader global page.'',''YESNO'',''N'',''RSS'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SCHEMA_VERSION'',''N'',''Blog engine version id'',''s2.9.0.2'',''Used on future releases for upgrade. Onl'
||'y for developers.'',''TEXT'',''N'',''INTERNAL'',''A'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_ABOUT_PAGE'',''Y'',''Show about page/tab'',''Y'',''If set to "<b>Yes</b>", about page can be accesse'
||'d from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_AUTHOR_PAGE'',''Y'',''Show authors tab/page'',''Y'',''If set to "<b>Yes</b>", authors page can be ac'
||'cessed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_BLOG_DESCRIPTION'',''Y'',''Show blog description'',''Y'',''If set to "<b>Yes</b>", blog description '
||'is visible in blog reader pages under blog name.'',''YESNO'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_BLOG_REPORT'',''Y'',''Show blogroll'',''Y'',''If set to "<b>Yes</b>", blogroll list is shown on blog'
||' reader resource page.'',''YESNO'',''N'',''AUTH'',''B'',''SHOW_RESOURCE_PAGE'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_CONTACT_PAGE'',''N'',''Show contact form tab/page'',''N'',''If set to "<b>Yes</b>", contact form pag'
||'e can be accessed from blog reader.<br/><br/>!!! DO NOT USE. FEATURE NOT IMPLEMENTED !!!'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_DISCLAIMER_PAGE'',''Y'',''Show disclaimer page/tab'',''Y'',''If set to "<b>Yes</b>", disclaimer page'
||' can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_FAQ_PAGE'',''Y'',''Show FAQ tab/page'',''Y'',''If set to "<b>Yes</b>", frequently asked questions (F'
||'AQ) page can be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_FILE_PAGE'',''Y'',''Show files tab/page'',''Y'',''If set to "<b>Yes</b>", files page can be accessed'
||' from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',''FILE_DOWNLOAD_ENABLED'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_FOOTER'',''Y'',''Show footer text'',''Y'',''If set to "<b>Yes</b>", footer text is shown in every bl'
||'og reader page.<br/>Foter text is maintained from settings -> messages (BLOG_READER_FOOTER).'',''YESNO'',''N'',''UI'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_PHOTOS_PAGE'',''Y'',''Show photos tab/page'',''Y'',''If set to "<b>Yes</b>", files page can be acces'
||'sed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',''FILE_DOWNLOAD_ENABLED'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_RESOURCE_PAGE'',''Y'',''Show resources page/tab'',''Y'',''If set to "<b>Yes</b>", resources page can'
||' be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_RESOURCE_REPORT'',''Y'',''Show useful links'',''Y'',''If set to "<b>Yes</b>", useful links list is s'
||'hown on blog reader resource page.'',''YESNO'',''N'',''AUTH'',''B'',''SHOW_RESOURCE_PAGE'');',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SHOW_VISITOR_PAGE'',''Y'',''Show visitor page/tab'',''Y'',''If set to "<b>Yes</b>", visitors map page can'
||' be accessed from blog reader.'',''YESNO'',''N'',''AUTH'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''SITEMAP_ENABLED'',''Y'',''Publish sitemap'',''Y'',''If set to "<b>Yes</b>", sitemap is published on URL &'
||'G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:SITEMAP.'',''YESNO'',''N'',''SEO'',''B'',null);',
'Insert into BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_USE_SKILL,PARAM_PARENT) values (''TWEET_BTN_ENABLED'',''Y'',''Twitter button'',''Y'',''If set to "<b>Yes</b>", Twitter button is shown on a'
||'rticle page.'',''YESNO'',''N'',''COMMENT'',''B'',null);',
'',
''))
);
end;
/
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39886632270278999577)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'10 Country data'
,p_sequence=>100
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--REM INSERTING into BLOG_COUNTRY',
'--SET DEFINE OFF;',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AA'',''Antartica'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AC'',''Antigua and Barbuda'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AD'',''Andorra'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AE'',''United Arab Emirates'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AF'',''Afghanistan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AG'',''Antigua and Barbuda'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AI'',''Anguilla'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AL'',''Albania'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AM'',''Armenia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AN'',''Netherlands Antilles'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AO'',''Angola'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AR'',''Argentina'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AS'',''American Samoa'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AT'',''Austria'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AU'',''Australia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AW'',''Aruba'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''AZ'',''Azerbaijan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BA'',''Bosnia and Herzegovina'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BB'',''Barbados'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BD'',''Bangladesh'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BE'',''Belgium'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BF'',''Burkina Faso'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BG'',''Bulgaria'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BH'',''Bahrain'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BI'',''Burundi'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BJ'',''Benin'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BM'',''Bermuda'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BN'',''Brunei'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BO'',''Bolivia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BR'',''Brazil'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BS'',''Bahamas, The'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BT'',''Bhutan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BV'',''Bouvet Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BW'',''Botswana'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BY'',''Belarus'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''BZ'',''Belize'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CA'',''Canada'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CC'',''Cocos (Keeling) Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CD'',''Zaire'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CF'',''Central African Republic'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CG'',''Congo'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CH'',''Switzerland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CI'',''Cote d''''Ivoire'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CK'',''Cook Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CL'',''Chile'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CM'',''Cameroon'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CN'',''China'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CO'',''Colombia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CR'',''Costa Rica'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CU'',''Cuba'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CV'',''Cape Verde'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CX'',''Christmas Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CY'',''Cyprus'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''CZ'',''Czech Republic'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DE'',''Germany'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DJ'',''Djibouti'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DK'',''Denmark'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DM'',''Dominica'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DO'',''Dominican Republic'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DQ'',''Jarvis Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''DZ'',''Algeria'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EC'',''Ecuador'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EE'',''Estonia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EG'',''Egypt'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''EH'',''Western Sahara'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ER'',''Eritrea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ES'',''Spain'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ET'',''Ethiopia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FI'',''Finland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FJ'',''Fiji'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FK'',''Falkland Islands (Islas Malvinas)'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FM'',''Federated States of Micronesia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FO'',''Faroe Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FQ'',''Baker Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''FR'',''France'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GA'',''Gabon'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GB'',''United Kingdom'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GD'',''Grenada'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GE'',''Georgia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GF'',''French Guiana'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GH'',''Ghana'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GI'',''Gibraltar'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GK'',''Guernsey'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GL'',''Greenland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GM'',''Gambia, The'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GN'',''Guinea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GO'',''Glorioso Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GP'',''Guadeloupe'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GQ'',''Equatorial Guinea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GR'',''Greece'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GS'',''South Georgia and the South Sandwich Is'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GT'',''Guatemala'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GU'',''Guam'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GW'',''Guinea-Bissau'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GY'',''Guyana'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''GZ'',''Gaza Strip'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HK'',''Hong Kong'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HM'',''Heard Island & McDonald Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HN'',''Honduras'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HQ'',''Howland Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HR'',''Croatia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HT'',''Haiti'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''HU'',''Hungary'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ID'',''Indonesia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IE'',''Ireland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IL'',''Israel'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IM'',''Man, Isle of'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IN'',''India'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IO'',''British Indian Ocean Territory'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IQ'',''Iraq'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IR'',''Iran'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IS'',''Iceland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IT'',''Italy'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''IV'',''Ivory Coast'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JE'',''Jersey'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JM'',''Jamaica'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JN'',''Jan Mayen'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JO'',''Jordan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JP'',''Japan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JQ'',''Johnston Atoll'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''JU'',''Juan De Nova Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KE'',''Kenya'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KG'',''Kyrgyzstan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KH'',''Cambodia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KI'',''Kiribati'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KM'',''Comoros'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KN'',''St. Kitts and Nevis'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KO'',''Kosovo'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KP'',''North Korea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KR'',''South Korea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KW'',''Kuwait'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KY'',''Cayman Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''KZ'',''Kazakhstan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LA'',''Laos'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LB'',''Lebanon'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LC'',''St. Lucia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LI'',''Liechtenstein'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LK'',''Sri Lanka'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LR'',''Liberia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LS'',''Lesotho'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LT'',''Lithuania'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LU'',''Luxembourg'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LV'',''Latvia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''LY'',''Libya'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MA'',''Morocco'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MC'',''Monaco'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MD'',''Moldova'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MG'',''Madagascar'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MH'',''Marshall Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MK'',''Macedonia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ML'',''Mali'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MM'',''Myanmar (Burma)'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MN'',''Mongolia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MO'',''Macau'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MP'',''Northern Mariana Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MQ'',''Martinique'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MR'',''Mauritania'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MS'',''Montserrat'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MT'',''Malta'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MU'',''Mauritius'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MV'',''Maldives'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MW'',''Malawi'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MX'',''Mexico'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MY'',''Malaysia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''MZ'',''Mozambique'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NA'',''Namibia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NC'',''New Caledonia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NE'',''Niger'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NF'',''Norfolk Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NG'',''Nigeria'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NI'',''Nicaragua'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NL'',''Netherlands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NO'',''Norway'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NP'',''Nepal'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NR'',''Nauru'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NU'',''Niue'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''NZ'',''New Zealand'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''OM'',''Oman'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PA'',''Panama'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PE'',''Peru'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PF'',''French Polynesia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PG'',''Papua New Guinea'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PH'',''Philippines'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PK'',''Pakistan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PL'',''Poland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PM'',''St. Pierre and Miquelon'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PN'',''Pitcairn Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PR'',''Puerto Rico'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PS'',''Occupied Palestinian Territory'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PT'',''Portugal'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PU'',''Palau'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PW'',''Pacific Islands (Palau)'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''PY'',''Paraguay'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''QA'',''Qatar'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RE'',''Reunion'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RO'',''Romania'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RS'',''Serbia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RU'',''Russia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''RW'',''Rwanda'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SA'',''Saudi Arabia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SB'',''Solomon Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SC'',''Seychelles'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SD'',''Sudan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SE'',''Sweden'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SG'',''Singapore'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SH'',''St. Helena'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SI'',''Slovenia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SJ'',''Svalbard'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SK'',''Slovakia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SL'',''Sierra Leone'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SM'',''San Marino'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SN'',''Senegal'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SO'',''Somalia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SR'',''Suriname'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ST'',''Sao Tome and Principe'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SV'',''El Salvador'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SY'',''Syria'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''SZ'',''Swaziland'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TC'',''Turks and Caicos Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TD'',''Chad'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TF'',''French Southern & Antarctic Lands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TG'',''Togo'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TH'',''Thailand'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TJ'',''Tajikistan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TK'',''Tokelau'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TM'',''Turkmenistan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TN'',''Tunisia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TO'',''Tonga'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TP'',''East Timor'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TR'',''Turkey'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TT'',''Trinidad and Tobago'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TV'',''Tuvalu'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TW'',''Taiwan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''TZ'',''Tanzania, United Republic of'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UA'',''Ukraine'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UG'',''Uganda'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UK'',''United Kingdom'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UM'',''United States Minor Outlying Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''US'',''United States'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UV'',''Burkina Faso'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UY'',''Uruguay'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''UZ'',''Uzbekistan'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VA'',''Vatican'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VC'',''St. Vincent and the Grenadines'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VE'',''Venezuela'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WE'',''West Bank'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WF'',''Wallis and Futuna'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VG'',''British Virgin Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VI'',''Virgin Islands'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VN'',''Vietnam'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WQ'',''Wake Island'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''WS'',''Western Samoa'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''VU'',''Vanuatu'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''XX'',''(Unknown)'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''YE'',''Yemen'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''YT'',''Mayotte'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''YU'',''Yugoslavia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZA'',''South Africa'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZM'',''Zambia'');',
'Insert into BLOG_COUNTRY (COUNTRY_CODE,COUNTRY_NAME) values (''ZW'',''Zimbabwe'');',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39886632466397001442)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'11 Insert admin'
,p_sequence=>110
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--REM INSERTING into BLOG_AUTHOR',
'--SET DEFINE OFF;',
'INSERT INTO blog_author(',
'email',
',user_name',
',passwd',
',author_name',
',author_seq',
',bio',
') VALUES (',
'''admin@bexample.org''',
',''ADMIN''',
',blog_pw_hash(''ADMIN'',''admin'')',
',''Administrator''',
',1',
',''<p>''',
'||''<span style="margin-left:40px">Blog Generic Administrator</span>''',
'|| ''<img alt="My Blog Administrator" src="#IMAGE_PREFIX#menu/student_bx_128x128.png" style="width:128px;height:128px;float:left" />''',
'|| ''</p>''',
');'))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39886632681912009374)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'12 Long text'
,p_sequence=>120
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--REM INSERTING into BLOG_LONG_TEXT',
'--SET DEFINE OFF;',
'Insert into BLOG_LONG_TEXT (LONG_TEXT_ID,LONG_TEXT_DESCRIPTION) values (''ABOUT'',''About page text'');',
'Insert into BLOG_LONG_TEXT (LONG_TEXT_ID,LONG_TEXT_DESCRIPTION) values (''DISCLAIMER'',''Blog site disclaimer'');',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39886632877599011432)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'13 Foreign key'
,p_sequence=>130
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'ALTER TABLE  BLOG_ARTICLE ADD CONSTRAINT BLOG_ARTICLE_FK1 FOREIGN KEY (AUTHOR_ID)',
'      REFERENCES  BLOG_AUTHOR (AUTHOR_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_ARTICLE ADD CONSTRAINT BLOG_ARTICLE_FK2 FOREIGN KEY (CATEGORY_ID)',
'      REFERENCES  BLOG_CATEGORY (CATEGORY_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_ARTICLE_LOG ADD CONSTRAINT BLOG_ARTICLE_LOG_FK1 FOREIGN KEY (ARTICLE_ID)',
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ON DELETE CASCADE ENABLE',
'/',
'ALTER TABLE  BLOG_AUTHOR ADD CONSTRAINT BLOG_AUTHOR_FK1 FOREIGN KEY (AUTHOR_ID)',
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_CATEGORY_LOG ADD CONSTRAINT BLOG_CATEGORY_LOG_FK1 FOREIGN KEY (CATEGORY_ID)',
'      REFERENCES  BLOG_CATEGORY (CATEGORY_ID) ON DELETE CASCADE ENABLE',
'/',
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK1 FOREIGN KEY (USER_ID)',
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK2 FOREIGN KEY (ARTICLE_ID)',
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_COMMENT ADD CONSTRAINT BLOG_COMMENT_FK3 FOREIGN KEY (PARENT_ID)',
'      REFERENCES  BLOG_COMMENT (COMMENT_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_COMMENT_NOTIFY ADD CONSTRAINT BLOG_COMMENT_NOTIFY_FK1 FOREIGN KEY (ARTICLE_ID)',
'      REFERENCES  BLOG_ARTICLE (ARTICLE_ID) ON DELETE CASCADE ENABLE',
'/',
'ALTER TABLE  BLOG_COMMENT_NOTIFY ADD CONSTRAINT BLOG_COMMENT_NOTIFY_FK2 FOREIGN KEY (USER_ID)',
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ON DELETE CASCADE DISABLE',
'/',
'ALTER TABLE  BLOG_CONTACT_MESSAGE ADD CONSTRAINT BLOG_CONTACT_MESSAGE_FK1 FOREIGN KEY (USER_ID)',
'      REFERENCES  BLOG_COMMENT_USER (USER_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_FILE_LOG ADD CONSTRAINT BLOG_FILES_LOG_FK1 FOREIGN KEY (FILE_ID)',
'      REFERENCES  BLOG_FILE (FILE_ID) ON DELETE CASCADE ENABLE',
'/',
'ALTER TABLE  BLOG_PARAM ADD CONSTRAINT BLOG_PARAM_FK1 FOREIGN KEY (PARAM_PARENT)',
'      REFERENCES  BLOG_PARAM (PARAM_ID) ENABLE',
'/',
'ALTER TABLE  BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_FK1 FOREIGN KEY (PARAM_ID)',
'      REFERENCES  BLOG_PARAM (PARAM_ID) ENABLE',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'14 theme files'
,p_sequence=>140
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'--REM INSERTING into BLOG_FILE',
'--SET DEFINE OFF;',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000000C0000000C080600000056755CE70000001974455874536F6674776172650041646F626520496D616765526561647971C9653C000000C44944415478DA8C525B0E82400CAC84841B704237FCBB07104D0CFF7CF8889E901BF0D1A9B44B5724'
||'C630C9A6C0CCF44177D79E2F6D5D'';',
'blog_install.i(2) := ''D7C7AAAAE81FC671A461184E74BD3F652B545B7A660648180401755D67DF628C0466E334AAB6F0928224C6141D808B13A7283F6412F3C2C0ACEF6CC918F26DF03696E8FB3E3F87102C16B411DE6AAE100FD1CA2BE1999BA6C96DBA21576049621D703D97D859CDA0421D52F0DB00990DBA41'
||'DF432299F6D380B693F9574F3BB3'';',
'blog_install.i(3) := ''A3DA52D77D7BBC365F8DB70003009EFAE4113CFD5CBC0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''add-small.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''2F2A2A0D0A202A2053796E746178486967686C6967687465720D0A202A20687474703A2F2F616C6578676F72626174636865762E636F6D2F53796E746178486967686C6967687465720D0A202A2053796E746178486967686C69676874657220697320646F6E6174696F6E776172652E2049'
||'6620796F7520617265207573696E'';',
'blog_install.i(2) := ''672069742C20706C6561736520646F6E6174652E0D0A202A20687474703A2F2F616C6578676F72626174636865762E636F6D2F53796E746178486967686C6967687465722F646F6E6174652E68746D6C0D0A202A0D0A202A204076657273696F6E0D0A202A20332E302E383320284A756C79'
||'2030322032303130290D0A202A20'';',
'blog_install.i(3) := ''0D0A202A2040636F707972696768740D0A202A20436F707972696768742028432920323030342D3230313020416C657820476F72626174636865762E0D0A202A0D0A202A20406C6963656E73650D0A202A204475616C206C6963656E73656420756E64657220746865204D495420616E6420'
||'47504C206C6963656E7365732E0D'';',
'blog_install.i(4) := ''0A202A2F0D0A76617220585265674578703B69662858526567457870297468726F77204572726F72282263616E2774206C6F6164205852656745787020747769636520696E207468652073616D65206672616D6522293B2866756E6374696F6E2865297B66756E6374696F6E206328652C74'
||'297B69662821585265674578702E'';',
'blog_install.i(5) := ''6973526567457870286529297468726F7720547970654572726F722822747970652052656745787020657870656374656422293B766172206E3D652E5F787265676578703B72657475726E20653D5852656745787028652E736F757263652C682865292B28747C7C222229292C6E26262865'
||'2E5F787265676578703D7B736F75'';',
'blog_install.i(6) := ''7263653A6E2E736F757263652C636170747572654E616D65733A6E2E636170747572654E616D65733F6E2E636170747572654E616D65732E736C6963652830293A6E756C6C7D292C657D66756E6374696F6E20682865297B72657475726E28652E676C6F62616C3F2267223A2222292B2865'
||'2E69676E6F7265436173653F2269'';',
'blog_install.i(7) := ''223A2222292B28652E6D756C74696C696E653F226D223A2222292B28652E657874656E6465643F2278223A2222292B28652E737469636B793F2279223A2222297D66756E6374696F6E207028652C742C6E2C72297B766172206F3D732E6C656E6774682C752C612C663B693D21303B747279'
||'7B7768696C65286F2D2D297B663D'';',
'blog_install.i(8) := ''735B6F5D3B6966286E26662E73636F706526262821662E747269676765727C7C662E747269676765722E63616C6C28722929297B662E7061747465726E2E6C617374496E6465783D742C613D662E7061747465726E2E657865632865293B696628612626612E696E6465783D3D3D74297B75'
||'3D7B6F75747075743A662E68616E'';',
'blog_install.i(9) := ''646C65722E63616C6C28722C612C6E292C6D617463683A617D3B627265616B7D7D7D7D6361746368286C297B7468726F77206C7D66696E616C6C797B693D21317D72657475726E20757D66756E6374696F6E206428652C742C6E297B69662841727261792E70726F746F747970652E696E64'
||'65784F662972657475726E20652E'';',
'blog_install.i(10) := ''696E6465784F6628742C6E293B666F722876617220723D6E7C7C303B723C652E6C656E6774683B722B2B29696628655B725D3D3D3D742972657475726E20723B72657475726E2D317D585265674578703D66756E6374696F6E28742C72297B76617220733D5B5D2C753D585265674578702'
||'E4F5554534944455F434C4153532C'';',
'blog_install.i(11) := ''613D302C662C682C642C762C6D3B696628585265674578702E6973526567457870287429297B69662872213D3D65297468726F7720547970654572726F72282263616E277420737570706C7920666C616773207768656E20636F6E737472756374696E67206F6E652052656745787020667'
||'26F6D20616E6F7468657222293B72'';',
'blog_install.i(12) := ''657475726E20632874297D69662869297468726F77204572726F72282263616E27742063616C6C20746865205852656745787020636F6E7374727563746F722077697468696E20746F6B656E20646566696E6974696F6E2066756E6374696F6E7322293B723D727C7C22222C663D7B68617'
||'34E616D6564436170747572653A21'';',
'blog_install.i(13) := ''312C636170747572654E616D65733A5B5D2C686173466C61673A66756E6374696F6E2865297B72657475726E20722E696E6465784F662865293E2D317D2C736574466C61673A66756E6374696F6E2865297B722B3D657D7D3B7768696C6528613C742E6C656E67746829683D7028742C612'
||'C752C66292C683F28732E70757368'';',
'blog_install.i(14) := ''28682E6F7574707574292C612B3D682E6D617463685B305D2E6C656E6774687C7C31293A28643D6F2E657865632E63616C6C286C5B755D2C742E736C69636528612929293F28732E7075736828645B305D292C612B3D645B305D2E6C656E677468293A28763D742E6368617241742861292'
||'C763D3D3D225B223F753D58526567'';',
'blog_install.i(15) := ''4578702E494E534944455F434C4153533A763D3D3D225D22262628753D585265674578702E4F5554534944455F434C415353292C732E707573682876292C612B2B293B72657475726E206D3D52656745787028732E6A6F696E282222292C6F2E7265706C6163652E63616C6C28722C6E2C2'
||'22229292C6D2E5F78726567657870'';',
'blog_install.i(16) := ''3D7B736F757263653A742C636170747572654E616D65733A662E6861734E616D6564436170747572653F662E636170747572654E616D65733A6E756C6C7D2C6D7D2C585265674578702E76657273696F6E3D22312E352E31222C585265674578702E494E534944455F434C4153533D312C5'
||'85265674578702E4F555453494445'';',
'blog_install.i(17) := ''5F434C4153533D323B76617220743D2F5C24283F3A285C645C643F7C5B242660275D297C7B285B245C775D2B297D292F672C6E3D2F5B5E67696D795D2B7C285B5C735C535D29283F3D5B5C735C535D2A5C31292F672C723D2F5E283F3A5B3F2A2B5D7C7B5C642B283F3A2C5C642A293F7D2'
||'95C3F3F2F2C693D21312C733D5B5D'';',
'blog_install.i(18) := ''2C6F3D7B657865633A5265674578702E70726F746F747970652E657865632C746573743A5265674578702E70726F746F747970652E746573742C6D617463683A537472696E672E70726F746F747970652E6D617463682C7265706C6163653A537472696E672E70726F746F747970652E726'
||'5706C6163652C73706C69743A5374'';',
'blog_install.i(19) := ''72696E672E70726F746F747970652E73706C69747D2C753D6F2E657865632E63616C6C282F28293F3F2F2C2222295B315D3D3D3D652C613D66756E6374696F6E28297B76617220653D2F5E2F673B72657475726E206F2E746573742E63616C6C28652C2222292C21652E6C617374496E646'
||'5787D28292C663D5265674578702E'';',
'blog_install.i(20) := ''70726F746F747970652E737469636B79213D3D652C6C3D7B7D3B6C5B585265674578702E494E534944455F434C4153535D3D2F5E283F3A5C5C283F3A5B302D335D5B302D375D7B302C327D7C5B342D375D5B302D375D3F7C785B5C64412D46612D665D7B327D7C755B5C64412D46612D665'
||'D7B347D7C635B412D5A612D7A5D7C'';',
'blog_install.i(21) := ''5B5C735C535D29292F2C6C5B585265674578702E4F5554534944455F434C4153535D3D2F5E283F3A5C5C283F3A30283F3A5B302D335D5B302D375D7B302C327D7C5B342D375D5B302D375D3F293F7C5B312D395D5C642A7C785B5C64412D46612D665D7B327D7C755B5C64412D46612D665'
||'D7B347D7C635B412D5A612D7A5D7C'';',
'blog_install.i(22) := ''5B5C735C535D297C5C285C3F5B3A3D215D7C5B3F2A2B5D5C3F7C7B5C642B283F3A2C5C642A293F7D5C3F3F292F2C585265674578702E616464546F6B656E3D66756E6374696F6E28652C742C6E2C72297B732E70757368287B7061747465726E3A6328652C2267222B28663F2279223A222'
||'229292C68616E646C65723A742C73'';',
'blog_install.i(23) := ''636F70653A6E7C7C585265674578702E4F5554534944455F434C4153532C747269676765723A727C7C6E756C6C7D297D2C585265674578702E63616368653D66756E6374696F6E28652C74297B766172206E3D652B222F222B28747C7C2222293B72657475726E20585265674578702E636'
||'16368655B6E5D7C7C285852656745'';',
'blog_install.i(24) := ''78702E63616368655B6E5D3D5852656745787028652C7429297D2C585265674578702E636F70794173476C6F62616C3D66756E6374696F6E2865297B72657475726E206328652C226722297D2C585265674578702E6573636170653D66756E6374696F6E2865297B72657475726E20652E7'
||'265706C616365282F5B2D5B5C5D7B'';',
'blog_install.i(25) := ''7D28292A2B3F2E2C5C5C5E247C235C735D2F672C225C5C242622297D2C585265674578702E6578656341743D66756E6374696F6E28652C742C6E2C72297B76617220693D6328742C2267222B28722626663F2279223A222229292C733B72657475726E20692E6C617374496E6465783D6E3'
||'D6E7C7C302C733D692E6578656328'';',
'blog_install.i(26) := ''65292C722626732626732E696E646578213D3D6E262628733D6E756C6C292C742E676C6F62616C262628742E6C617374496E6465783D733F692E6C617374496E6465783A30292C737D2C585265674578702E667265657A65546F6B656E733D66756E6374696F6E28297B585265674578702'
||'E616464546F6B656E3D66756E6374'';',
'blog_install.i(27) := ''696F6E28297B7468726F77204572726F72282263616E27742072756E20616464546F6B656E20616674657220667265657A65546F6B656E7322297D7D2C585265674578702E69735265674578703D66756E6374696F6E2865297B72657475726E204F626A6563742E70726F746F747970652'
||'E746F537472696E672E63616C6C28'';',
'blog_install.i(28) := ''65293D3D3D225B6F626A656374205265674578705D227D2C585265674578702E697465726174653D66756E6374696F6E28652C742C6E2C72297B76617220693D6328742C226722292C733D2D312C6F3B7768696C65286F3D692E6578656328652929742E676C6F62616C262628742E6C617'
||'374496E6465783D692E6C61737449'';',
'blog_install.i(29) := ''6E646578292C6E2E63616C6C28722C6F2C2B2B732C652C74292C692E6C617374496E6465783D3D3D6F2E696E6465782626692E6C617374496E6465782B2B3B742E676C6F62616C262628742E6C617374496E6465783D30297D2C585265674578702E6D61746368436861696E3D66756E637'
||'4696F6E28652C74297B7265747572'';',
'blog_install.i(30) := ''6E2066756E6374696F6E206E28652C72297B76617220693D745B725D2E72656765783F745B725D3A7B72656765783A745B725D7D2C733D6328692E72656765782C226722292C6F3D5B5D2C753B666F7228753D303B753C652E6C656E6774683B752B2B29585265674578702E69746572617'
||'46528655B755D2C732C66756E6374'';',
'blog_install.i(31) := ''696F6E2865297B6F2E7075736828692E6261636B7265663F655B692E6261636B7265665D7C7C22223A655B305D297D293B72657475726E20723D3D3D742E6C656E6774682D317C7C216F2E6C656E6774683F6F3A6E286F2C722B31297D285B655D2C30297D2C5265674578702E70726F746'
||'F747970652E6170706C793D66756E'';',
'blog_install.i(32) := ''6374696F6E28652C74297B72657475726E20746869732E6578656328745B305D297D2C5265674578702E70726F746F747970652E63616C6C3D66756E6374696F6E28652C74297B72657475726E20746869732E657865632874297D2C5265674578702E70726F746F747970652E657865633'
||'D66756E6374696F6E2874297B7661'';',
'blog_install.i(33) := ''72206E2C722C692C733B746869732E676C6F62616C7C7C28733D746869732E6C617374496E646578292C6E3D6F2E657865632E6170706C7928746869732C617267756D656E7473293B6966286E297B217526266E2E6C656E6774683E31262664286E2C2222293E2D31262628693D5265674'
||'5787028746869732E736F75726365'';',
'blog_install.i(34) := ''2C6F2E7265706C6163652E63616C6C28682874686973292C2267222C222229292C6F2E7265706C6163652E63616C6C2828742B2222292E736C696365286E2E696E646578292C692C66756E6374696F6E28297B666F722876617220743D313B743C617267756D656E74732E6C656E6774682'
||'D323B742B2B29617267756D656E74'';',
'blog_install.i(35) := ''735B745D3D3D3D652626286E5B745D3D65297D29293B696628746869732E5F787265676578702626746869732E5F787265676578702E636170747572654E616D657329666F722876617220663D313B663C6E2E6C656E6774683B662B2B29723D746869732E5F787265676578702E6361707'
||'47572654E616D65735B662D315D2C'';',
'blog_install.i(36) := ''722626286E5B725D3D6E5B665D293B21612626746869732E676C6F62616C2626216E5B305D2E6C656E6774682626746869732E6C617374496E6465783E6E2E696E6465782626746869732E6C617374496E6465782D2D7D72657475726E20746869732E676C6F62616C7C7C28746869732E6'
||'C617374496E6465783D73292C6E7D'';',
'blog_install.i(37) := ''2C5265674578702E70726F746F747970652E746573743D66756E6374696F6E2865297B76617220742C6E3B72657475726E20746869732E676C6F62616C7C7C286E3D746869732E6C617374496E646578292C743D6F2E657865632E63616C6C28746869732C65292C7426262161262674686'
||'9732E676C6F62616C262621745B30'';',
'blog_install.i(38) := ''5D2E6C656E6774682626746869732E6C617374496E6465783E742E696E6465782626746869732E6C617374496E6465782D2D2C746869732E676C6F62616C7C7C28746869732E6C617374496E6465783D6E292C2121747D2C537472696E672E70726F746F747970652E6D617463683D66756'
||'E6374696F6E2865297B5852656745'';',
'blog_install.i(39) := ''78702E69735265674578702865297C7C28653D526567457870286529293B696628652E676C6F62616C297B76617220743D6F2E6D617463682E6170706C7928746869732C617267756D656E7473293B72657475726E20652E6C617374496E6465783D302C747D72657475726E20652E65786'
||'5632874686973297D2C537472696E'';',
'blog_install.i(40) := ''672E70726F746F747970652E7265706C6163653D66756E6374696F6E28652C6E297B76617220723D585265674578702E69735265674578702865292C692C732C752C613B72657475726E20723F28652E5F78726567657870262628693D652E5F787265676578702E636170747572654E616'
||'D6573292C652E676C6F62616C7C7C'';',
'blog_install.i(41) := ''28613D652E6C617374496E64657829293A652B3D22222C4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C286E293D3D3D225B6F626A6563742046756E6374696F6E5D223F733D6F2E7265706C6163652E63616C6C28746869732B22222C652C66756E6374696F6'
||'E28297B69662869297B617267756D'';',
'blog_install.i(42) := ''656E74735B305D3D6E657720537472696E6728617267756D656E74735B305D293B666F722876617220743D303B743C692E6C656E6774683B742B2B29695B745D262628617267756D656E74735B305D5B695B745D5D3D617267756D656E74735B742B315D297D72657475726E20722626652'
||'E676C6F62616C262628652E6C6173'';',
'blog_install.i(43) := ''74496E6465783D617267756D656E74735B617267756D656E74732E6C656E6774682D325D2B617267756D656E74735B305D2E6C656E677468292C6E2E6170706C79286E756C6C2C617267756D656E7473297D293A28753D746869732B22222C733D6F2E7265706C6163652E63616C6C28752'
||'C652C66756E6374696F6E28297B76'';',
'blog_install.i(44) := ''617220653D617267756D656E74733B72657475726E206F2E7265706C6163652E63616C6C286E2B22222C742C66756E6374696F6E28742C6E2C72297B696628216E297B766172206F3D2B723B72657475726E206F3C3D652E6C656E6774682D333F655B6F5D3A286F3D693F6428692C72293'
||'A2D312C6F3E2D313F655B6F2B315D'';',
'blog_install.i(45) := ''3A74297D737769746368286E297B636173652224223A72657475726E2224223B636173652226223A72657475726E20655B305D3B636173652260223A72657475726E20655B652E6C656E6774682D315D2E736C69636528302C655B652E6C656E6774682D325D293B636173652227223A726'
||'57475726E20655B652E6C656E6774'';',
'blog_install.i(46) := ''682D315D2E736C69636528655B652E6C656E6774682D325D2B655B305D2E6C656E677468293B64656661756C743A76617220733D22223B6E3D2B6E3B696628216E2972657475726E20743B7768696C65286E3E652E6C656E6774682D3329733D537472696E672E70726F746F747970652E7'
||'36C6963652E63616C6C286E2C2D31'';',
'blog_install.i(47) := ''292B732C6E3D4D6174682E666C6F6F72286E2F3130293B72657475726E286E3F655B6E5D7C7C22223A222422292B737D7D297D29292C72262628652E676C6F62616C3F652E6C617374496E6465783D303A652E6C617374496E6465783D61292C737D2C537472696E672E70726F746F74797'
||'0652E73706C69743D66756E637469'';',
'blog_install.i(48) := ''6F6E28742C6E297B69662821585265674578702E69735265674578702874292972657475726E206F2E73706C69742E6170706C7928746869732C617267756D656E7473293B76617220723D746869732B22222C693D5B5D2C733D302C752C613B6966286E3D3D3D657C7C2B6E3C30296E3D4'
||'96E66696E6974793B656C73657B6E'';',
'blog_install.i(49) := ''3D4D6174682E666C6F6F72282B6E293B696628216E2972657475726E5B5D7D743D585265674578702E636F70794173476C6F62616C2874293B7768696C6528753D742E65786563287229297B696628742E6C617374496E6465783E73297B692E7075736828722E736C69636528732C752E6'
||'96E64657829292C752E6C656E6774'';',
'blog_install.i(50) := ''683E312626752E696E6465783C722E6C656E677468262641727261792E70726F746F747970652E707573682E6170706C7928692C752E736C696365283129292C613D755B305D2E6C656E6774682C733D742E6C617374496E6465783B696628692E6C656E6774683E3D6E29627265616B7D7'
||'42E6C617374496E6465783D3D3D75'';',
'blog_install.i(51) := ''2E696E6465782626742E6C617374496E6465782B2B7D72657475726E20733D3D3D722E6C656E6774683F28216F2E746573742E63616C6C28742C2222297C7C61292626692E70757368282222293A692E7075736828722E736C696365287329292C692E6C656E6774683E6E3F692E736C696'
||'36528302C6E293A697D2C58526567'';',
'blog_install.i(52) := ''4578702E616464546F6B656E282F5C285C3F235B5E295D2A5C292F2C66756E6374696F6E2865297B72657475726E206F2E746573742E63616C6C28722C652E696E7075742E736C69636528652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A29227D292C585265674'
||'578702E616464546F6B656E282F5C'';',
'blog_install.i(53) := ''28283F215C3F292F2C66756E6374696F6E28297B72657475726E20746869732E636170747572654E616D65732E70757368286E756C6C292C2228227D292C585265674578702E616464546F6B656E282F5C285C3F3C285B245C775D2B293E2F2C66756E6374696F6E2865297B72657475726'
||'E20746869732E636170747572654E'';',
'blog_install.i(54) := ''616D65732E7075736828655B315D292C746869732E6861734E616D6564436170747572653D21302C2228227D292C585265674578702E616464546F6B656E282F5C5C6B3C285B5C77245D2B293E2F2C66756E6374696F6E2865297B76617220743D6428746869732E636170747572654E616'
||'D65732C655B315D293B7265747572'';',
'blog_install.i(55) := ''6E20743E2D313F225C5C222B28742B31292B2869734E614E28652E696E7075742E63686172417428652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A2922293A655B305D7D292C585265674578702E616464546F6B656E282F5C5B5C5E3F5D2F2C66756E6374696F6'
||'E2865297B72657475726E20655B30'';',
'blog_install.i(56) := ''5D3D3D3D225B5D223F225C5C625C5C42223A225B5C5C735C5C535D227D292C585265674578702E616464546F6B656E282F5E5C285C3F285B696D73785D2B295C292F2C66756E6374696F6E2865297B72657475726E20746869732E736574466C616728655B315D292C22227D292C5852656'
||'74578702E616464546F6B656E282F'';',
'blog_install.i(57) := ''283F3A5C732B7C232E2A292B2F2C66756E6374696F6E2865297B72657475726E206F2E746573742E63616C6C28722C652E696E7075742E736C69636528652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A29227D2C585265674578702E4F5554534944455F434C415'
||'3532C66756E6374696F6E28297B72'';',
'blog_install.i(58) := ''657475726E20746869732E686173466C616728227822297D292C585265674578702E616464546F6B656E282F5C2E2F2C66756E6374696F6E28297B72657475726E225B5C5C735C5C535D227D2C585265674578702E4F5554534944455F434C4153532C66756E6374696F6E28297B7265747'
||'5726E20746869732E686173466C61'';',
'blog_install.i(59) := ''6728227322297D297D2928293B696628747970656F662053796E746178486967686C6967687465723D3D22756E646566696E656422297661722053796E746178486967686C6967687465723D66756E6374696F6E28297B66756E6374696F6E207428652C74297B72657475726E20652E636'
||'C6173734E616D652E696E6465784F'';',
'blog_install.i(60) := ''66287429213D2D317D66756E6374696F6E206E28652C6E297B7428652C6E297C7C28652E636C6173734E616D652B3D2220222B6E297D66756E6374696F6E207228652C74297B652E636C6173734E616D653D652E636C6173734E616D652E7265706C61636528742C2222297D66756E63746'
||'96F6E20692865297B76617220743D'';',
'blog_install.i(61) := ''5B5D3B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29742E7075736828655B6E5D293B72657475726E20747D66756E6374696F6E20732865297B72657475726E20652E73706C6974282F5C723F5C6E2F297D66756E6374696F6E206F2865297B76617220743D2268696'
||'7686C6967687465725F223B726574'';',
'blog_install.i(62) := ''75726E20652E696E6465784F662874293D3D303F653A742B657D66756E6374696F6E20752874297B72657475726E20652E766172732E686967686C696768746572735B6F2874295D7D66756E6374696F6E20612865297B72657475726E20646F63756D656E742E676574456C656D656E744'
||'2794964286F286529297D66756E63'';',
'blog_install.i(63) := ''74696F6E20662874297B652E766172732E686967686C696768746572735B6F28742E6964295D3D747D66756E6374696F6E206C28652C742C6E297B696628653D3D6E756C6C2972657475726E206E756C6C3B76617220723D6E213D313F652E6368696C644E6F6465733A5B652E706172656'
||'E744E6F64655D2C693D7B2223223A'';',
'blog_install.i(64) := ''226964222C222E223A22636C6173734E616D65227D5B742E73756273747228302C31295D7C7C226E6F64654E616D65222C732C6F3B733D69213D226E6F64654E616D65223F742E7375627374722831293A742E746F55707065724361736528293B69662828655B695D7C7C2222292E696E6'
||'465784F66287329213D2D31297265'';',
'blog_install.i(65) := ''7475726E20653B666F722876617220753D303B722626753C722E6C656E67746826266F3D3D6E756C6C3B752B2B296F3D6C28725B755D2C742C6E293B72657475726E206F7D66756E6374696F6E206328652C74297B72657475726E206C28652C742C2130297D66756E6374696F6E2068286'
||'52C742C6E297B6E3D4D6174682E6D'';',
'blog_install.i(66) := ''6178286E7C7C302C30293B666F722876617220723D6E3B723C652E6C656E6774683B722B2B29696628655B725D3D3D742972657475726E20723B72657475726E2D317D66756E6374696F6E20702865297B72657475726E28657C7C2222292B4D6174682E726F756E64284D6174682E72616'
||'E646F6D28292A316536292E746F53'';',
'blog_install.i(67) := ''7472696E6728297D66756E6374696F6E206428652C74297B766172206E3D7B7D2C723B666F72287220696E2065296E5B725D3D655B725D3B666F72287220696E2074296E5B725D3D745B725D3B72657475726E206E7D66756E6374696F6E20762865297B76617220743D7B2274727565223'
||'A21302C2266616C7365223A21317D'';',
'blog_install.i(68) := ''5B655D3B72657475726E20743D3D6E756C6C3F653A747D66756E6374696F6E206D28652C742C6E2C722C69297B76617220733D2873637265656E2E77696474682D6E292F322C6F3D2873637265656E2E6865696768742D72292F323B692B3D222C206C6566743D222B732B222C20746F703'
||'D222B6F2B222C2077696474683D22'';',
'blog_install.i(69) := ''2B6E2B222C206865696768743D222B722C693D692E7265706C616365282F5E2C2F2C2222293B76617220753D77696E646F772E6F70656E28652C742C69293B72657475726E20752E666F63757328292C757D66756E6374696F6E206728652C742C6E2C72297B66756E6374696F6E2069286'
||'5297B653D657C7C77696E646F772E'';',
'blog_install.i(70) := ''6576656E742C652E7461726765747C7C28652E7461726765743D652E737263456C656D656E742C652E70726576656E7444656661756C743D66756E6374696F6E28297B746869732E72657475726E56616C75653D21317D292C6E2E63616C6C28727C7C77696E646F772C65297D652E61747'
||'46163684576656E743F652E617474'';',
'blog_install.i(71) := ''6163684576656E7428226F6E222B742C69293A652E6164644576656E744C697374656E657228742C692C2131297D66756E6374696F6E20792874297B77696E646F772E616C65727428652E636F6E6669672E737472696E67732E616C6572742B74297D66756E6374696F6E206228742C6E2'
||'97B76617220723D652E766172732E'';',
'blog_install.i(72) := ''646973636F7665726564427275736865732C693D6E756C6C3B696628723D3D6E756C6C297B723D7B7D3B666F7228766172207320696E20652E62727573686573297B766172206F3D652E627275736865735B735D2C753D6F2E616C69617365733B696628753D3D6E756C6C29636F6E74696'
||'E75653B6F2E62727573684E616D65'';',
'blog_install.i(73) := ''3D732E746F4C6F7765724361736528293B666F722876617220613D303B613C752E6C656E6774683B612B2B29725B755B615D5D3D737D652E766172732E646973636F7665726564427275736865733D727D72657475726E20693D652E627275736865735B725B745D5D2C693D3D6E756C6C2'
||'6266E26267928652E636F6E666967'';',
'blog_install.i(74) := ''2E737472696E67732E6E6F42727573682B74292C697D66756E6374696F6E207728652C74297B766172206E3D732865293B666F722876617220723D303B723C6E2E6C656E6774683B722B2B296E5B725D3D74286E5B725D2C72293B72657475726E206E2E6A6F696E28225C725C6E22297D6'
||'6756E6374696F6E20452865297B72'';',
'blog_install.i(75) := ''657475726E20652E7265706C616365282F5E5B205D2A5B5C6E5D2B7C5B5C6E5D2A5B205D2A242F672C2222297D66756E6374696F6E20532865297B76617220742C6E3D7B7D2C723D6E6577205852656745787028225E5C5C5B283F3C76616C7565733E282E2A3F29295C5C5D2422292C693'
||'D6E65772058526567457870282228'';',
'blog_install.i(76) := ''3F3C6E616D653E5B5C5C772D5D2B295C5C732A3A5C5C732A283F3C76616C75653E5B5C5C772D25235D2B7C5C5C5B2E2A3F5C5C5D7C5C222E2A3F5C227C272E2A3F27295C5C732A3B3F222C226722293B7768696C652828743D692E6578656328652929213D6E756C6C297B76617220733D7'
||'42E76616C75652E7265706C616365'';',
'blog_install.i(77) := ''282F5E5B27225D7C5B27225D242F672C2222293B69662873213D6E756C6C2626722E74657374287329297B766172206F3D722E657865632873293B733D6F2E76616C7565732E6C656E6774683E303F6F2E76616C7565732E73706C6974282F5C732A2C5C732A2F293A5B5D7D6E5B742E6E6'
||'16D655D3D737D72657475726E206E'';',
'blog_install.i(78) := ''7D66756E6374696F6E207828742C6E297B72657475726E20743D3D6E756C6C7C7C742E6C656E6774683D3D307C7C743D3D225C6E223F743A28743D742E7265706C616365282F3C2F672C22266C743B22292C743D742E7265706C616365282F207B322C7D2F672C66756E6374696F6E28742'
||'97B766172206E3D22223B666F7228'';',
'blog_install.i(79) := ''76617220723D303B723C742E6C656E6774682D313B722B2B296E2B3D652E636F6E6669672E73706163653B72657475726E206E2B2220227D292C6E213D6E756C6C262628743D7728742C66756E6374696F6E2865297B696628652E6C656E6774683D3D302972657475726E22223B7661722'
||'0743D22223B72657475726E20653D'';',
'blog_install.i(80) := ''652E7265706C616365282F5E28266E6273703B7C20292B2F2C66756E6374696F6E2865297B72657475726E20743D652C22227D292C652E6C656E6774683D3D303F743A742B273C636F646520636C6173733D22272B6E2B27223E272B652B223C2F636F64653E227D29292C74297D66756E6'
||'374696F6E205428652C74297B7661'';',
'blog_install.i(81) := ''72206E3D652E746F537472696E6728293B7768696C65286E2E6C656E6774683C74296E3D2230222B6E3B72657475726E206E7D66756E6374696F6E204E28652C74297B766172206E3D22223B666F722876617220723D303B723C743B722B2B296E2B3D2220223B72657475726E20652E726'
||'5706C616365282F5C742F672C6E29'';',
'blog_install.i(82) := ''7D66756E6374696F6E204328652C74297B66756E6374696F6E207528652C742C6E297B72657475726E20652E73756273747228302C74292B692E73756273747228302C6E292B652E73756273747228742B312C652E6C656E677468297D766172206E3D732865292C723D2209222C693D222'
||'23B666F7228766172206F3D303B6F'';',
'blog_install.i(83) := ''3C35303B6F2B2B29692B3D222020202020202020202020202020202020202020223B72657475726E20653D7728652C66756E6374696F6E2865297B696628652E696E6465784F662872293D3D2D312972657475726E20653B766172206E3D303B7768696C6528286E3D652E696E6465784F6'
||'628722929213D2D31297B76617220'';',
'blog_install.i(84) := ''693D742D6E25743B653D7528652C6E2C69297D72657475726E20657D292C657D66756E6374696F6E206B2874297B766172206E3D2F3C62725C732A5C2F3F3E7C266C743B62725C732A5C2F3F2667743B2F67693B72657475726E20652E636F6E6669672E626C6F676765724D6F64653D3D3'
||'1262628743D742E7265706C616365'';',
'blog_install.i(85) := ''286E2C225C6E2229292C652E636F6E6669672E73747269704272733D3D31262628743D742E7265706C616365286E2C222229292C747D66756E6374696F6E204C2865297B72657475726E20652E7265706C616365282F5E5C732B7C5C732B242F672C2222297D66756E6374696F6E2041286'
||'5297B76617220743D73286B286529'';',
'blog_install.i(86) := ''292C6E3D6E65772041727261792C723D2F5E5C732A2F2C693D3165333B666F7228766172206F3D303B6F3C742E6C656E6774682626693E303B6F2B2B297B76617220753D745B6F5D3B6966284C2875292E6C656E6774683D3D3029636F6E74696E75653B76617220613D722E65786563287'
||'5293B696628613D3D6E756C6C2972'';',
'blog_install.i(87) := ''657475726E20653B693D4D6174682E6D696E28615B305D2E6C656E6774682C69297D696628693E3029666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B29745B6F5D3D745B6F5D2E7375627374722869293B72657475726E20742E6A6F696E28225C6E22297D66756E63746'
||'96F6E204F28652C74297B72657475'';',
'blog_install.i(88) := ''726E20652E696E6465783C742E696E6465783F2D313A652E696E6465783E742E696E6465783F313A652E6C656E6774683C742E6C656E6774683F2D313A652E6C656E6774683E742E6C656E6774683F313A307D66756E6374696F6E204D28742C6E297B66756E6374696F6E207228652C742'
||'97B72657475726E20655B305D7D76'';',
'blog_install.i(89) := ''617220693D302C733D6E756C6C2C6F3D5B5D2C753D6E2E66756E633F6E2E66756E633A723B7768696C652828733D6E2E72656765782E6578656328742929213D6E756C6C297B76617220613D7528732C6E293B747970656F6620613D3D22737472696E6722262628613D5B6E657720652E4'
||'D6174636828612C732E696E646578'';',
'blog_install.i(90) := ''2C6E2E637373295D292C6F3D6F2E636F6E6361742861297D72657475726E206F7D66756E6374696F6E205F2874297B766172206E3D2F282E2A2928282667743B7C266C743B292E2A292F3B72657475726E20742E7265706C61636528652E72656765784C69622E75726C2C66756E6374696'
||'F6E2865297B76617220743D22222C'';',
'blog_install.i(91) := ''723D6E756C6C3B696628723D6E2E6578656328652929653D725B315D2C743D725B325D3B72657475726E273C6120687265663D22272B652B27223E272B652B223C2F613E222B747D297D66756E6374696F6E204428297B76617220653D646F63756D656E742E676574456C656D656E74734'
||'2795461674E616D65282273637269'';',
'blog_install.i(92) := ''707422292C743D5B5D3B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29655B6E5D2E747970653D3D2273796E746178686967686C696768746572222626742E7075736828655B6E5D293B72657475726E20747D66756E6374696F6E20502865297B76617220743D223C2'
||'15B43444154415B222C6E3D225D5D'';',
'blog_install.i(93) := ''3E222C723D4C2865292C693D21312C733D742E6C656E6774682C6F3D6E2E6C656E6774683B722E696E6465784F662874293D3D30262628723D722E737562737472696E672873292C693D2130293B76617220753D722E6C656E6774683B72657475726E20722E696E6465784F66286E293D3'
||'D752D6F262628723D722E73756273'';',
'blog_install.i(94) := ''7472696E6728302C752D6F292C693D2130292C693F723A657D66756E6374696F6E20482865297B76617220743D652E7461726765742C693D6328742C222E73796E746178686967686C69676874657222292C733D6328742C222E636F6E7461696E657222292C6F3D646F63756D656E742E6'
||'37265617465456C656D656E742822'';',
'blog_install.i(95) := ''746578746172656122292C613B69662821737C7C21697C7C6C28732C22746578746172656122292972657475726E3B613D7528692E6964292C6E28692C22736F7572636522293B76617220663D732E6368696C644E6F6465732C683D5B5D3B666F722876617220703D303B703C662E6C656'
||'E6774683B702B2B29682E70757368'';',
'blog_install.i(96) := ''28665B705D2E696E6E6572546578747C7C665B705D2E74657874436F6E74656E74293B683D682E6A6F696E28225C7222292C683D682E7265706C616365282F5C75303061302F672C222022292C6F2E617070656E644368696C6428646F63756D656E742E637265617465546578744E6F646'
||'5286829292C732E617070656E6443'';',
'blog_install.i(97) := ''68696C64286F292C6F2E666F63757328292C6F2E73656C65637428292C67286F2C22626C7572222C66756E6374696F6E2865297B6F2E706172656E744E6F64652E72656D6F76654368696C64286F292C7228692C22736F7572636522297D297D747970656F662072657175697265213D227'
||'56E646566696E6564222626747970'';',
'blog_install.i(98) := ''656F6620585265674578703D3D22756E646566696E656422262628585265674578703D7265717569726528225852656745787022292E58526567457870293B76617220653D7B64656661756C74733A7B22636C6173732D6E616D65223A22222C2266697273742D6C696E65223A312C22706'
||'1642D6C696E652D6E756D62657273'';',
'blog_install.i(99) := ''223A21312C686967686C696768743A6E756C6C2C7469746C653A6E756C6C2C22736D6172742D74616273223A21302C227461622D73697A65223A342C6775747465723A21302C746F6F6C6261723A21302C22717569636B2D636F6465223A21302C636F6C6C617073653A21312C226175746'
||'F2D6C696E6B73223A21302C6C6967'';',
'blog_install.i(100) := ''68743A21312C756E696E64656E743A21302C2268746D6C2D736372697074223A21317D2C636F6E6669673A7B73706163653A22266E6273703B222C757365536372697074546167733A21302C626C6F676765724D6F64653A21312C73747269704272733A21312C7461674E616D653A2270'
||'7265222C737472696E67733A7B6578'';',
'blog_install.i(101) := ''70616E64536F757263653A22657870616E6420736F75726365222C68656C703A223F222C616C6572743A2253796E746178486967686C6967687465725C6E5C6E222C6E6F42727573683A2243616E27742066696E6420627275736820666F723A20222C62727573684E6F7448746D6C5363'
||'726970743A22427275736820776173'';',
'blog_install.i(102) := ''6E277420636F6E6669677572656420666F722068746D6C2D736372697074206F7074696F6E3A20222C61626F75744469616C6F673A224041424F555440227D7D2C766172733A7B646973636F7665726564427275736865733A6E756C6C2C686967686C696768746572733A7B7D7D2C6272'
||'75736865733A7B7D2C72656765784C'';',
'blog_install.i(103) := ''69623A7B6D756C74694C696E6543436F6D6D656E74733A2F5C2F5C2A5B5C735C535D2A3F5C2A5C2F2F676D2C73696E676C654C696E6543436F6D6D656E74733A2F5C2F5C2F2E2A242F676D2C73696E676C654C696E655065726C436F6D6D656E74733A2F232E2A242F676D2C646F75626C'
||'6551756F'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'746564537472696E673A2F'';',
'blog_install.i(104) := ''22285B5E5C5C225C6E5D7C5C5C2E292A222F672C73696E676C6551756F746564537472696E673A2F27285B5E5C5C275C6E5D7C5C5C2E292A272F672C6D756C74694C696E65446F75626C6551756F746564537472696E673A6E65772058526567457870282722285B5E5C5C5C5C225D7C5C'
||'5C5C5C2E292A22272C22677322292C'';',
'blog_install.i(105) := ''6D756C74694C696E6553696E676C6551756F746564537472696E673A6E65772058526567457870282227285B5E5C5C5C5C275D7C5C5C5C5C2E292A27222C22677322292C786D6C436F6D6D656E74733A2F28266C743B7C3C29212D2D5B5C735C535D2A3F2D2D282667743B7C3E292F676D'
||'2C75726C3A2F5C772B3A5C2F5C2F5B'';',
'blog_install.i(106) := ''5C772D2E5C2F3F25263D3A403B235D2A2F672C706870536372697074546167733A7B6C6566743A2F28266C743B7C3C295C3F283F3A3D7C706870293F2F672C72696768743A2F5C3F282667743B7C3E292F672C656F663A21307D2C617370536372697074546167733A7B6C6566743A2F28'
||'266C743B7C3C29253D3F2F672C7269'';',
'blog_install.i(107) := ''6768743A2F25282667743B7C3E292F677D2C736372697074536372697074546167733A7B6C6566743A2F28266C743B7C3C295C732A7363726970742E2A3F282667743B7C3E292F67692C72696768743A2F28266C743B7C3C295C2F5C732A7363726970745C732A282667743B7C3E292F67'
||'697D7D2C746F6F6C6261723A7B6765'';',
'blog_install.i(108) := ''7448746D6C3A66756E6374696F6E2874297B66756E6374696F6E207328742C6E297B72657475726E20652E746F6F6C6261722E676574427574746F6E48746D6C28742C6E2C652E636F6E6669672E737472696E67735B6E5D297D766172206E3D273C64697620636C6173733D22746F6F6C'
||'626172223E272C723D652E746F6F6C'';',
'blog_install.i(109) := ''6261722E6974656D732C693D722E6C6973743B666F7228766172206F3D303B6F3C692E6C656E6774683B6F2B2B296E2B3D28725B695B6F5D5D2E67657448746D6C7C7C732928742C695B6F5D293B72657475726E206E2B3D223C2F6469763E222C6E7D2C676574427574746F6E48746D6C'
||'3A66756E6374696F6E28652C742C6E'';',
'blog_install.i(110) := ''297B72657475726E273C7370616E3E3C6120687265663D22232220636C6173733D22746F6F6C6261725F6974656D20636F6D6D616E645F272B742B2220222B742B27223E272B6E2B223C2F613E3C2F7370616E3E227D2C68616E646C65723A66756E6374696F6E2874297B66756E637469'
||'6F6E20692865297B76617220743D6E'';',
'blog_install.i(111) := ''65772052656745787028652B225F285C5C772B2922292C6E3D742E657865632872293B72657475726E206E3F6E5B315D3A6E756C6C7D766172206E3D742E7461726765742C723D6E2E636C6173734E616D657C7C22222C733D752863286E2C222E73796E746178686967686C6967687465'
||'7222292E6964292C6F3D692822636F'';',
'blog_install.i(112) := ''6D6D616E6422293B7326266F2626652E746F6F6C6261722E6974656D735B6F5D2E657865637574652873292C742E70726576656E7444656661756C7428297D2C6974656D733A7B6C6973743A5B22657870616E64536F75726365222C2268656C70225D2C657870616E64536F757263653A'
||'7B67657448746D6C3A66756E637469'';',
'blog_install.i(113) := ''6F6E2874297B696628742E676574506172616D2822636F6C6C617073652229213D312972657475726E22223B766172206E3D742E676574506172616D28227469746C6522293B72657475726E20652E746F6F6C6261722E676574427574746F6E48746D6C28742C22657870616E64536F75'
||'726365222C6E3F6E3A652E636F6E66'';',
'blog_install.i(114) := ''69672E737472696E67732E657870616E64536F75726365297D2C657865637574653A66756E6374696F6E2865297B76617220743D6128652E6964293B7228742C22636F6C6C617073656422297D7D2C68656C703A7B657865637574653A66756E6374696F6E2874297B766172206E3D6D28'
||'22222C225F626C616E6B222C353030'';',
'blog_install.i(115) := ''2C3235302C227363726F6C6C626172733D3022292C723D6E2E646F63756D656E743B722E777269746528652E636F6E6669672E737472696E67732E61626F75744469616C6F67292C722E636C6F736528292C6E2E666F63757328297D7D7D7D2C66696E64456C656D656E74733A66756E63'
||'74696F6E28742C6E297B7661722072'';',
'blog_install.i(116) := ''3D6E3F5B6E5D3A6928646F63756D656E742E676574456C656D656E747342795461674E616D6528652E636F6E6669672E7461674E616D6529292C733D652E636F6E6669672C6F3D5B5D3B732E75736553637269707454616773262628723D722E636F6E6361742844282929293B69662872'
||'2E6C656E6774683D3D3D3029726574'';',
'blog_install.i(117) := ''75726E206F3B666F722876617220753D303B753C722E6C656E6774683B752B2B297B76617220613D7B7461726765743A725B755D2C706172616D733A6428742C5328725B755D2E636C6173734E616D6529297D3B696628612E706172616D735B226272757368225D3D3D6E756C6C29636F'
||'6E74696E75653B6F2E707573682861'';',
'blog_install.i(118) := ''297D72657475726E206F7D2C686967686C696768743A66756E6374696F6E28742C6E297B76617220723D746869732E66696E64456C656D656E747328742C6E292C693D22696E6E657248544D4C222C733D6E756C6C2C6F3D652E636F6E6669673B696628722E6C656E6774683D3D3D3029'
||'72657475726E3B666F722876617220'';',
'blog_install.i(119) := ''753D303B753C722E6C656E6774683B752B2B297B766172206E3D725B755D2C613D6E2E7461726765742C663D6E2E706172616D732C6C3D662E62727573682C633B6966286C3D3D6E756C6C29636F6E74696E75653B696628665B2268746D6C2D736372697074225D3D3D2274727565227C'
||'7C652E64656661756C74735B226874'';',
'blog_install.i(120) := ''6D6C2D736372697074225D3D3D3129733D6E657720652E48746D6C536372697074286C292C6C3D2268746D6C736372697074223B656C73657B76617220683D62286C293B696628216829636F6E74696E75653B733D6E657720687D633D615B695D2C6F2E75736553637269707454616773'
||'262628633D50286329292C28612E74'';',
'blog_install.i(121) := ''69746C657C7C222229213D2222262628662E7469746C653D612E7469746C65292C662E62727573683D6C2C732E696E69742866292C6E3D732E6765744469762863292C28612E69647C7C222229213D22222626286E2E69643D612E6964292C612E706172656E744E6F64652E7265706C61'
||'63654368696C64286E2C61297D7D2C'';',
'blog_install.i(122) := ''616C6C3A66756E6374696F6E2874297B672877696E646F772C226C6F6164222C66756E6374696F6E28297B652E686967686C696768742874297D297D7D3B72657475726E20652E4D617463683D66756E6374696F6E28652C742C6E297B746869732E76616C75653D652C746869732E696E'
||'6465783D742C746869732E6C656E67'';',
'blog_install.i(123) := ''74683D652E6C656E6774682C746869732E6373733D6E2C746869732E62727573684E616D653D6E756C6C7D2C652E4D617463682E70726F746F747970652E746F537472696E673D66756E6374696F6E28297B72657475726E20746869732E76616C75657D2C652E48746D6C536372697074'
||'3D66756E6374696F6E2874297B6675'';',
'blog_install.i(124) := ''6E6374696F6E206628652C74297B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29655B6E5D2E696E6465782B3D747D66756E6374696F6E206C28652C74297B76617220693D652E636F64652C733D5B5D2C6F3D722E72656765784C6973742C753D652E696E6465782B'
||'652E6C6566742E6C656E6774682C61'';',
'blog_install.i(125) := ''3D722E68746D6C5363726970742C6C3B666F722876617220633D303B633C6F2E6C656E6774683B632B2B296C3D4D28692C6F5B635D292C66286C2C75292C733D732E636F6E636174286C293B612E6C656674213D6E756C6C2626652E6C656674213D6E756C6C2626286C3D4D28652E6C65'
||'66742C612E6C656674292C66286C2C'';',
'blog_install.i(126) := ''652E696E646578292C733D732E636F6E636174286C29292C612E7269676874213D6E756C6C2626652E7269676874213D6E756C6C2626286C3D4D28652E72696768742C612E7269676874292C66286C2C652E696E6465782B655B305D2E6C617374496E6465784F6628652E726967687429'
||'292C733D732E636F6E636174286C29'';',
'blog_install.i(127) := ''293B666F722876617220683D303B683C732E6C656E6774683B682B2B29735B685D2E62727573684E616D653D6E2E62727573684E616D653B72657475726E20737D766172206E3D622874292C722C693D6E657720652E627275736865732E586D6C2C733D6E756C6C2C6F3D746869732C75'
||'3D226765744469762067657448746D'';',
'blog_install.i(128) := ''6C20696E6974222E73706C697428222022293B6966286E3D3D6E756C6C2972657475726E3B723D6E6577206E3B666F722876617220613D303B613C752E6C656E6774683B612B2B292866756E6374696F6E28297B76617220653D755B615D3B6F5B655D3D66756E6374696F6E28297B7265'
||'7475726E20695B655D2E6170706C79'';',
'blog_install.i(129) := ''28692C617267756D656E7473297D7D2928293B696628722E68746D6C5363726970743D3D6E756C6C297B7928652E636F6E6669672E737472696E67732E62727573684E6F7448746D6C5363726970742B74293B72657475726E7D692E72656765784C6973742E70757368287B7265676578'
||'3A722E68746D6C5363726970742E63'';',
'blog_install.i(130) := ''6F64652C66756E633A6C7D297D2C652E486967686C6967687465723D66756E6374696F6E28297B7D2C652E486967686C6967687465722E70726F746F747970653D7B676574506172616D3A66756E6374696F6E28652C74297B766172206E3D746869732E706172616D735B655D3B726574'
||'75726E2076286E3D3D6E756C6C3F74'';',
'blog_install.i(131) := ''3A6E297D2C6372656174653A66756E6374696F6E2865297B72657475726E20646F63756D656E742E637265617465456C656D656E742865297D2C66696E644D6174636865733A66756E6374696F6E28652C74297B766172206E3D5B5D3B69662865213D6E756C6C29666F72287661722072'
||'3D303B723C652E6C656E6774683B72'';',
'blog_install.i(132) := ''2B2B29747970656F6620655B725D3D3D226F626A656374222626286E3D6E2E636F6E636174284D28742C655B725D2929293B72657475726E20746869732E72656D6F76654E65737465644D617463686573286E2E736F7274284F29297D2C72656D6F76654E65737465644D617463686573'
||'3A66756E6374696F6E2865297B666F'';',
'blog_install.i(133) := ''722876617220743D303B743C652E6C656E6774683B742B2B297B696628655B745D3D3D3D6E756C6C29636F6E74696E75653B766172206E3D655B745D2C723D6E2E696E6465782B6E2E6C656E6774683B666F722876617220693D742B313B693C652E6C656E6774682626655B745D213D3D'
||'6E756C6C3B692B2B297B7661722073'';',
'blog_install.i(134) := ''3D655B695D3B696628733D3D3D6E756C6C29636F6E74696E75653B696628732E696E6465783E7229627265616B3B732E696E6465783D3D6E2E696E6465782626732E6C656E6774683E6E2E6C656E6774683F655B745D3D6E756C6C3A732E696E6465783E3D6E2E696E6465782626732E69'
||'6E6465783C72262628655B695D3D6E'';',
'blog_install.i(135) := ''756C6C297D7D72657475726E20657D2C6669677572654F75744C696E654E756D626572733A66756E6374696F6E2865297B76617220743D5B5D2C6E3D7061727365496E7428746869732E676574506172616D282266697273742D6C696E652229293B72657475726E207728652C66756E63'
||'74696F6E28652C72297B742E707573'';',
'blog_install.i(136) := ''6828722B6E297D292C747D2C69734C696E65486967686C6967687465643A66756E6374696F6E2865297B76617220743D746869732E676574506172616D2822686967686C69676874222C5B5D293B72657475726E20747970656F662074213D226F626A656374222626742E707573683D3D'
||'6E756C6C262628743D5B745D292C68'';',
'blog_install.i(137) := ''28742C652E746F537472696E67282929213D2D317D2C6765744C696E6548746D6C3A66756E6374696F6E28652C742C6E297B76617220723D5B226C696E65222C226E756D626572222B742C22696E646578222B652C22616C74222B287425323D3D303F313A32292E746F537472696E6728'
||'295D3B72657475726E20746869732E'';',
'blog_install.i(138) := ''69734C696E65486967686C6967687465642874292626722E707573682822686967686C69676874656422292C743D3D302626722E707573682822627265616B22292C273C64697620636C6173733D22272B722E6A6F696E28222022292B27223E272B6E2B223C2F6469763E227D2C676574'
||'4C696E654E756D6265727348746D6C'';',
'blog_install.i(139) := ''3A66756E6374696F6E28742C6E297B76617220723D22222C693D732874292E6C656E6774682C6F3D7061727365496E7428746869732E676574506172616D282266697273742D6C696E652229292C753D746869732E676574506172616D28227061642D6C696E652D6E756D626572732229'
||'3B753D3D313F753D286F2B692D3129'';',
'blog_install.i(140) := ''2E746F537472696E6728292E6C656E6774683A69734E614E2875293D3D31262628753D30293B666F722876617220613D303B613C693B612B2B297B76617220663D6E3F6E5B615D3A6F2B612C743D663D3D303F652E636F6E6669672E73706163653A5428662C75293B722B3D746869732E'
||'6765744C696E6548746D6C28612C66'';',
'blog_install.i(141) := ''2C74297D72657475726E20727D2C676574436F64654C696E657348746D6C3A66756E6374696F6E28742C6E297B743D4C2874293B76617220723D732874292C693D746869732E676574506172616D28227061642D6C696E652D6E756D6265727322292C6F3D7061727365496E7428746869'
||'732E676574506172616D2822666972'';',
'blog_install.i(142) := ''73742D6C696E652229292C743D22222C753D746869732E676574506172616D2822627275736822293B666F722876617220613D303B613C722E6C656E6774683B612B2B297B76617220663D725B615D2C6C3D2F5E28266E6273703B7C5C73292B2F2E657865632866292C633D6E756C6C2C'
||'683D6E3F6E5B615D3A6F2B613B6C21'';',
'blog_install.i(143) := ''3D6E756C6C262628633D6C5B305D2E746F537472696E6728292C663D662E73756273747228632E6C656E677468292C633D632E7265706C616365282220222C652E636F6E6669672E737061636529292C663D4C2866292C662E6C656E6774683D3D30262628663D652E636F6E6669672E73'
||'70616365292C742B3D746869732E67'';',
'blog_install.i(144) := ''65744C696E6548746D6C28612C682C2863213D6E756C6C3F273C636F646520636C6173733D22272B752B2720737061636573223E272B632B223C2F636F64653E223A2222292B66297D72657475726E20747D2C6765745469746C6548746D6C3A66756E6374696F6E2865297B7265747572'
||'6E20653F223C63617074696F6E3E22'';',
'blog_install.i(145) := ''2B652B223C2F63617074696F6E3E223A22227D2C6765744D61746368657348746D6C3A66756E6374696F6E28652C74297B66756E6374696F6E20732865297B76617220743D653F652E62727573684E616D657C7C693A693B72657475726E20743F742B2220223A22227D766172206E3D30'
||'2C723D22222C693D746869732E6765'';',
'blog_install.i(146) := ''74506172616D28226272757368222C2222293B666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B297B76617220753D745B6F5D2C613B696628753D3D3D6E756C6C7C7C752E6C656E6774683D3D3D3029636F6E74696E75653B613D732875292C722B3D7828652E73756273'
||'7472286E2C752E696E6465782D6E29'';',
'blog_install.i(147) := ''2C612B22706C61696E22292B7828752E76616C75652C612B752E637373292C6E3D752E696E6465782B752E6C656E6774682B28752E6F66667365747C7C30297D72657475726E20722B3D7828652E737562737472286E292C7328292B22706C61696E22292C727D2C67657448746D6C3A66'
||'756E6374696F6E2874297B76617220'';',
'blog_install.i(148) := ''6E3D22222C723D5B2273796E746178686967686C696768746572225D2C692C732C753B72657475726E20746869732E676574506172616D28226C6967687422293D3D31262628746869732E706172616D732E746F6F6C6261723D746869732E706172616D732E6775747465723D2131292C'
||'636C6173734E616D653D2273796E74'';',
'blog_install.i(149) := ''6178686967686C696768746572222C746869732E676574506172616D2822636F6C6C6170736522293D3D312626722E707573682822636F6C6C617073656422292C286775747465723D746869732E676574506172616D28226775747465722229293D3D302626722E7075736828226E6F67'
||'757474657222292C722E7075736828'';',
'blog_install.i(150) := ''746869732E676574506172616D2822636C6173732D6E616D652229292C722E7075736828746869732E676574506172616D282262727573682229292C743D452874292E7265706C616365282F5C722F672C222022292C693D746869732E676574506172616D28227461622D73697A652229'
||'2C743D746869732E67657450617261'';',
'blog_install.i(151) := ''6D2822736D6172742D7461627322293D3D313F4328742C69293A4E28742C69292C746869732E676574506172616D2822756E696E64656E742229262628743D41287429292C677574746572262628753D746869732E6669677572654F75744C696E654E756D62657273287429292C733D74'
||'6869732E66696E644D617463686573'';',
'blog_install.i(152) := ''28746869732E72656765784C6973742C74292C6E3D746869732E6765744D61746368657348746D6C28742C73292C6E3D746869732E676574436F64654C696E657348746D6C286E2C75292C746869732E676574506172616D28226175746F2D6C696E6B7322292626286E3D5F286E29292C'
||'747970656F66206E6176696761746F'';',
'blog_install.i(153) := ''72213D22756E646566696E65642226266E6176696761746F722E757365724167656E7426266E6176696761746F722E757365724167656E742E6D61746368282F4D5349452F292626722E707573682822696522292C6E3D273C6469762069643D22272B6F28746869732E6964292B272220'
||'636C6173733D22272B722E6A6F696E'';',
'blog_install.i(154) := ''28222022292B27223E272B28746869732E676574506172616D2822746F6F6C62617222293F652E746F6F6C6261722E67657448746D6C2874686973293A2222292B273C7461626C6520626F726465723D2230222063656C6C70616464696E673D2230222063656C6C73706163696E673D22'
||'30223E272B746869732E6765745469'';',
'blog_install.i(155) := ''746C6548746D6C28746869732E676574506172616D28227469746C652229292B223C74626F64793E222B223C74723E222B286775747465723F273C746420636C6173733D22677574746572223E272B746869732E6765744C696E654E756D6265727348746D6C2874292B223C2F74643E22'
||'3A2222292B273C746420636C617373'';',
'blog_install.i(156) := ''3D22636F6465223E272B273C64697620636C6173733D22636F6E7461696E6572223E272B6E2B223C2F6469763E222B223C2F74643E222B223C2F74723E222B223C2F74626F64793E222B223C2F7461626C653E222B223C2F6469763E222C6E7D2C6765744469763A66756E6374696F6E28'
||'74297B743D3D3D6E756C6C26262874'';',
'blog_install.i(157) := ''3D2222292C746869732E636F64653D743B766172206E3D746869732E637265617465282264697622293B72657475726E206E2E696E6E657248544D4C3D746869732E67657448746D6C2874292C746869732E676574506172616D2822746F6F6C6261722229262667286C286E2C222E746F'
||'6F6C62617222292C22636C69636B22'';',
'blog_install.i(158) := ''2C652E746F6F6C6261722E68616E646C6572292C746869732E676574506172616D2822717569636B2D636F64652229262667286C286E2C222E636F646522292C2264626C636C69636B222C48292C6E7D2C696E69743A66756E6374696F6E2874297B746869732E69643D7028292C662874'
||'686973292C746869732E706172616D'';',
'blog_install.i(159) := ''733D6428652E64656661756C74732C747C7C7B7D292C746869732E676574506172616D28226C6967687422293D3D31262628746869732E706172616D732E746F6F6C6261723D746869732E706172616D732E6775747465723D2131297D2C6765744B6579776F7264733A66756E6374696F'
||'6E2865297B72657475726E20653D65'';',
'blog_install.i(160) := ''2E7265706C616365282F5E5C732B7C5C732B242F672C2222292E7265706C616365282F5C732B2F672C227C22292C225C5C62283F3A222B652B22295C5C62227D2C666F7248746D6C5363726970743A66756E6374696F6E2865297B76617220743D7B656E643A652E72696768742E736F75'
||'7263657D3B652E656F66262628742E'';',
'blog_install.i(161) := ''656E643D22283F3A283F3A222B742E656E642B22297C242922292C746869732E68746D6C5363726970743D7B6C6566743A7B72656765783A652E6C6566742C6373733A22736372697074227D2C72696768743A7B72656765783A652E72696768742C6373733A22736372697074227D2C63'
||'6F64653A6E65772058526567457870'';',
'blog_install.i(162) := ''2822283F3C6C6566743E222B652E6C6566742E736F757263652B2229222B22283F3C636F64653E2E2A3F29222B22283F3C72696768743E222B742E656E642B2229222C2273676922297D7D7D2C657D28293B747970656F66206578706F727473213D22756E646566696E6564223F657870'
||'6F7274732E53796E74617848696768'';',
'blog_install.i(163) := ''6C6967687465723D53796E746178486967686C6967687465723A6E756C6C0D0A2F2A207365742064656661756C7473202A2F0D0A53796E746178486967686C6967687465722E64656661756C74735B22746F6F6C626172225D3D66616C73653B0D0A2F2A2073684272757368506C61696E'
||'2E6A73202A2F0D0A3B2866756E6374'';',
'blog_install.i(164) := ''696F6E28297B53796E746178486967686C6967687465723D53796E746178486967686C696768746572207C7C2028747970656F66207265717569726520213D3D2027756E646566696E6564273F207265717569726528277368436F726527292E53796E746178486967686C696768746572'
||'203A206E756C6C293B66756E637469'';',
'blog_install.i(165) := ''6F6E20427275736828297B7D3B42727573682E70726F746F747970653D6E65772053796E746178486967686C6967687465722E486967686C69676874657228293B42727573682E616C69617365733D5B2774657874272C27706C61696E275D3B53796E746178486967686C696768746572'
||'2E627275736865732E506C61696E3D'';',
'blog_install.i(166) := ''42727573683B747970656F66286578706F72747329213D27756E646566696E6564273F6578706F7274732E42727573683D42727573683A6E756C6C3B7D2928293B0D0A66756E6374696F6E20696E697443484B456469746F7228297B0D0A20434B454449544F522E7374796C6573536574'
||'2E616464280D0A2020226465666175'';',
'blog_install.i(167) := ''6C74222C5B0D0A2020207B6E616D653A2253796E746178486967686C696768746572222C656C656D656E743A22707265222C7374796C65733A7B226261636B67726F756E642D636F6C6F72223A2223454545454545222C70616464696E673A22327078227D2C617474726962757465733A'
||'7B22636C617373223A226272757368'';',
'blog_install.i(168) := ''3A706C61696E227D7D2C0D0A2020207B6E616D653A22426C7565205469746C65222C656C656D656E743A226833222C7374796C65733A7B636F6C6F723A22426C7565227D7D2C0D0A2020207B6E616D653A22526564205469746C65222C656C656D656E743A226833222C7374796C65733A'
||'7B636F6C6F723A22526564227D7D2C'';',
'blog_install.i(169) := ''0D0A2020207B6E616D653A224D61726B65723A2059656C6C6F77222C656C656D656E743A227370616E222C7374796C65733A7B226261636B67726F756E642D636F6C6F72223A2259656C6C6F77227D7D2C0D0A2020207B6E616D653A224D61726B65723A20477265656E222C656C656D65'
||'6E743A227370616E222C7374796C65'';',
'blog_install.i(170) := ''733A7B226261636B67726F756E642D636F6C6F72223A224C696D65227D7D2C0D0A2020207B6E616D653A22426967222C656C656D656E743A22626967227D2C7B6E616D653A22536D616C6C222C656C656D656E743A22736D616C6C227D2C0D0A2020207B6E616D653A2254797065777269'
||'746572222C656C656D656E743A2274'';',
'blog_install.i(171) := ''74227D2C7B6E616D653A22436F6D707574657220436F6465222C656C656D656E743A22636F6465227D2C0D0A2020207B6E616D653A224B6579626F61726420506872617365222C656C656D656E743A226B6264227D2C7B6E616D653A2253616D706C652054657874222C656C656D656E74'
||'3A2273616D70227D2C0D0A2020207B'';',
'blog_install.i(172) := ''6E616D653A225661726961626C65222C656C656D656E743A22766172227D2C0D0A2020207B6E616D653A2244656C657465642054657874222C656C656D656E743A2264656C227D2C0D0A2020207B6E616D653A22496E7365727465642054657874222C656C656D656E743A22696E73227D'
||'2C0D0A2020207B6E616D653A224369'';',
'blog_install.i(173) := ''74656420576F726B222C656C656D656E743A2263697465227D2C0D0A2020207B6E616D653A22496E6C696E652051756F746174696F6E222C656C656D656E743A2271227D2C0D0A2020207B6E616D653A224C616E67756167653A2052544C222C656C656D656E743A227370616E222C6174'
||'74726962757465733A7B6469723A22'';',
'blog_install.i(174) := ''72746C227D7D2C0D0A2020207B6E616D653A224C616E67756167653A204C5452222C656C656D656E743A227370616E222C617474726962757465733A7B6469723A226C7472227D7D2C0D0A2020207B6E616D653A22496D616765206F6E204C656674222C656C656D656E743A22696D6722'
||'2C617474726962757465733A7B7374'';',
'blog_install.i(175) := ''796C653A2270616464696E673A203570783B206D617267696E2D72696768743A20357078222C20626F726465723A2232222C616C69676E3A226C656674227D7D2C0D0A2020207B6E616D653A22496D616765206F6E205269676874222C656C656D656E743A22696D67222C617474726962'
||'757465733A7B7374796C653A227061'';',
'blog_install.i(176) := ''6464696E673A203570783B206D617267696E2D6C6566743A20357078222C626F726465723A2232222C616C69676E3A227269676874227D7D2C0D0A2020207B6E616D653A22426F726465726C657373205461626C65222C656C656D656E743A227461626C65222C7374796C65733A7B2262'
||'6F726465722D7374796C65223A2268'';',
'blog_install.i(177) := ''696464656E222C226261636B67726F756E642D636F6C6F72223A2223453645364641227D7D2C0D0A2020207B6E616D653A225371756172652042756C6C65746564204C697374222C656C656D656E743A22756C222C7374796C65733A7B226C6973742D7374796C652D74797065223A2273'
||'7175617265227D7D0D0A20205D0D0A'';',
'blog_install.i(178) := ''20293B0D0A20434B454449544F522E636F6E6669672E656E7469746965735F6164646974696F6E616C3D22237832332C237832372C23783246223B0D0A20434B454449544F522E636F6E6669672E666F72636550617374654173506C61696E546578743D21303B0D0A7D0D0A66756E6374'
||'696F6E206E65745F776562686F705F'';',
'blog_install.i(179) := ''64627377685F6D61785F6974656D5F6C656E67746828297B0D0A20766172206C4D61784C656E67746820203D20746869732E616374696F6E2E61747472696275746530312A312C0D0A20202020206C4D657373616765202020203D20746869732E616374696F6E2E617474726962757465'
||'30322C0D0A09206C53746F70537562'';',
'blog_install.i(180) := ''6D6974203D2066616C73650D0A09203B0D0A20746869732E6166666563746564456C656D656E74732E656163682866756E6374696F6E2869297B0D0A2020766172206C4C6162656C203D20242E7472696D282428276C6162656C5B666F723D22272B746869732E69642B27225D27292E74'
||'6578742829293B0D0A202069662824'';',
'blog_install.i(181) := ''762874686973292E6C656E6774683E3D6C4D61784C656E677468297B0D0A202020616C657274286C4C6162656C2B6C4D657373616765293B0D0A2020206C53746F705375626D69743D747275650D0A20207D0D0A207D293B0D0A206966286C53746F705375626D6974297B0D0A20206576'
||'656E742E70726576656E7444656661'';',
'blog_install.i(182) := ''756C7428290D0A207D0D0A7D'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''alib.js'',''text/javascript'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''6469762E636F6D6D656E747B6D61782D77696474683A36303070787D2E636F6D6D656E742D746578747B6261636B67726F756E643A6E6F6E6520726570656174207363726F6C6C2030203020234635463546353B626F726465723A31707820736F6C696420234341434143413B626F726465'
||'722D7261646975733A3370782033'';',
'blog_install.i(2) := ''707820337078203370783B6D617267696E2D626F74746F6D3A3670783B70616464696E673A35707820313070787D2E636F6D6D656E742D7465787420756C7B6D617267696E3A302030203020313570782021696D706F7274616E747D2E636F6D6D656E742D746578742068337B666F6E742D'
||'7765696768743A3730303B6D6172'';',
'blog_install.i(3) := ''67696E3A302030203570783B70616464696E673A307D2E6468746D6C5375624D656E75327B7A2D696E6465783A393939397D646976237542726561646372756D627320756C206C697B666F6E742D73697A653A3134707821696D706F7274616E743B70616464696E673A3021696D706F7274'
||'616E747D612E68656C706C616265'';',
'blog_install.i(4) := ''6C7B637572736F723A68656C707D612E68656C706C6162656C3A686F7665727B706F736974696F6E3A72656C61746976657D612E68656C706C6162656C3A686F766572206469767B646973706C61793A626C6F636B7D612E68656C706C6162656C206469767B626F782D736861646F773A35'
||'7078203570782035707820726762'';',
'blog_install.i(5) := ''6128302C20302C20302C20302E31293B626F726465722D7261646975733A357078203570783B706F736974696F6E3A6162736F6C7574653B6C6566743A31656D3B746F703A31656D3B77686974652D73706163653A6E6F777261703B6261636B67726F756E642D636F6C6F723A234545453B'
||'626F726465723A31707820736F6C'';',
'blog_install.i(6) := ''696420234343433B636F6C6F723A233333333B666F6E742D7765696768743A3730303B70616464696E673A2E38656D2031656D3B746578742D616C69676E3A6C6566743B746578742D6465636F726174696F6E3A6E6F6E653B7A2D696E6465783A393939393B646973706C61793A6E6F6E65'
||'7D2E6164642D62746E7B6D617267'';',
'blog_install.i(7) := ''696E2D6C6566743A3670783B626F726465723A31707820736F6C696420233641394344417D2E6164642D62746E3A686F7665727B626F782D736861646F773A3020302033707820233641394344417D236170657869725F4C4F414445527B6261636B67726F756E642D636F6C6F723A726762'
||'612835312C2035312C2035312C30'';',
'blog_install.i(8) := ''2E33293B6865696768743A313030253B77696474683A313030253B746F703A303B6C6566743A303B706F736974696F6E3A66697865643B7A2D696E6465783A393939393B637572736F723A776169747D236170657869725F4C4F4144455220696D677B6C6566743A3438253B706F73697469'
||'6F6E3A72656C61746976653B746F'';',
'blog_install.i(9) := ''703A3334253B637572736F723A776169747D236170657869725F414354494F4E534D454E55206120696D672C236170657869725F464F524D41545F4D454E55206120696D677B646973706C61793A696E6C696E6521696D706F7274616E747D236170657869725F726F6C6C6F7665722E7569'
||'2D726573697A61626C657B706164'';',
'blog_install.i(10) := ''64696E672D72696768743A3870787D236170657869725F726F6C6C6F766572206469762E75692D726573697A61626C652D68616E646C657B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A726573697A652D652E706E672229206E6F2D7265706'
||'56174207363726F6C6C2030203530'';',
'blog_install.i(11) := ''2520234630463046303B626F726465722D6C6566743A32707820736F6C696420234630463046303B72696768743A307D2E73796E746178686967686C69676874657220612C2E73796E746178686967686C696768746572206469762C2E73796E746178686967686C69676874657220636F6'
||'4652C2E73796E746178686967686C'';',
'blog_install.i(12) := ''696768746572207461626C652C2E73796E746178686967686C696768746572207461626C652074642C2E73796E746178686967686C696768746572207461626C652074722C2E73796E746178686967686C696768746572207461626C652074626F64792C2E73796E746178686967686C696'
||'768746572207461626C6520746865'';',
'blog_install.i(13) := ''61642C2E73796E746178686967686C696768746572207461626C652063617074696F6E2C2E73796E746178686967686C6967687465722074657874617265617B6261636B67726F756E643A6E6F6E652021696D706F7274616E743B626F726465723A302021696D706F7274616E743B626F7'
||'4746F6D3A6175746F2021696D706F'';',
'blog_install.i(14) := ''7274616E743B666C6F61743A6E6F6E652021696D706F7274616E743B6865696768743A6175746F2021696D706F7274616E743B6C6566743A6175746F2021696D706F7274616E743B6C696E652D6865696768743A312E31656D2021696D706F7274616E743B6D617267696E3A302021696D7'
||'06F7274616E743B6F75746C696E65'';',
'blog_install.i(15) := ''3A302021696D706F7274616E743B6F766572666C6F773A76697369626C652021696D706F7274616E743B70616464696E673A302021696D706F7274616E743B706F736974696F6E3A7374617469632021696D706F7274616E743B72696768743A6175746F2021696D706F7274616E743B746'
||'578742D616C69676E3A6C65667420'';',
'blog_install.i(16) := ''21696D706F7274616E743B746F703A6175746F2021696D706F7274616E743B766572746963616C2D616C69676E3A626173656C696E652021696D706F7274616E743B77696474683A6175746F2021696D706F7274616E743B626F782D73697A696E673A636F6E74656E742D626F782021696'
||'D706F7274616E743B666F6E742D66'';',
'blog_install.i(17) := ''616D696C793A22436F6E736F6C6173222C2242697473747265616D20566572612053616E73204D6F6E6F222C22436F7572696572204E6577222C436F75726965722C6D6F6E6F73706163652021696D706F7274616E743B666F6E742D7765696768743A6E6F726D616C2021696D706F72746'
||'16E743B666F6E742D7374796C653A'';',
'blog_install.i(18) := ''6E6F726D616C2021696D706F7274616E743B666F6E742D73697A653A31656D2021696D706F7274616E743B6D696E2D6865696768743A6175746F2021696D706F7274616E747D2E73796E746178686967686C6967687465722E736F757263657B6F766572666C6F773A68696464656E20216'
||'96D706F7274616E747D2E73796E74'';',
'blog_install.i(19) := ''6178686967686C696768746572202E6974616C69637B666F6E742D7374796C653A6974616C69632021696D706F7274616E747D2E73796E746178686967686C696768746572202E6C696E657B77686974652D73706163653A7072652021696D706F7274616E747D2E73796E7461786869676'
||'86C696768746572207461626C6520'';',
'blog_install.i(20) := ''74642E636F64652C2E73796E746178686967686C696768746572207461626C657B77696474683A313030252021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652074642E636F6465202E636F6E7461696E65727B706F736974696F6E3A72656C61746'
||'976652021696D706F7274616E747D'';',
'blog_install.i(21) := ''2E73796E746178686967686C696768746572207461626C652074642E636F6465202E636F6E7461696E65722074657874617265617B626F782D73697A696E673A626F726465722D626F782021696D706F7274616E743B706F736974696F6E3A6162736F6C7574652021696D706F7274616E7'
||'43B6C6566743A302021696D706F72'';',
'blog_install.i(22) := ''74616E743B746F703A302021696D706F7274616E743B77696474683A313030252021696D706F7274616E743B6865696768743A313030252021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E743B6261636B67726F756E643A234643464346432021696D706'
||'F7274616E743B70616464696E672D'';',
'blog_install.i(23) := ''6C6566743A31656D2021696D706F7274616E743B6F766572666C6F773A68696464656E2021696D706F7274616E743B77686974652D73706163653A7072652021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652074642E677574746572202E6C696E6'
||'57B746578742D616C69676E3A7269'';',
'blog_install.i(24) := ''6768742021696D706F7274616E743B70616464696E673A30202E35656D20302031656D2021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652074642E636F6465202E6C696E657B70616464696E673A302031656D2021696D706F7274616E747D2E737'
||'96E746178686967686C6967687465'';',
'blog_install.i(25) := ''722E6E6F6775747465722074642E636F6465202E6C696E652C2E73796E746178686967686C6967687465722E6E6F6775747465722074642E636F6465202E636F6E7461696E65722074657874617265617B70616464696E672D6C6566743A302021696D706F7274616E747D2E73796E74617'
||'8686967686C6967687465722E7368'';',
'blog_install.i(26) := ''6F777B646973706C61793A626C6F636B2021696D706F7274616E747D2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C626172207370616E7B646973706C61793A696E6C696E652021696D706F7274616E743B6D617267696E2D72696768743A31656D2'
||'021696D706F7274616E747D2E7379'';',
'blog_install.i(27) := ''6E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C626172207370616E20617B70616464696E673A302021696D706F7274616E743B646973706C61793A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C696768746572202E746F6F6C62617'
||'2207370616E2E7469746C652C2E73'';',
'blog_'))
);
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'install.i(28) := ''796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C626172207370616E20612E657870616E64536F757263657B646973706C61793A696E6C696E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E69657B666F6E742D73697A653A2E39'
||'656D2021696D706F7274616E'';',
'blog_install.i(29) := ''743B70616464696E673A31707820302031707820302021696D706F7274616E747D2E73796E746178686967686C6967687465722E6965202E746F6F6C6261727B6C696E652D6865696768743A3870782021696D706F7274616E747D2E73796E746178686967686C6967687465722E6965202'
||'E746F6F6C62617220617B70616464'';',
'blog_install.i(30) := ''696E672D746F703A302021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E616C7431202E636F6E74656E742C2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E616C7432202E636F6E746'
||'56E742C2E73796E74617868696768'';',
'blog_install.i(31) := ''6C6967687465722E7072696E74696E67202E6C696E652E686967686C696768746564202E6E756D6265722C2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E686967686C6967687465642E616C7431202E636F6E74656E742C2E73796E7461786869676'
||'86C6967687465722E7072696E7469'';',
'blog_install.i(32) := ''6E67202E6C696E652E686967686C6967687465642E616C7432202E636F6E74656E747B6261636B67726F756E643A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E65202E6E756D6265727B636F6C6F723A2362626'
||'22021696D706F7274616E747D2E73'';',
'blog_install.i(33) := ''796E746178686967686C6967687465722E7072696E74696E67202E746F6F6C6261722C2E73796E746178686967686C696768746572202E746F6F6C62617220612E657870616E64536F757263652C2E73796E746178686967686C6967687465722E636F6C6C6170736564207461626C657B6'
||'46973706C61793A6E6F6E65202169'';',
'blog_install.i(34) := ''6D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E6720617B746578742D6465636F726174696F6E3A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E7363726970742C2E73796E74617'
||'8686967686C696768746572202E62'';',
'blog_install.i(35) := ''6F6C647B666F6E742D7765696768743A626F6C642021696D706F7274616E747D2E73796E746178686967686C696768746572202E6C696E652E616C74322C2E73796E746178686967686C696768746572202E6C696E652E616C74317B6261636B67726F756E642D636F6C6F723A234643464'
||'346432021696D706F7274616E747D'';',
'blog_install.i(36) := ''2E73796E746178686967686C696768746572202E6C696E652E686967686C6967687465642E616C74312C2E73796E746178686967686C696768746572202E6C696E652E686967686C6967687465642E616C74327B6261636B67726F756E642D636F6C6F723A236530653065302021696D706'
||'F7274616E747D2E73796E74617868'';',
'blog_install.i(37) := ''6967686C696768746572207461626C652063617074696F6E7B746578742D616C69676E3A6C6566742021696D706F7274616E743B70616464696E673A2E35656D2030202E35656D2031656D2021696D706F7274616E743B636F6C6F723A233333332021696D706F7274616E747D2E73796E7'
||'46178686967686C69676874657220'';',
'blog_install.i(38) := ''2E6775747465727B636F6C6F723A236166616661662021696D706F7274616E747D2E73796E746178686967686C696768746572202E677574746572202E6C696E657B626F726465722D72696768743A33707820736F6C696420233663653236632021696D706F7274616E747D2E73796E746'
||'178686967686C696768746572202E'';',
'blog_install.i(39) := ''677574746572202E6C696E652E686967686C6967687465647B6261636B67726F756E642D636F6C6F723A233663653236632021696D706F7274616E743B636F6C6F723A234643464346432021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E672'
||'02E6C696E65202E636F6E74656E74'';',
'blog_install.i(40) := ''7B636F6C6F723A233333332021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E636F6C6C61707365647B6F766572666C6F773A76697369626C652021696D706F7274616E747D2E73796E7461786869676'
||'86C6967687465722E636F6C6C6170'';',
'blog_install.i(41) := ''736564202E746F6F6C6261727B70616464696E673A2E31656D202E38656D2030202E38656D2021696D706F7274616E743B666F6E742D73697A653A31656D2021696D706F7274616E743B706F736974696F6E3A7374617469632021696D706F7274616E743B77696474683A6175746F20216'
||'96D706F7274616E743B6865696768'';',
'blog_install.i(42) := ''743A6175746F2021696D706F7274616E743B636F6C6F723A626C75652021696D706F7274616E743B6261636B67726F756E643A234643464346432021696D706F7274616E743B626F726465723A31707820736F6C696420233663653236632021696D706F7274616E747D2E73796E7461786'
||'86967686C696768746572202E746F'';',
'blog_install.i(43) := ''6F6C6261727B706F736974696F6E3A6162736F6C7574652021696D706F7274616E743B72696768743A3170782021696D706F7274616E743B746F703A3170782021696D706F7274616E743B77696474683A313170782021696D706F7274616E743B6865696768743A313170782021696D706'
||'F7274616E743B666F6E742D73697A'';',
'blog_install.i(44) := ''653A313070782021696D706F7274616E743B7A2D696E6465783A31302021696D706F7274616E743B636F6C6F723A234643464346432021696D706F7274616E743B6261636B67726F756E643A233663653236632021696D706F7274616E743B626F726465723A6E6F6E652021696D706F727'
||'4616E747D2E73796E746178686967'';',
'blog_install.i(45) := ''686C696768746572202E746F6F6C62617220617B646973706C61793A626C6F636B2021696D706F7274616E743B746578742D616C69676E3A63656E7465722021696D706F7274616E743B746578742D6465636F726174696F6E3A6E6F6E652021696D706F7274616E743B70616464696E672'
||'D746F703A3170782021696D706F72'';',
'blog_install.i(46) := ''74616E743B636F6C6F723A234643464346432021696D706F7274616E747D2E73796E746178686967686C696768746572202E706C61696E2C2E73796E746178686967686C696768746572202E706C61696E20612C2E73796E746178686967686C696768746572202E746F6F6C62617220613'
||'A686F7665722C2E73796E74617868'';',
'blog_install.i(47) := ''6967686C696768746572202E6C696E652E686967686C6967687465642E6E756D6265722C2E73796E746178686967686C6967687465722E7072696E74696E67202E627265616B2C2E73796E746178686967686C6967687465722E7072696E74696E67202E627265616B20612C2E73796E746'
||'178686967686C6967687465722E70'';',
'blog_install.i(48) := ''72696E74696E67202E706C61696E2C2E73796E746178686967686C6967687465722E7072696E74696E67202E706C61696E20617B636F6C6F723A233333332021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6D6D656E74732C2E73796E7461786869676'
||'86C696768746572202E636F6D6D65'';',
'blog_install.i(49) := ''6E747320612C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6D6D656E74732C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6D6D656E747320617B636F6C6F723A233030383230302021696D706F7274616E747D2E73796E7'
||'46178686967686C69676874657220'';',
'blog_install.i(50) := ''2E737472696E672C2E73796E746178686967686C696768746572202E737472696E6720612C2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C62617220612C2E73796E746178686967686C6967687465722E7072696E74696E67202E737472696E672C2'
||'E73796E746178686967686C696768'';',
'blog_install.i(51) := ''7465722E7072696E74696E67202E737472696E6720617B636F6C6F723A626C75652021696D706F7274616E747D2E73796E746178686967686C696768746572202E7661726961626C652C2E73796E746178686967686C6967687465722E7072696E74696E67202E7661726961626C657B636'
||'F6C6F723A236137302021696D706F'';',
'blog_install.i(52) := ''7274616E747D2E73796E746178686967686C696768746572202E76616C75652C2E73796E746178686967686C6967687465722E7072696E74696E67202E76616C75657B636F6C6F723A233039302021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6E737'
||'4616E74732C2E73796E7461786869'';',
'blog_install.i(53) := ''67686C6967687465722E7072696E74696E67202E636F6E7374616E74737B636F6C6F723A233036632021696D706F7274616E747D2E73796E746178686967686C696768746572202E7363726970747B666F6E742D7765696768743A626F6C642021696D706F7274616E743B636F6C6F723A2'
||'33036392021696D706F7274616E74'';',
'blog_install.i(54) := ''3B6261636B67726F756E642D636F6C6F723A7472616E73706172656E742021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6C6F72312C2E73796E746178686967686C696768746572202E636F6C6F723120612C2E73796E746178686967686C696768746'
||'572202E70726570726F636573736F'';',
'blog_install.i(55) := ''722C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F72312C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F723120612C2E73796E746178686967686C6967687465722E7072696E74696E67202E70726570726F63657'
||'3736F727B636F6C6F723A67726179'';',
'blog_install.i(56) := ''2021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6C6F72322C2E73796E746178686967686C696768746572202E636F6C6F723220612C2E73796E746178686967686C696768746572202E66756E6374696F6E732C2E73796E746178686967686C6967687'
||'465722E7072696E74696E67202E63'';',
'blog_install.i(57) := ''6F6C6F72322C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F723220612C2E73796E746178686967686C6967687465722E7072696E74696E67202E66756E6374696F6E737B636F6C6F723A236666313439332021696D706F7274616E747D2E73796E746'
||'178686967686C696768746572202E'';',
'blog_install.i(58) := ''636F6C6F72332C2E73796E746178686967686C696768746572202E636F6C6F723320612C2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C62617220613A686F7665722C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6'
||'C6F72332C2E73796E746178686967'';',
'blog_install.i(59) := ''686C6967687465722E7072696E74696E67202E636F6C6F723320617B636F6C6F723A7265642021696D706F7274616E747D2E73796E746178686967686C696768746572202E6B6579776F72642C2E73796E746178686967686C6967687465722E7072696E74696E67202E6B6579776F72647'
||'B636F6C6F723A233036392021696D'';',
'blog_install.i(60) := ''706F7274616E743B666F6E742D7765696768743A626F6C642021696D706F7274616E747D2E73796E746178686967686C6967687465727B77696474683A313030252021696D706F7274616E743B6D617267696E3A31656D20302031656D20302021696D706F7274616E743B706F736974696'
||'F6E3A72656C61746976652021696D'';',
'blog_install.i(61) := ''706F7274616E743B6F766572666C6F773A6175746F2021696D706F7274616E743B666F6E742D73697A653A31656D2021696D706F7274616E743B6261636B67726F756E642D636F6C6F723A234643464346432021696D706F7274616E743B6F766572666C6F772D793A68696464656E20216'
||'96D706F7274616E743B7061646469'';',
'blog_install.i(62) := ''6E673A337078203021696D706F7274616E747D0D0A'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''astyle.min.css'',''text/css'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000640000006408000000005589CA88000013D749444154181905C15B8263398E2540ED7F933DDD192E9100CE0320AF3CB2EA67CC5EF9C609EBD19BEE56F77C3FCE5355C5D352CC5B2C34762599B418741DFA7CD2CB7029F674F6084669BE7567'
||'4EE1ABEAA6DA7C69A778A0E40725'';',
'blog_install.i(2) := ''16E9A816E05C2BB2F602D8299A27CC2F26F866FDB97CB755847AEF9CC34B951C1F46BB24F3AB498DB9CFCB2AEFA5CBF1D42CDA4F1CCC6E53BDDE5FF72856A6EB5BAB420A7E789E1A2730C79DA5294F656D6592B336B570EA5BC76CCFD12B44E76547A324F17887E0C4875C21684CF429FC7A'
||'ED0462B1F604A4FC6861F26A56CD'';',
'blog_install.i(3) := ''B66A70E6F6BBA7F4A9FD393BC5FEDEFCBC107B26DE89E89E0E36A8F68328DE691C47CE73A4C8C80E45B2B78A9C417CAB7F0FDA834CBB1A429763487664796828745F3F9F368BBE684F149DEF6343FE14B3D774C93841C23FD39D23F62AED1A43E49DA4794825B20D4F56F4E41059CD404ED5'
||'6BC3ACECE84F6C875A4845059338'';',
'blog_install.i(4) := ''51CAE92E9C77330875F08C7CC4925171FADEFA5DC152687CBD1F3985F58727B7E53CF31FE835C569FFB9958B1281B3EB293D833F8DC8550213A9CA68AEA1D6C9E473DCD893437769F0299632693F6932C1C361A9EE02F5EA9C941BE1AB749911FF74A6271C7EDA1D99CBEEEFA60EC2DCFC47'
||'E5726BD4EF8A667D19AB2B3EBBF7'';',
'blog_install.i(5) := ''B7BD8EFA1DAC4A3C6472EAF5B1C9798800BF1D4D996AE1E392B3B2D0F7623EDC8F599CD00723D1CC188E10574CAEAC0F28C0BDF23195E7CBEA8F5DE46B32E5A96065A9275BC953BB18CA7CBECE663584BF5BC473CA6EB080AA7FABDC9B6B21C1D14C2EFC746B35174BCEA8590EA95E4F1A1D'
||'6F41AC8D714DE5DFC8593D5F2EE5'';',
'blog_install.i(6) := ''3DBC8D37B7C682A1EF5EA781CA4F958D6FEF85CB081CA9805F57C13EC173A33F79F7C9175A02585F60AF76CB29E962992EF62CB9409E9EA9E929EB4C57E77C3292CDDC8C78BA5D82F13E3D0CF153671F174A59E1D7B13915F7784D96607C6226FFFE994A30DD563738BBBE5B65B99753000D'
||'1ECC83DF706D83B143C6D56CF68A'';',
'blog_install.i(7) := ''DA622B6D383E2F66873D9FE6AEE9464A6E2D12B1E3D033C80CC4BE71AE1ED9EBA18395090CB3D465F7F46E7C306181BA9FEA6F6BF3EF7C5CF5DAC987A8BFF5C175A100E1BE3BF1AE80AD4169D7D63DA9099DEAF6EF21DC0D88DEC7458E842857AC7FBE75C8AD99C5C8F715A35ECFFAD96F7D'
||'61F78F9F411755A2EA485B8462ED'';',
'blog_install.i(8) := ''EAF333D5C8A69E839A66EDFEAB1A2C7832B227BA595B59D1932890D4F94F32547A55F081D39ABCF3BE84C27D6134EA1150D775DB2957767ACE96BD3D10D185D93BF27B3C9A32291EB8CAAEE8FAB43FF6ADFD2A15B0947B536BB181B270245A2044D6CEE687C72A7DE62FFB7C8C0A15C2EB94'
||'1434627F8832CF63795467412BB5'';',
'blog_install.i(9) := ''8D4DBE1E70CE47BB928A2F4E697F3674C1C83A4BBBAAE05D83A0C0899A4CD95C1553F5F8484693D1CDF49E4CF58D24B10BDF95387C9552681CB9765794CEB9CD9A93584FD7A0304634082DFF8CFFD47EEA7CB0515FB16AD27648E499DE9F5C189C59A9B61FFDFA837AE127EB78292EEBF40D'
||'7CD3429C4F2E4841545FC313446A'';',
'blog_install.i(10) := ''CB180423DBB3A391F0E9B1CE120353516631EAE8BBCC82FEE5F7D60BCA483FEFD5EAC2640B186469D7E6333C75B822E1419CDD71CAB9AB34FCDE6BF5DAF8700A89E3C00E37036A09A963D99F3EAF1140C164657FA0FCA7F9BBBB8A0C098500D37B10F7DFCCF33CFDE5CED8222C4297F7D32'
||'1F7D335F48A9DDB0AF87CC0126B0D'';',
'blog_install.i(11) := ''5FBF7BA70F526248FB199371B3EB7C1A58F42A833ADF029A26BF2A4D4D79DE8F56D7C754A8BA3A8E0004A5DE4FC80D7E450C5F73897D527F5D37B757FCBEEF66D7AEDF55DA63B8FDC4D534A3A31581B2356EF720D22C04DF8ECCFBFB6015754FA988BF8EEA39715F3908E4C778E7CFB3F93'
||'D79A7A3CED5A48EB684BE957BAE18'';',
'blog_install.i(12) := ''68960609442DBAB06B6957DC68C351EAB28DDD83684A2726B7F21528839ADE38D598FCB884B7F26280B39F8898E9BD37697FA6B3CE6A3E25C522E69A8E365D256077C47F48553AA7DE825680AF375148BCD1BE9F72A62B54CF1EC1431E6438E1C0AF0F59381897F4B14EAB88EBF09F7D5DB'
||'23393A54E5F6AD293B836755FEE9F'';',
'blog_install.i(13) := ''CAF7BFF554E1D4C94FE4C35B53DBF52CED7684E0E874D7657C947DB24340FF4B69CBC971EC6DCE234D69EF6F16E6E40CC4F1BC6A54D1D2AA9D55D18C37A6BAD266DE99F6AD4AE693CF2F3BF0DEC29F8562AC6D1BBCF8BF752269D59B277B5847E3DB55333A71A75E533064F62FA31168D21'
||'B971773C8C15EC39F43EDBEDE28B5'';',
'blog_install.i(14) := ''754A85A152641B70576CC81BBD2A7097CA0CB08B9EB58457D62E626A679ABFBD8AA8C4355BE1EC6B31C4DD91EFAE16406EDEE96B8C70D72905C161FBB786FBDD6CAFD8DCFC623C5CE8974E09B591958E3EE78442C58179D3DF5F035AF6C7567E5191E054FED4231A8FB36EEBF6C9E8AEFAB'
||'D88916D0C36FF418EF3AEFDAAEF60'';',
'blog_install.i(15) := ''610A403A05348B00F2F7A9BE61A622C8EA4F77A9D924134E7CB31CB2C1ED932CE2C0C14E99059ECE931FD8A3FDE252A80BD5D5CD269E24B5C1F4793FBCB825E760857F33AE25EC1C7CE59BB1F11317AA2ACD692205696DF1D3E541F9A738B75E7FABF0FCB111CA4D1CB19715E95621D5CDB'
||'7BBE3DA6A7457E866212304E02C04'';',
'blog_install.i(16) := ''5070A5222BDC7170E7B97BAD3F6E3B8B8EF33AAAA9B8C8586A2E1BDCE020251CCD7BF67EF2D686F0837B3CE2AEB23353F599DAF1604BBFB872AC3599A71A40B00BB2F1477A556D5079F9562341FE9505A2BD97DEEBC408D32A8A55DF3829C32D85F047BB36BB3EF6C9F13613CFED0FAE274'
||'FB38E185EAAD7CFCED2E92ED3847B'';',
'blog_install.i(17) := ''7C96F3F1BC4F8A2D447271FF06BEE790892C386F6D355611ACE326E753B7590D2D88D8C980393EE8BAAF63F3003E9CE502B3D84C53919FB0EC950CB40252F3304B9B9C6AABBB4792EE5EAA0F2C4DFAB6BBE226783AA89114AFE446BF2BCB5D6EDF7195FCA8D0FBC7775012C03840D3447EF'
||'AA99F43663B5DB33ED1B1A2EBED77'';',
'blog_install.i(18) := ''06F7BFE89391732A7706DAD97E0131150D6385CE3011724BAB5AE5AFAED0DA19E6B1FAB7AB4EE91EB14E39D9C9A6BB34644747A2935663374FDADAA37A4D42F2A34A3DEB47AC3890DED97D307BA1FC2E097926A5B6E8DA9BEF8E331FA050ABF9FBCFBA0B2958AEC9555C515D476F10845F0'
||'5FE5CA6D2B1E7935169659C61FCC7'';',
'blog_install.i(19) := ''AE7D9ECB1AE5D18409D88E5EA0C63A99AC5046D3D53D2C305AFDA0ACC5C6DB75EAC37C592982BF7E20B202BCDD1F08D6BA292655527F0A4D38A889DD764575C6EC379DD4EA8C0652EA835FAB4AF1040B2988F1EAB3B1F5A9C84B43E728AF757E67F604FF75DDCE7F099CB70A3BF62D9CD93'
||'F77897064F8ECCC464C73A63EB86A'';',
'blog_install.i(20) := ''6FC6012FDFDDA092AFF1D9D2D65005F59A7A182CBA3A0E741E076AB2EF91431EF6417C7653E77810D4964F52A3D8AC5A79D40E2D63498A2BAE573967A211ACA343555970D6080985F23EC10A6FA6B0B6D4DDBEBB0A3C98F4363E5BE9D6FF897A3C659C104883444FDCFD324C8ED7EAD23B4'
||'7D15116A631707607CD60C05BBB8D'';',
'blog_install.i(21) := ''4C2BE37A3339EA39AB2AE8BE181E361B7508E0672B3687FC2CCFABBB2423F843528FCADF5331BAB4AA27C982D815A785F529E76FFEA98E5A7E2F17D93FBB6275F4D3F5FEFCB2472BE48E01A2CCA57CD5A5AA7F5025EB3F1076F8BDBEF4C1537F768BC45F895FD70F7B29EE94B0BD9288A9A'
||'902D26E294BA509E95A803BB3B389'';',
'blog_install.i(22) := ''4ABF38357548F7062F9F11BA0E014FB0F8019F2A8928F7CEA5113427A44E22B80FEADC37A3FF3851FDD31051E53CD0EC7261EE4B85A1E6643BA33AFC5975944F7DCB90F6A3DA4D1E7FEA5ED84563AA51B8A5E4DBD387288CD86BD5E61DA6C744F54C80E7ECD715FB1BD23B0135957F85F81'
||'5A55E2792D5227DB398BABD8969A2'';',
'blog_install.i(23) := ''6227670633813DDBC3BC204F6FB53DD3B08E1ABF56E1F7F5BB33AD390BCBE0595DB64FF1B32B1367F76F224861E9786753A2BED161F7D3D2DF73CABB6B090668E267555F1A5AC01D1DE1C50F4E65652A7641079A3C4BADDF7381D2D4815445865BCFF0204757A6ACF43BEF7116D8F1A7639'
||'33C1F2E866290FFC8978A7A8DAFB0'';',
'blog_install.i(24) := ''BC0D647E37BBA8F198AC807FF45D5EF9CC3B72B276D2A7E86F1D7AF6FE4CB413F47927A2B7623B41EDA206BB54E3025F7C86B92BF586B47589F9CD6432D3C8E1D9ACDE73C48DD89ECF0E42B81C6B44C6FF5E7636FA999AA223848AD1F9A80B6719AAD7199D2F3999DBE1C88C0FD4B1D21FA'
||'5362F609F2A746D2E66F5ACBFCDFD'';',
'blog_install.i(25) := ''D444673F7527073A30BD75DF26BB16D98EA3FA975D91AF53A8D67602E28E4F6147EBAD2CE27FE14610A64BABAA1FE1E9BC3F9E373F13DCC10E5E36811D50DEE7D955BFBBB930BB50DF71EA959E09EF291EE2A2D85B67564CF22F9BBDB429EF7E378811EF71AB326EF97FAA6F65A8FCBD3EB'
||'693D5D6839B5DD8026166E5BCF6D0'';',
'blog_install.i(26) := ''9D38F88A38B8F059975511249E91C7C70A2E9704957BC62965417C203098653026F72200D77DDE5DDFFA960004EBC5CC5ED4EAAA74F912CDBCC91447C172354FF7977AF0AE6052950DD4126486A6878C33EE25BDB539BF88441ACFFA6D0590AFCC0113F5D48DFE62D593A551B34FE76F661'
||'D94EE55DE5E68D403EDCA269FDDC2'';',
'blog_install.i(27) := ''469A3C9F3E66A98FE570FAD16521C150B2FDE2B10AE3CAB8E1DF4426BBE0CC4935BAF0FFE6E462952BC95AE4C464FD0D5796ABB74C383F334990B4A73E424CD4D76DFC8A2F74B54952FD35F8D1B810ECB4B2642253C85BA573D301FB10A9DDF805C569975A4387E2304E8FDFBC50CAA7403'
||'1F67E45BF61ED668FB752F783BF94'';',
'blog_install.i(28) := ''B4E7FD9C7DAE17CEB150172595377B33666EA7059CE7D785D367BB1C75D17571F866E4D2DE51F874BDD49DE3DC76E3DC61493C3846059A4528E3E902D9447D6A4F7F0D484182EF6E5DEF1CD61FFCA618421FCF399A6F3CBA39137E8551E8DE672AFC216BB363503B6BD08E53157DBC9FCA0'
||'49B2DE24DF3B3DB8C2834B1CEB052'';',
'blog_install.i(29) := ''7116FEE2BCE7342AB73195EEB3E375B0B31CE20833F59E3EBF1A13996E9FACF8D77A339CC5A341297BE7B8C365D4526DD187D511533C53AA6A6A8FAFA77067EE2B38A3BCF93EA2A828EE42071839EB3F4BDD8826A3F0646E4E771E548C0A9AFA3764FC9D15B9EE62BA157DA2769F3FDDD53'
||'F5B0ED4EB66673C0F9DE8EDA9CFA9'';',
'blog_install.i(30) := ''EAE5EAE6BC3B03A15B2EE49D77F204839F097E747B20ED1DC83B1FF458C76E88526E926AD44F319FFBBAC19ACCFDF3DF6F350AE5D3E26E9937460771D3C5E684B2CF2AE3C8C8A69E68E4AFA1DDAA4DB08EB21FCC7CAB24F51326EEE045C3AD5FE86E7FAA0E13B69A6C7A675447E4270B96D'
||'115B9E68381C8344B9A16439DF33B'';',
'blog_install.i(31) := ''1F88D3C64C3FCF1B0017D57BD22F7041A83E56D43B9EF469B7FFEA0D80660AA0925DB1E28FCEE90CABABF6B7CC5E4F77312F330CB4DF229D5CDA6FAF711AA7F2854DA29DBB8676B91313F5C85B3B6E3DE86296B32B84BD3422F6CFC1272B727B12389FA9EFD1278F54978A50D373E13ED53'
||'8FD3277EF235F4C577FD84428FAC2'';',
'blog_install.i(32) := ''7352CEF5D436AD7477A2DBAAF60F5369260B5415D33F2D026ACAB3DBE5074373AA52F1FAA8BA14F7FCDE46FD312289053FF97CE92479A5EDA231DF21644E6B3E79C890787A6B134D3461F04D233BA57E5CD1AA4FFBB51B0ED4A49CE515C1A95AEA539DBBF9F94C95BA72BA67E323E58576E'
||'5780ACB287ACDEC01924A3274122D'';',
'blog_install.i(33) := ''78ADCA753F1EF19522714A42460F5A0A2BFE185126D165CC15425AAED239257475C11D995199889219FCEED215F4D5909399667AE1C7F142CEEC1AF83370BF03A54FEE357C986A1E7C9867B7EEDE2BD71F2203A8DCCA66947F0437DF4E05C28DA9DE45292C4485E1DFC8172386FB7C8EEAE'
||'EFAEFC8895F75AA4E35F6927EF95B'';',
'blog_install.i(34) := ''82359F9434A8AEF3F9AD1F02FD2F95BBD9E0EFD3F612A05DCE6F509A695498F3F2E1D3FF41A789FCA55C099E01C9CAF7F91E4C4DAE8FE20431433E9F0DB2F85163BAFAF04DC919519EC6D439699B9FCB94B3ADD7F639787FC8966A3C9242F940814FFC1348A3585EB1AA43C5399F30FAF26'
||'A45F20BA87039A91CB457ECDC53C6'';',
'blog_install.i(35) := ''D7CCC8180B9F17D8D66934B1869F5945727394FB4C227F6DEE41544F8D5DDFE659673785E780F0CEC9343FCF3ABB9AA8AA329EB373E010987E9D8F1CD0C93D77FAE26BD639DDFFEDE87223A14F3AD15FA52282F2DA98F1A02B2054A5E4F361B0295FCC5EF02F18EE7386BBF9324BA7E17BC'
||'EB63E9F9A1AFB6E589DE35269A223'';',
'blog_install.i(36) := ''10C8496DB50FA6DCF85BB0BA74854728E6F931C44E8E62CFB38065D67CFAF55FE34FB146885A3FB5CB2DDA8E74E856EF51B876DE805B8FD8EB71C43BDE8F50AEE846EDBFA79417D05AB54E91123FA47A12E99719EE5D874137B34B81CB930B051067F78D2AAF12F18671CF4450BDC27E562'
||'5C5334FDD43369917E541C7E3CE4D'';',
'blog_install.i(37) := ''5CA1BC5E5D593ECF49FAB34FEA029B067E499F9CAD2DB4CFBBB2732D51B6A1FA93ABDD1894F667A352F7DB455F8D89FDB3C70FB19262E9759C34888FFDDC69224751554A4079163FF88742667AB819FC99EEAC79A8BA86007CA34A7C92B8BD6E7ADE1688DFB93C7943FD5A0E3F48F813CC9'
||'3C3D27A122D59BF305BEF554967A9'';',
'blog_install.i(38) := ''AE9BBF60C30132B9DA05EE2CF22E4E2AEAFCB163377C41675F01DDAFEAF2E486F386C786FDE68D78E22272DD9A2E55071F555ABBDBB50A2BA4738FDF6CEE0BAEA34DC322A7726E49D8CAE77CFBE9D7D98ACC211B15C1D5C1CAD5EAFC66F32A479E23D4F853590CD5B88B003BEDF40433946'
||'BD28AEA1DF74E42DC4FE673F64AF2'';',
'blog_install.i(39) := ''750A69F9B8E42C04BD8D78FE921EB137B83F1371694A35B59B9D4134391CA81C797E5CAA26C1BEA2947F15D56BA3E971BD28D233C16A9C6E7F70B6A858B9B8EDAA5360D76105B28C5DF1DB0F7F59711DCC2EE54F46779D774610ED225579AA633A3CEDD766BDB73495D97390796BA6F6AFE'
||'3206EA1168B3B55535A58F27A7751'';',
'blog_install.i(40) := ''0A20070BFE5C6A171F5E4C4E944E513CC15B310520F8AAAAFA756C7E00D1E85CC13C79A05DF88B4FE898A7E2A883D9CC74A7861037DF5C64290C23115F776620ADDD5457DD1F677D5F6B5F6C69D42C17BB6AFA03B0EE40295C4AFF506C018904946790E9F363633EF8B739D5B83DB926C3C'
||'F4202C623BC3BDCEDFEFF031E5434'';',
'blog_install.i(41) := ''1427AB370000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bg-noise.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000019000000014080300000094379B84000000FF504C5445FFFFFF58595B59595C58585B58595B59595C58585B58595B58595C59595C646564646665656360656461898A808A806A8A806C91928593866C9B9B8A9B9C8C9D90739E8C68CEC699CE'
||'CDA4D0B675D1AA57ECE8ADECE9AE'';',
'blog_install.i(2) := ''EEC258EFBA40F9F2AEF9F5B1FAEBA0FAECA0FAF2AEFAF3AEFAF3AFFAF5B1FAF5B2FAF6B2FBBF33FBC23BFBC23CFBC94FFBC950FBCA50FBCD5BFBD671FBD771FBDB7CFBDB7DFBE087FBE088FBE188FBE693FBE694FBECA0FBECA1FCBD2BFCBD2CFCBF33FCBF34FCC034FCC23CFCC33CFCC545'
||'FCC645FCC646FCCA50FCCD5BFCCE'';',
'blog_install.i(3) := ''5BFCCE5CFCD266FCD771FCD772FCDB7DFCDC7DFCE188FCE694FCE794FDBD2CFDBE2CFDD366FDD3674561C4FC0000000E74524E530050509F9F9FBFBFBFBFDFDFDFDFB8B4504300000347494441545885D5596753DB40143C128220BDF7C4726C4BB2416EC4B8515C900BEEE5FFFF96EC3EC9'
||'984CBE040137734FD22BFB76CF6F'';',
'blog_install.i(4) := ''E6247DB09412DBD9B5ACBD03EB3F6DCFB20EA268DD8CF7ACB97789097387DBF1ECFD6747CC763C381781CEB55D9790CBCC711D8725129A6D4B1091746268B448CC9ADBE17EECBEFC46D885860437F41E75E48AE712A2A7B73D89B6E7C8A2E4387134DA2406CD8DFD78F226DC265C115FEE2A'
||'2EE245B798ECE6661157523BBCF7'';',
'blog_install.i(5) := ''1CF98D70E9DB6A3449CC9A1BEFAB9710D914D0C9A343162A5B00479E36D7F63CAC863579DA78BCEC701959CE0B57BEA54693C4A8B93DA59E7E47E209237AAD79D1EBEF3A3AD1AB58107906F9F845EF41D7B637BF1C47F3F012A3E676D5CEBB54229D486552A9542291429246920102CBC067'
||'32C013E9349A29F61319B9324226'';',
'blog_install.i(6) := ''035CE1C4D0E891183577423DFE94AC27938D463D596FD49125EBF00D140DB83AAB5FC0920DB6C023935C39938DEBA41143A34962D4DC4965D56AD559AD369BCF66F3DA7C8E509BD766E26174D579B536AF022103D0AC3A2334030A16B179B51A47A34762D8DCCA3A99564E2A155CD1C153B0'
||'93CA14195ABF05AA901471A6958A'';',
'blog_install.i(7) := ''9CD39029C4381A1D12B3E6AEA8FDF26432194FC6E5F1A4CCA3CC7A320602CFA2CC64030118C3881C8BE69820BAE5181A3D12C3E656D6A8342A168B2318BC242589C53094465725B4C276C825BD5444BF54BA224F7A71345A2466CD3D52BB5F56C3E16A355CAF8648D6C3ADDDCCA55C03111A'
||'2245C3D57A7D77CD434B0C9B5B3D'';',
'blog_install.i(8) := ''FAD02BF47BFDFEA0D0EFF7E80ABD419F40AF3018201DB08B836D94851E7C81C8802061E9F5636934490C9ABBAFD48B1F819FCFFB70BEEFE7034902DF0F80110A828075900FF2028604B823FF88394804FD381A2D12B3E60E94DA79DDE95E763A383B1B1FA597DBBA4BA0DB95FAB21BD6E2BB'
||'D7ECDB6B3449CC9A9B7FF6BE6DB5'';',
'blog_install.i(9) := ''DBED56AB956BB772B95CABC5BCBD09C0D0C8D11D22B60E49444E8716909C580C8D1E896173CBDFEFAF7E66C52E709D6737767EB149B2DBE42C2ACEB217E7670C44EFA4D1203169EEF003D5F38F5F17CDD3D3D3C562B144385D36792D58D3379BE82E908011F6E097F464135FC6D268919835'
||'F7426D3FE16E6C3FFAAAF8CFE74F'';',
'blog_install.i(10) := ''DA5F9F79857270038EA1D12331666EEB0FE55DE3B9FA3BCBD00000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bt-alt1-l.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000000F00000014080600000052C76712000001A94944415438CB8D94BB4B034110C6F7FFD14E3B2D6CB44EE785A4F07551248D013B85543E620A25561A8D8D858591A4102C6220A26220C607982242B48988412192406E378C37BBF7D8BB9C62F1'
||'E3FB66766777E7D85BE2F707F38A'';',
'blog_install.i(2) := ''3FD083914FE9F800807841B45616B45686D3E19AB528970E613719871955AD792D42E4C99AABD8A4F17E0CEBB128284A20F5EF9DDD0B6F2556005BF128F6DA5DF7EDACB468469CC068C13AB63C816BDB3E91B38534A821B5268ABF4F406BA605E83969E8346DAC398626931B7C77A27D1C00'
||'421BB69A5E1E93295FEFF0DE09AB'';',
'blog_install.i(3) := ''6F0395606F3A722CE5693DC163F47817087D5D03072F065E79C9F362565D06F6AC2329AD2EF5E4E43CAA28AE4400A14F0B3615A1EE31334644F143084CBA8FB320C7CE3101FABBD345D0EF7E8AD05200D82D1204EEAD58E444EC1CDBDB8CE055F5117AE3038415853A284A18733E0B0AA8D3'
||'93E292B0CB51605763E050B79788'';',
'blog_install.i(4) := ''45C3F6F56485614068618823C7DC5FD83EB11AE6BD5A3F06CD0FC06FB0FC20D7AFB3117DC779C71FC58BBBB97EE89EF70343CDA1F67145EE8FC6613F3E07EAD484F763E0F504E95FD2F47F3E433F938095B0E2B532120000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bt-alt1-r.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000019000000014080300000094379B8400000171504C544558585B58595B59595C5657595556585556585556585555585454565253555253555051535050535050525051534D4D4F4E4E504F4F51505052545457545557515153565759595A5D59'
||'5A5C5657595656585E5F61606164'';',
'blog_install.i(2) := ''66676A67686A67686B67696B68696B68696C6C6D6F6A6B6E71737570727477797B77787B7A7C7E7A7C7F7B7C7F7B7D7F78797C797A7D898B8E8E9092929496979A9C9D9FA2AAACAFB0B2B4B3B5B8BBBDBFC6C7C9C8CACCCCCDCFCDCED0CDCFD0CDCFD1D6D7D8D6D7D9D6D8D9D7D8D9D7D8DA'
||'D8D9DBD8DADBD9DADBD9DADCDADB'';',
'blog_install.i(3) := ''DCDADCDDDBDCDDDBDDDEDCDDDEDCDDDFDCDEDFDDDEDFDFE0E1DFE0E2DFE1E2E0E1E2E1E2E3E2E3E4E2E3E5E3E3E5E3E4E5E5E6E7E6E6E7E6E7E7E6E7E8E8E8E9E8E9E9E9EAEBEAEAEBEAEBEBEAEBECEBEBECEBECEDECECEDEDEEEEEDEEEFEEEEEFEEEFEFF0F0F1F1F2F2F2F2F2F2F2F3F2F3'
||'F3F5F5F5F6F6F6F6F6F7F6F7F7F7'';',
'blog_install.i(4) := ''F7F7F8F9F9FAFAFAFBFBFBFBFBFCFBFCFCFCFCFCFDFDFDFFFFFF5C95AA700000002F74524E530000000507080B10121B1C575A60616A6A74788E979EA8AFB0B4B6C2D2D3D5D5D5D5D6DDE1E1E3E6E8EDEDEDEDEEEFC730C10F0000023C4944415458C3ED983D8B15411045CFADF6ADBBE237'
||'3C11D6455C7113F1031303134131'';',
'blog_install.i(5) := ''F6FFFF0B13D7C5ED7B0DFA994F300C1DBC0E8681390387AAA9E9AE92203ADB9D3E3CB15204189732E54A242B929C223295459856A466B1D94403D11EEE1F3D7F7397E39A60499C3C3DFF7A728CC43409B9B3BFF8768CC33C09E1C9EB1FC7304C9490B3973FEB18868912F2F8EABB2102BAAA'
||'AB88227081291780CB1496223ACB'';',
'blog_install.i(6) := ''B015A9596CB6D0D0F30F9F7E2B15A410B9501221AC713A9388B00406A145D89A1473D86CA2A1AB6FBBC42D2361850B22D40B2BA5E042BDC663D117632B5293D86CA2F1FE4BFA484DC5E51A7FAF082C843994AA5B2072458B3056A426B1F1261AEF3EA72B522FE48A0B418250AF2014852008'
||'549465182B529EC36693A0E8F5C7'';',
'blog_install.i(7) := ''B38CFDBD372CA382DEA08BC31D2EC05417A3E81660AC4A4D61535B68E8D9E59BEBD61B9D466FE040EBD0A2DE7AA903280D20EACA526C456A129BBE85861E5CBDFD45793489A175D028191DE65EFEFFBE9B859B17615A919AC4A66FA271FAE2D5BDDB321A58900B8872E84E648122A294232D'
||'C36A454A73D86C1214E9C1E5E5F5'';',
'blog_install.i(8) := ''AD126AEC2240285C5D92290B8CC629BC2CB74598D6A4E6B0D94443E5FDC5C5CD9F80849543F7A3A043474950609C2428D7228C1529CF62B381862AF5E4FCDEFEE6AF234299C1A1280A45AF940F25EB92976159939AC4660B0D8970FFF1FE4E2B4986C282502E333E0B29A3E4C6D465199615'
||'29CF61C3161A6378B7DB9D9ED6CE'';',
'blog_install.i(9) := ''F8FF5406511E1B4DA0C5629416A416615A91CA1C36DE42E31F28200090C20819440000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bt-gray-l.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000000F00000014080600000052C767120000022A49444154384F9D94DB6B134114C6071F7CF29F111FEDA33E36978D49776B6A6B4D6BD4962248D1A45A2862BD14F182E2A3B44544441441F0456DB58860AB05937473BFB48D644D9A6C61B7D090'
||'E39CD99DCDB420550FFCF8BE39BB'';',
'blog_install.i(2) := ''67CFCC64262432365E8D522263576CB5FCF0C879D51F90673A5DEEA0CFE73F202BC709A22841A608813F846118F0239E80274F9FC1D0F048CCE3911459B68AF62C16A35E6FC09D7B0FC0E5F6DEEE92BB9DEE7F55CCE3F1F42CD0198CFF536731AEDF9C824E97E7C87F15174BAB70B23FB418'
||'0828FB49B3D904647B9B22789E17'';',
'blog_install.i(3) := ''69B55AEC0377EFB3F51F26B8AB8669D2DD352DE5EC1EDB398C85CF5F80FE7C51D2D075D0F54D40E5E05877D466D352736B0B0AC512F4F6F53F22B58D0DA8D52CAA36BBBDF84EBDD1807CA108A74283B3A4A269A069BFA0C2D06CB57C3B4FA958CFAAD51A64B2792C9E21EBE59F80ACAD9799'
||'EE057E144F5ECF89BE8704B71E29'';',
'blog_install.i(4) := ''ADAE3115C71C3187DD5FBD7E0392746C94E4F2056853743CAE8B79A6ED7C99769FB87AAD454FDA4192CEE6209DC9DA709F83141FF3E754B1F3DCFC0228DDC177F492EC236A320D2BC914837B27A75A5EA51E8B53E90C8C5E8C985EAFEF103B9EF1840A9CC40A5544C821B8BB093549A73B89'
||'1763D0B9186201F3B66267EC8453'';',
'blog_install.i(5) := ''7E3FF7112E452F1B6E8F7441BCD364E9DB322C2E7DB7404FF94AFD87F94FF0FCC54B98BC718BAD51F2F93BC43F02567C3A7C2ED6E66C2C7C66281E1A082F077B7ADFD28209BABEA3812E654711E737F907B261151E67FE0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bt-gray-r.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000001E000000140803000000AD757DF60000007B504C54450FF279E0E0E0EAEAEAD5D5D68C8C8EC0C0C1CBCBCBA1A1A26D6D6F727274B9BABCADAEAFCF'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'D0D16A6A6C6B6B6D8A8A8C939394BFC0C1AEAFB0979798A4A4A5767678A2A2A38E8E90E9E9E9F5F5F5F0F0F1EBECEDD3D4D6'';',
'blog_install.i(2) := ''E7E8E9D5D6D7D7D8D9E4E5E5E0E1E2828283DADBDCFEFEFEDDDEDFF9F9FA777779FFFFFF7D5F44350000000174524E530040E6D866000000874944415418197DC1871282301040C1178ABD77402CB15CFEFF0BA588C04CCE5DAC8F0C0D35E735B036A0E4148391A1E0346614004E155AC0E9'
||'B6313C75A708DE7FEC21A9482B69'';',
'blog_install.i(3) := ''AD0C694D1A69C72E24FB925AD67508C91B52CA7B8E86DB8F88DCFAC6706FC9BD6F16C14BB78CE1A19A58E0AA592F02E0A2D8CC0D85B3D7546C4049BC8686CA0755EF47E002F951050000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''bt-pulldown-gray-bg-r.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000042000000160800000000512015D500000009767041670000004200000016004BDAA3B9000002094944415438CBAD94CF8BD34014C7F3FF6DB5699AA61D2FBBA05684F50708A2AFDE02EAA17890FAE392833D143C05D185789B1EBB742F014F'
||'D3AE0B46846EC5F59016BABBF37C'';',
'blog_install.i(2) := ''9364A26D4069D7777A33C37CE6BDEFFB26065E388CFF8090FF8EC2A5B30B21D4F2F4F527CC4E86DE6213C4FC55E9DA3861E1C176E9E52C414C45B47C29CA3762215610F87E8B55AF0B950D776C567A4B88B00D00ED507210E935EED286CB551AA86C1FFB90448A98409999373E230EB7ABEC'
||'F2E313430EA03D1003D7CF113E74'';',
'blog_install.i(3) := ''421176C02718F822ECCD08E1F729322D262D93D9BB470754C3A52773D2C2756355B0D48808BC84E4D1D283548B3E8C7E6B2171DA2AB3DAAD1DBB613E9DA13404F0ACED0CA18B11105041415C44483C7E6431A7CEAC6773DA307205F4DDF4650AAA664AAAF4228578E1795EA011124FEED758'
||'C3EE2ED4FAEF081973D27A5444FC'';',
'blog_install.i(4) := ''B85363CCEEC80411AE361240982CF501495A68E4E89ECD6A0EB3DE9CAB46E254CE28D60891CB19252A5335AB721EEE5658F566D369585D62E4436DC7F41CE75CE4430D68BE94F5A0AF87FA3D1DEA61B3C2CC075FF61DA751A13AB4B55C652D153CB3569B6B9305A8AD354AAC356E5A57CCD6'
||'04F1A36274CF8C653F170C2E44BC'';',
'blog_install.i(5) := ''6C701C5D35A98663CA70AF52AF6F7D58FB33C39F1DAB0C935494BDAA7977BCFE978AA7CF1F4EB3C9E0BBDB5F37FA5F2C66A88FCEBFA989AC8D90887F1CC98D102BF10B91BEF77C2B5AC5B30000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''closelabel.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000170000001608030000001CA8F737000001EF504C544500000000000201010102020002020203030104040405050506060406060607070507070709090709090B0A0A080B0B0B0B0B0D1010101111131313151717193737373939393A3A3A3B'
||'3B3B3C3C3C3D3D3D3F3F3F404040'';',
'blog_install.i(2) := ''4141414242424444444545454646464848484949494A4A4A4B4B4B6A6A6A7272727474747676767979797B7B7B7C7C7C7E7E7E7F7F7F8080808181818383838585858686868787878888888A8A8A8B8B8BC4C4C4C6C6C4CBCBCBCBCCC7CCCCCACCCDC8CDCEC9CFCFCFD0D0CED0D0D0D0D1CC'
||'D1D1CFD1D1D1D1D2CDD2D2D0D2D2'';',
'blog_install.i(3) := ''D2D2D3CED3D3D3D3D4CFD4D4D2D5D5D3D6D7D2D8D8D6D9DAD5DADBD6E1E1E1E2E2E0E2E2E2E2E2E4E3E3E3E4E4E4E4E4E6E5E5E5E5E5E7E6E6E4E6E6E6E6E7E2E7E7E5E7E7E7E7E7E9E8E8E6E8E8E8E8E9E4E9E9E9EAEAE8EAEAEAEAEAECEAEBE6EBEBE9EBEBEBEBEBEDEBECE7ECECEAECEC'
||'ECECECEEECEDE8EDEDEBEDEDEDED'';',
'blog_install.i(4) := ''EDEFEDEEE9EEEEECEEEEEEEEEEF0EEEFEAEFEFEDEFEFEFEFF0EBF0F0EEF0F0F0F0F0F2F0F1ECF1F1EFF1F1F1F1F1F3F2F2F0F2F2F2F2F3EEF3F3F1F3F3F3F3F4EFF4F4F4F4F4F6F4F5F0F5F5F3F5F5F5F5F6F1F6F6F6F6F6F8F6F7F2F7F7F5F7F7F7F7F7F9F7F8F3F8F8F8F8F9F4F9F9F9FA'
||'FAFAFAFAFCFAFBF6FBFBF9FBFBFB'';',
'blog_install.i(5) := ''FCFCFAFCFCFCFCFCFEFDFDFBFEFFFAFFFFFBFFFFFDFFFFFF2323CA7A000000097670416700000017000000160017993AFD000001BF49444154181935C1895FD2501C00F0DFCC0EBAECB210746AD9A1164444761F9625D97D52D68AC6C4177BE56A4FF7F4D55E3CC145B8484BCA8A0EF787F6'
||'D1E6F70BF3A5CAE4DFB94AE593EF'';',
'blog_install.i(6) := ''07AFD568B515C66F5C3DDD77AAB7FFAC2F79E9DC99E34782307DFD51EE75F6AD35E2D3087144A70C53BDB9B9D2D878C65A42A92094A14410FEF4E54A2FB3E688B98810420D6EDCEE09C1E713CFC6B2A65DB02C8B2EC298169DAE2698BF3C3935911FD64D932CE186A2CD74EF86E97E73582F'
||'E8B645FF43CC31D468334C5CB1D7'';',
'blog_install.i(7) := ''AF5CFBD8162A76555C5F8F595145B116F83E001FAC153ABAE76285B9E90D228D093F1886DFC736DE7A98A714024C1392B4091703AB79672B142EC242066BEBBE60A092E74902EA007A7640FE1A64CA88AE4A93C09B2D1F7F49A9CD5ECDEB0AC1C2797D0D00571A60F6CE8BADD2B63A0E0DD0'
||'DD064F07EC9451D50CE1DE7F37FB'';',
'blog_install.i(8) := ''64F48173533025DA013F4F16348E094BBF7F35FA7CE8DB90EA308AE24D3093448AD00459A61144712208EC4299094C54E27319C7381202EF680A518C05F1A97739E19116A826BFB241CE08F595994B07E3ED2062FB6289FD7BE39165D103870EEFE900B97167B8B1AD3D2CFB9AE5EDB2BC2B'
||'F40FDD99B89999DE113A00000000'';',
'blog_install.i(9) := ''49454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''code-20x22.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396110002000E60000B95133BDBDBD999999DFDFDF949494DBA595F27662D6D6D6E6554BDD7772F5F5F5CE6153E7C4B9B5B5B5F3A6A2EE837CD47064EFEFEFC5C5C5ADADADF6CFCFFA9986E9625AD66D63BD5B3FF08B76EE8B80F49F9DCCCCCCF5E6E1C3644BEAB0ACEEC8C3E655'
||'4FD75C50F0846FA5A5A5C34F33E2'';',
'blog_install.i(2) := ''7E7CF19C95F0907EFFFFFFE7E7E7F8C2BDE36D62FBEBEBFDDCD8DB554AF9B8AEFAAA9CEC5E53E47770C66A53EE6551ED928DEBB2AEEA827CBE5339FAA290DE6A69EFCAC6E0645BE0AA9FF8B5A7D04E3DF3725CF9D3CCE37778FBA89BBD634AE65951E97A6FCD6757EE695DF7E7E5C04C32FC'
||'C7B9F37862E6574BF6836BF7927D'';',
'blog_install.i(3) := ''F5AEA4F18D79F5A29EF88B75DE7873E87974E75C58FA9C8ADB6864F0B4B5F48D80F2ACA9D65F53F9CBC3CC513BFCD4CDE37E7CFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000000000'';',
'blog_install.i(4) := ''0000000000000000000000000021F90401070062002C00000000100020000007FF806282838485850A03010D0D01070A86622A011C032A2A070D1303852A0D0711031C1C0789249B820A8D111C12ADAD98248F6207122AAC01B8B907021C828DB48BC18C120124820DA10129CBCC130D1C02'
||'C7B4CACCCBCE1C04BEAD9913DDDE'';',
'blog_install.i(5) := ''C4D1B32498DCDE13070412A8CE98E6E7130211830324E7128B120724040785F4029338042020A09FA15524041094200F92C387100BB5D06262C78E2A375A40A230C4C60A215E7EB0B8C0A310851D5C5CC0D081850893230B400C6A31C4818B0A28A44081424524122582B4E00083054A8627'
||'489F348902C487A0305162649041'';',
'blog_install.i(6) := ''B5AA812D566808DA0103CA886ACB9C2439914350961848C1A6706281ACA0041A4DA0047142B7AE9307553C08FAF0C2418D1A769D189952A280A016105844A16A774A170C1D06F158D0C3C1030B571E6C10018041211048BE58B16163C6120C9E0D29F14103430E0F052247741808003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''delete.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''0000010001001010100001000400280100001600000028000000100000002000000001000400000000008000000000000000000000001000000000000000CF892D0000000000FEFEFE0000000000000000000000000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000001100'';',
'blog_install.i(2) := ''000000000011100000000000000100022222222200000002222222222000000022000022200000002200000220000000220000222000000022222222000000002222222000000000220000220000000022000022000000002200002200000002222222220000000222222220000010000000'
||'000000011100000000000011C003'';',
'blog_install.i(3) := ''00008001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080010000C0030000'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''favicon.ico'',''image/x-icon'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000080000000800806000000C33E61CB0000129A4944415478DAED5D697B14C51A9D9F902FF783DFFCE8821864512F484216364522DEC50B82418CB2E81544404420216C09D94842B699105064BB4A8080F22890807A4149880B5E495812203B49'
||'26997D4BEAF65BD3D3E9E94CA0BB'';',
'blog_install.i(2) := ''AB7AA63B763DCF798490389D3AA7ABDEF7AD53550603C556BBF02F510C9218A432A866D0C400E9204213DB97A96CDF4619D4D698874A6650A9931536405F27479AF4285695E6500F796DD9A3E8C69A31A879E304D49515AF4306A0EFA00FA12F47108299E5202ADCE48724BE61D563A875EB'
||'64642E9C8D6CA6793A2802FA14FA'';',
'blog_install.i(3) := ''16FA7824218483F86806F5FC0FAF5FFC08BABD3EFA81A4F7E5CF42E6BC19A8272396C5348CDE4C1E7605C39CC543765C10FA7204C81D427F5E00F17EEC1E8205902F40C110AC8042404230F6F8610BA028048AFDB01727FA511202A57E38F8281B0EBB713683971E2806E873E87B8110809B'
||'68A5C85F29541E3C84A5E4E5610F'';',
'blog_install.i(4) := ''D85FF822EADE118B3A373E8B5A3F1C8BD1B686C1DAA739B4AF63F0911F1DEB01D1A8E3E368D4B981C5277E746D1CE7C7A671E83E60338354C033A83B8DC5163F7AD2596C1D8F7A01DB586C1F8FCC801D8009C8BC7302EA0364B0C89C80FA01BB26FA9135115900D92C7226222BC62464CDF5'
||'C396C762378BFC49C89EFFAC1F05'';',
'blog_install.i(5) := ''7E380A79D8E38773CF73C859C4A27808AE121E4A9FC770C37F8D31C8699C8EECA639C3FA19FA1E38083122ACA44D7E85707EEF61DE68E103F56625A0F68F27A2960F18D2578FD5C92724DF5DC68311C43015394CB386F53B7011224EA8A015E8550BDFFA50C4B7AD7B0613AF93AF0CF9000F'
||'0BB7694A482184180DAA89024421'';',
'blog_install.i(6) := ''F910840887FAF64F26A196554FE9E487897C8F2980BF2277792C3335044FC1C0913065241EF621D880B42468D8C98843F780789DFC8890EF291F82D33433881BE04A10205610057C42F23BD326EBE4AB847C2F0B577930471D3B63E405866CAA1772D8B79626A18E4DCFEBE4AB8C7CEF5E3F'
||'DCE5710C4FAF3C683A88162380FA'';',
'blog_install.i(7) := ''9102BEF60D9374F2554A7EB008460C0CEBC554F8B8544F1FF6B5453E7C0DBED7650A168120454C7D50CAC79577F979BE1EF069877CF819F8FF398C3382EA0482B271D403DF7EFED00FA99E4EBEB6C807C0E7D88D73469A0A52477CFB217DE09777F53C5F9BE4C3673A4B6282CAC6BCD4D01C'
||'6A3D7FD8DB0F153E9D7C8D925FEC'';',
'blog_install.i(8) := ''7F267BD9CC91468164BE003833077F554F2FEF6A9B7C80A36872D02AE2B00A213BFC73EBF9416F3F01F9B6732588DFBCEDD791A7A99683E3D2E7C85E5D826C67B250FFBE14D457FA9A4E3E6DF299678467B6970E8D02023F419481F5990D2BFA90AEEA090520B6F93A1A90FB7A35725C2845'
||'D6A3AB515FE11C9D7C12F2E1F728'';',
'blog_install.i(9) := ''9C325271282928FA0F0CFF10F9930EFB720510AA0DF4B5214F03238A6FB39065EF7C9D7C29E4C3EFB3FB596433CE0D350DA4722B7EFCC20F983948E77CDB797A02082508F76F55C87E6C35EADF3D4D27FF61E4038AA7872A0C551B02D66D301F72553F0A4E1E2505206CDE1B35C8F1751AB2'
||'14C4E9E487229FF97DADF92F70FC'';',
'blog_install.i(10) := ''02D701CBB921301C8003959B272844FBF6300A20D0065D16E4B9C68C0C4797EAE4F3C987DF9FE98700BFC07580778370C9170C9C34523D88F023D906FBDB90AB2607D98AE275F219F22DD9CCEF5CF222E717185100E0DEA591E7475A00FC51C1FBFB2964DF3BF74F4D3EC05A3CEBE10200D'
||'B368D228F5A0410142BFCEF14727E'';',
'blog_install.i(11) := ''B9F44F493EC4466071972400920A9F1A05C065112D75C8B12FE94F453E6448D60251029846A5BC6BAF51AF00B811E10F6644D89FF4A720BF3F93C98AC40A80466DDF5E538AB4D0065D56E4FDC9889CA684514D7E7F0623807C1102806D5A3416761C1A110027044B1BF27CBD76D492DFB77'
||'322DE0A275A00A4AB7A5A1300171F'';',
'blog_install.i(12) := ''DCBE805C075E1975E443E95CB400682CE9C2628E669B9B99167EC81D55E4C3021A6C8E7DB800764DA3B29EAF6901044683266634A8481C15E49BB74FC03BA4C509808299C3F2690A725C2CC570FF5285BC776A39686D34F054ADD03CF9BDDB26E0EDF2A204102E278FB5623EB21D7A07B9B'
||'E2F43EEDA83C87757BDE2F0D59934'';',
'blog_install.i(13) := ''4DBE740144D0C665DBBF00B9CE67E3553E28E5AA265368BB8A3CFB1335493EF0214A00702287DA3C7CF6CF1620F725231AE86A88BC08AC6DC87B6C91E6C8EF496704902B41006A3570C2A28EFB420E5EED8B645CE0FB769DA6C8EFD92241005A71EF3A0EBE8E1778A09A1791B8E0E256CD9'
||'0DF93361EF5891240769CE6ACDB8E'';',
'blog_install.i(14) := ''B204E4F9D188AB79614F15AF966B82FC6E10404E9C480168D8B7EF3EBB25EC42186C3CAD7AF2BB190E450B60346CDAF09C4B0FAB10066F9C5635F9F7373302C8162B8051B463C77BC58483B6B08940A5E4DFDF245200304C8CB6ED5AAEBD09C877FD54786202663A5023F900B378018CCEB'
||'D7A9E93CBC3322DF87E3BAC3AF2BB'';',
'blog_install.i(15) := ''363202C8122980D1BC51D35D91880952DC6D549DAE2AF2BB3E1927510084E43BBE4A45DEBBB5B8BE0F5E7DD70F65C8F55F06D5D9D8B70FD5BD48FAF6BD552B148F0D3CE7D355437EE706B102C88DA3F2E603E162FDFBDE9B35B8D4EBFC626978ADDBFB13717D5FB1E6B222D79185AA201F0'
||'B60970401900EFB620510720E6DA9'';',
'blog_install.i(16) := ''43EE8B39C879686158ACDB037526453D874E6342C4C9EFFC781CEA152B001A733E8900845E3DEFCF871577EFFA2EA42B36250CDC6F8C38F91DEBC7E195DE870A00CEDAA711F0D112405047B63223C3B92D8AB977BD956F2826026FFDE188928F059029560014A27D08F89474F04281C7559'
||'E40DDBDEB3DF22A1AEC6954E4B99D'';',
'blog_install.i(17) := ''556B22467EC747D16205104F25D5732B288020F32608616F025D03E781E98A8800CC2D76D3DC8890DFBE4E8A0028E4F9611180D0C54BD3BDAB90087CF7EA22423E1640861801EC8EA752E409AB00026F5877235D03A7422280F828DCE4B7AF8DC6BBBEC409804285CF7D29FC02082AC5323'
||'93E1503E767D3B1B06837DBBE0561'';',
'blog_install.i(18) := ''25BF6D0D23809D220540A3BC0B859D887BF74EADA062E0042328EDECC0D7D91056F2DBD63C2D4E00B07B84466D3FD202E052C73A131503A7E78B45D445E03C9B1D36F2DB3E142B80FC782A0B3B6A110067E7FE743AB181D37D6239F5ACA02F675A58C86F5DCD08608758015058D55393007'
||'06733C11C147A480D9C9EEF73E926'';',
'blog_install.i(19) := ''30BF5485857C40B75801D058D2F55C569700383B3723025203A7EF0FBAE612CB676F2B4E7EEB07520440613D5F950260453070712B9181135CC850DFA756266EAE559CFC96554FE303401F2E8082782A660ED7376978558F6647510D0E032290E9E1731E5C48771438B25A51F25B568D45D'
||'DDBC50A4021270FACE8B92A9721CF'';',
'blog_install.i(20) := ''77B978188DB438F0C60E020327EC50A22648739BA2E4B7AC94208070DAB86041078E66C1A64D77F877F840AD80C4C009A55D5ACD5AB95931F2EFBDCF08609B0801C015EA91F4F079CEACC50733843326F07CB988E0F8D5B914478156C5C8172F80C278551838DD07E7A18186D3E1191598C'
||'F70ED4D946DE0A4E97DE83FF88122'';',
'blog_install.i(21) := ''E4DFFBF758745F9C0012D475E4FABE44BF10C2B0904462E08423ECA918496FD72A42FEDDF72408408D47AE7B0ECD53D6C00941211387C83570DA0E2DA5F61C66530A75F2EFBEF714BABF55AC00547CDE3EECCB57725A709F5E2BDBC049EBFC2367DD49EAE4DF7D57AA00547CDEBEF7B072A'
||'301B878F139C2320C9CD6CFDFA1F6'';',
'blog_install.i(22) := ''1C9D6953A9927F47B400F62468E6B285816B4794990A5AEA641B38A1B64FA53054B58B2AF977563002481729002DDDB401153D45A6829A1C59064EB8E58C8A087B5BA9927F67F953A84B8C006C5800DABA66C577FC0DEA71012CD5DAF6C4CB3270C2B57734DAFDBC7F5223BF5992003478C'
||'78E1222F05C3B25CBC069D9FF361D'';',
'blog_install.i(23) := ''DBD87707A891DFBC0C04102342004509DABD63470111C09985720C9CDEF6062AD3002DF29B978D415D5B440A40CB172CE13491664078B74E967BD77A7C3395CFEFCAF90715F29B974A1580862F58F2D6A4D31D050E2D9565E01C74929F726ABB78800AF94DEF4811C028B85DCB779D5EF91'
||'80A3C72DCBB704136F108D4D34A85'';',
'blog_install.i(24) := ''7C2C80342902D0F8D56AB05D6C90A2DFC0523E5FB27BB7B7E8352A9FDD9E3E9398FCA6B7C7A04E5102284E509EFC7D8978981E68BE10B4E902FE0C5FF35DCEC39B34490D9C703803B5BAC0AF55B2DCBB3E732BF167F7556610932F49008A91CF100FC7AE8B8DD4E10046DFD157890C9CDE1'
||'FE97913CD59B192DDBBF61FC8A701'';',
'blog_install.i(25) := ''C7AFE789C9BF9D225200F6E24445C807D385AC13BAC0C97BF623220327AD83A5EDDF644976EFF614904F03030E0B31F9B7539E449DA96205A000F9A4F9393671CA3470BABFDD422725EC6890E5DE857C9EB47564FC9D88FCDB6F89154049225DF20FCDA3569CF19E5E21DBC049CBBBD757F'
||'A2FC9EE5D47ED09F2E9E7CB0C22F2'';',
'blog_install.i(26) := ''6F491100CD808FEAB22DF8F760D7AF0C03A7E33F740C1BCECB0725BB77FB8E6E22AF075C3E4E44FEAD25720440483E3E8B8FF6526DAD49B6817380422C00255EA9D6EDCECD2F906BFFDE7522F2B100364B1100853C1F523A450C9C324FE0749E49A3F208BD392F4976EFD2880348C8BFF5E'
||'693A843B400281DC2A8986DEBC472'';',
'blog_install.i(27) := ''7906CE82382A9750598E6D966CDD765C218F03DAB6FF4D36F937450BA034914A850F365C28D5E06028B9EE5DCF6FE48E1DE7D59392ADDBFD2732C917864ADE974DFECDC52080A9E20440A3BCEBBB94A79C007E392CDBBD6B3FF621791C626E956CDDEE2E5A429E819C2A924DFECDC54FA08'
||'E4D2204E00001A8FCF8D581963AA2'';',
'blog_install.i(28) := ''B377694C035DE953255BB7890B513F9F934DFECD64A902205CD819B8AA9C00606329C9D9BB9EC61AF2BCDC9822D9BA0D153DA2A9A7E127D9E4DF9024001AD6EDD3CAC500704318C9D9BBF6AA54F2BCFC6C8964DFBEEBE615E292B05CF2C50BA02C91CA92AEF7F0AB8A09C0756A2DD1C1CB1'
||'6D37CF2051AD8BC21D1B76FFF913C'';',
'blog_install.i(29) := ''13904BFE8D37240A80C67ABE5267EEDA4B12880F5E264E456F5D91ECDBEFFFBA98F873E5928F05B051A4006899397C0A78F6E1A6501AA76EC3B12C240DEC5E527DFBE66319E4B5805DC9B2C8BFB1E809D42E5900149C3CC84AF79226FBDE242A47AEBB7E26AF0748DDB4D195FF261501C82'
||'1BF51B200686DDAF88A5E300847B2'';',
'blog_install.i(30) := ''D03A6FDF51534A4E86C44D1B9DB40420837CD102B01B6753F7F0D1D8BEE5FDFD14D5CB166C67B2889FA9BB788924DF7EE76E0A02C84C96457EE3C22750F7CE4431027849110327493CE0A93F44FDA68DFE7D2954042065D346DBA619E49F7968A72CF21B173E8E7AB3668E2C80E68D13FC9'
||'E40064AB977BDC71649F20780950B'';',
'blog_install.i(31) := ''6ED950E422E50A0A02285A2279D306F14AE4893DB2C86F7CFD718E5FE09A2F8026F8C38D3563B86F70196314B56E7B4EAE18F15430D89FEFBB7501B9BFD9A2EC45CAB4042071D306B1008EEF9145FE9D77C773FC02D7AC009A4000D5F0976BCB1EE5BEC1699CAEB86F9F5BCF37252057E57'
||'27C7E201838C375BB56F7F61864DE'';',
'blog_install.i(32) := ''9B82CCE529F848160C630AEA0594BD85D153CAA2E42DD40D60867C8C223FDA364C91BC69A323F74D3F721663B467B3C8F2A30DC0047A1C32596424A35606CD6BA64B261FD0911ACBF10B5CB302A80601A406860373E16C7F1C609A1B1EF25572A3A6120732911A38E5A67AA1C86F60D05F3'
||'8C77F3B3CC371806FE01E049014F8'';',
'blog_install.i(33) := ''42EBD6C9BC6960AA4EFE2821FFF6D2711CAFC0314F00492080A8C0171A563DC67DA3C3344B277F14900FE8DA1ACFF10A1CF304106580C6FCA152380DE06CC03445275FE3E4DF5C3296E35330FC571A028DF94B72E01F6EAF8F0E1E0574F2354B7EC382E0B71FB8E50920D9C06FCC17CCF00'
||'FF58B1F41969297874681F2589D7C'';',
'blog_install.i(34) := ''8D92DFBC6228F5034E815B967CB341D8F8D9007F14B09B5ED6C9D720F90073DEEC91DEFED45002880A8C02809EBC19437501D34C9D7C8D91CFCFFB814B1EF9662EF87BD028C02F0CE1B4B03C5E275F23E4DF5BFD5C1077BCC24FE8B75F2082FA5053813F1E88D3C95739F977DE9F14C4996'
||'0E8AF373CAC31DF14CDFB81A0E290'';',
'blog_install.i(35) := ''CDF40A16814EBE7AC9B794CC1DA9E80388368869CC37AEE4FF60C7CE98E0E9C014A793AFF2611F381390BFD220A5313F5011F861481F8422701867E8E4AB30E00B90CF4BF9001506398D5F211C3E1D8079640E7296C4E8E44730CFE7A77A230CFB9506B98D4D0D8344200C0CB110CA66224'
||'7D1649DFC309677F915BE11023EC4'';',
'blog_install.i(36) := ''721765206DFCE9209022F2EB049C104A67227BE1149D7C0557F542110F5C08523DF9C3BED8C030301AF0CBC61C8C4C245A3C1D59F35FD0C927241F9C3C30C707D6F3F980BE0FF1D64B0FF82488209A5F27080488F010FC55C461289D83ACC5B3F07534D682046401E427E07B8A3176C7A37'
||'E401E0FB97EF40172E2FCC8F6C30C'';',
'blog_install.i(37) := ''C8E261571CEAC598867A3379C898867A003B79D8310D5FA2EC472CBE4D13639B1FF703D8CA437A2C3E6BDF8F187CE62E87B4187CFE1E87540136C7E08319FC988AB7670DC3C6A9D8B21D00B8770306CE5080BE863E17047A88E526DAA074632B8666A1F260AD198290078A41872C409F42D'
||'F0AD6F3F9E5DD5443381B1B208614'';',
'blog_install.i(38) := ''42204E00F3213850C186AC433AA0EFA00F43CCEF41C45309F408C5902CCC1674288ACA61EBF96A68ECA890C4AAB23A6039D7418426B62F53D9BEA5FAB6FF1F4C5A89C04540B9590000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''feed-icon-128x128.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000001000000640802000000C84ECD37000000097048597300001EC200001EC2016ED0753E0000000774494D4507DD0B020808191D0C2FBB0000001D69545874436F6D6D656E7400000000004372656174656420776974682047494D50642E6507'
||'00000006624B474400FF00FF00FF'';',
'blog_install.i(2) := ''A0BDA79300000052494441541857859041128030080337DBE7F92B1F5E3DD951AAF5C01092E500B0ED02022699B474939834013BA80EAE2583CD8F4EE251BC76CDB457FE5EAB6CCE5DEEBCF9D57BDC71F8C9D7FEA5AB577F0E9CC949065F70B017F70000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''header-blue.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396156001200E700000000001414141714141515151616161716161F13132213132A12122F12123012123211123212123511111C1C1C3D10103B11113E10101E1E1E411010421010451010490F0F4710102520204F0F0F252121500F0F321C1C510F0F520F0F530F0F570E0E2F20'
||'205B0E0E5C0E0E5F0D0D5D0E0E61'';',
'blog_install.i(2) := ''0D0D610E0E660D0D4F17174C1919680D0D6D0C0C700C0C6E0D0D700C0D720C0C730C0C780B0B760C0C7B0B0B7C0B0B820A0B810B0B830B0B860A0A880A0A8A0A0A8C0A0A8D0A0A9009098E0A0A8F0A0A9209099809093434349B08089909099D0808920D0D9F0808A10808A20808A50707A3'
||'0808960E0EA60808AE0707AF0707'';',
'blog_install.i(3) := ''B20707B50606B50707B80606B90606712525BA0606BB06066E2828C20505C305057C2424812222C50505C70505C80505404040CC0404CC0504CF0404D00404D10404D40404D00606D60404D90303D30808E20202E20302E40202E60202E70202EA0202EC0202F401014B4A4AF60101FA0101'
||'FB0101FF0000594E4EE91212EA13'';',
'blog_install.i(4) := ''13565656794A4A993E3E9E40405E5E5E7D5454685E5EDD2C2CE034346A6A6A6D6D6D7272727E7E7E7F7F7FC963638D7D7D858585868686D072728F8F8FD67373C87A7AB28787A391919996969A9A9ACF8686EF7979B79292A59A9ADC8383A4A4A4AAAAAABDA2A2B8ACACF09494B4AEAEB0B0'
||'B0CCA5A5CBA8A8F19B9BC9B5B5EA'';',
'blog_install.i(5) := ''A7A7C6B8B8DBB1B1C0C0C0EDB4B4E0BABACCCCCCD5D5D5DDD5D5DCDADAE5DDDDE0E0E0E3E3E3E7E7E7F9E0E0EAE9E9F2E6E6FAE4E4F3E8E8ECECECF1EAEAFCE8E8EEEEEEF3ECECFCE9E9F5EFEFF5F1F1F5F2F2F4F4F4F5F4F4F5F5F5F8F6F6F7F7F7F8F7F7F8F8F8FEF7F7FBF9F9FEF8F8FC'
||'F9F9FCFCFCFDFCFCFEFEFEFFFEFE'';',
'blog_install.i(6) := ''FFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000000000'';',
'blog_install.i(7) := ''0000000000000000000000000021FE15437265617465642077697468205468652047494D50002C00000000560012000008FE00C3241A48B0A0C18308132A5CC8B0E14181D1224A9C2891992D5491144132452B19C58F20438A1C49F2E34092D07E8DF27344C9142F68067DDA05ADA4CD9B38'
||'4D2622090C13171C459E6C49E326'';',
'blog_install.i(8) := ''8E9E4BBE722A5D2AF2A4C866A5B2C0D08144CA183673EED4D9436A19D3AF5F9D860C1668448C1D49A890816307CF1D39846E819D9B532C48572A444CAD2AA64DD63A6FD6A8A24BB8A4DD8F9E2680608143C8132D44E3BC510346D34400113167D6BC593380CF993B53F41C3ADA67CEA0251E'
||'A6980942071434803091E2A5CC19'';',
'blog_install.i(9) := ''335FAE38BA5C9AB4E98FA87BF3368DD9B7F088AB2782627041848B1B419440A182A54A1427962E9F3E4E7CF86FE29C85D8A7DEFE9D737289AF3840C87002860D1F44942C6162A4C9AAE1BEC37FDF6F1C3FF7F2AAED249230822430810727BC50430E3CFCD0830E7FE0E2DF661291571A8015'
||'1ED75F77017EF40C32B9C4D20A25'';',
'blog_install.i(10) := ''212C40C10625ACD0C20C32CCD08528CA14266348763D334B288D1802081F74687080020F58F081082498608524BDCCA8244576F1F2C810121010C09401086000020D4450410A7D74A24B4D4B866917319C84E1C000544E590006792C32C929B01413E69CD1D4688C2CA954828821851CC2C'
||'826ACD432CC31CED04967220239A4'';',
'blog_install.i(11) := ''E8A28C369A50180101003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''hostip-info-86x18.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000020000004A1006000000C12D596600000006624B4744000000000000F943BB7F000000097048597300000048000000480046C96B3E0000000976704167000000020000004A00528CBB8D000001534944415438CBD554DD99C3200CF35FB251'
||'67E8261DA6E3748F0E146CE37B30'';',
'blog_install.i(2) := ''1027770B1C4FF9842C0BA3808FC7EBF5F944C058424444040010113100C4DC2502106666660080844544841960AA087302135A2553474452342241414C603166D3294AD3E1624444F40E6B49EFEE663740B57431536DAD30DC5555533662308EA31CEE2C1980BB596BE5B4BF44CDCC6E3E7A'
||'4F60CCA377F7FCCCB674EE0DC69C'';',
'blog_install.i(3) := ''F6D20020CA99AE01316F5BF181C8BCEFE973DC9CC8BEDFAE324BC659109341B418293A4BFECFC2E7F3FDFE7E6F49BE444A44A4864AB68D99A8CC4364DB2E5317D9F71B90250BD8F7149D495CFBF3B204B11694242F8D886B1CC4DDDDBD587757752F4E555B9B191BD16ECD3D81080069ED38'
||'32DA83A17A1C59927EC46C02A34B'';',
'blog_install.i(4) := ''6BAA662552AAD9B6F830BB38EDBDF7CB4F78562FE0AC1FC039C2F1EFCFE7628D5044A400447F00F9A0202216C67C368A463AFD01829ADAC3D7E27AF10000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''ir-bg.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''2F2A2A0D0A202A2053796E746178486967686C6967687465720D0A202A20687474703A2F2F616C6578676F72626174636865762E636F6D2F53796E746178486967686C6967687465720D0A202A2053796E746178486967686C69676874657220697320646F6E6174696F6E776172652E2049'
||'6620796F7520617265207573696E'';',
'blog_install.i(2) := ''672069742C20706C6561736520646F6E6174652E0D0A202A20687474703A2F2F616C6578676F72626174636865762E636F6D2F53796E746178486967686C6967687465722F646F6E6174652E68746D6C0D0A202A0D0A202A204076657273696F6E0D0A202A20332E302E383320284A756C79'
||'2030322032303130290D0A202A0D'';',
'blog_install.i(3) := ''0A202A2040636F707972696768740D0A202A20436F707972696768742028432920323030342D3230313020416C657820476F72626174636865762E0D0A202A0D0A202A20406C6963656E73650D0A202A204475616C206C6963656E73656420756E64657220746865204D495420616E642047'
||'504C206C6963656E7365732E0D0A'';',
'blog_install.i(4) := ''202A2F0D0A76617220585265674578703B69662858526567457870297468726F77204572726F72282263616E2774206C6F6164205852656745787020747769636520696E207468652073616D65206672616D6522293B2866756E6374696F6E2865297B66756E6374696F6E206328652C7429'
||'7B69662821585265674578702E69'';',
'blog_install.i(5) := ''73526567457870286529297468726F7720547970654572726F722822747970652052656745787020657870656374656422293B766172206E3D652E5F787265676578703B72657475726E20653D5852656745787028652E736F757263652C682865292B28747C7C222229292C6E262628652E'
||'5F787265676578703D7B736F7572'';',
'blog_install.i(6) := ''63653A6E2E736F757263652C636170747572654E616D65733A6E2E636170747572654E616D65733F6E2E636170747572654E616D65732E736C6963652830293A6E756C6C7D292C657D66756E6374696F6E20682865297B72657475726E28652E676C6F62616C3F2267223A2222292B28652E'
||'69676E6F7265436173653F226922'';',
'blog_install.i(7) := ''3A2222292B28652E6D756C74696C696E653F226D223A2222292B28652E657874656E6465643F2278223A2222292B28652E737469636B793F2279223A2222297D66756E6374696F6E207028652C742C6E2C72297B766172206F3D732E6C656E6774682C752C612C663B693D21303B7472797B'
||'7768696C65286F2D2D297B663D73'';',
'blog_install.i(8) := ''5B6F5D3B6966286E26662E73636F706526262821662E747269676765727C7C662E747269676765722E63616C6C28722929297B662E7061747465726E2E6C617374496E6465783D742C613D662E7061747465726E2E657865632865293B696628612626612E696E6465783D3D3D74297B753D'
||'7B6F75747075743A662E68616E64'';',
'blog_install.i(9) := ''6C65722E63616C6C28722C612C6E292C6D617463683A617D3B627265616B7D7D7D7D6361746368286C297B7468726F77206C7D66696E616C6C797B693D21317D72657475726E20757D66756E6374696F6E206428652C742C6E297B69662841727261792E70726F746F747970652E696E6465'
||'784F662972657475726E20652E69'';',
'blog_install.i(10) := ''6E6465784F6628742C6E293B666F722876617220723D6E7C7C303B723C652E6C656E6774683B722B2B29696628655B725D3D3D3D742972657475726E20723B72657475726E2D317D585265674578703D66756E6374696F6E28742C72297B76617220733D5B5D2C753D585265674578702E4'
||'F5554534944455F434C4153532C61'';',
'blog_install.i(11) := ''3D302C662C682C642C762C6D3B696628585265674578702E6973526567457870287429297B69662872213D3D65297468726F7720547970654572726F72282263616E277420737570706C7920666C616773207768656E20636F6E737472756374696E67206F6E65205265674578702066726'
||'F6D20616E6F7468657222293B7265'';',
'blog_install.i(12) := ''7475726E20632874297D69662869297468726F77204572726F72282263616E27742063616C6C20746865205852656745787020636F6E7374727563746F722077697468696E20746F6B656E20646566696E6974696F6E2066756E6374696F6E7322293B723D727C7C22222C663D7B6861734'
||'E616D6564436170747572653A2131'';',
'blog_install.i(13) := ''2C636170747572654E616D65733A5B5D2C686173466C61673A66756E6374696F6E2865297B72657475726E20722E696E6465784F662865293E2D317D2C736574466C61673A66756E6374696F6E2865297B722B3D657D7D3B7768696C6528613C742E6C656E67746829683D7028742C612C7'
||'52C66292C683F28732E7075736828'';',
'blog_install.i(14) := ''682E6F7574707574292C612B3D682E6D617463685B305D2E6C656E6774687C7C31293A28643D6F2E657865632E63616C6C286C5B755D2C742E736C69636528612929293F28732E7075736828645B305D292C612B3D645B305D2E6C656E677468293A28763D742E6368617241742861292C7'
||'63D3D3D225B223F753D5852656745'';',
'blog_install.i(15) := ''78702E494E534944455F434C4153533A763D3D3D225D22262628753D585265674578702E4F5554534944455F434C415353292C732E707573682876292C612B2B293B72657475726E206D3D52656745787028732E6A6F696E282222292C6F2E7265706C6163652E63616C6C28722C6E2C222'
||'229292C6D2E5F787265676578703D'';',
'blog_install.i(16) := ''7B736F757263653A742C636170747572654E616D65733A662E6861734E616D6564436170747572653F662E636170747572654E616D65733A6E756C6C7D2C6D7D2C585265674578702E76657273696F6E3D22312E352E31222C585265674578702E494E534944455F434C4153533D312C585'
||'265674578702E4F5554534944455F'';',
'blog_install.i(17) := ''434C4153533D323B76617220743D2F5C24283F3A285C645C643F7C5B242660275D297C7B285B245C775D2B297D292F672C6E3D2F5B5E67696D795D2B7C285B5C735C535D29283F3D5B5C735C535D2A5C31292F672C723D2F5E283F3A5B3F2A2B5D7C7B5C642B283F3A2C5C642A293F7D295'
||'C3F3F2F2C693D21312C733D5B5D2C'';',
'blog_install.i(18) := ''6F3D7B657865633A5265674578702E70726F746F747970652E657865632C746573743A5265674578702E70726F746F747970652E746573742C6D617463683A537472696E672E70726F746F747970652E6D617463682C7265706C6163653A537472696E672E70726F746F747970652E72657'
||'06C6163652C73706C69743A537472'';',
'blog_install.i(19) := ''696E672E70726F746F747970652E73706C69747D2C753D6F2E657865632E63616C6C282F28293F3F2F2C2222295B315D3D3D3D652C613D66756E6374696F6E28297B76617220653D2F5E2F673B72657475726E206F2E746573742E63616C6C28652C2222292C21652E6C617374496E64657'
||'87D28292C663D5265674578702E70'';',
'blog_install.i(20) := ''726F746F747970652E737469636B79213D3D652C6C3D7B7D3B6C5B585265674578702E494E534944455F434C4153535D3D2F5E283F3A5C5C283F3A5B302D335D5B302D375D7B302C327D7C5B342D375D5B302D375D3F7C785B5C64412D46612D665D7B327D7C755B5C64412D46612D665D7'
||'B347D7C635B412D5A612D7A5D7C5B'';',
'blog_install.i(21) := ''5C735C535D29292F2C6C5B585265674578702E4F5554534944455F434C4153535D3D2F5E283F3A5C5C283F3A30283F3A5B302D335D5B302D375D7B302C327D7C5B342D375D5B302D375D3F293F7C5B312D395D5C642A7C785B5C64412D46612D665D7B327D7C755B5C64412D46612D665D7'
||'B347D7C635B412D5A612D7A5D7C5B'';',
'blog_install.i(22) := ''5C735C535D297C5C285C3F5B3A3D215D7C5B3F2A2B5D5C3F7C7B5C642B283F3A2C5C642A293F7D5C3F3F292F2C585265674578702E616464546F6B656E3D66756E6374696F6E28652C742C6E2C72297B732E70757368287B7061747465726E3A6328652C2267222B28663F2279223A22222'
||'9292C68616E646C65723A742C7363'';',
'blog_install.i(23) := ''6F70653A6E7C7C58526567457870'))
);
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'2E4F5554534944455F434C4153532C747269676765723A727C7C6E756C6C7D297D2C585265674578702E63616368653D66756E6374696F6E28652C74297B766172206E3D652B222F222B28747C7C2222293B72657475726E20585265674578702E63616368655B6E5D7C7C28585265674578'';',
'blog_install.i(24) := ''702E63616368655B6E5D3D5852656745787028652C7429297D2C585265674578702E636F70794173476C6F62616C3D66756E6374696F6E2865297B72657475726E206328652C226722297D2C585265674578702E6573636170653D66756E6374696F6E2865297B72657475726E20652E726'
||'5706C616365282F5B2D5B5C5D7B7D'';',
'blog_install.i(25) := ''28292A2B3F2E2C5C5C5E247C235C735D2F672C225C5C242622297D2C585265674578702E6578656341743D66756E6374696F6E28652C742C6E2C72297B76617220693D6328742C2267222B28722626663F2279223A222229292C733B72657475726E20692E6C617374496E6465783D6E3D6'
||'E7C7C302C733D692E657865632865'';',
'blog_install.i(26) := ''292C722626732626732E696E646578213D3D6E262628733D6E756C6C292C742E676C6F62616C262628742E6C617374496E6465783D733F692E6C617374496E6465783A30292C737D2C585265674578702E667265657A65546F6B656E733D66756E6374696F6E28297B585265674578702E6'
||'16464546F6B656E3D66756E637469'';',
'blog_install.i(27) := ''6F6E28297B7468726F77204572726F72282263616E27742072756E20616464546F6B656E20616674657220667265657A65546F6B656E7322297D7D2C585265674578702E69735265674578703D66756E6374696F6E2865297B72657475726E204F626A6563742E70726F746F747970652E7'
||'46F537472696E672E63616C6C2865'';',
'blog_install.i(28) := ''293D3D3D225B6F626A656374205265674578705D227D2C585265674578702E697465726174653D66756E6374696F6E28652C742C6E2C72297B76617220693D6328742C226722292C733D2D312C6F3B7768696C65286F3D692E6578656328652929742E676C6F62616C262628742E6C61737'
||'4496E6465783D692E6C617374496E'';',
'blog_install.i(29) := ''646578292C6E2E63616C6C28722C6F2C2B2B732C652C74292C692E6C617374496E6465783D3D3D6F2E696E6465782626692E6C617374496E6465782B2B3B742E676C6F62616C262628742E6C617374496E6465783D30297D2C585265674578702E6D61746368436861696E3D66756E63746'
||'96F6E28652C74297B72657475726E'';',
'blog_install.i(30) := ''2066756E6374696F6E206E28652C72297B76617220693D745B725D2E72656765783F745B725D3A7B72656765783A745B725D7D2C733D6328692E72656765782C226722292C6F3D5B5D2C753B666F7228753D303B753C652E6C656E6774683B752B2B29585265674578702E6974657261746'
||'528655B755D2C732C66756E637469'';',
'blog_install.i(31) := ''6F6E2865297B6F2E7075736828692E6261636B7265663F655B692E6261636B7265665D7C7C22223A655B305D297D293B72657475726E20723D3D3D742E6C656E6774682D317C7C216F2E6C656E6774683F6F3A6E286F2C722B31297D285B655D2C30297D2C5265674578702E70726F746F7'
||'47970652E6170706C793D66756E63'';',
'blog_install.i(32) := ''74696F6E28652C74297B72657475726E20746869732E6578656328745B305D297D2C5265674578702E70726F746F747970652E63616C6C3D66756E6374696F6E28652C74297B72657475726E20746869732E657865632874297D2C5265674578702E70726F746F747970652E657865633D6'
||'6756E6374696F6E2874297B766172'';',
'blog_install.i(33) := ''206E2C722C692C733B746869732E676C6F62616C7C7C28733D746869732E6C617374496E646578292C6E3D6F2E657865632E6170706C7928746869732C617267756D656E7473293B6966286E297B217526266E2E6C656E6774683E31262664286E2C2222293E2D31262628693D526567457'
||'87028746869732E736F757263652C'';',
'blog_install.i(34) := ''6F2E7265706C6163652E63616C6C28682874686973292C2267222C222229292C6F2E7265706C6163652E63616C6C2828742B2222292E736C696365286E2E696E646578292C692C66756E6374696F6E28297B666F722876617220743D313B743C617267756D656E74732E6C656E6774682D3'
||'23B742B2B29617267756D656E7473'';',
'blog_install.i(35) := ''5B745D3D3D3D652626286E5B745D3D65297D29293B696628746869732E5F787265676578702626746869732E5F787265676578702E636170747572654E616D657329666F722876617220663D313B663C6E2E6C656E6774683B662B2B29723D746869732E5F787265676578702E636170747'
||'572654E616D65735B662D315D2C72'';',
'blog_install.i(36) := ''2626286E5B725D3D6E5B665D293B21612626746869732E676C6F62616C2626216E5B305D2E6C656E6774682626746869732E6C617374496E6465783E6E2E696E6465782626746869732E6C617374496E6465782D2D7D72657475726E20746869732E676C6F62616C7C7C28746869732E6C6'
||'17374496E6465783D73292C6E7D2C'';',
'blog_install.i(37) := ''5265674578702E70726F746F747970652E746573743D66756E6374696F6E2865297B76617220742C6E3B72657475726E20746869732E676C6F62616C7C7C286E3D746869732E6C617374496E646578292C743D6F2E657865632E63616C6C28746869732C65292C742626216126267468697'
||'32E676C6F62616C262621745B305D'';',
'blog_install.i(38) := ''2E6C656E6774682626746869732E6C617374496E6465783E742E696E6465782626746869732E6C617374496E6465782D2D2C746869732E676C6F62616C7C7C28746869732E6C617374496E6465783D6E292C2121747D2C537472696E672E70726F746F747970652E6D617463683D66756E6'
||'374696F6E2865297B585265674578'';',
'blog_install.i(39) := ''702E69735265674578702865297C7C28653D526567457870286529293B696628652E676C6F62616C297B76617220743D6F2E6D617463682E6170706C7928746869732C617267756D656E7473293B72657475726E20652E6C617374496E6465783D302C747D72657475726E20652E6578656'
||'32874686973297D2C537472696E67'';',
'blog_install.i(40) := ''2E70726F746F747970652E7265706C6163653D66756E6374696F6E28652C6E297B76617220723D585265674578702E69735265674578702865292C692C732C752C613B72657475726E20723F28652E5F78726567657870262628693D652E5F787265676578702E636170747572654E616D6'
||'573292C652E676C6F62616C7C7C28'';',
'blog_install.i(41) := ''613D652E6C617374496E64657829293A652B3D22222C4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C286E293D3D3D225B6F626A6563742046756E6374696F6E5D223F733D6F2E7265706C6163652E63616C6C28746869732B22222C652C66756E6374696F6E2'
||'8297B69662869297B617267756D65'';',
'blog_install.i(42) := ''6E74735B305D3D6E657720537472696E6728617267756D656E74735B305D293B666F722876617220743D303B743C692E6C656E6774683B742B2B29695B745D262628617267756D656E74735B305D5B695B745D5D3D617267756D656E74735B742B315D297D72657475726E20722626652E6'
||'76C6F62616C262628652E6C617374'';',
'blog_install.i(43) := ''496E6465783D617267756D656E74735B617267756D656E74732E6C656E6774682D325D2B617267756D656E74735B305D2E6C656E677468292C6E2E6170706C79286E756C6C2C617267756D656E7473297D293A28753D746869732B22222C733D6F2E7265706C6163652E63616C6C28752C6'
||'52C66756E6374696F6E28297B7661'';',
'blog_install.i(44) := ''7220653D617267756D656E74733B72657475726E206F2E7265706C6163652E63616C6C286E2B22222C742C66756E6374696F6E28742C6E2C72297B696628216E297B766172206F3D2B723B72657475726E206F3C3D652E6C656E6774682D333F655B6F5D3A286F3D693F6428692C72293A2'
||'D312C6F3E2D313F655B6F2B315D3A'';',
'blog_install.i(45) := ''74297D737769746368286E297B636173652224223A72657475726E2224223B636173652226223A72657475726E20655B305D3B636173652260223A72657475726E20655B652E6C656E6774682D315D2E736C69636528302C655B652E6C656E6774682D325D293B636173652227223A72657'
||'475726E20655B652E6C656E677468'';',
'blog_install.i(46) := ''2D315D2E736C69636528655B652E6C656E6774682D325D2B655B305D2E6C656E677468293B64656661756C743A76617220733D22223B6E3D2B6E3B696628216E2972657475726E20743B7768696C65286E3E652E6C656E6774682D3329733D537472696E672E70726F746F747970652E736'
||'C6963652E63616C6C286E2C2D3129'';',
'blog_install.i(47) := ''2B732C6E3D4D6174682E666C6F6F72286E2F3130293B72657475726E286E3F655B6E5D7C7C22223A222422292B737D7D297D29292C72262628652E676C6F62616C3F652E6C617374496E6465783D303A652E6C617374496E6465783D61292C737D2C537472696E672E70726F746F7479706'
||'52E73706C69743D66756E6374696F'';',
'blog_install.i(48) := ''6E28742C6E297B69662821585265674578702E69735265674578702874292972657475726E206F2E73706C69742E6170706C7928746869732C617267756D656E7473293B76617220723D746869732B22222C693D5B5D2C733D302C752C613B6966286E3D3D3D657C7C2B6E3C30296E3D496'
||'E66696E6974793B656C73657B6E3D'';',
'blog_install.i(49) := ''4D6174682E666C6F6F72282B6E293B696628216E2972657475726E5B5D7D743D585265674578702E636F70794173476C6F62616C2874293B7768696C6528753D742E65786563287229297B696628742E6C617374496E6465783E73297B692E7075736828722E736C69636528732C752E696'
||'E64657829292C752E6C656E677468'';',
'blog_install.i(50) := ''3E312626752E696E6465783C722E6C656E677468262641727261792E70726F746F747970652E707573682E6170706C7928692C752E736C696365283129292C613D755B305D2E6C656E6774682C733D742E6C617374496E6465783B696628692E6C656E6774683E3D6E29627265616B7D742'
||'E6C617374496E6465783D3D3D752E'';',
'blog_install.i(51) := ''696E6465782626742E6C617374496E6465782B2B7D72657475726E20733D3D3D722E6C656E6774683F28216F2E746573742E63616C6C28742C2222297C7C61292626692E70757368282222293A692E7075736828722E736C696365287329292C692E6C656E6774683E6E3F692E736C69636'
||'528302C6E293A697D2C5852656745'';',
'blog_install.i(52) := ''78702E616464546F6B656E282F5C285C3F235B5E295D2A5C292F2C66756E6374696F6E2865297B72657475726E206F2E746573742E63616C6C28722C652E696E7075742E736C69636528652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A29227D292C58526567457'
||'8702E616464546F6B656E282F5C28'';',
'blog_install.i(53) := ''283F215C3F292F2C66756E6374696F6E28297B72657475726E20746869732E636170747572654E616D65732E70757368286E756C6C292C2228227D292C585265674578702E616464546F6B656E282F5C285C3F3C285B245C775D2B293E2F2C66756E6374696F6E2865297B72657475726E2'
||'0746869732E636170747572654E61'';',
'blog_install.i(54) := ''6D65732E7075736828655B315D292C746869732E6861734E616D6564436170747572653D21302C2228227D292C585265674578702E616464546F6B656E282F5C5C6B3C285B5C77245D2B293E2F2C66756E6374696F6E2865297B76617220743D6428746869732E636170747572654E616D6'
||'5732C655B315D293B72657475726E'';',
'blog_install.i(55) := ''20743E2D313F225C5C222B28742B31292B2869734E614E28652E696E7075742E63686172417428652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A2922293A655B305D7D292C585265674578702E616464546F6B656E282F5C5B5C5E3F5D2F2C66756E6374696F6E2'
||'865297B72657475726E20655B305D'';',
'blog_install.i(56) := ''3D3D3D225B5D223F225C5C625C5C42223A225B5C5C735C5C535D227D292C585265674578702E616464546F6B656E282F5E5C285C3F285B696D73785D2B295C292F2C66756E6374696F6E2865297B72657475726E20746869732E736574466C616728655B315D292C22227D292C585265674'
||'578702E616464546F6B656E282F28'';',
'blog_install.i(57) := ''3F3A5C732B7C232E2A292B2F2C66756E6374696F6E2865297B72657475726E206F2E746573742E63616C6C28722C652E696E7075742E736C69636528652E696E6465782B655B305D2E6C656E67746829293F22223A22283F3A29227D2C585265674578702E4F5554534944455F434C41535'
||'32C66756E6374696F6E28297B7265'';',
'blog_install.i(58) := ''7475726E20746869732E686173466C616728227822297D292C585265674578702E616464546F6B656E282F5C2E2F2C66756E6374696F6E28297B72657475726E225B5C5C735C5C535D227D2C585265674578702E4F5554534944455F434C4153532C66756E6374696F6E28297B726574757'
||'26E20746869732E686173466C6167'';',
'blog_install.i(59) := ''28227322297D297D2928293B696628747970656F662053796E746178486967686C6967687465723D3D22756E646566696E656422297661722053796E746178486967686C6967687465723D66756E6374696F6E28297B66756E6374696F6E207428652C74297B72657475726E20652E636C6'
||'173734E616D652E696E6465784F66'';',
'blog_install.i(60) := ''287429213D2D317D66756E6374696F6E206E28652C6E297B7428652C6E297C7C28652E636C6173734E616D652B3D2220222B6E297D66756E6374696F6E207228652C74297B652E636C6173734E616D653D652E636C6173734E616D652E7265706C61636528742C2222297D66756E6374696'
||'F6E20692865297B76617220743D5B'';',
'blog_install.i(61) := ''5D3B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29742E7075736828655B6E5D293B72657475726E20747D66756E6374696F6E20732865297B72657475726E20652E73706C6974282F5C723F5C6E2F297D66756E6374696F6E206F2865297B76617220743D226869676'
||'86C6967687465725F223B72657475'';',
'blog_install.i(62) := ''726E20652E696E6465784F662874293D3D303F653A742B657D66756E6374696F6E20752874297B72657475726E20652E766172732E686967686C696768746572735B6F2874295D7D66756E6374696F6E20612865297B72657475726E20646F63756D656E742E676574456C656D656E74427'
||'94964286F286529297D66756E6374'';',
'blog_install.i(63) := ''696F6E20662874297B652E766172732E686967686C696768746572735B6F28742E6964295D3D747D66756E6374696F6E206C28652C742C6E297B696628653D3D6E756C6C2972657475726E206E756C6C3B76617220723D6E213D313F652E6368696C644E6F6465733A5B652E706172656E7'
||'44E6F64655D2C693D7B2223223A22'';',
'blog_install.i(64) := ''6964222C222E223A22636C6173734E616D65227D5B742E73756273747228302C31295D7C7C226E6F64654E616D65222C732C6F3B733D69213D226E6F64654E616D65223F742E7375627374722831293A742E746F55707065724361736528293B69662828655B695D7C7C2222292E696E646'
||'5784F66287329213D2D3129726574'';',
'blog_install.i(65) := ''75726E20653B666F722876617220753D303B722626753C722E6C656E67746826266F3D3D6E756C6C3B752B2B296F3D6C28725B755D2C742C6E293B72657475726E206F7D66756E6374696F6E206328652C74297B72657475726E206C28652C742C2130297D66756E6374696F6E206828652'
||'C742C6E297B6E3D4D6174682E6D61'';',
'blog_install.i(66) := ''78286E7C7C302C30293B666F722876617220723D6E3B723C652E6C656E6774683B722B2B29696628655B725D3D3D742972657475726E20723B72657475726E2D317D66756E6374696F6E20702865297B72657475726E28657C7C2222292B4D6174682E726F756E64284D6174682E72616E6'
||'46F6D28292A316536292E746F5374'';',
'blog_install.i(67) := ''72696E6728297D66756E6374696F6E206428652C74297B766172206E3D7B7D2C723B666F72287220696E2065296E5B725D3D655B725D3B666F72287220696E2074296E5B725D3D745B725D3B72657475726E206E7D66756E6374696F6E20762865297B76617220743D7B2274727565223A2'
||'1302C2266616C7365223A21317D5B'';',
'blog_install.i(68) := ''655D3B72657475726E20743D3D6E756C6C3F653A747D66756E6374696F6E206D28652C742C6E2C722C69297B76617220733D2873637265656E2E77696474682D6E292F322C6F3D2873637265656E2E6865696768742D72292F323B692B3D222C206C6566743D222B732B222C20746F703D2'
||'22B6F2B222C2077696474683D222B'';',
'blog_install.i(69) := ''6E2B222C206865696768743D222B722C693D692E7265706C616365282F5E2C2F2C2222293B76617220753D77696E646F772E6F70656E28652C742C69293B72657475726E20752E666F63757328292C757D66756E6374696F6E206728652C742C6E2C72297B66756E6374696F6E206928652'
||'97B653D657C7C77696E646F772E65'';',
'blog_install.i(70) := ''76656E742C652E7461726765747C7C28652E7461726765743D652E737263456C656D656E742C652E70726576656E7444656661756C743D66756E6374696F6E28297B746869732E72657475726E56616C75653D21317D292C6E2E63616C6C28727C7C77696E646F772C65297D652E6174746'
||'163684576656E743F652E61747461'';',
'blog_install.i(71) := ''63684576656E7428226F6E222B742C69293A652E6164644576656E744C697374656E657228742C692C2131297D66756E6374696F6E20792874297B77696E646F772E616C65727428652E636F6E6669672E737472696E67732E616C6572742B74297D66756E6374696F6E206228742C6E297'
||'B76617220723D652E766172732E64'';',
'blog_install.i(72) := ''6973636F7665726564427275736865732C693D6E756C6C3B696628723D3D6E756C6C297B723D7B7D3B666F7228766172207320696E20652E62727573686573297B766172206F3D652E627275736865735B735D2C753D6F2E616C69617365733B696628753D3D6E756C6C29636F6E74696E7'
||'5653B6F2E62727573684E616D653D'';',
'blog_install.i(73) := ''732E746F4C6F7765724361736528293B666F722876617220613D303B613C752E6C656E6774683B612B2B29725B755B615D5D3D737D652E766172732E646973636F7665726564427275736865733D727D72657475726E20693D652E627275736865735B725B745D5D2C693D3D6E756C6C262'
||'66E26267928652E636F6E6669672E'';',
'blog_install.i(74) := ''737472696E67732E6E6F42727573682B74292C697D66756E6374696F6E207728652C74297B766172206E3D732865293B666F722876617220723D303B723C6E2E6C656E6774683B722B2B296E5B725D3D74286E5B725D2C72293B72657475726E206E2E6A6F696E28225C725C6E22297D667'
||'56E6374696F6E20452865297B7265'';',
'blog_install.i(75) := ''7475726E20652E7265706C616365282F5E5B205D2A5B5C6E5D2B7C5B5C6E5D2A5B205D2A242F672C2222297D66756E6374696F6E20532865297B76617220742C6E3D7B7D2C723D6E6577205852656745787028225E5C5C5B283F3C76616C7565733E282E2A3F29295C5C5D2422292C693D6'
||'E657720585265674578702822283F'';',
'blog_install.i(76) := ''3C6E616D653E5B5C5C772D5D2B295C5C732A3A5C5C732A283F3C76616C75653E5B5C5C772D25235D2B7C5C5C5B2E2A3F5C5C5D7C5C222E2A3F5C227C272E2A3F27295C5C732A3B3F222C226722293B7768696C652828743D692E6578656328652929213D6E756C6C297B76617220733D742'
||'E76616C75652E7265706C61636528'';',
'blog_install.i(77) := ''2F5E5B27225D7C5B27225D242F672C2222293B69662873213D6E756C6C2626722E74657374287329297B766172206F3D722E657865632873293B733D6F2E76616C7565732E6C656E6774683E303F6F2E76616C7565732E73706C6974282F5C732A2C5C732A2F293A5B5D7D6E5B742E6E616'
||'D655D3D737D72657475726E206E7D'';',
'blog_install.i(78) := ''66756E6374696F6E207828742C6E297B72657475726E20743D3D6E756C6C7C7C742E6C656E6774683D3D307C7C743D3D225C6E223F743A28743D742E7265706C616365282F3C2F672C22266C743B22292C743D742E7265706C616365282F207B322C7D2F672C66756E6374696F6E2874297'
||'B766172206E3D22223B666F722876'';',
'blog_install.i(79) := ''617220723D303B723C742E6C656E6774682D313B722B2B296E2B3D652E636F6E6669672E73706163653B72657475726E206E2B2220227D292C6E213D6E756C6C262628743D7728742C66756E6374696F6E2865297B696628652E6C656E6774683D3D302972657475726E22223B766172207'
||'43D22223B72657475726E20653D65'';',
'blog_install.i(80) := ''2E7265706C616365282F5E28266E6273703B7C20292B2F2C66756E6374696F6E2865297B72657475726E20743D652C22227D292C652E6C656E6774683D3D303F743A742B273C636F646520636C6173733D22272B6E2B27223E272B652B223C2F636F64653E227D29292C74297D66756E637'
||'4696F6E205428652C74297B766172'';',
'blog_install.i(81) := ''206E3D652E746F537472696E6728293B7768696C65286E2E6C656E6774683C74296E3D2230222B6E3B72657475726E206E7D66756E6374696F6E204E28652C74297B766172206E3D22223B666F722876617220723D303B723C743B722B2B296E2B3D2220223B72657475726E20652E72657'
||'06C616365282F5C742F672C6E297D'';',
'blog_install.i(82) := ''66756E6374696F6E204328652C74297B66756E6374696F6E207528652C742C6E297B72657475726E20652E73756273747228302C74292B692E73756273747228302C6E292B652E73756273747228742B312C652E6C656E677468297D766172206E3D732865292C723D2209222C693D22223'
||'B666F7228766172206F3D303B6F3C'';',
'blog_install.i(83) := ''35303B6F2B2B29692B3D222020202020202020202020202020202020202020223B72657475726E20653D7728652C66756E6374696F6E2865297B696628652E696E6465784F662872293D3D2D312972657475726E20653B766172206E3D303B7768696C6528286E3D652E696E6465784F662'
||'8722929213D2D31297B7661722069'';',
'blog_install.i(84) := ''3D742D6E25743B653D7528652C6E2C69297D72657475726E20657D292C657D66756E6374696F6E206B2874297B766172206E3D2F3C62725C732A5C2F3F3E7C266C743B62725C732A5C2F3F2667743B2F67693B72657475726E20652E636F6E6669672E626C6F676765724D6F64653D3D312'
||'62628743D742E7265706C61636528'';',
'blog_install.i(85) := ''6E2C225C6E2229292C652E636F6E6669672E73747269704272733D3D31262628743D742E7265706C616365286E2C222229292C747D66756E6374696F6E204C2865297B72657475726E20652E7265706C616365282F5E5C732B7C5C732B242F672C2222297D66756E6374696F6E204128652'
||'97B76617220743D73286B28652929'';',
'blog_install.i(86) := ''2C6E3D6E65772041727261792C723D2F5E5C732A2F2C693D3165333B666F7228766172206F3D303B6F3C742E6C656E6774682626693E303B6F2B2B297B76617220753D745B6F5D3B6966284C2875292E6C656E6774683D3D3029636F6E74696E75653B76617220613D722E6578656328752'
||'93B696628613D3D6E756C6C297265'';',
'blog_install.i(87) := ''7475726E20653B693D4D6174682E6D696E28615B305D2E6C656E6774682C69297D696628693E3029666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B29745B6F5D3D745B6F5D2E7375627374722869293B72657475726E20742E6A6F696E28225C6E22297D66756E6374696'
||'F6E204F28652C74297B7265747572'';',
'blog_install.i(88) := ''6E20652E696E6465783C742E696E6465783F2D313A652E696E6465783E742E696E6465783F313A652E6C656E6774683C742E6C656E6774683F2D313A652E6C656E6774683E742E6C656E6774683F313A307D66756E6374696F6E204D28742C6E297B66756E6374696F6E207228652C74297'
||'B72657475726E20655B305D7D7661'';',
'blog_install.i(89) := ''7220693D302C733D6E756C6C2C6F3D5B5D2C753D6E2E66756E633F6E2E66756E633A723B7768696C652828733D6E2E72656765782E6578656328742929213D6E756C6C297B76617220613D7528732C6E293B747970656F6620613D3D22737472696E6722262628613D5B6E657720652E4D6'
||'174636828612C732E696E6465782C'';',
'blog_install.i(90) := ''6E2E637373295D292C6F3D6F2E636F6E6361742861297D72657475726E206F7D66756E6374696F6E205F2874297B766172206E3D2F282E2A2928282667743B7C266C743B292E2A292F3B72657475726E20742E7265706C61636528652E72656765784C69622E75726C2C66756E6374696F6'
||'E2865297B76617220743D22222C72'';',
'blog_install.i(91) := ''3D6E756C6C3B696628723D6E2E6578656328652929653D725B315D2C743D725B325D3B72657475726E273C6120687265663D22272B652B27223E272B652B223C2F613E222B747D297D66756E6374696F6E204428297B76617220653D646F63756D656E742E676574456C656D656E7473427'
||'95461674E616D6528227363726970'';',
'blog_install.i(92) := ''7422292C743D5B5D3B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29655B6E5D2E747970653D3D2273796E746178686967686C696768746572222626742E7075736828655B6E5D293B72657475726E20747D66756E6374696F6E20502865297B76617220743D223C215'
||'B43444154415B222C6E3D225D5D3E'';',
'blog_install.i(93) := ''222C723D4C2865292C693D21312C733D742E6C656E6774682C6F3D6E2E6C656E6774683B722E696E6465784F662874293D3D30262628723D722E737562737472696E672873292C693D2130293B76617220753D722E6C656E6774683B72657475726E20722E696E6465784F66286E293D3D7'
||'52D6F262628723D722E7375627374'';',
'blog_install.i(94) := ''72696E6728302C752D6F292C693D2130292C693F723A657D66756E6374696F6E20482865297B76617220743D652E7461726765742C693D6328742C222E73796E746178686967686C69676874657222292C733D6328742C222E636F6E7461696E657222292C6F3D646F63756D656E742E637'
||'265617465456C656D656E74282274'';',
'blog_install.i(95) := ''6578746172656122292C613B69662821737C7C21697C7C6C28732C22746578746172656122292972657475726E3B613D7528692E6964292C6E28692C22736F7572636522293B76617220663D732E6368696C644E6F6465732C683D5B5D3B666F722876617220703D303B703C662E6C656E6'
||'774683B702B2B29682E7075736828'';',
'blog_install.i(96) := ''665B705D2E696E6E6572546578747C7C665B705D2E74657874436F6E74656E74293B683D682E6A6F696E28225C7222292C683D682E7265706C616365282F5C75303061302F672C222022292C6F2E617070656E644368696C6428646F63756D656E742E637265617465546578744E6F64652'
||'86829292C732E617070656E644368'';',
'blog_install.i(97) := ''696C64286F292C6F2E666F63757328292C6F2E73656C65637428292C67286F2C22626C7572222C66756E6374696F6E2865297B6F2E706172656E744E6F64652E72656D6F76654368696C64286F292C7228692C22736F7572636522297D297D747970656F662072657175697265213D22756'
||'E646566696E656422262674797065'';',
'blog_install.i(98) := ''6F6620585265674578703D3D22756E646566696E656422262628585265674578703D7265717569726528225852656745787022292E58526567457870293B76617220653D7B64656661756C74733A7B22636C6173732D6E616D65223A22222C2266697273742D6C696E65223A312C2270616'
||'42D6C696E652D6E756D6265727322'';',
'blog_install.i(99) := ''3A21312C686967686C696768743A6E756C6C2C7469746C653A6E756C6C2C22736D6172742D74616273223A21302C227461622D73697A65223A342C6775747465723A21302C746F6F6C6261723A21302C22717569636B2D636F6465223A21302C636F6C6C617073653A21312C226175746F2'
||'D6C696E6B73223A21302C6C696768'';',
'blog_install.i(100) := ''743A21312C756E696E64656E743A21302C2268746D6C2D736372697074223A21317D2C636F6E6669673A7B73706163653A22266E6273703B222C757365536372697074546167733A21302C626C6F676765724D6F64653A21312C73747269704272733A21312C7461674E616D653A227072'
||'65222C737472696E67733A7B657870'';',
'blog_install.i(101) := ''616E64536F757263653A22657870616E6420736F75726365222C68656C703A223F222C616C6572743A2253796E746178486967686C6967687465725C6E5C6E222C6E6F42727573683A2243616E27742066696E6420627275736820666F723A20222C62727573684E6F7448746D6C536372'
||'6970743A224272757368207761736E'';',
'blog_install.i(102) := ''277420636F6E6669677572656420666F722068746D6C2D736372697074206F7074696F6E3A20222C61626F75744469616C6F673A224041424F555440227D7D2C766172733A7B646973636F7665726564427275736865733A6E756C6C2C686967686C696768746572733A7B7D7D2C627275'
||'736865733A7B7D2C72656765784C69'';',
'blog_install.i(103) := ''623A7B6D756C74694C696E6543436F6D6D656E74733A2F5C2F5C2A5B5C735C535D2A3F5C2A5C2F2F676D2C73696E676C654C696E6543436F6D6D656E74733A2F5C2F5C2F2E2A242F676D2C73696E676C654C696E655065726C436F6D6D656E74733A2F232E2A242F676D2C646F75626C65'
||'51756F746564537472696E673A2F22'';',
'blog_install.i(104) := ''285B5E5C5C225C6E5D7C5C5C2E292A222F672C73696E676C6551756F746564537472696E673A2F27285B5E5C5C275C6E5D7C5C5C2E292A272F672C6D756C74694C696E65446F75626C6551756F746564537472696E673A6E65772058526567457870282722285B5E5C5C5C5C225D7C5C5C'
||'5C5C2E292A22272C22677322292C6D'';',
'blog_install.i(105) := ''756C74694C696E6553696E676C6551756F746564537472696E673A6E65772058526567457870282227285B5E5C5C5C5C275D7C5C5C5C5C2E292A27222C22677322292C786D6C436F6D6D656E74733A2F28266C743B7C3C29212D2D5B5C735C535D2A3F2D2D282667743B7C3E292F676D2C'
||'75726C3A2F5C772B3A5C2F5C2F5B5C'';',
'blog_install.i(106) := ''772D2E5C2F3F25263D3A403B235D2A2F672C706870536372697074546167733A7B6C6566743A2F28266C743B7C3C295C3F283F3A3D7C706870293F2F672C72696768743A2F5C3F282667743B7C3E292F672C656F663A21307D2C617370536372697074546167733A7B6C6566743A2F2826'
||'6C743B7C3C29253D3F2F672C726967'';',
'blog_install.i(107) := ''68743A2F25282667743B7C3E292F677D2C736372697074536372697074546167733A7B6C6566743A2F28266C743B7C3C295C732A7363726970742E2A3F282667743B7C3E292F67692C72696768743A2F28266C743B7C3C295C2F5C732A7363726970745C732A282667743B7C3E292F6769'
||'7D7D2C746F6F6C6261723A7B676574'';',
'blog_install.i(108) := ''48746D6C3A66756E6374696F6E2874297B66756E6374696F6E207328742C6E297B72657475726E20652E746F6F6C6261722E676574427574746F6E48746D6C28742C6E2C652E636F6E6669672E737472696E67735B6E5D297D766172206E3D273C64697620636C6173733D22746F6F6C62'
||'6172223E272C723D652E746F6F6C62'';',
'blog_install.i(109) := ''61722E6974656D732C693D722E6C6973743B666F7228766172206F3D303B6F3C692E6C656E6774683B6F2B2B296E2B3D28725B695B6F5D5D2E67657448746D6C7C7C732928742C695B6F5D293B72657475726E206E2B3D223C2F6469763E222C6E7D2C676574427574746F6E48746D6C3A'
||'66756E6374696F6E28652C742C6E29'';',
'blog_install.i(110) := ''7B72657475726E273C7370616E3E3C6120687265663D22232220636C6173733D22746F6F6C6261725F6974656D20636F6D6D616E645F272B742B2220222B742B27223E272B6E2B223C2F613E3C2F7370616E3E227D2C68616E646C65723A66756E6374696F6E2874297B66756E6374696F'
||'6E20692865297B76617220743D6E65'';',
'blog_install.i(111) := ''772052656745787028652B225F285C5C772B2922292C6E3D742E657865632872293B72657475726E206E3F6E5B315D3A6E756C6C7D766172206E3D742E7461726765742C723D6E2E636C6173734E616D657C7C22222C733D752863286E2C222E73796E746178686967686C696768746572'
||'22292E6964292C6F3D692822636F6D'';',
'blog_install.i(112) := ''6D616E6422293B7326266F2626652E746F6F6C6261722E6974656D735B6F5D2E657865637574652873292C742E70726576656E7444656661756C7428297D2C6974656D733A7B6C6973743A5B22657870616E64536F75726365222C2268656C70225D2C657870616E64536F757263653A7B'
||'67657448746D6C3A66756E6374696F'';',
'blog_install.i(113) := ''6E2874297B696628742E676574506172616D2822636F6C6C617073652229213D312972657475726E22223B766172206E3D742E676574506172616D28227469746C6522293B72657475726E20652E746F6F6C6261722E676574427574746F6E48746D6C28742C22657870616E64536F7572'
||'6365222C6E3F6E3A652E636F6E6669'';',
'blog_install.i(114) := ''672E737472696E67732E657870616E64536F75726365297D2C657865637574653A66756E6374696F6E2865297B76617220743D6128652E6964293B7228742C22636F6C6C617073656422297D7D2C68656C703A7B657865637574653A66756E6374696F6E2874297B766172206E3D6D2822'
||'222C225F626C616E6B222C3530302C'';',
'blog_install.i(115) := ''3235302C227363726F6C6C626172733D3022292C723D6E2E646F63756D656E743B722E777269746528652E636F6E6669672E737472696E67732E61626F75744469616C6F67292C722E636C6F736528292C6E2E666F63757328297D7D7D7D2C66696E64456C656D656E74733A66756E6374'
||'696F6E28742C6E297B76617220723D'';',
'blog_install.i(116) := ''6E3F5B6E5D3A6928646F63756D656E742E676574456C656D656E747342795461674E616D6528652E636F6E6669672E7461674E616D6529292C733D652E636F6E6669672C6F3D5B5D3B732E75736553637269707454616773262628723D722E636F6E6361742844282929293B696628722E'
||'6C656E6774683D3D3D302972657475'';',
'blog_install.i(117) := ''726E206F3B666F722876617220753D303B753C722E6C656E6774683B752B2B297B76617220613D7B7461726765743A725B755D2C706172616D733A6428742C5328725B755D2E636C6173734E616D6529297D3B696628612E706172616D735B226272757368225D3D3D6E756C6C29636F6E'
||'74696E75653B6F2E70757368286129'';',
'blog_install.i(118) := ''7D72657475726E206F7D2C686967686C696768743A66756E6374696F6E28742C6E297B76617220723D746869732E66696E64456C656D656E747328742C6E292C693D22696E6E657248544D4C222C733D6E756C6C2C6F3D652E636F6E6669673B696628722E6C656E6774683D3D3D302972'
||'657475726E3B666F72287661722075'';',
'blog_install.i(119) := ''3D303B753C722E6C656E6774683B752B2B297B766172206E3D725B755D2C613D6E2E7461726765742C663D6E2E706172616D732C6C3D662E62727573682C633B6966286C3D3D6E756C6C29636F6E74696E75653B696628665B2268746D6C2D736372697074225D3D3D2274727565227C7C'
||'652E64656661756C74735B2268746D'';',
'blog_install.i(120) := ''6C2D736372697074225D3D3D3129733D6E657720652E48746D6C536372697074286C292C6C3D2268746D6C736372697074223B656C73657B76617220683D62286C293B696628216829636F6E74696E75653B733D6E657720687D633D615B695D2C6F2E7573655363726970745461677326'
||'2628633D50286329292C28612E7469'';',
'blog_install.i(121) := ''746C657C7C222229213D2222262628662E7469746C653D612E7469746C65292C662E62727573683D6C2C732E696E69742866292C6E3D732E6765744469762863292C28612E69647C7C222229213D22222626286E2E69643D612E6964292C612E706172656E744E6F64652E7265706C6163'
||'654368696C64286E2C61297D7D2C61'';',
'blog_install.i(122) := ''6C6C3A66756E6374696F6E2874297B672877696E646F772C226C6F6164222C66756E6374696F6E28297B652E686967686C696768742874297D297D7D3B72657475726E20652E4D617463683D66756E6374696F6E28652C742C6E297B746869732E76616C75653D652C746869732E696E64'
||'65783D742C746869732E6C656E6774'';',
'blog_install.i(123) := ''683D652E6C656E6774682C746869732E6373733D6E2C746869732E62727573684E616D653D6E756C6C7D2C652E4D617463682E70726F746F747970652E746F537472696E673D66756E6374696F6E28297B72657475726E20746869732E76616C75657D2C652E48746D6C5363726970743D'
||'66756E6374696F6E2874297B66756E'';',
'blog_install.i(124) := ''6374696F6E206628652C74297B666F7228766172206E3D303B6E3C652E6C656E6774683B6E2B2B29655B6E5D2E696E6465782B3D747D66756E6374696F6E206C28652C74297B76617220693D652E636F64652C733D5B5D2C6F3D722E72656765784C6973742C753D652E696E6465782B65'
||'2E6C6566742E6C656E6774682C613D'';',
'blog_install.i(125) := ''722E68746D6C5363726970742C6C3B666F722876617220633D303B633C6F2E6C656E6774683B632B2B296C3D4D28692C6F5B635D292C66286C2C75292C733D732E636F6E636174286C293B612E6C656674213D6E756C6C2626652E6C656674213D6E756C6C2626286C3D4D28652E6C6566'
||'742C612E6C656674292C66286C2C65'';',
'blog_install.i(126) := ''2E696E646578292C733D732E636F6E636174286C29292C612E7269676874213D6E756C6C2626652E7269676874213D6E756C6C2626286C3D4D28652E72696768742C612E7269676874292C66286C2C652E696E6465782B655B305D2E6C617374496E6465784F6628652E72696768742929'
||'2C733D732E636F6E636174286C2929'';',
'blog_install.i(127) := ''3B666F722876617220683D303B683C732E6C656E6774683B682B2B29735B685D2E62727573684E616D653D6E2E62727573684E616D653B72657475726E20737D766172206E3D622874292C722C693D6E657720652E627275736865732E586D6C2C733D6E756C6C2C6F3D746869732C753D'
||'226765744469762067657448746D6C'';',
'blog_install.i(128) := ''20696E6974222E73706C697428222022293B6966286E3D3D6E756C6C2972657475726E3B723D6E6577206E3B666F722876617220613D303B613C752E6C656E6774683B612B2B292866756E6374696F6E28297B76617220653D755B615D3B6F5B655D3D66756E6374696F6E28297B726574'
||'75726E20695B655D2E6170706C7928'';',
'blog_install.i(129) := ''692C617267756D656E7473297D7D2928293B696628722E68746D6C5363726970743D3D6E756C6C297B7928652E636F6E6669672E73'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'7472696E67732E62727573684E6F7448746D6C5363726970742B74293B72657475726E7D692E72656765784C6973742E70757368287B72656765783A722E68746D6C5363726970742E636F'';',
'blog_install.i(130) := ''64652C66756E633A6C7D297D2C652E486967686C6967687465723D66756E6374696F6E28297B7D2C652E486967686C6967687465722E70726F746F747970653D7B676574506172616D3A66756E6374696F6E28652C74297B766172206E3D746869732E706172616D735B655D3B72657475'
||'726E2076286E3D3D6E756C6C3F743A'';',
'blog_install.i(131) := ''6E297D2C6372656174653A66756E6374696F6E2865297B72657475726E20646F63756D656E742E637265617465456C656D656E742865297D2C66696E644D6174636865733A66756E6374696F6E28652C74297B766172206E3D5B5D3B69662865213D6E756C6C29666F722876617220723D'
||'303B723C652E6C656E6774683B722B'';',
'blog_install.i(132) := ''2B29747970656F6620655B725D3D3D226F626A656374222626286E3D6E2E636F6E636174284D28742C655B725D2929293B72657475726E20746869732E72656D6F76654E65737465644D617463686573286E2E736F7274284F29297D2C72656D6F76654E65737465644D6174636865733A'
||'66756E6374696F6E2865297B666F72'';',
'blog_install.i(133) := ''2876617220743D303B743C652E6C656E6774683B742B2B297B696628655B745D3D3D3D6E756C6C29636F6E74696E75653B766172206E3D655B745D2C723D6E2E696E6465782B6E2E6C656E6774683B666F722876617220693D742B313B693C652E6C656E6774682626655B745D213D3D6E'
||'756C6C3B692B2B297B76617220733D'';',
'blog_install.i(134) := ''655B695D3B696628733D3D3D6E756C6C29636F6E74696E75653B696628732E696E6465783E7229627265616B3B732E696E6465783D3D6E2E696E6465782626732E6C656E6774683E6E2E6C656E6774683F655B745D3D6E756C6C3A732E696E6465783E3D6E2E696E6465782626732E696E'
||'6465783C72262628655B695D3D6E75'';',
'blog_install.i(135) := ''6C6C297D7D72657475726E20657D2C6669677572654F75744C696E654E756D626572733A66756E6374696F6E2865297B76617220743D5B5D2C6E3D7061727365496E7428746869732E676574506172616D282266697273742D6C696E652229293B72657475726E207728652C66756E6374'
||'696F6E28652C72297B742E70757368'';',
'blog_install.i(136) := ''28722B6E297D292C747D2C69734C696E65486967686C6967687465643A66756E6374696F6E2865297B76617220743D746869732E676574506172616D2822686967686C69676874222C5B5D293B72657475726E20747970656F662074213D226F626A656374222626742E707573683D3D6E'
||'756C6C262628743D5B745D292C6828'';',
'blog_install.i(137) := ''742C652E746F537472696E67282929213D2D317D2C6765744C696E6548746D6C3A66756E6374696F6E28652C742C6E297B76617220723D5B226C696E65222C226E756D626572222B742C22696E646578222B652C22616C74222B287425323D3D303F313A32292E746F537472696E672829'
||'5D3B72657475726E20746869732E69'';',
'blog_install.i(138) := ''734C696E65486967686C6967687465642874292626722E707573682822686967686C69676874656422292C743D3D302626722E707573682822627265616B22292C273C64697620636C6173733D22272B722E6A6F696E28222022292B27223E272B6E2B223C2F6469763E227D2C6765744C'
||'696E654E756D6265727348746D6C3A'';',
'blog_install.i(139) := ''66756E6374696F6E28742C6E297B76617220723D22222C693D732874292E6C656E6774682C6F3D7061727365496E7428746869732E676574506172616D282266697273742D6C696E652229292C753D746869732E676574506172616D28227061642D6C696E652D6E756D6265727322293B'
||'753D3D313F753D286F2B692D31292E'';',
'blog_install.i(140) := ''746F537472696E6728292E6C656E6774683A69734E614E2875293D3D31262628753D30293B666F722876617220613D303B613C693B612B2B297B76617220663D6E3F6E5B615D3A6F2B612C743D663D3D303F652E636F6E6669672E73706163653A5428662C75293B722B3D746869732E67'
||'65744C696E6548746D6C28612C662C'';',
'blog_install.i(141) := ''74297D72657475726E20727D2C676574436F64654C696E657348746D6C3A66756E6374696F6E28742C6E297B743D4C2874293B76617220723D732874292C693D746869732E676574506172616D28227061642D6C696E652D6E756D6265727322292C6F3D7061727365496E742874686973'
||'2E676574506172616D282266697273'';',
'blog_install.i(142) := ''742D6C696E652229292C743D22222C753D746869732E676574506172616D2822627275736822293B666F722876617220613D303B613C722E6C656E6774683B612B2B297B76617220663D725B615D2C6C3D2F5E28266E6273703B7C5C73292B2F2E657865632866292C633D6E756C6C2C68'
||'3D6E3F6E5B615D3A6F2B613B6C213D'';',
'blog_install.i(143) := ''6E756C6C262628633D6C5B305D2E746F537472696E6728292C663D662E73756273747228632E6C656E677468292C633D632E7265706C616365282220222C652E636F6E6669672E737061636529292C663D4C2866292C662E6C656E6774683D3D30262628663D652E636F6E6669672E7370'
||'616365292C742B3D746869732E6765'';',
'blog_install.i(144) := ''744C696E6548746D6C28612C682C2863213D6E756C6C3F273C636F646520636C6173733D22272B752B2720737061636573223E272B632B223C2F636F64653E223A2222292B66297D72657475726E20747D2C6765745469746C6548746D6C3A66756E6374696F6E2865297B72657475726E'
||'20653F223C63617074696F6E3E222B'';',
'blog_install.i(145) := ''652B223C2F63617074696F6E3E223A22227D2C6765744D61746368657348746D6C3A66756E6374696F6E28652C74297B66756E6374696F6E20732865297B76617220743D653F652E62727573684E616D657C7C693A693B72657475726E20743F742B2220223A22227D766172206E3D302C'
||'723D22222C693D746869732E676574'';',
'blog_install.i(146) := ''506172616D28226272757368222C2222293B666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B297B76617220753D745B6F5D2C613B696628753D3D3D6E756C6C7C7C752E6C656E6774683D3D3D3029636F6E74696E75653B613D732875292C722B3D7828652E7375627374'
||'72286E2C752E696E6465782D6E292C'';',
'blog_install.i(147) := ''612B22706C61696E22292B7828752E76616C75652C612B752E637373292C6E3D752E696E6465782B752E6C656E6774682B28752E6F66667365747C7C30297D72657475726E20722B3D7828652E737562737472286E292C7328292B22706C61696E22292C727D2C67657448746D6C3A6675'
||'6E6374696F6E2874297B766172206E'';',
'blog_install.i(148) := ''3D22222C723D5B2273796E746178686967686C696768746572225D2C692C732C753B72657475726E20746869732E676574506172616D28226C6967687422293D3D31262628746869732E706172616D732E746F6F6C6261723D746869732E706172616D732E6775747465723D2131292C63'
||'6C6173734E616D653D2273796E7461'';',
'blog_install.i(149) := ''78686967686C696768746572222C746869732E676574506172616D2822636F6C6C6170736522293D3D312626722E707573682822636F6C6C617073656422292C286775747465723D746869732E676574506172616D28226775747465722229293D3D302626722E7075736828226E6F6775'
||'7474657222292C722E707573682874'';',
'blog_install.i(150) := ''6869732E676574506172616D2822636C6173732D6E616D652229292C722E7075736828746869732E676574506172616D282262727573682229292C743D452874292E7265706C616365282F5C722F672C222022292C693D746869732E676574506172616D28227461622D73697A6522292C'
||'743D746869732E676574506172616D'';',
'blog_install.i(151) := ''2822736D6172742D7461627322293D3D313F4328742C69293A4E28742C69292C746869732E676574506172616D2822756E696E64656E742229262628743D41287429292C677574746572262628753D746869732E6669677572654F75744C696E654E756D62657273287429292C733D7468'
||'69732E66696E644D61746368657328'';',
'blog_install.i(152) := ''746869732E72656765784C6973742C74292C6E3D746869732E6765744D61746368657348746D6C28742C73292C6E3D746869732E676574436F64654C696E657348746D6C286E2C75292C746869732E676574506172616D28226175746F2D6C696E6B7322292626286E3D5F286E29292C74'
||'7970656F66206E6176696761746F72'';',
'blog_install.i(153) := ''213D22756E646566696E65642226266E6176696761746F722E757365724167656E7426266E6176696761746F722E757365724167656E742E6D61746368282F4D5349452F292626722E707573682822696522292C6E3D273C6469762069643D22272B6F28746869732E6964292B27222063'
||'6C6173733D22272B722E6A6F696E28'';',
'blog_install.i(154) := ''222022292B27223E272B28746869732E676574506172616D2822746F6F6C62617222293F652E746F6F6C6261722E67657448746D6C2874686973293A2222292B273C7461626C6520626F726465723D2230222063656C6C70616464696E673D2230222063656C6C73706163696E673D2230'
||'223E272B746869732E676574546974'';',
'blog_install.i(155) := ''6C6548746D6C28746869732E676574506172616D28227469746C652229292B223C74626F64793E222B223C74723E222B286775747465723F273C746420636C6173733D22677574746572223E272B746869732E6765744C696E654E756D6265727348746D6C2874292B223C2F74643E223A'
||'2222292B273C746420636C6173733D'';',
'blog_install.i(156) := ''22636F6465223E272B273C64697620636C6173733D22636F6E7461696E6572223E272B6E2B223C2F6469763E222B223C2F74643E222B223C2F74723E222B223C2F74626F64793E222B223C2F7461626C653E222B223C2F6469763E222C6E7D2C6765744469763A66756E6374696F6E2874'
||'297B743D3D3D6E756C6C262628743D'';',
'blog_install.i(157) := ''2222292C746869732E636F64653D743B766172206E3D746869732E637265617465282264697622293B72657475726E206E2E696E6E657248544D4C3D746869732E67657448746D6C2874292C746869732E676574506172616D2822746F6F6C6261722229262667286C286E2C222E746F6F'
||'6C62617222292C22636C69636B222C'';',
'blog_install.i(158) := ''652E746F6F6C6261722E68616E646C6572292C746869732E676574506172616D2822717569636B2D636F64652229262667286C286E2C222E636F646522292C2264626C636C69636B222C48292C6E7D2C696E69743A66756E6374696F6E2874297B746869732E69643D7028292C66287468'
||'6973292C746869732E706172616D73'';',
'blog_install.i(159) := ''3D6428652E64656661756C74732C747C7C7B7D292C746869732E676574506172616D28226C6967687422293D3D31262628746869732E706172616D732E746F6F6C6261723D746869732E706172616D732E6775747465723D2131297D2C6765744B6579776F7264733A66756E6374696F6E'
||'2865297B72657475726E20653D652E'';',
'blog_install.i(160) := ''7265706C616365282F5E5C732B7C5C732B242F672C2222292E7265706C616365282F5C732B2F672C227C22292C225C5C62283F3A222B652B22295C5C62227D2C666F7248746D6C5363726970743A66756E6374696F6E2865297B76617220743D7B656E643A652E72696768742E736F7572'
||'63657D3B652E656F66262628742E65'';',
'blog_install.i(161) := ''6E643D22283F3A283F3A222B742E656E642B22297C242922292C746869732E68746D6C5363726970743D7B6C6566743A7B72656765783A652E6C6566742C6373733A22736372697074227D2C72696768743A7B72656765783A652E72696768742C6373733A22736372697074227D2C636F'
||'64653A6E6577205852656745787028'';',
'blog_install.i(162) := ''22283F3C6C6566743E222B652E6C6566742E736F757263652B2229222B22283F3C636F64653E2E2A3F29222B22283F3C72696768743E222B742E656E642B2229222C2273676922297D7D7D2C657D28293B747970656F66206578706F727473213D22756E646566696E6564223F6578706F'
||'7274732E53796E746178486967686C'';',
'blog_install.i(163) := ''6967687465723D53796E746178486967686C6967687465723A6E756C6C0D0A2F2A207365742064656661756C7473202A2F0D0A53796E746178486967686C6967687465722E64656661756C74735B22746F6F6C626172225D3D66616C73653B0D0A2F2A2073684272757368506C61696E2E'
||'6A73202A2F0D0A3B2866756E637469'';',
'blog_install.i(164) := ''6F6E28297B53796E746178486967686C6967687465723D53796E746178486967686C696768746572207C7C2028747970656F66207265717569726520213D3D2027756E646566696E6564273F207265717569726528277368436F726527292E53796E746178486967686C69676874657220'
||'3A206E756C6C293B66756E6374696F'';',
'blog_install.i(165) := ''6E20427275736828297B7D3B42727573682E70726F746F747970653D6E65772053796E746178486967686C6967687465722E486967686C69676874657228293B42727573682E616C69617365733D5B2774657874272C27706C61696E275D3B53796E746178486967686C6967687465722E'
||'627275736865732E506C61696E3D42'';',
'blog_install.i(166) := ''727573683B747970656F66286578706F72747329213D27756E646566696E6564273F6578706F7274732E42727573683D42727573683A6E756C6C3B7D2928293B0D0A2F2A0D0A202A206A517565727920706C7567696E3A206669656C6453656C656374696F6E202D2076302E312E31202D'
||'206C617374206368616E67653A2032'';',
'blog_install.i(167) := ''3030362D31322D31360D0A202A20286329203230303620416C6578204272656D203C616C657840307861622E63643E202D20687474703A2F2F626C6F672E307861622E63640D0A202A2F0D0A2866756E6374696F6E2863297B632E65616368287B67657453656C656374696F6E3A66756E'
||'6374696F6E28297B76617220623D74'';',
'blog_install.i(168) := ''6869732E6A71756572793F746869735B305D3A746869733B72657475726E282273656C656374696F6E537461727422696E2062262666756E6374696F6E28297B76617220613D622E73656C656374696F6E456E642D622E73656C656374696F6E53746172743B72657475726E7B73746172'
||'743A622E73656C656374696F6E5374'';',
'blog_install.i(169) := ''6172742C656E643A622E73656C656374696F6E456E642C6C656E6774683A612C746578743A622E76616C75652E73756273747228622E73656C656374696F6E53746172742C61297D7D7C7C646F63756D656E742E73656C656374696F6E262666756E6374696F6E28297B622E666F637573'
||'28293B76617220613D646F63756D65'';',
'blog_install.i(170) := ''6E742E73656C656374696F6E2E63726561746552616E676528293B6966286E756C6C3D3D3D612972657475726E7B73746172743A302C656E643A622E76616C75652E6C656E6774682C6C656E6774683A307D3B76617220643D622E6372656174655465787452616E676528292C633D642E'
||'6475706C696361746528293B642E6D'';',
'blog_install.i(171) := ''6F7665546F426F6F6B6D61726B28612E676574426F6F6B6D61726B2829293B632E736574456E64506F696E742822456E64546F5374617274222C64293B72657475726E7B73746172743A632E746578742E6C656E6774682C20656E643A632E746578742E6C656E6774682B612E74657874'
||'2E6C656E6774682C6C656E6774683A'';',
'blog_install.i(172) := ''612E746578742E6C656E6774682C746578743A612E746578747D7D7C7C66756E6374696F6E28297B72657475726E206E756C6C7D2928297D2C7265706C61636553656C656374696F6E3A66756E6374696F6E2862297B76617220613D746869732E6A71756572793F746869735B305D3A74'
||'6869732C643D627C7C22223B726574'';',
'blog_install.i(173) := ''75726E282273656C656374696F6E537461727422696E2061262666756E6374696F6E28297B612E76616C75653D612E76616C75652E73756273747228302C612E73656C656374696F6E5374617274292B642B612E76616C75652E73756273747228612E73656C656374696F6E456E642C61'
||'2E76616C75652E6C656E677468293B'';',
'blog_install.i(174) := ''72657475726E20746869737D7C7C646F63756D656E742E73656C656374696F6E262666756E6374696F6E28297B612E666F63757328293B646F63756D656E742E73656C656374696F6E2E63726561746552616E676528292E746578743D643B72657475726E20746869737D7C7C66756E63'
||'74696F6E28297B612E76616C75652B'';',
'blog_install.i(175) := ''3D643B72657475726E20632861297D2928297D7D2C66756E6374696F6E2862297B632E666E5B625D3D746869737D297D29286A5175657279293B0D0A66756E6374696F6E206164645374796C6554616728622C63297B76617220643D223C222B622B223E222C653D223C2F222B622B223E'
||'222C613D24282478286329292C663D'';',
'blog_install.i(176) := ''612E67657453656C656374696F6E28292E746578743B612E7265706C61636553656C656374696F6E28642B662B65293B612E666F63757328297D3B0D0A2F2A210D0A09536C696D626F782076322E3035202D2054686520756C74696D617465206C69676874776569676874204C69676874'
||'626F7820636C6F6E6520666F72206A'';',
'blog_install.i(177) := ''51756572790D0A0928632920323030372D32303133204368726973746F706865204265796C73203C687474703A2F2F7777772E6469676974616C69612E62653E0D0A094D49542D7374796C65206C6963656E73652E0D0A2A2F0D0A2866756E6374696F6E2877297B76617220453D772877'
||'696E646F77292C752C662C463D2D31'';',
'blog_install.i(178) := ''2C6E2C782C442C762C792C4C2C722C6D3D2177696E646F772E584D4C48747470526571756573742C733D5B5D2C6C3D646F63756D656E742E646F63756D656E74456C656D656E742C6B3D7B7D2C743D6E657720496D61676528292C4A3D6E657720496D61676528292C482C612C672C702C'
||'492C642C472C632C412C4B3B772866'';',
'blog_install.i(179) := ''756E6374696F6E28297B772822626F647922292E617070656E642877285B483D7728273C6469762069643D226C624F7665726C617922202F3E27292E636C69636B2843295B305D2C613D7728273C6469762069643D226C6243656E74657222202F3E27295B305D2C473D7728273C646976'
||'2069643D226C62426F74746F6D436F'';',
'blog_install.i(180) := ''6E7461696E657222202F3E27295B305D5D292E6373732822646973706C6179222C226E6F6E652229293B673D7728273C6469762069643D226C62496D61676522202F3E27292E617070656E64546F2861292E617070656E6428703D7728273C646976207374796C653D22706F736974696F'
||'6E3A2072656C61746976653B22202F'';',
'blog_install.i(181) := ''3E27292E617070656E64285B493D7728273C612069643D226C62507265764C696E6B2220687265663D222322202F3E27292E636C69636B2842295B305D2C643D7728273C612069643D226C624E6578744C696E6B2220687265663D222322202F3E27292E636C69636B2865295B305D5D29'
||'5B305D295B305D3B633D7728273C64'';',
'blog_install.i(182) := ''69762069643D226C62426F74746F6D22202F3E27292E617070656E64546F2847292E617070656E64285B7728273C612069643D226C62436C6F73654C696E6B2220687265663D222322202F3E27292E636C69636B2843295B305D2C413D7728273C6469762069643D226C6243617074696F'
||'6E22202F3E27295B305D2C4B3D7728'';',
'blog_install.i(183) := ''273C6469762069643D226C624E756D62657222202F3E27295B305D2C7728273C646976207374796C653D22636C6561723A20626F74683B22202F3E27295B305D5D295B305D7D293B772E736C696D626F783D66756E6374696F6E284F2C4E2C4D297B753D772E657874656E64287B6C6F6F'
||'703A66616C73652C6F7665726C6179'';',
'blog_install.i(184) := ''4F7061636974793A302E382C6F7665726C6179466164654475726174696F6E3A3430302C726573697A654475726174696F6E3A3430302C726573697A65456173696E673A227377696E67222C696E697469616C57696474683A3235302C696E697469616C4865696768743A3235302C696D'
||'616765466164654475726174696F6E'';',
'blog_install.i(185) := ''3A3430302C63617074696F6E416E696D6174696F6E4475726174696F6E3A3430302C636F756E746572546578743A22496D616765207B787D206F66207B797D222C636C6F73654B6579733A5B32372C38382C36375D2C70726576696F75734B6579733A5B33372C38305D2C6E6578744B65'
||'79733A5B33392C37385D7D2C4D293B'';',
'blog_install.i(186) := ''696628747970656F66204F3D3D22737472696E6722297B4F3D5B5B4F2C4E5D5D3B4E3D307D793D452E7363726F6C6C546F7028292B28452E68656967687428292F32293B4C3D752E696E697469616C57696474683B723D752E696E697469616C4865696768743B772861292E637373287B'
||'746F703A4D6174682E6D617828302C'';',
'blog_install.i(187) := ''792D28722F3229292C77696474683A4C2C6865696768743A722C6D617267696E4C6566743A2D4C2F327D292E73686F7728293B763D6D7C7C28482E63757272656E745374796C65262628482E63757272656E745374796C652E706F736974696F6E213D2266697865642229293B69662876'
||'297B482E7374796C652E706F736974'';',
'blog_install.i(188) := ''696F6E3D226162736F6C757465227D772848292E63737328226F706163697479222C752E6F7665726C61794F706163697479292E66616465496E28752E6F7665726C6179466164654475726174696F6E293B7A28293B6A2831293B663D4F3B752E6C6F6F703D752E6C6F6F70262628662E'
||'6C656E6774683E31293B7265747572'';',
'blog_install.i(189) := ''6E2062284E297D3B772E666E2E736C696D626F783D66756E6374696F6E284D2C502C4F297B503D507C7C66756E6374696F6E2851297B72657475726E5B512E687265662C512E7469746C655D7D3B4F3D4F7C7C66756E6374696F6E28297B72657475726E20747275657D3B766172204E3D'
||'746869733B72657475726E204E2E75'';',
'blog_install.i(190) := ''6E62696E642822636C69636B22292E636C69636B2866756E6374696F6E28297B76617220533D746869732C553D302C542C513D302C523B543D772E67726570284E2C66756E6374696F6E28572C56297B72657475726E204F2E63616C6C28532C572C56297D293B666F7228523D542E6C65'
||'6E6774683B513C523B2B2B51297B69'';',
'blog_install.i(191) := ''6628545B515D3D3D53297B553D517D545B515D3D5028545B515D2C51297D72657475726E20772E736C696D626F7828542C552C4D297D297D3B66756E6374696F6E207A28297B766172204E3D452E7363726F6C6C4C65667428292C4D3D452E776964746828293B77285B612C475D292E63'
||'737328226C656674222C4E2B284D2F'';',
'blog_install.i(192) := ''3229293B69662876297B772848292E637373287B6C6566743A4E2C746F703A452E7363726F6C6C546F7028292C77696474683A4D2C6865696768743A452E68656967687428297D297D7D66756E6374696F6E206A284D297B6966284D297B7728226F626A65637422292E616464286D3F22'
||'73656C656374223A22656D62656422'';',
'blog_install.i(193) := ''292E656163682866756E6374696F6E284F2C50297B735B4F5D3D5B502C502E7374796C652E7669736962696C6974795D3B502E7374796C652E7669736962696C6974793D2268696464656E227D297D656C73657B772E6561636828732C66756E6374696F6E284F2C50297B505B305D2E73'
||'74796C652E7669736962696C697479'';',
'blog_install.i(194) := ''3D505B315D7D293B733D5B5D7D766172204E3D4D3F2262696E64223A22756E62696E64223B455B4E5D28227363726F6C6C20726573697A65222C7A293B7728646F63756D656E74295B4E5D28226B6579646F776E222C6F297D66756E6374696F6E206F284F297B766172204E3D4F2E7768'
||'6963682C4D3D772E696E4172726179'';',
'blog_install.i(195) := ''3B72657475726E284D284E2C752E636C6F73654B657973293E3D30293F4328293A284D284E2C752E6E6578744B657973293E3D30293F6528293A284D284E2C752E70726576696F75734B657973293E3D30293F4228293A6E756C6C7D66756E6374696F6E204228297B72657475726E2062'
||'2878297D66756E6374696F6E206528'';',
'blog_install.i(196) := ''297B72657475726E20622844297D66756E6374696F6E2062284D297B6966284D3E3D30297B463D4D3B6E3D665B465D5B305D3B783D28467C7C28752E6C6F6F703F662E6C656E6774683A3029292D313B443D2828462B312925662E6C656E677468297C7C28752E6C6F6F703F303A2D3129'
||'3B7128293B612E636C6173734E616D'';',
'blog_install.i(197) := ''653D226C624C6F6164696E67223B6B3D6E657720496D61676528293B6B2E6F6E6C6F61643D693B6B2E7372633D6E7D72657475726E2066616C73657D66756E6374696F6E206928297B612E636C6173734E616D653D22223B772867292E637373287B6261636B67726F756E64496D616765'
||'3A2275726C28222B6E2B2229222C76'';',
'blog_install.i(198) := ''69736962696C6974793A2268696464656E222C646973706C61793A22227D293B772870292E7769647468286B2E7769647468293B77285B702C492C645D292E686569676874286B2E686569676874293B772841292E68746D6C28665B465D5B315D7C7C2222293B77284B292E68746D6C28'
||'282828662E6C656E6774683E312926'';',
'blog_install.i(199) := ''26752E636F756E74657254657874297C7C2222292E7265706C616365282F7B787D2F2C462B31292E7265706C616365282F7B797D2F2C662E6C656E67746829293B696628783E3D30297B742E7372633D665B785D5B305D7D696628443E3D30297B4A2E7372633D665B445D5B305D7D4C3D'
||'672E6F666673657457696474683B72'';',
'blog_install.i(200) := ''3D672E6F66667365744865696768743B766172204D3D4D6174682E6D617828302C792D28722F3229293B696628612E6F6666736574486569676874213D72297B772861292E616E696D617465287B6865696768743A722C746F703A4D7D2C752E726573697A654475726174696F6E2C752E'
||'726573697A65456173696E67297D69'';',
'blog_install.i(201) := ''6628612E6F66667365745769647468213D4C297B772861292E616E696D617465287B77696474683A4C2C6D617267696E4C6566743A2D4C2F327D2C752E726573697A654475726174696F6E2C752E726573697A65456173696E67297D772861292E71756575652866756E6374696F6E2829'
||'7B772847292E637373287B77696474'';',
'blog_install.i(202) := ''683A4C2C746F703A4D2B722C6D617267696E4C6566743A2D4C2F322C7669736962696C6974793A2268696464656E222C646973706C61793A22227D293B772867292E637373287B646973706C61793A226E6F6E65222C7669736962696C6974793A22222C6F7061636974793A22227D292E'
||'66616465496E28752E696D61676546'';',
'blog_install.i(203) := ''6164654475726174696F6E2C68297D297D66756E6374696F6E206828297B696628783E3D30297B772849292E73686F7728297D696628443E3D30297B772864292E73686F7728297D772863292E63737328226D617267696E546F70222C2D632E6F6666736574486569676874292E616E69'
||'6D617465287B6D617267696E546F70'';',
'blog_install.i(204) := ''3A307D2C752E63617074696F6E416E696D6174696F6E4475726174696F6E293B472E7374796C652E7669736962696C6974793D22227D66756E6374696F6E207128297B6B2E6F6E6C6F61643D6E756C6C3B6B2E7372633D742E7372633D4A2E7372633D6E3B77285B612C672C635D292E73'
||'746F702874727565293B77285B492C'';',
'blog_install.i(205) := ''642C672C475D292E6869646528297D66756E6374696F6E204328297B696628463E3D30297B7128293B463D783D443D2D313B772861292E6869646528293B772848292E73746F7028292E666164654F757428752E6F7665726C6179466164654475726174696F6E2C6A297D72657475726E'
||'2066616C73657D7D29286A51756572'';',
'blog_install.i(206) := ''79293B0D0A2F2A0D0A202A204261736963206A517565727920536C6964657220706C75672D696E20762E312E330D0A202A0D0A202A20687474703A2F2F7777772E62617369632D736C696465722E636F6D0D0A202A0D0A202A20417574686F726564206279204A6F686E20436F62620D0A'
||'202A20687474703A2F2F7777772E6A'';',
'blog_install.i(207) := ''6F686E636F62622E6E616D650D0A202A20406A6F686E303531340D0A202A0D0A202A20436F7079726967687420323031312C204A6F686E20436F62620D0A202A204C6963656E73653A20474E552047656E6572616C205075626C6963204C6963656E73652C2076657273696F6E20332028'
||'47504C2D332E30290D0A202A206874'';',
'blog_install.i(208) := ''74703A2F2F7777772E6F70656E736F757263652E6F72672F6C6963656E7365732F67706C2D332E302E68746D6C0D0A202A0D0A202A2F0D0A2866756E6374696F6E2865297B2275736520737472696374223B652E666E2E626A71733D66756E6374696F6E2874297B766172206E3D7B7769'
||'6474683A3730302C6865696768743A'';',
'blog_install.i(209) := ''3330302C616E696D747970653A2266616465222C616E696D6475726174696F6E3A3435302C616E696D73706565643A3465332C6175746F6D617469633A21302C73686F77636F6E74726F6C733A21302C63656E746572636F6E74726F6C733A21302C6E657874746578743A224E65787422'
||'2C70726576746578743A2250726576'';',
'blog_install.i(210) := ''222C73686F776D61726B6572733A21302C63656E7465726D61726B6572733A21302C6B6579626F6172646E61763A21302C686F76657270617573653A21302C75736563617074696F6E733A21302C72616E646F6D73746172743A21312C726573706F6E736976653A21317D2C723D652E65'
||'7874656E64287B7D2C6E2C74292C69'';',
'blog_install.i(211) := ''3D746869732C733D692E66696E642822756C2E626A717322292C6F3D732E6368696C6472656E28226C6922292C753D6E756C6C2C613D6E756C6C2C663D6E756C6C2C6C3D6E756C6C2C633D6E756C6C2C683D6E756C6C2C703D6E756C6C2C643D6E756C6C2C763D7B736C696465636F756E'
||'743A6F2E6C656E6774682C616E696D'';',
'blog_install.i(212) := ''6174696E673A21312C7061757365643A21312C63757272656E74736C6964653A312C6E657874736C6964653A302C63757272656E74696E6465783A302C6E657874696E6465783A302C696E74657276616C3A6E756C6C7D2C6D3D7B77696474683A6E756C6C2C6865696768743A6E756C6C'
||'2C726174696F3A6E756C6C7D2C673D'';',
'blog_install.i(213) := ''7B6677643A22666F7277617264222C707265763A2270726576696F7573227D2C793D66756E6374696F6E28297B6F2E616464436C6173732822626A71732D736C69646522293B722E726573706F6E736976653F6228293A4528293B696628762E736C696465636F756E743E31297B722E72'
||'616E646F6D737461727426264C2829'';',
'blog_install.i(214) := ''3B722E73686F77636F6E74726F6C7326267828293B722E73686F776D61726B65727326265428293B722E6B6579626F6172646E617626264E28293B722E686F76657270617573652626722E6175746F6D6174696326264328293B722E616E696D747970653D3D3D22736C69646522262653'
||'28297D722E75736563617074696F6E'';',
'blog_install.i(215) := ''7326266B28293B696628722E616E696D747970653D3D3D22736C69646522262621722E72616E646F6D7374617274297B762E63757272656E74696E6465783D313B762E63757272656E74736C6964653D327D732E73686F7728293B6F2E657128762E63757272656E74696E646578292E73'
||'686F7728293B722E6175746F6D6174'';',
'blog_install.i(216) := ''6963262628762E696E74657276616C3D736574496E74657276616C2866756E6374696F6E28297B4F28672E6677642C2131297D2C722E616E696D737065656429297D2C623D66756E6374696F6E28297B6D2E77696474683D692E6F75746572576964746828293B6D2E726174696F3D6D2E'
||'77696474682F722E77696474682C6D'';',
'blog_install.i(217) := ''2E6865696768743D722E6865696768742A6D2E726174696F3B696628722E616E696D747970653D3D3D226661646522297B6F2E637373287B6865696768743A722E6865696768742C77696474683A2231303025227D293B6F2E6368696C6472656E2822696D6722292E637373287B686569'
||'6768743A722E6865696768742C7769'';',
'blog_install.i(218) := ''6474683A2231303025227D293B732E637373287B6865696768743A722E6865696768742C77696474683A2231303025227D293B692E637373287B6865696768743A722E6865696768742C226D61782D7769647468223A722E77696474682C706F736974696F6E3A2272656C617469766522'
||'7D293B6966286D2E77696474683C72'';',
'blog_install.i(219) := ''2E7769647468297B6F2E637373287B6865696768743A6D2E6865696768747D293B6F2E6368696C6472656E2822696D6722292E637373287B6865696768743A6D2E6865696768747D293B732E637373287B6865696768743A6D2E6865696768747D293B692E637373287B6865696768743A'
||'6D2E6865696768747D297D65287769'';',
'blog_install.i(220) := ''6E646F77292E726573697A652866756E6374696F6E28297B6D2E77696474683D692E6F75746572576964746828293B6D2E726174696F3D6D2E77696474682F722E77696474682C6D2E6865696768743D722E6865696768742A6D2E726174696F3B6F2E637373287B6865696768743A6D2E'
||'6865696768747D293B6F2E6368696C'';',
'blog_install.i(221) := ''6472656E2822696D6722292E637373287B6865696768743A6D2E6865696768747D293B732E637373287B6865696768743A6D2E6865696768747D293B692E637373287B6865696768743A6D2E6865696768747D297D297D696628722E616E696D747970653D3D3D22736C69646522297B6F'
||'2E637373287B6865696768743A722E'';',
'blog_install.i(222) := ''6865696768742C77696474683A722E77696474687D293B6F2E6368696C6472656E2822696D6722292E637373287B6865696768743A722E6865696768742C77696474683A722E77696474687D293B732E637373287B6865696768743A722E6865696768742C77696474683A722E77696474'
||'682A722E736C696465636F756E747D'';',
'blog_install.i(223) := ''293B692E637373287B6865696768743A722E6865696768742C226D61782D7769647468223A722E77696474682C706F736974696F6E3A2272656C6174697665227D293B6966286D2E77696474683C722E7769647468297B6F2E637373287B6865696768743A6D2E6865696768747D293B6F'
||'2E6368696C6472656E2822696D6722'';',
'blog_install.i(224) := ''292E637373287B6865696768743A6D2E6865696768747D293B732E637373287B6865696768743A6D2E6865696768747D293B692E637373287B6865696768743A6D2E6865696768747D297D652877696E646F77292E726573697A652866756E6374696F6E28297B6D2E77696474683D692E'
||'6F75746572576964746828292C6D2E'';',
'blog_install.i(225) := ''726174696F3D6D2E77696474682F722E77696474682C6D2E6865696768743D722E6865696768742A6D2E726174696F3B6F2E637373287B6865696768743A6D2E6865696768742C77696474683A6D2E77696474687D293B6F2E6368696C6472656E2822696D6722292E637373287B686569'
||'6768743A6D2E6865696768742C7769'';',
'blog_install.i(226) := ''6474683A6D2E77696474687D293B732E637373287B6865696768743A6D2E6865696768742C77696474683A6D2E77696474682A722E736C696465636F756E747D293B692E637373287B6865696768743A6D2E6865696768747D293B682E637373287B6865696768743A6D2E686569676874'
||'2C77696474683A6D2E77696474687D'';',
'blog_install.i(227) := ''293B772866756E6374696F6E28297B4F2821312C762E63757272656E74736C696465297D2C3230302C22736F6D6520756E6971756520737472696E6722297D297D7D2C773D66756E6374696F6E28297B76617220653D7B7D3B72657475726E2066756E6374696F6E28742C6E2C72297B72'
||'7C7C28723D22446F6E27742063616C'';',
'blog_install.i(228) := ''6C207468697320747769636520776974686F7574206120756E69717565496422293B655B725D2626636C65617254696D656F757428655B725D293B655B725D3D73657454696D656F757428742C6E297D7D28292C453D66756E6374696F6E28297B6F2E637373287B6865696768743A722E'
||'6865696768742C77696474683A722E'';',
'blog_install.i(229) := ''77696474687D293B732E637373287B6865696768743A722E6865696768742C77696474683A722E77696474687D293B692E637373287B6865696768743A722E6865696768742C77696474683A722E77696474682C706F736974696F6E3A2272656C6174697665227D297D2C533D66756E63'
||'74696F6E28297B703D6F2E65712830'';',
'blog_install.i(230) := ''292E636C6F6E6528293B643D6F2E657128762E736C696465636F756E742D31292E636C6F6E6528293B702E61747472287B22646174612D636C6F6E65223A226C617374222C22646174612D736C696465223A307D292E617070656E64546F2873292E73686F7728293B642E61747472287B'
||'22646174612D636C6F6E65223A2266'';',
'blog_install.i(231) := ''69727374222C22646174612D736C696465223A307D292E70726570656E64546F2873292E73686F7728293B6F3D732E6368696C6472656E28226C6922293B762E736C696465636F756E743D6F2E6C656E6774683B683D6528273C64697620636C6173733D22626A71732D77726170706572'
||'223E3C2F6469763E27293B69662872'';',
'blog_install.i(232) := ''2E726573706F6E7369766526266D2E77696474683C722E7769647468297B682E637373287B77696474683A6D2E77696474682C6865696768743A6D2E6865696768742C6F766572666C6F773A2268696464656E222C706F736974696F6E3A2272656C6174697665227D293B732E63737328'
||'7B77696474683A6D2E77696474682A'';',
'blog_install.i(233) := ''28762E736C696465636F756E742B32292C6C6566743A2D6D2E77696474682A762E63757272656E74736C6964657D297D656C73657B682E637373287B77696474683A722E77696474682C6865696768743A722E6865696768742C6F766572666C6F773A2268696464656E222C706F736974'
||'696F6E3A2272656C6174697665227D'';',
'blog_install.i(234) := ''293B732E637373287B77696474683A722E77696474682A28762E736C696465636F756E742B32292C6C6566743A2D722E77696474682A762E63757272656E74736C6964657D297D6F2E637373287B22666C6F6174223A226C656674222C706F736974696F6E3A2272656C6174697665222C'
||'646973706C61793A226C6973742D69'';',
'blog_install.i(235) := ''74656D227D293B682E70726570656E64546F2869293B732E617070656E64546F2868297D2C783D66756E6374696F6E28297B753D6528'))
);
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'273C756C20636C6173733D22626A71732D636F6E74726F6C73223E3C2F756C3E27293B613D6528273C6C6920636C6173733D22626A71732D6E657874223E3C6120687265663D22232220'';',
'blog_install.i(236) := ''646174612D646972656374696F6E3D22272B672E6677642B27223E272B722E6E657874746578742B223C2F613E3C2F6C693E22293B663D6528273C6C6920636C6173733D22626A71732D70726576223E3C6120687265663D22232220646174612D646972656374696F6E3D22272B672E70'
||'7265762B27223E272B722E70726576'';',
'blog_install.i(237) := ''746578742B223C2F613E3C2F6C693E22293B752E6F6E2822636C69636B222C2261222C66756E6374696F6E2874297B742E70726576656E7444656661756C7428293B766172206E3D652874686973292E617474722822646174612D646972656374696F6E22293B69662821762E616E696D'
||'6174696E67297B6E3D3D3D672E6677'';',
'blog_install.i(238) := ''6426264F28672E6677642C2131293B6E3D3D3D672E7072657626264F28672E707265762C2131297D7D293B662E617070656E64546F2875293B612E617070656E64546F2875293B752E617070656E64546F2869293B696628722E63656E746572636F6E74726F6C73297B752E616464436C'
||'6173732822762D63656E7465726564'';',
'blog_install.i(239) := ''22293B76617220743D28692E68656967687428292D612E6368696C6472656E28226122292E6F757465724865696768742829292F322C6E3D742F722E6865696768742A3130302C733D6E2B2225223B612E66696E6428226122292E6373732822746F70222C73293B662E66696E64282261'
||'22292E6373732822746F70222C7329'';',
'blog_install.i(240) := ''7D7D2C543D66756E6374696F6E28297B6C3D6528273C6F6C20636C6173733D22626A71732D6D61726B657273223E3C2F6F6C3E27293B652E65616368286F2C66756E6374696F6E28742C6E297B76617220693D742B312C733D742B313B722E616E696D747970653D3D3D22736C69646522'
||'262628733D742B32293B766172206F'';',
'blog_install.i(241) := ''3D6528273C6C693E3C6120687265663D2223223E272B692B223C2F613E3C2F6C693E22293B693D3D3D762E63757272656E74736C69646526266F2E616464436C61737328226163746976652D6D61726B657222293B6F2E6F6E2822636C69636B222C2261222C66756E6374696F6E286529'
||'7B652E70726576656E744465666175'';',
'blog_install.i(242) := ''6C7428293B21762E616E696D6174696E672626762E63757272656E74736C696465213D3D7326264F2821312C73297D293B6F2E617070656E64546F286C297D293B6C2E617070656E64546F2869293B633D6C2E66696E6428226C6922293B696628722E63656E7465726D61726B65727329'
||'7B6C2E616464436C6173732822682D'';',
'blog_install.i(243) := ''63656E746572656422293B76617220743D28722E77696474682D6C2E77696474682829292F323B6C2E63737328226C656674222C74297D7D2C4E3D66756E6374696F6E28297B6528646F63756D656E74292E6B657975702866756E6374696F6E2865297B69662821762E70617573656429'
||'7B636C656172496E74657276616C28'';',
'blog_install.i(244) := ''762E696E74657276616C293B762E7061757365643D21307D69662821762E616E696D6174696E6729696628652E6B6579436F64653D3D3D3339297B652E70726576656E7444656661756C7428293B4F28672E6677642C2131297D656C736520696628652E6B6579436F64653D3D3D333729'
||'7B652E70726576656E744465666175'';',
'blog_install.i(245) := ''6C7428293B4F28672E707265762C2131297D696628762E7061757365642626722E6175746F6D61746963297B762E696E74657276616C3D736574496E74657276616C2866756E6374696F6E28297B4F28672E667764297D2C722E616E696D7370656564293B762E7061757365643D21317D'
||'7D297D2C433D66756E6374696F6E28'';',
'blog_install.i(246) := ''297B692E686F7665722866756E6374696F6E28297B69662821762E706175736564297B636C656172496E74657276616C28762E696E74657276616C293B762E7061757365643D21307D7D2C66756E6374696F6E28297B696628762E706175736564297B762E696E74657276616C3D736574'
||'496E74657276616C2866756E637469'';',
'blog_install.i(247) := ''6F6E28297B4F28672E6677642C2131297D2C722E616E696D7370656564293B762E7061757365643D21317D7D297D2C6B3D66756E6374696F6E28297B652E65616368286F2C66756E6374696F6E28742C6E297B76617220723D65286E292E6368696C6472656E2822696D673A6669727374'
||'2D6368696C6422292E617474722822'';',
'blog_install.i(248) := ''7469746C6522293B727C7C28723D65286E292E6368696C6472656E28226122292E66696E642822696D673A66697273742D6368696C6422292E6174747228227469746C652229293B69662872297B723D6528273C7020636C6173733D22626A71732D63617074696F6E223E272B722B223C'
||'2F703E22293B722E617070656E6454'';',
'blog_install.i(249) := ''6F2865286E29297D7D297D2C4C3D66756E6374696F6E28297B76617220653D4D6174682E666C6F6F72284D6174682E72616E646F6D28292A762E736C696465636F756E74292B313B762E63757272656E74736C6964653D653B762E63757272656E74696E6465783D652D317D2C413D6675'
||'6E6374696F6E2865297B696628653D'';',
'blog_install.i(250) := ''3D3D672E667764296966286F2E657128762E63757272656E74696E646578292E6E65787428292E6C656E677468297B762E6E657874696E6465783D762E63757272656E74696E6465782B313B762E6E657874736C6964653D762E63757272656E74736C6964652B317D656C73657B762E6E'
||'657874696E6465783D303B762E6E65'';',
'blog_install.i(251) := ''7874736C6964653D317D656C7365206966286F2E657128762E63757272656E74696E646578292E7072657628292E6C656E677468297B762E6E657874696E6465783D762E63757272656E74696E6465782D313B762E6E657874736C6964653D762E63757272656E74736C6964652D317D65'
||'6C73657B762E6E657874696E646578'';',
'blog_install.i(252) := ''3D762E736C696465636F756E742D313B762E6E657874736C6964653D762E736C696465636F756E747D7D2C4F3D66756E6374696F6E28652C74297B69662821762E616E696D6174696E67297B762E616E696D6174696E673D21303B69662874297B762E6E657874736C6964653D743B762E'
||'6E657874696E6465783D742D317D65'';',
'blog_install.i(253) := ''6C736520412865293B696628722E616E696D747970653D3D3D226661646522297B696628722E73686F776D61726B657273297B632E72656D6F7665436C61737328226163746976652D6D61726B657222293B632E657128762E6E657874696E646578292E616464436C6173732822616374'
||'6976652D6D61726B657222297D6F2E'';',
'blog_install.i(254) := ''657128762E63757272656E74696E646578292E666164654F757428722E616E696D6475726174696F6E293B6F2E657128762E6E657874696E646578292E66616465496E28722E616E696D6475726174696F6E2C66756E6374696F6E28297B762E616E696D6174696E673D21313B762E6375'
||'7272656E74736C6964653D762E6E65'';',
'blog_install.i(255) := ''7874736C6964653B762E63757272656E74696E6465783D762E6E657874696E6465787D297D696628722E616E696D747970653D3D3D22736C69646522297B696628722E73686F776D61726B657273297B766172206E3D762E6E657874696E6465782D313B6E3D3D3D762E736C696465636F'
||'756E742D323F6E3D303A6E3D3D3D2D'';',
'blog_install.i(256) := ''312626286E3D762E736C696465636F756E742D33293B632E72656D6F7665436C61737328226163746976652D6D61726B657222293B632E6571286E292E616464436C61737328226163746976652D6D61726B657222297D722E726573706F6E7369766526266D2E77696474683C722E7769'
||'6474683F762E736C69646577696474'';',
'blog_install.i(257) := ''683D6D2E77696474683A762E736C69646577696474683D722E77696474683B732E616E696D617465287B6C6566743A2D762E6E657874696E6465782A762E736C69646577696474687D2C722E616E696D6475726174696F6E2C66756E6374696F6E28297B762E63757272656E74736C6964'
||'653D762E6E657874736C6964653B76'';',
'blog_install.i(258) := ''2E63757272656E74696E6465783D762E6E657874696E6465783B6966286F2E657128762E63757272656E74696E646578292E617474722822646174612D636C6F6E6522293D3D3D226C61737422297B732E637373287B6C6566743A2D762E736C69646577696474687D293B762E63757272'
||'656E74736C6964653D323B762E6375'';',
'blog_install.i(259) := ''7272656E74696E6465783D317D656C7365206966286F2E657128762E63757272656E74696E646578292E617474722822646174612D636C6F6E6522293D3D3D22666972737422297B732E637373287B6C6566743A2D762E736C69646577696474682A28762E736C696465636F756E742D32'
||'297D293B762E63757272656E74736C'';',
'blog_install.i(260) := ''6964653D762E736C696465636F756E742D313B762E63757272656E74696E6465783D762E736C696465636F756E742D327D762E616E696D6174696E673D21317D297D7D7D3B7928297D7D29286A5175657279293B0D0A2F2A0D0A202A2044425357482053696D706C652053746172205261'
||'74696E672076312E300D0A202A2054'';',
'blog_install.i(261) := ''686973204A617661536372697074206973206261736564206F6E207468650D0A202A204D617474204F274E65696C6C207C206A53696D706C652D537461722D526174696E670D0A202A2068747470733A2F2F6769746875622E636F6D2F4D6174744F4E65696C6C554B2F6A53696D706C65'
||'2D537461722D526174696E670D0A20'';',
'blog_install.i(262) := ''2A2F0D0A2866756E6374696F6E2861297B612E666E2E73746172526174696E673D66756E6374696F6E2867297B72657475726E20746869732E656163682866756E6374696F6E28297B76617220633D612874686973292C623D632E6368696C6472656E2822756C22292C663D632E636869'
||'6C6472656E282264697622292C643D'';',
'blog_install.i(263) := ''622E6368696C6472656E28292C653D303B662E6469616C6F67287B6D6F64616C3A21302C6175746F4F70656E3A21312C627574746F6E733A7B4F4B3A66756E6374696F6E28297B612874686973292E6469616C6F672822636C6F736522297D7D7D293B642E6F6E287B636C69636B3A6675'
||'6E6374696F6E28297B653D61287468'';',
'blog_install.i(264) := ''6973292E696E64657828292B313B642E72656D6F7665436C6173732822656E61626C65642061637469766520686F76657222293B6128226C693A6C7428222B652B2229222C62292E616464436C617373282261637469766522293B6128226C6162656C5B666F723D222B632E6174747228'
||'22696422292B225D22292E72656D6F'';',
'blog_install.i(265) := ''766528293B642E6F666628293B622E6F666628293B617065782E7365727665722E70726F636573732822524154455F41525449434C45222C7B7830313A657D2C7B737563636573733A66756E6374696F6E28297B662E6469616C6F6728226F70656E22297D7D297D2C6D6F757365656E74'
||'65723A66756E6374696F6E28297B61'';',
'blog_install.i(266) := ''28226C693A6C7428222B2028612874686973292E696E64657828292B31292B2229222C62292E616464436C6173732822686F76657222292E72656D6F7665436C617373282261637469766522293B6128226C693A677428222B612874686973292E696E64657828292B2229222C62292E72'
||'656D6F7665436C6173732822686F76'';',
'blog_install.i(267) := ''65722061637469766522297D2C6D6F7573656C656176653A66756E6374696F6E28297B612874686973292E706172656E7428292E6368696C6472656E28226C693A677428222B612874686973292E696E64657828292B222922292E72656D6F7665436C6173732822686F76657222297D7D'
||'293B622E6F6E287B6D6F7573656C65'';',
'blog_install.i(268) := ''6176653A66756E6374696F6E28297B642E72656D6F7665436C6173732822686F76657222293B6128226C693A6C7428222B632E64617461282276616C22292B2229222C62292E616464436C617373282261637469766522297D7D297D297D7D2928617065782E6A5175657279293B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''lib.js'',''text/javascript'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''4749463839611F001F00F50000FFFFFF9A9A9A262626E4E4E4BCBCBCCCCCCCAAAAAAB0B0B0A2A2A2E8E8E8D4D4D4F6F6F6A8A8A8A0A0A0AEAEAED2D2D2DCDCDCD8D8D8B8B8B8707070C6C6C6686868464646484848323232F8F8F8FAFAFA505050363636C4C4C4565656929292E6E6E60000'
||'0000000000000000000000000000'';',
'blog_install.i(2) := ''000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021FF0B4E45545343415045322E30030100000021F904040A00FF002C000000001F001F0000'
||'06FF408070484C3C080E0480B399'';',
'blog_install.i(3) := ''040AC4A874089104AE578060BBAD1C3253E980802D6BB9DC09253C8C18CA6634FA6260031AF0B89C8B09471A007958677B02771151036F0181580705030B00091D1F1E688D0603446483010C0A611A08168665045479009B766B79104256650C207643200C70129379A1B6430A79467007BF'
||'510770477050C64305704870ACCD'';',
'blog_install.i(4) := ''AB70497092D4000B704ADACD08D8DFDC65080ED2DF03D69D58CCD4CFA70FC4DFC8650F09BDD4C1700900B258B48CE1D2250482AA696136BD1AC28ED1275F5314E46A7405D5104559CA3C8AB46D40817A1903688AF287A22A41591A209A8207A5493880D8B87189D2C04A366304BDAC88D04E'
||'150F382F25C0FA660489127304EE'';',
'blog_install.i(5) := ''D909020021F904050A0020002C100000000F000F0000054E20E2104F029C681AACAB04A52ACB12030CC8B211C1B8DCF0BD150063402D0685830C20105C28360523C06C0A26195BCD6A3DD800140B5750F902106341E1ABF18CA9DFCF7862EE8C37E6C49813020021F904050A0021002C1600'
||'05000900150000065AC09030D488'';',
'blog_install.i(6) := ''0C87818061704C260980A8D309018018D38024AAC80612D143F6112D64A18041D6115D6411D1B83C9A10D8ED9C68E76EDF443F7C0213001A1E8101000881020514168115518B07437C1319477617144742180671410021F904050A0021002C100010000F000F00000657408070285C048E47'
||'049138401E1DCB61C11920448507'';',
'blog_install.i(7) := ''EAE3AAA006125110832A8952005E085183B008D0482B20D1F97804F8F7D13010E6FF78000D1143807F184B86781706898613678E79150719571C1B1301055743410021F904050A0020002C050016001500090000054D60200214609E283000620B0816A2A5A7C204EC28EC82F77509C06250'
||'38B470389E72973BBA304B65D319'';',
'blog_install.i(8) := ''68182E51265564889026D9698BB032650E95A55802A1990A81C986034038088F202A040021F904050A0020002C000010000F000F0000055020278C63029CE8B9916397A6132B7C2F1AC89E5603852C203B404566A1EC0E3EC0A0968991000186A246B98CA081ECA13058A00C186C769C7D35'
||'C8E857C4801ED7068476200891A4'';',
'blog_install.i(9) := ''8380C483E04084000021F904050A0021002C000005000900150000065A4080D08009198F948B40700C6526CBE5F1108D0A2B55818552C80A108040D6A30140AB1FE126DB1172B209A17C2E4404EEF785D081BF0F84047D0105420F8207420982010A4212820C2000108B7281784D0306774D'
||'46110D4D410021F904050A002100'';',
'blog_install.i(10) := ''2C000000000F000F00000656408070482C04261B0E719839540450E812409944AF4BC3E58A2562B85D40A401004785034320508E7A3E9D8490B05E972D080D1152AF53A7127D010C20530982010A53000F82078B00747D05900E82039008820B9041003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''loading.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000001244944415438CB9D93BB6A845010867D8A7DA510429E205D20551E214DD2B8E2A5F0526485BC416A1B8B6D045FC15624011115A36021F2C799EC1165D78DBB033F1E86F9FE3997510220ADD066D0'
||'E3A0D7A7877B90684DB9B1C8719C'';',
'blog_install.i(2) := ''DD20D8B60DCBB258A669C2755DF8BE8F300C19FCF9BC61091301238A229C8B291C3AB7F878B9E31C77BE149E19D096AF85F90874D66BE02008C097B8644045DF5FEFAC139DE1791E7D3612DDF434FABE47D775A3C1DE7F6309B82C4BAE3B70D2CC80C0BAAED1340DC47B13BCB39E799DE739'
||'8AA2E03A5996FF0CC42BB46D8BAA'';',
'blog_install.i(3) := ''AA90A6299224190D84B22CE3EED480EA896383737310C7F151EE00430CE06C120DC38090085555A1280AB6DB2D6F5B743E32984AD7F511FEEF3F3999D4346D15BC68B0165E34B844BFE5251B1B99F6A7E20000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''nav_feedback.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000000F34944415438CBA5934D0B01511486CF4FF36B2CAC2C2D6767250B5958D8504A563E56362349D22C94523444F958889458905EF765A666E15CCAD4D39939E7DCB7E6694600C83F48C18354C6E837'
||'A740770978DB37BC678F33EEA801'';',
'blog_install.i(2) := ''F9C1DD1DAE1FD02ECEB8A30664BB17DCCD791BDC5103D2ED032E3758E18E1AE03436385E61853B9A1B49D516D89D61853B9A1B4996274E75B8C7EA848F70966B2F553792288E083AB333E647F3BE751F7C0EC9B47CAB1B89173C31075951EA6DC16A88FDEAE61510C131B8ACBFBA51BF30E3'
||'C6FDE686FED480C08D1BF5413FF4'';',
'blog_install.i(3) := ''445F414FD480D04D08BD443D053D7B80E627DA977F7FE72777163819DF7E802F0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''nav_forum.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396118001800E66C00003C74F3F3EFF1F1ECF6F6F3F8F8F6FAFAF9F0F0EBEBEBE5F0F0EAFEFEFEFCFCFCE0DED4D6D0C5FFFFFFF6F6F2F5F5F1F1F1EDF4F4F0F2F2EDF3F3EE000000245683164D7E2E2E2D7492A5E8E5DF888885557DA2EEEDE7F2F2EEF6F6F4FDFDFCF4F4EF6B6B'
||'691E1E1EEFEEE8D5DFE84D4D4BFA'';',
'blog_install.i(2) := ''FAFAA3AEB4E5E2DBB1B7B6E9E6E0698BA2E5E5E1E8E5DEBFC7CAE7E4DDEBE8E14A7193E6E3DCD5D5D0F3F1EEC4C4C0EEEDE6E4E4DFECEBE68A8A88E0DDD4E6E3DD5C5C5BF1F0EABFCEDC989896EBE8E262849E486E90989895F5F5F2E2DFD6DBD7CDEBEAE3F5F4F2EDECE5FBFBFAE4E2D967'
||'89A1ECEBE4A9A9A66A6A68ECEBE5'';',
'blog_install.i(3) := ''BFCEDBF0EFE9D5D5D163859EEAE7E0EAE8E15B5B599898940F0F0FEDEAE67796A7B6BDBDF0EEEA7B7B791F1F1ED4D4CFF1F0EBF6F4F2F8F8F73D3D3CE4E2DAFEFEFDA6A6A3E4E4E0C7C7C4C0CFDDD5D5D2FFFFFF000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000000000'';',
'blog_install.i(4) := ''0000000000000000000000000021F9040100006C002C00000000180018000007FF806C8283848586851815008B8C8D8E00165483181B6A0D9798999A0D241B1882153E09A3A4A5A6A366511582001F1F0AB0B1B2B30A4A6200AC2605BBBCBDBEBB485DB86C006304C7C8C9CAC7345AC3001E'
||'1E03D3D4D5D6036140CFD30EDD0E'';',
'blog_install.i(5) := ''394EDEE2DE3D30CF0E440FEA0F5E14593C69EBF25255CFEA11F8F82C3F25145F216BF24518A1E219BE000813224433840C850B093964301841A1C52921445088389115081013428A9CA1E1C2432C3744DA68F12CA4849712CE9814A1010C4C98495E3CEBD001824F08579ED4F849D427941D'
||'CF5E0A58CAB4A953014D643C5B6A'';',
'blog_install.i(6) := ''A0AAD5AB580D1C41F1CC0082AF60C38AFD6A65C9331C07D2AA5DCB366D191DC32B2CB828B2A0AEDDBB781718E162415090182718081E4CB830831442980CDAA2E891E34516561C9A4C595020003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''next.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000003F0000002008040000000FD6681A00000009767041670000003F0000002000757A2CD30000010B4944415448C7EDD73D4EC33014C0F1DCA9A77807C80172802C8C3E40D899A31EE01DA02312EC354C2C19187B004FB0FC19FA1AEC141AA958'
||'5802FB0D519417FFE2CFC8CDA6D9'';',
'blog_install.i(2) := ''34142B4571288A57BEF295AF7C54046198EF1C325F4FE18001412D4711EED0284310FCF5FCE7CB31AF163B20D0214CC081968E806764E406E1969191C3B57C87D011CEF8B478EB0797B45457DBBDCA3B1461BBC2C31661983333F2D05B3531EF2C769619927ECACA4F56F1257EFA629265E2'
||'B101B8D4F93D2D934DBCECFC7100'';',
'blog_install.i(3) := ''DA6F79B5A5A7C9E867E44F9DBB5C786ACFFAE8337D7E1EDB4A96DB8E1012D24713F0C7FCFFDDF3DF79E279117B5E7F8B7FE381C745DCF352FFF795FF437CE12366D903F6076EB333917C2912EE0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''nextlabel.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000000F0000000F080400000091DF5DC100000009767041670000000F0000000F00631C1313000001054944415418D34DD13F4B5B711406E0F309BB583A084E42C10C821D3450FA412453C8DAE2E09F4B7408924E3A2871B0B43A44E4DE9834F746'
||'4388B83C1DEE4F2BCFF49E339DF7'';',
'blog_install.i(2) := ''84A80DF5ED69D9D337F43A0D2196BA8E5C29BC285C39D2B594D68F3ACE3C5B989B995B7876A6634184F8E1C25CA5D2542573E7BA44FC71A2522A6DDBB1AD4C2AC76E44E6DAD4D4D4936F9AB6529AFA25136DB9BFC993AFB63452BAD711BB26EF3CFA62C3BA8989072DD1766FFCA66153C3CC'
||'D8D89D8EC80C3C249FACF96C96D2'';',
'blog_install.i(3) := ''40267E3B343232F2C18A55554A23076E84F8EEA742A1F451A9484EEBBBEBD67A72B9529EF4FEB75677BEEFD2506EE8D2FEFBCE6BB7326DBBDA32B76F1FFB07F5717A7F8DC40DD60000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''next.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000001200000012080300000061107E65000000AE504C5445FF00008686868E8E8E9191919393939898989A9A9A9B9B9BA5A5A5ABABABB0B0B0B3B3B3B4B4B4B8B8B8BCBCBCBDBDBDBFBFBFC0C0C0C1C1C1C2C2C2C3C3C3C5C5C5C6C6C6C7C7C7CB'
||'CBCBCCCCCCCDCDCDCECECED0D0D0'';',
'blog_install.i(2) := ''D1D1D1D3D3D3D5D5D5D7D7D7D8D8D8D9D9D9DBDBDBDCDCDCDDDDDDDEDEDEE0E0E0E1E1E1E2E2E2E5E5E5E6E6E6E7E7E7E9E9E9EAEAEAECECECEDEDEDEFEFEFF0F0F0F1F1F1F2F2F2F6F6F6F7F7F7FBFBFBFCFCFCFFFFFFA1E214430000000174524E530040E6D86600000001624B47440088'
||'051D48000000097048597300000B'';',
'blog_install.i(3) := ''1300000B1301009A9C180000000774494D4507DD0C01091116B7E482FB000000BB4944415418577590D91282300C45EBBE8BB7B2088A08B853C45DF9FF1F3369758617EFC399E64C266D2AC4BF14599A66978AD87B1294A99F7FC53574A9B61932326A8E99B26100B049A87A6DA401A04839'
||'A4DEAF406A00BE1027B02A9FAE06'';',
'blog_install.i(4) := ''CDBC8B3D29FF5D969780416D4711938A4ACA96118CB0D65D319B31A3D943AE6791DA35268C96E5D08D1EAB5BA7BE648C10923A48C48F41ADAF01E84523CC17EDAE01A4D928B187164D247887DF4F9C43871E24DD95A8A650AAF81E3F83CD1AC0538A67530000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''nextset.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396118001800E66A00003C74F3F3EFF6F6F3F8F8F6FAFAF9EBEBE5F0F0EBF0F0EAFEFEFEF1F1ECFCFCFCE0DED4D6D0C5F6F6F2FFFFFFF5F5F1F4F4F0F1F1EDF3F3EEF2F2ED0F0F0F164D7E2456830000007492A5EEEDE75B5B59F2F2EE557DA26B6B693D3D3CF6F6F4F4F4EFFDFD'
||'FCE8E5DF989895FBFBFAFAFAFA1F'';',
'blog_install.i(2) := ''1F1EBFCEDB5B5B5AF1F0EA7A7A78D5DFE8EBE8E2486E90F0EEEADBD7CDEAE7E062849EA6A6A3ECEBE5E6E3DCE2E2DDB1B7B64D4D4BE5E2DBBFC7CA698BA2E2E2DEE8E5DE63859EEBEAE3E2DFD6B6BDBD969694F1F0EBE0DDD4E4E2D9F3F1EEEBE8E1BFCEDCB5B5B2E5E5E14A71936789A15C'
||'5C5BEEEDE6E4E4E0F0EFE9989896'';',
'blog_install.i(3) := ''E6E3DDE4E2DAF5F5F2F5F4F2C5C5C1C6C6C3ECEBE4A7A7A3FEFEFD4C4C4A7796A7F6F4F2C0CFDDEDECE5A3AEB4EDEAE6E9E6E0A9A9A6EFEEE8E7E4DDEAE8E1B8B8B52E2E2DF8F8F7ECEBE6FFFFFF000000000000000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000000000'';',
'blog_install.i(4) := ''0000000000000000000000000021F9040100006A002C00000000180018000007FF806A8283848586851816008B8C8D8E00153D83181C5D0E9798999A0E2B1C1882164708A3A4A5A6A3592716820021210AB0B1B2B30A245C00AC2504BBBCBDBEBB542EB86A006803C7C8C9CAC74560C3001F'
||'1F02D3D4D5D602422CCFD30DDDDE'';',
'blog_install.i(5) := ''DFDD62DE2946CF0D530FE9EAEA664C1414EA4F30CFE910F6F7561D2617375049F763C23CB317A0608011672E7818E1C4A0C10C22064270E881820A8718213E030142824709553ABC4381E5E3C7263C9E799CC0B2E504191ADE6940D2D20B99671B3644D8C993E78E205A2EF09C11E519CB04'
||'48932A455A23E9151ACF901A984A'';',
'blog_install.i(6) := ''B5AA55033E703C3370A0ABD7AF60BB9621F22C4D81B368D3AA3D2B65C8B00A39297E2C984BB7AEDD052F8054101443C9170680030B1ECCC0468B2583B6287AC47851051D87224B161408003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''prev.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000003F0000002008040000000FD6681A00000009767041670000003F0000002000757A2CD3000001214944415448C7ED97B16E83301086FD4E3CCCEDDEFD00ECDED9D979002F1DDAEC593A79ACC2D8813D5B957E1DB8184A28431C0555F2DD8030'
||'3A7FBEDF3F1618768BCA54C6C09E'';',
'blog_install.i(2) := ''0BD8150F055FF0055FF02B1110CD9A2340BA171A7A20CE4684488B7048F5078490876F0974588401101C4147ACE23D4173A047A853BDD7AA0C7C04E0A87D085E9F75089178D35F9D900342932BFE5FF8066158C14F820744B7EC81E25B3C1EA70B89080EAF0970C6E200707ACDB69EC527EB'
||'593C1621705EC5438BD027BD1E22'';',
'blog_install.i(3) := ''FE35C69E475550FC12D22374B41BB6CBC483D3C9E36A8F356ED376D9F838DBFBE9C58B33FB6DD92E1B3F3A3F2E8E9DAB0E93FDCA997F17FE930F4E8BBC3C0FFFCE0BAFBFF28DAFE7E1BFB9DC64F9DC28F87F8FDFF517B33295F901738F3EC4F83F3A5D0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''prevlabel.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000000F0000000F080400000091DF5DC100000009767041670000000F0000000F00631C1313000001054944415418D34D913D4B03411086F717DA28168295206821681105F18704AB60AB58F87124164162150B8329143545244413E3DDC570446C'
||'1EDFDD1D13797887F9B8B99D9D75'';',
'blog_install.i(2) := ''B8489706A71C4A0DBAFC65839952E592366FFC486DF955A65879CC114DBE2998904B85FCA67205A17CC29D9299B117EC845BFD41E567AE14A646895DC97B19355E70090F7C1ADBEA3DE0CBA247125C853EA3C0A6CAFB2A8E8C9ECE77653E026B6CB0C3D822CF40D754778FA1C8D5BD250D67'
||'BCFAEE847B7DE7C9596795658B06'';',
'blog_install.i(3) := ''CAEBEC272E783732565864C1A2733F39EE981BED2A92B22479EF3ADE3B6EADAEF92369B0F5F9D6E2CECF68E929FA524BFEBF9D473A1AA442594AE8CC5EEC17EE2D7A7F793EF7D20000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''prev.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D494844520000001200000012080300000061107E65000000AE504C5445FF00008686868E8E8E9191919393939898989A9A9A9B9B9BA5A5A5ABABABB0B0B0B3B3B3B4B4B4B8B8B8BCBCBCBDBDBDBFBFBFC0C0C0C1C1C1C2C2C2C3C3C3C5C5C5C6C6C6C7C7C7CB'
||'CBCBCCCCCCCDCDCDCECECED0D0D0'';',
'blog_install.i(2) := ''D1D1D1D3D3D3D5D5D5D7D7D7D8D8D8D9D9D9DBDBDBDCDCDCDDDDDDDEDEDEE0E0E0E1E1E1E2E2E2E5E5E5E6E6E6E7E7E7E9E9E9EAEAEAECECECEDEDEDEFEFEFF0F0F0F1F1F1F2F2F2F6F6F6F7F7F7FBFBFBFCFCFCFFFFFFA1E214430000000174524E530040E6D86600000001624B47440088'
||'051D48000000097048597300000B'';',
'blog_install.i(3) := ''1300000B1301009A9C180000000774494D4507DD0C01091021164216B5000000C04944415418577590D71282400C45636F2806E988881D696283FDFF1F33D91D1C5FBC0F6766CF24996401FEA54AF7FBB4FC11B9B7428AE15C5A1319F4B64D467897860BCCCC5508D864DC72AC5D05DC91F2'
||'C8F875E34A205A004F9A61BF45E3'';',
'blog_install.i(4) := ''4A504701572AAA84687C0675E0050E38F705E5C48848C590E3A4CFCF0523965560E983DE59882583550110E2BC3B7A880D8394434B5488D3CEEC154BA091F0AE74CE78B80E14227563E2A0AED1145D33797795AD4DA58615DEBE86526659FB5D1F78041AC00A544A670000000049454E44AE'
||'426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''prevset.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000009000000090806000000E09106100000005D4944415418D363F8FFFF3F03210C61303080703910CFC460A3293206E27740AC04C47781380D5D910B100B424DD88D646228B2A2BB4818247C068AFFA35BC7003561265401033637A5414D6280'
||'2AEAC0A62814EA26988672544504'';',
'blog_install.i(2) := ''30004032A3F60AA0D0100000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''required.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000007000000640403000000B81C3714000000097048597300000B1300000B1301009A9C180000000774494D4507DE020A0E32394976958800000012504C5445000000000080808080C0C0C0D4D0C8FFFFFF0C0375A40000003A49444154189563'
||'600001551717053C848333906010'';',
'blog_install.i(2) := ''566050601484B2540D9C71E9100112AEA35CEA7371468A00E1480111A1A10A0C4A4A4A0A009A8547EBE8B0F8450000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''resize-e.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396110003000E60000A13737C5C5C5E9B31BCC800DE7C25AD48484D07373DEDEDEE4AFAFC06060E3B843F7ECBCC55252D6D6D6E2B634E4BD66F6F6F6EACB46DAA9A9EEEEEEDDA829F1DC9ADEBABAECCF79AD4646F7E9E9ECBC22EDC230E9C641EBCD99CD6C6CF6E162F4DFDFF4D9'
||'5AF1CE53E7E7E7C75A5AD99D25CF'';',
'blog_install.i(2) := ''7B7BD79292F7EBB5BF4242C24A4ADFAF31E7C472ECC7C7E9C74CEFC529EFD54CFCF8EFE6BD42F2D558CC6666CCCCCCFBF5D8FBF5E6E6BF39E8B025F1DBA2DDAA45F1DC7FBD4A4AD38F22AA3F3FE4BB4AEEC34BE5AD38EDD2ABFFFFFFD88C8CD37C7CF4D640EAC981F1CD2FF2D045F5DE5DE9'
||'B320F9EEEEF2D655EDD05AEEC341'';',
'blog_install.i(3) := ''D18B19E9C76EEDCBCBEFC84FE5B638EDCE49EFBD29EFCE29EAB52BDEB531C96060EBBD44EFB542F2DC57F0CB39F7DE9CE8BABAEBCE87DB9494ECBF48B44C4CD6992BF2DFB0B84444F7D64AFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000'
||'0000000000000000000000000000'';',
'blog_install.i(4) := ''0000000000000000000000000021F9040107006A002C00000000100030000007FF806A82836A10138488880D0D898D138B238D8A8B8C9282230D07079989139A8B9B94A023109B9A9FA2A96AA0A235AE358B354482ACB1AEB11084ADAF0D35B98498BDBC9C88A1AD8B89C6A9358994359AAF'
||'CC88AE91832335019D9287962053'';',
'blog_install.i(5) := ''96880634E0832D343408E46A34060624E4083446465B45892D63065B34261E5BEE0C68144090A19F8179463C306040C2833F120C54A87158800609881155A8A011B189A07346306A4CC15185C741FF4AAA48413245064412FE695C79D144A222E718EC8B48224122031EDA5D3C47A24CA286'
||'0C52143881060D831F89348E2124'';',
'blog_install.i(6) := ''01038044612459006763813A414F227C5D60C54A0575119C38C1410E8C9510218C385C488482C7130E6F957C1181C30110293A6E3C81E1658961252F5E6CA012844B95152BD48880F1E148922489356860C245C88A18825C585972F9856601648450003D48C60CC4A60508E042E106A20A1C'
||'6698D620A04A9507892E4488B001'';',
'blog_install.i(7) := ''0A942C39AAEC4844808A082A32AA70716C2691022A5528B04052A284902889208B21D4C1C7804467240D191408003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''star.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''47494638396164001900F7FF00797C83DFE0E22B313BCFD0D3C9CBCEF1F2F3FAFAFBAAADB2DBDCDE3C5689282E3771757DACB1BB5979B3C4C5C869768E4B61897F838ABAC1CCA2A9B58A8D93EEEFF057647A65697136445D9A9CA2EDEDEE4E6CA36381B9F2F3F3BFC4CC374C7345639CD1D3'
||'D5939CADD5D7D9F5F6F837507F7B'';',
'blog_install.i(2) := ''7F87C7CCD5677FAB9DA5B4A3A6AAE9EAECC6C8CD4C525D3D424C414650636E8462666E5F636B405C92F6F6F7CCCDD0F3F4F5454B55595D66A4ACBA6E7179686D74484E593C414A94A0B391949AB8BABD3A4964556685E5E6E852565FE8E9EA96999E5576B1464C57C0C2C6B2B4B84D65924A'
||'505B6485C2DEDFE15C7DB95D636E'';',
'blog_install.i(3) := ''496BAC73777EF9F9FA525761767A805B6B89E5E5E6A6A8ADE2E3E4F8F8F9727E9331364145546DEBEBEDBABCC0C9CFD8F4F5F6F4F4F48D90966A7C9D363B448A95AA334462393F49B5B7BB536D9D79869C555960818DA4464A526182C05B6E905270A9AEB6C4DBDFE63E434E565C64525E75'
||'5E739BEEF0F2BFC0C3597AB7B7BE'';',
'blog_install.i(4) := ''CBE1E1E329416D4E545E4247523A404B5D7EBC4C5A73E3E4E55B606AB0B2B6525863F9FAFB5372ACF5F6F64B699F868A90555B663338415F80BDE0E3E884878D35394075849D5275B65574AE868E9DBCBEC2B3BAC7A8AAAFEBECF04F525A4A4F58E1E4E94F5A6E7F8B9F353B465677B4595F'
||'6A95979C5F66733F454F30353E65'';',
'blog_install.i(5) := ''87C72C4370FDFDFD373D48474D584F55602E343F5B7CB9333944FCFCFCFDFDFEFBFCFCF7F7F84B515CFEFEFE5C616BE7E8E9979AA0FCFDFD6C87BA93969A424F669092966488CCA8B0BF898F9D9EA0A67078894B5D805872A35E80C1A1A4A85F646E6C7077436096FBFBFB4A66994449534F'
||'6EA86F809E5678B94D56695877B2'';',
'blog_install.i(6) := ''7E8AA25671A34C6FB0D5D9E05473AD506489566A8F5D6A823C5073788090575C67FDFEFE96A2B7BFC6D26782B36E82A730466E4969A52D3D5BDFE3E8597BBC61739365799E6E7B9450607F535963B0B6C04352703F557D47587644597F516793526A93B7B9BDD3D7DE8490A68F95A18E98AA'
||'6484C15072B3587CC0D4D7DC9093'';',
'blog_install.i(7) := ''98383C4793979DCBCDCFFFFFFF21FF0B584D5020446174615'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'84D503C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D224164'';',
'blog_install.i(8) := ''6F626520584D5020436F726520352E302D633036302036312E3133343737372C20323031302F30322F31322D31373A33323A30302020202020202020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264'
||'662D73796E7461782D6E7323223E'';',
'blog_install.i(9) := ''203C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D'
||'6D2F2220786D6C6E733A73745265'';',
'blog_install.i(10) := ''663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F73686F70204353352057696E646F77732220786D704D4D3A496E7374616E636549443'
||'D22786D702E6969643A3244463638'';',
'blog_install.i(11) := ''3138364643464531314532414535454544434432313838353641352220786D704D4D3A446F63756D656E7449443D22786D702E6469643A3244463638313837464346453131453241453545454443443231383835364135223E203C786D704D4D3A4465726976656446726F6D20737452656'
||'63A696E7374616E636549443D2278'';',
'blog_install.i(12) := ''6D702E6969643A3244463638313834464346453131453241453545454443443231383835364135222073745265663A646F63756D656E7449443D22786D702E6469643A3244463638313835464346453131453241453545454443443231383835364135222F3E203C2F7264663A446573637'
||'2697074696F6E3E203C2F7264663A'';',
'blog_install.i(13) := ''5244463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D2272223F3E01FFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0DFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0BFBEBDBCBBBAB9B8B7B6B5B'
||'4B3B2B1B0AFAEADACABAAA9A8A7A6'';',
'blog_install.i(14) := ''A5A4A3A2A1A09F9E9D9C9B9A999897969594939291908F8E8D8C8B8A898887868584838281807F7E7D7C7B7A797877767574737271706F6E6D6C6B6A696867666564636261605F5E5D5C5B5A595857565554535251504F4E4D4C4B4A494847464544434241403F3E3D3C3B3A39383736353'
||'4333231302F2E2D2C2B2A29282726'';',
'blog_install.i(15) := ''2524232221201F1E1D1C1B1A191817161514131211100F0E0D0C0B0A090807060504030201000021F904010000FF002C00000000640019000008FF00FF091C48F09F8D02870A2A5C48B04307030C2316B4612396C48B1833FECB83658446865FB020F8B850829C47245366A465621530950'
||'3A754517700A6401292AC5CB2C993'';',
'blog_install.i(16) := ''E02B022D3E5D1802D380033F2EA41429EA4D883B4F997AF6B4A56319A0176350A91CB4A0C59F4D19B4A67C24098E352139A4DA4C96A7C785052F36F111ABD180A51650A0DCA8B50216C94312CC3598B4640B1E6E3607415479C558292C4E0008A0403763800554F2DEA06324E59C36CD38E'
||'453832D6D4A075290A04985E34722'';',
'blog_install.i(17) := ''8C1510B028544500959140D0F01B93A6069F300C352020900612DE5ADB5AD059264A09013E3418569803668F0832B9EE05A2140F468A4B60384DFFB94803121D40A93EB972C56593BF85B206C83BF0430A955402901492F56F05854F5C908243153F60A2040206D040801298F413C131503'
||'0A28E31A15041051380D0B1890C55'';',
'blog_install.i(18) := ''8CA1C2014E4C41C20972F8E28319D18083C237A6DCE34839D5C0B384150FAC61CF04BE3C325E41C92C40071A2DE892860AC794C20A170328E4C52274B880860B2F10A103305A0C34C8183A10F107170208C0850A367841C132486CE2C72CB5EC00C53686ACD2C22C2D30918A910A28D0C31'
||'736E0218230E95871C7391CF4624A'';',
'blog_install.i(19) := ''138E04A20728934C03C13BD99C71862027005750213F9AF0DA4096B8220013B828348409A9BC80892D0624D3A94FC91880C02202286084A45E40FFF2872AA3180305216CBAC9040FAA2071C30D6828C04A21C908848719E95CF3C41B4D34FB86234F1C7A0433E2805002065DB0509940A8A'
||'80308218B11744097492804CB080B'';',
'blog_install.i(20) := ''70518713177DE18202631025102C08982020218430D2669CBCDEB0CC32747489450503D1420E3D428476CF1BCF06D2CAA1883003020441EC2281A40505E0422A4AFC03463720EFF10F2AC146C0903F17081083470C25E18702905CA150085200624828FBEEAA8ABF2FFC514A241914A0103'
||'56D08010D318E14FA700394C4A108'';',
'blog_install.i(21) := ''321F3CC3C08E0AB180C6271E09D3C7D61F08248302174444000E0248C1EECC38B062C2520B0DB00313AB50E187CEBEFE414A192EF0220643F3ACFF714703813CB1F411886C00423B764C40B54203A4E24A08FFC071CAE4EF08548702C748E4C0962A2CB4081731C87BB21F4818D202AF75B'
||'F40870252081D51080F0C53CEE04D'';',
'blog_install.i(22) := ''3F1D443DFC45B4422A5CDCB25005AD8E215107549092C642199402C04505D4A20A153CF8BACC1F76BFAB0BF3E848E30C28475483481C1B28334310355D740117A9F0A1D0027542CE102A59F8E187030B1DE08A0E12BD82401D4890FE2FF5A4A0430F60269158CCE1016AC047C436B001453'
||'C2D01671001461CC08AFCBC47201D'';',
'blog_install.i(23) := ''88409DC21611030CE0063BB8C214BE108105FC007204F8830CF010912910C00F7F98852AFE50062E00E20F02544015F6C69043800106CA8842B5FF20900E0820630610FC050930728B2E09401300904119EAB40C0D4844164050A10A167103011C4906B7C8400FEA301286C842094878C13'
||'2B8C08546F04300A528C50077A03E'';',
'blog_install.i(24) := ''335EC2023398413BB221083B64E38F253883364427114BF4A05575AA53EB2E128662D0A1115324050028B0033408205844A01F433A9001F440920D14108514DCA080462800073588880D52C08E127CA013C148C1042A318A2084631C30D0874634200A42108108006041463A40014008C00'
||'590088156B4F0850B987213858848'';',
'blog_install.i(25) := ''0522D0833268C2088318481E7670484D00212278F04417BA00831C104C202CD046273060010FA8452215D8011B7431820A144B205AF00201AAB060897D44C40B3B880126BC900CBABC42162300001B8A11914C6C610B7BC85DC62A018375BCB3850EA8811722120007B86F21531881133AF'
||'0BE228C200B114906395620D182A0'';',
'blog_install.i(26) := ''020F9C88CA4517828A0EBCE22253E0E14C77CAD39EFAF4A7FF0808003B'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''star-rating.gif'',''image/gif'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000080000000800806000000C33E61CB0000000774494D4507D80806111F25BC18336100000006624B474400FF00FF00FFA0BDA793000026B14944415478DAED9D779C5C65D9FEBFF773CEF4D992DDEC262164378D40E40D25A16940092891E04B'
||'0705292F3FC5504444782348952A'';',
'blog_install.i(2) := ''BD28080882145FA4DA4200150503A8900091164A482F5BB27DA79EF3FCFED89229E74CD99D49C19CCF673FBB336766F699735DCF7D5FF7F594236C3FFEA30FD97E09B61360FBB19D00DB8FED04D87E6C27C0F6633B01B61FDB09B0FDD84E80CFD87105A80A182B50AD21A4206CC3082004A0'
||'A01B68B7A15BA047437B17ACB902'';',
'blog_install.i(3) := ''ECED04D8C68E5B61AA0D7B0BEC0C4C61D36F1F80E1F5A2BC5E0C9F0F33100020198960C562D8F138563C3EF0513160A9C087021F6AF8C082D72F800FB61360EB027CA286591A66091C84C898D0A85104478D22505747B0BE9E607D3DFE9123F186C3F93F506B123D3D445B5AE86D6A22D2D4'
||'446F7333BD1B36D0BB6103A2F55A'';',
'blog_install.i(4) := ''E0AF022F0AFCF51CF8743B0136F3713B34587022702A22BB84468DA27AA79DA89E3C99AA8913F1844225FFD202247A7AE858F6091D1F7F4CFBC71FD3BB7E3DC07B681E021EFD1EACDE4E80321D37F6E5EEE3044E0266553434A851336650B7FBEE7872F46C29E305887775D2BA64094D8B16'
||'D1BD6A950DBCA8350FC7E0A9FF85'';',
'blog_install.i(5) := ''9EED04284D88AFD6F05DE0FBFE11236AEB67CCA06E8F3D08D6D7E7FC2252AA0B51E007459A9A6879F34D9A172F22D6DEDE0CDC6EDAFC6C2E746C27C0D07A7CBD01E702DF0D8D1953B9E381073272DA344429D786CB10BEA494F80A68DBA675C9BF59FBD2DFE85DBFBE03E4A749DBBEE37BD0'
||'BC9D00051C7780CF82791A2EAC68'';',
'blog_install.i(6) := ''68088E3BF04046ECBCF320523244C00B01BA9417436B4DFBFB1FB0F6E597E85AB5AA47A1AFA9B1B9F978886F2780CB710B1C02FCCC5F5BBBD3C4C30EA37ACA9482402F1670D9CC17A57DE952563E3B9F687BDB52D0679F91E42FDB09900EFC58815BC5E3396EECFEFBB3C3FEFB63783C05E5'
||'7671392165FEB2999FA5F3458464'';',
'blog_install.i(7) := ''92757FFF3BEB5F59889DB47E83659F3717D6FDC713E066F89AC083D53BED543B61CE1CFC2346E405DE09F462012FE48B974A1FE81476C4DADA58F5EC7C3A3FF9A4D5469F3AD762FE7F2401EE014F0F5C2F86F1FD862F7F59C6ECBB6F7A63A490DE2FD9E7A534E2B0DC47D33FFFC1DABFFC59'
||'6B5BDFB03A695F720524FF630870'';',
'blog_install.i(8) := ''13342A78CC3F62C47E938F3A8AF09831AEC00F05F4A1867F29F555D2B99FEE5DBB9615BF7B86787BFB6BC9A4FEC65C58F99927C06DB0B70DF36B77D9A56EC29C39183EDF602B0A05BE10D0A5882F295B2814680D5634CAEA050BE8F870E9064BECC34E4FB0E8334B809BE02B063C3D7A9F7D'
||'C2E366CD2AB8C7179F1A860E74B9'';',
'blog_install.i(9) := ''2F889B585CF7E28BB42C7AA34BB43AEA7F92C9BF7CE608701B7C5DC3430D071DE4AD9F3163104867F0254BEC15037AA122714B86422722B4BCF13AEB5F7A292E22DF3C356E3DF99921C06D70BA18C6DDE367CF56359F9B9AF5CF0B01BE602F40862EFC640B823FE819BCFF1E6B5F78C1D2B6'
||'3EE3D48475DF364F805BE1041179'';',
'blog_install.i(10) := ''78D2E1FF6D544D9AE4087CAEFC2E05F47A2950F90F290A0C5720685D1401003A977DC2EA3FFED112F8FAC971EBA96D9600B7C2410A1634CC3EC45B33756A56C84F05DF09F89CE01700BA142C02A5A4174B17CC0DF757B6BFFB0EEBFEFA625C2B75E829D1E48BDB1C016E837D45787E87993'
||'3ABEAA74F77E8CDE9C04B810A5EA4'';',
'blog_install.i(11) := ''30E12705802D65BC507A88AF4D25C5C63717D3FCDAAB1D0AFB8B27C659B2CD10E076684078A37EFAF4BA319FFF7C16F092A7E6771374C5F470C9604CC165A194E7C2E80298A11DFE6E7EED55DADE7EB35919F61E27F4B276AB27C03DE089097FAD68689839FEB0C33242B964E5ED7C3D5FD'
||'CF4408E14E068161500F4961081B9'';',
'blog_install.i(12) := ''88A1FB35C49A67E7D3BB66F5DFCD9835EB78B0B66A02DCAEB8DE170ACF9B7CCC31987E7F1A246E024FF2E4F87C64C84A294E5F52866E146D5622A43C31F09C1589B0EAB74F93ECEDBDF68468F2E2AD9600B7C31CC3507F9CF0B5AF4970D4285791974BE089388DB46936F646882412F84D9'
||'39A60008F52D965A303E8C5CE141A'';',
'blog_install.i(13) := ''EAB841D2B669ED8D90B02CFC1E93118100CA214CE92248B1290A4064C37AD63E3BDF4673E83762C917B63A02DC0A630C61C9E8BDF71E3972B7DDD24BBB3CB9DE152CE91345CD3D3DC42C6BF0B5A618D48582780D23FB0B480E6D20E5F107E29645534F2F96BD691981CF34A80B851C49908'
||'B08DAE1E4C0C3F6256FB371D1A2A6'';',
'blog_install.i(14) := ''98C79A764A374D5B15017EA6783458577762C3A17350A272F67A7108CD4E514003CD3D3D44931615A34773C0453FE2CDFBEE63C3BF976088A2BE9F04C5823E9CB902E206BEB6A99BB61BBB9DF66D5EBBE15A7AD6AFC76F9AD487428E9FAD8BE8FDA915C2BA05CF126B6D79F8F8A875CA564'
||'3803B611686BC387ECE61F86B6ADD'';',
'blog_install.i(15) := ''7BBDB890C021CF0BD0D2DB4B6F2249B0A69659575E4578F468EC64927FDE762B6BFEF10F9482DA6090A0693ABA81B824092951CF8F2493B4F4F6626BD861DFFD9871EEF751A649CFFAF52CBCFC52A26D6D043D262383C1A1E90074FA731A621B5B59F7DC02AD34071E134DBEBCC509700F7'
||'8928A252376D96597FA197B3B022D'';',
'blog_install.i(16) := ''05183C9955C1C648949E44026F28C441575D435563E3A6EB60DB2CBAFB2E96BFF8170418190810F47AB2602EC4451C6A29D89348D01A89A035341C74307BCC3D7370C22A40E7CA152CBCF46212BDBD84BC1E6A0381824B4067626C7AA6F58DD7E9FE70E93BAD517BFA5C486C5102DCA9B8D'
||'0130C5D377ECE61288F270B48A748'';',
'blog_install.i(17) := ''902F3274C4E374C662183E1FB37E7C35B5FD7303332DD6250FFD8A0F7FFF0C02D4FA0384BDDEAC2F57C8B841B1E9A13B9EA0351A0160D2E147B2EBC9A73AD6A56D1F7DC82B575C8A158B51E5F551EDF7397340E74E0B99CFDBF118EB16CC27118DFCEF7111FBA62D4680FBA026AE64C5A87'
||'DF70D578D9F909DEFF381EF70BE27'';',
'blog_install.i(18) := ''99A43D16431906FB5F7C29A3F7D833671B963EF524EF3EFA30684DB5CF4FA5DF9B13FC422D62379274C4E2B4C7A220C2D4134F66A7A38FCDD9BEA6B716F3AF6BAFC64A26A9F6F9A9F2795D7B7F2E6198E917F42CFB848D8B5EEF109F35FEA876DAB70801EE54EA0A6F287879E3A17310258'
||'EE0E7CAF59261D1F6F6832F4AB1EF'';',
'blog_install.i(19) := ''79E7336EFF030A6AC7B2E79FE3ED7B7E8EB66D2ABC5E6AFCBEBCBD59725C09B78BD21E8DD1198F234A31ED3B67D238FBAB05B56FCDC297597CEBCDD8B64DADDF4FD8EB7155FAB9C461EA39DBB2D9F0FC02AC9EDE4B8F8A26AFDEEC04B813C24AC98ABAE9D36BAA264E4CEFE539EAFDAC14D'
||'1CF869865D11E8B83087B7C672E93'';',
'blog_install.i(20) := ''0E9D53547B56FFFD65DEB8F566743249D8EBA1C6EFCFED3216319804D01A8BD21D4FA04C933DCE3D9FB1077CB1A8F62D5F309F25F7FC1CB4A6361020E4315D8D9F5CE230F5EFEE659FD0F1F65B2DF1DEE484E3FB96B86F3E02FC5C31CF13085E3F6EF66C44A941700B0DF9C2A68199986DD'
||'3D1BF2C7BD7934F61E7638E1B529B'';',
'blog_install.i(21) := ''362C7A837F5E7735562C46C8F4501BF0673990392B0087D768A0B55F901A3E1F7B5D7409F5D3F71A52FB3E7AF271DE7FE80104A13E10C06F1A39AD619D270A68CB62C39F5FC08E44CF3F2292BC65B311E001F0C7947C5A3B6DDAE8C131FE1CE08B4BC8172061DBB425928066A7238F62DA6'
||'9DF1A9628DDF8FE7BBCFAE3CB4874'';',
'blog_install.i(22) := ''7713300CEA02FE4133468A1481B6D6B444A2442D0B4F38CC3E975DC988A99F1B56FBDEFDE57D7CF2CC9308302A18C06718592250179002063C829E659FD0F5EE3BEBC2BDC989B320BA590870B7C1D795321E1B77C8ECBE051C2EF5BDB8F47CFAC1B7B4A6236961A36938F8CBCC38E7DC92C'
||'CD0ECF87419AF5EF223626D1BF119'';',
'blog_install.i(23) := ''8AFA4000A3BF11853A811ACD864884B8A5F18D18C1BE575D47E5F809251800D0BC75FB2DACFCD3F328114605037853CA475D643AB013099AFFF40296651D7F44C47A62B310E05E43E60777D8614EDD9ED3B36BFC3CCE5FEA787C7B32892D3066DFFDD8E7C28BD3EAE8E11E3DEBD6F2CA85F'
||'388346DC09B420247119871156CDD'';',
'blog_install.i(24) := ''077EC2B2098E1AC57ED7DE4070CC0E256B9BB66DDEB8E64AD6BFFA0A8612C6A6EC67A0B3F992230AF43D6A7F7331D1F5EBFEF0DF3DC9C3CB4E805FC028DB90D5A3F6DADB0CD4D765812FAE2920DD9849684DB7D6544D9AC4176FBC05659A94FA88B6B6F2EA8FE6D1B56239A6284607FC984'
||'A650599D48749DB6643244AD2B6A9'';',
'blog_install.i(25) := ''6C1CCF3ED7DE80BFB6B6E46DB39349169E770E1D1F7D487D2040C034B2C02E24056820D6BC818EC58B1222C9B173BA8B5B855C3401EE519C67FAFDB78C3DF0C0F4D9350E659F64E4FBD4DC6B6BE8D436CAE365AF1F5EC4E87DF7A31C47BCAB8B7F5E7C216D4BDFC710A13EE0C7E7B0C45C8'
||'0B8B6698A44B1B4A67A97A9EC73D5'';',
'blog_install.i(26) := ''4FF0545494A55D1BFEF11A8BAFBD122B16634CFFE8A6763187748E54A0FB4216AD2FFF956422F1BDAF75277E5A6602C8E2CAF18D7B56EFBCB363CD9F45800CF053534444430C1B94C19EE75DC08EB30E2ACBC54E4622BC71C525342F5E8412A1DEEFC76FA8344D10B36C9AA2516CAD19397'
||'D06332EBF7A7013A9521F6B5EFC13'';',
'blog_install.i(27) := ''6FDFF813B46511F678A8F17ADD7B7D8EA8904A8EEE0F3FA077E5AA7F1DD693D8B76C04B81F76B00D5933728F3D06C3A25BCFCF07FE40CA8800511BB4C0B433CE62C2E14796E5A2DBC9048BAFFE31EBFEFE124A843ABF8F40FF7072C4B2688EC6D05A33FA802FB1E72597A34C4F59DAB1FCB'
||'74FF1EECF6E07ADA9F47AA84EB1AF'';',
'blog_install.i(28) := ''B346FFC85D0AA6A681F8C6563A97BCAD1589D1B38B182A2E8A00F7199C2886F1E8E899FBA35286611D0990597A895359D8EF0300BD76DFD7DAF9E4539972D2C965B9F8DAB65972F3F5AC5A30BF6F10A9DF966D8DC7D1C0B8430F63DA0F7E5852319AE6033CFC001F3E783F00355E0F15FD2'
||'4731D0328B0F7F711DCA2EDD585A0'';',
'blog_install.i(29) := ''F9C6ECEEF86FCA4400F50B5F75E5B76B77DFD3B1376745800CF0559AD92269EF8B6BE845A3354C38F268763DF3ECF22CDAD39AF7EFBE8B658FFF3AEDE9895F3F91A973CF2ADBFF7CEFCE3B58FED4E3E87EE285FB45AF76C8F9B984DFA6D4A0B32243E7DB6F93E8ECB8677677E28CF2A4004'
||'33E098F6F9C58D1D0E86AF2888307'';',
'blog_install.i(30) := ''400AF832087FF6FB1240777F5C1BFBE5D9ECFEBFE5EB8D1F3FF2104BEFBBBB2FEA7CFB0C269F744AD9A2CEBFAFBF9A35CF2F00A0CEEF2368184EEB45D2F27EAE4A2015FA81D76A20BA720591D5AB3E3AA42B31A5E404B8071A4C5356D4EC3A0D6F75555ACFCF05BE645509E22A1CA16F917'
||'C0F824653FF85994CBFE40A94D75B'';',
'blog_install.i(31) := ''167056FEEE69001A8E38BA3CBA231EE7AD2B2E66C3C297FBC4A7CF8BDF30F2D6FA397BBE6385D047846467075DEFBD8B9934C7CD8A4456979400F71B1C23A29EACDB7B6F9469160C7E7AA520CE66519A90146CA0536B3442CD1E7BB2D7D5D761E69855B3351EC9DE5EDEBCE8025A17BF811'
||'218E5F7F5959FF93C7EED0CBE1369'';',
'blog_install.i(32) := ''32A3819D48D2B1F80D6CE4E843BAE2CF949400BF34D54586D7736DED9ED3F3F6FEAC1E2ED9613FD513506C8A0E83BD07A10B8D0D54EEBC0B7BDF7033DECAAA6D02FC4447078B2F38878EF7DFC3106194CF87A77FB85CE7B07C5D7BBC436AD02ED1A0F3CD4558C9C4455FE94AFEA4B411C0A'
||'31EF285C32757EF32351B48712040'';',
'blog_install.i(33) := ''064904C90EFB698F256B0E8106BA102CAD093736B2D72D77E01F59B755831F6B6EE28DEF9F45CFF24F314518EDF7913977D96DF2A726B7101CB07E3335426A34E859FA01C99EAE070FEE4C9C5652023CE0315EF38FACDDAFA2A131ABE7AB944F518E00F7BD40A50EB7A656060EE4486D589'
||'708090D8151A3D9FBD63B08EE386E'';',
'blog_install.i(34) := ''AB04BF77D54A169F7B1691756BF12861B4CFEBBC3640E7A9ED9D849F4E9F1B98990206D70FAC5A49BCB5E5D5833AE3334B4A80073DAA2DB4C3D8EA407D7D7A0E771073CA017CE7521014E9A3744E9FA745D1A53549046FCD08F6BAF90E2A26EFB45581DFF5D1872C3EF74CE21B5BF129C52'
||'8AF074324AFAFAF0BA8049C7BBBCE'';',
'blog_install.i(35) := ''12901A88356D20BE6EDDC6033BE3B52523C07D50637A546B785C03FE9A11EEA13FCB0B70107D19824F32B442BAA6D8E4246AA05B84386086C24CBFF156AA77DB7DAB00BFFDEDB778EBFCEF92ECEA22A014F53E2F0AF7C11BD7F22FA58F3B89429D61100DBC23351A24DB36125DBD1A5BC54'
||'7CC2A60AE60410478C0CF7865A94F'';',
'blog_install.i(36) := ''C38D8D782B2B0741490BFD8E96B0645BC5927DCEB96A90AC94A0E99BF7144730FC3E76BBE606467E7EE61605BFF5D5852CB9F03CAC6894906150E7F520797607CB67F20C20AC1D41CF7609757F190890E8EC20B67A154A198DFBB745569686005EA6195A2D093736E20987B3437FAAD9939'
||'AD73388911E09C43D7248FA32F2CC'';',
'blog_install.i(37) := ''4AA3478428829826BB5E7239A367CFD922E06F786E3EEFFFF812EC44820A5331D2E371ADE3C915FAB5B3D1A3B5CE5B056C2242BF17D0D34D74D54AB462B72FB5C5FF5D12023C68325329B5B0A2713C6620900E9EABE193ADF8958BE2CFAC284036BDD66912A96DD3DDD54D776F373A9964D'
||'7EB6EA2F1D46F6D56F0573DF00B3E'';',
'blog_install.i(38) := ''F8E179A00C46545731B2A606328774B372BC76347E34EE3381B44E09F52EA55FAA2EB02211A22B5760DBF6CC2F75255F2D09011E36CDAFA2EC05E186460C9F0F1119ECED22A4FD9DCF23500EE00F560FA97E814364D0B12856472776771782266A98F41A7D132BA75C741993CE3D7FB380F'
||'FE96D37F2F1359783D68C10A85202'';',
'blog_install.i(39) := ''22A870055259851A5C16EF6EEC0C667CEDAE15D2AB00EDE82164FED8B128D1952BB1B57CF58B9DB1E74B42805F798D630DF413A186464CAFD7215C671B3CCA71A4308FE8CB480B8355406F0F567B3B3A16CBFA5F3165D0E331416BC69FF93D76BEECAAF2EDFCA8351F5EF12356DC795B9FA'
||'FAFA0C241E98BCF8F515D0DC19063'';',
'blog_install.i(40) := ''B8CFEEFD3A8FD8738F0699A5A29D48105DB50234C7CDEC883F599A08E0358E11F493A1B13B62F87C397BBC380C00653A7D4EE563EA94311110ADB17B7AB03A3B20114FAB2852DF17334D7A0C03B466F2BC4B98F88379E5EDFD375FC7B29F5C0940CD40EF77A9F3C5E345AAAA50C110A410C'
||'5AD97934204EDD2D3D3D47F4605D0'';',
'blog_install.i(41) := ''1701E2C4D6AE416B7DECCC8EF8532521C0A33E73B6D6F673A11DC66278BDD9BD34156457B74F52D2805369B8E9BCDDDB83D5D10EC964FAB98CCF8E7A3C440D031161CAD53730EEB4D3374B0A587DFF3D7CF4A3F3D1B64DB5C0082559193FB5D78B692215554828EC6A07A796826E1A41BB4'
||'482D4CFB0E37162EBD6616B66CFEC'';',
'blog_install.i(42) := ''88BD50220DC0179452AF04EA470D6EFBA2245BB53B193E2A875DBCA994EC7BB78E44B0BA3AD089C420499CCA4901225E0F71C3444C93CFDD7A17A38F3E8ECD796C78F2313EF8DE5C74224185C0C80CAF1F871E2B1E0F12AE44024197E1DD54A0B3A3415AE9A79D23811D8B126F6EC612F58'
||'5991B23AF9584008F789926A825FE'';',
'blog_install.i(43) := ''DA5A3C81607AF81F04595C66FDE42383A063B1BE509F4CA411632061A4924D03319F978461A27C3EFEEB9E0719F9E5D95BC603786101EF7EEB24EC6884B0823A25836D742FF134E2F1A02A2AC1E777CCE36EE3FDA924B03348007D136DEDDE5E12ED6D28F4B4BDDBE2EF942605F869146D2'
||'CF75454E00D5738287F71053C532B'';',
'blog_install.i(44) := ''A8147DA01309ECEE6E477197F9B903CE5ACCEF27691898E130D31EF835D5FB6D5923A8E3D5BFF3CE49C761757512101865649320D3D51BCCF75E1F120A23FD93429DF3BECEF6FDB5733AB001ABAB1BABBB0B856ADCAB64461054FB7D469BE1F3E1AB1E91A5FC5546F8CF3A9741069249EC9'
||'E14E03388E1442A44FAC0570AEFC8'';',
'blog_install.i(45) := ''91ECF6D013544CDB6DABB082BB97BCC53BDF3882444B33FE7E12A81C064F26C0E2F323C110DA345D5FE31409D209D1478244473B7634468F19AB98D59C7FC168C1F5D2FFF98D56416AFC757569422E3347ABCC109F5ADA691BABB70722919CE26E4017A814F0A3FE00B6A1F08FDD91DD1E7'
||'982E0A4AD6B3028F2D152DEF9FAE1'';',
'blog_install.i(46) := ''C456AFC2237D3B661939EA76325D3C005F000906D1038692CE9EF5E3A6FEFB7C024DA2B5156DEBE6BDDB62F5251D0DFC3F9FB15060A6AFAA12C3E3759CE5935D09F413C3B6B1A311742C8A689D460C9527F48B52C402416C258426EDC4B4871FC73776C7AD723838B66615EF1E7F38918F9'
||'6E211186D08660ED5EF14EE1101AF'';',
'blog_install.i(47) := ''1FF1FBFB88902F1D649480C9AE4E6C58B8F7C6D8012525C0635EE397229CA63C26DE8A4A77F1971209446BEC58B43FD4EB0C8197BFF76318C4FC01508AF0B4DD98F6ABC7F0D48E646B3E122DCDBC77C211F42C790B438431021E21A7D8D34EC3BC08787D68BF0F11B509E494EAC0CE10855'
||'64727B69544C3FD7B6D8C7DBBB411'';',
'blog_install.i(48) := ''C0AB7EA894FC4400B3FFD6EB4EE15FA4EF16693A1E1F54F5D9BD5CF2E67E6D1A248321B408D5FBECC7AEBF7C04235CC1B670585D9DBC7FF2B174BEB61003186D28BC0E43BD6E793D75ACDF06F078108F0F6D1ACE9A40F7ED266AC7E37DA940336F465BECC69212E0375EE348513C33089C6'
||'960787D88527D3DDAB6C1B2C04A82'';',
'blog_install.i(49) := ''6DA789BFEC2A401C8DA381739826562884066A0EFE0A53EFBC2FDD5FDF060E3B1AE1C36F9F44DB9F1620FD24F0CB264FBF1012649D1305A689560A06A2826D63C7E3D896D5171534A0F411D35B62BF2F6D0408B283611B6B3215BEB3F22FAC9767460E41C0E325190A2240DD91C730E5C6D'
||'B90322DD35A7FCF4FFB366A987B4E'';',
'blog_install.i(50) := ''79860E12093EF9FE5C9A9F7C0C01EA0D212832B8A8C319F83C24D0EEA960E03509658CD9A7B9677D490900F0B8DFFC40A177C621FFA79B3DE2002E79C59FF6FAB183414460CCC9FFC3A4CBAF81722C0CD19A35375CC5863B6FED5B0F78F6798CFDE165E51944B26D965F7C3EEB7F790F002'
||'30D191C404A8D06CE40EB0CD0FB4E'';',
'blog_install.i(51) := ''DA19238419EF7F778FD6E87F15DABCA2BEF19301E32E34674A81EA3FF3F95CE11FBF1F1D0C019A71E79C47E379E519D4D196C5EACBE6D1F2C803E8FE8A04ADA93DE934C65D7D136218E5193FB8E12A56DF721D5A43AD12AA943B09EC94EAC0EE4F16768E0861A73D2F77EED11AF96EB9087'
||'03C9ADFA41240B9983FD966917BF8'';',
'blog_install.i(52) := ''D7C120F45BCC132FBE9C1DFEDF77CA1492E3ACFCC1D9B4FDE1E9BEB17C2B89006D8689B66D461C7E340DB7DD8D78BC654B39CBAFB8106D6B462861443F096C9D6EE7E64A05B9A240DF7BE5E83D5A23CF948500BFAE60A437613489202A73CA5741F95FB2BDFE6008027EC430D9E9BA9BA83'
||'FE6F8F288B24884E567FE0F5D2FFD'';',
'blog_install.i(53) := ''056C9B11C904DEFED234298A36D3C4B66D2ABE74308DF73E822AD3DE00CDBF7998653F380B3B6951A9845A25E9512015F802A2C08016E8D701B691F0D6EDDAD9B9B12C04E88F02AF09ECE7240055DE3C9FF17CB8027C3E0CAF872977DC4DED57BE5A968B6E75B4F3E9B74EA467D1BF505A5'
||'39D88E349F125442089B0D130B1B5'';',
'blog_install.i(54) := ''2638631FC63FF83846557559DAD3B6E00F7C34F714AC588CB012EA32499015D6B3B5808B505C38AD257A40316D299A004F04D55986963BDD855E6E013848128F8954556386424CBDE701AACA34BB37D9DCC4B2538F27FAC1BB185A53198FE201C7398D16C246D3C4D2E0DFE573343EF2346'
||'6DDA8B2B4AB73E1DF587ACAF1247B'';',
'blog_install.i(55) := ''BAD9D1507864532AC88C02B64BEDBF890C83834173776B89DE5B56023C5E498D9930D609E2CD45809CF5BF8078BD484525E1A953D9ED893F9425E4C657AF62D9C9C7125FF129A6B6A9884731B5CE9A7A36389B59C016C54631480A781B27D0F0E86FF1ECD8508694D4CB3B871D48CFBBEF3'
||'0C6C123C80EF7DAE5F9BE34A03531'';',
'blog_install.i(56) := ''3BE11BB35B47475B590900F074C07C5AE02847A59FC3004A138022182346805254EF7F20537FF120E2295DBD1FFD68299F9E7A3CC90DEBF1D816E17814D5AFFA07966BB98D436811362A832460D48F62DC23BFC5376597928AD10F4F3E96F6BFFD1913616CFF10B25D601AB09D7480AD9FD'
||'CB53556F4AC982111E099A071245A'';',
'blog_install.i(57) := ''9E712340BE0A6050181A065255852883DAC30E67A75B7E5A9232ACF7ADC52CFFD689581DED78AC24A10CF0DD7A7F2A4135B0510C124A5055D5ECF8E013F8F7D86BF8E05B169F9E7D1A2DBF7D12031863A8C10123ED42021CD240B60ED047EC5AA0FB376C023C0E5E4FC0F391886E289C002'
||'E9581C74455568308A3BF790AE3AF'';',
'blog_install.i(58) := ''B86658864CF72B2FB3E2CCFF87EEE9C663270944238315875B25220E041D68419B32888AA08221C6DCFB08C199070ECB805A71D17934FFEA5E44C30E83B93F7D58D72E4007A41143EB151B5AA29367F5EDAF517E02003C1DF49C6DA07F26432440DAFB3C5E54652522C298B96733EE828B8'
||'6D4A68EE7E6B3EA0767423C812711'';',
'blog_install.i(59) := ''27108F16548AA612C0C9D7E810935E2588E961D4EDBF2074E8E1436ADFDA6B2F63ED4F6F06343B28854F9CF27D1F01D2CABEF45C9F9D26C43EEB734DB19F0FA54D4326C0E310F005CD6502A3DDE6061673E10D9F0FE9DF9471DC859730FA5B6714D59EB6271F63CDC517A06D0B5F3C8EAF1'
||'FFCECFF571C0106BE53A752748B42'';',
'blog_install.i(60) := ''9462E4B5B75171FC4945B5AFE9AEDB587DF5C568DD374F209016F6332776380B411702ACF3872213272C2F7EA3E8611100E07721739E68AE2F050194F42DA890701851C2F86B6F62E4315F2FA81D2DF7DFCDBAEBAF42B4C6138FE08BC51D04E8F00820025DD247021BA8BDE8C7549D5ED82'
||'0D2C6C71E62C5F967A1B5A64E84B0'';',
'blog_install.i(61) := ''4AF7FE874500CDF9535B22B70C15C36111E07108FB83E60A819A61A580D40BEF0F20E110CA3098F8D37BA9CE35E3576BD6DF723DCDFDA37ADE482F6622D6D786AC3188A1A780D4EFD483D0A10C6CADA93EEB3C6A2EB834A766E978EE0F2C3FFD9BD896C548353010A47312A08814D01C559'
||'109BB6FA0678B1000E0F741CF5982'';',
'blog_install.i(62) := ''BE73C822D0417CA950081D0860783C4CBEFF112A1C66FE6ACB62ED9517B3F1FF1E46043C3D3D9889F82620216F3BB2AB18F7F18DD4C81611A15D0C2CADA93CF134465E792338542FDDAFBCC4A7271E89958853A384AA81514057355F9C08145BCE98D2D27BCF70F01B36011E07231034FF2'
||'9C28CA2CBC01C175E55F4DBC4E10A'';',
'blog_install.i(63) := ''263FF06B42BBEF9936CEBEEA87E7D231FFF7A035664F379E813505290470F623C471399BEB34B58C350C038FA3226CEC2741E86B4733EA969FA70D2245DE7C8365DF380CABBB870AA1DFF3DF54B6D92E133C8B2803FF35A529F279017B8B1200E00F01CF3EA2F46B02AA6023280F0144402'
||'A2AC1EBC35B5BCBE4871EC7BFD314'';',
'blog_install.i(64) := ''EC488495E79C4ED7C2BF211ACCAE2E949528CA92CE6704659682992418782E86D0AA0C925A13FCE2C18CB9FB615420406CE97B2CFFC6D788373713A26F11A9ED36C9439312F20B36822CCB967DA7B6F42E1A2E76259B01F1C7B071B768995BD05C801CC4C89A2B5059055E2FBED1639870D'
||'7FDACB9FA327A17BF8E681B4F7737'';',
'blog_install.i(65) := ''32B87E3033AF8BEB8214C9630681C38E2792BDD219FA762B691145024D60C6BED45F713DAB4F3F81D89A35F8817AD964E192D2FBC911FEC96305DB70D7CE4D91B34B815BC908F05C25359665BE2DC88E050D063991C0094811A4AA0A4CCFA695C79685D9D589D8B6F3A2D41C3AA09828E0B'
||'413BAD36D679208CD629018189AD5'';',
'blog_install.i(66) := ''1A1F50D70FA72EB6F7E7CEFF2BCDB86FF709EDEDED5B150100165498FB6B9BBF898851CC74B0CC852059D14029241C06C344B485D1DD8DD83685CE4CCA373359C46974505C7BBFD3854B8AD08E22A6C187A60A7B70AFA07CF3FB9C6606B984FF0470E0E4A6C8ABA5C2ACE493E0E687CC8B9'
||'4C8B5854E08C9A7C007F61B7254E6'';',
'blog_install.i(67) := ''4256C997FE3FC575138B424900CE5BD5A4FEEDB80790CE5EF25D10F8392684589A79539A22379612AF921340833C17F22E10D1B30B51DA4E53C5D273727AFAC0C5D8C9DA8C228F1648AD08C84182D47C9FB903BA832D914E02874D1D9D1685E49E1236488EF9933644FE5B72DE827A2B200'
||'0C0F361EA6DCC450AD95186A1039C'';',
'blog_install.i(68) := ''661939AF42768F0259252199FB12B993001722E4EF04DA210AB8AD08DA24FC9CE7FD69808FE3A6B9DFD4355DADA5C6AA4C9BE9C0FC0ADF1443DB0B15D4153A2D3C9F11A35CB7A4292E0AB8BD1F9CB7B42BA4F7BB4701B2A20050CCB4F0666DDB5F98DC1CFBB81C38958D0000CF577AF6C5E'
||'6452504A1B08521F9D2403151A010'';',
'blog_install.i(69) := ''12407144208F06A048E0C90D7E8F05074FD910F967B9302A2B01009E0B995F554A7E27E02D240D6409BE42C4608EF2AD9073B94890ABFCCBA1835C77FF2E6269585CA30F9DBC21FA6239F1293B0100FE14F61E8FE887074950E0B2B1BC51204BE18BE31E05CAE13E459227DC67DEE8520AB'
||'86839EFF891B9CF5F1EF0453879E2'';',
'blog_install.i(70) := ''FAC8E3E5C666B31000E0852AF310B1E52981B02A627308B7509EB951A564A6821412A80C21E7BE3DAD33118672A19CB67B755E0E9E4906DD2DDA3E666253FE1DBEB629020C680243335FA0B6104FA0A08A20572A7025418E7B17B91061F082E551814E77F32A6C83883EC187C86193D6F7B'
||'EBEB930D9AC040078BEC2BB8B897E'';',
'blog_install.i(71) := ''4E84C6A14781A19120BBB78BFB0DAF1D72BE14D9FBC9E8F1A9E5607A99A8019669CB3E74524BECC3CD89C7662700C0B361EABCE27D40098715BA84BC1C24484B092957C3E9CEE743118159613FE50569DBC2C0FCB8699E5A8E3A7FAB24C08063F8B72A739ED6EA6A0566C1AA3EE35633EE6'
||'3F7F949800311DC547FBE68A0F309'';',
'blog_install.i(72) := ''4287FD02E9BB89FA45939A22B794DAE1DBDA093088C1B361F380A0520F010D6EA920737C5E1570D711C7DBD5E17C87D3D4B42E199E9F645C252926FCEBECBD8053CEAFECD59C30AD29F20FA720F1592080DB3DA5B33AE18F8254CF327C5778457F7BC0F2CFB7556CCE5BCFE0745733C929F'
||'69C9C3E7131800B29035D40476BAC'';',
'blog_install.i(73) := ''38DCFB7CB75C755E6F6F3B39B60476CB205B230124CF0F859CBF336CEEB98B52377B843D0B3778F29320DDD39782557FA6E0970229E07667D08466D1BF13FAFCE3DBA36F17007C21E7F596228094E107404682F1F30AF3E43AA5E619503B1C1240EEDDCB014701E85E0216A86F32F6F9B7A'
||'165ADCD4F8E6B89FCBA05AC22C01D'';',
'blog_install.i(74) := ''CA4FD908E0069C1A06E82AE5B353FF96195E42F3FCDE6F8E429F6E8A8C2A9C04E9D5016E468F03117021C3508D200BD6AFB3F5BD9776457FFD4A8CDE0C906C87BF87F2630F870C5224F0AA0812A802C1CFF9BA06F05D15368F6D30D4E95E61ACEB742D87C91E6EB5BDB3DA771F0328E682E'
||'9BE50BFFA134BDF7B7E77F4E98FE3'';',
'blog_install.i(75) := ''C40A00B01012D845806F174A0429B2C7AB2100AF8A04DF9110F5E09917F4CC9CEA9123AA902F19822F6FB8774A0919E5A073AD2F459580FDE8C5DAB4FEEBBF13FAF71776C416B66D0AF585024981200FF535BA18021403E85048301CE2C89E2615DFF17B0F996C30A742C9EE92720B43675'
||'F5FF24EF0CC6DFC885BED6F776BDE'';',
'blog_install.i(76) := ''5A9AB4E6DFD16DFFF9F564B26B9820D99BE13D0511400D135055A2F7E67D3CCDA4F2049F397D2753ED55273223284C18C800D9A64F765AC84506870BA47B615993CDA2F713C9458F46928BDF4CD2394C4086F37828EFFD6C1120F3F17E8651FB55BFECB283218D2391860AC58E21A1C1275'
||'293DAA32517E00271CDC688D62B3B'';',
'blog_install.i(77) := ''35AB5A6C56ADB1AD15F3E3FA83576256EB16047CB31160AB4E0105EA93B4EF31DE24304119E13A45A05AE9508DA870B86F9536DD9A48BB96EE8DB6DDD36C13F9D4B6BA972789E4A9C9ED610AB6AD3A056C752270A8BE8283D957A899E77837D712FC6C132270AB29038B741529E0F75008E'
||'0F67BA8EEDD3651066E5123A80802'';',
'blog_install.i(78) := ''5024F8C5FA39C592A150FB769B318236AB155CC0394AD8E30B2540312428346D6C735670D90783CA087A2909504A326CB38341251D0E2E30B40FB7C7CB30C02F0509C833CCBB4D0F07978A1C94A9C7972202943222B03941DE1A09504CDB0A15765B9200C508C6ADF222FFA71C439DD8FB1'
||'F7F41B61F9FD1E3FF037B931A9E08'';',
'blog_install.i(79) := ''59358F0000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''stop.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''2A7B70616464696E673A303B6D617267696E3A307D626F64797B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A62672D6E6F6973652E706E67222920726570656174207363726F6C6C2063656E74657220746F7020234545453B666F6E742D6661'
||'6D696C793A417269616C2C48656C'';',
'blog_install.i(2) := ''7665746963612C47656E6576612C73616E732D73657269663B666F6E742D73697A653A313270783B6C696E652D6865696768743A313870783B636F6C6F723A233333337D696D677B626F726465723A30206E6F6E657D613A686F7665727B636F6C6F723A233030384542307D627574746F6E'
||'2C617B746578742D6465636F7261'';',
'blog_install.i(3) := ''74696F6E3A6E6F6E653B6F75746C696E653A30206E6F6E657D7072657B77686974652D73706163653A7072652D777261707D74657874617265612C696E7075742C73656C6563747B6D617267696E3A3270787D74657874617265612C696E7075745B747970653D2274657874225D2C696E70'
||'75745B747970653D227061737377'';',
'blog_install.i(4) := ''6F7264225D2C73656C6563747B626F726465723A31707820736F6C696420233939393B70616464696E673A3270783B626F726465722D7261646975733A3370787D696E7075745B747970653D22627574746F6E225D7B70616464696E673A30203130707821696D706F7274616E747D73656C'
||'656374206F7074696F6E7B706164'';',
'blog_install.i(5) := ''64696E673A30203570787D696E7075743A666F6375732C73656C6563743A666F6375732C74657874617265613A666F6375737B626F782D736861646F773A3020302033707820233030354542303B626F726465723A31707820736F6C696420233030354542307D626C6F636B71756F74657B'
||'6261636B67726F756E642D636F6C'';',
'blog_install.i(6) := ''6F723A234641464146413B666F6E742D7374796C653A6974616C69633B70616464696E673A3132707820343070787D236865616465722D636F6E7461696E65727B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A6865616465722D626C75652E70'
||'6E672229207265706561742D7820'';',
'blog_install.i(7) := ''7363726F6C6C2030203020233030354542303B77696474683A313030257D236865616465727B6261636B67726F756E643A696E68657269743B6865696768743A31303070783B706F736974696F6E3A72656C61746976653B6D617267696E3A30206175746F3B77696474683A39363070787D'
||'237469746C657B6D617267696E3A'';',
'blog_install.i(8) := ''323670782030203020313070783B706F736974696F6E3A6162736F6C7574657D237469746C6520683120617B636F6C6F723A234641464146413B666F6E7'))
);
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'42D73697A653A323070783B746578742D736861646F773A3170782032707820233333333B6C65747465722D73706163696E673A2D3170787D237469746C6520707B63'';',
'blog_install.i(9) := ''6F6C6F723A234641464146413B666F6E742D73697A653A313470783B6D617267696E2D746F703A3570783B746578742D736861646F773A3170782032707820233333337D23777261707B77696474683A39363070783B6D617267696E3A30206175746F20313070783B626F726465722D6C65'
||'66743A31707820736F6C69642023'';',
'blog_install.i(10) := ''4343433B626F726465722D72696768743A31707820736F6C696420234343433B626F726465722D626F74746F6D3A31707820736F6C696420234343433B6261636B67726F756E643A234641464146417D2363656E7465727B666C6F61743A6C6566743B77696474683A37303670783B70616'
||'464696E673A313070782032347078'';',
'blog_install.i(11) := ''203230707820313070787D2363656E74657220707B6D617267696E3A35707820307D2363656E746572202E61727469636C657B626F726465723A31707820736F6C696420234343433B77696474683A36393070783B6261636B67726F756E643A234643464346433B626F726465722D72616'
||'46975733A3370783B70616464696E'';',
'blog_install.i(12) := ''673A3870783B6D617267696E2D626F74746F6D3A323570783B626F782D736861646F773A337078203970782031307078202D36707820234242427D2363656E746572202E61727469636C652068337B666F6E742D73697A653A2E39656D3B6D617267696E3A35707820303B70616464696E6'
||'73A307D2363656E746572202E6172'';',
'blog_install.i(13) := ''7469636C652D7469746C657B6D617267696E3A357078203020323570787D2363656E746572202E61727469636C652D7469746C6520683220612C2363656E746572202E61727469636C652D7469746C65206832207370616E7B666F6E742D73697A653A323270783B666F6E742D776569676'
||'8743A3730303B6C65747465722D73'';',
'blog_install.i(14) := ''706163696E673A2D3170787D2363656E746572202E61727469636C652D7469746C652068337B666F6E742D73697A653A2E39656D3B6D617267696E2D746F703A3570783B70616464696E673A307D2363656E746572202E7265706F727473726567696F6E202E726567696F6E626F64792C2'
||'363656E746572202E626F72646572'';',
'blog_install.i(15) := ''6C657373726567696F6E202E726567696F6E626F64797B70616464696E673A3130707820307D2363656E746572202E7265706F727473726567696F6E202E726567696F6E626F64797B626F726465722D746F703A31707820736F6C696420234343437D2363656E746572202E726567696F6'
||'E2068322C2363656E746572202E72'';',
'blog_install.i(16) := ''65706F727473726567696F6E2068322C2363656E746572202E626F726465726C657373726567696F6E2068327B666F6E742D73697A653A323070783B666F6E742D7765696768743A3230303B6C65747465722D73706163696E673A2D3170783B70616464696E673A3130707820302035707'
||'87D2363656E746572202E72656769'';',
'blog_install.i(17) := ''6F6E7B6D617267696E2D746F703A313570787D2363656E746572206469762E636F6D6D656E747B6261636B67726F756E642D636F6C6F723A234635463546353B6261636B67726F756E642D696D6167653A6C696E6561722D6772616469656E7428234643464346432C20234635463546352'
||'93B626F726465723A31707820736F'';',
'blog_install.i(18) := ''6C696420234341434143413B626F726465722D7261646975733A3370782033707820337078203370783B666F6E742D73697A653A312E32656D3B666F6E742D7765696768743A3730303B6C65747465722D73706163696E673A2D3170783B70616464696E673A34707820313070783B77696'
||'474683A36363870783B6865696768'';',
'blog_install.i(19) := ''743A323270783B636C6561723A626F74687D2363656E746572206469762E636F6D6D656E74202E636F6D6D656E742D6C696E6B7B636F6C6F723A233030354542303B666C6F61743A72696768747D2363656E74657220646976202E7175657374696F6E2C2363656E746572202E617274696'
||'36C652D7469746C65206832207370'';',
'blog_install.i(20) := ''616E2C617B636F6C6F723A233030354542307D2363656E74657220646976202E7175657374696F6E207370616E7B666F6E742D73697A653A313670787D2363656E74657220646976202E616E737765727B6D617267696E3A36707820307D2363656E746572206469762E636F6D6D656E742'
||'06469762E736F6369616C2D627574'';',
'blog_install.i(21) := ''746F6E7B666C6F61743A6C6566743B6D617267696E2D72696768743A3870787D23636F6D6D656E7473202E636F6D6D656E742D746578747B6261636B67726F756E643A6E6F6E6520726570656174207363726F6C6C2030203020234635463546353B626F726465723A31707820736F6C696'
||'420234341434143413B626F726465'';',
'blog_install.i(22) := ''722D7261646975733A3370782033707820337078203370783B70616464696E673A35707820313070783B6D617267696E2D626F74746F6D3A313270783B77696474683A36383670783B626F782D736861646F773A337078203970782031307078202D36707820234242427D23636F6D6D656'
||'E74732068337B666F6E742D73697A'';',
'blog_install.i(23) := ''653A2E39656D3B6D617267696E3A302030203570783B70616464696E673A307D2E72696768747B666C6F61743A72696768743B77696474683A32313070783B70616464696E673A3570782031307078203230707820307D2E72696768742068327B636F6C6F723A233333333B70616464696'
||'E673A31357078203020303B666F6E'';',
'blog_install.i(24) := ''742D73697A653A313770783B6C65747465722D73706163696E673A2D3170783B666F6E742D7765696768743A3230307D2E726967687420756C7B636F6C6F723A233737373B70616464696E673A35707820357078203020313570783B6C6973742D7374796C652D747970653A73717561726'
||'53B6D617267696E3A307D2E726967'';',
'blog_install.i(25) := ''687420756C206C697B70616464696E672D626F74746F6D3A3570787D2E726967687420617B636F6C6F723A233737377D2E7269676874202E726567696F6E2C2363656E746572206469762E636F6D6D656E74202E636F6D6D656E742D6C696E6B20696D677B6D617267696E2D6C6566743A3'
||'570787D2E7269676874202E726567'';',
'blog_install.i(26) := ''696F6E20707B6D617267696E2D746F703A3370787D2E636C6561727B636C6561723A626F74687D2E666F6F7465727B636C6561723A626F74683B626F726465722D746F703A31707820736F6C696420234343433B70616464696E673A3130707820313570783B746578742D616C69676E3A6'
||'3656E7465723B666F6E742D73697A'';',
'blog_install.i(27) := ''653A313170783B6261636B67726F756E643A234545457D236C6F67696E2D6D657373616765737B6865696768743A31343070787D236C6F67696E2D6D61696E7B646973706C61793A7461626C653B6D617267696E3A6175746F7D2363656E746572202E657272636F6E7461696E65727B626'
||'1636B67726F756E643A75726C2822'';',
'blog_install.i(28) := ''663F703D424C4F473A444F574E4C4F41443A303A73746F702E706E672229206E6F2D7265706561743B6865696768743A32303070783B70616464696E673A32307078203020302031363470783B766572746963616C2D616C69676E3A6D6964646C653B636F6C6F723A233333333B666F6E7'
||'42D7765696768743A3730307D2363'';',
'blog_install.i(29) := ''656E746572202E4572726F72506167654D6573736167657B636F6C6F723A233333333B666F6E742D7765696768743A3730303B6D617267696E2D6C6566743A31363470787D234D4553534147457B6261636B67726F756E643A6E6F6E6520726570656174207363726F6C6C2030203020234'
||'635463546353B626F726465723A31'';',
'blog_install.i(30) := ''707820736F6C696420234341434143413B626F726465722D7261646975733A3370782033707820337078203370783B636F6C6F723A233333333B666F6E742D7765696768743A3730303B6D617267696E3A357078206175746F3B70616464696E673A3570783B746578742D616C69676E3A6'
||'3656E7465723B77696474683A3630'';',
'blog_install.i(31) := ''3070787D627574746F6E7B626F726465723A303B637572736F723A706F696E7465723B666F6E742D7765696768743A3430303B70616464696E673A302031307078203020303B746578742D616C69676E3A63656E7465723B6D617267696E3A30203470783B77696474683A6175746F3B6F7'
||'66572666C6F773A76697369626C65'';',
'blog_install.i(32) := ''3B6D617267696E2D746F703A307D627574746F6E207370616E7B706F736974696F6E3A72656C61746976653B646973706C61793A626C6F636B3B77686974652D73706163653A6E6F777261703B666F6E742D73697A653A313370783B70616464696E673A3020347078203020313570787D6'
||'27574746F6E2E627574746F6E2D61'';',
'blog_install.i(33) := ''6C74317B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A62742D616C74312D722E706E672229207269676874206E6F2D7265706561747D627574746F6E2E627574746F6E2D616C7431207370616E7B6865696768743A323070783B6C696E652D6'
||'865696768743A323070783B626163'';',
'blog_install.i(34) := ''6B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A62742D616C74312D6C2E706E672229206C656674206E6F2D7265706561743B636F6C6F723A233446344634467D2E6F7074696F6E616C6C6162656C7B77686974652D73706163653A6E6F777261703B636'
||'F6C6F723A233333333B666F6E742D'';',
'blog_install.i(35) := ''7765696768743A3730307D2E68656C706C6162656C7B637572736F723A68656C703B77686974652D73706163653A6E6F777261703B636F6C6F723A233030354542303B666F6E742D7765696768743A3730303B746578742D6465636F726174696F6E3A6E6F6E657D2E68656C706C6162656'
||'C3A686F7665727B706F736974696F'';',
'blog_install.i(36) := ''6E3A72656C61746976657D2E68656C706C6162656C3A686F766572206469767B646973706C61793A626C6F636B7D2E68656C706C6162656C206469767B626F782D736861646F773A3570782035707820357078207267626128302C20302C20302C20302E31293B626F726465722D7261646'
||'975733A357078203570783B706F73'';',
'blog_install.i(37) := ''6974696F6E3A6162736F6C7574653B6C6566743A31656D3B746F703A31656D3B6D617267696E2D6C6566743A303B77686974652D73706163653A6E6F777261703B6261636B67726F756E642D636F6C6F723A234545453B626F726465723A31707820736F6C696420234343433B636F6C6F7'
||'23A233333333B666F6E742D776569'';',
'blog_install.i(38) := ''6768743A3730303B70616464696E673A2E38656D2031656D3B746578742D616C69676E3A6C6566743B746578742D6465636F726174696F6E3A6E6F6E653B7A2D696E6465783A393939393B646973706C61793A6E6F6E657D236D656E757B706F736974696F6E3A6162736F6C7574653B626'
||'F74746F6D3A303B72696768743A30'';',
'blog_install.i(39) := ''7D236D656E75206C697B666C6F61743A6C6566743B6D617267696E3A3020302030203470787D236D656E75206C693A686F7665722C236D656E75206C692E63757272656E747B6261636B67726F756E643A234641464146413B626F726465722D746F702D6C6566742D7261646975733A347'
||'0783B626F726465722D746F702D72'';',
'blog_install.i(40) := ''696768742D7261646975733A3470787D236D656E75206C693A686F76657220612C236D656E75206C692E63757272656E7420612C2E726967687420613A686F7665727B636F6C6F723A233333337D236D656E7520617B636F6C6F723A234641464146413B646973706C61793A626C6F636B3'
||'B666F6E742D7765696768743A3730'';',
'blog_install.i(41) := ''303B6C696E652D6865696768743A323270783B70616464696E673A30203870787D2E7265736F75726365736D617267696E7B6D617267696E2D746F703A343070787D7461626C652E486F72697A6F6E74616C426F726465722074647B70616464696E673A3670783B626F726465722D626F7'
||'4746F6D3A31707820234343432073'';',
'blog_install.i(42) := ''6F6C69643B636F6C6F723A233333337D7461626C652E486F72697A6F6E74616C426F726465722074687B70616464696E673A3670783B626F726465722D626F74746F6D3A317078202343434320736F6C69643B636F6C6F723A233333333B666F6E742D73697A653A323070783B666F6E742'
||'D7765696768743A3230303B6C6574'';',
'blog_install.i(43) := ''7465722D73706163696E673A2D3170787D7370616E2E6E6F64617461666F756E647B666F6E742D73697A653A313470787D2361727469636C6570616765737B70616464696E673A32707820303B646973706C61793A696E6C696E652D626C6F636B3B6865696768743A333070787D2361727'
||'469636C65706167657320627B6261'';',
'blog_install.i(44) := ''636B67726F756E643A233030354542303B70616464696E673A347078203770783B636F6C6F723A234641464146413B626F726465722D7261646975733A3370783B6D617267696E3A3270783B646973706C61793A696E6C696E652D626C6F636B3B6865696768743A313470783B776964746'
||'83A313470783B6C696E652D686569'';',
'blog_install.i(45) := ''6768743A313470783B746578742D616C69676E3A63656E7465727D2361727469636C65706167657320617B626F726465723A31707820736F6C696420233030354542303B70616464696E673A337078203570783B626F726465722D7261646975733A3370783B6D617267696E3A3270783B6'
||'46973706C61793A696E6C696E652D'';',
'blog_install.i(46) := ''626C6F636B3B6865696768743A313470783B77696474683A313470783B6C696E652D6865696768743A313470783B746578742D616C69676E3A63656E7465727D74642E706167696E6174696F6E7B6865696768743A333070787D7461626C652E6170657869725F574F524B53484545545F4'
||'44154417B626F726465722D636F6C'';',
'blog_install.i(47) := ''6C617073653A736570617261746521696D706F7274616E747D7461626C652E6170657869725F574F524B53484545545F444154412074687B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A69722D62672E706E672229207265706561742D78203'
||'0203020233334363542303B626F72'';',
'blog_install.i(48) := ''6465722D6C6566743A31707820736F6C696420234141417D7461626C652E6170657869725F574F524B53484545545F444154412074683A686F7665723A6E6F74282E63757272656E74297B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A69722'
||'D62672E706E672229207265706561'';',
'blog_install.i(49) := ''742D782030202D3432707820233436383743437D7461626C652E6170657869725F574F524B53484545545F444154412074682E63757272656E747B626F726465722D6C6566743A31707820736F6C696420234141413B626F726465722D72696768743A6E6F6E657D7461626C652E6170657'
||'869725F574F524B53484545545F44'';',
'blog_install.i(50) := ''4154412074682E63757272656E74206469767B637572736F723A64656661756C747D7461626C652E6170657869725F574F524B53484545545F444154412074647B626F726465722D746F703A6E6F6E6521696D706F7274616E743B626F726465722D626F74746F6D3A31707820736F6C696'
||'4202341414121696D706F7274616E'';',
'blog_install.i(51) := ''743B6261636B67726F756E642D636F6C6F723A7472616E73706172656E7421696D706F7274616E743B70616464696E673A3670787D7461626C652E6170657869725F574F524B53484545545F444154412074722E6576656E3A686F7665722074642C7461626C652E6170657869725F574F5'
||'24B53484545545F44415441207472'';',
'blog_install.i(52) := ''2E6F64643A686F7665722074642C7461626C652E6170657869725F574F524B53484545545F444154412074723A686F7665722074647B6261636B67726F756E642D636F6C6F723A7472616E73706172656E7421696D706F7274616E747D7461626C652E6170657869725F574F524B5348454'
||'5545F444154412074722074682064'';',
'blog_install.i(53) := ''69767B746578742D6465636F726174696F6E3A6E6F6E6521696D706F7274616E747D627574746F6E2E6170657869722D676F2D627574746F6E2C627574746F6E2E6170657869722D627574746F6E2C627574746F6E2E627574746F6E2D677261797B6261636B67726F756E643A75726C282'
||'2663F703D424C4F473A444F574E4C'';',
'blog_install.i(54) := ''4F41443A303A62742D677261792D722E706E672229207269676874206E6F2D7265706561747D236170657869725F544F4F4C42415220627574746F6E2E6468746D6C4D656E754F6E2C236170657869725F544F4F4C42415220627574746F6E2E6468746D6C4D656E757B6261636B67726F7'
||'56E643A75726C2822663F703D424C'';',
'blog_install.i(55) := ''4F473A444F574E4C4F41443A303A62742D70756C6C646F776E2D677261792D62672D722E706E672229207269676874206E6F2D7265706561743B70616464696E673A302032357078203020307D236170657869725F544F4F4C42415220627574746F6E2E6468746D6C4D656E754F6E20737'
||'0616E2C236170657869725F544F4F'';',
'blog_install.i(56) := ''4C42415220627574746F6E2E6468746D6C4D656E75207370616E2C627574746F6E2E6170657869722D676F2D627574746F6E207370616E2C627574746F6E2E6170657869722D627574746F6E207370616E2C627574746F6E2E627574746F6E2D67726179207370616E7B6865696768743A3'
||'23070783B6C696E652D6865696768'';',
'blog_install.i(57) := ''743A323070783B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A62742D677261792D6C2E706E672229206C656674206E6F2D7265706561743B636F6C6F723A233446344634467D236D6F64616C5F4C4F414445522C236170657869725F4C4F414'
||'445527B6261636B67726F756E642D'';',
'blog_install.i(58) := ''636F6C6F723A726762612835312C2035312C2035312C302E33293B6865696768743A313030253B77696474683A313030253B746F703A303B6C6566743A303B706F736974696F6E3A66697865643B7A2D696E6465783A393939393B637572736F723A776169747D236D6F64616C5F4C4F414'
||'4455220696D672C23617065786972'';',
'blog_install.i(59) := ''5F4C4F4144455220696D677B6C6566743A3438253B706F736974696F6E3A72656C61746976653B746F703A3334253B637572736F723A776169747D236170657869725F726F6C6C6F7665722E75692D726573697A61626C657B70616464696E672D72696768743A3870787D2361706578697'
||'25F726F6C6C6F766572206469762E'';',
'blog_install.i(60) := ''75692D726573697A61626C652D68616E646C657B6261636B67726F756E643A75726C2822663F703D424C4F473A444F574E4C4F41443A303A726573697A652D652E706E672229206E6F2D726570656174207363726F6C6C20302035302520234630463046303B626F726465722D6C6566743'
||'A32707820736F6C69642023463046'';',
'blog_install.i(61) := ''3046303B72696768743A307D236170657869725F444154415F50414E454C207461626C652C7461626C652E486F72697A6F6E74616C426F726465722C2E7265706F727473726567696F6E2C2E626F726465726C657373726567696F6E7B77696474683A313030257D756C2E666F726D61742'
||'D62746E7B6D617267696E3A303B70'';',
'blog_install.i(62) := ''616464696E673A33707820303B6865696768743A333270783B6D617267696E2D6C6566743A3370787D756C2E666F726D61742D62746E206C697B646973706C61793A626C6F636B3B666C6F61743A6C6566743B6865696768743A323470783B6C6973742D7374796C653A6E6F6E65206F757'
||'473696465206E6F6E653B70616464'';',
'blog_install.i(63) := ''696E673A34707820303B77696474683A323870787D756C2E666F726D61742D62746E20696D677B626F726465723A31707820736F6C696420234541454145413B77696474683A323070783B6865696768743A323270783B637572736F723A706F696E7465727D756C2E666F726D61742D627'
||'46E20696D673A6163746976657B62'';',
'blog_install.i(64) := ''6F726465723A32707820736F6C696420234641464146417D6469762E617574686F727B6D617267696E2D626F74746F6D3A353570787D68322E617574686F722D6E616D657B666F6E742D73697A653A323070783B666F6E742D7765696768743A3230303B6C65747465722D73706163696E6'
||'73A2D3170783B70616464696E673A'';',
'blog_install.i(65) := ''313070782030203570783B6D617267696E2D746F703A313570787D6469762E617574686F722D6C6566747B77696474683A31323870787D6469762E617574686F722D72696768747B666C6F61743A72696768743B70616464696E673A302031357078203020323570783B77696474683A353'
||'33870787D2E70726F66696C652D6C'';',
'blog_install.i(66) := ''696E6B7B666F6E743A3130302520417269616C2C73616E732D73657269663B636F6C6F723A233037383342363B746578742D6465636F726174696F6E3A6E6F6E657D2E70726F66696C652D6C696E6B20696D677B766572746963616C2D616C69676E3A6D6964646C657D236C624F7665726'
||'C61797B706F736974696F6E3A6669'';',
'blog_install.i(67) := ''7865643B7A2D696E6465783A393939393B6C6566743A303B746F703A303B77696474683A313030253B6865696768743A313030253B6261636B67726F756E642D636F6C6F723A233030303B637572736F723A706F696E7465727D236C6243656E7465722C236C62426F74746F6D436F6E746'
||'1696E65727B706F736974696F6E3A'';',
'blog_install.i(68) := ''6162736F6C7574653B7A2D696E6465783A393939393B6F766572666C6F773A68696464656E3B6261636B67726F756E642D636F6C6F723A234641464146417D2E6C624C6F6164696E677B6261636B67726F756E643A234641464146412075726C2822663F703D424C4F473A444F574E4C4F4'
||'1443A303A6C6F6164696E672E6769'';',
'blog_install.i(69) := ''662229206E6F2D7265706561742063656E7465727D236C62496D6167657B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A303B626F726465723A3130707820736F6C696420234641464146413B6261636B67726F756E642D7265706561743A6E6F2D72657065617'
||'47D236C62507265764C696E6B2C23'';',
'blog_install.i(70) := ''6C624E6578744C696E6B7B646973706C61793A626C6F636B3B706F736974696F6E3A6162736F6C7574653B746F703A303B77696474683A3530253B6F75746C696E653A6E6F6E657D236C62507265764C696E6B3A686F7665727B6261636B67726F756E643A7472616E73706172656E74207'
||'5726C2822663F703D424C4F473A44'';',
'blog_install.i(71) := ''4F574E4C4F41443A303A707265766C6162656C2E706E672229206E6F2D7265706561742030203135257D236C624E6578744C696E6B3A686F7665727B6261636B67726F756E643A7472616E73706172656E742075726C2822663F703D424C4F473A444F574E4C4F41443A303A6E6578746C6'
||'162656C2E706E672229206E6F2D72'';',
'blog_install.i(72) := ''65706561742031303025203135257D236C62426F74746F6D7B666F6E742D66616D696C793A56657264616E612C20417269616C2C2047656E6576612C2048656C7665746963612C2073616E732D73657269663B666F6E742D73697A653A313070783B636F6C6F723A233636363B6C696E652'
||'D6865696768743A312E34656D3B74'';',
'blog_install.i(73) := ''6578742D616C69676E3A6C6566743B626F726465723A3130707820736F6C696420234641464146413B626F726465722D746F702D7374796C653A6E6F6E657D236C62436C6F73654C696E6B7B646973706C61793A626C6F636B3B666C6F61743A72696768743B77696474683A363670783B6'
||'865696768743A323270783B626163'';',
'blog_install.i(74) := ''6B67726F756E643A7472616E73706172656E742075726C2822663F703D424C4F473A444F574E4C4F41443A303A636C6F73656C6162656C2E706E672229206E6F2D7265706561742063656E7465723B6D617267696E3A35707820303B6F75746C696E653A6E6F6E657D236C624E756D62657'
||'22C236C6243617074696F6E7B6D61'';',
'blog_install.i(75) := ''7267696E2D72696768743A373170787D236C6243617074696F6E7B666F6E742D7765696768743A3730307D756C2E626A71737B706F736974696F6E3A72656C61746976653B6C6973742D7374796C653A6E6F6E653B70616464696E673A303B6D617267696E3A303B6F766572666C6F773A6'
||'8696464656E3B646973706C61793A'';',
'blog_install.i(76) := ''6E6F6E653B626F726465723A31707820736F6C696420236363633B626F782D736861646F773A337078203970782031307078202D36707820236262627D6C692E626A71732D736C6964657B706F736974696F6E3A6162736F6C7574653B646973706C61793A6E6F6E657D756C2E626A71732'
||'D636F6E74726F6C737B6C6973742D'';',
'blog_install.i(77) := ''7374796C653A6E6F6E653B6D617267696E3A303B70616464696E673A303B7A2D696E6465783A393939397D756C2E626A71732D636F6E74726F6C732E762D63656E7465726564206C6920617B706F736974696F6E3A6162736F6C7574657D756C2E626A71732D636F6E74726F6C732E762D6'
||'3656E7465726564206C692E626A71'';',
'blog_install.i(78) := ''732D6E65787420612C236C624E6578744C696E6B7B72696768743A307D756C2E626A71732D636F6E74726F6C732E762D63656E7465726564206C692E626A71732D7072657620612C236C62507265764C696E6B7B6C6566743A307D6F6C2E626A71732D6D61726B6572737B6C6973742D737'
||'4796C653A6E6F6E653B7061646469'';',
'blog_install.i(79) := ''6E673A303B6D617267696E3A31327078203020303B77696474683A313030257D6F6C2E626A71732D6D61726B6572732E682D63656E74657265647B746578742D616C69676E3A63656E7465727D6F6C2E626A71732D6D61726B657273206C697B646973706C61793A696E6C696E657D6F6C2'
||'E626A71732D6D61726B657273206C'';',
'blog_install.i(80) := ''6920617B626F726465723A31707820736F6C696420233030356562303B626F726465722D7261646975733A3370783B646973706C61793A696E6C696E652D626C6F636B3B6865696768743A313470783B6C696E652D6865696768743A313470783B6D617267696E3A3270783B70616464696'
||'E673A337078203570783B74657874'';',
'blog_install.i(81) := ''2D616C69676E3A63656E7465723B77696474683A313470787D6F6C2E626A71732D6D61726B657273206C6920613A686F7665722C2361727469636C65706167657320613A686F7665727B6261636B67726F756E642D636F6C6F723A233030354542303B636F6C6F723A234641464146417D6'
||'F6C2E626A71732D6D61726B657273'';',
'blog_install.i(82) := ''206C692E6163746976652D6D61726B657220617B6261636B67726F756E643A6E6F6E6520726570656174207363726F6C6C2030203020233030356562303B626F726465722D7261646975733A3370783B636F6C6F723A236661666166613B646973706C61793A696E6C696E652D626C6F636'
||'B3B6865696768743A313470783B6C'';',
'blog_install.i(83) := ''696E652D6865696768743A313470783B6D617267696E3A3270783B70616464696E673A347078203770783B746578742D616C69676E3A63656E7465723B77696474683A313470787D6469762E626A71732D63617074696F6E7B636F6C6F723A233030303B626F74746F6D3A303B646973706'
||'C61793A626C6F636B3B6D61726769'';',
'blog_install.i(84) := ''6E3A303B70616464696E672D6C6566743A32253B706F736974696F6E3A6162736F6C7574653B77696474683A313030253B6261636B67726F756E643A6E6F6E6520726570656174207363726F6C6C203020302072676261283235302C3235302C3235302C302E37297D2E726174696E677B6'
||'D617267696E2D746F703A3470787D'';',
'blog_install.i(85) := ''2E726174696E67203E20756C2C236D656E7520756C7B6C6973742D7374796C653A6E6F6E653B70616464696E673A303B6D617267696E3A307D2E726174696E67203E20756C203E206C697B666C6F61743A6C6566743B6D617267696E3A303B6261636B67726F756E643A75726C2822663F7'
||'03D424C4F473A444F574E4C4F4144'';',
'blog_install.i(86) := ''3A303A737461722D726174696E672E6769662229206E6F2D7265706561743B77696474683A323570783B6865696768743A323570787D2E726174696E67203E20756C203E206C692E656E61626C65642C7461626C652E6170657869725F574F524B53484545545F444154412074682064697'
||'67B637572736F723A706F696E7465'';',
'blog_install.i(87) := ''727D2E726174696E67203E20756C203E206C693A66697273742D6368696C647B6D617267696E2D6C6566743A307D2E726174696E67203E20756C203E206C692E686F7665727B6261636B67726F756E642D706F736974696F6E3A2D323570787D2E726174696E67203E20756C203E206C692'
||'E6163746976657B6261636B67726F'';',
'blog_install.i(88) := ''756E642D706F736974696F6E3A2D353070787D2E73796E746178686967686C69676874657220612C2E73796E746178686967686C696768746572206469762C2E73796E746178686967686C69676874657220636F64652C2E73796E746178686967686C696768746572207461626C652C2E7'
||'3796E746178686967686C69676874'';',
'blog_install.i(89) := ''6572207461626C652074642C2E73796E746178686967686C696768746572207461626C652074722C2E73796E746178686967686C696768746572207461626C652074626F64792C2E73796E746178686967686C696768746572207461626C652074686561642C2E73796E746178686967686'
||'C696768746572207461626C652063'';',
'blog_install.i(90) := ''617074696F6E2C2E73796E746178686967686C6967687465722074657874617265617B6261636B67726F756E643A6E6F6E652021696D706F7274616E743B626F726465723A302021696D706F7274616E743B626F782D736861646F773A6E6F6E652021696D706F7274616E743B626F74746'
||'F6D3A6175746F2021696D706F7274'';',
'blog_install.i(91) := ''616E743B666C6F61743A6E6F6E652021696D706F7274616E743B6865696768743A6175746F2021696D706F7274616E743B6C6566743A6175746F2021696D706F7274616E743B6C696E652D6865696768743A312E31656D2021696D706F7274616E743B6D617267696E3A302021696D706F7'
||'274616E743B6F75746C696E653A30'';',
'blog_install.i(92) := ''2021696D706F7274616E743B6F766572666C6F773A76697369626C652021696D706F7274616E743B70616464696E673A302021696D706F7274616E743B706F736974696F6E3A7374617469632021696D706F7274616E743B72696768743A6175746F2021696D706F7274616E743B7465787'
||'42D616C69676E3A6C656674202169'';',
'blog_install.i(93) := ''6D706F7274616E743B746F703A6175746F2021696D706F7274616E743B766572746963616C2D616C69676E3A626173656C696E652021696D706F7274616E743B77696474683A6175746F2021696D706F7274616E743B626F782D73697A696E673A636F6E74656E742D626F782021696D706'
||'F7274616E743B666F6E742D66616D'';',
'blog_install.i(94) := ''696C793A22436F6E736F6C6173222C2242697473747265616D20566572612053616E73204D6F6E6F222C22436F7572696572204E6577222C436F75726965722C6D6F6E6F73706163652021696D706F7274616E743B666F6E742D7765696768743A6E6F726D616C2021696D706F7274616E7'
||'43B666F6E742D7374796C653A6E6F'';',
'blog_install.i(95) := ''726D616C2021696D706F7274616E743B666F6E742D73697A653A31656D2021696D706F7274616E743B6D696E2D6865696768743A6175746F2021696D706F7274616E747D2E73796E746178686967686C6967687465722E736F757263657B6F766572666C6F773A68696464656E2021696D7'
||'06F7274616E747D2E73796E746178'';',
'blog_install.i(96) := ''686967686C696768746572202E6974616C69637B666F6E742D7374796C653A6974616C69632021696D706F7274616E747D2E73796E746178686967686C696768746572202E6C696E657B77686974652D73706163653A7072652021696D706F7274616E747D2E73796E746178686967686C6'
||'96768746572207461626C65207464'';',
'blog_install.i(97) := ''2E636F64652C2E73796E746178686967686C696768746572207461626C657B77696474683A313030252021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652074642E636F6465202E636F6E7461696E65727B706F736974696F6E3A72656C617469766'
||'52021696D706F7274616E747D2E73'';',
'blog_install.i(98) := ''796E746178686967686C696768746572207461626C652074642E636F6465202E636F6E7461696E65722074657874617265617B626F782D73697A696E673A626F726465722D626F782021696D706F7274616E743B706F736974696F6E3A6162736F6C7574652021696D706F7274616E743B6'
||'C6566743A302021696D706F727461'';',
'blog_install.i(99) := ''6E743B746F703A302021696D706F7274616E743B77696474683A313030252021696D706F7274616E743B6865696768743A313030252021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E743B626F782D736861646F773A6E6F6E652021696D706F7274616E7'
||'43B6261636B67726F756E643A2346'';',
'blog_install.i(100) := ''43464346432021696D706F7274616E743B70616464696E672D6C6566743A31656D2021696D706F7274616E743B6F766572666C6F773A68696464656E2021696D706F7274616E743B77686974652D73706163653A7072652021696D706F7274616E747D2E73796E746178686967686C6967'
||'68746572207461626C652074642E67'';',
'blog_install.i(101) := ''7574746572202E6C696E657B746578742D616C69676E3A72696768742021696D706F7274616E743B70616464696E673A30202E35656D20302031656D2021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652074642E636F6465202E6C696E657B7061'
||'6464696E673A302031656D2021696D'';',
'blog_install.i(102) := ''706F7274616E747D2E73796E746178686967686C6967687465722E6E6F6775747465722074642E636F6465202E6C696E652C2E73796E746178686967686C6967687465722E6E6F6775747465722074642E636F6465202E636F6E7461696E65722074657874617265617B70616464696E67'
||'2D6C6566743A302021696D706F7274'';',
'blog_install.i(103) := ''616E743B626F782D736861646F773A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E73686F777B646973706C61793A626C6F636B2021696D706F7274616E747D2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F'
||'6C626172207370616E7B646973706C'';',
'blog_install.i(104) := ''61793A696E6C696E652021696D706F7274616E743B6D617267696E2D72696768743A31656D2021696D706F7274616E747D2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C626172207370616E20617B70616464696E673A302021696D706F7274616E'
||'743B646973706C61793A6E6F6E6520'';',
'blog_install.i(105) := ''21696D706F7274616E747D2E73796E746178686967686C696768746572202E746F6F6C626172207370616E2E7469746C652C2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C626172207370616E20612E657870616E64536F757263657B646973706C'
||'61793A696E6C696E652021696D706F'';',
'blog_install.i(106) := ''7274616E747D2E73796E746178686967686C6967687465722E69657B666F6E742D73697A653A2E39656D2021696D706F7274616E743B70616464696E673A31707820302031707820302021696D706F7274616E747D2E73796E746178686967686C6967687465722E6965202E746F6F6C62'
||'61727B6C696E652D6865696768743A'';',
'blog_install.i(107) := ''3870782021696D706F7274616E747D2E73796E746178686967686C6967687465722E6965202E746F6F6C62617220617B70616464696E672D746F703A302021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E616C7431202E'
||'636F6E74656E742C2E73796E746178'';',
'blog_install.i(108) := ''686967686C6967687465722E7072696E74696E67202E6C696E652E616C7432202E636F6E74656E742C2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E686967686C696768746564202E6E756D6265722C2E73796E746178686967686C696768746572'
||'2E7072696E74696E67202E6C696E65'';',
'blog_install.i(109) := ''2E686967686C6967687465642E616C7431202E636F6E74656E742C2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E652E686967686C6967687465642E616C7432202E636F6E74656E747B6261636B67726F756E643A6E6F6E652021696D706F7274616E74'
||'7D2E73796E746178686967686C6967'';',
'blog_install.i(110) := ''687465722E7072696E74696E67202E6C696E65202E6E756D6265727B636F6C6F723A236262622021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E746F6F6C6261722C2E73796E746178686967686C696768746572202E746F6F6C6261'
||'7220612E657870616E64536F757263'';',
'blog_install.i(111) := ''652C2E73796E746178686967686C6967687465722E636F6C6C6170736564207461626C657B646973706C61793A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E6720617B746578742D6465636F726174696F6E3A6E6F6E652021'
||'696D706F7274616E747D2E73796E74'';',
'blog_install.i(112) := ''6178686967686C6967687465722E7072696E74696E67202E7363726970742C2E73796E746178686967686C696768746572202E626F6C647B666F6E742D7765696768743A626F6C642021696D706F7274616E747D2E73796E746178686967686C696768746572202E6C696E652E616C7432'
||'2C2E73796E746178686967686C6967'';',
'blog_install.i(113) := ''68746572202E6C696E652E616C74317B6261636B67726F756E642D636F6C6F723A234643464346432021696D706F7274616E747D2E73796E746178686967686C696768746572202E6C696E652E686967686C6967687465642E616C74312C2E73796E746178686967686C69676874657220'
||'2E6C696E652E686967686C69676874'';',
'blog_install.i(114) := ''65642E616C74327B6261636B67726F756E642D636F6C6F723A236530653065302021696D706F7274616E747D2E73796E746178686967686C696768746572207461626C652063617074696F6E7B746578742D616C69676E3A6C6566742021696D706F7274616E743B706164646'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(39890504578496952235)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'96E673A2E35656D2030202E35656D2031656D20'';',
'blog_install.i(115) := ''21696D706F7274616E743B636F6C6F723A233333332021696D706F7274616E747D2E73796E746178686967686C696768746572202E6775747465727B636F6C6F723A236166616661662021696D706F7274616E747D2E73796E746178686967686C696768746572202E677574746572202E'
||'6C696E657B626F726465722D726967'';',
'blog_install.i(116) := ''68743A33707820736F6C696420233663653236632021696D706F7274616E747D2E73796E746178686967686C696768746572202E677574746572202E6C696E652E686967686C6967687465647B6261636B67726F756E642D636F6C6F723A233663653236632021696D706F7274616E743B'
||'636F6C6F723A234643464346432021'';',
'blog_install.i(117) := ''696D706F7274616E747D2E73796E746178686967686C6967687465722E7072696E74696E67202E6C696E65202E636F6E74656E747B636F6C6F723A233333332021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C696768'
||'7465722E636F6C6C61707365647B6F'';',
'blog_install.i(118) := ''766572666C6F773A76697369626C652021696D706F7274616E747D2E73796E746178686967686C6967687465722E636F6C6C6170736564202E746F6F6C6261727B70616464696E673A2E31656D202E38656D2030202E38656D2021696D706F7274616E743B666F6E742D73697A653A3165'
||'6D2021696D706F7274616E743B706F'';',
'blog_install.i(119) := ''736974696F6E3A7374617469632021696D706F7274616E743B77696474683A6175746F2021696D706F7274616E743B6865696768743A6175746F2021696D706F7274616E743B636F6C6F723A626C75652021696D706F7274616E743B6261636B67726F756E643A23464346434643202169'
||'6D706F7274616E743B626F72646572'';',
'blog_install.i(120) := ''3A31707820736F6C696420233663653236632021696D706F7274616E747D2E73796E746178686967686C696768746572202E746F6F6C6261727B706F736974696F6E3A6162736F6C7574652021696D706F7274616E743B72696768743A3170782021696D706F7274616E743B746F703A31'
||'70782021696D706F7274616E743B77'';',
'blog_install.i(121) := ''696474683A313170782021696D706F7274616E743B6865696768743A313170782021696D706F7274616E743B666F6E742D73697A653A313070782021696D706F7274616E743B7A2D696E6465783A31302021696D706F7274616E743B636F6C6F723A234643464346432021696D706F7274'
||'616E743B6261636B67726F756E643A'';',
'blog_install.i(122) := ''233663653236632021696D706F7274616E743B626F726465723A6E6F6E652021696D706F7274616E747D2E73796E746178686967686C696768746572202E746F6F6C62617220617B646973706C61793A626C6F636B2021696D706F7274616E743B746578742D616C69676E3A63656E7465'
||'722021696D706F7274616E743B7465'';',
'blog_install.i(123) := ''78742D6465636F726174696F6E3A6E6F6E652021696D706F7274616E743B70616464696E672D746F703A3170782021696D706F7274616E743B636F6C6F723A234643464346432021696D706F7274616E747D2E73796E746178686967686C696768746572202E706C61696E2C2E73796E74'
||'6178686967686C696768746572202E'';',
'blog_install.i(124) := ''706C61696E20612C2E73796E746178686967686C696768746572202E746F6F6C62617220613A686F7665722C2E73796E746178686967686C696768746572202E6C696E652E686967686C6967687465642E6E756D6265722C2E73796E746178686967686C6967687465722E7072696E7469'
||'6E67202E627265616B2C2E73796E74'';',
'blog_install.i(125) := ''6178686967686C6967687465722E7072696E74696E67202E627265616B20612C2E73796E746178686967686C6967687465722E7072696E74696E67202E706C61696E2C2E73796E746178686967686C6967687465722E7072696E74696E67202E706C61696E20617B636F6C6F723A233333'
||'332021696D706F7274616E747D2E73'';',
'blog_install.i(126) := ''796E746178686967686C696768746572202E636F6D6D656E74732C2E73796E746178686967686C696768746572202E636F6D6D656E747320612C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6D6D656E74732C2E73796E746178686967686C6967687465'
||'722E7072696E74696E67202E636F6D'';',
'blog_install.i(127) := ''6D656E747320617B636F6C6F723A233030383230302021696D706F7274616E747D2E73796E746178686967686C696768746572202E737472696E672C2E73796E746178686967686C696768746572202E737472696E6720612C2E73796E746178686967686C6967687465722E636F6C6C61'
||'70736564202E746F6F6C6261722061'';',
'blog_install.i(128) := ''2C2E73796E746178686967686C6967687465722E7072696E74696E67202E737472696E672C2E73796E746178686967686C6967687465722E7072696E74696E67202E737472696E6720617B636F6C6F723A626C75652021696D706F7274616E747D2E73796E746178686967686C69676874'
||'6572202E7661726961626C652C2E73'';',
'blog_install.i(129) := ''796E746178686967686C6967687465722E7072696E74696E67202E7661726961626C657B636F6C6F723A236137302021696D706F7274616E747D2E73796E746178686967686C696768746572202E76616C75652C2E73796E746178686967686C6967687465722E7072696E74696E67202E'
||'76616C75657B636F6C6F723A233039'';',
'blog_install.i(130) := ''302021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6E7374616E74732C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6E7374616E74737B636F6C6F723A233036632021696D706F7274616E747D2E73796E7461786869'
||'67686C696768746572202E73637269'';',
'blog_install.i(131) := ''70747B666F6E742D7765696768743A626F6C642021696D706F7274616E743B636F6C6F723A233036392021696D706F7274616E743B6261636B67726F756E642D636F6C6F723A7472616E73706172656E742021696D706F7274616E747D2E73796E746178686967686C696768746572202E'
||'636F6C6F72312C2E73796E74617868'';',
'blog_install.i(132) := ''6967686C696768746572202E636F6C6F723120612C2E73796E746178686967686C696768746572202E70726570726F636573736F722C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F72312C2E73796E746178686967686C6967687465722E7072696E'
||'74696E67202E636F6C6F723120612C'';',
'blog_install.i(133) := ''2E73796E746178686967686C6967687465722E7072696E74696E67202E70726570726F636573736F727B636F6C6F723A677261792021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6C6F72322C2E73796E746178686967686C696768746572202E636F'
||'6C6F723220612C2E73796E74617868'';',
'blog_install.i(134) := ''6967686C696768746572202E66756E6374696F6E732C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F72322C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F723220612C2E73796E746178686967686C6967687465'
||'722E7072696E74696E67202E66756E'';',
'blog_install.i(135) := ''6374696F6E737B636F6C6F723A236666313439332021696D706F7274616E747D2E73796E746178686967686C696768746572202E636F6C6F72332C2E73796E746178686967686C696768746572202E636F6C6F723320612C2E73796E746178686967686C6967687465722E636F6C6C6170'
||'736564202E746F6F6C62617220613A'';',
'blog_install.i(136) := ''686F7665722C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F72332C2E73796E746178686967686C6967687465722E7072696E74696E67202E636F6C6F723320617B636F6C6F723A7265642021696D706F7274616E747D2E73796E746178686967686C'
||'696768746572202E6B6579776F7264'';',
'blog_install.i(137) := ''2C2E73796E746178686967686C6967687465722E7072696E74696E67202E6B6579776F72647B636F6C6F723A233036392021696D706F7274616E743B666F6E742D7765696768743A626F6C642021696D706F7274616E747D2E73796E746178686967686C6967687465727B77696474683A'
||'313030252021696D706F7274616E74'';',
'blog_install.i(138) := ''3B6D617267696E3A31656D20302031656D20302021696D706F7274616E743B706F736974696F6E3A72656C61746976652021696D706F7274616E743B6F766572666C6F773A6175746F2021696D706F7274616E743B666F6E742D73697A653A31656D2021696D706F7274616E743B626163'
||'6B67726F756E642D636F6C6F723A23'';',
'blog_install.i(139) := ''4643464346432021696D706F7274616E743B6F766572666C6F772D793A68696464656E2021696D706F7274616E743B70616464696E673A337078203021696D706F7274616E747D0D0A'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''style.min.css'',''text/css'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000014000000160403000000326FA13500000012504C5445D4D0C8F7F7F7EEEEEE80808040404000000014203B360000000976704167000000140000001600910D4853000000314944415408996310840111060106283061105082029299AAA1A1'
||'7066906A101626410558D592E31C'';',
'blog_install.i(2) := ''616328306170810300D017209A709B58010000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''text-bold-20x22.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000014000000160403000000326FA13500000012504C5445D4D0C8F7F7F7EEEEEE80808040404000000014203B360000000976704167000000140000001600910D485300000033494441540899631084011106010628306110508202D299AAA108'
||'D12084A81201661036A66A28796E'';',
'blog_install.i(2) := ''8032858DA1C084C1050E00C3731E66F4D347110000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''text-italics-20x22.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D4948445200000014000000160403000000326FA13500000012504C5445D4D0C8F7F7F7EEEEEE80808040404000000014203B360000000976704167000000140000001600910D48530000003249444154085B6310840111060106283061105082029299AA4A4A'
||'4154632A858662B1223414244C84'';',
'blog_install.i(2) := ''73848DA1C084C1050E004A8E1FF85E8243830000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''text-underline-20x22.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'begin',
'blog_install.i := blog_install.e;',
'blog_install.i(1) := ''89504E470D0A1A0A0000000D49484452000000380000003B080300000019CCB9820000001974455874536F6674776172650041646F626520496D616765526561647971C9653C0000032269545874584D4C3A636F6D2E61646F62652E786D7000000000003C3F787061636B65742062656769'
||'6E3D22EFBBBF222069643D225735'';',
'blog_install.i(2) := ''4D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520352E302D633036302036312E3133343737372C20323031302F30322F'
||'31322D31373A33323A3030202020'';',
'blog_install.i(3) := ''2020202020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D'
||'22687474703A2F2F6E732E61646F'';',
'blog_install.i(4) := ''62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F'
||'75726365526566232220786D703A'';',
'blog_install.i(5) := ''43726561746F72546F6F6C3D2241646F62652050686F746F73686F7020435335204D6163696E746F73682220786D704D4D3A496E7374616E636549443D22786D702E6969643A36434546434439453541323331314530383543363842424334463832423439312220786D704D4D3A446F6375'
||'6D656E7449443D22786D702E6469'';',
'blog_install.i(6) := ''643A3643454643443946354132333131453038354336384242433446383242343931223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A3039323632453735354132323131453038354336384242433446383242343931'
||'222073745265663A646F63756D65'';',
'blog_install.i(7) := ''6E7449443D22786D702E6469643A3039323632453736354132323131453038354336384242433446383242343931222F3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D2272223F3E70B7'
||'3B1B00000069504C5445FFFFFFFF'';',
'blog_install.i(8) := ''FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D01ED710000002274524E5300'
||'0306090F1215181B242D3336424E'';',
'blog_install.i(9) := ''575A5D69788796A5B1BDC9D2DBE4EAF0F6F9FC6279E567000000E14944415448C7ED94C91282400C0583220A02A2ECC8E6FBFF8FF4A0526C3324DCAC9A3EA74FAF2B446AC29076E1779DBFC7731BA071E59EF30480A723F58E250000A52DF30E05BE14079198612093780946247CEF81090F'
||'AE17BEA6E28B1982DF61062F04B7'';',
'blog_install.i(10) := ''C1024E089FE1E76C87F01B7E4E79D47B560E05B9A515532849755E0C0DB1DABB434BC41D7E8E2A84E5F0BC10D686E784B03EFC7608AAE1B742500FBF11420A36297B784D0811440C2104BD4CEC838FE7B510D27A4444971A62EA0BD1A9C20E2A9BCED7156EE3A3DBDA85E2957863D1137C7'
||'2231AD1884634E2FF886F9E85A119'';',
'blog_install.i(11) := ''2E25CB620000000049454E44AE426082'';',
'blog_install.b := blog_install.varchar2_to_blob(blog_install.i);',
'insert into blog_file (file_name,mime_type,file_type,blob_content)',
'values (''up-arrow.png'',''image/png'',''THEME'',blog_install.b);',
'end;',
'/',
'',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(39888070863357359334)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'15 Post install tasks'
,p_sequence=>150
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  blog_install.set_jobs;',
'  blog_install.update_param_data;',
'END;',
'/'))
);
end;
/
prompt --application/deployment/checks
begin
wwv_flow_api.create_install_check(
 p_id=>wwv_flow_api.id(39890848868899079093)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'Needed system privileges'
,p_sequence=>10
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from sys.user_sys_privs',
'where privilege in (',
'  ''CREATE JOB''',
'  ,''CREATE INDEXTYPE''',
'  ,''CREATE VIEW''',
'  ,''CREATE MATERIALIZED VIEW''',
'  ,''CREATE SEQUENCE''',
'  ,''CREATE SYNONYM''',
'  ,''CREATE TABLE''',
'  ,''CREATE PROCEDURE''',
'  ,''CREATE TRIGGER''',
')',
'having count(1) = 9'))
,p_failure_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Target schema do not have all needed privileges.',
'Ensure that schema does have following privileges:',
'CREATE INDEXTYPE, CREATE MATERIALIZED VIEW, CREATE PROCEDURE , CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE VIEW and CREATE JOB'))
);
wwv_flow_api.create_install_check(
 p_id=>wwv_flow_api.id(39890506477841463317)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'Target schema not contain other objects starting with BLOG'
,p_sequence=>20
,p_check_type=>'NOT_EXISTS'
,p_check_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from sys.user_objects',
'where UPPER(object_name) LIKE ''BLOG%'''))
,p_condition_type=>'FUNCTION_BODY'
,p_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'declare',
'  l_ver varchar2(256);',
'begin',
'  execute immediate q''[begin :ver := blog_util.get_param_value(''SCHEMA_VERSION''); end;]'' using out l_ver;',
'  return case when l_ver is null then true else false end;',
'exception when others then',
'  return true;',
'end;'))
,p_failure_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Target schema contain one or more object named like ''BLOG%''. Install script can''t determine installed version.',
'Rename or remove objects before installing this application. You can find objects when query system view USER_OBJECTS.'))
);
wwv_flow_api.create_install_check(
 p_id=>wwv_flow_api.id(39896040483884661945)
,p_install_id=>wwv_flow_api.id(39886630176487953529)
,p_name=>'Reader and administration application''s installed'
,p_sequence=>30
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select 1',
'from apex_applications',
'where application_group = ''Blog''',
'and version in (''a2.9.0.2'', ''r2.9.0.2'')',
'and application_name in(''Blog Administration'', ''Blog Reader'')',
'having count(1) = 2'))
,p_failure_message=>'The blog reader and administration application''s must be installed before installing supporting objects.'
);
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
