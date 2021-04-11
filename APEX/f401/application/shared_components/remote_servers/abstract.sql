prompt --application/shared_components/remote_servers/abstract
begin
--   Manifest
--     REMOTE SERVER: Abstract
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(37422434064399125)
,p_name=>'Abstract'
,p_static_id=>'Abstract'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('Abstract'),'https://emailvalidation.abstractapi.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('Abstract'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('Abstract'),'')
,p_prompt_on_install=>false
,p_server_comment=>'Abstract API''s (https://www.abstractapi.com/)'
);
wwv_flow_api.component_end;
end;
/
