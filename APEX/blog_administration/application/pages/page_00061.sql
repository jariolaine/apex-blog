prompt --application/pages/page_00061
begin
--   Manifest
--     PAGE: 00061
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>61
,p_name=>'View Comment'
,p_alias=>'VIEW-COMMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Comment'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230409185220'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75821212046018894)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8476383962518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(83898371708056982)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475523710518195)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_COMMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(99217848580193002)
,p_name=>'&P61_POST_TITLE.'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.comment_by   as user_name',
'  ,v1.body_html   as comment_text',
'  ,v1.created_on  as comment_date',
'  ,''u-hidden''     as icon_modifier',
'  ,''z-comment''    as comment_modifiers',
'  ,null           as user_icon',
'  ,null           as actions',
'  ,null           as attribute_1',
'  ,null           as attribute_2',
'  ,null           as attribute_3',
'  ,null           as attribute_4',
'from blog_v_all_comments v1',
'where 1 = 1',
'  and v1.id = :P61_ID',
'order by v1.id'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
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
 p_id=>wwv_flow_imp.id(38185803508731791)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38186275650731792)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38186657992731793)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38187412791731794)
,p_query_column_id=>4
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38187855611731794)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>6
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38187066910731793)
,p_query_column_id=>6
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>4
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38188227654731795)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>16
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38188676115731796)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>26
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38189036656731796)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>36
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38189427138731797)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>46
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(38189835444731797)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>56
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38177158135731779)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
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
 p_id=>wwv_flow_imp.id(38177575360731779)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38177963674731780)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'UNREAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Mark as Unread'
,p_button_position=>'EDIT'
,p_button_condition=>'P61_PARENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-envelope-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38178354425731780)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'DISABLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Disable'
,p_button_position=>'EDIT'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'ENABLED'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-lock'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38178765749731781)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'ENABLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Enable'
,p_button_position=>'EDIT'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'DISABLED'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-unlock'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38179173303731781)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62:P62_ID:\&P61_ID.\'
,p_icon_css_classes=>'fa-pencil'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38176354843731777)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'APPROVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve'
,p_button_position=>'EDIT'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'MODERATE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'62'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38176771292731778)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(75821212046018894)
,p_button_name=>'REPLY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reply'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_comments v1',
'where 1 = 1',
'and v1.parent_id is null',
'and v1.comment_id = :P61_ID'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(38196086585731811)
,p_branch_name=>'Go To Page 61'
,p_branch_action=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38179865610731782)
,p_name=>'P61_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38180245070731783)
,p_name=>'P61_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38180637203731784)
,p_name=>'P61_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38181012240731784)
,p_name=>'P61_COMMENT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'COMMENT_STATUS_CODE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38181421200731785)
,p_name=>'P61_POST_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'POST_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38181812681731785)
,p_name=>'P61_PARENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'PARENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38182251263731786)
,p_name=>'P61_POST_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_item_source_plug_id=>wwv_flow_imp.id(83898371708056982)
,p_source=>'POST_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38190332219731799)
,p_computation_sequence=>10
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
,p_computation_comment=>'Disable comment.'
,p_compute_when=>'DISABLE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38190768395731799)
,p_computation_sequence=>20
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_computation_comment=>'Enable comment.'
,p_compute_when=>'ENABLE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(38191103585731800)
,p_computation_sequence=>30
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_computation_comment=>'Enable comment when approving.'
,p_compute_when=>'APPROVE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38194698405731807)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38177158135731779)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38195112914731809)
,p_event_id=>wwv_flow_imp.id(38194698405731807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38191460475731801)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Unflag unread and new'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'UNFLAG_COMMENT'
,p_internal_uid=>38191460475731801
,p_process_comment=>'When view comment remove new and unread flags.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473118498283502)
,p_page_process_id=>wwv_flow_imp.id(38191460475731801)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38473215991283503)
,p_page_process_id=>wwv_flow_imp.id(38191460475731801)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'NEW:UNREAD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38185137430731790)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(83898371708056982)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Items'
,p_attribute_01=>'TABLE'
,p_attribute_03=>'BLOG_COMMENTS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38185137430731790
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38191811002731801)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Unflag moderate'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'UNFLAG_COMMENT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38176354843731777)
,p_process_success_message=>'Comment approved.'
,p_internal_uid=>38191811002731801
,p_process_comment=>'Remove moderate flag from comment.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38192327787731803)
,p_page_process_id=>wwv_flow_imp.id(38191811002731801)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38192877408731804)
,p_page_process_id=>wwv_flow_imp.id(38191811002731801)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'MODERATE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38193234448731805)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Flag unread'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'FLAG_COMMENT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38177963674731780)
,p_internal_uid=>38193234448731805
,p_process_comment=>'Set unread flag to comment.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38193790050731805)
,p_page_process_id=>wwv_flow_imp.id(38193234448731805)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(38194222184731806)
,p_page_process_id=>wwv_flow_imp.id(38193234448731805)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'UNREAD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38590181651274302)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog Flag Unread'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(38177963674731780)
,p_process_success_message=>'Comment marked as unread.'
,p_internal_uid=>38590181651274302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38184705007731789)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(83898371708056982)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Items'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38184705007731789
);
wwv_flow_imp.component_end;
end;
/
