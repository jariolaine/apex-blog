prompt --application/shared_components/user_interface/templates/list/blog_footer_link_list
begin
--   Manifest
--     REGION TEMPLATE: BLOG_FOOTER_LINK_LIST
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(61358318182072659)
,p_list_template_current=>'<li class="z-footerList--item"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="z-footerList--item"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Blog Footer Link List (Custom 1)'
,p_internal_name=>'BLOG_FOOTER_LINK_LIST'
,p_theme_id=>42
,p_theme_class_id=>9
,p_list_template_before_rows=>'<ul class="z-footerList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>' </ul>'
);
wwv_flow_api.component_end;
end;
/
