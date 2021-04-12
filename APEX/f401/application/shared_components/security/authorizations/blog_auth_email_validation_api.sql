prompt --application/shared_components/security/authorizations/blog_auth_email_validation_api
begin
--   Manifest
--     SECURITY SCHEME: BLOG_AUTH_EMAIL_VALIDATION_API
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(37678540113813919)
,p_name=>'BLOG_AUTH_EMAIL_VALIDATION_API'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return #OWNER#.blog_util.get_attribute_value( ''G_EMAIL_VALIDATION_API_KEY'' ) = ''YES'';'
,p_error_message=>'You are not authorized use email validation API'
,p_caching=>'NOCACHE'
,p_comments=>'Authorization schema to check if Abstract email validation API key is set'
);
wwv_flow_api.component_end;
end;
/
