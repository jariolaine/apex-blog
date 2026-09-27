prompt --workspace/remote_servers/blog_object_storage
begin
--   Manifest
--     REMOTE SERVER: Blog Object Storage
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_imp_workspace.create_remote_server(
 p_id=>136269997305200778
,p_name=>'Blog Object Storage'
,p_static_id=>'BLOG_OBJECT_STORAGE'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('BLOG_OBJECT_STORAGE'),'https://objectstorage.eu-frankfurt-1.oraclecloud.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('BLOG_OBJECT_STORAGE'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('BLOG_OBJECT_STORAGE'),'')
,p_prompt_on_install=>true
,p_server_comment=>'Remote server for Oracle cloud object storage'
,p_updated_on=>wwv_flow_imp.dz('20250701101345Z')
);
wwv_flow_imp.component_end;
end;
/
