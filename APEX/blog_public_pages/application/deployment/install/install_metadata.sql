prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'begin'||wwv_flow.LF||
'-- Inserting into BLOG_FEATURES'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_OCI_OBJECT_STORAGE'',';
wwv_flow_imp.g_varchar2_table(2) := '1,10,''INTERNAL'',null,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_POST_SPEECH'',1,20,''INTERN';
wwv_flow_imp.g_varchar2_table(3) := 'AL'',null,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_GENERATIVE_AI'',1,30,''INTERNAL'',null,n';
wwv_flow_imp.g_varchar2_table(4) := 'ull,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_LANGUAGE_AI'',1,40,''INTERNAL'',null,null,null);'||wwv_flow.LF||
'b';
wwv_flow_imp.g_varchar2_table(5) := 'log_install.features_merge(''BLOG_FEATURE_LINKS'',1,1110,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);'||wwv_flow.LF||
'bl';
wwv_flow_imp.g_varchar2_table(6) := 'og_install.features_merge(''BLOG_FEATURE_FILES'',1,1120,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);'||wwv_flow.LF||
'blo';
wwv_flow_imp.g_varchar2_table(7) := 'g_install.features_merge(''BLOG_FEATURE_ABOUT'',1,1130,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);'||wwv_flow.LF||
'blog';
wwv_flow_imp.g_varchar2_table(8) := '_install.features_merge(''BLOG_FEATURE_SEARCH'',1,1140,''BLOG_FEATURE_GROUP_PAGE'',null,null,null);'||wwv_flow.LF||
'blog';
wwv_flow_imp.g_varchar2_table(9) := '_install.features_merge(''BLOG_FEATURE_SEARCH_POSTS'',1,1150,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_S';
wwv_flow_imp.g_varchar2_table(10) := 'EARCH'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_SEARCH_COMMENTS'',1,1160,''BLOG_FEATURE_G';
wwv_flow_imp.g_varchar2_table(11) := 'ROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_SEARCH_LINKS''';
wwv_flow_imp.g_varchar2_table(12) := ',1,1170,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLO';
wwv_flow_imp.g_varchar2_table(13) := 'G_FEATURE_SEARCH_FILES'',1,1180,''BLOG_FEATURE_GROUP_PAGE'',''BLOG_FEATURE_SEARCH'',null,null);'||wwv_flow.LF||
'blog_inst';
wwv_flow_imp.g_varchar2_table(14) := 'all.features_merge(''BLOG_FEATURE_LATEST_POSTS'',1,1220,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,nu';
wwv_flow_imp.g_varchar2_table(15) := 'll);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_CATEGORY'',1,1230,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',nu';
wwv_flow_imp.g_varchar2_table(16) := 'll,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_CATEGORY_POST_COUNT'',1,1240,''BLOG_FEATURE_G';
wwv_flow_imp.g_varchar2_table(17) := 'ROUP_RIGHT_COLUMN'',''BLOG_FEATURE_CATEGORY'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_ARC';
wwv_flow_imp.g_varchar2_table(18) := 'HIVE'',1,1250,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FE';
wwv_flow_imp.g_varchar2_table(19) := 'ATURE_ARCHIVE_POST_COUNT'',1,1260,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_FEATURE_ARCHIVE'',null,null)';
wwv_flow_imp.g_varchar2_table(20) := ';'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_TAG_CLOUD'',1,1270,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null';
wwv_flow_imp.g_varchar2_table(21) := ',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'',1,1280,''BLOG_FEATURE_GR';
wwv_flow_imp.g_varchar2_table(22) := 'OUP_RIGHT_COLUMN'',''BLOG_FEATURE_TAG_CLOUD'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_RSS';
wwv_flow_imp.g_varchar2_table(23) := ''',1,1290,''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',null,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATUR';
wwv_flow_imp.g_varchar2_table(24) := 'E_POST_PAGINATION'',1,1310,''BLOG_FEATURE_GROUP_POST'',null,null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BL';
wwv_flow_imp.g_varchar2_table(25) := 'OG_FEATURE_ALLOW_COMMENTS'',1,1410,''BLOG_FEATURE_GROUP_COMMENTS'',null,null,null);'||wwv_flow.LF||
'blog_install.featur';
wwv_flow_imp.g_varchar2_table(26) := 'es_merge(''BLOG_FEATURE_SUBSCRIBE_COMMENTS'',1,1420,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_';
wwv_flow_imp.g_varchar2_table(27) := 'COMMENTS'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE_COMMENT_VERIFY'',1,1430,''BLOG_FEATURE';
wwv_flow_imp.g_varchar2_table(28) := '_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'',null,null);'||wwv_flow.LF||
'blog_install.features_merge(''BLOG_FEATURE';
wwv_flow_imp.g_varchar2_table(29) := '_MODERATE_COMMENTS'',1,1440,''BLOG_FEATURE_GROUP_COMMENTS'',''BLOG_FEATURE_ALLOW_COMMENTS'',null,null);'||wwv_flow.LF||
'b';
wwv_flow_imp.g_varchar2_table(30) := 'log_install.features_merge(''BLOG_FEATURE_MODERATE_COMMENTS_AI'',1,1450,''BLOG_FEATURE_GROUP_COMMENTS'',';
wwv_flow_imp.g_varchar2_table(31) := '''BLOG_FEATURE_MODERATE_COMMENTS'',''BLOG_FEATURE_LANGUAGE_AI'',''INCLUDE'');'||wwv_flow.LF||
'blog_install.features_merge(';
wwv_flow_imp.g_varchar2_table(32) := '''BLOG_FEATURE_MODAL_PAGES'',1,1510,''BLOG_FEATURE_GROUP_MISC'',null,null,null);'||wwv_flow.LF||
'blog_install.features_m';
wwv_flow_imp.g_varchar2_table(33) := 'erge(''BLOG_FEATURE_SITEMAP'',1,1520,''BLOG_FEATURE_GROUP_MISC'',null,null,null);'||wwv_flow.LF||
'blog_install.features_';
wwv_flow_imp.g_varchar2_table(34) := 'merge(''BLOG_FEATURE_ATOM'',1,1530,''BLOG_FEATURE_GROUP_MISC'',null,null,null);'||wwv_flow.LF||
'-- Inserting into BLOG_S';
wwv_flow_imp.g_varchar2_table(35) := 'ETTINGS'||wwv_flow.LF||
'blog_install.settings_merge(''G_APP_VERSION'',10,0,''STRING'',''INTERNAL'',null,null,null,null,''Re';
wwv_flow_imp.g_varchar2_table(36) := 'lease 24.2.11.20260126'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_PUB_APP_ID'',20,0,''STRING'',''INTERNAL'',null,n';
wwv_flow_imp.g_varchar2_table(37) := 'ull,null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));'||wwv_flow.LF||
'blog_install.setti';
wwv_flow_imp.g_varchar2_table(38) := 'ngs_merge(''G_OCI_OS_PROXY_URL'',40,1,''URL'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.setting';
wwv_flow_imp.g_varchar2_table(39) := 's_merge(''G_OCI_OS_NAMESPACE'',50,1,''STRING'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settin';
wwv_flow_imp.g_varchar2_table(40) := 'gs_merge(''G_OCI_OS_REGION'',60,1,''STRING'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings';
wwv_flow_imp.g_varchar2_table(41) := '_merge(''G_OCI_OS_BUCKET'',70,1,''STRING'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings_m';
wwv_flow_imp.g_varchar2_table(42) := 'erge(''G_OCI_OS_BUCKET_URL'',80,1,''URL'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings_me';
wwv_flow_imp.g_varchar2_table(43) := 'rge(''G_OCI_LANG_AI_COMPARTMENT_OCID'',90,1,''STRING'',''INTERNAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_instal';
wwv_flow_imp.g_varchar2_table(44) := 'l.settings_merge(''P0_BLOG_APP_NAME'',1110,0,''STRING'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null,null';
wwv_flow_imp.g_varchar2_table(45) := ',''My Blog'');'||wwv_flow.LF||
'blog_install.settings_merge(''P0_BLOG_APP_DESC'',1120,0,''STRING'',''BLOG_SETTING_GROUP_GENE';
wwv_flow_imp.g_varchar2_table(46) := 'RAL'',null,null,null,null,''About Almost Everything'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_APP_EMAIL'',1130,';
wwv_flow_imp.g_varchar2_table(47) := '1,''EMAIL'',''BLOG_SETTING_GROUP_GENERAL'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings_merge(''P0_BL';
wwv_flow_imp.g_varchar2_table(48) := 'OG_APP_DATE_FORMAT'',1210,0,''DATE_FORMAT'',''BLOG_SETTING_GROUP_UI'',null,null,null,null,''fmDD Mon YYYY''';
wwv_flow_imp.g_varchar2_table(49) := ');'||wwv_flow.LF||
'blog_install.settings_merge(''P0_BLOG_POST_DATE_FORMAT'',1220,0,''DATE_FORMAT'',''BLOG_SETTING_GROUP_U';
wwv_flow_imp.g_varchar2_table(50) := 'I'',null,null,null,null,''fmDay, Month DD, YYYY'');'||wwv_flow.LF||
'blog_install.settings_merge(''P1_BLOG_POST_ROWS'',131';
wwv_flow_imp.g_varchar2_table(51) := '0,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,null,null,''5'');'||wwv_flow.LF||
'blog_install.settings_merge(''P2_BLOG';
wwv_flow_imp.g_varchar2_table(52) := '_COMMENT_ROWS'',1320,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,null,null,''10'');'||wwv_flow.LF||
'blog_install.sett';
wwv_flow_imp.g_varchar2_table(53) := 'ings_merge(''G_LATEST_POST_ROWS'',1330,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,20,null,null,''5'');'||wwv_flow.LF||
'b';
wwv_flow_imp.g_varchar2_table(54) := 'log_install.settings_merge(''P0_BLOG_SEARCH_ROWS'',1340,0,''INTEGER'',''BLOG_SETTING_GROUP_REPORTS'',1,50,';
wwv_flow_imp.g_varchar2_table(55) := 'null,null,''10'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_COMMENT_WATCH_MONTHS'',1410,0,''INTEGER'',''BLOG_SETTING';
wwv_flow_imp.g_varchar2_table(56) := '_GROUP_COMMENTS'',1,6,null,null,''1'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_MAX_AGE_DOWNLOAD'',1510,0,''INTEGE';
wwv_flow_imp.g_varchar2_table(57) := 'R'',''BLOG_SETTING_GROUP_FILE_REPO'',0,31536000,''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'',''14400'');'||wwv_flow.LF||
'b';
wwv_flow_imp.g_varchar2_table(58) := 'log_install.settings_merge(''G_MAX_AGE_FILE'',1520,0,''INTEGER'',''BLOG_SETTING_GROUP_FILE_REPO'',0,315360';
wwv_flow_imp.g_varchar2_table(59) := '00,''BLOG_FEATURE_OCI_OBJECT_STORAGE'',''EXCLUDE'',''604800'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_MAX_AGE_SIT';
wwv_flow_imp.g_varchar2_table(60) := 'EMAP'',1610,0,''INTEGER'',''BLOG_SETTING_GROUP_SITEMAP'',0,31536000,null,null,''3600'');'||wwv_flow.LF||
'blog_install.setti';
wwv_flow_imp.g_varchar2_table(61) := 'ngs_merge(''G_MAX_AGE_RSS'',1710,0,''INTEGER'',''BLOG_SETTING_GROUP_RSS'',0,31536000,null,null,''3600'');'||wwv_flow.LF||
'bl';
wwv_flow_imp.g_varchar2_table(62) := 'og_install.settings_merge(''G_MAX_AGE_RSS_XSL'',1720,0,''INTEGER'',''BLOG_SETTING_GROUP_RSS'',0,31536000,n';
wwv_flow_imp.g_varchar2_table(63) := 'ull,null,''604800'');'||wwv_flow.LF||
'blog_install.settings_merge(''G_RSS_URL'',1730,1,''URL'',''BLOG_SETTING_GROUP_RSS'',nu';
wwv_flow_imp.g_varchar2_table(64) := 'll,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings_merge(''G_RSS_XSL_URL'',1740,1,''URL'',''BLOG_SETTING_GROU';
wwv_flow_imp.g_varchar2_table(65) := 'P_RSS'',null,null,null,null,null);'||wwv_flow.LF||
'blog_install.settings_merge(''G_CANONICAL_HOST'',1810,1,''URL'',''BLOG_';
wwv_flow_imp.g_varchar2_table(66) := 'SETTING_GROUP_SEO'',null,null,null,null,null);'||wwv_flow.LF||
'-- Inserting into BLOG_LIST_OF_VALUES'||wwv_flow.LF||
'blog_install.lis';
wwv_flow_imp.g_varchar2_table(67) := 't_of_values_ins(1,10,''COMMENT_FLAG'',''NEW'',''BLOG_LOV_COMMENT_FLAG_NEW'');'||wwv_flow.LF||
'blog_install.list_of_values_';
wwv_flow_imp.g_varchar2_table(68) := 'ins(1,20,''COMMENT_FLAG'',''UNREAD'',''BLOG_LOV_COMMENT_FLAG_UNREAD'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,';
wwv_flow_imp.g_varchar2_table(69) := '30,''COMMENT_FLAG'',''REPLY'',''BLOG_LOV_COMMENT_FLAG_REPLY'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,40,''COMM';
wwv_flow_imp.g_varchar2_table(70) := 'ENT_FLAG'',''READ'',''BLOG_LOV_COMMENT_FLAG_READ'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,10,''COMMENT_STATUS';
wwv_flow_imp.g_varchar2_table(71) := ''',''ENABLED'',''BLOG_TXT_ENABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,20,''COMMENT_STATUS'',''DISABLED'',''B';
wwv_flow_imp.g_varchar2_table(72) := 'LOG_TXT_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,30,''COMMENT_STATUS'',''MODERATE'',''BLOG_LOV_COMME';
wwv_flow_imp.g_varchar2_table(73) := 'NT_STATUS_MODERATE'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,10,''IS_ACTIVE'',''1'',''BLOG_TXT_ENABLED'');'||wwv_flow.LF||
'blog';
wwv_flow_imp.g_varchar2_table(74) := '_install.list_of_values_ins(1,20,''IS_ACTIVE'',''0'',''BLOG_TXT_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_i';
wwv_flow_imp.g_varchar2_table(75) := 'ns(1,10,''LINK_STATUS'',''ENABLED'',''BLOG_TXT_ENABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,20,''LINK_STAT';
wwv_flow_imp.g_varchar2_table(76) := 'US'',''DISABLED'',''BLOG_TXT_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,30,''LINK_STATUS'',''GROUP_DISAB';
wwv_flow_imp.g_varchar2_table(77) := 'LED'',''BLOG_LOV_LINK_STATUS_GROUP_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,10,''POST_STATUS'',''PUB';
wwv_flow_imp.g_varchar2_table(78) := 'LISHED'',''BLOG_LOV_POST_STATUS_PUBLISHED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,20,''POST_STATUS'',''SCHED';
wwv_flow_imp.g_varchar2_table(79) := 'ULED'',''BLOG_LOV_POST_STATUS_SCHEDULED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,30,''POST_STATUS'',''DRAFT'',';
wwv_flow_imp.g_varchar2_table(80) := '''BLOG_LOV_POST_STATUS_DRAFT'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,40,''POST_STATUS'',''CATEGORY_DISABLED';
wwv_flow_imp.g_varchar2_table(81) := ''',''BLOG_LOV_POST_STATUS_CATEGORY_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,50,''POST_STATUS'',''BLO';
wwv_flow_imp.g_varchar2_table(82) := 'GGER_DISABLED'',''BLOG_LOV_POST_STATUS_BLOGGER_DISABLED'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,10,''YES_N';
wwv_flow_imp.g_varchar2_table(83) := 'O'',''0'',''BLOG_LOV_YES_NO_NO'');'||wwv_flow.LF||
'blog_install.list_of_values_ins(1,20,''YES_NO'',''1'',''BLOG_LOV_YES_NO_YES';
wwv_flow_imp.g_varchar2_table(84) := ''');'||wwv_flow.LF||
'-- Inserting into BLOG_INIT_ITEMS'||wwv_flow.LF||
'blog_install.init_items_ins;'||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(160391022496518031)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Metadata'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260125233044Z')
);
wwv_flow_imp.component_end;
end;
/
