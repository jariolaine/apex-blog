prompt --application/shared_components/user_interface/templates/report/blog_posts_custom_1
begin
--   Manifest
--     ROW TEMPLATE: BLOG_POSTS_CUSTOM_1
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6894976353301648)
,p_row_template_name=>'Blog Posts (Custom 1)'
,p_internal_name=>'BLOG_POSTS_CUSTOM_1'
,p_javascript_code_onload=>'blog.UI.formatProgramCode("pre.z-program-code");'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">',
'    #BODY_HTML#',
'    <p>#READ_MORE_LINK#</p>',
'  </div>',
'  <footer class="z-post--footer"></footer>',
'</article>'))
,p_row_template_condition1=>':READ_MORE_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--tags">#TAGS_HTML#</footer>',
'</article>'))
,p_row_template_condition2=>':TAGS_HTML is not null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--footer"></footer>',
'</article>'))
,p_row_template_before_rows=>'<div class="#COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_posts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="z-posts--pagination">',
'  <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">',
'    #PAGINATION#',
'  </table>  ',
'</div>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="t-Report-paginationText">#TEXT#</span>',
''))
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>'<button onclick="#LINK#" type="button" title="#PAGINATION_NEXT_SET#" aria-label="#PAGINATION_NEXT_SET#" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot t-Button--small t-Button--simple"><span aria-hidden="true" class="t-Icon fa fa-chev'
||'ron-right"></span></button>'
,p_previous_set_template=>'<button onclick="#LINK#" type="button" title="#PAGINATION_PREVIOUS_SET#" aria-label="#PAGINATION_PREVIOUS_SET#" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot t-Button--small t-Button--simple"><span aria-hidden="true" class="t-Icon fa'
||' fa-chevron-left"></span></button>'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'z-posts'
);
wwv_flow_api.component_end;
end;
/
