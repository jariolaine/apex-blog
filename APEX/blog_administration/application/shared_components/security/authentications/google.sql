prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(114924328496873152)
,p_name=>'Google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(139376978108159122)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'email'
,p_attribute_09=>'#email#'
,p_attribute_11=>'Y'
,p_attribute_13=>'Y'
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'blog_admin.post_authentication'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>44984729222966
,p_created_on=>wwv_flow_imp.dz('20240907055822Z')
,p_updated_on=>wwv_flow_imp.dz('20250702012312Z')
);
wwv_flow_imp.component_end;
end;
/
