prompt --application/deployment/install/upgrade_update_version_info
begin
--   Manifest
--     INSTALL: UPGRADE-Update version info
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(11258222492508804)
,p_install_id=>wwv_flow_api.id(20741295540297154)
,p_name=>'Update version info'
,p_sequence=>30
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Update application version',
'--------------------------------------------------------',
'update blog_settings',
'  set attribute_value = ''Release 21.2.20220412''',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
';',
'',
''))
);
wwv_flow_api.component_end;
end;
/
