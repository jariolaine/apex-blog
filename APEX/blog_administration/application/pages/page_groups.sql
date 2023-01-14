prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(28670259188910652)
,p_group_name=>'Activity Reporting'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(28670115427911376)
,p_group_name=>'Comments'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8574375481518289)
,p_group_name=>'Configuration'
,p_group_desc=>'Public application configuration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18976025248736506)
,p_group_name=>'Files'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8930100593603171)
,p_group_name=>'General'
,p_group_desc=>'Supporting pages e.g. global page, login page and home'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(4073365241705286)
,p_group_name=>'Links'
,p_group_desc=>'Links and link groups'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(43527387853454697)
,p_group_name=>'Modal Pages'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8929534050595858)
,p_group_name=>'Posts'
,p_group_desc=>'Posts, categories and tags'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8928435152589675)
,p_group_name=>'User Details & Preferences'
,p_group_desc=>'Update currently logged in user'
);
wwv_flow_imp.component_end;
end;
/
