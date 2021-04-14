prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Posts'
,p_alias=>'POSTS'
,p_step_title=>'Posts'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8929534050595858)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JARI.LAINE.O@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210412205412'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8596898648797585)
,p_plug_name=>'Posts Report'
,p_region_css_classes=>'z-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8495746153518209)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id             as post_id',
'  ,v1.category_id        as category_id',
'  ,v1.created_on         as created_on',
'  ,v1.created_by         as created_by',
'  ,v1.changed_on         as changed_on',
'  ,v1.changed_by         as changed_by',
'  ,v1.blogger_name       as blogger_name',
'  ,v1.category_title     as category_title',
'  ,v1.title              as post_title',
'  ,v1.post_desc          as post_desc',
'  ,v1.post_tags          as post_tags',
'  ,v1.visible_tags       as visible_tags',
'  ,v1.hidden_tags        as hidden_tags',
'  ,v1.body_length        as body_length',
'  ,v1.published_display  as published_on',
'  ,v1.notes              as notes',
'  ,v1.comments_count     as comments_count',
'  ,v1.post_status        as post_status',
'  ,v1.ctx_search         as ctx_search',
'  ,case v1.post_status',
'    when ''BLOGGER_DISABLED''',
'    then ''fa-stop-circle-o u-danger-text''',
'    when ''CATEGORY_DISABLED''',
'    then ''fa-minus-circle-o u-danger-text''',
'    when ''DRAFT''',
'    then ''fa-pause-circle-o u-warning-text''',
'    when ''SCHEDULED''',
'    then ''fa-clock-o u-info-text''',
'    when ''PUBLISHED''',
'    then ''fa-check-circle-o u-success-text''',
'    else ''fa-question-circle-o''',
'   end                   as post_status_icon',
'  ,btn.title_edit        as btn_title_edit',
'  ,apex_page.get_url(',
'     p_page   => 12',
'    ,p_clear_cache => 12',
'    ,p_items  => ''P12_ID''',
'    ,p_values => v1.id',
'   ) as edit_url',
'  ,v1.body_html',
'  ,to_char( v1.published_on, :G_POST_TITLE_DATE_FORMAT ) as ir_detail_view_published',
'from blog_v_all_posts v1',
'cross join (',
'  select apex_lang.message(''BLOG_BTN_TITLE_EDIT'') as title_edit',
'  from dual',
') btn',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(8597041868797585)
,p_name=>'Articles'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_oracle_text_index_column=>'CTX_SEARCH'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'#EDIT_URL#'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_detail_link_attr=>'title="#BTN_TITLE_EDIT#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article role="article" class="z-post z-post--IR">',
'  <header class="z-post--header">',
'    <h3>#IR_DETAIL_VIEW_PUBLISHED#</h3>',
'    <h1><a href="#EDIT_URL#" class="u-normal">#POST_TITLE#</a></h1>',
'    <h2>#CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--footer"></footer>',
'</article>'))
,p_owner=>'LAINFJAR'
,p_internal_uid=>4850446289826818
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3879808787180115)
,p_db_column_name=>'POST_ID'
,p_display_order=>10
,p_column_identifier=>'AD'
,p_column_label=>'Post ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(36998139921037737)
,p_db_column_name=>'CTX_SEARCH'
,p_display_order=>20
,p_column_identifier=>'BM'
,p_column_label=>'Ctx Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9637626471680614)
,p_db_column_name=>'CATEGORY_ID'
,p_display_order=>30
,p_column_identifier=>'AS'
,p_column_label=>'Category ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27275478849075433)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>40
,p_column_identifier=>'BH'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(27275565959075434)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>50
,p_column_identifier=>'BI'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8599408102797592)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8599862540797593)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24468689536361506)
,p_db_column_name=>'PUBLISHED_ON'
,p_display_order=>80
,p_column_identifier=>'AY'
,p_column_label=>'Published'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880094723180117)
,p_db_column_name=>'BLOGGER_NAME'
,p_display_order=>90
,p_column_identifier=>'AF'
,p_column_label=>'Blogger'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880100059180118)
,p_db_column_name=>'CATEGORY_TITLE'
,p_display_order=>100
,p_column_identifier=>'AG'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880250479180119)
,p_db_column_name=>'POST_TITLE'
,p_display_order=>110
,p_column_identifier=>'AH'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880461305180121)
,p_db_column_name=>'POST_DESC'
,p_display_order=>120
,p_column_identifier=>'AJ'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880617009180123)
,p_db_column_name=>'POST_TAGS'
,p_display_order=>130
,p_column_identifier=>'AL'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(7140542412077627)
,p_rpt_show_filter_lov=>'2'
,p_column_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'09.04.2020 - Currently shows also disabled tags.',
'09.04.2020 - Added visible and hidden tags columns'))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24471943643361539)
,p_db_column_name=>'VISIBLE_TAGS'
,p_display_order=>140
,p_column_identifier=>'BB'
,p_column_label=>'Tags (Enabled)'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(24779831361886842)
,p_rpt_show_filter_lov=>'2'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24471868067361538)
,p_db_column_name=>'HIDDEN_TAGS'
,p_display_order=>150
,p_column_identifier=>'BA'
,p_column_label=>'Tags (Disabled)'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(24782207188898443)
,p_rpt_show_filter_lov=>'2'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880562284180122)
,p_db_column_name=>'BODY_LENGTH'
,p_display_order=>160
,p_column_identifier=>'AK'
,p_column_label=>'HTML Length'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3881364957180130)
,p_db_column_name=>'COMMENTS_COUNT'
,p_display_order=>170
,p_column_identifier=>'AP'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22958274033076039)
,p_db_column_name=>'NOTES'
,p_display_order=>180
,p_column_identifier=>'AX'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880710343180124)
,p_db_column_name=>'POST_STATUS'
,p_display_order=>190
,p_column_identifier=>'AM'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#POST_STATUS#" class="fa #POST_STATUS_ICON#"></span>',
'<span class="u-VisuallyHidden">#POST_STATUS#</span>',
''))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(7400955148112919)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31618832374094024)
,p_db_column_name=>'POST_STATUS_ICON'
,p_display_order=>200
,p_column_identifier=>'BL'
,p_column_label=>'Post Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25132885666432510)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>210
,p_column_identifier=>'BD'
,p_column_label=>'Edit Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3880372195180120)
,p_db_column_name=>'BODY_HTML'
,p_display_order=>220
,p_column_identifier=>'AI'
,p_column_label=>'Body Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25136663379432548)
,p_db_column_name=>'IR_DETAIL_VIEW_PUBLISHED'
,p_display_order=>230
,p_column_identifier=>'BF'
,p_column_label=>'Ir Detail View Published'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31246733855982907)
,p_db_column_name=>'BTN_TITLE_EDIT'
,p_display_order=>240
,p_column_identifier=>'BK'
,p_column_label=>'Btn Title Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8604892694799317)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'48583'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'POST_TITLE:CATEGORY_TITLE:POST_STATUS:CHANGED_ON:'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24910908943771848)
,p_plug_name=>'Posts'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_plug_template=>wwv_flow_api.id(8506230469518215)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24911194442771850)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(24910908943771848)
,p_button_name=>'OPEN_CATEGORIES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Categories'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-media-list'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25131954621432501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(24910908943771848)
,p_button_name=>'OPEN_TAGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Tags'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-tags'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(24911046946771849)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(24910908943771848)
,p_button_name=>'CREATE_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Post'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6691857398487063)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(8596898648797585)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24907065006771809)
,p_name=>'Edit Tags or Categories'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(24910908943771848)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24907148824771810)
,p_event_id=>wwv_flow_api.id(24907065006771809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(8596898648797585)
);
wwv_flow_api.component_end;
end;
/
