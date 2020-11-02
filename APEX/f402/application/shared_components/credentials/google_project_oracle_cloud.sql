prompt --application/shared_components/credentials/google_project_oracle_cloud
begin
--   Manifest
--     CREDENTIAL: Google Project Oracle Cloud
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_credential(
 p_id=>wwv_flow_api.id(56930855466327031)
,p_name=>'Google Project Oracle Cloud'
,p_static_id=>'GOOGLE_OAUTH2_JLADB01'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_prompt_on_install=>true
);
wwv_flow_api.component_end;
end;
/
