prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_category
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14613389629557078)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_CATEGORY'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 14 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_category_canonical_link(',
'  p_category_id => :P14_CATEGORY_ID',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
