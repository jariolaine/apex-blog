prompt --application/deployment/install/upgrade_patch_23_2_20231120
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 23.2.20231120
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
wwv_flow_imp.g_varchar2_table(1) := '--  Patch 23.2.20231120'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Insert and upda';
wwv_flow_imp.g_varchar2_table(2) := 'te metadata'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'update blog_features set displa';
wwv_flow_imp.g_varchar2_table(3) := 'y_seq = ''180'' where build_option_name = ''BLOG_FEATURE_SEARCH_FILES'';'||wwv_flow.LF||
'update blog_features set displa';
wwv_flow_imp.g_varchar2_table(4) := 'y_seq = ''170'' where build_option_name = ''BLOG_FEATURE_SEARCH_LINKS'';'||wwv_flow.LF||
'insert into blog_features (is_a';
wwv_flow_imp.g_varchar2_table(5) := 'ctive, display_seq, build_option_name, build_option_group, build_option_parent)'||wwv_flow.LF||
'  values (''1'', ''160''';
wwv_flow_imp.g_varchar2_table(6) := ', ''BLOG_FEATURE_SEARCH_COMMENTS'', ''BLOG_FEATURE_GROUP_PAGE'', ''BLOG_FEATURE_SEARCH'');'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(7) := '-----------------------------------------'||wwv_flow.LF||
'--  Insert patch version info to BLOG_SETTINGS'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(8) := '---------------------------------------------'||wwv_flow.LF||
'insert into blog_settings(display_seq,is_nullable,attr';
wwv_flow_imp.g_varchar2_table(9) := 'ibute_name,data_type,attribute_group_message,attribute_value)'||wwv_flow.LF||
'  values(10,0,''PATCH_20231120'',''STRING';
wwv_flow_imp.g_varchar2_table(10) := ''',''INTERNAL'',''Patch 23.2.20231120'')'||wwv_flow.LF||
';';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(136601784519730672)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Patch 23.2.20231120'
,p_sequence=>20
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231120'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20250119024323Z')
);
wwv_flow_imp.component_end;
end;
/
