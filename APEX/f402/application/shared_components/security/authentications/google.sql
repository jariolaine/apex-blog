prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(32478205855041061)
,p_name=>'Google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_api.id(56930855466327031)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'email'
,p_attribute_09=>'email'
,p_attribute_11=>'Y'
,p_attribute_13=>'Y'
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'blog_cm.post_authentication'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
);
wwv_flow_api.component_end;
end;
/
