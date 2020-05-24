prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_tab
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(20324623827351948)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_TAB'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in pages 1, 10, 11 and 12 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_tab_canonical_link(',
'  p_app_page_id => :APP_PAGE_ALIAS',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
