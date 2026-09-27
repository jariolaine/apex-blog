prompt --application/deployment/install/upgrade_drop_text_indexes
begin
--   Manifest
--     INSTALL: UPGRADE-Drop text indexes
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
wwv_flow_imp.g_varchar2_table(1) := '-- Drop text indexes'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'  index_not_ex';
wwv_flow_imp.g_varchar2_table(2) := 'ists exception;'||wwv_flow.LF||
'  pragma exception_init ( index_not_exists, -01418 );'||wwv_flow.LF||
'  ctx_ddl_error exception;'||wwv_flow.LF||
'  p';
wwv_flow_imp.g_varchar2_table(3) := 'ragma exception_init ( ctx_ddl_error, -20000 );'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- Drop text indexes'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    execute imm';
wwv_flow_imp.g_varchar2_table(4) := 'ediate ''drop index blog_posts_ctx force'';'||wwv_flow.LF||
'  exception when index_not_exists then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(5) := 'n'||wwv_flow.LF||
'    execute immediate ''drop index blog_comments_ctx force'';'||wwv_flow.LF||
'  exception when index_not_exists then';
wwv_flow_imp.g_varchar2_table(6) := ' null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  -- Drop text index preferences'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop_preference( ''BLOG_POSTS_UDS''';
wwv_flow_imp.g_varchar2_table(7) := ' );'||wwv_flow.LF||
'  exception when ctx_ddl_error then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop_preference( ''BLOG_COMM';
wwv_flow_imp.g_varchar2_table(8) := 'ENTS_UDS'' );'||wwv_flow.LF||
'  exception when ctx_ddl_error then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(159442686887520960)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Drop text indexes'
,p_sequence=>50
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231222'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20241125134149Z')
);
wwv_flow_imp.component_end;
end;
/
