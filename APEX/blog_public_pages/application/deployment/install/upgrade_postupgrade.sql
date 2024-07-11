prompt --application/deployment/install/upgrade_postupgrade
begin
--   Manifest
--     INSTALL: UPGRADE-Postupgrade
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(11258222492508804)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Postupgrade'
,p_sequence=>100
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Postupgrade',
'--------------------------------------------------------',
'-- Update version info',
'--------------------------------------------------------',
'update blog_settings',
'  set attribute_value = ''Release 24.1.0.20240711''',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
';',
'--------------------------------------------------------',
'-- Update text messages',
'--------------------------------------------------------',
'begin',
'  blog_cm.update_text_messages;',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
