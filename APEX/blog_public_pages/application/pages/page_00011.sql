prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Files'
,p_alias=>'REPOSITORY'
,p_step_title=>'Files | &P0_BLOG_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(148112101994847374)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(152020878643750306)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(149868961803452376)
,p_name=>'File Repository'
,p_template=>wwv_flow_imp.id(136654216902452216)
,p_display_sequence=>10
,p_region_css_classes=>'blog-MediaList--files blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ResultsRegion--boxed'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  null            as icon_class -- see column HTML expression',
', null            as icon_color_class',
', v1.file_name    as list_title',
', v1.file_desc    as list_text',
', v1.file_size    as list_badge',
', null            as list_class',
', v1.file_url     as link       -- see column HTML expression',
', null            as link_attr  -- see column HTML expression',
', null            as link_class',
'from blog_v_files v1',
'where 1 = 1',
'  and v1.is_download = 1',
'order by v1.file_name'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>31536000
,p_plug_cache_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_cache_when_condition_e1=>'DEBUG'
,p_plug_cache_when_condition_e2=>'NO'
,p_plug_cache_depends_on_items=>'APP_ID'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(134209208590163527)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>100
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'See column HTML expression for icon class, link and link_attr columns.',
'Report shows files from object storage.'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869073620452377)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'fa fa-download'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869123637452378)
,p_query_column_id=>2
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869225254452379)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>70
,p_column_heading=>'List Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869383445452380)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>80
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869417428452381)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>90
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869564919452382)
,p_query_column_id=>6
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>100
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869670663452383)
,p_query_column_id=>7
,p_column_alias=>'LINK'
,p_column_display_sequence=>110
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(149869776119452384)
,p_query_column_id=>8
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>120
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'download target="_blank"'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(150703542183243035)
,p_query_column_id=>9
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>130
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080115049157853)
,p_meta_tag_name=>'description'
,p_meta_tag_value=>'A file repository where you can download files.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080263576157854)
,p_meta_tag_name=>'og:description'
,p_meta_tag_value=>'A file repository where you can download files.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080388055157855)
,p_meta_tag_name=>'og:image'
,p_meta_tag_value=>'&APP_FILES.icons/app-icon-512.png'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080430919157856)
,p_meta_tag_name=>'og:title'
,p_meta_tag_value=>'Files | &P0_BLOG_APP_NAME.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080572645157857)
,p_meta_tag_name=>'og:type'
,p_meta_tag_value=>'website'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081525703157867)
,p_meta_tag_name=>'og:url'
,p_meta_tag_value=>'&P0_PAGE_URL.'
);
wwv_flow_imp.component_end;
end;
/
