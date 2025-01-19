prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(90896897889350262)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>41376320462709
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(91027257899350405)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_text_04=>'Home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(107540241127313166)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Posts'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(109858083846384308)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Comments'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comments-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(89277414089849546)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Links'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(89277696297853045)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'File Repository'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database-file'
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(105706089601793432)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Object Storage'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-file'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(107348647158515591)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
