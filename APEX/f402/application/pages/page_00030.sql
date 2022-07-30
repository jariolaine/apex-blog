prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_imp.id(8571044485518264)
,p_name=>'Comments'
,p_alias=>'COMMENTS'
,p_step_title=>'Comments'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220717070306'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27412346667552217)
,p_plug_name=>'Comments Report'
,p_region_css_classes=>'z-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id                as comment_id',
'  ,v1.post_id               as post_id',
'  ,v1.parent_id             as parent_id',
'  ,v1.created_on            as created_on',
'  ,v1.changed_on            as changed_on',
'  ,v1.changed_by            as changed_by',
'  ,v1.comment_by            as comment_by',
'  ,v1.post_title            as post_title',
'  ,status_lov.display_value as status',
'  ,flag_lov.display_value   as flag',
'  ,case v1.status ',
'    when ''MODERATE'' ',
'    then ''fa-exclamation-circle u-warning-text''',
'    when ''ENABLED''',
'    then ''fa-check-circle u-success-text''',
'    else ''fa-minus-circle u-danger-text''',
'  end                       as status_icon',
'  ,case v1.flag',
'    when ''REPLY''',
'    then ''fa-send-o''',
'    when ''NEW''',
'    then ''fa-envelope-arrow-down''',
'    when ''UNREAD''',
'    then ''fa-envelope-o''',
'    else ''fa-envelope-open-o''',
'  end                       as flag_icon',
'  ,btn.title_open           as title_open',
'  ,case ',
'    when v1.flag in( ''NEW'', ''UNREAD'' )',
'    then',
'      ''true''',
'    else',
'      ''false''',
'  end                       as btn_data_unread',
'  ,v1.body_html             as comment_body',
'  ,apex_page.get_url(',
'     p_page   => 31',
'    ,p_clear_cache => 31',
'    ,p_items  => ''P31_ID,P31_POST_ID''',
'    ,p_values => ',
'      apex_string.format(',
'         p_message => ''%s,%s''',
'        ,p0 => v1.id',
'        ,p1 => v1.post_id',
'      )',
'   )                        as edit_url',
'from #OWNER#.blog_v_all_comments v1',
'-- because APEX bug that IR not use LOV values in detail view',
'join (',
'  select lov.display_value',
'    ,lov.return_value',
'  from #OWNER#.blog_v_lov lov',
'  where 1 = 1',
'  and lov.lov_name = ''COMMENT_STATUS''',
') status_lov on status_lov.return_value = v1.status',
'-- because APEX bug that IR not use LOV values in detail view',
'join (',
'  select lov.display_value',
'    ,return_value',
'  from #OWNER#.blog_v_lov lov',
'  where 1 = 1',
'  and lov.lov_name = ''COMMENT_FLAG''',
') flag_lov on flag_lov.return_value = v1.flag',
'-- link column button title',
'cross join (',
'  select apex_lang.message( ''BLOG_BTN_TITLE_OPEN_COMMENT'' ) as title_open',
'  from dual',
') btn'))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(27412486259552217)
,p_name=>'Comments'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'#EDIT_URL#'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_detail_link_attr=>'data-unread="#BTN_DATA_UNREAD#" data-id="CF#COMMENT_ID#" title="#TITLE_OPEN#"" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="z-comment-IR">',
'  <div class="z-commentIcon">',
'    <span arial-label="#FLAG#" title="#FLAG#" class="t-Icon fa fa-lg #FLAG_ICON#" id="CF#COMMENT_ID#"></span>',
'  </div>',
'  <div class="z-commentContainer">',
'    <div class="z-commentTitle">',
'      <a href="#EDIT_URL#" data-unread="#BTN_DATA_UNREAD#" data-id="CF#COMMENT_ID#">#POST_TITLE#</a>',
'    </div>',
'    <div class="z-commentSubtitle">',
'      #COMMENT_BY# &middot; #CREATED_ON#',
'    </div>',
'    <div class="z-commentBody">',
'      #COMMENT_BODY#',
'    </div>',
'  </div>',
'  <div class="z-commentStatus">',
'    <span arial-label="#STATUS#" title="#STATUS#" class="t-Icon fa fa-lg #STATUS_ICON#"></span>',
'  </div>',
'</div>'))
,p_owner=>'LAINFJAR'
,p_internal_uid=>27412486259552217
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27412896770552221)
,p_db_column_name=>'COMMENT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Comment Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27413658046552222)
,p_db_column_name=>'POST_ID'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Post Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27414040338552222)
,p_db_column_name=>'PARENT_ID'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Parent Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27414403838552223)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27276071435075439)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27276125787075440)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>60
,p_column_identifier=>'K'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27414847566552223)
,p_db_column_name=>'COMMENT_BY'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Comment By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27276240284075441)
,p_db_column_name=>'POST_TITLE'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Post Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(36228982614379748)
,p_db_column_name=>'STATUS'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#STATUS#" class="fa #STATUS_ICON#"></span>',
'<span class="u-VisuallyHidden">#STATUS#</span>'))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11795273774701730)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11414619307329104)
,p_db_column_name=>'FLAG'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Flag'
,p_column_html_expression=>'<span aria-label="#FLAG#" title="#FLAG#" class="fa #FLAG_ICON#" id="CF#COMMENT_ID#"></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11794321487687925)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(36229030214379749)
,p_db_column_name=>'STATUS_ICON'
,p_display_order=>110
,p_column_identifier=>'P'
,p_column_label=>'Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11414732996329105)
,p_db_column_name=>'FLAG_ICON'
,p_display_order=>120
,p_column_identifier=>'U'
,p_column_label=>'Flag Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11415051185329108)
,p_db_column_name=>'TITLE_OPEN'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Title Open'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21076424539846833)
,p_db_column_name=>'BTN_DATA_UNREAD'
,p_display_order=>150
,p_column_identifier=>'AB'
,p_column_label=>'Btn Data Unread'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11414314704329101)
,p_db_column_name=>'COMMENT_BODY'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'Comment Body'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11416096664329118)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'Edit Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(27416916886555549)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'274170'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'POST_TITLE:COMMENT_BY:FLAG:CREATED_ON:STATUS:'
,p_sort_column_1=>'CREATED_ON'
,p_sort_direction_1=>'DESC'
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
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52335565859375132)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27425950946632839)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(27412346667552217)
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
 p_id=>wwv_flow_imp.id(37644907003287115)
,p_name=>'Process Comments Report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27412346667552217)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37645018465287116)
,p_event_id=>wwv_flow_imp.id(37644907003287115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'blog.admin.commentsIrAfterRefresh( this.affectedElements );'
,p_da_action_comment=>'Attach one time click event listener to report links having data attribute. When report link is clicked change link icon class.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(43467068897898202)
,p_name=>'Process Comment'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27412346667552217)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43467195075898203)
,p_event_id=>wwv_flow_imp.id(43467068897898202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27412346667552217)
);
wwv_flow_imp.component_end;
end;
/
