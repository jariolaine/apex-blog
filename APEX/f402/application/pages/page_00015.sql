prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_user_interface_id=>wwv_flow_imp.id(8571044485518264)
,p_name=>'Files'
,p_alias=>'FILE-REPOSITORY'
,p_step_title=>'Files'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18976025248736506)
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220807061301'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6729285879951908)
,p_plug_name=>'Files Report'
,p_region_css_classes=>'z-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id              as id',
'  ,v1.changed_on          as changed_on',
'  ,v1.changed_by          as changed_by',
'  ,v1.is_active           as is_active',
'  ,v1.is_download         as is_download',
'  ,v1.file_name           as file_name',
'  ,case is_download',
'    when 1',
'    then apex_page.get_url(',
'      p_application  => :G_PUB_APP_ID',
'      ,p_page        => ''REPOSITORY''',
'      ,p_session     => null',
'      ,p_items       => ''P11_FILE_NAME''',
'      ,p_values      => v1.file_name',
'    )',
'    else apex_page.get_url(',
'      p_application  => :G_PUB_APP_ID',
'      ,p_page        => ''PGM''',
'      ,p_session     => null',
'      ,p_request     => ''application_process=download''',
'      ,p_items       => ''P11_FILE_NAME''',
'      ,p_values      => v1.file_name',
'    )',
'   end                    as relative_path',
'  ,v1.mime_type           as mime_type',
'  ,v1.file_size           as file_size',
'  ,v1.file_desc           as file_desc',
'  ,v1.notes               as notes',
'  ,v1.file_size           as file_download',
'  ,btn.copy_url           as btn_copy_url',
'  ,btn.title_edit         as btn_title_edit',
'  ,case v1.is_active',
'    when 1',
'    then ''fa-check-circle u-success-text''',
'    else ''fa-minus-circle u-danger-text''',
'   end                    as file_status_icon',
'  ,case v1.is_download',
'    when 1',
'    then ''fa-check''',
'    else ''fa-minus''',
'   end                    as file_repository_icon',
'from #OWNER#.blog_v_all_files v1',
'-- links button title',
'cross join(',
'  select',
'     apex_lang.message( ''BLOG_BTN_TITLE_COPY_TO_CLIPBOARD'' ) as copy_url',
'    ,apex_lang.message( ''BLOG_BTN_TITLE_EDIT'' ) as title_edit',
'  from dual',
') btn',
'where 1 = 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_imp.id(6729607954951908)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16:P16_ID:#ID#'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_detail_link_attr=>'title="#BTN_TITLE_EDIT#" aria-lable=title="#BTN_TITLE_EDIT#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_owner=>'LAINFJAR'
,p_internal_uid=>2983012375981141
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20749277249206601)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'AE'
,p_column_label=>'File ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6731389970951911)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18314368317999506)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>40
,p_column_identifier=>'Z'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18314464550999507)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>50
,p_column_identifier=>'AA'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#IS_ACTIVE#" class="fa #FILE_STATUS_ICON#"></span>',
'<span class="u-VisuallyHidden">#IS_ACTIVE#</span>',
''))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11784376262412448)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6732529686951912)
,p_db_column_name=>'IS_DOWNLOAD'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Attachment'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#IS_DOWNLOAD#" class="fa #FILE_REPOSITORY_ICON#"></span>',
'<span class="u-VisuallyHidden">#IS_DOWNLOAD#</span>',
''))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11789591131543819)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_help_text=>'Is file available for download in public application "Files" page.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18411298167271002)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'AC'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18411133134271001)
,p_db_column_name=>'RELATIVE_PATH'
,p_display_order=>80
,p_column_identifier=>'AB'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6733375673951913)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6733714896951913)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6734910327951914)
,p_db_column_name=>'FILE_DESC'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22958417982076041)
,p_db_column_name=>'NOTES'
,p_display_order=>120
,p_column_identifier=>'AH'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25310682340124201)
,p_db_column_name=>'FILE_DOWNLOAD'
,p_display_order=>130
,p_column_identifier=>'AL'
,p_column_label=>'Download'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:BLOG_V_ALL_FILES:BLOB_CONTENT:ID::MIME_TYPE:FILE_NAME:CHANGED_ON:FILE_CHARSET:attachment:<span aria-label="#FILE_NAME# #FILE_SIZE#" title="#FILE_NAME# #FILE_SIZE#" class="fa fa-download" aria-hidden="true"></span>:'
,p_static_id=>'DOWNLOAD'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30432633807753149)
,p_db_column_name=>'BTN_COPY_URL'
,p_display_order=>140
,p_column_identifier=>'AO'
,p_column_label=>'Copy URL'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button title="#BTN_COPY_URL#" type="button" class="t-Button t-Button--noLabel t-Button--icon t-Button--link" onclick="void(0);" data-clipboard-source="#RELATIVE_PATH#">',
'  <span class="t-Icon fa fa-clone" aria-hidden="true"></span>',
'</button>'))
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
,p_column_alignment=>'CENTER'
,p_static_id=>'COPY_URL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31246563637982905)
,p_db_column_name=>'BTN_TITLE_EDIT'
,p_display_order=>160
,p_column_identifier=>'AQ'
,p_column_label=>'Btn Title Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(42033869947918102)
,p_db_column_name=>'FILE_STATUS_ICON'
,p_display_order=>170
,p_column_identifier=>'AR'
,p_column_label=>'File Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24943446663671415)
,p_db_column_name=>'FILE_REPOSITORY_ICON'
,p_display_order=>180
,p_column_identifier=>'AS'
,p_column_label=>'File Repository Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6738041656952365)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'29915'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'DETAIL'
,p_report_columns=>'FILE_NAME:FILE_SIZE:IS_DOWNLOAD:BTN_COPY_URL:FILE_DOWNLOAD:CHANGED_ON:IS_ACTIVE:'
,p_sort_column_1=>'FILE_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CHANGED_ON'
,p_sort_direction_2=>'DESC'
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
 p_id=>wwv_flow_imp.id(24910787972771846)
,p_plug_name=>'Files'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24910884667771847)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(24910787972771846)
,p_button_name=>'UPLOAD_FILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload File(s)'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22::'
,p_icon_css_classes=>'fa-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7192696579750567)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6729285879951908)
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
 p_id=>wwv_flow_imp.id(25132454760432506)
,p_name=>'Process File Upload'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(24910787972771846)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25132548482432507)
,p_event_id=>wwv_flow_imp.id(25132454760432506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6729285879951908)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26969189313257319)
,p_name=>'Process File Attributes Update'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6729285879951908)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26969354164257321)
,p_event_id=>wwv_flow_imp.id(26969189313257319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6729285879951908)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27862886676256827)
,p_name=>'After IR refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6729285879951908)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27862976110256828)
,p_event_id=>wwv_flow_imp.id(27862886676256827)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'blog.admin.filesIrAfterRefresh( this.affectedElements );'
);
wwv_flow_imp.component_end;
end;
/
