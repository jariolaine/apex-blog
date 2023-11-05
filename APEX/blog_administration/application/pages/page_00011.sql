prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
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
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'  Create, edit, manage or delete a post',
'</h2>',
'<h3>',
'  Write a new post',
'</h3>',
'<ol>',
'  <li>',
'    Click New Post.',
'  </li>  ',
'  <li>',
'    Create the post. Use editor options to format post. E.g. in "Styles" select list you find block style "Program Code" that is useful when posting code.',
'  </li>',
'  <li>',
'    To save your post without publishing it, click Save Draf. To publish your post, click Publish.',
'  </li>',
'</ol>',
'<h3>',
'  Edit a post',
'</h3>',
'<ol>',
'  <li>',
'    Click edit button on post you want to edit.',
'  </li>',
'  <li>',
'    Make your changes.',
'  </li>',
'  <li>',
'    Click Save.',
'  </li>',
'</ol>',
'<h3>',
'  Delete a post  ',
'</h3>',
'<ol>',
'  <li>',
'    Click edit button on post you want to delete.',
'  </li>',
'  <li>',
'    Click Delete.',
'  </li>',
'</ol>',
''))
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231005182425'
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
'select',
'   v1.id                    as post_id',
'  ,v1.category_id           as category_id',
'  ,v1.tag_id                as tag_id',
'  ,v1.created_on            as created_on',
'  ,v1.created_on            as created_since',
'  ,v1.created_by            as created_by',
'  ,v1.changed_on            as changed_on',
'  ,v1.changed_on            as changed_since',
'  ,v1.changed_by            as changed_by',
'  ,v1.published_display     as published_on',
'  ,v1.published_display     as published_since',
'  ,v1.blogger_name          as blogger_name',
'  ,v1.category_title        as category_title',
'  ,v1.title                 as post_title',
'  ,v1.post_desc             as post_desc',
'  ,v1.visible_tags          as visible_tags',
'  ,v1.hidden_tags           as hidden_tags',
'  ,v1.body_length           as body_length',
'  ,v1.comments_cnt          as comments_count',
'  ,v1.notes                 as notes',
'  ,v1.post_status_txt       as post_status',
'  ,:APP_TEXT$BLOG_TXT_EDIT  as btn_edit_tags',
'  ,:APP_TEXT$BLOG_TXT_EDIT  as btn_label_edit',
'  ,v1.post_status_icon      as post_status_icon',
' -- For get edit URL also for detail view',
'  ,apex_page.get_url(',
'     p_page   => 12',
'    ,p_items  => ''P12_ID''',
'    ,p_values => v1.id',
'  )                         as edit_url',
'-- Post date for detail view',
'  ,to_char(',
'     v1.published_on',
'    ,:G_POST_TITLE_DATE_FORMAT',
'  )                         as detail_view_published',
'-- Post HTML for detail view',
'  ,v1.body_html             as body_html',
'-- Tags HTML for detail view',
'  ,v1.tags_html             as tags_html',
'-- Text search',
'  ,v1.ctx_search            as ctx_search',
'from blog_v_all_posts v1'))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8597041868797585)
,p_name=>'Articles'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_oracle_text_index_column=>'CTX_SEARCH'
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
,p_detail_link_attr=>'title="#BTN_LABEL_EDIT#" aria-label="#BTN_LABEL_EDIT#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
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
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(46741405563045616)
,p_name=>'Audit Details'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3879808787180115)
,p_db_column_name=>'POST_ID'
,p_display_order=>10
,p_column_identifier=>'AD'
,p_column_label=>'Post ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_group_id=>wwv_flow_imp.id(46741405563045616)
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
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880100059180118)
,p_db_column_name=>'CATEGORY_TITLE'
,p_display_order=>150
,p_column_identifier=>'AG'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(6986423229479201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'Y'
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
,p_rpt_named_lov=>wwv_flow_imp.id(37867559625990235)
,p_rpt_show_filter_lov=>'2'
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
,p_rpt_named_lov=>wwv_flow_imp.id(37867284322984375)
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
'{with/}',
'TITLE:=#POST_STATUS#',
'ICON_CLASSES:=#POST_STATUS_ICON# w60',
'{apply THEME$ICON_CUSTOM_1/}'))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(37868422966001936)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(37425249219377349)
,p_db_column_name=>'BTN_EDIT_TAGS'
,p_display_order=>250
,p_column_identifier=>'CA'
,p_column_label=>'Edit Tags'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::P16_POST_ID:#POST_ID#'
,p_column_linktext=>'<span aria-hidden="true" class="t-Icon fa fa-tag"></span>'
,p_column_link_attr=>'title="#BTN_EDIT_TAGS#" aria-label="#BTN_EDIT_TAGS#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small w60"'
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
 p_id=>wwv_flow_imp.id(37559490661471008)
,p_db_column_name=>'BTN_LABEL_EDIT'
,p_display_order=>260
,p_column_identifier=>'CC'
,p_column_label=>'Btn Label Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33133905393313202)
,p_db_column_name=>'POST_STATUS_ICON'
,p_display_order=>270
,p_column_identifier=>'BW'
,p_column_label=>'Post Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25132885666432510)
,p_db_column_name=>'EDIT_URL'
,p_display_order=>280
,p_column_identifier=>'BD'
,p_column_label=>'Edit Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33134369371313206)
,p_db_column_name=>'DETAIL_VIEW_PUBLISHED'
,p_display_order=>290
,p_column_identifier=>'BY'
,p_column_label=>'Detail View Published'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3880372195180120)
,p_db_column_name=>'BODY_HTML'
,p_display_order=>300
,p_column_identifier=>'AI'
,p_column_label=>'Body Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21076848274846837)
,p_db_column_name=>'TAGS_HTML'
,p_display_order=>310
,p_column_identifier=>'BP'
,p_column_label=>'Tags Html'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38590436638274305)
,p_db_column_name=>'CTX_SEARCH'
,p_display_order=>320
,p_column_identifier=>'CD'
,p_column_label=>'Ctx Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
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
,p_report_columns=>'POST_TITLE:CATEGORY_TITLE:VISIBLE_TAGS:PUBLISHED_SINCE:BTN_EDIT_TAGS:POST_STATUS:'
,p_sort_column_1=>'PUBLISHED_SINCE'
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
,p_button_redirect_url=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
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
,p_name=>'Create Post'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24911046946771849)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
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
 p_id=>wwv_flow_imp.id(38475796789283528)
,p_name=>'Process Category'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24911194442771850)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38475809446283529)
,p_event_id=>wwv_flow_imp.id(38475796789283528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8596898648797585)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38475941874283530)
,p_name=>'Process Tags'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25131954621432501)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38476071372283531)
,p_event_id=>wwv_flow_imp.id(38475941874283530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8596898648797585)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13945452969359348)
,p_name=>'Change Post'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8596898648797585)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
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
