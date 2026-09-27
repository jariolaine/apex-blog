prompt --application/deployment/install/upgrade_create_text_indexes
begin
--   Manifest
--     INSTALL: UPGRADE-Create text indexes
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
wwv_flow_imp.g_varchar2_table(1) := '-- Create text indexes'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Create text inde';
wwv_flow_imp.g_varchar2_table(2) := 'x preferences for index BLOG_POSTS_CTX'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'begi';
wwv_flow_imp.g_varchar2_table(3) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.create_preference('||wwv_flow.LF||
'     preference_name  => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'    ,object_name      => ''';
wwv_flow_imp.g_varchar2_table(4) := 'USER_DATASTORE'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    preference_name   => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'    ,attrib';
wwv_flow_imp.g_varchar2_table(5) := 'ute_name   => ''OUTPUT_TYPE'''||wwv_flow.LF||
'    ,attribute_value  => ''CLOB'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    prefe';
wwv_flow_imp.g_varchar2_table(6) := 'rence_name   => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''PROCEDURE'''||wwv_flow.LF||
'    ,attribute_value  =>'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(7) := ' apex_string.format('||wwv_flow.LF||
'        p_message => ''%s.BLOG_CTX.GENERATE_POST_DATASTORE'''||wwv_flow.LF||
'        ,p0 => sys_c';
wwv_flow_imp.g_varchar2_table(8) := 'ontext( ''USERENV'', ''CURRENT_SCHEMA'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(9) := '---------------'||wwv_flow.LF||
'--  Create text index BLOG_POSTS_CTX'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(10) := '---------'||wwv_flow.LF||
'create index blog_posts_ctx on blog_posts( ctx_search )'||wwv_flow.LF||
'indextype is ctxsys.context parame';
wwv_flow_imp.g_varchar2_table(11) := 'ters('||wwv_flow.LF||
'  ''datastore      blog_posts_uds'||wwv_flow.LF||
'   lexer          ctxsys.default_lexer'||wwv_flow.LF||
'   section group  ctxs';
wwv_flow_imp.g_varchar2_table(12) := 'ys.auto_section_group'||wwv_flow.LF||
'   stoplist       ctxsys.empty_stoplist'||wwv_flow.LF||
'   filter         ctxsys.null_filter'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(13) := '  sync           (on commit)'''||wwv_flow.LF||
');'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Create';
wwv_flow_imp.g_varchar2_table(14) := ' text index preferences for index BLOG_COMMENTS_CTX'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(15) := '--------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.create_preference('||wwv_flow.LF||
'     preference_name  => ''BLOG_COMMENTS_UDS'''||wwv_flow.LF||
'    ,objec';
wwv_flow_imp.g_varchar2_table(16) := 't_name      => ''USER_DATASTORE'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    preference_name   => ''BLOG_COMMEN';
wwv_flow_imp.g_varchar2_table(17) := 'TS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''OUTPUT_TYPE'''||wwv_flow.LF||
'    ,attribute_value  => ''CLOB'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_a';
wwv_flow_imp.g_varchar2_table(18) := 'ttribute('||wwv_flow.LF||
'    preference_name   => ''BLOG_COMMENTS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''PROCEDURE'''||wwv_flow.LF||
'    ,att';
wwv_flow_imp.g_varchar2_table(19) := 'ribute_value  =>'||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''%s.BLOG_CTX.GENERATE_COMMENT_DATAST';
wwv_flow_imp.g_varchar2_table(20) := 'ORE'''||wwv_flow.LF||
'        ,p0 => sys_context( ''USERENV'', ''CURRENT_SCHEMA'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(21) := '----------------------------------------'||wwv_flow.LF||
'--  Create text index BLOG_COMMENTS_CTX'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(22) := '-------------------------------------'||wwv_flow.LF||
'create index blog_comments_ctx on blog_comments( ctx_search )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(23) := 'indextype is ctxsys.context parameters('||wwv_flow.LF||
'  ''datastore      blog_comments_uds'||wwv_flow.LF||
'   lexer          ctxsys';
wwv_flow_imp.g_varchar2_table(24) := '.default_lexer'||wwv_flow.LF||
'   section group  ctxsys.auto_section_group'||wwv_flow.LF||
'   stoplist       ctxsys.empty_stoplist'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(25) := '  filter         ctxsys.null_filter'||wwv_flow.LF||
'   sync           (on commit)'''||wwv_flow.LF||
');'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(140738000505054656)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Create text indexes'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231222'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
