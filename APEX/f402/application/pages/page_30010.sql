prompt --application/pages/page_30010
begin
--   Manifest
--     PAGE: 30010
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>30010
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Activity'
,p_alias=>'ACTIVITY'
,p_step_title=>'Activity'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(28670259188910652)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20211121093841'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87799298844348764)
,p_plug_name=>'List of Reports'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_plug_template=>wwv_flow_api.id(8490381578518205)
,p_plug_display_sequence=>20
,p_list_id=>wwv_flow_api.id(43889817309617069)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(8538547318518236)
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(87994934993010091)
,p_name=>'Last 14 Days'
,p_template=>wwv_flow_api.id(8490381578518205)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--fixed:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ls.page_views          as page_views',
'--  ,ls.distinct_pages',
'--  ,ls.total_elapsed_time',
'  ,ls.average_elapsed_time    as average_elapsed_time',
'--  ,ls.minimum_elapsed_time',
'--  ,ls.maximum_elapsed_time',
'  ,ls.total_rows_queried      as rows_queried',
'--  ,ls.ip_addresses',
'--  ,ls.agents',
'  ,ls.apex_sessions           as apex_sessions',
'from apex_workspace_log_summary ls',
'where 1 = 1',
'  and ls.application_id = :G_PUB_APP_ID',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(8515750866518222)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(44527856990111892)
,p_query_column_id=>1
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>10
,p_column_heading=>'Page Views'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(44528246565111893)
,p_query_column_id=>2
,p_column_alias=>'AVERAGE_ELAPSED_TIME'
,p_column_display_sequence=>20
,p_column_heading=>'Avg Elapsed Time'
,p_use_as_row_header=>'N'
,p_column_format=>'999999999999990D000'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(62673667196144801)
,p_query_column_id=>3
,p_column_alias=>'ROWS_QUERIED'
,p_column_display_sequence=>30
,p_column_heading=>'Rows Queried'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(62673850288144803)
,p_query_column_id=>4
,p_column_alias=>'APEX_SESSIONS'
,p_column_display_sequence=>40
,p_column_heading=>'Sessions'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96045849458805228)
,p_plug_name=>'Activity'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>wwv_flow_api.id(8492139706518207)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.component_end;
end;
/
