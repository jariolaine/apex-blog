prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
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
,p_last_upd_yyyymmddhh24miss=>'20230412172254'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38694166324057112)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#:t-Form--xlarge:t-Form--stretchInputs:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(9260227573556082)
,p_plug_display_sequence=>20
,p_plug_source_type=>'NATIVE_SEARCH_REGION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'P0_SEARCH'
,p_attribute_06=>'N'
,p_attribute_11=>'N'
,p_attribute_13=>'<span class="nodatafound">&APP_TEXT$BLOG_MSG_ENTER_SEARCH_TERM.</span>'
,p_attribute_14=>'15'
,p_attribute_15=>'Y'
,p_attribute_16=>'<span class="nodatafound">&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.</span>'
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38694658146057114)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38693503352046221)
,p_use_as_initial_result=>false
,p_display_sequence=>10
,p_name=>'Posts'
,p_build_option_id=>wwv_flow_imp.id(8667733481689180)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38592276819274323)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38726917014540459)
,p_use_as_initial_result=>false
,p_display_sequence=>20
,p_name=>'Files'
,p_build_option_id=>wwv_flow_imp.id(25684564406281886)
);
wwv_flow_imp_page.create_search_region_source(
 p_id=>wwv_flow_imp.id(38592376771274324)
,p_region_id=>wwv_flow_imp.id(38694166324057112)
,p_search_config_id=>wwv_flow_imp.id(38744651530749493)
,p_use_as_initial_result=>false
,p_display_sequence=>30
,p_name=>'Links'
,p_build_option_id=>wwv_flow_imp.id(25684767186283357)
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
wwv_flow_imp.component_end;
end;
/
