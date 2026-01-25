prompt --application/shared_components/security/authentications/apex_authentication
begin
--   Manifest
--     AUTHENTICATION: APEX Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(106415579002501009)
,p_name=>'APEX Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>42197535875446
,p_created_on=>wwv_flow_imp.dz('20250210145811Z')
,p_updated_on=>wwv_flow_imp.dz('20250414101459Z')
);
wwv_flow_imp.component_end;
end;
/
