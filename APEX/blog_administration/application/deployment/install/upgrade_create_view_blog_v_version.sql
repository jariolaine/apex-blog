prompt --application/deployment/install/upgrade_create_view_blog_v_version
begin
--   Manifest
--     INSTALL: UPGRADE-Create view blog_v_version
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(10802378553752854)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Create view blog_v_version'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_views',
'where 1 = 1',
'and view_name = ''BLOG_V_VERSION'''))
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
'with read only',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
