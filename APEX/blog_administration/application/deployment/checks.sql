prompt --application/deployment/checks
begin
--   Manifest
--     INSTALL CHECKS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_check(
 p_id=>wwv_flow_imp.id(64760872618475092)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Application parsing schema has role CTXAPP'
,p_sequence=>10
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_role_privs',
'where 1 = 1',
'and granted_role = ''CTXAPP''',
'union all',
'select 1',
'from all_objects',
'where owner = ''CTXSYS''',
'and object_name = ''CTX_DDL'''))
,p_failure_message=>'Application parsing schema must have role CTXAPP or execute privilege to package CTX_DDL.'
);
wwv_flow_imp_shared.create_install_check(
 p_id=>wwv_flow_imp.id(54148126425002968)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Pre-check is upgrade supported'
,p_sequence=>20
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_objects',
'where 1 = 1',
'and object_name = ''BLOG_V_VERSION''',
'and status = ''VALID'''))
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_views',
'where 1 = 1',
'and view_name = ''BLOG_V_VERSION'''))
,p_failure_message=>'Unable to determine application version. Check that the application parsing schema view BLOG_V_VERSION is valid.'
);
wwv_flow_imp_shared.create_install_check(
 p_id=>wwv_flow_imp.id(54148211605007577)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Application upgrade is supported'
,p_sequence=>30
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date >= 20230117'))
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_objects',
'where 1 = 1',
'and object_name = ''BLOG_V_VERSION''',
'and status = ''VALID'''))
,p_failure_message=>'A previously installed version of the application does not support upgrading of supporting objects.'
);
wwv_flow_imp.component_end;
end;
/
