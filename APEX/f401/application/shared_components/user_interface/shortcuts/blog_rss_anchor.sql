prompt --application/shared_components/user_interface/shortcuts/blog_rss_anchor
begin
--   Manifest
--     SHORTCUT: BLOG_RSS_ANCHOR
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7038895780985689)
,p_shortcut_name=>'BLOG_RSS_ANCHOR'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Used in global page (page 0) region'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_anchor(',
'   p_app_name => :G_APP_NAME',
');'))
);
wwv_flow_api.component_end;
end;
/
