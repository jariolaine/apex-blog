prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 402
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_app_setting(
 p_id=>wwv_flow_api.id(19761501122344869)
,p_name=>'ADMIN_APP_AUTHZ_GROUP'
,p_value=>'Bloggers'
,p_is_required=>'Y'
);
wwv_flow_api.component_end;
end;
/
