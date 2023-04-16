prompt --application/shared_components/navigation/search_config/links
begin
--   Manifest
--     SEARCH CONFIG: Links
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(38744651530749493)
,p_label=>'Links'
,p_static_id=>'links'
,p_search_prefix=>'link'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_LINKS'
,p_searchable_columns=>'LINK_TITLE:LINK_DESC:GROUP_TITLE'
,p_query_order_by=>'group_display_seq, display_seq'
,p_pk_column_name=>'LINK_ID'
,p_title_column_name=>'LINK_TITLE'
,p_description_column_name=>'LINK_DESC'
,p_badge_column_name=>'GROUP_TITLE'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-external-link'
,p_default_row_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a class="a-ResultsItem &RESULT_CSS_CLASSES!ATTR." &LINK_ATTR!RAW. href="&LINK_URL!ATTR.">',
'  <div class="a-ResultsItem-icon u-color-var">',
'    <span class="fa &ICON_VALUE!ATTR." aria-hidden="true"></span>',
'  </div>',
'  <div class="a-ResultsItem-content">',
'    <div class="a-ResultsItem-header">',
'      <span class="a-ResultsItem-title u-hot-text">&LINK_TITLE.</span>',
'      <span class="a-ResultsItem-badge">&GROUP_TITLE.</span>',
'    </div>',
'    <div class="a-ResultsItem-description">&LINK_DESC.</div>',
'  </div>',
'</a>'))
,p_build_option_id=>wwv_flow_imp.id(6905258727754156)
);
wwv_flow_imp.component_end;
end;
/
