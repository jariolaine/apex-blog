prompt --application/deployment/install/upgrade_patch_23_1_20231118
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 23.1.20231118
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(39135416807684840)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 23.1.20231118'
,p_sequence=>100
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231118'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 23.1.20231118',
'--------------------------------------------------------',
'--  Insert metadata',
'--------------------------------------------------------',
'insert into blog_features (is_active, display_seq, build_option_name, build_option_group)',
'  values (''1'', ''440'', ''BLOG_FEATURE_ATOM'', ''BLOG_FEATURE_GROUP_MISC'');',
'--------------------------------------------------------',
'--  Drop obsolete type',
'--------------------------------------------------------',
'drop type blog_t_post;',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20231118'',''STRING'',''INTERNAL'',''Patch 23.1.20231118'')',
';'))
);
wwv_flow_imp.component_end;
end;
/
