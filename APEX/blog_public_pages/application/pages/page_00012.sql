prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'About'
,p_alias=>'ABOUT'
,p_step_title=>'About | &P0_BLOG_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(148112101994847374)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(157505626766866589)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(157824699827649264)
,p_name=>'About Bloggers'
,p_template=>wwv_flow_imp.id(134175361497163509)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.blogger_name  as region_title',
'  ,t1.blogger_desc  as body_html',
'from blog_v_bloggers t1',
'where 1 = 1',
'order by t1.display_seq'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>31536000
,p_plug_cache_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_cache_when_condition_e1=>'DEBUG'
,p_plug_cache_when_condition_e2=>'NO'
,p_plug_cache_depends_on_items=>'APP_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(158035867634994153)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146848429827259658)
,p_query_column_id=>1
,p_column_alias=>'REGION_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Region Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(146848515631259659)
,p_query_column_id=>2
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>20
,p_column_heading=>'Body Html'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080891506157861)
,p_meta_tag_name=>'description'
,p_meta_tag_value=>'About this blog and blog author.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081071362157862)
,p_meta_tag_name=>'og:description'
,p_meta_tag_value=>'About this blog and blog author.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081169148157863)
,p_meta_tag_name=>'og:image'
,p_meta_tag_value=>'&APP_FILES.icons/app-icon-512.png'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081237240157864)
,p_meta_tag_name=>'og:title'
,p_meta_tag_value=>'About | &P0_BLOG_APP_NAME.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081351238157865)
,p_meta_tag_name=>'og:type'
,p_meta_tag_value=>'website'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081436272157866)
,p_meta_tag_name=>'og:url'
,p_meta_tag_value=>'&P0_PAGE_URL.'
);
wwv_flow_imp.component_end;
end;
/
