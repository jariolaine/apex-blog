prompt --application/shared_components/navigation/lists/storage_configuration
begin
--   Manifest
--     LIST: Storage Configuration
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
 p_id=>wwv_flow_imp.id(117524284844700814)
,p_name=>'Storage Configuration'
,p_list_status=>'PUBLIC'
,p_version_scn=>41492154948242
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(117525307922700798)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Object Storage'
,p_list_item_link_target=>'f?p=&APP_ID.:20013:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cloud-file'
,p_list_text_01=>'Configure Oracle cloud object storage for file storage.'
,p_list_text_02=>'&P20010_OCI_OS_STATUS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(117525623756700798)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Synchronize Files'
,p_list_item_link_target=>'f?p=&APP_ID.:20014:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-refresh'
,p_list_text_01=>'Synchronize file between object storage and local file repository. '
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
