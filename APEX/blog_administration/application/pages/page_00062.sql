prompt --application/pages/page_00062
begin
--   Manifest
--     PAGE: 00062
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>62
,p_name=>'Reply/Edit Comment'
,p_alias=>'COMMENT-FORM'
,p_page_mode=>'MODAL'
,p_step_title=>'&P61_POST_TITLE.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231118082732'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(114467420590895797)
,p_name=>'Reply to Comment'
,p_template=>wwv_flow_imp.id(8496813422518209)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic:t-Comments--iconsRounded'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.comment_by   as user_name',
'  ,v1.body_html   as comment_text',
'  ,v1.created_on  as comment_date',
'  ,''u-hidden''     as icon_modifier',
'  ,''blog-comment'' as comment_modifiers',
'  ,null           as user_icon',
'  ,null           as actions',
'  ,null           as attribute_1',
'  ,null           as attribute_2',
'  ,null           as attribute_3',
'  ,null           as attribute_4',
'from blog_v_all_comments v1',
'where 1 = 1',
'  and v1.id = :P62_PARENT_ID',
'order by v1.id'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_display_when_condition=>'P62_ID'
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
 p_id=>wwv_flow_imp.id(38163110243729054)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38163542262729055)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38163997612729055)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38164782980729056)
,p_query_column_id=>4
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38165135963729056)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>7
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38164381513729055)
,p_query_column_id=>6
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>5
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38162735352729054)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>1
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38165549432729056)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>8
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38165948791729056)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>9
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38166351019729057)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>10
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38166733030729057)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>11
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(144664650286183478)
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
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(144668297086183469)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38173431995729063)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(144668297086183469)
,p_button_name=>'REPLY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reply'
,p_button_position=>'CREATE'
,p_button_condition=>'P62_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-send-o'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38173824593729063)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(144668297086183469)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P62_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38174225906729063)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(144668297086183469)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:62::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38175154280729064)
,p_branch_name=>'Go to Page 60'
,p_branch_action=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:62::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38167472937729058)
,p_name=>'P62_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38167821301729058)
,p_name=>'P62_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38168243466729059)
,p_name=>'P62_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
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
 p_id=>wwv_flow_imp.id(38168604974729059)
,p_name=>'P62_POST_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_default=>'P61_POST_ID'
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
 p_id=>wwv_flow_imp.id(38169053092729059)
,p_name=>'P62_PARENT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_default=>'P61_ID'
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
 p_id=>wwv_flow_imp.id(38169425239729060)
,p_name=>'P62_COMMENT_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
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
 p_id=>wwv_flow_imp.id(38169888901729060)
,p_name=>'P62_BODY_HTML'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_item_source_plug_id=>wwv_flow_imp.id(144664650286183478)
,p_prompt=>'Body Html'
,p_source=>'BODY_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_plugin_init_javascript_code=>'blog.admin.editor.init'
,p_attribute_01=>'HTML'
,p_attribute_02=>'FULL'
,p_attribute_03=>'MULTILINE'
,p_attribute_04=>'180'
,p_attribute_07=>'Y'
,p_attribute_25=>'CKEDITOR'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38598619262472473)
,p_computation_sequence=>70
,p_computation_item=>'P62_BODY_HTML'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'replace( :P62_BODY_HTML, ''#'', ''&#35;'' )'
,p_computation_comment=>'Replace hashmark to HTML entity for preventing APEX substitutions.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38172754113729062)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(144664650286183478)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Comment'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_COMMENTS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38172754113729062
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38174693289729064)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Sent reply notification'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'REPLY_NOTIFY'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38173431995729063)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'   p_application_id    => :G_PUB_APP_ID',
'  ,p_build_option_name => ''BLOG_FEATURE_SUBSCRIBE_COMMENTS''',
') = ''INCLUDE''',
''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>38174693289729064
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473376893283504)
,p_page_process_id=>wwv_flow_imp.id(38174693289729064)
,p_page_id=>62
,p_name=>'p_app_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473415313283505)
,p_page_process_id=>wwv_flow_imp.id(38174693289729064)
,p_page_id=>62
,p_name=>'p_app_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'G_APP_NAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473563014283506)
,p_page_process_id=>wwv_flow_imp.id(38174693289729064)
,p_page_id=>62
,p_name=>'p_post_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P62_POST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473662278283507)
,p_page_process_id=>wwv_flow_imp.id(38174693289729064)
,p_page_id=>62
,p_name=>'p_email_template'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>40
,p_value_type=>'STATIC'
,p_value=>'BLOG_REPLY_TO_COMMENT_NOTIFY'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38590247640274303)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog Reply Posted'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38173431995729063)
,p_process_success_message=>'Reply to comment sent.'
,p_internal_uid=>38590247640274303
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38172399620729062)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(144664650286183478)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Comment'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38172399620729062
);
wwv_flow_imp.component_end;
end;
/
