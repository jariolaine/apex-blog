prompt --application/shared_components/security/authorizations/bloggers
begin
--   Manifest
--     SECURITY SCHEME: Bloggers
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(110805652816947583)
,p_name=>'Bloggers'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Bloggers'
,p_attribute_02=>'W'
,p_error_message=>'You are not authorized to access this application.'
,p_version_scn=>41493644223961
,p_caching=>'BY_USER_BY_SESSION'
,p_comments=>'Users who belong to the workspace user group "Bloggers" are authorized.'
,p_updated_on=>wwv_flow_imp.dz('20250201091132Z')
);
wwv_flow_imp.component_end;
end;
/
