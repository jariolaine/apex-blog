prompt --application/shared_components/logic/application_items/g_blogger_name
begin
--   Manifest
--     APPLICATION ITEM: G_BLOGGER_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(109630602069491840)
,p_name=>'G_BLOGGER_NAME'
,p_protection_level=>'I'
,p_item_comment=>'User full name'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
