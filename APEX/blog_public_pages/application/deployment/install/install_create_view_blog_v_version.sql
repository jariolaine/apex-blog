prompt --application/deployment/install/install_create_view_blog_v_version
begin
--   Manifest
--     INSTALL: INSTALL-Create view blog_v_version
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
 p_id=>wwv_flow_imp.id(19464498978874461)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Create view blog_v_version'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  DDL for View BLOG_V_VERSION',
'--------------------------------------------------------',
'create or replace force view blog_v_version as',
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
