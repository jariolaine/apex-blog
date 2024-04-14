prompt --application/deployment/install/upgrade_drop_text_indexes
begin
--   Manifest
--     INSTALL: UPGRADE-Drop text indexes
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
 p_id=>wwv_flow_imp.id(32048697558624826)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Drop text indexes'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20231222'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Drop text indexes',
'--------------------------------------------------------',
'declare',
'  index_not_exists exception;',
'  pragma exception_init ( index_not_exists, -01418 );',
'  ctx_ddl_error exception;',
'  pragma exception_init ( ctx_ddl_error, -20000 );',
'begin',
'  -- Drop text indexes',
'  begin',
'    execute immediate ''drop index blog_posts_ctx force'';',
'  exception when index_not_exists then null;',
'  end;',
'  begin',
'    execute immediate ''drop index blog_comments_ctx force'';',
'  exception when index_not_exists then null;',
'  end;',
'  -- Drop text index preferences',
'  begin',
'    ctx_ddl.drop_preference( ''BLOG_POSTS_UDS'' );',
'  exception when ctx_ddl_error then null;',
'  end;',
'  begin',
'    ctx_ddl.drop_preference( ''BLOG_COMMENTS_UDS'' );',
'  exception when ctx_ddl_error then null;',
'  end;',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
