prompt --application/deployment/install/upgrade_patch_22_2_20221124
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 22.2.20221124
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(11148857355719396)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 22.2.20221124'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20221124'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 22.2.20221124',
'--------------------------------------------------------',
'-- Insert to BLOG_INIT_ITEMS',
'--------------------------------------------------------',
'insert into blog_init_items(is_active, application_id, item_name)',
'  values(1, apex_application_install.get_application_id, ''G_LATEST_POST_ROWS'');',
'--------------------------------------------------------',
'--  Rebuild post text index because changes on package BLOG_CTX',
'--------------------------------------------------------',
'alter index blog_post_uds_ctx rebuild;',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20221124'',''STRING'',''INTERNAL'',''Patch 22.2.20221124'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
