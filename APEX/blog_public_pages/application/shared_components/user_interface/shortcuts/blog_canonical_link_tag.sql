prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_tag
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_TAG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(14614320549586252)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_TAG'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>1
,p_comments=>'Get canonical link for tag. Used in page 6 page html header.'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_html.set_tag_canonical_link(',
'  p_tag_id  => :P6_TAG_ID',
', p_url     => :P0_PAGE_URL',
');',
'return blog_html.get_page_canonical_link;'))
);
wwv_flow_imp.component_end;
end;
/
