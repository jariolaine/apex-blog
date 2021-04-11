prompt --application/shared_components/credentials/abstract_email_validation_api_key
begin
--   Manifest
--     CREDENTIAL: Abstract email validation API key
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_credential(
 p_id=>wwv_flow_api.id(37422157706388629)
,p_name=>'Abstract email validation API key'
,p_static_id=>'ABSTRACT_EMAIL_VALIDATION_API_KEY'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_prompt_on_install=>true
,p_credential_comment=>'Abstract email validation API key (https://www.abstractapi.com/)'
);
wwv_flow_api.component_end;
end;
/
