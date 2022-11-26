prompt --application/shared_components/logic/application_items/g_app_desc
begin
--   Manifest
--     APPLICATION ITEM: G_APP_DESC
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(6966805581190300)
,p_name=>'G_APP_DESC'
,p_protection_level=>'I'
,p_item_comment=>'Application description. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp.component_end;
end;
/
