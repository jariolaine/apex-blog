prompt --application/shared_components/security/authorizations/bloggers
begin
--   Manifest
--     SECURITY SCHEME: Bloggers
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(28359530175115492)
,p_name=>'Bloggers'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Bloggers'
,p_attribute_02=>'W'
,p_error_message=>'You are not authorized to access this application.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
