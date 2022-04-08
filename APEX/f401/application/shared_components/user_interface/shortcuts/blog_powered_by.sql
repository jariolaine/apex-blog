prompt --application/shared_components/user_interface/shortcuts/blog_powered_by
begin
--   Manifest
--     SHORTCUT: BLOG_POWERED_BY
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(61374272106979158)
,p_shortcut_name=>'BLOG_POWERED_BY'
,p_shortcut_type=>'HTML_TEXT'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="z-copyright">',
'<a href="https://github.com/jariolaine/apex-blog" title="Blog application built with Oracle Application Express (APEX)">',
'Powered By APEX Blog',
'</a></div>'))
);
wwv_flow_api.component_end;
end;
/
