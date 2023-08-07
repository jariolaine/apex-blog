prompt --application/deployment/install/upgrade_patch_22_2_20221206
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 22.2.20221206
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(11148857355719396)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 22.2.20221206'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20221206'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 22.2.20221206',
'--------------------------------------------------------',
'--  Insert to BLOG_INIT_ITEMS',
'--------------------------------------------------------',
'insert into blog_init_items ( is_active, application_id, item_name )',
'  values( 1, apex_application_install.get_application_id, ''G_LATEST_POST_ROWS'' );',
'--------------------------------------------------------',
'--  Modify table BLOG_LINKS',
'--------------------------------------------------------',
'alter table blog_links add external_link number(1,0);',
'alter table blog_links add target_blank number(1,0);',
'update blog_links set external_link = 0;',
'update blog_links set target_blank = 0;',
'alter table blog_links add constraint blog_links_ck4 check( external_link in( 0, 1 ) );',
'alter table blog_links add constraint blog_links_ck5 check( target_blank in( 0, 1 ) );',
'alter table blog_links modify external_link not null;',
'alter table blog_links modify target_blank not null;',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20221206'',''STRING'',''INTERNAL'',''Patch 22.2.20221206'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
