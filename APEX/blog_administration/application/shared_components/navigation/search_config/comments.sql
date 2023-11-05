prompt --application/shared_components/navigation/search_config/comments
begin
--   Manifest
--     SEARCH CONFIG: Comments
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(38574875249914535)
,p_label=>'Comments'
,p_static_id=>'comments'
,p_search_prefix=>'comment'
,p_search_type=>'TEXT_MANUAL'
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_COMMENTS'
,p_oratext_index_column_name=>'CTX_SEARCH'
,p_oratext_function=>'blog_ctx.get_post_search'
,p_pk_column_name=>'ID'
,p_title_column_name=>'POST_TITLE'
,p_description_column_name=>'SEARCH_DESC'
,p_last_modified_column_name=>'CREATED_ON'
,p_custom_01_column_name=>'COMMENT_BY'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:61:&APP_SESSION.::&DEBUG.::P61_ID:\&ID.\'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp.component_end;
end;
/
