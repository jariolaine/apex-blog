prompt --application/pages/page_30025
begin
--   Manifest
--     PAGE: 30025
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30025
,p_user_interface_id=>wwv_flow_imp.id(8571044485518264)
,p_name=>'Error Debug Log'
,p_alias=>'ERROR-DEBUG-LOG'
,p_page_mode=>'MODAL'
,p_step_title=>'Error Debug Log'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220927075938'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56682839747382561)
,p_plug_name=>'Error Debug Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_id        as page_id',
'  ,session_id         as session_id',
'  ,apex_user          as user_id',
'  ,page_view_id       as page_view_id',
'  ,message_level      as message_level',
'  ,cast(',
'    message_timestamp as timestamp with local time zone',
'  )                   as message_timestamp',
'  ,elapsed_time       as elapsed_time',
'  ,execution_time     as execution_time',
'  ,message            as message',
'  ,call_stack         as call_stack',
'from apex_debug_messages',
'where 1 = 1',
'and page_view_id = :P30025_DEBUG_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Application Error Log'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(56683755401382562)
,p_name=>'Application Error Log'
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
,p_internal_uid=>56683755401382562
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12822065515765618)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12822383577765619)
,p_db_column_name=>'USER_ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12822771163765619)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Session'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12510758783984013)
,p_db_column_name=>'PAGE_VIEW_ID'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'Debug'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12510841849984014)
,p_db_column_name=>'MESSAGE_LEVEL'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Message Level'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12510921849984015)
,p_db_column_name=>'MESSAGE_TIMESTAMP'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511022054984016)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Elapsed Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511155858984017)
,p_db_column_name=>'EXECUTION_TIME'
,p_display_order=>80
,p_column_identifier=>'S'
,p_column_label=>'Execution Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511249447984018)
,p_db_column_name=>'MESSAGE'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511345459984019)
,p_db_column_name=>'CALL_STACK'
,p_display_order=>100
,p_column_identifier=>'U'
,p_column_label=>'Call Stack'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(56686534842382566)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'438648'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MESSAGE_TIMESTAMP:ELAPSED_TIME:EXECUTION_TIME:MESSAGE:CALL_STACK:'
,p_sort_column_1=>'MESSAGE_TIMESTAMP'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ERROR_TIME'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'ERR_TIME'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'DESC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12825415966765632)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56682839747382561)
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
 p_id=>wwv_flow_imp.id(12511527263984021)
,p_name=>'P30025_DEBUG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(56682839747382561)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp.component_end;
end;
/
