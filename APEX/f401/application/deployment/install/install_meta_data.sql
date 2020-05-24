prompt --application/deployment/install/install_meta_data
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(32997033167621897)
,p_install_id=>wwv_flow_api.id(20741295540297154)
,p_name=>'Meta data'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Update BLOG_SETTINGS',
'--------------------------------------------------------',
'update blog_settings',
'  set attribute_value = to_char(apex_application_install.get_application_id, ''fm99999999999999999999999999999999999999'')',
'  where 1 = 1',
'  and attribute_name = ''G_PUB_APP_ID''',
';',
'',
'--------------------------------------------------------',
'--  Inserting into BLOG_INIT_ITEMS',
'--------------------------------------------------------',
'insert into blog_init_items',
'select ai.application_id  as application_id',
'  ,ai.item_name           as item_name',
'from apex_application_items ai',
'join blog_settings s',
'  on ai.item_name = s.attribute_name',
'where 1 = 1',
'and ai.application_id = apex_application_install.get_application_id',
'',
'  union all',
'',
'select pi.application_id  as application_id',
'  ,pi.item_name           as item_namee',
'from apex_application_page_items pi',
'join blog_settings s',
'  on pi.item_name = s.attribute_name',
'where 1 = 1',
'and pi.application_id = apex_application_install.get_application_id',
';',
''))
);
end;
/
