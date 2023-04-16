prompt --application/shared_components/user_interface/shortcuts/blog_meta_robots_noindex
begin
--   Manifest
--     SHORTCUT: BLOG_META_ROBOTS_NOINDEX
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(7037777593887739)
,p_shortcut_name=>'BLOG_META_ROBOTS_NOINDEX'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Get meta tag robots noindex. Used in page 3, 1001 and 9999 page html header.'
,p_shortcut=>'return blog_html.get_robots_noindex_meta;'
);
wwv_flow_imp.component_end;
end;
/
