prompt --application/shared_components/logic/application_items/g_post_title_date_format
begin
--   Manifest
--     APPLICATION ITEM: G_POST_TITLE_DATE_FORMAT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(7029499271806601)
,p_name=>'G_POST_TITLE_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Post title date format. Used e.g. in posts reports. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp.component_end;
end;
/
