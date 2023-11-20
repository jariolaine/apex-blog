prompt --application/shared_components/navigation/search_config/comments
begin
--   Manifest
--     SEARCH CONFIG: Comments
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(9179327552270533)
,p_label=>'Comments'
,p_static_id=>'comments'
,p_search_prefix=>'comments'
,p_search_type=>'TEXT_MANUAL'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select',
'   v1.comment_id     as comment_id',
'  ,v1.post_id        as post_id',
'  ,v1.parent_id      as parent_id',
'  ,v1.created_on     as created_on',
'  ,v1.comment_by     as comment_by',
'  ,v1.post_title     as post_title',
'  ,v1.comment_body   as comment_body',
'  ,v1.user_icon      as user_icon',
'  ,v1.icon_modifier  as icon_modifier',
'  ,v1.ctx_search     as ctx_search',
'from blog_v_comments v1'))
,p_oratext_index_column_name=>'CTX_SEARCH'
,p_oratext_function=>'blog_ctx.get_post_search'
,p_query_order_by=>':APEX$ORATEXT_SCORE desc, created_on desc'
,p_pk_column_name=>'COMMENT_ID'
,p_title_column_name=>'POST_TITLE'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-comment-o'
,p_result_css_classes=>'blog-comment'
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
'      <span class="a-ResultsItem-title u-flex-grow-1"><a href="f?p=&APP_ID.:POST:&SESSION.::::P2_POST_ID:&POST_ID.">&POST_TITLE.</a></span>',
'      <span class="a-ResultsItem-badge">&APP_TEXT$BLOG_TXT_COMMENT.</span>',
'    </div>',
'    <div class="t-Comments-info">&COMMENT_BY. <span class="t-Comments-date">&CREATED_ON.</span></div>',
'    <div class="a-ResultsItem-description">&COMMENT_BODY!RAW.</div>',
'  </div>',
'</div>'))
,p_build_option_id=>wwv_flow_imp.id(8667733481689180)
);
wwv_flow_imp.component_end;
end;
/
