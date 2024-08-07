prompt --application/shared_components/user_interface/templates/report/blog_content
begin
--   Manifest
--     ROW TEMPLATE: BLOG_CONTENT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(30641878306098019)
,p_row_template_name=>'Blog Content (Custom 2)'
,p_internal_name=>'BLOG_CONTENT'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="blog-Content--Row">',
'  <h3 class="blog-Content--Title">#REGION_TITLE#</h3>',
'  <div class="blog-Content--Body">',
'    #BODY_HTML#',
'  </div>',
'</div>'))
,p_row_template_condition1=>':REGION_TITLE is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="padding-bottom-md">',
'  #BODY_HTML#',
'  #CHANGED_ON#',
'</div>'))
,p_row_template_before_rows=>'<div class="blog-Content #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>42
,p_theme_class_id=>8
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
