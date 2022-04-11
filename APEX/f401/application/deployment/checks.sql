prompt --application/deployment/checks
begin
--   Manifest
--     INSTALL CHECKS: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_check(
 p_id=>wwv_flow_api.id(38823841481522299)
,p_install_id=>wwv_flow_api.id(20741295540297154)
,p_name=>'Blog administration application installed'
,p_sequence=>10
,p_check_type=>'EXISTS'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_tables',
'where 1 = 1',
'and table_name = ''BLOG_SETTINGS'''))
,p_failure_message=>'Supporting object not installed. Please install administration application and supporting objects using file blog_administration.sql first.'
);
wwv_flow_api.component_end;
end;
/
