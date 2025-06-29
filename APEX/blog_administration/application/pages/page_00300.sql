prompt --application/pages/page_00300
begin
--   Manifest
--     PAGE: 00300
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>300
,p_name=>'File Repository'
,p_alias=>'FILE-REPOSITORY'
,p_step_title=>'Files'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(101422147890568597)
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_on=>wwv_flow_imp.dz('20250612015622Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(143948299187887498)
,p_plug_name=>'Breadcrumb'
,p_title=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(102694851877614068)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(186701815940327686)
,p_plug_name=>'File Repository'
,p_region_css_classes=>'blog-IR--iconLinks'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_08'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select                        ',
'  v1.id             as id',
', c1.seq_id         as seq_id',
', v1.row_version    as row_version',
'-- for filtering selected rows',
', case when c1.seq_id is not null',
'    then 1',
'    else 0',
'  end               as select_file',
', v1.file_path      as file_path',
', v1.created_by     as created_by',
', v1.created_on     as created_on',
', v1.created_on     as created_since',
', v1.changed_by     as changed_by',
', v1.changed_on     as changed_on',
', v1.changed_on     as changed_since',
', v1.file_dir       as file_dir',
', v1.file_name      as file_name',
', v1.file_desc      as file_desc',
', v1.file_size      as file_size',
', v1.mime_type      as mime_type',
', v1.is_download    as show_in_pub_app',
', v1.is_download    as is_download',
', v1.is_active      as file_status',
', v1.is_active      as is_active',
', v1.file_url       as file_url',
', null              as btn_copy_file_url',
', v1.local_size     as local_size',
', v1.etag           as etag',
', v1.md5            as md5',
', v1.sync_timestamp as sync_timestamp',
'from blog_v_all_files v1',
'left join apex_collections c1 on v1.id = c1.n001',
'  and c1.collection_name = :BLOG_SELECTED_FILES_COLLECTION'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
,p_updated_on=>wwv_flow_imp.dz('20250612015622Z')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(186701920026327687)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_supplemental_text=>'&P0_BLOG_APP_NAME!RAW. files.'
,p_detail_link=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.::P301_ID:#ID#'
,p_detail_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-pencil"></span>'
,p_detail_link_attr=>'title="&APP_TEXT$BLOG_TXT_EDIT." class="t-Button t-Button--noLabel t-Button--icon t-Button--small"'
,p_owner=>'LAINFJAR'
,p_internal_uid=>104255797384495596
,p_updated_on=>wwv_flow_imp.dz('20250612015622Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355132705145162)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'AH'
,p_column_label=>'File ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123574011082651384)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>20
,p_column_identifier=>'W'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124354707575145158)
,p_db_column_name=>'ROW_VERSION'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Row Version'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102480413767597500)
,p_db_column_name=>'SELECT_FILE'
,p_display_order=>40
,p_column_identifier=>'AV'
,p_column_label=>'&nbsp;'
,p_alternative_label=>'Selected'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'LABEL:=&APP_TEXT$BLOG_TXT_SELECT_ROW.',
'BUTTON_ACTION:=select-file?process=SELECT_FILE&id=#ID#',
'BUTTON_ATTR:=role="switch" aria-checked="{if ?SEQ_ID/}true{else/}false{endif/}" data-seq="#SEQ_ID#"',
'NO_UPDATE:=Y',
'BUTTON_STYLE:=t-Button--noUI',
'CSS_CLASSES:=padding-none',
'ICON_CLASS:={if ?SEQ_ID/}fa-check-square-o{else/}fa-square-o{endif/}',
'IS_ICON_ONLY:=Y',
'{apply THEME$BUTTON_CUSTOM_1/}'))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(94235713773375910)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_updated_on=>wwv_flow_imp.dz('20250612015622Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142519396004082767)
,p_db_column_name=>'FILE_PATH'
,p_display_order=>50
,p_column_identifier=>'R'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124354887548145159)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>60
,p_column_identifier=>'AE'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142519710589082770)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Created'
,p_alternative_label=>'Created Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123574657201651390)
,p_db_column_name=>'CREATED_SINCE'
,p_display_order=>80
,p_column_identifier=>'AA'
,p_column_label=>'Created'
,p_alternative_label=>'Created Since'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124354895575145160)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>90
,p_column_identifier=>'AF'
,p_column_label=>'Changed by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142519764597082771)
,p_db_column_name=>'CHANGED_ON'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Changed'
,p_alternative_label=>'Changed Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(123574875676651392)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>110
,p_column_identifier=>'AC'
,p_column_label=>'Changed'
,p_alternative_label=>'Changed Since'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142519483776082768)
,p_db_column_name=>'FILE_DIR'
,p_display_order=>120
,p_column_identifier=>'S'
,p_column_label=>'Directory'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(140412160746291952)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355520721145166)
,p_db_column_name=>'FILE_DESC'
,p_display_order=>140
,p_column_identifier=>'AL'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(142519578452082769)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>150
,p_column_identifier=>'T'
,p_column_label=>'Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355060805145161)
,p_db_column_name=>'MIME_TYPE'
,p_display_order=>160
,p_column_identifier=>'AG'
,p_column_label=>'Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355656797145167)
,p_db_column_name=>'SHOW_IN_PUB_APP'
,p_display_order=>170
,p_column_identifier=>'AM'
,p_column_label=>'Shared'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TEXT:=#SHOW_IN_PUB_APP#',
'ICON_CLASSES:=w40{if IS_DOWNLOAD/} fa-check{endif/}',
'{apply THEME$ICON_CUSTOM/}',
''))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(94235713773375910)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_help_text=>'Is file available for download in public application "Files" page.'
,p_updated_on=>wwv_flow_imp.dz('20250119053357Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355415761145165)
,p_db_column_name=>'IS_DOWNLOAD'
,p_display_order=>180
,p_column_identifier=>'AK'
,p_column_label=>'Is Download'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102895210698185623)
,p_db_column_name=>'FILE_STATUS'
,p_display_order=>190
,p_column_identifier=>'AN'
,p_column_label=>'Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TEXT:=#FILE_STATUS#',
'ICON_CLASSES:={if IS_ACTIVE/}fa-check-circle u-success-text{else/}fa-minus-circle u-danger-text{endif/} w40',
'{apply THEME$ICON_CUSTOM/}'))
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(94230498904244539)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Public access to the file is enabled/disabled.</p>',
'<strong>When object storage is used as file storage:</strong>',
'<p>',
'If the attribute value is <strong>disabled</strong>, access to the file is not blocked.',
'The file is <strong>only hidden</strong> from the public application <strong>Files page</strong> if the file''s <strong>Shared</strong> attribute is <strong>Yes</strong>.',
'</p>'))
,p_updated_on=>wwv_flow_imp.dz('20250119053357Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102895234698185624)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>200
,p_column_identifier=>'AO'
,p_column_label=>'Is Active'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105757235353179008)
,p_db_column_name=>'FILE_URL'
,p_display_order=>210
,p_column_identifier=>'AX'
,p_column_label=>'File URL'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_updated_on=>wwv_flow_imp.dz('20250511064214Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(102896841194185640)
,p_db_column_name=>'BTN_COPY_FILE_URL'
,p_display_order=>220
,p_column_identifier=>'AU'
,p_column_label=>'Copy URL'
,p_alternative_label=>'Copy File URL'
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
,p_display_text_as=>'TMPL_THEME_42$BUTTON_CUSTOM_1'
,p_column_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'BUTTON_ATTR', 'data-clipboard-source="#FILE_URL#"',
  'BUTTON_SIZE', 't-Button--small',
  'ICON_CLASS', 'fa-clipboard',
  'IS_DISABLED', 'N',
  'IS_HOT', 'N',
  'IS_ICON_ONLY', 'Y',
  'LABEL', '&APP_TEXT$BLOG_TXT_COPY_TO_CLIPBOARD.')).to_clob
