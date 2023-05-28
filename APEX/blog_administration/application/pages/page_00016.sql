prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Post Tags'
,p_alias=>'POST-TAGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Post Tags'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8929534050595858)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.ig.pageLoad({',
'  sequenceField: "DISPLAY_SEQ"',
'});'))
,p_step_template=>wwv_flow_imp.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230528120052'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51010309190311741)
,p_plug_name=>'Tags'
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_POST_TAGS'
,p_query_where=>'post_id = :P16_POST_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Tags'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52121501066405507)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52121668302405508)
,p_name=>'ROW_VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_VERSION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52121747272405509)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created on'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Date and time when tag was created.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52121859386405510)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created by'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'User who created tag.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52121876158405511)
,p_name=>'CHANGED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed on'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Date and time when tag was last changed.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122039643405512)
,p_name=>'CHANGED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed by'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'User who has last changed tag.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122137314405513)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'0'
,p_attribute_05=>'Disabled'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Tag status in post.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122241216405514)
,p_name=>'DISPLAY_SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_SEQ'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sequence'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'left'
,p_attribute_04=>'numeric'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Tag display sequence in post.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122399878405516)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122565589405517)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52122677410405519)
,p_name=>'POST_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POST_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P16_POST_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52124528440405537)
,p_name=>'TAG_DISPLAY'
,p_source_type=>'SQL_EXPRESSION'
,p_source_expression=>'TAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Tag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_01=>'DIALOG'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7140542412077627)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>true
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_include_in_export=>true
,p_help_text=>'Tag name.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52124660688405538)
,p_name=>'TAG_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAG_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(52439000876687016)
,p_name=>'TAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(60137253140609832)
,p_name=>'TAG_IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAG_IS_ACTIVE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Tag Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_02=>'LOV'
,p_attribute_05=>'PLAIN'
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(11784376262412448)
,p_lov_display_extra=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Tag status.'
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(52121414669405506)
,p_internal_uid=>52121414669405506
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>440
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>'blog.admin.ig.region'
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(52139739305625582)
,p_interactive_grid_id=>wwv_flow_imp.id(52121414669405506)
,p_static_id=>'136438'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(52139874840625584)
,p_report_id=>wwv_flow_imp.id(52139739305625582)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52140449625625595)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(52121501066405507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52141362607625606)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(52121668302405508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52142135408625610)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(52121747272405509)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52143039288625613)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(52121859386405510)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52143934245625616)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(52121876158405511)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52144804505625619)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(52122039643405512)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52145714507625621)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(52122137314405513)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52146620545625624)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(52122241216405514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52158824202646386)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(52122399878405516)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52222525854908257)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(52122677410405519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52344208535381696)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(52124528440405537)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>181
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52348913289451239)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(52124660688405538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(52442700830715191)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(52439000876687016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(62347233713723585)
,p_view_id=>wwv_flow_imp.id(52139874840625584)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(60137253140609832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(62028937660022767)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38505754285327704)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(62028937660022767)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38506131348327704)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(62028937660022767)
,p_button_name=>'RESEQUENCE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(8549081018518243)
,p_button_image_alt=>'Resequence'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Resequence tags, incrementing sequence numbers by 10?'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38506558825327704)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(62028937660022767)
,p_button_name=>'ADD_ROW'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Add'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'data-action="selection-add-row"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38506962765327704)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(62028937660022767)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="save"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38503254813327700)
,p_name=>'P16_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51010309190311741)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38507377657327705)
,p_name=>'Process After Changes'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(51010309190311741)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38507885313327705)
,p_event_id=>wwv_flow_imp.id(38507377657327705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Purge public application global page cache'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 0',
');'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'N'
,p_da_action_comment=>'Purge public application global page regions cache.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38508266645327705)
,p_name=>'Resequence'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38506131348327704)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38508704330327706)
,p_event_id=>wwv_flow_imp.id(38508266645327705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Resequence tags'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.resequence_tags(',
'  p_post_id => :P16_POST_ID',
');'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38509273568327706)
,p_event_id=>wwv_flow_imp.id(38508266645327705)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh IG'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(51010309190311741)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38509725936327706)
,p_event_id=>wwv_flow_imp.id(38508266645327705)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Show message'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.showSuccessMessage({',
'  "text": "BLOG_MSG_TAGS_RESEQUENCED"',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38510154683327707)
,p_name=>'Close Dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38505754285327704)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38510690884327707)
,p_event_id=>wwv_flow_imp.id(38510154683327707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38504002544327702)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51010309190311741)
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Add Tag'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_CM'
,p_attribute_04=>'ADD_TAG'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'Add new tags to repository.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38504514068327702)
,p_page_process_id=>wwv_flow_imp.id(38504002544327702)
,p_page_id=>16
,p_name=>'p_tag'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'TAG_DISPLAY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38505078396327703)
,p_page_process_id=>wwv_flow_imp.id(38504002544327702)
,p_page_id=>16
,p_name=>'p_tag_id'
,p_direction=>'OUT'
,p_data_type=>'NUMBER'
,p_ignore_output=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'TAG_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38503631725327701)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51010309190311741)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tags - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
