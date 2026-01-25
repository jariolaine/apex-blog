prompt --application/pages/page_20020
begin
--   Manifest
--     PAGE: 20020
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20020
,p_name=>'AI Prompts'
,p_alias=>'AI-PROMPTS'
,p_page_mode=>'MODAL'
,p_step_title=>'AI Prompts'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20250224150446Z')
,p_last_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(103688717074906907)
,p_plug_name=>'AI System Prompts'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.translation_entry_id as id',
', v1.language_code        as language_code',
', v1.translatable_message as prompt',
', v1.message_text         as prompt_text',
', v1.last_updated_by      as changed_by',
', v1.last_updated_on      as changed_time',
', v1.last_updated_on      as changed_since',
'from apex_application_translations v1',
'where 1 = 1',
'  and v1.application_id = :APP_ID',
'  and v1.translatable_message like ''BLOG\_AI\_SYSTEM\_PROMPT%'' escape ''\'''))
,p_plug_source_type=>'NATIVE_IR'
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
,p_created_on=>wwv_flow_imp.dz('20250224163527Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(103689038193906910)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LAINFJAR'
,p_internal_uid=>103689038193906910
,p_created_on=>wwv_flow_imp.dz('20250224163527Z')
,p_updated_on=>wwv_flow_imp.dz('20250405065018Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103690651121906926)
,p_db_column_name=>'ID'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250309111558Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103689319150906913)
,p_db_column_name=>'LANGUAGE_CODE'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Language Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_created_on=>wwv_flow_imp.dz('20250224163527Z')
,p_updated_on=>wwv_flow_imp.dz('20250309111221Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103690761699906927)
,p_db_column_name=>'PROMPT'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Prompt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250405065018Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103690870575906928)
,p_db_column_name=>'PROMPT_TEXT'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250309112825Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103690979966906929)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250309111221Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103691010408906930)
,p_db_column_name=>'CHANGED_TIME'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Changed'
,p_alternative_label=>'Changed Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250309111523Z')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(103691144662906931)
,p_db_column_name=>'CHANGED_SINCE'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Changed'
,p_alternative_label=>'Changed Since'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_created_on=>wwv_flow_imp.dz('20250309111221Z')
,p_updated_on=>wwv_flow_imp.dz('20250309111523Z')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(109032049725044936)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1090321'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROMPT:PROMPT_TEXT:CHANGED_SINCE:'
,p_created_on=>wwv_flow_imp.dz('20250224163531Z')
,p_updated_on=>wwv_flow_imp.dz('20250309112736Z')
);
wwv_flow_imp.component_end;
end;
/
