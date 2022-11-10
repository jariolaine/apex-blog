prompt --application/shared_components/logic/application_items/g_app_name
begin
--   Manifest
--     APPLICATION ITEM: G_APP_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(8615126468915955)
,p_name=>'G_APP_NAME'
,p_protection_level=>'I'
,p_item_comment=>'Application name'
);
wwv_flow_imp.component_end;
end;
/
