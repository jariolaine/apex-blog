prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_category
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_CATEGORY
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14613389629557078)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_CATEGORY'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Used in page 14 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_category_canonical_link(',
'  p_category_id => :P14_CATEGORY_ID',
');'))
);
wwv_flow_api.component_end;
end;
/
