prompt --application/shared_components/user_interface/shortcuts/blog_btn_post_title
begin
--   Manifest
--     SHORTCUT: BLOG_BTN_POST_TITLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(115280963629276720)
,p_shortcut_name=>'BLOG_BTN_POST_TITLE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>41472964238011
,p_comments=>'Post page title item post text button'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return',
'  blog_html.get_button(',
'    p_app_id        => :APP_ID',
'  , p_title         => :APP_TEXT$BLOG_BTN_TITLE_GEN_AI_POST_TITLE',
'  , p_action        => ''gen-ai-post-title''',
'  , p_icon_classes  => ''fa-lg fa-ai-generative''',
'  , p_build_option  => ''BLOG_FEATURE_GENERATIVE_AI''',
'  )',
';'))
);
wwv_flow_imp.component_end;
end;
/
