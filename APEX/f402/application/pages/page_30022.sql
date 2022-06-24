prompt --application/pages/page_30022
begin
--   Manifest
--     PAGE: 30022
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>30022
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Application Error Log'
,p_alias=>'APPLICATION-ERROR-LOG'
,p_page_mode=>'MODAL'
,p_step_title=>'Application Error Log'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This page provides an interactive report of all unexpected errors logged by this application.</p>',
'<p>Click on the column headings to sort and filter data, or click on the <strong>Actions</strong> button to customize column display and many additional advanced features. Click the <strong>Reset</strong> button to reset the interactive report back t'
||'o the default settings.</p>'))
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220612065305'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43861070470616959)
,p_plug_name=>'Application Error Log'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(8495746153518209)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.page_id              as page_id',
'  ,l.apex_user                as user_id',
'  ,l.apex_session_id          as session_id',
'  ,l.debug_page_view_id       as debug_id',
'  ,l.view_timestamp ',
'    at time zone sessiontimezone',
'                              as error_time',
'  ,l.error_message            as error_message',
'  ,l.error_on_component_type  as component_type',
'  ,l.error_on_component_name  as component_name',
'  ,l.page_view_mode           as view_mode',
'  ,l.page_view_type           as view_type',
'  ,l.request_value            as request',
'  ,l.log_context              as context',
'  ,l.application_info         as info',
'  ,l.ecid                     as ecid',
'from apex_workspace_activity_log l',
'where l.application_id = :G_PUB_APP_ID',
'and l.view_date >= sysdate - ( 1/24/60/60 * :P30022_TIMEFRAME )',
'and l.error_message is not null',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P30022_TIMEFRAME'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_page_header=>'Application Error Log'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(43861986124616960)
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
,p_internal_uid=>43861986124616960
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12509704572984003)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12509822632984004)
,p_db_column_name=>'USER_ID'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12509929184984005)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Session'
,p_column_link=>'f?p=&APP_ID.:30026:&SESSION.::&DEBUG.::P30026_APEX_SESSION_ID:#SESSION_ID#'
,p_column_linktext=>'#SESSION_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12510402686984010)
,p_db_column_name=>'DEBUG_ID'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Debug'
,p_column_link=>'f?p=&APP_ID.:30025:&SESSION.::&DEBUG.::P30025_DEBUG_ID:#DEBUG_ID#'
,p_column_linktext=>'#DEBUG_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12510095933984006)
,p_db_column_name=>'ERROR_TIME'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12510130561984007)
,p_db_column_name=>'ERROR_MESSAGE'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Message'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12510268171984008)
,p_db_column_name=>'COMPONENT_TYPE'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Context'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12510397121984009)
,p_db_column_name=>'COMPONENT_NAME'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>'Component Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15610888098559107)
,p_db_column_name=>'VIEW_MODE'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'View Mode'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15610983036559108)
,p_db_column_name=>'VIEW_TYPE'
,p_display_order=>100
,p_column_identifier=>'P'
,p_column_label=>'View Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15611007518559109)
,p_db_column_name=>'REQUEST'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Request'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15611193794559110)
,p_db_column_name=>'CONTEXT'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'Context'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15611252520559111)
,p_db_column_name=>'INFO'
,p_display_order=>130
,p_column_identifier=>'S'
,p_column_label=>'Info'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(15611312389559112)
,p_db_column_name=>'ECID'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Ecid'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(43864765565616964)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'438648'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE_ID:SESSION_ID:DEBUG_ID:ERROR_TIME:ERROR_MESSAGE:COMPONENT_TYPE:COMPONENT_NAME:'
,p_sort_column_1=>'ERROR_TIME'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'ERR_TIME'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57798510253211433)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noBorder:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43865642823616965)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43861070470616959)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(8549081018518243)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.,RR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13955138883595133)
,p_name=>'P30022_TIMEFRAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(57798510253211433)
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
,p_field_template=>wwv_flow_api.id(8548464988518243)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13956795734610390)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30022_TIMEFRAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13957148485610395)
,p_event_id=>wwv_flow_api.id(13956795734610390)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(43861070470616959)
);
wwv_flow_api.component_end;
end;
/
