prompt --application/shared_components/logic/application_items/g_search_rows
begin
--   Manifest
--     APPLICATION ITEM: G_SEARCH_ROWS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(6967171655194779)
,p_name=>'G_SEARCH_ROWS'
,p_protection_level=>'I'
,p_item_comment=>'Search report rows to display per report page. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp.component_end;
end;
/
