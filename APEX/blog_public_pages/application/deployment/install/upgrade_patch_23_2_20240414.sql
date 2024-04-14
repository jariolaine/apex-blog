prompt --application/deployment/install/upgrade_patch_23_2_20240414
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 23.2.20240414
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
 p_id=>wwv_flow_imp.id(54119769564817579)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 23.2.20240414'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20240414'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 23.2.20240414',
'--------------------------------------------------------',
'--  Drop renamed objects',
'--------------------------------------------------------',
'declare',
'  view_not_exists exception;',
'  pragma exception_init ( view_not_exists, -00942 );',
'begin',
'  begin',
'    execute immediate ''drop view blog_v_all_posts_form'';',
'  exception when view_not_exists then null;',
'  end;',
'  begin',
'    execute immediate ''drop view blog_v_all_comments_form'';',
'  exception when view_not_exists then null;',
'  end;',
'  begin',
'    execute immediate ''drop view blog_v_form_post'';',
'  exception when view_not_exists then null;',
'  end;',
'  begin',
'    execute immediate ''drop view blog_v_post_form'';',
'  exception when view_not_exists then null;',
'  end;',
'end;',
'/',
'--------------------------------------------------------',
'--  Truncate table blog_init_items and update metadata',
'--------------------------------------------------------',
'truncate table blog_init_items;',
'update blog_settings',
'  set attribute_name = ''P0_BLOG_APP_DATE_FORMAT''',
'where attribute_name = ''G_APP_DATE_FORMAT''',
';',
'update blog_settings',
'  set attribute_name = ''BLOG_APP_DESC''',
'where attribute_name = ''G_APP_DESC''',
';',
'update blog_settings',
'  set attribute_name = ''BLOG_APP_NAME''',
'where attribute_name = ''G_APP_NAME''',
';',
'update blog_settings',
'  set attribute_name = ''P0_BLOG_POST_DATE_FORMAT''',
'where attribute_name = ''G_POST_TITLE_DATE_FORMAT''',
';',
'update blog_settings',
'  set attribute_name = ''P0_BLOG_SEARCH_ROWS''',
'where attribute_name = ''G_SEARCH_ROWS''',
';',
'update blog_settings',
'  set attribute_name = ''P1_BLOG_POST_ROWS''',
'where attribute_name = ''P1_REPORT_ROWS''',
';',
'update blog_settings',
'  set attribute_name = ''P2_BLOG_COMMENT_ROWS''',
'where attribute_name = ''P2_REPORT_ROWS''',
';',
'--------------------------------------------------------',
'--  Reinsert metadata',
'--------------------------------------------------------',
'insert into blog_init_items(is_active, application_id, item_name)',
'select 1            as is_active',
', ai.application_id as application_id',
', ai.item_name      as item_name',
'from apex_application_items ai',
'join blog_settings s',
'  on ai.item_name = s.attribute_name',
'where 1 = 1',
'  and ai.application_id in(',
'    blog_util.get_attribute_value( ''G_ADMIN_APP_ID'' )',
'  , blog_util.get_attribute_value( ''G_PUB_APP_ID'' )',
'  )',
'union all',
'select 1            as is_active',
', pi.application_id as application_id',
', pi.item_name      as item_name',
'from apex_application_page_items pi',
'join blog_settings s',
'  on pi.item_name = s.attribute_name',
'where 1 = 1',
'  and pi.application_id in(',
'    blog_util.get_attribute_value( ''G_ADMIN_APP_ID'' )',
'  , blog_util.get_attribute_value( ''G_PUB_APP_ID'' )',
'  )',
'order by 2, 3',
';',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20240414'',''STRING'',''INTERNAL'',''Patch 23.2.20240414'')',
';'))
);
wwv_flow_imp.component_end;
end;
/
