prompt --application/deployment/install/upgrade_purge_cached_regions_and_pages
begin
--   Manifest
--     INSTALL: UPGRADE-Purge cached regions and pages
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(39201956105893388)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Purge cached regions and pages'
,p_sequence=>151
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Purge cached regions and pages',
'--------------------------------------------------------',
'apex_util.cache_purge_by_application(',
'  p_application => apex_application_install.get_application_id',
');'))
);
wwv_flow_imp.component_end;
end;
/
