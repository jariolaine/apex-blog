prompt --application/deployment/install/upgrade_drop_index_blog_comments_ctx
begin
--   Manifest
--     INSTALL: UPGRADE-Drop index blog_comments_ctx
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(47369591309842898)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Drop index blog_comments_ctx'
,p_sequence=>110
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20230608'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Drop index BLOG_COMMENTS_CTX',
'--------------------------------------------------------',
'declare',
'  index_not_exists exception;',
'  pragma exception_init ( index_not_exists, -01418 );',
'begin',
'  execute immediate ''drop index blog_comments_ctx force'';',
'exception when index_not_exists then',
'  null;',
'end;',
'/',
'--------------------------------------------------------',
'--  Drop text index BLOG_COMMENTS_CTX preferences',
'--------------------------------------------------------',
'declare',
'  ctx_ddl_error exception;',
'  pragma exception_init ( ctx_ddl_error, -20000 );',
'begin',
'  ctx_ddl.drop_preference( ''BLOG_COMMENTS_UDS'' );',
'exception when ctx_ddl_error then',
'  null;',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
