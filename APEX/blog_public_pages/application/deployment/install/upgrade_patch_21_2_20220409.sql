prompt --application/deployment/install/upgrade_patch_21_2_20220409
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 21.2.20220409
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(11011254768323995)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 21.2.20220409'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date <= 20220411'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 21.2.20220409',
'--------------------------------------------------------',
'--  Changes to table BLOG_COMMENT_SUBSCRIBERS',
'--------------------------------------------------------',
'declare',
'  column_exists exception;',
'  pragma exception_init ( column_exists, -1430 );',
'begin',
'  -- Add new column IS_ACTIVE',
'  execute immediate',
'    ''alter table blog_comment_subscribers add is_active number( 1, 0 )''',
'  ;',
'  -- Update default value to column IS_ACTIVE',
'  update blog_comment_subscribers set is_active = 1;',
'  -- Change column noy null',
'  execute immediate',
'    ''alter table blog_comment_subscribers modify is_active not null''',
'  ;',
'  -- Add check constraint',
'  execute immediate',
'    ''alter table blog_comment_subscribers add constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) )''',
'  ;',
'-- Handle excepion if column already exists',
'-- Column might exists if application is installed from development Git branch',
'exception when column_exists then',
'  null;',
'end;',
'/',
'--  Insert patch version info to BLOG_SETTINGS',
'insert into blog_settings (display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)',
'  values (10, 0, ''PATCH_20220409'', ''STRING'', ''INTERNAL'', ''Patch 21.2.20220409'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
