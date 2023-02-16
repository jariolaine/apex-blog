prompt --application/deployment/checks
begin
--   Manifest
--     INSTALL CHECKS: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_check(
 p_id=>wwv_flow_imp.id(38823841481522299)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Supporting objects installed'
,p_sequence=>10
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_tables',
'where 1 = 1',
'and table_name = ''BLOG_SETTINGS'''))
,p_failure_message=>'The required supporting objects are not installed. Please install administration application and supporting objects using file blog_administration.sql.'
);
wwv_flow_imp_shared.create_install_check(
 p_id=>wwv_flow_imp.id(11013705994514070)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Pre-check if upgrading application'
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
 p_id=>wwv_flow_imp.id(11014025569539865)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Application update is supported'
,p_sequence=>30
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date >= 20220326'))
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
