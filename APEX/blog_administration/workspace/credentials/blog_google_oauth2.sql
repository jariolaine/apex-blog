prompt --workspace/credentials/blog_google_oauth2
begin
--   Manifest
--     CREDENTIAL: Blog Google OAuth2
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_credential(
 p_id=>139376978108159122
,p_name=>'Blog Google OAuth2'
,p_static_id=>'BLOG_GOOGLE_OAUTH2'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_scope=>'email'
,p_prompt_on_install=>true
,p_credential_comment=>'Google authentication'
,p_oauth_token_request_type=>'BASIC'
,p_updated_on=>wwv_flow_imp.dz('20250120172817Z')
);
wwv_flow_imp.component_end;
end;
/
