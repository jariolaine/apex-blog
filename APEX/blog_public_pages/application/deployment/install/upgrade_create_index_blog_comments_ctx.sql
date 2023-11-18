prompt --application/deployment/install/upgrade_create_index_blog_comments_ctx
begin
--   Manifest
--     INSTALL: UPGRADE-Create index blog_comments_ctx
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(38641094788767068)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Create index blog_comments_ctx'
,p_sequence=>150
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20230608'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Create text index preferences for index BLOG_COMMENTS_CTX',
'--------------------------------------------------------',
'begin',
'',
'  ctx_ddl.create_preference(',
'     preference_name  => ''BLOG_COMMENTS_UDS''',
'    ,object_name      => ''USER_DATASTORE''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_COMMENTS_UDS''',
'    ,attribute_name   => ''OUTPUT_TYPE''',
'    ,attribute_value  => ''CLOB''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_COMMENTS_UDS''',
'    ,attribute_name   => ''PROCEDURE''',
'    ,attribute_value  =>',
'      apex_string.format(',
'        p_message => ''%s.BLOG_CTX.GENERATE_COMMENT_DATASTORE''',
'        ,p0 => sys_context( ''USERENV'', ''CURRENT_SCHEMA'' )',
'      )',
'  );',
'',
'end;',
'/',
'--------------------------------------------------------',
'--  Create text index BLOG_COMMENTS_CTX',
'--------------------------------------------------------',
'create index blog_comments_ctx on blog_comments( ctx_search )',
'indextype is ctxsys.context parameters(',
'  ''datastore      blog_comments_uds',
'   lexer          ctxsys.default_lexer',
'   section group  ctxsys.auto_section_group',
'   stoplist       ctxsys.empty_stoplist',
'   filter         ctxsys.null_filter',
'   sync           (on commit)''',
');',
''))
);
wwv_flow_imp.component_end;
end;
/
