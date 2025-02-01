prompt --application/shared_components/navigation/lists/oracle_cloud
begin
--   Manifest
--     LIST: Oracle Cloud
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
 p_id=>wwv_flow_imp.id(98626541698938637)
,p_name=>'Oracle Cloud'
,p_list_status=>'PUBLIC'
,p_version_scn=>41492475789557
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(98626773594938645)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'API Key'
,p_list_item_link_target=>'f?p=&APP_ID.:20019:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-id-card-o'
,p_list_text_01=>'Set the Oracle Cloud API signing key for Object Storage and Language AI services.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
