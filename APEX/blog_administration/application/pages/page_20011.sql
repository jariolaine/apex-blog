prompt --application/pages/page_20011
begin
--   Manifest
--     PAGE: 20011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20011
,p_name=>'Features'
,p_alias=>'FEATURES'
,p_page_mode=>'MODAL'
,p_step_title=>'Features'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8574375481518289)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.configIG.initOnPageLoad({',
'  regionId: "features"',
'});'))
,p_step_template=>wwv_flow_imp.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221003075520'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27063074415689131)
,p_plug_name=>'Features'
,p_region_name=>'features'
,p_region_css_classes=>'z-config-ig'
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.id                as feature_id',
'  ,v1.build_option_id       as build_option_id',
'  ,v1.application_id        as application_id',
'  ,v1.display_seq           as display_seq',
'  ,v1.feature_name          as feature_name',
'-- HTML in query because IG not use HTM expression in control break column',
'  ,apex_string.format(',
'     p_message => ''<span data-sort-order="%s" class="u-bold">%s</span>''',
'    ,p0 => v1.feature_group_seq',
'    ,p1 => apex_escape.html( v1.feature_group )',
'  )                         as feature_group',
'  ,v1.build_option_status   as status',
'  ,btn.title_help           as help_btn',
'  ,v1.last_updated_on       as last_updated',
'  ,v1.last_updated_by       as last_updated_by',
'-- add extra paddinging to child features',
'  ,case',
'    when v1.feature_parent is null',
'    then ''margin-left-none''',
'    else ''margin-left-md''',
'  end                       as feature_name_class',
'from #OWNER#.blog_v_all_features v1',
'cross join(',
'  select ',
'    apex_lang.message( ''BLOG_BTN_TITLE_HELP'' ) as title_help',
'  from dual',
') btn',
'where 1 = 1',
'  and v1.application_id = :G_PUB_APP_ID',
'  and case',
'    when v1.feature_parent is not null',
'      then case',
'        when ',
'          apex_util.get_build_option_status(',
'            p_application_id     => v1.application_id ',
'            ,p_build_option_name  => v1.feature_parent',
'          ) = ''INCLUDE''',
'        then 1',
'        else 0',
'      end',
'    else v1.is_active',
'  end = 1',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11418148388329139)
,p_name=>'HELP_BTN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HELP_BTN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Help'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_stretch=>'A'
,p_link_target=>'f?p=&APP_ID.:20100:&SESSION.:FEATURES:&DEBUG.::P20100_ID:&FEATURE_ID.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-question-circle-o"></span>'
,p_link_attributes=>'title="&HELP_BTN." aria-label="&HELP_BTN." class="t-Button t-Button--noLabel t-Button--icon t-Button--link padding-none"'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27063954758689140)
,p_name=>'FEATURE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEATURE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'padding-left-md'
,p_stretch=>'A'
,p_attribute_01=>'<span class="&FEATURE_NAME_CLASS.">&FEATURE_NAME.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27064090845689141)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_stretch=>'A'
,p_attribute_01=>'N'
,p_attribute_02=>'Include'
,p_attribute_03=>'Enabled'
,p_attribute_04=>'Exclude'
,p_attribute_05=>'Disabled'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27064171681689142)
,p_name=>'LAST_UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_format_mask=>'&G_USER_DATE_TIME_FORMAT.'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27064260575689143)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Changed by'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27064417624689145)
,p_name=>'BUILD_OPTION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUILD_OPTION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27064811987689149)
,p_name=>'APPLICATION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27863097078256829)
,p_name=>'FEATURE_GROUP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEATURE_GROUP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Group'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attribute_05=>'HTML'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>'blog.admin.configIG.initColumn'
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(27863475337256833)
,p_name=>'DISPLAY_SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_SEQ'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Sequence'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_stretch=>'A'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(31618718657094023)
,p_name=>'FEATURE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEATURE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(65303021591080933)
,p_name=>'FEATURE_NAME_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEATURE_NAME_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(27063837092689139)
,p_internal_uid=>27063837092689139
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.configIG.initRegion',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(27234020761386684)
,p_interactive_grid_id=>wwv_flow_imp.id(27063837092689139)
,p_static_id=>'249339'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(27234106973386684)
,p_report_id=>wwv_flow_imp.id(27234020761386684)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1155680954075)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(27863097078256829)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2558679049308)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(27064811987689149)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(12038942654216171)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(11418148388329139)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>54
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(19868643284695907)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(65303021591080933)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27234600908386689)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(27063954758689140)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>311
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27235173961386695)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(27064090845689141)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27235654702386697)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(27064171681689142)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27236148784386699)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(27064260575689143)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(27237124036386703)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(27064417624689145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(28377689116437035)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(27863475337256833)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(35003445118242998)
,p_view_id=>wwv_flow_imp.id(27234106973386684)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(31618718657094023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52996033344836443)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27222526424265236)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(52996033344836443)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27266116436768098)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(52996033344836443)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'js-actionButton'
,p_icon_css_classes=>'fa-save'
,p_button_cattributes=>'data-action="ig-save"'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(43470169235898233)
,p_branch_name=>'Go to Page 20011'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27222796832267521)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(27222526424265236)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27223126029267523)
,p_event_id=>wwv_flow_imp.id(27222796832267521)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28391543520211237)
,p_name=>'Process After Changes'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27063074415689131)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13944613114359340)
,p_event_id=>wwv_flow_imp.id(28391543520211237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28391961651211232)
,p_event_id=>wwv_flow_imp.id(28391543520211237)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 0',
');',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14806954183070103)
,p_name=>'Set Edit Mode'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14807006401070104)
,p_event_id=>wwv_flow_imp.id(14806954183070103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27063074415689131)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region(this.affectedElements[0].id).call("getActions").set("edit", true);',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27064721351689148)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(27063074415689131)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Features - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.update_feature(',
'   p_app_id          => :APPLICATION_ID',
'  ,p_build_option_id => :BUILD_OPTION_ID',
'  ,p_build_status    => :STATUS',
');'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APEX$ROW_STATUS'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'U'
,p_exec_cond_for_each_row=>'Y'
,p_process_success_message=>'Changes saved'
,p_process_comment=>'Update build option value and run post expression'
);
wwv_flow_imp.component_end;
end;
/
