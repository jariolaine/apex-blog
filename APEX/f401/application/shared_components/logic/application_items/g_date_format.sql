prompt --application/shared_components/logic/application_items/g_date_format
begin
--   Manifest
--     APPLICATION ITEM: G_DATE_FORMAT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966958999192709)
,p_name=>'G_DATE_FORMAT'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'Date format used e.g. on reports'
);
wwv_flow_api.component_end;
end;
/
