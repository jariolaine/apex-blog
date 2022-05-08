prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Add/Edit Categories'
,p_page_mode=>'MODAL'
,p_step_title=>'Categories'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8929534050595858)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.dialogIG.initOnPageLoad({',
'  regionID: "categories"',
'  ,sequenceField: "DISPLAY_SEQ"',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_step_template=>wwv_flow_api.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220507104131'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9834087769215232)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15190060145050375)
,p_plug_name=>'Add/Edit Categories'
,p_region_name=>'categories'
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8495746153518209)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id                as id',
'  ,v1.row_version           as row_version',
'  ,v1.created_on            as created_on',
'  ,v1.created_by            as created_by',
'  ,v1.changed_on            as changed_on',
'  ,v1.changed_by            as changed_by',
'  ,v1.display_seq           as display_seq',
'  ,v1.is_active             as is_active',
'  ,v1.title                 as title',
'  ,v1.notes                 as notes',
'  ,v1.posts_count           as posts_count',
'  ,v1.allowed_row_operation as allowed_row_operation',
'  ,btn.posts_link           as btn_posts_link',
'from #OWNER#.blog_v_all_categories v1',
'-- link to posts button title',
'cross join (',
'  select apex_lang.message( ''BLOG_BTN_TITLE_VIEW_POSTS'' ) as posts_link',
'  from dual',
') btn',
'where 1 = 1'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7945206675868447)
,p_name=>'POSTS_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSTS_COUNT'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Number of post in this category.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7945292162868448)
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
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7945455208868449)
,p_name=>'TITLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TITLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Title'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1024
,p_enable_filter=>true
,p_filter_operators=>'C:S'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Describes what your category is about.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9636633508680604)
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
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9636779658680605)
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
,p_stretch=>'N'
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
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Is category enabled or disabled. If you disable existing category, it will hide all post in this category from readers. Also category is not available anymore in "Category" field search when creating or changing post. Still you can use disabled categ'
||'ory by typing it e.g. for new post. Post will not be visible for reades until you activate category or change post category one that is enabled.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9831001078215202)
,p_name=>'DISPLAY_SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_SEQ'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sequence'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Order of categories displayed in blog.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15191238741050379)
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
 p_id=>wwv_flow_api.id(15191689441050380)
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
 p_id=>wwv_flow_api.id(15192918838050384)
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
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15193502274050385)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'When category was created.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15194115137050385)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Who created category.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15194693500050386)
,p_name=>'CHANGED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_ON'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'When category was last changed.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15195326585050386)
,p_name=>'CHANGED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHANGED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_include_in_export=>true
,p_help_text=>'Who has changed category last.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22958343224076040)
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
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31246816612982908)
,p_name=>'BTN_POSTS_LINK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BTN_POSTS_LINK'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_label=>'Link to Posts'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:CR,:IR_CATEGORY_ID:&ID.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-external-link"></span>'
,p_link_attributes=>'title="&BTN_POSTS_LINK."'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.dialogIG.initLinkColumn '
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
,p_help_text=>'Filter posts report by this category.'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(15190504448050377)
,p_internal_uid=>15190504448050377
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
,p_javascript_code=>'blog.admin.dialogIG.initRegion'
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(15190897476050378)
,p_interactive_grid_id=>wwv_flow_api.id(15190504448050377)
,p_static_id=>'249317'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(15190999218050378)
,p_report_id=>wwv_flow_api.id(15190897476050378)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4066741092709318)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(7945292162868448)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4067409998709321)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(7945455208868449)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8053223707903245)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(7945206675868447)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9723161622945647)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(9636633508680604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9732130547095900)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(9636779658680605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9839270192260680)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(9831001078215202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15192129266050381)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(15191689441050380)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15193264883050385)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(15192918838050384)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15193877460050385)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(15193502274050385)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15194550317050386)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(15194115137050385)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15195160465050386)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(15194693500050386)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(15195686781050387)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(15195326585050386)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23019545449620780)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(22958343224076040)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(31273615503670215)
,p_view_id=>wwv_flow_api.id(15190999218050378)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(31246816612982908)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10046682855305207)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9834087769215232)
,p_button_name=>'CLOSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13421874140815042)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9834087769215232)
,p_button_name=>'DELETE_UNUSED'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Delete Unused'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$BLOG_CONFIRM_DELETE_UNUSED_CATEGORIES.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13760761587940679)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9834087769215232)
,p_button_name=>'RESEQUENCE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(8549081018518243)
,p_button_image_alt=>'Resequence'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Resequence categories, incrementing sequence numbers by 10?'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-sequence'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10046059662301634)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9834087769215232)
,p_button_name=>'ADD_ROW'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Add'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-plus'
,p_button_cattributes=>'data-action="ig-selection-add-row"'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10046320819303272)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9834087769215232)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="ig-save"'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(27863828688256837)
,p_name=>'Process After Changes'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(15190060145050375)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27863926709256838)
,p_event_id=>wwv_flow_api.id(27863828688256837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 0',
');'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13627299330077832)
,p_name=>'Resequence'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13760761587940679)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13627324698077833)
,p_event_id=>wwv_flow_api.id(13627299330077832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'#OWNER#.blog_cm.resequence_categories;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13627411354077834)
,p_event_id=>wwv_flow_api.id(13627299330077832)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(15190060145050375)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13627594239077835)
,p_name=>'Delete unused'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(13421874140815042)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13627608635077836)
,p_event_id=>wwv_flow_api.id(13627594239077835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'#OWNER#.blog_cm.remove_unused_categories;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13627747319077837)
,p_event_id=>wwv_flow_api.id(13627594239077835)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(15190060145050375)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4069842441688345)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(15190060145050375)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Categories - Save IG Data'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_CATEGORIES'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
