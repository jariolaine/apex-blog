prompt --application/pages/page_00060
begin
--   Manifest
--     PAGE: 00060
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>60
,p_name=>'Comments'
,p_alias=>'COMMENTS'
,p_step_title=>'Comments'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230609050432'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(65609751049299759)
,p_plug_name=>'Comments Report'
,p_region_css_classes=>'z-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ',
'   v1.id                            as comment_id',
'  ,v1.post_id                       as post_id',
'  ,v1.parent_id                     as parent_id',
'  ,v1.created_on                    as created_on',
'  ,v1.created_on                    as created_since',
'  ,v1.created_by                    as created_by',
'  ,v1.changed_on                    as changed_on',
'  ,v1.changed_on                    as changed_since',
'  ,v1.changed_by                    as changed_by',
'  ,v1.comment_by                    as comment_by',
'  ,v1.post_title                    as post_title',
'  ,v1.comment_status_text           as comment_status -- see column HTML Expression',
'  ,v1.comment_flag_text             as comment_flag   -- see column HTML Expression',
'  ,v1.comment_status_icon           as status_icon',
'  ,v1.comment_flag_icon             as flag_icon',
'  ,v1.data_unread                   as btn_data_unread',
'  ,v1.body_html                     as comment_body',
'  ,v1.ctx_search                    as ctx_search',
'  ,apex_page.get_url(',
'     p_page         => 61',
'    ,p_clear_cache  => 61',
'    ,p_items        => ''P61_ID,P61_POST_ID''',
'    ,p_values       => v1.id || '','' || v1.post_id',
'   )                                as edit_url',
'   ,:APP_TEXT$BLOG_TXT_OPEN_COMMENT as btn_label',
'from blog_v_all_comments v1',
'where 1 = 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(65609890641299759)
,p_name=>'Comments'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_oracle_text_index_column=>'CTX_SEARCH'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'#EDIT_URL#'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_detail_link_attr=>'data-unread="#BTN_DATA_UNREAD#" data-id="CF#COMMENT_ID#" title="#BTN_LABEL#" aria-label="#BTN_LABEL#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="z-comment-IR">',
'  <div class="z-commentIcon">',
'    <span title="#COMMENT_FLAG#" arial-label="#COMMENT_FLAG#" class="t-Icon fa fa-lg #FLAG_ICON#" id="CF#COMMENT_ID#"></span>',
'  </div>',
'  <div class="z-commentContainer">',
'    <div class="z-commentTitle u-flex">',
'      <a class="w100p" href="#EDIT_URL#" data-unread="#DATA_UNREAD#" data-id="CF#COMMENT_ID#">',
'        #POST_TITLE#',
'        <div class="z-commentSubtitle">',
'          #COMMENT_BY# &middot; #CREATED_ON#',
'        </div>',
'      </a>',
'    </div>',
'    <div class="z-commentBody">',
'      #COMMENT_BODY#',
'    </div>',
'  </div>',
'  <div class="z-commentStatus">',
'    <span title="#COMMENT_STATUS#" arial-label="#COMMENT_STATUS#" class="t-Icon fa fa-lg #STATUS_ICON#"></span>',
'  </div>',
'</div>'))
,p_owner=>'LAINFJAR'
,p_internal_uid=>65609890641299759
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38201510708747553)
,p_db_column_name=>'COMMENT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Comment Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38201920038747553)
,p_db_column_name=>'POST_ID'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Post Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38202391418747554)
,p_db_column_name=>'PARENT_ID'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Parent Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38202796536747554)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Created on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38199197361747551)
,p_db_column_name=>'CREATED_SINCE'
,p_display_order=>50
,p_column_identifier=>'AC'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38199520234747551)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>60
,p_column_identifier=>'AD'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38200318021747552)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Changed on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38199939626747552)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>90
,p_column_identifier=>'AE'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38200749313747552)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Changed by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38203120636747554)
,p_db_column_name=>'COMMENT_BY'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'Comment by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38201118956747553)
,p_db_column_name=>'POST_TITLE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Post Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38204393984747556)
,p_db_column_name=>'COMMENT_FLAG'
,p_display_order=>130
,p_column_identifier=>'AL'
,p_column_label=>'Flag'
,p_column_html_expression=>'<span title="#COMMENT_FLAG#" aria-label="#COMMENT_FLAG#" class="t-Icon fa #FLAG_ICON# w60" id="CF#COMMENT_ID#"></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38203989442747555)
,p_db_column_name=>'COMMENT_STATUS'
,p_display_order=>150
,p_column_identifier=>'AK'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span title="#COMMENT_STATUS#" aria-hidden="true" class="t-Icon fa #STATUS_ICON# w60"></span>',
'<span class="u-VisuallyHidden">#COMMENT_STATUS#</span>'))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38205174222747556)
,p_db_column_name=>'STATUS_ICON'
,p_display_order=>160
,p_column_identifier=>'AO'
,p_column_label=>'Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38198306677747550)
,p_db_column_name=>'FLAG_ICON'
,p_display_order=>170
,p_column_identifier=>'U'
,p_column_label=>'Flag Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38203516074747555)
,p_db_column_name=>'BTN_DATA_UNREAD'
,p_display_order=>180
,p_column_identifier=>'AJ'
,p_column_label=>'Btn Data Unread'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38198050009747548)
,p_db_column_name=>'COMMENT_BODY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Comment Body'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38590595398274306)
,p_db_column_name=>'CTX_SEARCH'
,p_display_order=>200
,p_column_identifier=>'AQ'
,p_column_label=>'Ctx Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38198763823747550)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>210
,p_column_identifier=>'Z'
,p_column_label=>'Edit URL Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38204741874747556)
,p_db_column_name=>'BTN_LABEL'
,p_display_order=>220
,p_column_identifier=>'AM'
,p_column_label=>'Button Label'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(65614321268303091)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'274170'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'POST_TITLE:COMMENT_BY:CREATED_SINCE:COMMENT_FLAG:COMMENT_STATUS'
,p_sort_column_1=>'CREATED_SINCE'
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
 p_id=>wwv_flow_imp.id(101593570443725326)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(20248729235781977)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(8549985374518244)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38205813987747561)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(65609751049299759)
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
 p_id=>wwv_flow_imp.id(38206871236747562)
,p_name=>'Process Comments Report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(65609751049299759)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38207370031747563)
,p_event_id=>wwv_flow_imp.id(38206871236747562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'blog.admin.ir.commentsAfterRefresh({ "region$": this.affectedElements });'
,p_da_action_comment=>'Attach one time click event listener to report links having data attribute. When report link is clicked change link icon class.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38207765741747563)
,p_name=>'Process Comment'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(65609751049299759)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38208237872747563)
,p_event_id=>wwv_flow_imp.id(38207765741747563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(65609751049299759)
);
wwv_flow_imp.component_end;
end;
/
