prompt --application/shared_components/user_interface/templates/list/blog_tag_cloud
begin
--   Manifest
--     REGION TEMPLATE: BLOG_TAG_CLOUD
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(13219456187408808)
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
);
wwv_flow_api.component_end;
end;
/
