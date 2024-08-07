prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_category
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_CATEGORY
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
 p_id=>wwv_flow_imp.id(14613389629557078)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_CATEGORY'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>1
,p_comments=>'Get canonical link for category. Used in page 14 page html header.'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_html.set_category_canonical_link(',
'  p_category_id => :P14_CATEGORY_ID',
', p_url         => :P0_PAGE_URL',
');',
'return blog_html.get_page_canonical_link;'))
);
wwv_flow_imp.component_end;
end;
/
