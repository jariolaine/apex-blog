prompt --application/pages/page_30026
begin
--   Manifest
--     PAGE: 30026
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30026
,p_name=>'Session Log'
,p_alias=>'SESSION-LOG'
,p_page_mode=>'MODAL'
,p_step_title=>'Session Log'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230128073834'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19643397669399856)
,p_plug_name=>'Session Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   l.page_id                  as page_id',
'  ,l.page_name                as page_name',
'  ,l.think_time               as think_time',
'  ,l.log_context              as log_context',
'  ,l.elapsed_time             as elapsed_time',
'  ,l.rows_queried             as rows_queried',
'  ,l.ip_address               as ip_address',
'  ,l.agent                    as agent',
'  ,l.apex_session_id          as apex_session_id',
'  ,l.error_message            as error_message',
'  ,l.error_on_component_type  as error_on_component_type',
'  ,l.error_on_component_name  as error_on_component_name',
'  ,l.page_view_mode           as page_view_mode',
'  ,l.application_info         as application_info',
'  ,l.interactive_report_id    as interactive_report_id',
'  ,l.ir_saved_report_id       as ir_saved_report_id',
'  ,l.ir_search                as ir_search',
'  ,l.content_length           as content_length',
'  ,l.regions_from_cache       as regions_from_cache',
'  ,l.page_view_type           as page_view_type',
'  ,l.request_value            as request_value',
'  ,l.debug_page_view_id       as debug_page_view_id',
'  ,l.view_timestamp           as view_timestamp',
'  ,l.view_timestamp           as view_since',
'  ,l.ecid                     as ecid',
'from apex_workspace_activity_log l',
'where 1 = 1',
'and apex_session_id = :P30026_APEX_SESSION_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Session Log'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19643484232399856)
,p_name=>'Session Log'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LAINFJAR'
,p_internal_uid=>19643484232399856
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19643886556399860)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Page ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19644233662399860)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19645080901399861)
,p_db_column_name=>'THINK_TIME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Think Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19645897022399862)
,p_db_column_name=>'LOG_CONTEXT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Log Context'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19646276241399862)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Elapsed Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19646616697399862)
,p_db_column_name=>'ROWS_QUERIED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Rows Queried'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19647036094399863)
,p_db_column_name=>'IP_ADDRESS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'IP Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19647408090399863)
,p_db_column_name=>'AGENT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'User Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19647812513399864)
,p_db_column_name=>'APEX_SESSION_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19648682951399864)
,p_db_column_name=>'ERROR_MESSAGE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Error Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19649048972399865)
,p_db_column_name=>'ERROR_ON_COMPONENT_TYPE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Error on Component Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19649454697399865)
,p_db_column_name=>'ERROR_ON_COMPONENT_NAME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Error on Component Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19649863536399865)
,p_db_column_name=>'PAGE_VIEW_MODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Page View Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19650253881399866)
,p_db_column_name=>'APPLICATION_INFO'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Application Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19650631563399866)
,p_db_column_name=>'INTERACTIVE_REPORT_ID'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Interactive Report Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19651096732399866)
,p_db_column_name=>'IR_SAVED_REPORT_ID'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Ir Saved Report Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19651496678399867)
,p_db_column_name=>'IR_SEARCH'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Ir Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19651833986399867)
,p_db_column_name=>'CONTENT_LENGTH'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Content Length'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19652288642399867)
,p_db_column_name=>'REGIONS_FROM_CACHE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Regions From Cache'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19653029506399868)
,p_db_column_name=>'PAGE_VIEW_TYPE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Page View Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19653493507399868)
,p_db_column_name=>'REQUEST_VALUE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Request Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19653842833399869)
,p_db_column_name=>'DEBUG_PAGE_VIEW_ID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Debug Page View ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19654259724399869)
,p_db_column_name=>'VIEW_TIMESTAMP'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21640974942282137)
,p_db_column_name=>'VIEW_SINCE'
,p_display_order=>37
,p_column_identifier=>'AC'
,p_column_label=>'Logged'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19654685779399870)
,p_db_column_name=>'ECID'
,p_display_order=>47
,p_column_identifier=>'AB'
,p_column_label=>'Ecid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19659303790435380)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'196594'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_ID:PAGE_NAME:VIEW_SINCE:ELAPSED_TIME:ROWS_QUERIED:IP_ADDRESS:AGENT:ECID:'
,p_sort_column_1=>'VIEW_TIMESTAMP'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'SECONDS_AGO'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19660747055448729)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19643397669399856)
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
 p_id=>wwv_flow_imp.id(15611630215559115)
,p_name=>'P30026_APEX_SESSION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19643397669399856)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp.component_end;
end;
/
