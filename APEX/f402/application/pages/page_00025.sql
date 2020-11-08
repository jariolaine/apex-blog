prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Dynamic Content'
,p_alias=>'DYNAMIC-CONTENT'
,p_step_title=>'Dynamic Content'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20201104161840'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41939477197116306)
,p_plug_name=>'Report 1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8495746153518209)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_DYNAMIC_CONTENT'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(41939871490116307)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP:P26_ID:\#ID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_owner=>'LAINFJAR'
,p_internal_uid=>41939871490116307
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41939972315116308)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41940339991116311)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41940760881116311)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41941124801116311)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Changed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41941531601116312)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41941986346116312)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Is Active'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41942317292116313)
,p_db_column_name=>'DISPLAY_SEQ'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Display Seq'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41942756576116313)
,p_db_column_name=>'CONTENT_NAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Content Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41943169555116313)
,p_db_column_name=>'CONTENT_DESC'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Content Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41943549639116315)
,p_db_column_name=>'CONTENT_HTML'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Content Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41943948076116315)
,p_db_column_name=>'CONTENT_TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Content Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(41945620916116668)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'419457'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:CREATED_ON:CREATED_BY:CHANGED_ON:CHANGED_BY:IS_ACTIVE:DISPLAY_SEQ:CONTENT_NAME:CONTENT_DESC:CONTENT_HTML:CONTENT_TYPE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(41945250793116316)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(41939477197116306)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(8549115324518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41944342086116315)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(41939477197116306)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41944869964116316)
,p_event_id=>wwv_flow_api.id(41944342086116315)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(41939477197116306)
);
wwv_flow_api.component_end;
end;
/
