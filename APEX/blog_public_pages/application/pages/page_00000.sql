prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8700188054171688)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'14'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221121081137'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6433141607894071)
,p_plug_name=>'Not Rendered Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_05'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region to hold items that shouldn''t rendered on page'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6433383599894073)
,p_plug_name=>'Global Right Column'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>9999
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>10
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1001,1002,9999'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Application right side column holding e.g. search, archives, categories list and latest posts list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6433488213894074)
,p_plug_name=>'Search from Posts'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_imp.id(8667733481689180)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6913532952677128)
,p_plug_name=>'Categories'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showBadge'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(6941496811819617)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>604800
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_required_patch=>wwv_flow_imp.id(8635355820099640)
,p_plug_comment=>'Categories link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6913618929677129)
,p_plug_name=>'Latest Posts'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(6945203882938984)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>604800
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_required_patch=>wwv_flow_imp.id(8677319562925389)
,p_plug_comment=>'Latest post link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6915495261677148)
,p_plug_name=>'Subscribe in a Reader'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'"BLOG_RSS_ANCHOR"'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>604800
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_required_patch=>wwv_flow_imp.id(8635198962090938)
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Holds "Subscribe in a Reader" button shortcut'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25734481162476838)
,p_plug_name=>'Tags'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(13220237658425595)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(13219456187408808)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>604800
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_required_patch=>wwv_flow_imp.id(13229141933919002)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28587492454643033)
,p_plug_name=>'Archives'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showBadge'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(30076925956418880)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>604800
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_required_patch=>wwv_flow_imp.id(8670890848739263)
,p_plug_comment=>'Archives link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(40726951471800848)
,p_plug_name=>'Modal Page Links'
,p_region_css_classes=>'margin-md'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_imp.id(41857893903151708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(61358318182072659)
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1001,1002,9999'
,p_plug_footer=>'"BLOG_POWERED_BY"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6433577571894075)
,p_name=>'P0_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6433488213894074)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(6854381477267413)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_required_patch=>wwv_flow_imp.id(8667733481689180)
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7052827756664737)
,p_name=>'Scroll Top'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#page-content-container,#comments'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7053194281664738)
,p_event_id=>wwv_flow_imp.id(7052827756664737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme42.util.scrollTo( this.triggeringElement.id == "comments" ? this.triggeringElement.id : "wwvFlowForm" );'
);
wwv_flow_imp.component_end;
end;
/
