prompt --application/shared_components/user_interface/templates/report/blog_content
begin
--   Manifest
--     ROW TEMPLATE: BLOG_CONTENT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
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
'<div class="z-Content--Row">',
'  <h3 class="z-Content--Title">',
'    #1#',
'  </h3>',
'  <div class="z-Content--Body">',
'    #2#',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="z-Content #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>42
,p_theme_class_id=>8
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
