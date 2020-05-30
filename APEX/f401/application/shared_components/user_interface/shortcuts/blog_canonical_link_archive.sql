prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_archive
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14616166855626773)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_ARCHIVE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 15 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_archive_canonical_link(',
'  p_archive_id => :P15_ARCHIVE_ID',
');'))
);
end;
/
