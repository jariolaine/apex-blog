prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'Search Result'
,p_alias=>'SEARCH'
,p_step_title=>'Search | &P0_BLOG_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(136091975517039107)
,p_html_page_header=>'"BLOG_META_ROBOTS_NOINDEX"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(166424193210882851)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'26'
,p_last_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(166088155652953246)
,p_plug_name=>'Search from Blog'
,p_region_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ResultsRegion--boxed:margin-bottom-md'
,p_plug_template=>1555738898046108210
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source_type=>'NATIVE_SEARCH_REGION'
,p_ajax_items_to_submit=>'P4_SEARCH,P4_SEARCH_FROM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'custom_layout', 'N',
  'lazy_loading', 'Y',
  'no_query_entered_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span class="nodatafound">',
    '  &APP_TEXT$BLOG_MSG_ENTER_SEARCH_TERM.',
    '</span>')),
  'no_results_found_message', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span class="nodatafound">',
    '  &APP_TEXT$BLOG_MSG_NO_DATA_FOUND.',
    '</span>')),
  'results_per_page_type', 'ITEM',
  'search_as_you_type', 'N',
  'search_item', 'P0_BLOG_SEARCH_ROWS',
  'search_page_item', 'P4_SEARCH',
  'show_result_count', 'N',
  'use_pagination', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(166088647474953248)
,p_region_id=>wwv_flow_imp.id(166088155652953246)
,p_search_config_id=>wwv_flow_imp.id(166087492680942355)
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
,p_build_option_id=>wwv_flow_imp.id(136061722810585314)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(165714708428623536)
,p_region_id=>wwv_flow_imp.id(166088155652953246)
,p_search_config_id=>wwv_flow_imp.id(136573316881166667)
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
,p_build_option_id=>wwv_flow_imp.id(136577204653609176)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(165986366100170458)
,p_region_id=>wwv_flow_imp.id(166088155652953246)
,p_search_config_id=>wwv_flow_imp.id(166138640859645627)
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
,p_build_option_id=>wwv_flow_imp.id(153078756515179491)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(165986266148170457)
,p_region_id=>wwv_flow_imp.id(166088155652953246)
,p_search_config_id=>wwv_flow_imp.id(166120906343436593)
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
,p_build_option_id=>wwv_flow_imp.id(153078553735178020)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(152062892868746673)
,p_name=>'P4_SEARCH_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(166088155652953246)
,p_item_display_point=>'SEARCH_FIELD'
,p_item_default=>'POSTS:COMMENTS:LINKS:FILES'
,p_prompt=>'Search From'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'SEARCH_SOURCE'
,p_lov=>'.'||wwv_flow_imp.id(152115299995335397)||'.'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
,p_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(152063349548746677)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(166088155652953246)
,p_item_display_point=>'SEARCH_FIELD'
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'SEARCH',
  'trim_spaces', 'BOTH')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(165986075673170455)
,p_name=>'Process Pagination'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(166088155652953246)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(165986131118170456)
,p_event_id=>wwv_flow_imp.id(165986075673170455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Scroll Top'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme42.util.scrollTo("wwvFlowForm");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(152063070115746674)
,p_name=>'Search'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_SEARCH_FROM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(152063164560746675)
,p_event_id=>wwv_flow_imp.id(152063070115746674)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(166088155652953246)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
