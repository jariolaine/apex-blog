prompt --application/shared_components/user_interface/shortcuts/blog_canonical_link_post
begin
--   Manifest
--     SHORTCUT: BLOG_CANONICAL_LINK_POST
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14610353218419017)
,p_shortcut_name=>'BLOG_CANONICAL_LINK_POST'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut_language=>'PLSQL'
,p_comments=>'Get canonical link for post. Used in page 2 page html header.'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_post_canonical_link(',
'  p_post_id => :P2_POST_ID',
');'))
);
wwv_flow_api.component_end;
end;
/
