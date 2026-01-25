prompt --application/shared_components/navigation/lists/admin_authentication
begin
--   Manifest
--     LIST: Admin Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(97782102761261998)
,p_name=>'Admin Authentication'
,p_list_status=>'PUBLIC'
,p_version_scn=>41493967465123
,p_created_on=>wwv_flow_imp.dz('20250120124504Z')
,p_updated_on=>wwv_flow_imp.dz('20250204033636Z')
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(97782782129262008)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'APEX'
,p_list_item_link_target=>'f?p=&APP_ID.:20018:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-apex'
,p_list_text_01=>'Enable or disable APEX authentication for this admin application.'
,p_list_text_02=>'&P20010_APEX_AUTH_STATUS.'
,p_list_text_06=>'u-color-4'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20250120124504Z')
,p_updated_on=>wwv_flow_imp.dz('20250204033636Z')
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(97782327936262007)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Google'
,p_list_item_link_target=>'f?p=&APP_ID.:20017:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-google'
,p_list_text_01=>'Set up Google authentication for this admin application.'
,p_list_text_02=>'&P20010_GOOGLE_AUTH_STATUS.'
,p_list_text_06=>'u-color-39'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20250120124504Z')
,p_updated_on=>wwv_flow_imp.dz('20250204033246Z')
);
wwv_flow_imp.component_end;
end;
/
