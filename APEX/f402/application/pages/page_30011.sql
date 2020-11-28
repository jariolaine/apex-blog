prompt --application/pages/page_30011
begin
--   Manifest
--     PAGE: 30011
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>30011
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Job Run Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Job Run Details'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8574375481518289)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(8935943081653812)
,p_help_text=>'<p>This report includes the run details about the jobs selected to be monitored by this application.</p>'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20201128104506'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24862635181683382)
,p_plug_name=>'Job Run Details'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LOG_ID,',
'       JOB_NAME,',
'       LOG_DATE,',
'       OWNER,',
'       JOB_SUBNAME,',
'       STATUS,',
'       ERROR#,',
'       REQ_START_DATE,',
'       ACTUAL_START_DATE,',
'       RUN_DURATION,',
'       INSTANCE_ID,',
'       SESSION_ID,',
'       SLAVE_PID,',
'       CPU_USED,',
'       CREDENTIAL_OWNER,',
'       CREDENTIAL_NAME,',
'       DESTINATION_OWNER,',
'       DESTINATION,',
'       ADDITIONAL_INFO, ERRORS, OUTPUT   from user_scheduler_job_run_details'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(24863872810683401)
,p_name=>'Job Run Details'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LAINFJAR'
,p_internal_uid=>24863872810683401
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24863907813683410)
,p_db_column_name=>'LOG_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Log ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24864322722683416)
,p_db_column_name=>'JOB_NAME'
,p_display_order=>11
,p_column_identifier=>'B'
,p_column_label=>'Job Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24864755324683417)
,p_db_column_name=>'LOG_DATE'
,p_display_order=>21
,p_column_identifier=>'C'
,p_column_label=>'Log Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24865172836683417)
,p_db_column_name=>'OWNER'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24865510677683418)
,p_db_column_name=>'JOB_SUBNAME'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>'Job Subname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24865928795683418)
,p_db_column_name=>'STATUS'
,p_display_order=>51
,p_column_identifier=>'F'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24866371901683419)
,p_db_column_name=>'ERROR#'
,p_display_order=>61
,p_column_identifier=>'G'
,p_column_label=>'Error Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24866730995683419)
,p_db_column_name=>'REQ_START_DATE'
,p_display_order=>71
,p_column_identifier=>'H'
,p_column_label=>'Requested Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24867107457683419)
,p_db_column_name=>'ACTUAL_START_DATE'
,p_display_order=>71
,p_column_identifier=>'I'
,p_column_label=>'Actual Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24867535924683420)
,p_db_column_name=>'RUN_DURATION'
,p_display_order=>81
,p_column_identifier=>'J'
,p_column_label=>'Run Duration'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24867960810683420)
,p_db_column_name=>'INSTANCE_ID'
,p_display_order=>91
,p_column_identifier=>'K'
,p_column_label=>'Instance ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24868369703683421)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>101
,p_column_identifier=>'L'
,p_column_label=>'Session ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24868787447683421)
,p_db_column_name=>'SLAVE_PID'
,p_display_order=>111
,p_column_identifier=>'M'
,p_column_label=>'Slave PID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24869111092683422)
,p_db_column_name=>'CPU_USED'
,p_display_order=>121
,p_column_identifier=>'N'
,p_column_label=>'CPU Used'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24869524827683422)
,p_db_column_name=>'CREDENTIAL_OWNER'
,p_display_order=>131
,p_column_identifier=>'O'
,p_column_label=>'Credential Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24869955295683423)
,p_db_column_name=>'CREDENTIAL_NAME'
,p_display_order=>141
,p_column_identifier=>'P'
,p_column_label=>'Credential Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24870336564683423)
,p_db_column_name=>'DESTINATION_OWNER'
,p_display_order=>151
,p_column_identifier=>'Q'
,p_column_label=>'Destination Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24870713833683424)
,p_db_column_name=>'DESTINATION'
,p_display_order=>161
,p_column_identifier=>'R'
,p_column_label=>'Destination'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24871137935683424)
,p_db_column_name=>'ADDITIONAL_INFO'
,p_display_order=>171
,p_column_identifier=>'S'
,p_column_label=>'Additional Information'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24871501002683424)
,p_db_column_name=>'ERRORS'
,p_display_order=>181
,p_column_identifier=>'T'
,p_column_label=>'Errors'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24871954530683425)
,p_db_column_name=>'OUTPUT'
,p_display_order=>191
,p_column_identifier=>'U'
,p_column_label=>'Output'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24872638168683427)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'248727'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'JOB_NAME:LOG_DATE:STATUS:ERROR#:RUN_DURATION:ERRORS'
,p_sort_column_1=>'JOB_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'LOG_DATE'
,p_sort_direction_2=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24901816725683494)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(24862635181683382)
,p_button_name=>'BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Back to Jobs Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:30010:&SESSION.::&DEBUG.:'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24873506860683430)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24862635181683382)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.component_end;
end;
/
