prompt --application/deployment/checks
begin
--   Manifest
--     INSTALL CHECKS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
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
'and rownum = 1',
'union all',
'select 1',
'from all_objects',
'where owner = ''CTXSYS''',
'and object_name = ''CTX_DDL''',
'and rownum = 1'))
,p_failure_message=>'Application parsing schema must have role CTXAPP or execute privilege to package CTX_DDL.'
);
wwv_flow_imp.component_end;
end;
/
