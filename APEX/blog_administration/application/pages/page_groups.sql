prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(111116381830742743)
,p_group_name=>'Activity Reporting'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(102692173815582943)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(111116238069743467)
,p_group_name=>'Comments'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(91020498123350380)
,p_group_name=>'Configuration'
,p_group_desc=>'Public application configuration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(101422147890568597)
,p_group_name=>'Files'
,p_group_desc=>'Database and object storage'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(91376223235435262)
,p_group_name=>'General'
,p_group_desc=>'Supporting pages e.g. global page, login page and home'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(86519487883537377)
,p_group_name=>'Links'
,p_group_desc=>'Links and link groups'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(125973510495286788)
,p_group_name=>'Modal Pages'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(91375656692427949)
,p_group_name=>'Posts'
,p_group_desc=>'Posts, categories and tags'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(91374557794421766)
,p_group_name=>'User Details & Preferences'
,p_group_desc=>'Update currently logged in user'
);
wwv_flow_imp.component_end;
end;
/
