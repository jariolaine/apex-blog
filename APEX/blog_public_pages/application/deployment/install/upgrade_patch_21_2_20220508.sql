prompt --application/deployment/install/upgrade_patch_21_2_20220508
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 21.2.20220508
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(12714018366812216)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 21.2.20220508'
,p_sequence=>40
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20220508'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 21.2.20220508',
'--------------------------------------------------------',
'--  Update metadata',
'--------------------------------------------------------',
'update blog_features',
'  set display_seq = 290',
'where build_option_name = ''BLOG_FEATURE_RSS''',
';',
'--------------------------------------------------------',
'--  Insert metadata',
'--------------------------------------------------------',
'insert into blog_features(is_active,display_seq,build_option_name,build_option_group,help_message)',
'  values(1,270,''BLOG_FEATURE_TAG_CLOUD'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_HELP_FEATURE_TAG_CLOUD'');',
'insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message)',
'  values(1,280,''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'',''BLOG_FEATURE_GROUP_RIGHT_COLUMN'',''BLOG_FEATURE_TAG_CLOUD'',''BLOG_HELP_FEATURE_TAG_CLOUD_POST_COUNT'');',
'--------------------------------------------------------',
'--  Drop obsolete text index section groups',
'--------------------------------------------------------',
'begin',
'  ctx_ddl.drop_section_group( ''BLOG_POST_UDS_SG'' );',
'end;',
'/',
'-------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20220508'',''STRING'',''INTERNAL'',''Patch 21.2.20220508'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
