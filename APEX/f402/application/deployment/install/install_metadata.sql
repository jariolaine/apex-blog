prompt --application/deployment/install/install_metadata
begin
--   Manifest
--     INSTALL: INSTALL-Metadata
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(31708826557645262)
,p_install_id=>wwv_flow_api.id(31706870664802069)
,p_name=>'Metadata'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Inserting into BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq, is_nullable, attribute_name, data_type, group_name, post_expression, int_min,int_max, install_value, attribute_value) values(''30'',''1'',''G_ADMIN_APP_ID'',''STRING'',''INTERNAL'',null,null,null,''blog_util.int_to_vc2(ape'
||'x_application_install.get_application_id)'',blog_util.int_to_vc2(apex_application_install.get_application_id));',
'',
'--------------------------------------------------------',
'--  Inserting into BLOG_INIT_ITEMS',
'--------------------------------------------------------',
'insert into blog_init_items(is_active, application_id, item_name)',
'select 1 as is_active',
'  ,ai.application_id  as application_id',
'  ,ai.item_name       as item_name',
'from apex_application_items ai',
'join blog_settings s',
'  on ai.item_name = s.attribute_name',
'where 1 = 1',
'and ai.application_id = apex_application_install.get_application_id',
'  union all',
'select 1 as is_active',
'  ,pi.application_id  as application_id',
'  ,pi.item_name       as item_namee',
'from apex_application_page_items pi',
'join blog_settings s',
'  on pi.item_name = s.attribute_name',
'where 1 = 1',
'and pi.application_id = apex_application_install.get_application_id',
';',
''))
);
wwv_flow_api.component_end;
end;
/
