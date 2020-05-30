prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_tag
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14614320549586252)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_TAG'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 6 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_tag_canonical_link(',
'  p_tag_id => :P6_TAG_ID',
');'))
);
end;
/
