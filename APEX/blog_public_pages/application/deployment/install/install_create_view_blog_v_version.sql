prompt --application/deployment/install/install_create_view_blog_v_version
begin
--   Manifest
--     INSTALL: INSTALL-Create view blog_v_version
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_VERSION'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(2) := '---------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_version as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3) := '  attribute_value                             as application_version'||wwv_flow.LF||
'  ,to_number( substr( attribute';
wwv_flow_imp.g_varchar2_table(4) := '_value, -8 ) ) as application_date'||wwv_flow.LF||
'from blog_settings'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and attribute_name = ''G_APP_VERSIO';
wwv_flow_imp.g_varchar2_table(5) := 'N'''||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(146858488307770595)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Create view blog_v_version'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
