prompt --application/shared_components/logic/application_items/g_user_date_time_format
begin
--   Manifest
--     APPLICATION ITEM: G_USER_DATE_TIME_FORMAT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(9007343053756881)
,p_name=>'G_USER_DATE_TIME_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Application date time format'
);
wwv_flow_api.component_end;
end;
/
