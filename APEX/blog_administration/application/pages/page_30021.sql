prompt --application/pages/page_30021
begin
--   Manifest
--     PAGE: 30021
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30021
,p_name=>'Page Views Metric'
,p_alias=>'PAGE-VIEWS-METRIC'
,p_page_mode=>'MODAL'
,p_step_title=>'Page Views Metric'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_help_text=>'High level view of application logging information.'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231118082902'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87874963598811882)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noBorder:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(234594294018743368)
,p_name=>'Breakdown by Page'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>30
,p_region_sub_css_classes=>'blog-page-view-breakdown'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with q1 as(',
'  select ',
'    case l.page_id',
'      when 1003',
'      then replace( lower( l.request_value ), ''application_process='' ) ',
'      else l.page_name',
'    end as page_name',
'    ,l.page_id',
'    ,l.elapsed_time',
'    ,count(1) over() as all_pages_view_cnt',
'  from apex_workspace_activity_log l',
'  where 1 = 1',
'  and l.application_id = :G_PUB_APP_ID',
'  and l.page_id is not null',
'  and l.view_date >= sysdate - ( 1 / 24 / 60 / 60 * :P30021_TIMEFRAME )',
')',
'select q1.page_id                             as page_id',
'  ,q1.page_name                               as page_name',
'  ,median( q1.elapsed_time )                  as median_elap',
'  ,min( q1.elapsed_time )                     as min_elap',
'  ,avg( q1.elapsed_time )                     as avg_elap',
'  ,max( q1.elapsed_time )                     as max_elap',
'  ,count(1)                                   as view_cnt',
'  ,( count(1) / q1.all_pages_view_cnt ) * 100 as view_pct',
'  ,( count(1) / q1.all_pages_view_cnt ) * 100 as view_pct_graph',
'from q1',
'group by q1.page_name',
'  ,q1.page_id',
'  ,q1.all_pages_view_cnt',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P30021_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8519378220518224)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43941693488963912)
,p_query_column_id=>1
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43938834412963910)
,p_query_column_id=>2
,p_column_alias=>'PAGE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Page Name'
,p_use_as_row_header=>'Y'
,p_column_html_expression=>'#PAGE_ID#. #PAGE_NAME#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12509673034984002)
,p_query_column_id=>3
,p_column_alias=>'MEDIAN_ELAP'
,p_column_display_sequence=>30
,p_column_heading=>'Median Elapsed'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43939282391963910)
,p_query_column_id=>4
,p_column_alias=>'MIN_ELAP'
,p_column_display_sequence=>40
,p_column_heading=>'Min Elapsed'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43939681650963910)
,p_query_column_id=>5
,p_column_alias=>'AVG_ELAP'
,p_column_display_sequence=>50
,p_column_heading=>'Avg Elapsed'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43940065880963911)
,p_query_column_id=>6
,p_column_alias=>'MAX_ELAP'
,p_column_display_sequence=>60
,p_column_heading=>'Max Elapsed'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43940492174963911)
,p_query_column_id=>7
,p_column_alias=>'VIEW_CNT'
,p_column_display_sequence=>70
,p_column_heading=>'View Count'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43940873337963911)
,p_query_column_id=>8
,p_column_alias=>'VIEW_PCT'
,p_column_display_sequence=>80
,p_column_heading=>'View %'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D00'
,p_column_html_expression=>'#VIEW_PCT# %'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43941236197963912)
,p_query_column_id=>9
,p_column_alias=>'VIEW_PCT_GRAPH'
,p_column_display_sequence=>90
,p_use_as_row_header=>'N'
,p_column_format=>'PCT_GRAPH:#DDDDDD:#5486C3:'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(234595998306743405)
,p_name=>'Summary'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--4cols:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(1)                       as page_views',
'  ,min( l.elapsed_time )              as min_elapsed_time',
'  ,avg( l.elapsed_time )              as avg_elapsed_time',
'  ,max( l.elapsed_time )              as max_elapsed_time',
'  ,sum( rows_queried )                as rows_queried',
'  ,count( distinct apex_session_id )  as apex_session',
'  ,count( distinct ip_address )       as ip_address',
'  ,count( distinct agent )            as user_agent',
'from apex_workspace_activity_log l',
'where 1 = 1',
'and l.application_id = :G_PUB_APP_ID',
'and l.page_id is not null',
'and l.view_date >= sysdate - ( 1 / 24 / 60 / 60 * :P30021_TIMEFRAME )'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P30021_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8515750866518222)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43934201366963907)
,p_query_column_id=>1
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>1
,p_column_heading=>'Page views'
,p_use_as_row_header=>'Y'
,p_column_format=>'999999999999990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43934668464963907)
,p_query_column_id=>2
,p_column_alias=>'MIN_ELAPSED_TIME'
,p_column_display_sequence=>4
,p_column_heading=>'Min elapsed (seconds)'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43935098408963907)
,p_query_column_id=>3
,p_column_alias=>'AVG_ELAPSED_TIME'
,p_column_display_sequence=>5
,p_column_heading=>'Avg elapsed  (seconds)'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(43935465423963907)
,p_query_column_id=>4
,p_column_alias=>'MAX_ELAPSED_TIME'
,p_column_display_sequence=>6
,p_column_heading=>'Max elapsed  (seconds)'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19455369634363533)
,p_query_column_id=>5
,p_column_alias=>'ROWS_QUERIED'
,p_column_display_sequence=>16
,p_column_heading=>'Rows Queried'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19455497200363534)
,p_query_column_id=>6
,p_column_alias=>'APEX_SESSION'
,p_column_display_sequence=>26
,p_column_heading=>'Session'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19455153983363531)
,p_query_column_id=>7
,p_column_alias=>'IP_ADDRESS'
,p_column_display_sequence=>36
,p_column_heading=>'IP Address'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19455291759363532)
,p_query_column_id=>8
,p_column_alias=>'USER_AGENT'
,p_column_display_sequence=>56
,p_column_heading=>'User Agent'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44023771648194961)
,p_name=>'P30021_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(87874963598811882)
,p_item_default=>'BLOG_DEFAULT_TIMEFRAME'
,p_item_default_type=>'ITEM'
,p_prompt=>'Timeframe'
,p_source=>'BLOG_DEFAULT_TIMEFRAME'
,p_source_type=>'PREFERENCE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'      val as seconds',
' from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(8548464988518243)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44059750495570822)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30021_TIMEFRAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44060179370570846)
,p_event_id=>wwv_flow_imp.id(44059750495570822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234595998306743405)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43467355024898205)
,p_event_id=>wwv_flow_imp.id(44059750495570822)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(234594294018743368)
);
wwv_flow_imp.component_end;
end;
/
