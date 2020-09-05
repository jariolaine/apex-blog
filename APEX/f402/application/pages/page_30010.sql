prompt --application/pages/page_30010
begin
--   Manifest
--     PAGE: 30010
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
 p_id=>30010
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Job Reporting'
,p_page_mode=>'MODAL'
,p_step_title=>'Job Reporting'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8574375481518289)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(8935943081653812)
,p_help_text=>'<p>This report includes all the jobs selected to be monitored by this application.  More details of each job can be viewed by clicking on the job name.</p>'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200511180741'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24873986309683431)
,p_plug_name=>'Job Reporting'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select JOB_NAME,',
'       JOB_CLASS,',
'       ENABLED,',
'       STATE,',
'       RUN_COUNT,',
'       FAILURE_COUNT,',
'       RETRY_COUNT,',
'       REPEAT_INTERVAL,',
'       LAST_START_DATE,',
'       LAST_RUN_DURATION,',
'       JOB_SUBNAME,',
'       JOB_STYLE,',
'       JOB_CREATOR,',
'       CLIENT_ID,',
'       GLOBAL_UID,',
'       PROGRAM_OWNER,',
'       PROGRAM_NAME,',
'       JOB_TYPE,',
'       JOB_ACTION,',
'       NUMBER_OF_ARGUMENTS,',
'       SCHEDULE_OWNER,',
'       SCHEDULE_NAME,',
'       SCHEDULE_TYPE,',
'       START_DATE,',
'       EVENT_QUEUE_OWNER,',
'       EVENT_QUEUE_NAME,',
'       EVENT_QUEUE_AGENT,',
'       EVENT_CONDITION,',
'       EVENT_RULE,',
'       FILE_WATCHER_OWNER,',
'       FILE_WATCHER_NAME,',
'       END_DATE,',
'       AUTO_DROP,',
'       RESTART_ON_RECOVERY,',
'       RESTART_ON_FAILURE,',
'       JOB_PRIORITY,',
'       MAX_RUNS,',
'       MAX_FAILURES,',
'       NEXT_RUN_DATE,',
'       SCHEDULE_LIMIT,',
'       MAX_RUN_DURATION,',
'       LOGGING_LEVEL,',
'       STORE_OUTPUT,',
'       STOP_ON_WINDOW_CLOSE,',
'       INSTANCE_STICKINESS,',
'       RAISE_EVENTS,',
'       SYSTEM,',
'       JOB_WEIGHT,',
'       NLS_ENV,',
'       SOURCE,',
'       NUMBER_OF_DESTINATIONS,',
'       DESTINATION_OWNER,',
'       DESTINATION,',
'       CREDENTIAL_OWNER,',
'       CREDENTIAL_NAME,',
'       INSTANCE_ID,',
'       DEFERRED_DROP,',
'       ALLOW_RUNS_IN_RESTRICTED_MODE,',
'       COMMENTS,',
'       FLAGS,',
'       RESTARTABLE,',
'       CONNECT_CREDENTIAL_OWNER,',
'       CONNECT_CREDENTIAL_NAME',
'  from user_scheduler_jobs'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(24874810733683432)
,p_name=>'Job Reporting'
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
,p_internal_uid=>24874810733683432
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24874973554683454)
,p_db_column_name=>'JOB_NAME'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Job Name'
,p_column_link=>'f?p=&APP_ID.:30011:&SESSION.::&DEBUG.:RP,CIR,RIR:IR_JOB_NAME:#JOB_NAME#'
,p_column_linktext=>'#JOB_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24875210685683455)
,p_db_column_name=>'JOB_CLASS'
,p_display_order=>21
,p_column_identifier=>'B'
,p_column_label=>'Job Class'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24875683386683456)
,p_db_column_name=>'ENABLED'
,p_display_order=>31
,p_column_identifier=>'C'
,p_column_label=>'Enabled'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24876027670683457)
,p_db_column_name=>'STATE'
,p_display_order=>41
,p_column_identifier=>'D'
,p_column_label=>'State'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24876473629683457)
,p_db_column_name=>'RUN_COUNT'
,p_display_order=>51
,p_column_identifier=>'E'
,p_column_label=>'Run Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24876801507683458)
,p_db_column_name=>'FAILURE_COUNT'
,p_display_order=>61
,p_column_identifier=>'F'
,p_column_label=>'Failure Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24877206143683458)
,p_db_column_name=>'RETRY_COUNT'
,p_display_order=>66
,p_column_identifier=>'G'
,p_column_label=>'Retry Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24877693997683459)
,p_db_column_name=>'REPEAT_INTERVAL'
,p_display_order=>67
,p_column_identifier=>'H'
,p_column_label=>'Repeat Interval'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24878064900683460)
,p_db_column_name=>'LAST_START_DATE'
,p_display_order=>71
,p_column_identifier=>'I'
,p_column_label=>'Last Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24878410681683460)
,p_db_column_name=>'LAST_RUN_DURATION'
,p_display_order=>81
,p_column_identifier=>'J'
,p_column_label=>'Last Run Duration'
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
 p_id=>wwv_flow_api.id(24878835443683461)
