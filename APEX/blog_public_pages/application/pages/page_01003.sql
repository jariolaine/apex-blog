prompt --application/pages/page_01003
begin
--   Manifest
--     PAGE: 01003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>1003
,p_name=>'Sitemap, RSS and File Download'
,p_alias=>'PGM'
,p_step_title=>'Sitemap, RSS and File Download'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(136094177383067822)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_browser_cache=>'Y'
,p_page_comment=>'Page to hold Ajax callback processes e.g. for generate RSS feed and download files.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(190068047700040939)
,p_branch_name=>'Go to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(144393761508295949)
,p_name=>'P1003_FILE_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190430609981022731)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'rss.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_xml.rss(',
'  p_app_name  => :P0_BLOG_APP_NAME',
', p_app_desc  => :P0_BLOG_APP_DESC',
');',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(136029188290987072)
,p_internal_uid=>63036620652126597
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(165714616474623535)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'atom.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_xml.atom(',
'  p_app_name  => :P0_BLOG_APP_NAME',
', p_app_desc  => :P0_BLOG_APP_DESC',
');',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(166522583683199558)
,p_internal_uid=>38320627145727401
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190431083342022731)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'rss.xsl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_xml.rss_xsl(',
'  p_css_file => :APP_FILES || ''css/rss-xsl.min.css''',
');'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(136029188290987072)
,p_internal_uid=>63037094013126597
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190431459810022731)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-index.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_xml.sitemap_index(',
'   p_app_id       => :APP_ID',
'  ,p_app_page_id  => :APP_PAGE_ID',
'  ,p_process_name => ''sitemap-index.xml'' ',
');'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63037470481126597
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190431799631022732)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-main.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_xml.sitemap_main(',
'  p_app_id      => :APP_ID',
', p_page_group  => ''Sitemap Main''',
');'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63037810302126598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190432252104022732)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-posts.xml'
,p_process_sql_clob=>'blog_xml.sitemap_posts;'
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63038262775126598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190432630818022732)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-categories.xml'
,p_process_sql_clob=>'blog_xml.sitemap_categories;'
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63038641489126598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190433085253022732)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-archives.xml'
,p_process_sql_clob=>'blog_xml.sitemap_archives;'
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63039095924126598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190433484025022732)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-tags.xml'
,p_process_sql_clob=>'blog_xml.sitemap_tags;'
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(168566369305831771)
,p_internal_uid=>63039494696126598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190433864572022733)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.download_file (',
'  p_file_path => :P1003_FILE_NAME',
');'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>-wwv_flow_imp.id(145826259194060489)
,p_internal_uid=>63039875243126599
);
wwv_flow_imp.component_end;
end;
/
