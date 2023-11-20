prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Search Result'
,p_alias=>'SEARCH'
,p_step_title=>'Search | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>'"BLOG_META_ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(39030203881986717)
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'26'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231119124512'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38694166324057112)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#:t-ResultsRegion--boxed:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(9260227573556082)
,p_plug_display_sequence=>20
,p_plug_source_type=>'NATIVE_SEARCH_REGION'
,p_ajax_items_to_submit=>'P4_SEARCH_FROM'
,p_attribute_02=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'P4_SEARCH'
,p_attribute_06=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'0'
,p_attribute_13=>'<span class="nodatafound">&APP_TEXT$BLOG_MSG_ENTER_SEARCH_TERM.</span>'
,p_attribute_15=>'Y'
,p_attribute_16=>'<span class="nodatafound">&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.</span>'
,p_attribute_17=>'ITEM'
,p_attribute_18=>'G_SEARCH_ROWS'
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38694658146057114)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38693503352046221)
,p_use_as_initial_result=>false
,p_display_sequence=>10
,p_name=>'Posts'
,p_condition_type=>'EXISTS'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from table(',
'  apex_string.split (',
'    p_str => :P4_SEARCH_FROM',
'    ,p_sep => '':''',
'  )',
')',
'where column_value = ''POSTS'''))
,p_build_option_id=>wwv_flow_imp.id(8667733481689180)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38320719099727402)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(9179327552270533)
,p_use_as_initial_result=>false
,p_display_sequence=>20
,p_name=>'Comments'
,p_condition_type=>'EXISTS'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from table(',
'  apex_string.split (',
'    p_str => :P4_SEARCH_FROM',
'    ,p_sep => '':''',
'  )',
')',
'where column_value = ''COMMENTS'''))
,p_build_option_id=>wwv_flow_imp.id(9183215324713042)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38592376771274324)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38744651530749493)
,p_use_as_initial_result=>false
,p_display_sequence=>30
,p_name=>'Links'
,p_condition_type=>'EXISTS'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from table(',
'  apex_string.split (',
'    p_str => :P4_SEARCH_FROM',
'    ,p_sep => '':''',
'  )',
')',
'where column_value = ''LINKS'''))
,p_build_option_id=>wwv_flow_imp.id(25684767186283357)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38592276819274323)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38726917014540459)
,p_use_as_initial_result=>false
,p_display_sequence=>40
,p_name=>'Files'
,p_condition_type=>'EXISTS'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from table(',
'  apex_string.split (',
'    p_str => :P4_SEARCH_FROM',
'    ,p_sep => '':''',
'  )',
')',
'where column_value = ''FILES'''))
,p_build_option_id=>wwv_flow_imp.id(25684564406281886)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24668903539850539)
,p_name=>'P4_SEARCH_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(38694166324057112)
,p_item_display_point=>'SEARCH_FIELD'
,p_item_default=>'POSTS:COMMENTS:LINKS:FILES'
,p_prompt=>'Search From'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'SEARCH_SOURCE'
,p_lov=>'.'||wwv_flow_imp.id(24721310666439263)||'.'
,p_field_template=>wwv_flow_imp.id(6854610443267413)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24669360219850543)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(38694166324057112)
,p_item_display_point=>'SEARCH_FIELD'
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(6854643778267413)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38592086344274321)
,p_name=>'Process Pagination'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'button.a-SearchResults-pageNav'
,p_bind_type=>'live'
,p_execution_type=>'DEBOUNCE'
,p_execution_time=>400
,p_execution_immediate=>false
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38592141789274322)
,p_event_id=>wwv_flow_imp.id(38592086344274321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Scroll Top'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme42.util.scrollTo("wwvFlowForm");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24669080786850540)
,p_name=>'Search'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_SEARCH_FROM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24669175231850541)
,p_event_id=>wwv_flow_imp.id(24669080786850540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(38694166324057112)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(38321121657727406)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear P4_SEARCH_FROM'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P4_SEARCH_FROM'
,p_required_patch=>wwv_flow_imp.id(27920818779089933)
,p_internal_uid=>38321121657727406
);
wwv_flow_imp.component_end;
end;
/