,p_db_column_name=>'JOB_SUBNAME'
,p_display_order=>91
,p_column_identifier=>'K'
,p_column_label=>'Job Subname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24879240808683461)
,p_db_column_name=>'JOB_STYLE'
,p_display_order=>101
,p_column_identifier=>'L'
,p_column_label=>'Job Style'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24879622261683462)
,p_db_column_name=>'JOB_CREATOR'
,p_display_order=>111
,p_column_identifier=>'M'
,p_column_label=>'Job Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24880066167683463)
,p_db_column_name=>'CLIENT_ID'
,p_display_order=>115
,p_column_identifier=>'N'
,p_column_label=>'Client ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24880406812683463)
,p_db_column_name=>'GLOBAL_UID'
,p_display_order=>121
,p_column_identifier=>'O'
,p_column_label=>'Global Unique ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24880856886683464)
,p_db_column_name=>'PROGRAM_OWNER'
,p_display_order=>131
,p_column_identifier=>'P'
,p_column_label=>'Program Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24881294673683464)
,p_db_column_name=>'PROGRAM_NAME'
,p_display_order=>141
,p_column_identifier=>'Q'
,p_column_label=>'Program Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24881681246683465)
,p_db_column_name=>'JOB_TYPE'
,p_display_order=>151
,p_column_identifier=>'R'
,p_column_label=>'Job Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24882011003683466)
,p_db_column_name=>'JOB_ACTION'
,p_display_order=>161
,p_column_identifier=>'S'
,p_column_label=>'Job Action'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24882467717683466)
,p_db_column_name=>'NUMBER_OF_ARGUMENTS'
,p_display_order=>171
,p_column_identifier=>'T'
,p_column_label=>'Number of Arguements'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24882879513683467)
,p_db_column_name=>'SCHEDULE_OWNER'
,p_display_order=>171
,p_column_identifier=>'U'
,p_column_label=>'Schedule Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24883276411683468)
,p_db_column_name=>'SCHEDULE_NAME'
,p_display_order=>181
,p_column_identifier=>'V'
,p_column_label=>'Schedule Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24883660018683468)
,p_db_column_name=>'SCHEDULE_TYPE'
,p_display_order=>191
,p_column_identifier=>'W'
,p_column_label=>'Schedule Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24884030886683469)
,p_db_column_name=>'START_DATE'
,p_display_order=>195
,p_column_identifier=>'X'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24884489870683469)
,p_db_column_name=>'EVENT_QUEUE_OWNER'
,p_display_order=>201
,p_column_identifier=>'Y'
,p_column_label=>'Event Queue Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24884829992683470)
,p_db_column_name=>'EVENT_QUEUE_NAME'
,p_display_order=>211
,p_column_identifier=>'Z'
,p_column_label=>'Event Queue Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24885241224683470)
,p_db_column_name=>'EVENT_QUEUE_AGENT'
,p_display_order=>221
,p_column_identifier=>'AA'
,p_column_label=>'Event Queue Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24885675013683471)
,p_db_column_name=>'EVENT_CONDITION'
,p_display_order=>231
,p_column_identifier=>'AB'
,p_column_label=>'Event Condition'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24886044614683472)
,p_db_column_name=>'EVENT_RULE'
,p_display_order=>241
,p_column_identifier=>'AC'
,p_column_label=>'Event Rule'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24886468116683472)
,p_db_column_name=>'FILE_WATCHER_OWNER'
,p_display_order=>251
,p_column_identifier=>'AD'
,p_column_label=>'File Watcher Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24886814123683473)
,p_db_column_name=>'FILE_WATCHER_NAME'
,p_display_order=>261
,p_column_identifier=>'AE'
,p_column_label=>'File Watcher Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24887266279683473)
,p_db_column_name=>'END_DATE'
,p_display_order=>271
,p_column_identifier=>'AF'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24887669524683474)
,p_db_column_name=>'AUTO_DROP'
,p_display_order=>281
,p_column_identifier=>'AG'
,p_column_label=>'Auto Drop'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24888071949683475)
,p_db_column_name=>'RESTART_ON_RECOVERY'
,p_display_order=>291
,p_column_identifier=>'AH'
,p_column_label=>'Restart on Recovery'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24888441056683475)
,p_db_column_name=>'RESTART_ON_FAILURE'
,p_display_order=>301
,p_column_identifier=>'AI'
,p_column_label=>'Restart on Failure'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24888842162683476)
,p_db_column_name=>'JOB_PRIORITY'
,p_display_order=>311
,p_column_identifier=>'AJ'
,p_column_label=>'Job Priority'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24889271649683476)
,p_db_column_name=>'MAX_RUNS'
,p_display_order=>321
,p_column_identifier=>'AK'
,p_column_label=>'Maximum Runs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24889698498683477)
,p_db_column_name=>'MAX_FAILURES'
,p_display_order=>331
,p_column_identifier=>'AL'
,p_column_label=>'Maximum Failures'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24890088648683478)
,p_db_column_name=>'NEXT_RUN_DATE'
,p_display_order=>351
,p_column_identifier=>'AM'
,p_column_label=>'Next Run Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24890450567683478)
,p_db_column_name=>'SCHEDULE_LIMIT'
,p_display_order=>361
,p_column_identifier=>'AN'
,p_column_label=>'Schedule Limit'
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
 p_id=>wwv_flow_api.id(24890819668683479)
