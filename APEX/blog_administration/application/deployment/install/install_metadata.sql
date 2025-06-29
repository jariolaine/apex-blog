prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(114154949199477353)
,p_install_id=>wwv_flow_imp.id(114152993306634160)
,p_name=>'Metadata'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'-- Inserting into BLOG_SETTINGS',
'blog_install.settings_ins(30,0,''G_ADMIN_APP_ID'',''STRING'',''INTERNAL'',blog_util.int_to_vc2(apex_application_install.get_application_id),null,null);',
'end;',
'/',
''))
,p_updated_on=>wwv_flow_imp.dz('20250511050001Z')
);
wwv_flow_imp.component_end;
end;
/
