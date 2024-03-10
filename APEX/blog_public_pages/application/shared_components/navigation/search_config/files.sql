prompt --application/shared_components/navigation/search_config/files
begin
--   Manifest
--     SEARCH CONFIG: Files
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(38726917014540459)
,p_label=>'Files'
,p_static_id=>'files'
,p_search_prefix=>'file'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.file_id   as file_id',
'  ,v1.file_name as file_name',
'  ,v1.file_desc as file_desc',
'  ,v1.file_size as file_size',
'  ,v1.file_url  as file_url',
'from blog_v_files v1',
'where 1 = 1',
'  and v1.is_download = 1',
'  order by v1.file_name'))
,p_searchable_columns=>'FILE_NAME:FILE_DESC'
,p_pk_column_name=>'FILE_ID'
,p_title_column_name=>'FILE_NAME'
,p_description_column_name=>'FILE_DESC'
,p_badge_column_name=>'FILE_SIZE'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-download'
,p_default_row_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-ResultsItem &RESULT_CSS_CLASSES!ATTR.">',
'  {if ?ICON_VALUE/}',
'    {case ICON_TYPE/}',
'      {when INITIALS/}',
'        <div class="a-ResultItem-initials u-color-var">&ICON_VALUE.</div>',
'      {when URL/}',
'        <div class="a-ResultItem-image"><img src="&ICON_VALUE!ATTR." alt="&ENAME!ATTR." role="presentation" /></div>',
'      {when CLASS/}',
'        <div class="a-ResultItem-icon u-color-var"><span class="fa &ICON_VALUE!ATTR." aria-hidden="true"></span></div>',
'    {endcase/}',
'  {endif/}',
'  <div class="a-ResultsItem-content">',
'    <div class="a-ResultsItem-header">',
'      <span class="a-ResultsItem-title u-flex-grow-1"><a href="&FILE_URL!ATTR.">&FILE_NAME.</a></span>',
'      <span class="a-ResultsItem-badge">&APP_TEXT$BLOG_TXT_FILE.</span>',
'    </div>',
'    <div class="a-ResultsItem-description">&FILE_DESC.</div>',
'    <div class="a-ResultsItem-misc">&FILE_SIZE.</div>',
'  </div>',
'</div>'))
,p_build_option_id=>wwv_flow_imp.id(24626889314854172)
);
wwv_flow_imp.component_end;
end;
/
