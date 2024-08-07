prompt --application/pages/page_00050
begin
--   Manifest
--     PAGE: 00050
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>50
,p_name=>'Links'
,p_alias=>'LINKS'
,p_step_title=>'Links'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(4073365241705286)
,p_step_template=>wwv_flow_imp.id(8457924893518181)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help available for this page.'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45219411531225453)
,p_plug_name=>'Links'
,p_region_css_classes=>'blog-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_08'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  v1.id               as id',
', v1.changed_on       as created_on',
', v1.changed_on       as created_since',
', v1.changed_by       as created_by',
', v1.changed_on       as changed_on',
', v1.changed_on       as changed_since',
', v1.changed_by       as changed_by',
', v1.display_seq      as display_seq',
', v1.link_status_code as link_status',
', v1.title            as title',
', v1.link_desc        as link_desc',
', v1.link_url         as link_url',
', v1.notes            as notes',
', v1.link_is_active   as link_is_active',
'from blog_v_all_links v1',
'where 1 = 1',
'and v1.link_group_id = :P50_LINK_GROUP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P50_LINK_GROUP_ID'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P50_LINK_GROUP_ID'
,p_prn_content_disposition=>'ATTACHMENT'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(45219761514225454)
,p_name=>'Report 1'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:RP,:P51_ID:#ID#'
,p_detail_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-pencil"></span>'
,p_detail_link_attr=>'title="&APP_TEXT$BLOG_TXT_EDIT." class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_owner=>'LAINFJAR'
,p_internal_uid=>45219761514225454
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38372101199124599)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'AK'
,p_column_label=>'Link ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38374185804124600)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>20
,p_column_identifier=>'AY'
,p_column_label=>'Created on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38372911924124599)
,p_db_column_name=>'CREATED_SINCE'
,p_display_order=>30
,p_column_identifier=>'BC'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38374562064124601)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>50
,p_column_identifier=>'AZ'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38371320865124598)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>60
,p_column_identifier=>'AI'
,p_column_label=>'Changed on'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38373380686124600)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>70
,p_column_identifier=>'BD'
,p_column_label=>'Changed'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38371792082124598)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>80
,p_column_identifier=>'AJ'
,p_column_label=>'Changed by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38370121361124597)
,p_db_column_name=>'DISPLAY_SEQ'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Sequence'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38374983192124601)
,p_db_column_name=>'LINK_STATUS'
,p_display_order=>100
,p_column_identifier=>'BA'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TITLE:=#LINK_STATUS#',
'ICON_CLASSES:={if LINK_IS_ACTIVE/}fa-check-circle u-success-text{else/}fa-minus-circle u-danger-text{endif/} w60',
'ICON_ID:=',
'{apply THEME$ICON_CUSTOM_1/}'))
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(11786653039490200)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_column_comment=>'Using HTML Expression because need column filter'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38372582837124599)
,p_db_column_name=>'TITLE'
,p_display_order=>110
,p_column_identifier=>'AN'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38370575256124597)
,p_db_column_name=>'LINK_DESC'
,p_display_order=>120
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38370980612124597)
,p_db_column_name=>'LINK_URL'
,p_display_order=>130
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
 p_id=>wwv_flow_imp.id(38373780393124600)
,p_db_column_name=>'NOTES'
,p_display_order=>140
,p_column_identifier=>'AQ'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(47285425274121325)
,p_db_column_name=>'LINK_IS_ACTIVE'
,p_display_order=>150
,p_column_identifier=>'BE'
,p_column_label=>'Link Is Active'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(45226947735232617)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'31109'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DISPLAY_SEQ:TITLE:LINK_DESC:CHANGED_SINCE:LINK_STATUS'
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
 p_id=>wwv_flow_imp.id(66233945100381437)
