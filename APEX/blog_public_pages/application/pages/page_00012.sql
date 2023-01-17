prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'About'
,p_alias=>'ABOUT'
,p_step_title=>'About | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(20718112665951240)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_TAB"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(30111637437970455)
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230115182633'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(30430710498753130)
,p_name=>'About Bloggers'
,p_template=>wwv_flow_imp.id(6781372168267375)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   t1.blogger_name  as region_title',
'  ,t1.blogger_desc  as body_html',
'from #OWNER#.blog_v_bloggers t1',
'where 1 = 1',
'order by t1.display_seq'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30641878306098019)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19454440498363524)
,p_query_column_id=>1
,p_column_alias=>'REGION_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Region Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19454526302363525)
,p_query_column_id=>2
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>20
,p_column_heading=>'Body Html'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
