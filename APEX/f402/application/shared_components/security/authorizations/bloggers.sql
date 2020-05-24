prompt --application/shared_components/security/authorizations/bloggers
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(28359530175115492)
,p_name=>'Bloggers'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Bloggers'
,p_attribute_02=>'W'
,p_error_message=>'Unauthorized access.'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
