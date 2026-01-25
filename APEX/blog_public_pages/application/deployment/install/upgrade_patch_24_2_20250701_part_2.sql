prompt --application/deployment/install/upgrade_patch_24_2_20250701_part_2
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 24.2.20250701 part 2
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(90182232938660798)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Patch 24.2.20250701 part 2'
,p_sequence=>80
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20250701'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 24.2.20250701 part 2',
'-- Update BLOG_COMMENTS comment preview',
'alter trigger blog_comments_trg disable',
'/',
'update blog_comments',
'  set comment_preview = blog_comment.short_text( body_html )',
'/',
'alter table blog_comments modify comment_preview not null',
'/',
'alter trigger blog_comments_trg enable',
'/',
'-- Truncate table BLOG_INIT_ITEMS',
'truncate table blog_init_items;',
'-- Update BLOG_SETTINGS',
'update blog_settings',
'  set attribute_name = ''P0_BLOG_APP_NAME''',
'where attribute_name = ''BLOG_APP_NAME''',
'/',
'update blog_settings',
'  set attribute_name = ''P0_BLOG_APP_DESC''',
'where attribute_name = ''BLOG_APP_DESC''',
'/',
'-- Set user date format preferences',
'begin',
'  for c1 in(',
'    select',
'      user_name',
'    , preference_name',
'    , preference_value',
'    from apex_workspace_preferences',
'    where 1 = 1',
'      and preference_name in( ''BLOG_DISPLAY_DATE_FORMAT'', ''BLOG_INPUT_DATE_FORMAT'' )',
'  ) loop',
'    apex_util.set_preference(',
'      p_preference =>',
'        case c1.preference_name',
'          when ''BLOG_DISPLAY_DATE_FORMAT''',
'            then ''PERSISTENT_ITEM_P501_DISPLAY_DATE_FORMAT''',
'          else ''PERSISTENT_ITEM_P501_INPUT_DATE_FORMAT''',
'        end',
'    , p_value      => c1.preference_value',
'    , p_user       => c1.user_name',
'    );',
'    apex_util.remove_preference(',
'      p_preference => c1.preference_name',
'    , p_user       => c1.user_name',
'    );',
'  end loop;',
'end;',
'/',
'-- Update and insert metadata',
'begin',
'-- BLOG_FEATURES',
'  blog_install.features_merge(''BLOG_FEATURE_OCI_OBJECT_STORAGE'',1,10,''INTERNAL'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_POST_SPEECH'',1,20,''INTERNAL'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_GENERATIVE_AI'',1,30,''INTERNAL'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_LANGUAGE_AI'',1,40,''INTERNAL'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_LINKS'',1,1110,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_FILES'',1,1120,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_ABOUT'',1,1130,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SEARCH'',1,1140,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SEARCH_POSTS'',1,1150,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SEARCH_COMMENTS'',1,1160,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SEARCH_LINKS'',1,1170,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SEARCH_FILES'',1,1180,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_LATEST_POSTS'',1,1220,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_CATEGORY'',1,1230,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_CATEGORY_POST_COUNT'',1,1240,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_FEATURE_CATEGORY'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_ARCHIVE'',1,1250,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_ARCHIVE_POST_COUNT'',1,1260,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_FEATURE_ARCHIVE'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_TAG_CLOUD'',1,1270,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'',1,1280,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_FEATURE_TAG_CLOUD'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_RSS'',1,1290,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_POST_PAGINATION'',1,1310,''BLOG_FEATURE_GROUP_POST'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_ALLOW_COMMENTS'',1,1410,''BLOG_FEATURE_GROUP_COMMENTS'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SUBSCRIBE_COMMENTS'',1,1420,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_COMMENT_VERIFY'',1,1430,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_MODERATE_COMMENTS'',1,1440,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'',null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_MODERATE_COMMENTS_AI'',1,1450,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_MODERATE_COMMENTS'',''BLOG_FEATURE_LANGUAGE_AI'',''INCLUDE'');',
'  blog_install.features_merge(''BLOG_FEATURE_MODAL_PAGES'',1,1510,''BLOG_FEATURE_GROUP_MISC'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_SITEMAP'',1,1520,''BLOG_FEATURE_GROUP_MISC'',null,null,null);',
'  blog_install.features_merge(''BLOG_FEATURE_ATOM'',1,1530,''BLOG_FEATURE_GROUP_MISC'',null,null,null);',
'-- BLOG_SETTIGS',
'  blog_install.settings_merge(''G_APP_VERSION'',10,0,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_PUB_APP_ID'',20,0,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_ADMIN_APP_ID'',30,0,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_OS_PROXY_URL'',40,1,''URL'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_OS_NAMESPACE'',50,1,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_OS_REGION'',60,1,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_OS_BUCKET'',70,1,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_OS_BUCKET_URL'',80,1,''URL'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_OCI_LANG_AI_COMPARTMENT_OCID'',90,1,''STRING'',''INTERNAL'',null,null,null,null);',
'  blog_install.settings_merge(''P0_BLOG_APP_NAME'',1110,0,''STRING'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null,null);',
'  blog_install.settings_merge(''P0_BLOG_APP_DESC'',1120,0,''STRING'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null,null);',
'  blog_install.settings_merge(''G_APP_EMAIL'',1130,1,''EMAIL'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null,null);',
'  blog_install.settings_merge(''P0_BLOG_APP_DATE_FORMAT'',1210,0,''DATE_FORMAT'',''BLOG_SETTING_GROUP_UI'',null,null,null,null);',
'  blog_install.settings_merge(''P0_BLOG_POST_DATE_FORMAT'',1220,0,''DATE_FORMAT'',''BLOG_SETTING_GROUP_UI'',null,null,null,null);',
'  blog_install.settings_merge(''P1_BLOG_POST_ROWS'',1310,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,null,null);',
'  blog_install.settings_merge(''P2_BLOG_COMMENT_ROWS'',1320,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,null,null);',
'  blog_install.settings_merge(''G_LATEST_POST_ROWS'',1330,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,20,null,null);',
'  blog_install.settings_merge(''P0_BLOG_SEARCH_ROWS'',1340,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,null,null);',
'  blog_install.settings_merge(''G_COMMENT_WATCH_MONTHS'',1410,0,''INTEGER'',''BLOG_SETTING_GROUP_COMMENTS'',1,6,null,null);',
'  blog_install.settings_merge(''G_MAX_AGE_DOWNLOAD'',1510,0,''INTEGER'',''BLOG_SETTING_GROUP_FILE_REPO'',0,31536000,''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'');',
'  blog_install.settings_merge(''G_MAX_AGE_FILE'',1520,0,''INTEGER'',''BLOG_SETTING_GROUP_FILE_REPO'',0,31536000,''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'');',
'  blog_install.settings_merge(''G_MAX_AGE_SITEMAP'',1610,0,''INTEGER'',''BLOG_SETTING_GROUP_SITEMAP'',0,31536000,null,null);',
'  blog_install.settings_merge(''G_MAX_AGE_RSS'',1710,0,''INTEGER'',''BLOG_SETTING_GROUP_RSS'',0,31536000,null,null);',
'  blog_install.settings_merge(''G_MAX_AGE_RSS_XSL'',1720,0,''INTEGER'',''BLOG_SETTING_GROUP_RSS'',0,31536000,null,null);',
'  blog_install.settings_merge(''G_RSS_URL'',1730,1,''URL'',''BLOG_SETTING_GROUP_RSS'',null,null,null,null);',
'  blog_install.settings_merge(''G_RSS_XSL_URL'',1740,1,''URL'',''BLOG_SETTING_GROUP_RSS'',null,null,null,null);',
'  blog_install.settings_merge(''G_CANONICAL_HOST'',1810,1,''URL'',''BLOG_SETTING_GROUP_SEO'',null,null,null,null);',
'-- BLOG_INIT_ITEMS',
'  blog_install.init_items_ins;',
'-- Insert patch version info to BLOG_SETTINGS',
'  blog_install.settings_merge(''PATCH_20250701'',10,0,''STRING'',''INTERNAL'',null,null,null,null,''Patch 24.2.20250701'');',
'end;',
'/',
''))
,p_updated_on=>wwv_flow_imp.dz('20260125213159Z')
);
wwv_flow_imp.component_end;
end;
/
