prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Archives'
,p_alias=>'ARCHIVES'
,p_step_title=>'Archives &P15_ARCHIVE_ID. | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8697986188142973)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_ARCHIVE"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(8670890848739263)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221129094627'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(58686289966142463)
,p_name=>'Archives &P15_ARCHIVE_ID.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_imp.id(6802870362267386)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-bottom-lg'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   v1.category_id     as category_id',
'  ,v1.post_title      as search_title',
'  ,v1.post_url        as search_link',
'  ,v1.post_desc       as search_desc',
'  ,v1.txt_category    as label_01',
'  ,v1.category_title  as value_01',
'  ,v1.txt_posted_by   as label_02',
'  ,v1.blogger_name    as value_02',
'  ,v1.txt_posted_on   as label_03',
'  ,v1.published_on    as value_03',
'  ,v1.txt_tags        as label_04',
'  ,v1.tags_html1      as value_04',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'  and v1.archive_year = :P15_ARCHIVE_ID',
'order by v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P15_ARCHIVE_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6833829938267402)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>1000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show posts by year (archive)'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29629899442985356)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Category Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29629061407985356)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29629401164985356)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>3
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29628633401985357)
,p_query_column_id=>4
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29628257872985357)
,p_query_column_id=>5
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29627873110985357)
,p_query_column_id=>6
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.::P14_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#VALUE_01#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29627494667985357)
,p_query_column_id=>7
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>7
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29627054233985358)
,p_query_column_id=>8
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>8
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29626633977985358)
,p_query_column_id=>9
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>9
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29626261027985358)
,p_query_column_id=>10
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>10
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_APP_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29625803553985359)
,p_query_column_id=>11
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>11
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29625433328985359)
,p_query_column_id=>12
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>12
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28587323511643032)
,p_name=>'P15_ARCHIVE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(58686289966142463)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28587504616643034)
,p_name=>'Set is Current'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P15_ARCHIVE_ID'
,p_da_event_comment=>'Because archives list in global page is cached, we set is-current class here'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28587618691643035)
,p_event_id=>wwv_flow_imp.id(28587504616643034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(28587492454643033)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.UI.setListCurrentItem({',
'   affectedElements: this.affectedElements',
'  ,pageItem: "P15_ARCHIVE_ID"',
'});',
''))
,p_da_action_comment=>'List anchors have data attribute where is archive id. If that match to item P15_ARCHIVE_ID value set is-current class to list'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26065829198107836)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Archives Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
