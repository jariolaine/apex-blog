prompt --application/shared_components/user_interface/templates/report/media_list_002
begin
--   Manifest
--     ROW TEMPLATE: MEDIA_LIST
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
 p_id=>wwv_flow_api.id(24781131315835089)
,p_row_template_name=>'Blog Media List (Custom 3)'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3 class="z-listStacked--Header">#LIST_GROUP#</h3>',
'<ul class="t-MediaList u-colors t-MediaList--showDesc t-MediaList--showIcons t-MediaList--stack t-MediaList--iconsRounded">',
'  <li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'      <div class="t-MediaList-iconWrap">',
'        <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#">',
'          <span class="t-Icon #ICON_CLASS#"></span>',
'        </span>',
'      </div>',
'      <div class="t-MediaList-body">',
'        <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'        <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'      </div>',
'    </a>',
'  </li>'))
,p_row_template_condition1=>'#ROWNUM# = 1'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<h3 class="z-listStacked--Header z-MediaList">#LIST_GROUP#</h3>',
'<ul class="t-MediaList u-colors t-MediaList--showDesc t-MediaList--showIcons t-MediaList--stack t-MediaList--iconsRounded">',
'  <li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'      <div class="t-MediaList-iconWrap">',
'        <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#">',
'          <span class="t-Icon #ICON_CLASS#"></span>',
'        </span>',
'      </div>',
'      <div class="t-MediaList-body">',
'        <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'        <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'      </div>',
'    </a>',
'  </li>'))
,p_row_template_condition2=>':LIST_SEQ = 1'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'    <div class="t-MediaList-iconWrap">',
'      <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#">',
'        <span class="t-Icon #ICON_CLASS#"></span>',
'      </span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'      <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>'<div class="#COMPONENT_CSS_CLASSES#" id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>',
'<table class="#COMPONENT_CSS_CLASSES#" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_template_options=>'t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
);
wwv_flow_api.component_end;
end;
/
