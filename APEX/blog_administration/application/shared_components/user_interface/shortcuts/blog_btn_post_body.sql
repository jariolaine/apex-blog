prompt --application/shared_components/user_interface/shortcuts/blog_btn_post_body
begin
--   Manifest
--     SHORTCUT: BLOG_BTN_POST_BODY
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
 p_id=>wwv_flow_imp.id(116080467542374228)
,p_shortcut_name=>'BLOG_BTN_POST_BODY'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>41493778759980
,p_comments=>'Post editor item post text button'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return',
'  blog_html.get_button(',
'    p_app_id          => :APP_ID',
'  , p_title           => :APP_TEXT$BLOG_BTN_TITLE_RECORD',
'  , p_action          => ''record-post''',
'  , p_icon_classes    => ''fa-lg fa-microphone''',
'  , p_button_classes  => ''t-Button t-Button--noLabel t-Button--icon t-Button--link margin-top-lg u-align-self-flex-start''',
'  , p_build_option    => ''BLOG_FEATURE_POST_SPEECH''',
'  )',
';'))
,p_updated_on=>wwv_flow_imp.dz('20250202122846Z')
);
wwv_flow_imp.component_end;
end;
/
