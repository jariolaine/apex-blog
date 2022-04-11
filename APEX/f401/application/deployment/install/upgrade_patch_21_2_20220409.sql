prompt --application/deployment/install/upgrade_patch_21_2_20220409
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 21.2.20220409
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(11011254768323995)
,p_install_id=>wwv_flow_api.id(20741295540297154)
,p_name=>'Patch 21.2.20220409'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date between 20220326 and 20220409'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Changes to table BLOG_COMMENT_FLAGS',
'--------------------------------------------------------',
'-- drop constarint BLOG_COMMENT_FLAGS_CK2',
'alter table blog_comment_flags drop',
'  constraint blog_comment_flags_ck2;',
'-- Update table BLOG_COMMENT_FLAGS',
'update blog_comment_flags',
'  set flag = ''UNREAD''',
'where 1 = 1',
'  and flag = ''NEW''',
';',
'-- Add check constraint BLOG_COMMENT_FLAGS_CK2',
'alter table blog_comment_flags add',
'  constraint blog_comment_flags_ck2 check ( flag in( ''UNREAD'', ''MODERATE'' ) )',
';',
'',
'--------------------------------------------------------',
'--  Changes to table  BLOG_COMMENT_SUBSCRIBERS',
'--------------------------------------------------------',
'-- Add new column IS_ACTIVE',
'alter table blog_comment_subscribers add is_active number( 1, 0 )',
';',
'-- Update default value to column IS_ACTIVE',
'update blog_comment_subscribers',
'  set is_active = 1',
';',
'-- Add not null constraint to column IS_ACTIVE',
'alter table blog_comment_subscribers modify is_active not null',
';',
'-- Add check constarint BLOG_COMMENT_SUBSCRIBERS_CK2',
'alter table blog_comment_subscribers add',
'  constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) )',
';',
'',
'--------------------------------------------------------',
'--  Update metadata',
'--------------------------------------------------------',
'-- Disable constraint BLOG_INIT_ITEMS_FK1',
'alter table blog_init_items modify',
'  constraint blog_init_items_fk1 disable',
';',
'-- Update BLOG_SETTINGS',
'update blog_settings',
'  set attribute_name = ''G_APP_DATE_FORMAT''',
'where 1 = 1',
'  and attribute_name = ''G_DATE_FORMAT''',
';',
'update blog_settings',
'  set is_nullable = 0',
'where 1 = 1',
'  and attribute_name = ''G_ADMIN_APP_ID''',
';',
'update blog_settings',
'  set is_nullable = 0',
'where 1 = 1',
'  and attribute_name = ''G_PUB_APP_ID''',
';',
'-- Update BLOG_INIT_ITEMS',
'update blog_init_items',
'  set item_name = ''G_APP_DATE_FORMAT''',
'where 1 = 1',
'  and item_name = ''G_DATE_FORMAT''',
';',
'-- Enable constraint BLOG_INIT_ITEMS_FK1',
'alter table blog_init_items modify',
'  constraint blog_init_items_fk1 enable',
';',
'',
'--------------------------------------------------------',
'--  Insert patch version',
'--------------------------------------------------------',
'insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values (''10'',''0'',''PATCH_20220409'',''STRING'',''INTERNAL'',''Patch 21.2.20220409'')',
';',
'',
'--------------------------------------------------------',
'--  Update application version',
'--------------------------------------------------------',
'update blog_settings',
'  set attribute_value = ''Release 21.2.20220411''',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
';',
''))
);
wwv_flow_api.component_end;
end;
/
