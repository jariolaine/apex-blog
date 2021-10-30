prompt --application/pages/page_01003
begin
--   Manifest
--     PAGE: 01003
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>1003
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Sitemap, RSS and File Download'
,p_alias=>'PGM'
,p_step_title=>'Sitemap, RSS and File Download'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8700188054171688)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_browser_cache=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20211030114325'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(62674058371144805)
,p_branch_name=>'Go to Home Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63036620652126597)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'rss.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_xml.rss(',
'   p_rss_url  => :G_RSS_URL',
'  ,p_app_name => :G_APP_NAME',
'  ,p_app_desc => :G_APP_DESC',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(8635198962090938)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63037094013126597)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'rss.xsl'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_xml.rss_xsl(',
'  p_ws_images => :APP_IMAGES',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(8635198962090938)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63037470481126597)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-index.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_xml.sitemap_index(',
'   p_app_id        => :APP_ID',
'  ,p_app_page_id   => :APP_PAGE_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63037810302126598)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-main.xml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_xml.sitemap_main(',
'   p_app_id     => :APP_ID',
'  ,p_page_group => ''Sitemap Main''',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63038262775126598)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-posts.xml'
,p_process_sql_clob=>'#OWNER#.blog_xml.sitemap_posts;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63038641489126598)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-categories.xml'
,p_process_sql_clob=>'#OWNER#.blog_xml.sitemap_categories;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63039095924126598)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-archives.xml'
,p_process_sql_clob=>'#OWNER#.blog_xml.sitemap_archives;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63039494696126598)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sitemap-tags.xml'
,p_process_sql_clob=>'#OWNER#.blog_xml.sitemap_tags;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_api.id(41172379976935637)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63039875243126599)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.download_file (',
'   p_file_name => :P11_FILE_NAME',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
