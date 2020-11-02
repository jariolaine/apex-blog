prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Links'
,p_alias=>'LINKS'
,p_step_title=>'Links | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(6905258727754156)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200909163146'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25312381302124218)
,p_plug_name=>'Links Container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>9
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_caching=>'CACHE'
,p_plug_caching_max_age_in_sec=>31536000
,p_plug_cache_when_cond_type=>'PLSQL_EXPRESSION'
,p_plug_cache_when_condition_e1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'   p_application_id => :APP_ID',
'  ,p_build_option_name => ''BLOG_FEATURE_SEARCH_LINKS''',
') = ''EXCLUDE''',
''))
,p_plug_cache_depends_on_items=>'APP_REQUEST_DATA_HASH'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6899425042645290)
,p_name=>'Links'
,p_parent_plug_id=>wwv_flow_api.id(25312381302124218)
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_region_css_classes=>'z-MediaList'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select row_number() over( partition by t1.title order by t2.display_seq )   as list_seq',
'  ,t1.title                                                                 as list_group',
'  ,t1.display_seq                                                           as group_seq',
'  ,t2.display_seq                                                           as link_seq',
'  ,t2.title                                                                 as list_title',
'  ,case ',
'    when t2.title is null',
'    then apex_lang.message( ''BLOG_MSG_NO_DATA_FOUND'' )-- for translation',
'    else t2.link_desc   ',
'  end                                                                       as list_text',
'  ,case',
'    when t2.title is null',
'    then ''z-noDataFound''',
'  end                                                                       as list_class',
'  ,case',
'    when t2.title is null',
'    then ''z-hidden''',
'    else ''fa fa-external-link''  ',
'  end                                                                       as icon_class',
'  ,case',
'    when t2.title is null',
'    then ''z-hidden''',
'  end                                                                       as icon_color_class',
'  ,t2.link_url                                                              as link',
'  ,''target="_blank"''                                                        as link_attr',
'  ,null                                                                     as link_class',
'from blog_link_groups t1',
'left join blog_links t2',
'  on 1 = 1',
'  and t2.link_group_id = t1.id',
'  and(',
'    t2.is_active = 1 or ',
'    t2.is_active is null ',
'  )',
'  and(',
'    :P10_SEARCH_LINKS is null or(',
'      :P10_SEARCH_LINKS is not null',
'      and(',
'        instr( upper( t2.title ), upper( :P10_SEARCH_LINKS ) ) > 0 or',
'        instr( upper( t2.link_desc ), upper( :P10_SEARCH_LINKS ) ) > 0',
'      )',
'    )',
'  )',
'where 1 = 1',
'and t1.is_active = 1',
'order by case ',
'  when link_seq is not null',
'  then group_seq',
'  end nulls last',
'  ,group_seq',
'  ,link_seq',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10_SEARCH_LINKS'
,p_query_row_template=>wwv_flow_api.id(24781131315835089)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>100
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24870111924464004)
,p_query_column_id=>1
,p_column_alias=>'LIST_SEQ'
,p_column_display_sequence=>1
,p_column_heading=>'List Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24220304259098850)
,p_query_column_id=>2
,p_column_alias=>'LIST_GROUP'
,p_column_display_sequence=>2
,p_column_heading=>'List Group'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24870329966464006)
,p_query_column_id=>3
,p_column_alias=>'GROUP_SEQ'
,p_column_display_sequence=>11
,p_column_heading=>'Group Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24870445554464007)
,p_query_column_id=>4
,p_column_alias=>'LINK_SEQ'
,p_column_display_sequence=>12
,p_column_heading=>'Link Seq'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932489553156637)
,p_query_column_id=>5
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932717290156639)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>4
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933094682156643)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933378544156646)
,p_query_column_id=>8
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933158603156644)
,p_query_column_id=>9
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932917055156641)
,p_query_column_id=>10
,p_column_alias=>'LINK'
,p_column_display_sequence=>5
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933569048156648)
,p_query_column_id=>11
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>9
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932948311156642)
,p_query_column_id=>12
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>8
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25311756072124212)
,p_plug_name=>'Search from Links'
,p_parent_plug_id=>wwv_flow_api.id(25312381302124218)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody:t-Form--large:t-Form--stretchInputs:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(25684767186283357)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25675531094209086)
,p_name=>'P10_SEARCH_LINKS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25311756072124212)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Links Search'
,p_placeholder=>'Search on links...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(6854381477267413)
,p_item_css_classes=>'padding-sm'
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_required_patch=>wwv_flow_api.id(25684767186283357)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25680634479245323)
,p_name=>'Perform Search'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_SEARCH_LINKS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
,p_required_patch=>wwv_flow_api.id(25684767186283357)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25681057447245326)
,p_event_id=>wwv_flow_api.id(25680634479245323)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(6899425042645290)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25681512200245326)
,p_event_id=>wwv_flow_api.id(25680634479245323)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_api.component_end;
end;
/
