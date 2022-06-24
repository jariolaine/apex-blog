prompt --application/deployment/install/upgrade_rereate_text_index
begin
--   Manifest
--     INSTALL: UPGRADE-Rereate text index
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(13344011176158522)
,p_install_id=>wwv_flow_api.id(20741295540297154)
,p_name=>'Rereate text index'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20220508'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Recreate text index',
'--------------------------------------------------------',
'create index blog_post_uds_ctx on blog_post_uds (dummy)',
'indextype is ctxsys.context parameters (',
'  ''datastore      blog_post_uds_ds',
'   lexer          blog_post_uds_lx',
'   section group  ctxsys.auto_section_group',
'   stoplist       ctxsys.empty_stoplist',
'   filter         ctxsys.null_filter',
'   sync           (on commit)''',
');',
''))
);
wwv_flow_api.component_end;
end;
/
