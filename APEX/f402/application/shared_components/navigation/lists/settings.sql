prompt --application/shared_components/navigation/lists/settings
begin
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
,p_list_text_01=>'Setup blog title, blog Description and other basic settings'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(24799320618419825)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Configuration Options'
,p_list_item_link_target=>'f?p=&APP_ID.:20011:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_text_01=>'Enable or disable application features'
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
end;
/