,p_use_as_row_header=>'N'
,p_updated_on=>wwv_flow_imp.dz('20250612015153Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(104920578381388328)
,p_db_column_name=>'LOCAL_SIZE'
,p_display_order=>230
,p_column_identifier=>'AW'
,p_column_label=>'Local Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186702497272327693)
,p_db_column_name=>'ETAG'
,p_display_order=>240
,p_column_identifier=>'F'
,p_column_label=>'Etag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186701987597327688)
,p_db_column_name=>'MD5'
,p_display_order=>250
,p_column_identifier=>'A'
,p_column_label=>'MD5'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(124355311975145164)
,p_db_column_name=>'SYNC_TIMESTAMP'
,p_display_order=>260
,p_column_identifier=>'AJ'
,p_column_label=>'Synchronized'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_column_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When was the file last synced from the object storage.',
''))
,p_updated_on=>wwv_flow_imp.dz('20250120034225Z')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(140421397447193125)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'170084'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SELECT_FILE:FILE_PATH:FILE_DIR:FILE_SIZE:CHANGED_SINCE:SHOW_IN_PUB_APP:BTN_COPY_FILE_URL:FILE_STATUS'
,p_sort_column_1=>'FILE_PATH'
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
,p_updated_on=>wwv_flow_imp.dz('20250119104430Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103918207441791589)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'DELETE_SELECTED'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Delete Selected'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_show_processing=>'Y'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96788518409172234)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'SELECT_ALL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Select All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-check-square-o'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_created_on=>wwv_flow_imp.dz('20250120035754Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96788673877172235)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'DESELECT_ALL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Deselect All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-square-o'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_created_on=>wwv_flow_imp.dz('20250120035949Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103917323990791590)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'DOWNLOAD_SELECTED'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Download Selected'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-download'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103916983905791591)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'UPLOAD_FILE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:302:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-upload'
,p_updated_on=>wwv_flow_imp.dz('20250415014521Z')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(103918558268791589)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(186701815940327686)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Reset Report'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(104526269433929907)
,p_branch_name=>'Go to download selected files'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:&REQUEST.:&DEBUG.:::'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(103917323990791590)
,p_branch_sequence=>10
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(103925593046791555)
,p_branch_name=>'Go to download selected objects'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:&REQUEST.:&DEBUG.:::'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(103917323990791590)
,p_branch_sequence=>20
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(103919911567791568)
,p_validation_name=>'At Least one files selected'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where 1 = 1',
'  and collection_name = :BLOG_SELECTED_FILES_COLLECTION'))
,p_validation_type=>'EXISTS'
,p_error_message=>'Please select at least one file.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103923679855791560)
,p_name=>'After IR refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(186701815940327686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103924211824791557)
,p_event_id=>wwv_flow_imp.id(103923679855791560)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Format and reinitialize'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.ir.filesAfterRefresh({',
'  "region$": this.affectedElements',
', "browserEvent": this.browserEvent',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103924607115791557)
,p_name=>'Process File Upload'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(103916983905791591)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103925033324791556)
,p_event_id=>wwv_flow_imp.id(103924607115791557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(186701815940327686)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103976261741551196)
,p_name=>'Process File Update'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(186701815940327686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103976708730551191)
,p_event_id=>wwv_flow_imp.id(103976261741551196)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(186701815940327686)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103922411340791562)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Truncate file select collection'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_COLLECTION'
,p_attribute_04=>'TRUNCATE_COLLECTION'
,p_process_when=>'apex_collection.collection_exists( :BLOG_SELECTED_FILES_COLLECTION )'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>21476288698959471
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103922832221791561)
,p_page_process_id=>wwv_flow_imp.id(103922411340791562)
,p_page_id=>300
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'BLOG_SELECTED_FILES_COLLECTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104526737561927192)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Delete selected files'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_FILE'
,p_attribute_04=>'DELETE_SELECTED_FILES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(103918207441791589)
,p_process_success_message=>'File(s) deleted.'
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>22080614920095101
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104527136540927187)
,p_page_process_id=>wwv_flow_imp.id(104526737561927192)
,p_page_id=>300
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'BLOG_SELECTED_FILES_COLLECTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103920132712791568)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Delete selected objects'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_OCI_OS'
,p_attribute_04=>'DELETE_SELECTED_OBJECTS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(103918207441791589)
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>21474010070959477
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103920702210791564)
,p_page_process_id=>wwv_flow_imp.id(103920132712791568)
,p_page_id=>300
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(103921197004791563)
,p_page_process_id=>wwv_flow_imp.id(103920132712791568)
,p_page_id=>300
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'BLOG_SELECTED_FILES_COLLECTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(104527772448923909)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Dowbload selected files'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_FILE'
,p_attribute_04=>'DOWNLOAD_SELECTED_FILES'
,p_process_when=>'DOWNLOAD_SELECTED'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>22081649807091818
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(104528182406923908)
,p_page_process_id=>wwv_flow_imp.id(104527772448923909)
,p_page_id=>300
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'BLOG_SELECTED_FILES_COLLECTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103923291278791561)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Download selected objects'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_OCI_OS'
,p_attribute_04=>'DOWNLOAD_SELECTED_OBJECTS'
,p_process_when=>'DOWNLOAD_SELECTED'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_internal_uid=>21477168636959470
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102479923724597496)
,p_page_process_id=>wwv_flow_imp.id(103923291278791561)
,p_page_id=>300
,p_name=>'p_client_request_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(102480262746597499)
,p_page_process_id=>wwv_flow_imp.id(103923291278791561)
,p_page_id=>300
,p_name=>'p_collection_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'BLOG_SELECTED_FILES_COLLECTION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103922019358791562)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECT_FILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_file.file_select_collection(',
'  p_collection_name => :BLOG_SELECTED_FILES_COLLECTION',
', p_seq_id          => :APP_AJAX_X01',
', p_id              => :APP_AJAX_X02',
');',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>21475896716959471
);
wwv_flow_imp.component_end;
end;
/
