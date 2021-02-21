prompt --application/shared_components/credentials/google_oauth2
begin
--   Manifest
--     CREDENTIAL: Google OAuth2
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_credential(
 p_id=>wwv_flow_api.id(56930855466327031)
,p_name=>'Google OAuth2'
,p_static_id=>'GOOGLE_OAUTH2'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_prompt_on_install=>true
);
wwv_flow_api.component_end;
end;
/
