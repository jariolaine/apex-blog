prompt --application/pages/page_30021
begin
--   Manifest
--     PAGE: 30021
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
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
,p_group_id=>wwv_flow_imp.id(111116381830742743)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_help_text=>'High level view of application logging information.'
,p_page_component_map=>'03'
,p_last_updated_on=>wwv_flow_imp.dz('20250421011823Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(170321086240643973)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noBorder:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(317040416660575459)
,p_name=>'Breakdown by Page'
,p_template=>2322115667525957943
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
'  , l.page_id',
'  , l.elapsed_time',
'  , count(1) over() as all_pages_view_cnt',
'  from apex_workspace_activity_log l',
'  where 1 = 1',
'    and l.application_id = :G_PUB_APP_ID',
'    and l.page_id is not null',
'    and l.view_date >= sysdate - ( 1 / 24 / 60 / 60 * :P30021_TIMEFRAME )',
')',
'select ',
'  q1.page_id                                  as page_id',
', q1.page_name                                as page_name',
', median( q1.elapsed_time )                   as median_elap',
', min( q1.elapsed_time )                      as min_elap',
', avg( q1.elapsed_time )                      as avg_elap',
', max( q1.elapsed_time )                      as max_elap',
', count(1)                                    as view_cnt',
', ( count(1) / q1.all_pages_view_cnt ) * 100  as view_pct',
', ( count(1) / q1.all_pages_view_cnt ) * 100  as view_pct_graph',
'from q1',
'group by',
'  q1.page_name',
', q1.page_id',
', q1.all_pages_view_cnt',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P30021_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
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
,p_updated_on=>wwv_flow_imp.dz('20250421011823Z')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126387816130796003)
,p_query_column_id=>1
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126384957054796001)
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
 p_id=>wwv_flow_imp.id(94955795676816093)
,p_query_column_id=>3
,p_column_alias=>'MEDIAN_ELAP'
,p_column_display_sequence=>30
,p_column_heading=>'Median Elapsed'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126385405033796001)
,p_query_column_id=>4
,p_column_alias=>'MIN_ELAP'
,p_column_display_sequence=>40
,p_column_heading=>'Min Elapsed'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126385804292796001)
,p_query_column_id=>5
,p_column_alias=>'AVG_ELAP'
,p_column_display_sequence=>50
,p_column_heading=>'Avg Elapsed'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126386188522796002)
,p_query_column_id=>6
,p_column_alias=>'MAX_ELAP'
,p_column_display_sequence=>60
,p_column_heading=>'Max Elapsed'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126386614816796002)
,p_query_column_id=>7
,p_column_alias=>'VIEW_CNT'
,p_column_display_sequence=>70
,p_column_heading=>'View Count'
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
 p_id=>wwv_flow_imp.id(126386995979796002)
,p_query_column_id=>8
,p_column_alias=>'VIEW_PCT'
,p_column_display_sequence=>80
,p_column_heading=>'View %'
,p_column_format=>'999999999999990D00'
,p_column_html_expression=>'#VIEW_PCT# %'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126387358839796003)
,p_query_column_id=>9
,p_column_alias=>'VIEW_PCT_GRAPH'
,p_column_display_sequence=>90
,p_column_format=>'PCT_GRAPH:#DDDDDD:#5486C3:'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(317042120948575496)
,p_name=>'Summary'
,p_template=>2322115667525957943
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--4cols:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  count(1)                          as page_views',
'--, sum( rows_queried )               as rows_queried',
', count( distinct apex_session_id ) as apex_session',
', count( distinct ip_address )      as ip_address',
', count( distinct agent )           as user_agent',
', median( l.elapsed_time )          as median_elapsed_time',
', min( l.elapsed_time )             as min_elapsed_time',
', avg( l.elapsed_time )             as avg_elapsed_time',
', max( l.elapsed_time )             as max_elapsed_time',
'from apex_workspace_activity_log l',
'where 1 = 1',
'and l.application_id = :G_PUB_APP_ID',
'and l.page_id is not null',
'and l.view_date >= sysdate - ( 1 / 24 / 60 / 60 * :P30021_TIMEFRAME )'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P30021_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>2104643962563030528
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
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126380324008795998)
,p_query_column_id=>1
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>1
,p_column_heading=>'Page Views'
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
 p_id=>wwv_flow_imp.id(101901619842195625)
,p_query_column_id=>2
,p_column_alias=>'APEX_SESSION'
,p_column_display_sequence=>26
,p_column_heading=>'Session'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101901276625195622)
,p_query_column_id=>3
,p_column_alias=>'IP_ADDRESS'
,p_column_display_sequence=>36
,p_column_heading=>'IP Address'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101901414401195623)
,p_query_column_id=>4
,p_column_alias=>'USER_AGENT'
,p_column_display_sequence=>56
,p_column_heading=>'User Agent'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(102480529577597502)
,p_query_column_id=>5
,p_column_alias=>'MEDIAN_ELAPSED_TIME'
,p_column_display_sequence=>66
,p_column_heading=>'Median Elapsed  (seconds)'
,p_column_format=>'999999999999990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126380791106795998)
,p_query_column_id=>6
,p_column_alias=>'MIN_ELAPSED_TIME'
,p_column_display_sequence=>76
,p_column_heading=>'Min Elapsed (seconds)'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126381221050795998)
,p_query_column_id=>7
,p_column_alias=>'AVG_ELAPSED_TIME'
,p_column_display_sequence=>86
,p_column_heading=>'Avg Elapsed  (seconds)'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(126381588065795998)
,p_query_column_id=>8
,p_column_alias=>'MAX_ELAPSED_TIME'
,p_column_display_sequence=>96
,p_column_heading=>'Max Elapsed  (seconds)'
,p_column_format=>'999999999999990D000'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(137748705506218125)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(170321086240643973)
,p_button_name=>'REFRESH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(126469894290027052)
,p_name=>'P30021_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(170321086240643973)
,p_item_default=>'BLOG_DEFAULT_TIMEFRAME'
,p_item_default_type=>'ITEM'
,p_prompt=>'Timeframe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME (4 WEEKS)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  disp',
', val as seconds',
'from table( apex_util.get_timeframe_lov_data )',
'order by insert_order'))
,p_cHeight=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(126505873137402913)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30021_TIMEFRAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(126506302012402937)
,p_event_id=>wwv_flow_imp.id(126505873137402913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Summary'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(317042120948575496)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(125913477666730296)
,p_event_id=>wwv_flow_imp.id(126505873137402913)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Breakdown'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(317040416660575459)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(137748800590218126)
,p_name=>'Refresh reports'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(137748705506218125)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(137748846962218127)
,p_event_id=>wwv_flow_imp.id(137748800590218126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Summary'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(317042120948575496)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(137748992863218128)
,p_event_id=>wwv_flow_imp.id(137748800590218126)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Breakdown'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(317040416660575459)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
