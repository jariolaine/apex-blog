prompt --application/shared_components/navigation/lists/home
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(9067056365154845)
,p_name=>'Home'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9067280046154845)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Posts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-text-o'
,p_list_text_01=>'Create, edit, manage or delete a post'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6828803859997698)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Links'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-external-link'
,p_list_text_01=>'Add links to useful sites and/or create blogroll'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9074935894314798)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Files'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-files-o'
,p_list_text_01=>'View and upload files to share or e.g. add pictures to repository for posts'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
