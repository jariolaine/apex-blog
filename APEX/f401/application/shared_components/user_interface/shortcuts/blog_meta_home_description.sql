prompt --application/shared_components/user_interface/shortcuts/blog_meta_home_description
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14606629384151086)
,p_shortcut_name=>'BLOG_META_HOME_DESCRIPTION'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 1 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_description_meta(',
'  p_desc => :G_APP_DESC',
');'))
);
end;
/
