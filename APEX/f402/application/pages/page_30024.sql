prompt --application/pages/page_30024
begin
--   Manifest
--     PAGE: 30024
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30024
,p_user_interface_id=>wwv_flow_imp.id(8571044485518264)
,p_name=>'Page Views'
,p_alias=>'PAGE-VIEWS'
,p_page_mode=>'MODAL'
,p_step_title=>'Page Views'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This page provides an interactive report of the most recent page views.</p>',
'<p>Select the reporting timeframe (Default = 1 day) at the top of the page as necessary.<br>',
'Click on the column headings to sort and filter data, or click on the <strong>Actions</strong> button to customize column display and many additional advanced features. Click the <strong>Reset</strong> button to reset the interactive report back to t'
||'he default settings.</p>'))
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220927075931'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43843535329616316)
,p_plug_name=>'Page Views'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  l.page_id                   as page',
'  ,case l.page_id',
'    when 1003',
'    then replace( lower( l.request_value ), ''application_process='' ) ',
'    else l.page_name',
'  end                         as page_name',
'  ,l.apex_session_id          as session_id',
'  ,l.view_timestamp ',
'    at time zone sessiontimezone',
'                              as timestamp',
'  ,l.elapsed_time             as elapsed',
'  ,l.page_view_mode           as page_mode',
'  ,l.rows_queried             as num_rows',
'  ,l.error_on_component_name  as component_name',
'  ,l.error_message            as error',
'  ,l.ecid                     as ecid',
'from apex_workspace_activity_log l',
'where 1 = 1',
'  and l.application_id = :G_PUB_APP_ID',
'  and l.view_date >= sysdate - ( 1/24/60/60 * :P30024_TIMEFRAME )',
'  and l.apex_user is not null',
'  and l.page_id is not null',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P30024_TIMEFRAME'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Page Views'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(43844456202616317)
,p_name=>'Page Views'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LAINFJAR'
,p_internal_uid=>43844456202616317
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43846039501616931)
,p_db_column_name=>'PAGE'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43844580082616923)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Page Name'
,p_column_html_expression=>'#PAGE#. #PAGE_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15611713783559116)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Session ID'
,p_column_link=>'f?p=&APP_ID.:30026:&SESSION.::&DEBUG.::P30026_APEX_SESSION_ID:#SESSION_ID#'
,p_column_linktext=>'#SESSION_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43845262629616929)
,p_db_column_name=>'TIMESTAMP'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43845674406616930)
,p_db_column_name=>'ELAPSED'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990D0000'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43846441351616931)
,p_db_column_name=>'PAGE_MODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43847245422616932)
,p_db_column_name=>'NUM_ROWS'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Num Rows'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43846886763616931)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43848056750616932)
,p_db_column_name=>'ERROR'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Error'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15611446653559113)
,p_db_column_name=>'ECID'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Ecid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(43848788526616934)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'438488'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_NAME:SESSION_ID:TIMESTAMP:ELAPSED:PAGE_MODE:NUM_ROWS:'
,p_sort_column_1=>'TIMESTAMP'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(43843621023616316)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noBorder:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(43849686714616936)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(43843535329616316)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43843452042616316)
,p_name=>'P30024_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(43843621023616316)
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
 p_id=>wwv_flow_imp.id(43843759712616316)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30024_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43850926104616938)
,p_event_id=>wwv_flow_imp.id(43843759712616316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(43843535329616316)
);
wwv_flow_imp.component_end;
end;
/
