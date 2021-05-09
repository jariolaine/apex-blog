prompt --application/shared_components/logic/application_items/g_blogger_name
begin
--   Manifest
--     APPLICATION ITEM: G_BLOGGER_NAME
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(27184479427659749)
,p_name=>'G_BLOGGER_NAME'
,p_protection_level=>'I'
);
wwv_flow_api.component_end;
end;
/
