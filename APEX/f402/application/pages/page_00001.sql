prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'&G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8930100593603171)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200509094413'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8582113239518316)
,p_plug_name=>'&G_APP_DESC.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--featured t-HeroRegion--centered:t-HeroRegion--hideIcon:t-HeroRegion--iconsCircle'
,p_plug_template=>wwv_flow_api.id(8492139706518207)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11546355289783653)
,p_plug_name=>'Manage Content'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_api.id(8490381578518205)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(9067056365154845)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(8538547318518236)
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(28585539957643014)
,p_name=>'Dashboard'
,p_template=>wwv_flow_api.id(8496813422518209)
,p_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--circular:t-BadgeList--float:t-Report--hideNoPagination'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(',
'    case post_status',
'    when ''PUBLISHED''',
'      then 1',
'      else 0',
'    end',
'   )                    as num_published',
'  ,sum(comments_count)  as num_comments',
'from blog_v_all_posts'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(8515750866518222)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(28586519252643024)
,p_query_column_id=>1
,p_column_alias=>'NUM_PUBLISHED'
,p_column_display_sequence=>1
,p_column_heading=>'Published Posts'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(28586698865643025)
,p_query_column_id=>2
,p_column_alias=>'NUM_COMMENTS'
,p_column_display_sequence=>2
,p_column_heading=>'Comments'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
