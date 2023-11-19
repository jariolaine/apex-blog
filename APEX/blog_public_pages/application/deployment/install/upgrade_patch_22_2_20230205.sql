prompt --application/deployment/install/upgrade_patch_22_2_20230205
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 22.2.20230205
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(23864182944606208)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 22.2.20230205'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20230205'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 22.2.20230205',
'--------------------------------------------------------',
'--  Drop trigger BLOG_POST_UDS_POSTS_TRG',
'--------------------------------------------------------',
'drop trigger blog_post_uds_posts_trg;',
'--------------------------------------------------------',
'--  Drop table BLOG_POST_UDS',
'--------------------------------------------------------',
'drop table blog_post_uds;',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20230205'',''STRING'',''INTERNAL'',''Patch 22.2.20230205'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
