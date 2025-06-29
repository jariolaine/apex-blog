prompt --application/shared_components/navigation/lists/configuration
begin
--   Manifest
--     LIST: Configuration
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(107244848973251914)
,p_name=>'Configuration'
,p_list_status=>'PUBLIC'
,p_version_scn=>41501173168858
,p_updated_on=>wwv_flow_imp.dz('20250224145656Z')
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(107245062081251915)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:20012:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_text_01=>'Set the application name, description, email, date formats and other settings.'
,p_list_item_current_type=>'TARGET_PAGE'
,p_updated_on=>wwv_flow_imp.dz('20250224145656Z')
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(107245443260251916)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Features'
,p_list_item_link_target=>'f?p=&APP_ID.:20011:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-layout-header-sidebar-right'
,p_list_text_01=>'Enable or disable public application features.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(108202185960082629)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Popup Pages'
,p_list_item_link_target=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-list'
,p_list_text_01=>'Create and maintain popup pages. A link to the page will appear in the blog footer. For example, create a page for a disclaimer or cookie policy.'
,p_list_item_current_type=>'TARGET_PAGE'
,p_updated_on=>wwv_flow_imp.dz('20250120130826Z')
);
wwv_flow_imp.component_end;
end;
/
