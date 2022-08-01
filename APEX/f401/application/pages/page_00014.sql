prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_imp.id(6877050287267426)
,p_name=>'Posts Under Category'
,p_alias=>'CATEGORY'
,p_step_title=>'Category &P14_CATEGORY_TITLE. | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8697986188142973)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_CATEGORY"'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220801121728'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(40117793173805532)
,p_name=>'Category &P14_CATEGORY_TITLE.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_imp.id(6802870362267386)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-bottom-lg'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.post_title       as search_title',
'  ,#OWNER#.blog_url.get_post(',
'     p_post_id => v1.post_id',
'  )                       as search_link',
'  ,v1.post_desc           as search_desc',
'  ,labels.posted_by       as label_01',
'  ,v1.blogger_name        as value_01',
'  ,labels.posted_on       as label_02',
'  ,v1.published_on        as value_02',
'  -- output label if there is tags',
'  ,case when',
'    apex_util.savekey_vc2( v1.tags_html ) is not null',
'    then labels.tags',
'  end                     as label_03',
'  -- get tags from variable',
'  ,apex_util.keyval_vc2   as value_03',
'  ,null                   as label_04',
'  ,null                   as value_04',
'from #OWNER#.blog_v_posts v1',
'cross join(',
'  select',
'     apex_lang.message( ''BLOG_TXT_TAGS'' )      as tags',
'    ,apex_lang.message( ''BLOG_TXT_POSTED_BY'' ) as posted_by',
'    ,apex_lang.message( ''BLOG_TXT_POSTED_ON'' ) as posted_on',
'  from dual',
') labels',
'where 1 = 1',
'  and v1.category_id = :P14_CATEGORY_ID',
'order by v1.category_seq',
'  ,v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P14_CATEGORY_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6833829938267402)
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
,p_comment=>'Report to show posts in category'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29900322586485604)
,p_query_column_id=>1
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29900704264485603)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29899943299485604)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29899517517485604)
,p_query_column_id=>4
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>4
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29899144107485605)
,p_query_column_id=>5
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>5
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29898719452485605)
,p_query_column_id=>6
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>6
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29898375315485606)
,p_query_column_id=>7
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>7
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_APP_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29897917933485606)
,p_query_column_id=>8
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>8
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29897582471485606)
,p_query_column_id=>9
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>9
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29896775104485609)
,p_query_column_id=>10
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>10
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29897177059485607)
,p_query_column_id=>11
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>11
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29901153455485598)
,p_name=>'P14_CATEGORY_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(40117793173805532)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Category ID to filter report'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31250398896982943)
,p_name=>'P14_CATEGORY_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(31250468391982944)
,p_computation_sequence=>10
,p_computation_item=>'P14_CATEGORY_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_category_title(',
'   p_category_id => :P14_CATEGORY_ID',
'  ,p_escape      => false',
')'))
,p_computation_error_message=>'Category not found.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30119771997698124)
,p_name=>'Set is Current'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P14_CATEGORY_ID'
,p_da_event_comment=>'Because categories list in global page is cached, we set is-current class here'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30120160059698119)
,p_event_id=>wwv_flow_imp.id(30119771997698124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6913532952677128)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.UI.setListCurrentItem({',
'   affectedElements: this.affectedElements',
'  ,pageItem: "P14_CATEGORY_ID"',
'});'))
,p_da_action_comment=>'List anchors have data attribute where is category id. If that match to item P14_CATEGORY_ID value set is-current class to list'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26065583579107833)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Category Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
