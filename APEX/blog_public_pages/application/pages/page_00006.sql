prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'Posts Under Tag'
,p_alias=>'TAG'
,p_step_title=>'Tag &P6_TAG_NAME. | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8697986188142973)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAG"'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230608144132'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13706719753736206)
,p_name=>'Tag &P6_TAG_NAME.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_imp.id(6802870362267386)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   v1.category_id     as category_id',
'  ,v1.post_title      as search_title',
'  ,v1.post_url        as search_link',
'  ,v1.post_desc       as search_desc',
'-- see label columns HTML expression',
'  ,''Y''                as label_01',
'  ,v1.category_title  as value_01',
'  ,''Y''                as label_02',
'  ,v1.blogger_name    as value_02',
'  ,''Y''                as label_03',
'  ,v1.published_on    as value_03',
'  ,''Y''                as label_04',
'  ,v1.tags_html1      as value_04',
'from blog_v_posts v1',
'where 1 = 1',
'and exists(',
'  select 1',
'  from blog_post_tags x1',
'  where 1 = 1',
'    and x1.is_active = 1',
'    and x1.tag_id = :P6_TAG_ID',
'    and x1.post_id = v1.post_id',
')',
'order by v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_TAG_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6833829938267402)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show search result'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7222845776888393)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Category Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7219675482888390)
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
 p_id=>wwv_flow_imp.id(7219254223888389)
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
 p_id=>wwv_flow_imp.id(7220092242888391)
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
 p_id=>wwv_flow_imp.id(7220468558888391)
,p_query_column_id=>5
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&APP_TEXT$BLOG_TXT_CATEGORY.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7220907870888391)
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
 p_id=>wwv_flow_imp.id(7221258840888391)
,p_query_column_id=>7
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>7
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&APP_TEXT$BLOG_TXT_POSTED_BY.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7221720169888392)
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
 p_id=>wwv_flow_imp.id(7222126977888392)
,p_query_column_id=>9
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>9
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&APP_TEXT$BLOG_TXT_POSTED_ON.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7222531249888393)
,p_query_column_id=>10
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>10
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030160255368819)
,p_query_column_id=>11
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>11
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&APP_TEXT$BLOG_TXT_TAGS.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030024550368818)
,p_query_column_id=>12
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>12
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7082507483178439)
,p_name=>'P6_TAG_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7223310957888413)
,p_name=>'P6_TAG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13706719753736206)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17117374097199935)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Get tag name'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_UTIL'
,p_attribute_04=>'GET_TAG'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(17117464350199936)
,p_page_process_id=>wwv_flow_imp.id(17117374097199935)
,p_page_id=>6
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P6_TAG_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(17117520667199937)
,p_page_process_id=>wwv_flow_imp.id(17117374097199935)
,p_page_id=>6
,p_name=>'p_tag_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P6_TAG_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26065633574107834)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Tag Pagination'
,p_attribute_01=>'THIS_PAGE'
);
wwv_flow_imp.component_end;
end;
/
