prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(160391022496518031)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Metadata'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'-- Inserting into BLOG_SETTINGS',
'blog_install.settings_ins(10,0,''G_APP_VERSION'',''STRING'',''INTERNAL'',''Release 24.2.0.20250511'',null,null);',
'blog_install.settings_ins(20,0,''G_PUB_APP_ID'',''STRING'',''INTERNAL'',blog_util.int_to_vc2(apex_application_install.get_application_id),null,null);',
'blog_install.settings_ins(110,0,''P0_BLOG_APP_NAME'',''STRING'',''BLOG_SETTING_GROUP_GENERAL'',''My Blog'',null,null);',
'blog_install.settings_ins(120,0,''P0_BLOG_APP_DESC'',''STRING'',''BLOG_SETTING_GROUP_GENERAL'',''About Almost Everything'',null,null);',
'blog_install.settings_ins(130,1,''G_APP_EMAIL'',''EMAIL'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null);',
'blog_install.settings_ins(210,0,''P0_BLOG_APP_DATE_FORMAT'',''DATE_FORMAT'',''BLOG_SETTING_GROUP_UI'',''fmDD Mon YYYY'',null,null);',
'blog_install.settings_ins(220,0,''P0_BLOG_POST_DATE_FORMAT'',''DATE_FORMAT'',''BLOG_SETTING_GROUP_UI'',''fmDay, Month DD, YYYY'',null,null);',
'blog_install.settings_ins(310,0,''P1_BLOG_POST_ROWS'',''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',''5'',1,50);',
'blog_install.settings_ins(320,0,''P2_BLOG_COMMENT_ROWS'',''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',''10'',1,50);',
'blog_install.settings_ins(330,0,''G_LATEST_POST_ROWS'',''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',''5'',1,20);',
'blog_install.settings_ins(340,0,''P0_BLOG_SEARCH_ROWS'',''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',''10'',1,50);',
'blog_install.settings_ins(410,0,''G_COMMENT_WATCH_MONTHS'',''INTEGER'',''BLOG_SETTING_GROUP_COMMENTS'',''1'',1,6);',
'blog_install.settings_ins(510,0,''G_MAX_AGE_DOWNLOAD'',''INTEGER'',''BLOG_SETTING_GROUP_FILE_REPO'',''14400'',0,31536000);',
'blog_install.settings_ins(520,0,''G_MAX_AGE_FILE'',''INTEGER'',''BLOG_SETTING_GROUP_FILE_REPO'',''604800'',0,31536000);',
'blog_install.settings_ins(610,0,''G_MAX_AGE_SITEMAP'',''INTEGER'',''BLOG_SETTING_GROUP_SITEMAP'',''3600'',0,31536000);',
'blog_install.settings_ins(710,0,''G_MAX_AGE_RSS'',''INTEGER'',''BLOG_SETTING_GROUP_RSS'',''3600'',0,31536000);',
'blog_install.settings_ins(720,0,''G_MAX_AGE_RSS_XSL'',''INTEGER'',''BLOG_SETTING_GROUP_RSS'',''604800'',0,31536000);',
'blog_install.settings_ins(730,1,''G_RSS_URL'',''URL'',''BLOG_SETTING_GROUP_RSS'',null,null,null);',
'blog_install.settings_ins(740,1,''G_RSS_XSL_URL'',''URL'',''BLOG_SETTING_GROUP_RSS'',null,null,null);',
'blog_install.settings_ins(810,1,''G_CANONICAL_HOST'',''URL'',''BLOG_SETTING_GROUP_SEO'',null,null,null);',
'blog_install.settings_ins(1110,1,''G_OCI_OS_PROXY_URL'',''URL'',''INTERNAL'',null,null,null);',
'blog_install.settings_ins(1120,1,''G_OCI_OS_NAMESPACE'',''STRING'',''INTERNAL'',null,null,null);',
'blog_install.settings_ins(1130,1,''G_OCI_OS_REGION'',''STRING'',''INTERNAL'',null,null,null);',
'blog_install.settings_ins(1140,1,''G_OCI_OS_BUCKET'',''STRING'',''INTERNAL'',null,null,null);',
'blog_install.settings_ins(1150,1,''G_OCI_OS_BUCKET_URL'',''URL'',''INTERNAL'',null,null,null);',
'blog_install.settings_ins(1160,1,''G_OCI_LANG_AI_COMPARTMENT_OCID'',''STRING'',''INTERNAL'',null,null,null);',
'-- Inserting into BLOG_SETTING_FEATURES',
'blog_install.setting_features_ins(''G_MAX_AGE_DOWNLOAD'',''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'');',
'blog_install.setting_features_ins(''G_MAX_AGE_FILE'',''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'');',
'-- Inserting into BLOG_FEATURES',
'blog_install.features_ins(1,110,''BLOG_FEATURE_LINKS'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,120,''BLOG_FEATURE_FILES'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,130,''BLOG_FEATURE_ABOUT'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,140,''BLOG_FEATURE_SEARCH'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,150,''BLOG_FEATURE_SEARCH_POSTS'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,160,''BLOG_FEATURE_SEARCH_COMMENTS'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,170,''BLOG_FEATURE_SEARCH_LINKS'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,180,''BLOG_FEATURE_SEARCH_FILES'',''BLOG_FEATURE_GROUP_PAGE'');',
'blog_install.features_ins(1,220,''BLOG_FEATURE_LATEST_POSTS'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,230,''BLOG_FEATURE_CATEGORY'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,240,''BLOG_FEATURE_CATEGORY_POST_COUNT'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,250,''BLOG_FEATURE_ARCHIVE'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,260,''BLOG_FEATURE_ARCHIVE_POST_COUNT'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,270,''BLOG_FEATURE_TAG_CLOUD'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,280,''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,290,''BLOG_FEATURE_RSS'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'');',
'blog_install.features_ins(1,310,''BLOG_FEATURE_POST_PAGINATION'',''BLOG_FEATURE_GROUP_POST'');',
'blog_install.features_ins(1,410,''BLOG_FEATURE_ALLOW_COMMENTS'',''BLOG_FEATURE_GROUP_COMMENTS'');',
'blog_install.features_ins(1,420,''BLOG_FEATURE_SUBSCRIBE_COMMENTS'',''BLOG_FEATURE_GROUP_COMMENTS'');',
'blog_install.features_ins(1,430,''BLOG_FEATURE_COMMENT_VERIFY'',''BLOG_FEATURE_GROUP_COMMENTS'');',
'blog_install.features_ins(1,440,''BLOG_FEATURE_MODERATE_COMMENTS'',''BLOG_FEATURE_GROUP_COMMENTS'');',
'blog_install.features_ins(1,450,''BLOG_FEATURE_MODERATE_COMMENTS_AI'',''BLOG_FEATURE_GROUP_COMMENTS'');',
'blog_install.features_ins(1,510,''BLOG_FEATURE_MODAL_PAGES'',''BLOG_FEATURE_GROUP_MISC'');',
'blog_install.features_ins(1,520,''BLOG_FEATURE_SITEMAP'',''BLOG_FEATURE_GROUP_MISC'');',
'blog_install.features_ins(1,530,''BLOG_FEATURE_ATOM'',''BLOG_FEATURE_GROUP_MISC'');',
'-- Inserting into BLOG_FEATURE_PARENTS',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_ARCHIVE_POST_COUNT'',''BLOG_FEATURE_ARCHIVE'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_CATEGORY_POST_COUNT'',''BLOG_FEATURE_CATEGORY'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_COMMENT_VERIFY'',''BLOG_FEATURE_ALLOW_COMMENTS'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_MODERATE_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_MODERATE_COMMENTS_AI'',''BLOG_FEATURE_MODERATE_COMMENTS'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_SEARCH_COMMENTS'',''BLOG_FEATURE_SEARCH'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_SEARCH_FILES'',''BLOG_FEATURE_SEARCH'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_SEARCH_LINKS'',''BLOG_FEATURE_SEARCH'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_SEARCH_POSTS'',''BLOG_FEATURE_SEARCH'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_SUBSCRIBE_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'');',
'blog_install.feature_parents_ins(1,''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'',''BLOG_FEATURE_TAG_CLOUD'');',
'-- Inserting into BLOG_LIST_OF_VALUES',
'blog_install.list_of_values_ins(1,10,''COMMENT_FLAG'',''NEW'',''BLOG_LOV_COMMENT_FLAG_NEW'');',
'blog_install.list_of_values_ins(1,20,''COMMENT_FLAG'',''UNREAD'',''BLOG_LOV_COMMENT_FLAG_UNREAD'');',
'blog_install.list_of_values_ins(1,30,''COMMENT_FLAG'',''REPLY'',''BLOG_LOV_COMMENT_FLAG_REPLY'');',
'blog_install.list_of_values_ins(1,40,''COMMENT_FLAG'',''READ'',''BLOG_LOV_COMMENT_FLAG_READ'');',
'blog_install.list_of_values_ins(1,10,''COMMENT_STATUS'',''ENABLED'',''BLOG_TXT_ENABLED'');',
'blog_install.list_of_values_ins(1,20,''COMMENT_STATUS'',''DISABLED'',''BLOG_TXT_DISABLED'');',
'blog_install.list_of_values_ins(1,30,''COMMENT_STATUS'',''MODERATE'',''BLOG_LOV_COMMENT_STATUS_MODERATE'');',
'blog_install.list_of_values_ins(1,10,''IS_ACTIVE'',''1'',''BLOG_TXT_ENABLED'');',
'blog_install.list_of_values_ins(1,20,''IS_ACTIVE'',''0'',''BLOG_TXT_DISABLED'');',
'blog_install.list_of_values_ins(1,10,''LINK_STATUS'',''ENABLED'',''BLOG_TXT_ENABLED'');',
'blog_install.list_of_values_ins(1,20,''LINK_STATUS'',''DISABLED'',''BLOG_TXT_DISABLED'');',
'blog_install.list_of_values_ins(1,30,''LINK_STATUS'',''GROUP_DISABLED'',''BLOG_LOV_LINK_STATUS_GROUP_DISABLED'');',
'blog_install.list_of_values_ins(1,10,''POST_STATUS'',''PUBLISHED'',''BLOG_LOV_POST_STATUS_PUBLISHED'');',
'blog_install.list_of_values_ins(1,20,''POST_STATUS'',''SCHEDULED'',''BLOG_LOV_POST_STATUS_SCHEDULED'');',
'blog_install.list_of_values_ins(1,30,''POST_STATUS'',''DRAFT'',''BLOG_LOV_POST_STATUS_DRAFT'');',
'blog_install.list_of_values_ins(1,40,''POST_STATUS'',''CATEGORY_DISABLED'',''BLOG_LOV_POST_STATUS_CATEGORY_DISABLED'');',
'blog_install.list_of_values_ins(1,50,''POST_STATUS'',''BLOGGER_DISABLED'',''BLOG_LOV_POST_STATUS_BLOGGER_DISABLED'');',
'blog_install.list_of_values_ins(1,10,''YES_NO'',''0'',''BLOG_LOV_YES_NO_NO'');',
'blog_install.list_of_values_ins(1,20,''YES_NO'',''1'',''BLOG_LOV_YES_NO_YES'');',
'-- Inserting into BLOG_INIT_ITEMS',
'blog_install.init_items_ins;',
'end;',
'/',
''))
,p_updated_on=>wwv_flow_imp.dz('20250511050055Z')
);
wwv_flow_imp.component_end;
end;
/
