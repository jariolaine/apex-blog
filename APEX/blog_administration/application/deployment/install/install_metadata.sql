prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'begin'||wwv_flow.LF||
'-- Inserting into BLOG_SETTINGS'||wwv_flow.LF||
'blog_install.settings_merge(''G_ADMIN_APP_ID'',30,0,''STRING'',''IN';
wwv_flow_imp.g_varchar2_table(2) := 'TERNAL'',null,null,null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));'||wwv_flow.LF||
'end;';
wwv_flow_imp.g_varchar2_table(3) := ''||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(114154949199477353)
,p_install_id=>wwv_flow_imp.id(114152993306634160)
,p_name=>'Metadata'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260125232711Z')
);
wwv_flow_imp.component_end;
end;
/
