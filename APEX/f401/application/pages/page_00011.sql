prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'File Repository'
,p_alias=>'REPOSITORY'
,p_step_title=>'Files | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(24626889314854172)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20210919132659'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25312085512124215)
,p_plug_name=>'Files Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6781372168267375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(25289803667911801)
,p_name=>'File Repository'
,p_parent_plug_id=>wwv_flow_api.id(25312085512124215)
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_region_css_classes=>'z-MediaList--files'
,p_region_sub_css_classes=>'z-border-radius'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody:t-Form--leftLabels'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack:t-MediaList--iconsRounded:t-Report--hideNoPagination'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.file_id    as id',
'  ,v1.file_name      as list_title',
'  ,v1.file_desc      as list_text',
'  ,v1.file_size      as list_badge',
'  ,null              as list_class',
'  ,''fa fa-download''  as icon_class',
'  ,null              as icon_color_class',
'  ,null              as link',
'  ,null              as link_attr',
'  ,null              as link_class',
'from blog_v_files v1',
'where 1 = 1',
'and v1.is_download = 1',
'and (',
'  :P11_FILE_NAME is null or',
'  (',
'    :P11_FILE_NAME is not null and',
'    (',
'      instr( upper( v1.file_name ), upper( :P11_FILE_NAME ) ) > 0 or',
'      instr( upper( v1.file_desc ), upper( :P11_FILE_NAME ) ) > 0',
'    )',
'  )',
')',
'order by v1.file_name'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P11_FILE_NAME'
,p_query_row_template=>wwv_flow_api.id(6815219261267393)
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
 p_id=>wwv_flow_api.id(25290581497911808)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291063513911813)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291104750911814)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291287740911815)
,p_query_column_id=>4
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>4
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_column_format=>'DOWNLOAD:BLOG_FILES:BLOB_CONTENT:ID::MIME_TYPE:FILE_NAME:CHANGED_ON::attachment::'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291432604911817)
,p_query_column_id=>5
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291314972911816)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291621607911819)
,p_query_column_id=>7
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25311259127124207)
,p_query_column_id=>8
,p_column_alias=>'LINK'
,p_column_display_sequence=>8
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25311373391124208)
,p_query_column_id=>9
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>9
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(25291577161911818)
,p_query_column_id=>10
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50989785872352709)
,p_plug_name=>'Search from Files'
,p_parent_plug_id=>wwv_flow_api.id(25312085512124215)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--noPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(25684564406281886)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25678350637228506)
,p_name=>'P11_FILE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50989785872352709)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File Search'
,p_placeholder=>'Search on files...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(6854381477267413)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_required_patch=>wwv_flow_api.id(25684564406281886)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25310969553124204)
,p_name=>'Perform Search'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_FILE_NAME'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
,p_required_patch=>wwv_flow_api.id(25684564406281886)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25311022993124205)
,p_event_id=>wwv_flow_api.id(25310969553124204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(25289803667911801)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25311123159124206)
,p_event_id=>wwv_flow_api.id(25310969553124204)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_api.component_end;
end;
/
