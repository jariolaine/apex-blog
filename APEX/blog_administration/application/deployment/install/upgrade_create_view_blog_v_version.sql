prompt --application/deployment/install/upgrade_create_view_blog_v_version
begin
--   Manifest
--     INSTALL: UPGRADE-Create view BLOG_V_VERSION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(10802378553752854)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Create view BLOG_V_VERSION'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  DDL for View BLOG_V_VERSION',
'--------------------------------------------------------',
'CREATE OR REPLACE FORCE VIEW "BLOG_V_VERSION" ("APPLICATION_VERSION", "APPLICATION_DATE") AS',
'select',
'  attribute_value                             as application_version',
'  ,to_number( substr( attribute_value, -8 ) ) as application_date',
'from blog_settings',
'where 1 = 1',
'and attribute_name = ''G_APP_VERSION''',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
