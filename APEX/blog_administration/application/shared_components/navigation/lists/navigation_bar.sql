prompt --application/shared_components/navigation/lists/navigation_bar
begin
--   Manifest
--     LIST: Navigation Bar
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8570714984518262)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11946249778272409)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'About'
,p_list_item_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-question-circle-o '
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19072752156019791)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Help'
,p_list_item_link_target=>'f?p=&APP_ID.:201:&SESSION.:12:&DEBUG.::::'
,p_list_item_icon=>'fa-question-circle-o'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'11'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8582761687518324)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'&G_BLOGGER_NAME.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8873205810704269)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Edit Profile'
,p_list_item_link_target=>'f?p=&APP_ID.:501:&SESSION.::&DEBUG.:501:::'
,p_list_item_icon=>'fa-id-card-o'
,p_parent_list_item_id=>wwv_flow_imp.id(8582761687518324)
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8960833415552711)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(8582761687518324)
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8583599195518325)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(8582761687518324)
,p_list_item_current_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/