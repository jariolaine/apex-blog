prompt --application/shared_components/user_interface/shortcuts/blog_rss_anchor
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7038895780985689)
,p_shortcut_name=>'BLOG_RSS_ANCHOR'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in global page (page 0) region'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_anchor(',
'  p_app_name => :G_APP_NAME',
');'))
);
end;
/
