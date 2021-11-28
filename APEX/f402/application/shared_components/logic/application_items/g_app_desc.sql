prompt --application/shared_components/logic/application_items/g_app_desc
begin
--   Manifest
--     APPLICATION ITEM: G_APP_DESC
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6653797369625590)
,p_name=>'G_APP_DESC'
,p_protection_level=>'I'
);
wwv_flow_api.component_end;
end;
/
