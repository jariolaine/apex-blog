prompt --application/shared_components/user_interface/shortcuts/blog_atom_link
begin
--   Manifest
--     SHORTCUT: BLOG_ATOM_LINK
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
 p_id=>wwv_flow_imp.id(39133050302521509)
,p_shortcut_name=>'BLOG_ATOM_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>1
,p_comments=>'Generate atom link to page header. Used in page 1 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return blog_html.get_atom_link(',
'  p_app_id        => :APP_ID',
', p_app_name      => :APP_TEXT$BLOG_APP_NAME',
', p_message       => ''BLOG_ATOM_TITLE''',
', p_build_option  => ''BLOG_FEATURE_ATOM''',
');'))
);
wwv_flow_imp.component_end;
end;
/
