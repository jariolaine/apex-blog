prompt --application/shared_components/navigation/search_config/posts
begin
--   Manifest
--     SEARCH CONFIG: Posts
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
 p_id=>wwv_flow_imp.id(38534070280739011)
,p_label=>'Posts'
,p_static_id=>'posts'
,p_search_prefix=>'post'
,p_search_type=>'TEXT_MANUAL'
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_POSTS'
,p_oratext_index_column_name=>'CTX_SEARCH'
,p_oratext_function=>'blog_ctx.get_post_search'
,p_pk_column_name=>'ID'
,p_title_column_name=>'TITLE'
,p_description_column_name=>'POST_DESC'
,p_last_modified_column_name=>'PUBLISHED_ON'
,p_custom_01_column_name=>'CATEGORY_TITLE'
,p_custom_02_column_name=>'VISIBLE_TAGS'
,p_custom_03_column_name=>'NOTES'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.::P12_ID:&ID.'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-file-text-o'
);
wwv_flow_imp.component_end;
end;
/
