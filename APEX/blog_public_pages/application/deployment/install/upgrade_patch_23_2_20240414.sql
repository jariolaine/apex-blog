prompt --application/deployment/install/upgrade_patch_23_2_20240414
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 23.2.20240414
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '--  Patch 23.2.20240414'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Drop renamed ob';
wwv_flow_imp.g_varchar2_table(2) := 'jects'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'  view_not_exists exception;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3) := '  pragma exception_init ( view_not_exists, -00942 );'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    execute immediate ''drop view ';
wwv_flow_imp.g_varchar2_table(4) := 'blog_v_all_posts_form'';'||wwv_flow.LF||
'  exception when view_not_exists then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    execute immed';
wwv_flow_imp.g_varchar2_table(5) := 'iate ''drop view blog_v_all_comments_form'';'||wwv_flow.LF||
'  exception when view_not_exists then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(6) := 'n'||wwv_flow.LF||
'    execute immediate ''drop view blog_v_form_post'';'||wwv_flow.LF||
'  exception when view_not_exists then null;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(7) := 'end;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    execute immediate ''drop view blog_v_post_form'';'||wwv_flow.LF||
'  exception when view_not_exists th';
wwv_flow_imp.g_varchar2_table(8) := 'en null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Truncate table b';
wwv_flow_imp.g_varchar2_table(9) := 'log_init_items and update metadata'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'truncate';
wwv_flow_imp.g_varchar2_table(10) := ' table blog_init_items;'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_name = ''P0_BLOG_APP_DATE_FORMAT'''||wwv_flow.LF||
'where ';
wwv_flow_imp.g_varchar2_table(11) := 'attribute_name = ''G_APP_DATE_FORMAT'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_name = ''BLOG_APP_DESC'''||wwv_flow.LF||
'w';
wwv_flow_imp.g_varchar2_table(12) := 'here attribute_name = ''G_APP_DESC'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_name = ''BLOG_APP_NAME'''||wwv_flow.LF||
'whe';
wwv_flow_imp.g_varchar2_table(13) := 're attribute_name = ''G_APP_NAME'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_name = ''P0_BLOG_POST_DATE_FO';
wwv_flow_imp.g_varchar2_table(14) := 'RMAT'''||wwv_flow.LF||
'where attribute_name = ''G_POST_TITLE_DATE_FORMAT'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribute_name ';
wwv_flow_imp.g_varchar2_table(15) := '= ''P0_BLOG_SEARCH_ROWS'''||wwv_flow.LF||
'where attribute_name = ''G_SEARCH_ROWS'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set attribut';
wwv_flow_imp.g_varchar2_table(16) := 'e_name = ''P1_BLOG_POST_ROWS'''||wwv_flow.LF||
'where attribute_name = ''P1_REPORT_ROWS'''||wwv_flow.LF||
';'||wwv_flow.LF||
'update blog_settings'||wwv_flow.LF||
'  set at';
wwv_flow_imp.g_varchar2_table(17) := 'tribute_name = ''P2_BLOG_COMMENT_ROWS'''||wwv_flow.LF||
'where attribute_name = ''P2_REPORT_ROWS'''||wwv_flow.LF||
';'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(18) := '------------------------------------'||wwv_flow.LF||
'--  Reinsert metadata'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(19) := '---------------'||wwv_flow.LF||
'insert into blog_init_items(is_active, application_id, item_name)'||wwv_flow.LF||
'select 1          ';
wwv_flow_imp.g_varchar2_table(20) := '  as is_active'||wwv_flow.LF||
', ai.application_id as application_id'||wwv_flow.LF||
', ai.item_name      as item_name'||wwv_flow.LF||
'from apex_appl';
wwv_flow_imp.g_varchar2_table(21) := 'ication_items ai'||wwv_flow.LF||
'join blog_settings s'||wwv_flow.LF||
'  on ai.item_name = s.attribute_name'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and ai.appl';
wwv_flow_imp.g_varchar2_table(22) := 'ication_id in('||wwv_flow.LF||
'    blog_util.get_attribute_value( ''G_ADMIN_APP_ID'' )'||wwv_flow.LF||
'  , blog_util.get_attribute_val';
wwv_flow_imp.g_varchar2_table(23) := 'ue( ''G_PUB_APP_ID'' )'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'union all'||wwv_flow.LF||
'select 1            as is_active'||wwv_flow.LF||
', pi.application_id as applicati';
wwv_flow_imp.g_varchar2_table(24) := 'on_id'||wwv_flow.LF||
', pi.item_name      as item_name'||wwv_flow.LF||
'from apex_application_page_items pi'||wwv_flow.LF||
'join blog_settings s'||wwv_flow.LF||
'  on';
wwv_flow_imp.g_varchar2_table(25) := ' pi.item_name = s.attribute_name'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and pi.application_id in('||wwv_flow.LF||
'    blog_util.get_attribute';
wwv_flow_imp.g_varchar2_table(26) := '_value( ''G_ADMIN_APP_ID'' )'||wwv_flow.LF||
'  , blog_util.get_attribute_value( ''G_PUB_APP_ID'' )'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'order by 2, 3'||wwv_flow.LF||
';'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(27) := '-------------------------------------------------------'||wwv_flow.LF||
'--  Insert patch version info to BLOG_SETTIN';
wwv_flow_imp.g_varchar2_table(28) := 'GS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'insert into blog_settings(display_seq,is';
wwv_flow_imp.g_varchar2_table(29) := '_nullable,attribute_name,data_type,attribute_group_message,attribute_value)'||wwv_flow.LF||
'  values(10,0,''PATCH_202';
wwv_flow_imp.g_varchar2_table(30) := '40414'',''STRING'',''INTERNAL'',''Patch 23.2.20240414'')'||wwv_flow.LF||
';';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(181513758893713713)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Patch 23.2.20240414'
,p_sequence=>30
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20240414'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
