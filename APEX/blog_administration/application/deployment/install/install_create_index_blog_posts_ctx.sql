prompt --application/deployment/install/install_create_index_blog_posts_ctx
begin
--   Manifest
--     INSTALL: INSTALL-Create index BLOG_POSTS_CTX
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(41212685070708550)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_name=>'Create index BLOG_POSTS_CTX'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Create text index preferences',
'--------------------------------------------------------',
'declare',
'  l_schema varchar2(256);',
'begin',
'',
'  l_schema := sys_context( ''USERENV'', ''CURRENT_SCHEMA'' );',
'',
'  ctx_ddl.create_preference(',
'     preference_name  => ''BLOG_POST_UDS_DS''',
'    ,object_name      => ''USER_DATASTORE''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_POST_UDS_DS''',
'    ,attribute_name   => ''PROCEDURE''',
'    ,attribute_value  => l_schema || ''.BLOG_CTX.GENERATE_POST_DATASTORE''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_POST_UDS_DS''',
'    ,attribute_name   => ''OUTPUT_TYPE''',
'    ,attribute_value  => ''CLOB''',
'  );',
'',
'  ctx_ddl.create_preference(',
'    preference_name   => ''BLOG_POST_UDS_LX''',
'    ,object_name      => ''BASIC_LEXER''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_POST_UDS_LX''',
'    ,attribute_name   => ''MIXED_CASE''',
'    ,attribute_value  => ''NO''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_POST_UDS_LX''',
'    ,attribute_name   => ''BASE_LETTER''',
'    ,attribute_value  => ''YES''',
'  );',
'',
'  ctx_ddl.set_attribute(',
'    preference_name   => ''BLOG_POST_UDS_LX''',
'    ,attribute_name   => ''BASE_LETTER_TYPE''',
'    ,attribute_value  => ''GENERIC''',
'  );',
'',
'end;',
'/',
'--------------------------------------------------------',
'--  Create text index',
'--------------------------------------------------------',
'create index blog_posts_ctx on blog_posts(title)',
'indextype is ctxsys.context parameters(',
'  ''datastore      blog_post_uds_ds',
'   lexer          blog_post_uds_lx',
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
