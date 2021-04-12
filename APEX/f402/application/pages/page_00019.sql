prompt --application/pages/page_00019
begin
--   Manifest
--     PAGE: 00019
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
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Add/Edit Tags'
,p_page_mode=>'MODAL'
,p_step_title=>'Tags'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8929534050595858)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.tagsIG.initOnPageLoad({',
'  regionID: "tags"',
'  ,btnSave: "tags-ig-save"',
'  ,btnAddRow: "tags-ig-selection-add-row",',
'});'))
,p_step_template=>wwv_flow_api.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20210412193521'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9879490963762847)
,p_plug_name=>'Add/Edit Tags'
,p_region_name=>'tags'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8495746153518209)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id                   as id',
'  ,v1.row_version           as row_version',
'  ,v1.created_on            as created_on',
'  ,v1.created_by            as created_by',
'  ,v1.changed_on            as changed_on',
'  ,v1.changed_by            as changed_by',
'  ,v1.is_active             as is_active',
'  ,v1.tag                   as tag',
'  ,v1.notes                 as notes',
'  ,v1.posts_count           as posts_count',
'  ,v1.allowed_row_operation as allowed_row_operation',
'  ,btn.posts_link           as btn_posts_link',
'',
'from #OWNER#.blog_v_all_tags v1',
'cross join (',
'  select apex_lang.message(''BLOG_BTN_TITLE_VIEW_POSTS'') as posts_link',
'  from dual',
') btn',
'where 1 = 1'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831492805215206)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831582840215207)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
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
,p_column_comment=>'Considere use switch in future. APEX 19.2 switch has bug: off value can''t be zero (0)'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831624598215208)
,p_name=>'ROW_VERSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_VERSION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831734623215209)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831882389215210)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831961464215211)
,p_name=>'CHANGED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9832067227215212)
,p_name=>'CHANGED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9832122403215213)
,p_name=>'POSTS_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSTS_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9880664286762850)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9881149534762851)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9882307270762853)
,p_name=>'TAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAG'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9883550380762854)
,p_name=>'ALLOWED_ROW_OPERATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALLOWED_ROW_OPERATION'
,p_data_type=>'VARCHAR2'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22958615778076043)
,p_name=>'NOTES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Notes'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>16000
,p_enable_filter=>true
,p_filter_operators=>'C:CASE_INSENSITIVE'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31246288515982902)
,p_name=>'BTN_POSTS_LINK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_POSTS_LINK'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_label=>'Link to Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,CIR:IRC_POST_TAGS:&TAG.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-external-link"></span>'
,p_link_attributes=>'title="&BTN_POSTS_LINK."'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.tagsIG.initLinkColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(9879968674762848)
,p_internal_uid=>9879968674762848
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
,p_javascript_code=>'blog.admin.tagsIG.initRegion'
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(9880366681762849)
,p_interactive_grid_id=>wwv_flow_api.id(9879968674762848)
,p_static_id=>'249323'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(9880446044762849)
,p_report_id=>wwv_flow_api.id(9880366681762849)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9881547412762851)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(9881149534762851)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9882789520762853)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(9882307270762853)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9883989949762854)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(9883550380762854)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9886214390795866)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(9831492805215206)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9887755247798844)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(9831582840215207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9894344813995126)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(9831624598215208)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9894898631995128)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(9831734623215209)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9895301347995130)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(9831882389215210)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9895890833995132)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(9831961464215211)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9896385949995134)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(9832067227215212)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9896803856995137)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(9832122403215213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23024143858640219)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(22958615778076043)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31257366860898992)
,p_view_id=>wwv_flow_api.id(9880446044762849)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(31246288515982902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19865705897627513)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10031955247412282)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(19865705897627513)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9834467087215236)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19865705897627513)
,p_button_name=>'ADD_ROW'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Add'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'data-action="tags-ig-selection-add-row"'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9834216605215234)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19865705897627513)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="tags-ig-save"'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(24930208886416362)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10031955247412282)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(24930606998416365)
,p_event_id=>wwv_flow_api.id(24930208886416362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9884133660762856)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9879490963762847)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Tags - Save Interactive Grid Data'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_TAGS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
