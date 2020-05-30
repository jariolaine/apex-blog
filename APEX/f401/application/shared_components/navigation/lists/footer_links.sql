prompt --application/shared_components/navigation/lists/footer_links
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(31530391355020722)
,p_name=>'Footer Links'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(31530506390020721)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Cookies'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-shield'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(31530928767020720)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Disclaimer'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-exclamation-circle-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
