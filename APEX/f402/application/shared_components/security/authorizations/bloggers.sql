prompt --application/shared_components/security/authorizations/bloggers
begin
--   Manifest
--     SECURITY SCHEME: Bloggers
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(28359530175115492)
,p_name=>'Bloggers'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Bloggers'
,p_attribute_02=>'W'
,p_error_message=>'Unauthorized access.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.component_end;
end;
/
