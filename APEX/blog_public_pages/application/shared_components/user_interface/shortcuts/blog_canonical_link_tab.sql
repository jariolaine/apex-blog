prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_tab
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_TAB
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(20324623827351948)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_TAB'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Get canonical link for page that is accessed form tabs. Used in pages 1, 10, 11 and 12 page html header.'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return blog_html.get_tab_canonical_link(',
'  p_page => :APP_PAGE_ID',
');'))
);
wwv_flow_imp.component_end;
end;
/
