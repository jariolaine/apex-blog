prompt --workspace/credentials/blog_open_ai_api_key
begin
--   Manifest
--     CREDENTIAL: Blog Open AI API Key
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(115496411402379682)
,p_name=>'Blog Open AI API Key'
,p_static_id=>'BLOG_OPEN_AI_API_KEY'
,p_authentication_type=>'HTTP_HEADER'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
