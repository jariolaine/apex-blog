prompt --application/shared_components/user_interface/shortcuts/blog_meta_post_description
begin
--   Manifest
--     SHORTCUT: BLOG_META_POST_DESCRIPTION
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14609528802278469)
,p_shortcut_name=>'BLOG_META_POST_DESCRIPTION'
,p_shortcut_type=>'FUNCTION_BODY'
,p_comments=>'Used in page 2 page html header'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_post_description_meta(',
'  p_post_id => :P2_POST_ID',
');'))
);
wwv_flow_api.component_end;
end;
/
