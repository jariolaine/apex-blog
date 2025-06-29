prompt --workspace/credentials/blog_oracle_cloud_api_key
begin
--   Manifest
--     CREDENTIAL: Blog Oracle Cloud API Key
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(99274558332927618)
,p_name=>'Blog Oracle Cloud API Key'
,p_static_id=>'BLOG_OCI_API_KEY'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1...'
,p_prompt_on_install=>true
,p_credential_comment=>'API key for Oracle cloud resources'
,p_updated_on=>wwv_flow_imp.dz('20250122022901Z')
);
wwv_flow_imp.component_end;
end;
/
