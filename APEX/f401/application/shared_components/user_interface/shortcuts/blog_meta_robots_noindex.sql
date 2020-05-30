prompt --application/shared_components/user_interface/shortcuts/blog_meta_robots_noindex
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7037777593887739)
,p_shortcut_name=>'BLOG_META_ROBOTS_NOINDEX'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 3, 1001 and 9999 page html header'
,p_shortcut=>'return #OWNER#.blog_html.get_robots_noindex_meta;'
);
end;
/
