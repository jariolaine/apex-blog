prompt --application/shared_components/user_interface/shortcuts/blog_rss_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(4293491733566665)
,p_shortcut_name=>'BLOG_RSS_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 1 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_link(',
'   p_app_name => :G_APP_NAME',
'  ,p_build_option_status => apex_util.get_build_option_status(',
'     p_application_id     => :APP_ID',
'    ,p_build_option_name => ''BLOG_FEATURE_RSS''',
'  )',
');'))
);
end;
/
