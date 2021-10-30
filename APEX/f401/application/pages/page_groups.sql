prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(65048103982446247)
,p_group_name=>'Comments'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8700188054171688)
,p_group_name=>'General'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8697986188142973)
,p_group_name=>'Results'
,p_group_desc=>'Pages showing results of search, categories, tags and single post'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(20718112665951240)
,p_group_name=>'Sitemap Main'
,p_group_desc=>'Pages accessed from tab'
);
wwv_flow_api.component_end;
end;
/
