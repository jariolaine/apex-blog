prompt --application/shared_components/files/ico_site_webmanifest
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B226E616D65223A22222C2273686F72745F6E616D65223A22222C2269636F6E73223A5B7B22737263223A222F616E64726F69642D6368726F6D652D313932783139322E706E67222C2273697A6573223A2231393278313932222C2274797065223A2269';
wwv_flow_api.g_varchar2_table(2) := '6D6167652F706E67227D2C7B22737263223A222F616E64726F69642D6368726F6D652D353132783531322E706E67222C2273697A6573223A2235313278353132222C2274797065223A22696D6167652F706E67227D5D2C227468656D655F636F6C6F7222';
wwv_flow_api.g_varchar2_table(3) := '3A2223666666666666222C226261636B67726F756E645F636F6C6F72223A2223666666666666222C22646973706C6179223A227374616E64616C6F6E65227D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(40623394059095115)
,p_file_name=>'ico/site.webmanifest'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