,p_db_column_name=>'MAX_RUN_DURATION'
,p_display_order=>371
,p_column_identifier=>'AO'
,p_column_label=>'Maximum Run Duration'
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
 p_id=>wwv_flow_api.id(24891292462683479)
,p_db_column_name=>'LOGGING_LEVEL'
,p_display_order=>381
,p_column_identifier=>'AP'
,p_column_label=>'Logging Level'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24891629759683480)
,p_db_column_name=>'STORE_OUTPUT'
,p_display_order=>391
,p_column_identifier=>'AQ'
,p_column_label=>'Store Output'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24892067340683480)
,p_db_column_name=>'STOP_ON_WINDOW_CLOSE'
,p_display_order=>401
,p_column_identifier=>'AR'
,p_column_label=>'Stop on Window Close'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24892476161683481)
,p_db_column_name=>'INSTANCE_STICKINESS'
,p_display_order=>411
,p_column_identifier=>'AS'
,p_column_label=>'Instance Stickiness'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24892856114683482)
,p_db_column_name=>'RAISE_EVENTS'
,p_display_order=>421
,p_column_identifier=>'AT'
,p_column_label=>'Raise Events'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24893272345683482)
,p_db_column_name=>'SYSTEM'
,p_display_order=>431
,p_column_identifier=>'AU'
,p_column_label=>'System'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24893620711683483)
,p_db_column_name=>'JOB_WEIGHT'
,p_display_order=>441
,p_column_identifier=>'AV'
,p_column_label=>'Job Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24894056729683483)
,p_db_column_name=>'NLS_ENV'
,p_display_order=>451
,p_column_identifier=>'AW'
,p_column_label=>'NLS Environment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24894437732683484)
,p_db_column_name=>'SOURCE'
,p_display_order=>461
,p_column_identifier=>'AX'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24894899711683485)
,p_db_column_name=>'NUMBER_OF_DESTINATIONS'
,p_display_order=>471
,p_column_identifier=>'AY'
,p_column_label=>'Number of Destinations'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24895231622683485)
,p_db_column_name=>'DESTINATION_OWNER'
,p_display_order=>481
,p_column_identifier=>'AZ'
,p_column_label=>'Destination Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24895685776683486)
,p_db_column_name=>'DESTINATION'
,p_display_order=>491
,p_column_identifier=>'BA'
,p_column_label=>'Destination'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24896017480683486)
,p_db_column_name=>'CREDENTIAL_OWNER'
,p_display_order=>501
,p_column_identifier=>'BB'
,p_column_label=>'Credential Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24896439372683487)
,p_db_column_name=>'CREDENTIAL_NAME'
,p_display_order=>511
,p_column_identifier=>'BC'
,p_column_label=>'Credential Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24896833620683488)
,p_db_column_name=>'INSTANCE_ID'
,p_display_order=>521
,p_column_identifier=>'BD'
,p_column_label=>'Instance ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24897266019683488)
,p_db_column_name=>'DEFERRED_DROP'
,p_display_order=>531
,p_column_identifier=>'BE'
,p_column_label=>'Deferred Drop'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24897607232683489)
,p_db_column_name=>'ALLOW_RUNS_IN_RESTRICTED_MODE'
,p_display_order=>541
,p_column_identifier=>'BF'
,p_column_label=>'Allow Runs in Restricted Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24898004296683489)
,p_db_column_name=>'COMMENTS'
,p_display_order=>551
,p_column_identifier=>'BG'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24898480952683490)
,p_db_column_name=>'FLAGS'
,p_display_order=>561
,p_column_identifier=>'BH'
,p_column_label=>'Flags'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24898897976683490)
,p_db_column_name=>'RESTARTABLE'
,p_display_order=>571
,p_column_identifier=>'BI'
,p_column_label=>'Restartable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24899299836683491)
,p_db_column_name=>'CONNECT_CREDENTIAL_OWNER'
,p_display_order=>581
,p_column_identifier=>'BJ'
,p_column_label=>'Connect Credential Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24899630863683492)
,p_db_column_name=>'CONNECT_CREDENTIAL_NAME'
,p_display_order=>591
,p_column_identifier=>'BK'
,p_column_label=>'Connect Credential Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24900685634683493)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'249007'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'JOB_NAME:ENABLED:STATE:RUN_COUNT:FAILURE_COUNT:RETRY_COUNT:REPEAT_INTERVAL:LAST_START_DATE:LAST_RUN_DURATION:NEXT_RUN_DATE'
,p_sort_column_1=>'JOB_NAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24901513160683494)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24873986309683431)
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
