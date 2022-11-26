prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>17
,p_name=>'Links'
,p_alias=>'LINKS'
,p_step_title=>'Links'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(4073365241705286)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'  display: flex;',
'  flex-direction: column;',
'  overflow: hidden;',
'}',
'.search-results {',
'  flex: 1;',
'  overflow: auto;',
'  border-bottom: 1px solid rgba(0,0,0,.1);',
'}',
'/* Format Search Region */',
'.search-region {',
'  border-bottom: 1px solid rgba(0,0,0,.1);',
'  flex-shrink: 0;',
'}'))
,p_step_template=>wwv_flow_imp.id(8457924893518181)
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221125172946'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6849894493100859)
,p_plug_name=>'Link Details'
,p_region_css_classes=>'z-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id      as id',
'  ,v1.changed_on  as created_on',
'  ,v1.changed_by  as created_by',
'  ,v1.changed_on  as changed_on',
'  ,v1.changed_by  as changed_by',
'  ,v1.link_status as link_status',
'  ,case v1.link_status',
'    when ''ENABLED''',
'    then ''fa-check-circle u-success-text''',
'    else ''fa-minus-circle u-danger-text''',
'   end            as link_status_icon',
'  ,v1.display_seq as display_seq',
'  ,v1.title       as title',
'  ,v1.link_desc   as link_desc',
'  ,v1.link_url    as link_url',
'  ,v1.notes       as notes',
'  ,btn.title_edit as btn_title_edit',
'from #OWNER#.blog_v_all_links v1',
'-- link column button title',
'cross join (',
'  select apex_lang.message(''BLOG_BTN_TITLE_EDIT'') as title_edit',
'  from dual',
') btn',
'where 1 = 1',
'and v1.link_group_id = :P17_LINK_GROUP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P17_LINK_GROUP_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P17_LINK_GROUP_ID'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6850244476100860)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18:P18_ID:#ID#'
,p_detail_link_text=>'<span class="t-Icon fa fa-pencil" aria-hidden="true"></span>'
,p_detail_link_attr=>'title="#BTN_TITLE_EDIT#" aria-lable=title="#BTN_TITLE_EDIT#" class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_owner=>'LAINFJAR'
,p_internal_uid=>3103648897130093
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19359445826963246)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'AK'
,p_column_label=>'Link ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31618992606094025)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>20
,p_column_identifier=>'AY'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31619047211094026)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>30
,p_column_identifier=>'AZ'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18444999722293046)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>40
,p_column_identifier=>'AI'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18445036864293047)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>50
,p_column_identifier=>'AJ'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3882035677180137)
,p_db_column_name=>'DISPLAY_SEQ'
,p_display_order=>70
,p_column_identifier=>'O'
,p_column_label=>'Sequence'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31619295245094028)
,p_db_column_name=>'LINK_STATUS'
,p_display_order=>80
,p_column_identifier=>'BA'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" title="#LINK_STATUS#" class="fa #LINK_STATUS_ICON#"></span>',
'<span class="u-VisuallyHidden">#LINK_STATUS#</span>',
''))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11786653039490200)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19359713146963249)
,p_db_column_name=>'TITLE'
,p_display_order=>100
,p_column_identifier=>'AN'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3882275772180139)
,p_db_column_name=>'LINK_DESC'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3882359433180140)
,p_db_column_name=>'LINK_URL'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'URL'
,p_column_link=>'#LINK_URL#'
,p_column_linktext=>'#LINK_URL#'
,p_column_link_attr=>'target="_blank"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22958590684076042)
,p_db_column_name=>'NOTES'
,p_display_order=>130
,p_column_identifier=>'AQ'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31619389927094029)
,p_db_column_name=>'LINK_STATUS_ICON'
,p_display_order=>140
,p_column_identifier=>'BB'
,p_column_label=>'Link Status Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31246617470982906)
,p_db_column_name=>'BTN_TITLE_EDIT'
,p_display_order=>150
,p_column_identifier=>'AX'
,p_column_label=>'Btn Title Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6857430697108023)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'31109'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'DISPLAY_SEQ:TITLE:LINK_DESC:CHANGED_ON:LINK_STATUS:'
,p_sort_column_1=>'DISPLAY_SEQ'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(27864428062256843)
,p_name=>'Link Groups'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination:t-ContentRow--hideSelection'
,p_display_point=>'REGION_POSITION_08'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id        as id',
'  ,case v1.is_active',
'    when 1',
'    then txt.status_enabled',
'    else txt.status_disabled',
'   end              as status',
'  ,null             as item_classes',
'  ,null             as selection',
'  ,case v1.is_active',
'   when 1',
'    then ''fa fa-check-circle u-success-text''',
'    else ''fa fa-minus-circle u-danger-text''',
'   end              as icon_class',
'  ,null             as icon_html',
'  ,v1.title         as title',
'  ,v1.notes         as description',
'  ,apex_lang.message(',
'     p_name => ''BLOG_TXT_SEQUENCE''',
'    ,p0 => v1.display_seq    ',
'  )                 as misc',
'  ,null             as actions',
'from #OWNER#.blog_v_all_link_groups v1',
'-- status icon title',
'cross join (',
'  select',
'     apex_lang.message( ''BLOG_LOV_IS_ACTIVE_ENABLED'' )  as status_enabled',
'    ,apex_lang.message( ''BLOG_LOV_IS_ACTIVE_DISABLED'' ) as status_disabled',
'  from dual',
') txt',
'where 1 = 1',
'and v1.id = :P17_LINK_GROUP_ID',
''))
,p_display_when_condition=>'P17_LINK_GROUP_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(13914913032214402)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>1
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27864678088256845)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21076609303846835)
,p_query_column_id=>2
,p_column_alias=>'STATUS'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27865132704256850)
,p_query_column_id=>3
,p_column_alias=>'ITEM_CLASSES'
,p_column_display_sequence=>32
,p_column_heading=>'Item Classes'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584229851643001)
,p_query_column_id=>4
,p_column_alias=>'SELECTION'
,p_column_display_sequence=>42
,p_column_heading=>'Selection'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584326761643002)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>52
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584468212643003)
,p_query_column_id=>6
,p_column_alias=>'ICON_HTML'
,p_column_display_sequence=>62
,p_column_heading=>'Icon Html'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="u-VisuallyHidden">#STATUS#</span>'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27864863319256847)
,p_query_column_id=>7
,p_column_alias=>'TITLE'
,p_column_display_sequence=>22
,p_column_heading=>'Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584535602643004)
,p_query_column_id=>8
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>72
,p_column_heading=>'Description'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584606751643005)
,p_query_column_id=>9
,p_column_alias=>'MISC'
,p_column_display_sequence=>82
,p_column_heading=>'Misc'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28584807382643007)
,p_query_column_id=>10
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>92
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28585474513643013)
,p_plug_name=>'Search Master Record'
,p_region_css_classes=>'search-region padding-sm'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(50019905107026856)
,p_name=>'Select Master Record'
,p_template=>wwv_flow_imp.id(8475523710518195)
,p_display_sequence=>70
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--stack:t-MediaList--iconsRounded:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id',
'  ,null as link_class',
'  ,apex_page.get_url(',
'     p_items => ''P17_LINK_GROUP_ID''',
'    ,p_values => v1.id',
'   )    as link',
'  ,null as link_attr',
'  ,null as icon_class',
'  ,null as icon_color_class',
'  ,case when coalesce( to_number( :P17_LINK_GROUP_ID ), 0 ) = id',
'   then ''is-active'' ',
'   end  as list_class',
'  ,substr( v1.title, 1, 50 ) || ( case when length( v1.title ) > 50 then ''...'' end ) as list_title',
'  ,null as list_text',
'  ,null as list_badge',
'',
'--  ,v1.is_active as list_text',
'--  ,v1.link_count as list_badge',
'from #OWNER#.blog_v_all_link_groups v1',
'where 1 = 1',
'and (',
'  :P17_SEARCH is null or ',
'  v1.title_unique like ''%'' || upper( :P17_SEARCH ) || ''%''',
')',
'order by v1.display_seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P17_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8509130466518217)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25053755408936240)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25054176543936243)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25054587149936243)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25055380664936243)
,p_query_column_id=>4
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25054938493936243)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25055757810936244)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25056164525936244)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25056574247936244)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25056973754936244)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25057314606936245)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50093168854497120)
,p_plug_name=>'Links'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50134751826863797)
,p_plug_name=>'No Record Found'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>90
,p_plug_source=>'<span class="nodatafound">&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.</span>'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P17_LINK_GROUP_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25129089948406507)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(50093168854497120)
,p_button_name=>'RESET_PAGE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.:RESET:&DEBUG.:RP,17::'
,p_icon_css_classes=>'fa-undo-alt'
,p_required_patch=>wwv_flow_imp.id(24687280101070827)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(29623575443195201)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(50093168854497120)
,p_button_name=>'EDIT_GROUP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Edit Group'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::P20_ID:&P17_LINK_GROUP_ID.'
,p_button_condition=>'P17_LINK_GROUP_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-pencil'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12512556504984031)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(50093168854497120)
,p_button_name=>'RESEQUENCE_GROUPS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Resequence Groups'
,p_button_position=>'NEXT'
,p_confirm_message=>'Resequence group entries, incrementing sequence numbers by 10?'
,p_confirm_style=>'warning'
,p_button_condition=>'P17_LINK_GROUP_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25129462465406507)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(50093168854497120)
,p_button_name=>'CREATE_GROUP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Group'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7185644806716235)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6849894493100859)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12512001817984026)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6849894493100859)
,p_button_name=>'RESEQUENCE_LINKS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Resequence Links'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_confirm_message=>'Resequence link entries, incrementing sequence numbers by 10?'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24908291637771821)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6849894493100859)
,p_button_name=>'CREATE_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Link'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18:P18_LINK_GROUP_ID:&P17_LINK_GROUP_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9278142428652935)
,p_name=>'P17_LINK_GROUP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6849894493100859)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25050007795925796)
,p_name=>'P17_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(28585474513643013)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25069146414044604)
,p_name=>'Edit Detail Record'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6849894493100859)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25069568939044605)
,p_event_id=>wwv_flow_imp.id(25069146414044604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6849894493100859)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25070418411047483)
,p_name=>'Perform Search'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25070810500047484)
,p_event_id=>wwv_flow_imp.id(25070418411047483)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(50019905107026856)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25071301999047484)
,p_event_id=>wwv_flow_imp.id(25070418411047483)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12512414183984030)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Resequence Links'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.resequence_links(',
'  p_link_group_id => :P17_LINK_GROUP_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12512001817984026)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12512970376984035)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Resequence Groups'
,p_process_sql_clob=>'#OWNER#.blog_cm.resequence_link_groups;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12512556504984031)
);
wwv_flow_imp.component_end;
end;
/
