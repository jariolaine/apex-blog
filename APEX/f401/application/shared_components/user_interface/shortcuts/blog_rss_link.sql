prompt --application/shared_components/user_interface/shortcuts/blog_rss_link
begin
--   Manifest
--     SHORTCUT: BLOG_RSS_LINK
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(4293491733566665)
,p_shortcut_name=>'BLOG_RSS_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Generate RSS link to page header. Used in page 1 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_link(',
'   p_app_id       => :APP_ID',
'  ,p_app_name     => :G_APP_NAME',
'  ,p_message      => ''BLOG_RSS_TITLE''',
'  ,p_build_option => ''BLOG_FEATURE_RSS''',
');'))
);
wwv_flow_api.component_end;
end;
/
