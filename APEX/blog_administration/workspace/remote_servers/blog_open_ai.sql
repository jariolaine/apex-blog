prompt --workspace/remote_servers/blog_open_ai
begin
--   Manifest
--     REMOTE SERVER: Blog Open AI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_remote_server(
 p_id=>114707404165421999
,p_name=>'Blog Open AI'
,p_static_id=>'BLOG_OPEN_AI_API'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('BLOG_OPEN_AI_API'),'https://api.openai.com/v1/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('BLOG_OPEN_AI_API'),'')
,p_server_type=>'GENERATIVE_AI'
,p_credential_id=>115496411402379682
,p_ai_provider_type=>'OPENAI'
,p_ai_is_builder_service=>false
,p_ai_is_default_for_new_apps=>false
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('BLOG_OPEN_AI_API'),'gpt-4o-mini')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('BLOG_OPEN_AI_API'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('BLOG_OPEN_AI_API'),'')
,p_ai_max_tokens=>nvl(wwv_flow_application_install.get_remote_server_ai_maxtokens('BLOG_OPEN_AI_API'),'')
,p_prompt_on_install=>false
,p_updated_on=>wwv_flow_imp.dz('20250630114133Z')
);
wwv_flow_imp.component_end;
end;
/
