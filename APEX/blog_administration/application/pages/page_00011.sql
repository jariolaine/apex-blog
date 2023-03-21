prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Posts'
,p_alias=>'POSTS'
,p_step_title=>'Posts'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8929534050595858)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230321132712'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8596898648797585)
,p_plug_name=>'Posts Report'
,p_region_css_classes=>'z-IR--iconLinks z-posts  z-post--IR'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_08'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   v1.id                as post_id',
'  ,v1.category_id       as category_id',
'  ,v1.tag_id            as tag_id',
'  ,v1.created_on        as created_on',
'  ,v1.created_on        as created_since',
'  ,v1.created_by        as created_by',
'  ,v1.changed_on        as changed_on',
'  ,v1.changed_on        as changed_since',
'  ,v1.changed_by        as changed_by',
'  ,v1.published_display as published_on',
'  ,v1.published_display as published_since',
'  ,v1.blogger_name      as blogger_name',
'  ,v1.category_title    as category_title',
'  ,v1.title             as post_title',
'  ,v1.post_desc         as post_desc',
'  ,v1.visible_tags      as visible_tags',
'  ,v1.hidden_tags       as hidden_tags',
'  ,v1.body_length       as body_length',
'  ,v1.comments_cnt      as comments_count',
'  ,v1.notes             as notes',
'  ,v1.post_status_code  as post_status_code',
'  ,v1.post_status       as post_status',
'  ,btn.title_tags       as btn_title_tags',
'  ,btn.title_edit       as btn_title_edit',
'  ,case v1.post_status_code',
'    when ''BLOGGER_DISABLED'' then ''fa-stop-circle u-danger-text''',
'    when ''CATEGORY_DISABLED''then ''fa-minus-circle u-danger-text''',
'    when ''DRAFT''            then ''fa-pause-circle u-warning-text''',
'    when ''SCHEDULED''        then ''fa-clock-o u-info-text''',
'    when ''PUBLISHED''        then ''fa-check-circle u-success-text''',
'                            else ''fa-question-circle''',
'   end                      as post_status_icon',
'  ,v1.post_edit_url         as edit_url',
'-- Post HTML for detail view',
'  ,v1.body_html',
'-- Post date for detail view',
'  ,to_char(',
'     v1.published_on',
'    ,:G_POST_TITLE_DATE_FORMAT',
'  )                     as detail_view_published',
'-- Tags HTML for detail view',
'  ,v1.tags_html         as tags_html',
'-- Text search',
'  ,v1.post_txt_search   as post_txt_search',
'from #OWNER#.blog_v_all_posts v1',
'-- link column button title',
'cross join (',
'  select',
'     apex_lang.message( ''BLOG_BTN_TITLE_EDIT'' ) as title_edit',
'    ,apex_lang.message( ''BLOG_BTN_TITLE_TAGS'' ) as title_tags',
'  from dual',
') btn',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8597041868797585)
,p_name=>'Articles'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_oracle_text_index_column=>'POST_TXT_SEARCH'
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
,p_detail_link_attr=>'title="#BTN_TITLE_EDIT#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article role="article" class="z-post">',
'  <header class="z-post--header">',
'    <div class="z-post--date">#DETAIL_VIEW_PUBLISHED#</div>',
'    <h1 class="z-post--title "><a href="#EDIT_URL#" class="u-normal">#POST_TITLE#</a></h1>',
'    <div class="z-post--category">#CATEGORY_TITLE#</div>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--footer">',
'    <div class="z-post--tags">',
'      #TAGS_HTML#',
'    </div>',
'  </footer>',
'</article>'))
,p_owner=>'LAINFJAR'
,p_internal_uid=>4850446289826818
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3879808787180115)
,p_db_column_name=>'POST_ID'
,p_display_order=>10
,p_column_identifier=>'AD'
,p_column_label=>'Post ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9637626471680614)
,p_db_column_name=>'CATEGORY_ID'
,p_display_order=>30
,p_column_identifier=>'AS'
,p_column_label=>'Category ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(37645634614287122)
,p_db_column_name=>'TAG_ID'
,p_display_order=>40
,p_column_identifier=>'BN'
,p_column_label=>'Tag ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27275478849075433)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>50
,p_column_identifier=>'BH'
,p_column_label=>'Created on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21638870596282116)
,p_db_column_name=>'CREATED_SINCE'
,p_display_order=>60
,p_column_identifier=>'BR'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27275565959075434)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>70
,p_column_identifier=>'BI'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8599408102797592)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Changed on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21638986428282117)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>100
,p_column_identifier=>'BS'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8599862540797593)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>110
,p_column_identifier=>'G'
,p_column_label=>'Changed by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24468689536361506)
,p_db_column_name=>'PUBLISHED_ON'
,p_display_order=>120
,p_column_identifier=>'AY'
,p_column_label=>'Published on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21639087960282118)
,p_db_column_name=>'PUBLISHED_SINCE'
,p_display_order=>130
,p_column_identifier=>'BT'
,p_column_label=>'Published'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880094723180117)
,p_db_column_name=>'BLOGGER_NAME'
,p_display_order=>140
,p_column_identifier=>'AF'
,p_column_label=>'Blogger'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(11799190347841995)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880100059180118)
,p_db_column_name=>'CATEGORY_TITLE'
,p_display_order=>150
,p_column_identifier=>'AG'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880250479180119)
,p_db_column_name=>'POST_TITLE'
,p_display_order=>160
,p_column_identifier=>'AH'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880461305180121)
,p_db_column_name=>'POST_DESC'
,p_display_order=>170
,p_column_identifier=>'AJ'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24471943643361539)
,p_db_column_name=>'VISIBLE_TAGS'
,p_display_order=>180
,p_column_identifier=>'BB'
,p_column_label=>'Tags (Enabled)'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(24779831361886842)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24471868067361538)
,p_db_column_name=>'HIDDEN_TAGS'
,p_display_order=>190
,p_column_identifier=>'BA'
,p_column_label=>'Tags (Disabled)'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(24782207188898443)
,p_rpt_show_filter_lov=>'2'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880562284180122)
,p_db_column_name=>'BODY_LENGTH'
,p_display_order=>200
,p_column_identifier=>'AK'
,p_column_label=>'HTML Length'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3881364957180130)
,p_db_column_name=>'COMMENTS_COUNT'
,p_display_order=>210
,p_column_identifier=>'AP'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22958274033076039)
,p_db_column_name=>'NOTES'
,p_display_order=>220
,p_column_identifier=>'AX'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880710343180124)
,p_db_column_name=>'POST_STATUS'
,p_display_order=>240
,p_column_identifier=>'AM'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#POST_STATUS#" class="fa #POST_STATUS_ICON#"></span>',
'<span class="u-VisuallyHidden">#POST_STATUS#</span>',
'',
''))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11795802617710966)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13625357587077813)
,p_db_column_name=>'BTN_TITLE_TAGS'
,p_display_order=>250
,p_column_identifier=>'BQ'
,p_column_label=>'Edit Tags'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_POST_ID:#POST_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="t-Icon fa fa-tag"></span>'
,p_column_link_attr=>'title="#BTN_TITLE_TAGS#" class="t-Button t-Button--noLabel t-Button--icon t t-Button--stretch t-Button--small mxw100"'
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
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31246733855982907)
,p_db_column_name=>'BTN_TITLE_EDIT'
,p_display_order=>270
,p_column_identifier=>'BK'
,p_column_label=>'Btn Title Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33133832120313201)
,p_db_column_name=>'POST_STATUS_CODE'
,p_display_order=>280
,p_column_identifier=>'BV'
,p_column_label=>'Post Status Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25132885666432510)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>290
,p_column_identifier=>'BD'
,p_column_label=>'Edit Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880372195180120)
,p_db_column_name=>'BODY_HTML'
,p_display_order=>300
,p_column_identifier=>'AI'
,p_column_label=>'Body Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11415530557329113)
,p_db_column_name=>'DETAIL_VIEW_PUBLISHED'
,p_display_order=>310
,p_column_identifier=>'BO'
,p_column_label=>'Detail View Published'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21076848274846837)
,p_db_column_name=>'TAGS_HTML'
,p_display_order=>320
,p_column_identifier=>'BP'
,p_column_label=>'Tags Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21641780130282145)
,p_db_column_name=>'POST_TXT_SEARCH'
,p_display_order=>330
,p_column_identifier=>'BU'
,p_column_label=>'Post Txt Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33133905393313202)
,p_db_column_name=>'POST_STATUS_ICON'
,p_display_order=>340
,p_column_identifier=>'BW'
,p_column_label=>'Post Status Icon'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8604892694799317)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'48583'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'POST_TITLE:CATEGORY_TITLE:VISIBLE_TAGS:BTN_TITLE_TAGS:PUBLISHED_SINCE:POST_STATUS'
,p_sort_column_1=>'PUBLISHED_ON'
,p_sort_direction_1=>'DESC NULLS FIRST'
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
 p_id=>wwv_flow_imp.id(24910908943771848)
,p_plug_name=>'Breadcump'
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
 p_id=>wwv_flow_imp.id(24911194442771850)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(24910908943771848)
,p_button_name=>'OPEN_CATEGORIES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Categories'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-media-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25131954621432501)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(24910908943771848)
,p_button_name=>'OPEN_TAGS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'All Tags'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-tags'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24911046946771849)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(24910908943771848)
,p_button_name=>'CREATE_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Post'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6691857398487063)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8596898648797585)
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
 p_id=>wwv_flow_imp.id(13944956080359343)
,p_name=>'Opened from Tab'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(24910908943771848)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13945095580359344)
,p_event_id=>wwv_flow_imp.id(13944956080359343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8596898648797585)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13945452969359348)
,p_name=>'Opened from Report'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8596898648797585)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13945573412359349)
,p_event_id=>wwv_flow_imp.id(13945452969359348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8596898648797585)
);
wwv_flow_imp.component_end;
end;
/
