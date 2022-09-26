prompt --application/deployment/install/upgrade_patch_21_2_20220415
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 21.2.20220415
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(11491835317501495)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 21.2.20220415'
,p_sequence=>20
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date <= 20220415'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 21.2.20220415',
'--------------------------------------------------------',
'--  Modify constraint BLOG_COMMENT_FLAGS_CK2',
'--------------------------------------------------------',
'alter table blog_comment_flags drop constraint blog_comment_flags_ck2',
';',
'alter table blog_comment_flags add constraint blog_comment_flags_ck2 check( flag in( ''NEW'', ''UNREAD'', ''MODERATE'') )',
';',
'--------------------------------------------------------',
'--  Modify constraint BLOG_COMMENTS_FK1',
'--------------------------------------------------------',
'alter table blog_comments drop constraint blog_comments_fk1',
';',
'alter table blog_comments add constraint blog_comments_fk1 foreign key (post_id) references blog_posts (id)',
';',
'--------------------------------------------------------',
'--  Modify constraint BLOG_COMMENTS_FK1',
'--------------------------------------------------------',
'alter table blog_comments drop constraint blog_comments_fk2',
';',
'alter table blog_comments add constraint blog_comments_fk2 foreign key (parent_id) references blog_comments (id)',
';',
'--------------------------------------------------------',
'--  Update metadata',
'--------------------------------------------------------',
'-- update BLOG_SETTINGS',
'update blog_settings',
'  set display_seq = 20',
'  ,is_nullable = 0',
' where attribute_name = ''G_PUB_APP_ID''',
';',
'update blog_settings',
'  set display_seq = 30',
'    ,is_nullable = 0',
' where attribute_name = ''G_ADMIN_APP_ID''',
';',
'update blog_settings',
'  set display_seq = 40',
' where attribute_name = ''G_COMMENT_WATCH_MONTHS''',
';',
'update blog_settings',
'  set display_seq = 110',
' where attribute_name = ''G_APP_NAME''',
';',
'update blog_settings',
'  set display_seq = 120',
' where attribute_name = ''G_APP_DESC''',
';',
'update blog_settings',
'  set display_seq = 130',
' where attribute_name = ''G_APP_EMAIL''',
';',
'update blog_settings',
'  set display_seq = 220',
' where attribute_name = ''G_POST_TITLE_DATE_FORMAT''',
';',
'update blog_settings',
'  set display_seq = 310',
' where attribute_name = ''P1_REPORT_ROWS''',
';',
'update blog_settings',
'  set display_seq = 320',
' where attribute_name = ''P2_REPORT_ROWS''',
';',
'update blog_settings',
'  set display_seq = 330',
' where attribute_name = ''G_LATEST_POST_ROWS''',
';',
'update blog_settings',
'  set display_seq = 340',
' where attribute_name = ''G_SEARCH_ROWS''',
';',
'-- update BLOG_FEATURES',
'update blog_features',
'  set display_seq = 100',
' where build_option_name = ''BLOG_FEATURE_LINKS''',
';',
'update blog_features',
'  set display_seq = 110',
' where build_option_name = ''BLOG_FEATURE_SEARCH_LINKS''',
';',
'update blog_features',
'  set display_seq = 120',
' where build_option_name = ''BLOG_FEATURE_FILES''',
';',
'update blog_features',
'  set display_seq = 130',
' where build_option_name = ''BLOG_FEATURE_SEARCH_FILES''',
';',
'update blog_features',
'  set display_seq = 140',
' where build_option_name = ''BLOG_FEATURE_ABOUT''',
';',
'update blog_features',
'  set display_seq = 210',
' where build_option_name = ''BLOG_FEATURE_SEARCH_POSTS''',
';',
'update blog_features',
'  set display_seq = 220',
' where build_option_name = ''BLOG_FEATURE_LATEST_POSTS''',
';',
'update blog_features',
'  set display_seq = 230',
' where build_option_name = ''BLOG_FEATURE_CATEGORY''',
';',
'update blog_features',
'  set display_seq = 240',
' where build_option_name = ''BLOG_FEATURE_CATEGORY_POST_COUNT''',
';',
'update blog_features',
'  set display_seq = 250',
' where build_option_name = ''BLOG_FEATURE_ARCHIVE''',
';',
'update blog_features',
'  set display_seq = 260',
' where build_option_name = ''BLOG_FEATURE_ARCHIVE_POST_COUNT''',
';',
'update blog_features',
'  set display_seq = 270',
' where build_option_name = ''BLOG_FEATURE_RSS''',
';',
'update blog_features',
'  set display_seq = 310',
' where build_option_name = ''BLOG_FEATURE_ALLOW_COMMENTS''',
';',
'update blog_features',
'  set display_seq = 320',
' where build_option_name = ''BLOG_FEATURE_MODERATE_COMMENTS''',
';',
'update blog_features',
'  set display_seq = 330',
' where build_option_name = ''BLOG_FEATURE_SUBSCRIBE_COMMENTS''',
';',
'update blog_features',
'  set display_seq = 410',
' where build_option_name = ''BLOG_FEATURE_POST_PAGINATION''',
';',
'update blog_features',
'  set display_seq = 420',
' where build_option_name = ''BLOG_FEATURE_MODAL_PAGES''',
';',
'update blog_features',
'  set display_seq = 430',
' where build_option_name = ''BLOG_FEATURE_SITEMAP''',
';',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'begin',
'  insert into blog_settings(display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)',
'    values(10, 0, ''PATCH_20220415'', ''STRING'', ''INTERNAL'', ''Patch 21.2.20220415'')',
'  ;',
'-- Handle exception if patch version already inserted',
'exception when dup_val_on_index then',
'  null;',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