,p_name=>'Link Group'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--stack:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_08'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.is_active         as icon_class       -- see column HTML Expression',
'  ,v1.is_active         as icon_color_class -- see column HTML Expression',
'  ,apex_page.get_url(',
'    p_page    => 52',
'    ,p_items  => ''P52_ID''',
'    ,p_values => v1.id',
'  )                     as link',
'  ,null                 as link_attr',
'  ,null                 as link_class',
'  ,v1.title             as list_title',
'  ,v1.notes             as list_text',
'  ,null                 as list_class',
'  ,null                 as list_badge       -- see column HTML Expression',
'  ,v1.display_seq       as display_seq',
'  ,v1.is_active         as is_active',
'from blog_v_all_link_groups v1',
'where 1 = 1',
'and v1.id = :P50_LINK_GROUP_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P50_LINK_GROUP_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8509130466518217)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_row_count_max=>1
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38378340419124606)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{case ICON_CLASS/}',
'{when 1/}',
'fa fa-check',
'{otherwise/}',
'fa fa-minus',
'{endcase/}'))
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38382327040124609)
,p_query_column_id=>2
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>30
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{case ICON_COLOR_CLASS/}',
'{when 1/}',
'u-success',
'{otherwise/}',
'u-danger',
'{endcase/}'))
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38378767715124606)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>110
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38379198029124606)
,p_query_column_id=>4
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>120
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38379561826124607)
,p_query_column_id=>5
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>130
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38379938061124607)
,p_query_column_id=>6
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'List Title'
,p_use_as_row_header=>'Y'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#LIST_TITLE# ',
'<span class="u-VisuallyHidden">(&APP_TEXT$BLOG_TXT_STATUS.: {if IS_ACTIVE/}',
'&APP_TEXT$BLOG_TXT_ENABLED.',
'{else/}',
'&APP_TEXT$BLOG_TXT_DISABLED.',
'{endif/})</span>',
''))
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38380384151124607)
,p_query_column_id=>7
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>150
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38380729334124608)
,p_query_column_id=>8
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>160
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38381183962124608)
,p_query_column_id=>9
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>170
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&APP_TEXT$BLOG_TXT_SEQUENCE.: #DISPLAY_SEQ#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38381958413124608)
,p_query_column_id=>10
,p_column_alias=>'DISPLAY_SEQ'
,p_column_display_sequence=>190
,p_column_heading=>'Display Seq'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(47285177562121322)
,p_query_column_id=>11
,p_column_alias=>'IS_ACTIVE'
,p_column_display_sequence=>200
,p_column_heading=>'Is Active'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(66954991551767607)
,p_plug_name=>'Search Link Groups'
,p_region_css_classes=>'blog-search-region padding-sm'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10025905495694368)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(88389422145151450)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(88389422145151450)
,p_name=>'Select Link Group'
,p_template=>wwv_flow_imp.id(8475523710518195)
,p_display_sequence=>70
,p_region_css_classes=>'blog-search-results'
,p_region_sub_css_classes=>'blog-search-results-items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--stack:t-MediaList--iconsRounded:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id',
'  ,apex_page.get_url(',
'     p_items => ''P50_LINK_GROUP_ID''',
'    ,p_values => v1.id',
'   )    as link',
'  ,null as link_class',
'  ,null as link_attr',
'  ,null as icon_class',
'  ,null as icon_color_class',
'  ,case when v1.id = coalesce( to_number( :P50_LINK_GROUP_ID ), 0 )',
'    then ''is-active'' ',
'   end  as list_class',
'  ,substr( v1.title, 1, 50 ) || ( case when length( v1.title ) > 50 then ''...'' end ) as list_title',
'  ,null as list_text',
'  ,null as list_badge',
'from blog_v_all_link_groups v1',
'where 1 = 1',
'order by v1.display_seq'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8509130466518217)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38383727332124610)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38384505411124611)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38384120873124611)
,p_query_column_id=>3
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>13
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38384913590124611)
,p_query_column_id=>4
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>33
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38385368410124611)
,p_query_column_id=>5
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>23
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38385741777124612)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>43
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38386178629124612)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>53
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38386510025124612)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>63
,p_column_heading=>'List Title'
,p_use_as_row_header=>'Y'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38386994626124613)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>73
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38387376054124613)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>83
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(88487382165628169)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(20248729235781977)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(8549985374518244)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38394580371131050)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(88487382165628169)
,p_button_name=>'RESEQUENCE_GROUPS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Resequence Groups'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$BLOG_CONFIRM_RESEQUENCE_LINK_GROUPS.'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38394966460131050)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(88487382165628169)
,p_button_name=>'CREATE_GROUP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Group'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:52::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38376458962124602)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45219411531225453)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38376868349124603)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45219411531225453)
,p_button_name=>'RESEQUENCE_LINKS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Resequence Links'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$BLOG_CONFIRM_RESEQUENCE_LINKS.'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38377267284124603)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(45219411531225453)
,p_button_name=>'CREATE_LINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Link'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.::P51_LINK_GROUP_ID:&P50_LINK_GROUP_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38377626761124604)
,p_name=>'P50_LINK_GROUP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45219411531225453)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38383063515124610)
,p_name=>'P50_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(66954991551767607)
,p_prompt=>'Search'
,p_source=>'LIST_TITLE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'ROW'
,p_attribute_04=>'N'
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38391306848124617)
,p_name=>'Process Link'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(45219411531225453)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38391804316124618)
,p_event_id=>wwv_flow_imp.id(38391306848124617)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Links Report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45219411531225453)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39992665777374321)
,p_name=>'Link Groups Resequence'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38394580371131050)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39993047068374325)
,p_event_id=>wwv_flow_imp.id(39992665777374321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Resequence Link Groups'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'blog_cm.resequence_link_groups;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39992755363374322)
,p_event_id=>wwv_flow_imp.id(39992665777374321)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Link Group Details'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(66233945100381437)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39993150574374326)
,p_event_id=>wwv_flow_imp.id(39992665777374321)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Link Group List'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88389422145151450)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(47285516779121326)
,p_event_id=>wwv_flow_imp.id(39992665777374321)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Show message'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.showSuccessMessage({',
'  "text": "BLOG_MSG_LINK_GROUPS_RESEQUENCED"',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39993228284374327)
,p_name=>'Links Resequence'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38376868349124603)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39993372250374328)
,p_event_id=>wwv_flow_imp.id(39993228284374327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Resequence Links'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.resequence_links(',
'  p_link_group_id => :P50_LINK_GROUP_ID',
');'))
,p_attribute_02=>'P50_LINK_GROUP_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39993474076374329)
,p_event_id=>wwv_flow_imp.id(39993228284374327)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Links Report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45219411531225453)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(47285685238121327)
,p_event_id=>wwv_flow_imp.id(39993228284374327)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Show message'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.showSuccessMessage({',
'  "text": "BLOG_MSG_LINKS_RESEQUENCED"',
'});'))
);
wwv_flow_imp.component_end;
end;
/
