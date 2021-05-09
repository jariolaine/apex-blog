prompt --application/shared_components/logic/application_items/g_latest_post_rows
begin
--   Manifest
--     APPLICATION ITEM: G_LATEST_POST_ROWS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40620483198781581)
,p_name=>'G_LATEST_POST_ROWS'
,p_protection_level=>'I'
,p_item_comment=>'Latest post display count'
);
wwv_flow_api.component_end;
end;
/
