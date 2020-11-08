prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Comment'
,p_page_mode=>'MODAL'
,p_step_title=>'Comment'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(28670115427911376)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20201103185523'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55991739715660967)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(61042110568461228)
,p_name=>'&P31_POST_TITLE.'
,p_template=>wwv_flow_api.id(8490381578518205)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.comment_by as user_name',
'  ,v1.body_html      as comment_text',
'  ,v1.created_on     as comment_date',
'  ',
'  ,v1.user_icon      as user_icon',
'--  ,v1.icon_modifier  as icon_modifier',
'  ,''z-hidden''        as icon_modifier',
'  ,null              as comment_modifiers',
'  ,null              as attribute_1',
'  ,null              as attribute_2',
'  ,null              as attribute_3',
'  ,null              as attribute_4',
'  ,apex_util.savekey_num(',
'    p_val => v1.is_active',
'  )                  as actions',
'from #OWNER#.blog_v_all_comments v1',
'where 1 = 1',
'and v1.id = :P31_COMMENT_ID'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(8521917209518225)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30613772521708109)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30614187212708109)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30614569335708109)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_USER_DATE_TIME_FORMAT.'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30614938113708108)
,p_query_column_id=>4
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>4
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30615332661708108)
,p_query_column_id=>5
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30615701850708108)
,p_query_column_id=>6
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>6
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30616115701708108)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>7
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30616514146708107)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>8
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30616965477708107)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>9
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_USER_DATE_TIME_FORMAT.'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(30617308053708107)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>10
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32677371093272611)
,p_query_column_id=>11
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>11
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_api.id(8819403626737334)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30218199861087825)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55991739715660967)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30219741701087823)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(55991739715660967)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_ID:&P31_COMMENT_ID.'
,p_icon_css_classes=>'fa-edit'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30218586803087824)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(55991739715660967)
,p_button_name=>'REPLY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reply'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP,:P33_COMMENT_ID:&P31_COMMENT_ID.'
,p_button_condition=>'apex_util.keyval_num = 1'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31247182633982911)
,p_name=>'P31_COMMENT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61042110568461228)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32676362408272601)
,p_name=>'P31_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61042110568461228)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32676400562272602)
,p_name=>'P31_POST_TITLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61042110568461228)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(32676528956272603)
,p_computation_sequence=>10
,p_computation_item=>'P31_POST_TITLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t1.title',
'from #OWNER#.blog_posts t1',
'where 1 = 1',
'and t1.id = :P31_POST_ID'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30214775877134659)
,p_name=>'Format Code'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30215158433134656)
,p_event_id=>wwv_flow_api.id(30214775877134659)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'blog.UI.formatProgramCode("pre.z-program-code")'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30220193517083436)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30218199861087825)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30220516031083435)
,p_event_id=>wwv_flow_api.id(30220193517083436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.component_end;
end;
/
