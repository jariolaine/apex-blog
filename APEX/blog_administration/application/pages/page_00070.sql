prompt --application/pages/page_00070
begin
--   Manifest
--     PAGE: 00070
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>70
,p_name=>'Files Repository'
,p_alias=>'FILES-REPOSITORY'
,p_step_title=>'Files Repository'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18976025248736506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help available for this page.'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231206090620'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45054908267895533)
,p_plug_name=>'Files Report'
,p_region_css_classes=>'blog-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.id                    as id',
'  ,v1.created_on            as created_on',
'  ,v1.created_on            as created_since',
'  ,v1.created_by            as created_by',
'  ,v1.changed_on            as changed_on',
'  ,v1.changed_on            as changed_since',
'  ,v1.changed_by            as changed_by',
'  ,v1.is_active             as is_active',
'  ,v1.is_download           as is_download',
'  ,v1.file_name             as file_name',
'  ,apex_page.get_url(',
'    p_application  => :G_PUB_APP_ID',
'    ,p_page        => ''1003''',
'    ,p_session     => null',
'    ,p_request     => ''application_process=download''',
'    ,p_items       => ''P1003_FILE_NAME''',
'    ,p_values      => v1.file_name',
'  )                         as relative_path',
'  ,v1.mime_type             as mime_type',
'  ,v1.file_size             as file_size',
'  ,v1.file_desc             as file_desc',
'  ,v1.notes                 as notes',
'  ,v1.file_size             as file_download  -- see column Download Text',
'  ,null                     as btn_copy_url   -- see column HTML Expression',
'  ,v1.file_status_icon      as file_status_icon',
'  ,v1.file_type_icon        as file_type_icon',
'from blog_v_all_files v1'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(45055230342895533)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,71:P71_ID:#ID#'
,p_detail_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-pencil"></span>'
,p_detail_link_attr=>'title="&APP_TEXT$BLOG_TXT_EDIT." class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_owner=>'LAINFJAR'
,p_internal_uid=>45055230342895533
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38330539417943630)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'AE'
,p_column_label=>'File ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38330979772943630)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>20
,p_column_identifier=>'AT'
,p_column_label=>'Created on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38331342890943631)
,p_db_column_name=>'CREATED_SINCE'
,p_display_order=>30
,p_column_identifier=>'AU'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38331716847943631)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>40
,p_column_identifier=>'AV'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38326986021943627)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Changed on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38332184264943631)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>70
,p_column_identifier=>'AW'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38328959321943628)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>80
,p_column_identifier=>'Z'
,p_column_label=>'Changed by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38329348903943628)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>90
,p_column_identifier=>'AA'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TITLE:=#IS_ACTIVE#',
'ICON_CLASSES:=#FILE_STATUS_ICON# w60',
'ICON_ID:=',
'{apply THEME$ICON_CUSTOM_1/}'))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11784376262412448)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_column_comment=>'Using HTML Expression because need column filter'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38327326794943627)
,p_db_column_name=>'IS_DOWNLOAD'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Attachment'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TITLE:=#IS_DOWNLOAD#',
'ICON_CLASSES:=#FILE_TYPE_ICON# w60',
'ICON_ID:=',
'{apply THEME$ICON_CUSTOM_1/}'))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11789591131543819)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_column_comment=>'Using HTML Expression because need column filter'
,p_help_text=>'Is file available for download in public application "Files" page.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38330192971943629)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>110
,p_column_identifier=>'AC'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'Y'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38329755423943629)
,p_db_column_name=>'RELATIVE_PATH'
,p_display_order=>120
,p_column_identifier=>'AB'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38327759825943627)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>130
,p_column_identifier=>'J'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38328161284943628)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38328597537943628)
,p_db_column_name=>'FILE_DESC'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38332595787943631)
,p_db_column_name=>'NOTES'
,p_display_order=>160
,p_column_identifier=>'AH'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38332980599943632)
,p_db_column_name=>'FILE_DOWNLOAD'
,p_display_order=>170
,p_column_identifier=>'AL'
,p_column_label=>'Download'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:BLOG_V_ALL_FILES:BLOB_CONTENT:ID::MIME_TYPE:FILE_NAME:CHANGED_ON:FILE_CHARSET:attachment:<span data-file-info="#FILE_NAME# #FILE_SIZE#" class="t-Icon fa fa-download" aria-hidden="true"></span>:'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38333313767943632)
,p_db_column_name=>'BTN_COPY_URL'
,p_display_order=>180
,p_column_identifier=>'AO'
,p_column_label=>'Copy URL'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'TMPL_THEME_42$BUTTON_CUSTOM_2'
,p_column_alignment=>'CENTER'
,p_attributes=>wwv_flow_string.join_clob(wwv_flow_t_varchar2('{',
  '"BUTTON_ATTR": "data-clipboard-source=\"#RELATIVE_PATH#\"",',
  '"CSS_CLASSES": "t-Button--small w60",',
  '"ICON_CLASSES": "fa-clone",',
  '"IS_DISABLED": "N",',
  '"IS_HOT": "N",',
  '"IS_ICON_ONLY": "Y",',
  '"LABEL": "\u0026APP_TEXT$BLOG_TXT_COPY_TO_CLIPBOARD."',
'}'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38334516737943633)
,p_db_column_name=>'FILE_STATUS_ICON'
,p_display_order=>200
,p_column_identifier=>'AR'
,p_column_label=>'File Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38334110345943633)
,p_db_column_name=>'FILE_TYPE_ICON'
,p_display_order=>210
,p_column_identifier=>'BA'
,p_column_label=>'File Type Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(45063664044895990)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'29915'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:FILE_SIZE:CHANGED_SINCE:IS_DOWNLOAD:BTN_COPY_URL:FILE_DOWNLOAD:IS_ACTIVE'
,p_sort_column_1=>'FILE_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(63250780770724015)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(20248729235781977)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(8549985374518244)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38326254835943626)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(63250780770724015)
,p_button_name=>'UPLOAD_FILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload File(s)'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:RP,72::'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38335278696943634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45054908267895533)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38336238503943635)
,p_name=>'Process File Upload'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38326254835943626)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38336741636943635)
,p_event_id=>wwv_flow_imp.id(38336238503943635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45054908267895533)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38337198135943635)
,p_name=>'Process File Update'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(45054908267895533)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38337618263943635)
,p_event_id=>wwv_flow_imp.id(38337198135943635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45054908267895533)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38338007991943636)
,p_name=>'After IR refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(45054908267895533)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38338530291943636)
,p_event_id=>wwv_flow_imp.id(38338007991943636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Download link and copy to clipboard'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'blog.admin.ir.filesAfterRefresh({ "region$": this.affectedElements });'
);
wwv_flow_imp.component_end;
end;
/
