prompt --application/shared_components/logic/application_items/g_success_message
begin
--   Manifest
--     APPLICATION ITEM: G_SUCCESS_MESSAGE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(46748727500352146)
,p_name=>'G_SUCCESS_MESSAGE'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
