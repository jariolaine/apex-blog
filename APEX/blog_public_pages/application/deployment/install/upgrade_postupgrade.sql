prompt --application/deployment/install/upgrade_postupgrade
begin
--   Manifest
--     INSTALL: UPGRADE-Postupgrade
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
wwv_flow_imp.g_varchar2_table(1) := '--  Postupgrade'||wwv_flow.LF||
'-- Update version info'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_value = ''Release 24.2.11';
wwv_flow_imp.g_varchar2_table(2) := '.20260126'''||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and attribute_name = ''G_APP_VERSION'''||wwv_flow.LF||
';'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(138652211821404938)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Postupgrade'
,p_sequence=>90
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260125233211Z')
);
wwv_flow_imp.component_end;
end;
/
