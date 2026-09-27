prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(192442093311342381)
,p_group_name=>'Comments'
,p_static_id=>'comments'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(136094177383067822)
,p_group_name=>'General'
,p_static_id=>'general'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(136091975517039107)
,p_group_name=>'Post Report'
,p_static_id=>'post-report'
,p_group_desc=>'Pages showing report of search, categories, tags and single post'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(148112101994847374)
,p_group_name=>'Sitemap Main'
,p_static_id=>'sitemap-main'
,p_group_desc=>'Pages accessed from tab and included to sitemap-main'
);
wwv_flow_imp.component_end;
end;
/
