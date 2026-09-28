prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(114924328496873152)
,p_name=>'Google'
,p_static_id=>'google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_provider', 'GOOGLE',
  'credential_store', 139376978108159122,
  'discovery_url', '',
  'scope', 'email',
  'uppercase_username', 'Y',
  'username', '#email#',
  'verify_attributes', 'Y')).to_clob
,p_post_auth_process=>'blog_admin.post_authentication'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>'44984729222966'
,p_created_on=>wwv_flow_imp.dz('20240907085822Z')
,p_updated_on=>wwv_flow_imp.dz('20250702042312Z')
);
wwv_flow_imp.component_end;
end;
/
