prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_name=>'Add/Edit Tags'
,p_alias=>'TAGS'
,p_page_mode=>'MODAL'
,p_step_title=>'Tags'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8929534050595858)
,p_step_template=>wwv_flow_imp.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231005185653'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48358046251075855)
,p_plug_name=>'Add/Edit Tags'
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8495746153518209)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_TAGS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310048092528214)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310138127528215)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'NUMBER'
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
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Is tag enabled or disabled. If you disable existing tag, it will be hidden form all post from readers. Also tag is not available anymore in "Tags" field search when creating or changing posts. Still you can use disabled tag by typing it e.g. for new '
||'post. If enabling tag again it is then visible on all post where it is linked.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310179885528216)
,p_name=>'ROW_VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_VERSION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310289910528217)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created on'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'When tag was created.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310437676528218)
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
,p_filter_operators=>'C'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Who created tag.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310516751528219)
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
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'When tag was last changed.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310622514528220)
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
,p_filter_operators=>'C'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Who has changed tag last.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48310677690528221)
,p_name=>'POSTS_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSTS_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Number of post in this tag.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48359219574075858)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48359704822075859)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48360862558075861)
,p_name=>'TAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>256
,p_enable_filter=>true
,p_filter_operators=>'C:CASE_INSENSITIVE:S'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>true
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Describes what your tag is about.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(48362105668075862)
,p_name=>'ALLOWED_ROW_OPERATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALLOWED_ROW_OPERATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(61437171065389051)
,p_name=>'NOTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Notes'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:CASE_INSENSITIVE'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
,p_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(69724843803295910)
,p_name=>'VIEW_POSTS_LINK'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_label=>'Link to Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:CR,:IRC_TAG_ID:&ID.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-external-link"></span>'
,p_link_attributes=>'title="&APP_TEXT$BLOG_TXT_VIEW_POSTS." class="t-Button--stretch"'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.ig.column'
,p_enable_hide=>true
,p_escape_on_http_output=>true
,p_help_text=>'Filter posts report by this tag.'
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(48358523962075856)
,p_internal_uid=>48358523962075856
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_edit_row_operations_column=>'ALLOWED_ROW_OPERATION'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>false
,p_enable_download=>true
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>false
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>440
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>'blog.admin.ig.region'
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(48358921969075857)
,p_interactive_grid_id=>wwv_flow_imp.id(48358523962075856)
,p_static_id=>'249323'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(48359001332075857)
,p_report_id=>wwv_flow_imp.id(48358921969075857)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48360102700075859)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(48359704822075859)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>42
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48361344808075861)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(48360862558075861)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48362545237075862)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(48362105668075862)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48364769678108874)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(48310048092528214)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48366310535111852)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(48310138127528215)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48372900101308134)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(48310179885528216)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48373453919308136)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(48310289910528217)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48373856635308138)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(48310437676528218)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48374446121308140)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(48310516751528219)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48374941237308142)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(48310622514528220)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(48375359144308145)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(48310677690528221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(61502699145953227)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(61437171065389051)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(69735922148212000)
,p_view_id=>wwv_flow_imp.id(48359001332075857)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(69724843803295910)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>42
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(58344261184940521)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38486171307313037)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(58344261184940521)
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
 p_id=>wwv_flow_imp.id(38486588409313038)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(58344261184940521)
,p_button_name=>'DELETE_UNUSED'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Delete Unused'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$BLOG_CONFIRM_DELETE_UNUSED_TAGS.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38486939971313038)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(58344261184940521)
,p_button_name=>'ADD_ROW'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Add'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'#action$selection-add-row'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'data-action="selection-add-row"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38487367283313039)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(58344261184940521)
,p_button_name=>'SAVE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'#action$save'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="save"'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38487726005313048)
,p_name=>'Delete unused'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38486588409313038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38488245746313049)
,p_event_id=>wwv_flow_imp.id(38487726005313048)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Delete tags'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'blog_cm.remove_unused_tags;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Call database procedure to delete tags that aren''t used in any post.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38488719856313050)
,p_event_id=>wwv_flow_imp.id(38487726005313048)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Refresh IG'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(48358046251075855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38489164912313050)
,p_event_id=>wwv_flow_imp.id(38487726005313048)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Show message'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.showSuccessMessage({',
'  "text": "BLOG_MSG_TAGS_UNUSED_DELETED"',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38489551632313050)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38486171307313037)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38490077918313050)
,p_event_id=>wwv_flow_imp.id(38489551632313050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38490475306313051)
,p_name=>'Process After Changes'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(48358046251075855)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38490922104313051)
,p_event_id=>wwv_flow_imp.id(38490475306313051)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38485464513313036)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(48358046251075855)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tags - Save Interactive Grid Data'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_TAGS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38485464513313036
);
wwv_flow_imp.component_end;
end;
/
