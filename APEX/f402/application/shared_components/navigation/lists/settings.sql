prompt --application/shared_components/navigation/lists/settings
begin
--   Manifest
--     LIST: Settings
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(24798726331419823)
,p_name=>'Settings'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(24798939439419824)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Basic Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:20012:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-layout-header-sidebar-right'
,p_list_text_01=>'Setup title, description and other basic settings for application.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(24799320618419825)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Configuration Options'
,p_list_item_link_target=>'f?p=&APP_ID.:20011:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_text_01=>'Enable or disable application features.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(56557596783562478)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Job Reporting'
,p_list_item_link_target=>'f?p=&APP_ID.:30010:&SESSION.::&DEBUG.:30010:::'
,p_list_item_icon=>'fa-user-chart'
,p_list_text_01=>'View status and run details of jobs supporting this application'
,p_required_patch=>wwv_flow_api.id(8935943081653812)
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
