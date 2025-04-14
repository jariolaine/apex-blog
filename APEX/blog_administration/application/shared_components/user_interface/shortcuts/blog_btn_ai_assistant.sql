prompt --application/shared_components/user_interface/shortcuts/blog_btn_ai_assistant
begin
--   Manifest
--     SHORTCUT: BLOG_BTN_AI_ASSISTANT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(45490182669152695)
,p_shortcut_name=>'BLOG_BTN_AI_ASSISTANT'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_version_scn=>41493778740634
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return',
'  blog_html.get_button(',
'    p_app_id        => :APP_ID',
'  , p_title         => :APP_TEXT$BLOG_BTN_TITLE_AI_ASSISTANT',
'  , p_action        => ''gen-ai-assistant''',
'  , p_icon_classes  => ''fa-lg fa-chatbot''',
'  , p_build_option  => ''BLOG_FEATURE_GENERATIVE_AI''',
'  )',
';'))
,p_created_on=>wwv_flow_imp.dz('20240908124237Z')
,p_updated_on=>wwv_flow_imp.dz('20250202122822Z')
);
wwv_flow_imp.component_end;
end;
/
