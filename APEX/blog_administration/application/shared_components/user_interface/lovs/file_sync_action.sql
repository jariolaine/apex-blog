prompt --application/shared_components/user_interface/lovs/file_sync_action
begin
--   Manifest
--     FILE_SYNC_ACTION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(105676962488365852)
,p_lov_name=>'FILE_SYNC_ACTION'
,p_lov_query=>'.'||wwv_flow_imp.id(105676962488365852)||'.'
,p_location=>'STATIC'
,p_version_scn=>41471983136040
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(105677316676365844)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Only File Names From Object Storage to File Repository'
,p_lov_return_value=>'META'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(110688702244045356)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'From Object Storage to File Repository'
,p_lov_return_value=>'DB'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(105677672243365841)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'From File Repository to Object Storage'
,p_lov_return_value=>'OCI'
);
wwv_flow_imp.component_end;
end;
/
