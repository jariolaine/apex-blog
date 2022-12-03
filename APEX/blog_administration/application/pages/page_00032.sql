prompt --application/pages/page_00032
begin
--   Manifest
--     PAGE: 00032
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
 p_id=>32
,p_name=>'Reply/Edit Comment'
,p_alias=>'COMMENT-FORM'
,p_page_mode=>'MODAL'
,p_step_title=>'&P31_POST_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221112081133'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(76305240814166745)
,p_name=>'Reply to Comment'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic:t-Comments--iconsRounded'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   null             as actions',
'  ,v1.comment_by    as user_name',
'  ,v1.body_html     as comment_text',
'  ,v1.created_on    as comment_date',
'--  ,v1.user_icon     as user_icon',
'--  ,v1.icon_modifier as icon_modifier',
'  ,null             as user_icon',
'  ,''z-hidden''       as icon_modifier',
'  ,null             as comment_modifiers',
'  ,null             as attribute_1',
'  ,null             as attribute_2',
'  ,null             as attribute_3',
'  ,null             as attribute_4',
'from #OWNER#.blog_v_all_comments v1',
'where 1 = 1',
'and v1.id = :P32_PARENT_ID'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_display_when_condition=>'P32_ID'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8521917209518225)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45876868993413643)
,p_query_column_id=>1
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>1
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45877273049413644)
,p_query_column_id=>2
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45877604597413644)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45878079240413645)
,p_query_column_id=>4
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_USER_DATE_TIME_FORMAT.'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45878409793413645)
,p_query_column_id=>5
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>5
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45878857406413645)
,p_query_column_id=>6
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45879234853413646)
,p_query_column_id=>7
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>7
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45879647950413646)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>8
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45880044587413646)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>9
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45880484557413647)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>10
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(45880839156413647)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>11
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(106502470509454426)
,p_plug_name=>'Comment'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_COMMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(106506117309454417)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45881981213413652)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(106506117309454417)
,p_button_name=>'REPLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reply'
,p_button_position=>'CREATE'
,p_button_condition=>'P32_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-send-o'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45722332769325205)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(106506117309454417)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P32_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45881530428413651)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(106506117309454417)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(45725696176325238)
,p_branch_name=>'Go to Page 30'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(37643835188287104)
,p_name=>'P32_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_default=>'1'
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45883809448413654)
,p_name=>'P32_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45884256608413654)
,p_name=>'P32_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45884682070413655)
,p_name=>'P32_POST_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_default=>'P31_POST_ID'
,p_item_default_type=>'ITEM'
,p_source=>'POST_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45885049820413655)
,p_name=>'P32_PARENT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_default=>'P31_ID'
,p_item_default_type=>'ITEM'
,p_source=>'PARENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45885439088413656)
,p_name=>'P32_COMMENT_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_default=>'G_BLOGGER_NAME'
,p_item_default_type=>'ITEM'
,p_source=>'COMMENT_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45886283458413656)
,p_name=>'P32_BODY_HTML'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_item_source_plug_id=>wwv_flow_imp.id(106502470509454426)
,p_prompt=>'Body Html'
,p_source=>'BODY_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'HTML'
,p_attribute_02=>'FULL'
,p_attribute_03=>'MULTILINE'
,p_attribute_04=>'180'
,p_attribute_07=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45887036864413658)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(106502470509454426)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Comment'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45889987720413668)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sent reply notification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.reply_notify(',
'   p_app_id          => :G_PUB_APP_ID',
'  ,p_app_name        => :G_APP_NAME',
'  ,p_post_id         => :P32_POST_ID',
'  ,p_email_template  => ''BLOG_REPLY_TO_COMMENT_NOTIFY''',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(45881981213413652)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'   p_application_id    => :G_PUB_APP_ID',
'  ,p_build_option_name => ''BLOG_FEATURE_SUBSCRIBE_COMMENTS''',
') = ''INCLUDE''',
''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45886695647413657)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(106502470509454426)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Comment'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
