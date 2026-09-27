prompt --application/shared_components/logic/application_processes/get_blogger_details
begin
--   Manifest
--     APPLICATION PROCESS: Get blogger details
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(9332525480730064)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_name=>'Get blogger details'
,p_static_id=>'get-blogger-details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_admin.get_blogger_details(',
'  p_app_id    => :APP_ID  ',
', p_username  => :APP_USER',
', p_user_id   => :G_BLOGGER_ID',
', p_name      => :G_BLOGGER_NAME',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'G_BLOGGER_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_security_scheme=>wwv_flow_imp.id(110805652816947583)
,p_version_scn=>'44984729200655'
,p_created_on=>wwv_flow_imp.dz('20250414135622Z')
,p_updated_on=>wwv_flow_imp.dz('20250702042258Z')
);
wwv_flow_imp.component_end;
end;
/
