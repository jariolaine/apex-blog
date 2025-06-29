prompt --application/shared_components/navigation/search_config/posts
begin
--   Manifest
--     SEARCH CONFIG: Posts
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(166087492680942355)
,p_label=>'Posts'
,p_static_id=>'posts'
,p_search_prefix=>'post'
,p_search_type=>'TEXT_MANUAL'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.post_id         as post_id',
'  ,v1.blogger_name    as blogger_name',
'  ,v1.post_title      as post_title',
'  ,v1.category_title  as category_title',
'  ,v1.category_url    as category_url',
'  ,v1.published_on    as published_on',
'  ,v1.post_url        as post_url',
'  ,v1.post_desc       as post_desc',
'  ,v1.ctx_search      as ctx_search',
'  ,v1.tags_html1      as tags_html',
' from blog_v_posts v1'))
,p_oratext_index_column_name=>'CTX_SEARCH'
,p_oratext_function_type=>'SEARCH_ENGINE'
,p_query_order_by=>'APEX$ORATEXT_SCORE desc'
,p_pk_column_name=>'POST_ID'
,p_title_column_name=>'POST_TITLE'
,p_subtitle_column_name=>'POST_DESC'
,p_last_modified_column_name=>'PUBLISHED_ON'
,p_custom_01_column_name=>'CATEGORY_TITLE'
,p_custom_02_column_name=>'TAGS_HTML'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-file-text-o fa-lg'
,p_default_row_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-ResultsItem &RESULT_CSS_CLASSES!ATTR.">',
'  {if ?ICON_VALUE/}',
'    {case ICON_TYPE/}',
'      {when INITIALS/}',
'        <div class="a-ResultsItem-initials u-color-var">&ICON_VALUE!HTML.</div>',
'      {when URL/}',
'        <div class="a-ResultsItem-image"><img src="&ICON_VALUE!ATTR." alt="&POST_TITLE!ATTR." role="presentation" /></div>',
'      {when CLASS/}',
'        <div class="a-ResultItem-icon u-color-var"><span class="fa &ICON_VALUE!ATTR." aria-hidden="true"></span></div>',
'    {endcase/}',
'  {endif/}',
'  <div class="a-ResultsItem-content">',
'    <div class="a-ResultsItem-header">',
'      <span class="a-ResultsItem-title u-flex-grow-1"><a href="&POST_URL!ATTR.">&POST_TITLE!HTML.</a></span>',
'      <span class="a-ResultsItem-badge">&APP_TEXT$BLOG_TXT_POST!HTML.</span>',
'    </div>',
'    <div class="a-ResultsItem-description">&POST_DESC!HTML.</div>',
'    <div class="a-ResultsItem-attributes">',
'      <span class="a-ResultsItem-attribute">&APP_TEXT$BLOG_TXT_CATEGORY!HTML.: <a href="&CATEGORY_URL!ATTR.">&CATEGORY_TITLE!HTML.</a></span>',
'    </div>',
'    <div class="a-ResultsItem-attributes">',
'      <span class="a-ResultsItem-attribute">&APP_TEXT$BLOG_TXT_POSTED_BY!HTML.: &BLOGGER_NAME!HTML.</span>',
'    </div>',
'    <div class="a-ResultsItem-attributes">',
'      <span class="a-ResultsItem-attribute">&APP_TEXT$BLOG_TXT_POSTED_ON!HTML.: &PUBLISHED_ON!HTML.</span>',
'    </div>',
'    {if TAGS_HTML/}',
'    <div class="a-ResultsItem-attributes">',
'      <span class="a-ResultsItem-attribute">&APP_TEXT$BLOG_TXT_TAGS!HTML.: &TAGS_HTML!RAW.</span>',
'    </div>',
'    {endif/}',
'  </div>',
'</div>'))
,p_version_scn=>41486949300226
,p_build_option_id=>wwv_flow_imp.id(136061722810585314)
,p_updated_on=>wwv_flow_imp.dz('20241123083505Z')
);
wwv_flow_imp.component_end;
end;
/
