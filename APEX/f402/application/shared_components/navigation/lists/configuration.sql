prompt --application/shared_components/navigation/lists/configuration
begin
--   Manifest
--     LIST: Configuration
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(24798726331419823)
,p_name=>'Configuration'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(24798939439419824)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:20012:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-layout-header-sidebar-right'
,p_list_text_01=>'Set the application name, description, and other settings.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(24799320618419825)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Features'
,p_list_item_link_target=>'f?p=&APP_ID.:20011:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_text_01=>'Enable or disable application features.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(25756063318250538)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Modal Pages'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-list'
,p_list_text_01=>'Create and maintain modal pages. A link to the page will appear in the blog footer. For example, create a page for a disclaimer.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
