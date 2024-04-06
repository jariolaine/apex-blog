prompt --application/shared_components/logic/application_items/g_page_url
begin
--   Manifest
--     APPLICATION ITEM: G_PAGE_URL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(45476787287054182)
,p_name=>'G_PAGE_URL'
,p_protection_level=>'I'
,p_version_scn=>41107586771732
);
wwv_flow_imp.component_end;
end;
/
