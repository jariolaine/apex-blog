prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(31708826557645262)
,p_install_id=>wwv_flow_api.id(31706870664802069)
,p_name=>'Metadata'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--',
'--------------------------------------------------------',
'--  Inserting into BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values (''10'',''1'',''G_ADMIN_APP_ID'',''STRING'',''INTERNAL'',null,null,null,blog_util.int_to_vc2(apex_applic'
||'ation_install.get_application_id));',
'',
''))
);
wwv_flow_api.component_end;
end;
/
