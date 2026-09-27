prompt --application/deployment/install/upgrade_patch_23_1_20231118
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 23.1.20231118
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
wwv_flow_imp.g_varchar2_table(1) := '--  Patch 23.1.20231118'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Insert metadata';
wwv_flow_imp.g_varchar2_table(2) := ''||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'insert into blog_features (is_active, disp';
wwv_flow_imp.g_varchar2_table(3) := 'lay_seq, build_option_name, build_option_group)'||wwv_flow.LF||
'  values (''1'', ''440'', ''BLOG_FEATURE_ATOM'', ''BLOG_FEA';
wwv_flow_imp.g_varchar2_table(4) := 'TURE_GROUP_MISC'');'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Drop obsolete type'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(5) := '-------------------------------------------------------'||wwv_flow.LF||
'drop type blog_t_post;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(6) := '-----------------------------------'||wwv_flow.LF||
'--  Insert patch version info to BLOG_SETTINGS'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(7) := '---------------------------------------'||wwv_flow.LF||
'insert into blog_settings(display_seq,is_nullable,attribute_';
wwv_flow_imp.g_varchar2_table(8) := 'name,data_type,attribute_group_message,attribute_value)'||wwv_flow.LF||
'  values(10,0,''PATCH_20231118'',''STRING'',''INT';
wwv_flow_imp.g_varchar2_table(9) := 'ERNAL'',''Patch 23.1.20231118'')'||wwv_flow.LF||
';';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(166529406136580974)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Patch 23.1.20231118'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231118'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
