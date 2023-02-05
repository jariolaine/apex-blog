prompt --application/shared_components/user_interface/templates/list/blog_tag_cloud
begin
--   Manifest
--     REGION TEMPLATE: BLOG_TAG_CLOUD
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(13219456187408808)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="z-tagCloud-item">',
'  <a class="z-tagCloud-link" href="#LINK#" data-weight="#A02#">',
'    <span class="z-tagCloud-text">#TEXT#</span>',
'    <span class="z-tagCloud-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="z-tagCloud-item">',
'  <a class="z-tagCloud-link" href="#LINK#" data-weight="#A02#">',
'    <span class="z-tagCloud-text">#TEXT#</span>',
'    <span class="z-tagCloud-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Blog Tag Cloud (Custom 2)'
,p_internal_name=>'BLOG_TAG_CLOUD'
,p_theme_id=>42
,p_theme_class_id=>10
,p_list_template_before_rows=>' <ul class="z-tagCloud #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>' </ul>'
,p_a01_label=>'Badge'
,p_a02_label=>'Tag weight as an integer between 1 and 8'
);
wwv_flow_imp.component_end;
end;
/