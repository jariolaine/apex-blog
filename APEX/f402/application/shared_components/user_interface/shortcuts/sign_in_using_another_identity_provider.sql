prompt --application/shared_components/user_interface/shortcuts/sign_in_using_another_identity_provider
begin
--   Manifest
--     SHORTCUT: SIGN_IN_USING_ANOTHER_IDENTITY_PROVIDER
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(63949057880193518)
,p_shortcut_name=>'SIGN_IN_USING_ANOTHER_IDENTITY_PROVIDER'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>'<div class="z-hr-section">OR</div>'
);
wwv_flow_api.component_end;
end;
/