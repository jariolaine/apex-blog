prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(28670115427911376)
,p_group_name=>'Comments'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8574375481518289)
,p_group_name=>'Configuration'
,p_group_desc=>'Public application configuration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(18976025248736506)
,p_group_name=>'Files'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8930100593603171)
,p_group_name=>'General'
,p_group_desc=>'Supporting pages e.g. global page, login page and home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(4073365241705286)
,p_group_name=>'Links'
,p_group_desc=>'Links and link groups'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8929534050595858)
,p_group_name=>'Posts'
,p_group_desc=>'Posts, categories and tags'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(28670259188910652)
,p_group_name=>'Reporting'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8928435152589675)
,p_group_name=>'User Details & Preferences'
,p_group_desc=>'Update currently logged in user'
);
end;
/
