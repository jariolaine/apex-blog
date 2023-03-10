prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'&G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8930100593603171)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20230310220052'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8582113239518316)
,p_plug_name=>'&G_APP_DESC.'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--featured t-HeroRegion--centered:t-HeroRegion--hideIcon:t-HeroRegion--iconsCircle'
,p_plug_template=>wwv_flow_imp.id(8492139706518207)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(37646499764287130)
,p_name=>'Posts'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  count( v1.id )        as num_posts',
'  ,sum(',
'    case v1.post_status_code',
'    when ''PUBLISHED''',
'      then 1',
'      else 0',
'    end',
'   )                    as num_published_posts',
'  ,sum(',
'    case v1.post_status_code',
'    when ''DRAFT''',
'      then 1',
'      else 0',
'    end',
'   )                    as num_draft_posts',
'  ,sum(',
'    case v1.post_status_code',
'    when ''SCHEDULED''',
'      then 1',
'      else 0',
'    end',
'   )                    as num_scheduled_posts',
'from #OWNER#.blog_v_all_posts v1',
'where 1 = 1'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8515750866518222)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37646819872287134)
,p_query_column_id=>1
,p_column_alias=>'NUM_POSTS'
,p_column_display_sequence=>10
,p_column_heading=>'Total'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37646955024287135)
,p_query_column_id=>2
,p_column_alias=>'NUM_PUBLISHED_POSTS'
,p_column_display_sequence=>20
,p_column_heading=>'Published'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37647063298287136)
,p_query_column_id=>3
,p_column_alias=>'NUM_DRAFT_POSTS'
,p_column_display_sequence=>30
,p_column_heading=>'Draft'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37647244028287138)
,p_query_column_id=>4
,p_column_alias=>'NUM_SCHEDULED_POSTS'
,p_column_display_sequence=>60
,p_column_heading=>'Scheduled'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(37647496544287140)
,p_name=>'Comments'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   sum( v1.comments_cnt )           as num_comments',
'  ,sum( v1.unread_comments_cnt )    as num_unread_comments',
'  ,sum( v1.moderate_comments_cnt )  as num_moderate_comments',
'  ,sum( v1.published_comments_cnt ) as num_published_comments',
'from #OWNER#.blog_v_all_posts v1',
'where 1 = 1',
''))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8515750866518222)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37647532610287141)
,p_query_column_id=>1
,p_column_alias=>'NUM_COMMENTS'
,p_column_display_sequence=>10
,p_column_heading=>'Total'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20999739862414724)
,p_query_column_id=>2
,p_column_alias=>'NUM_UNREAD_COMMENTS'
,p_column_display_sequence=>30
,p_column_heading=>'Unread'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37648372416287149)
,p_query_column_id=>3
,p_column_alias=>'NUM_MODERATE_COMMENTS'
,p_column_display_sequence=>40
,p_column_heading=>'Not Approved'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(37647916852287145)
,p_query_column_id=>4
,p_column_alias=>'NUM_PUBLISHED_COMMENTS'
,p_column_display_sequence=>20
,p_column_heading=>'Published'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(108235555993675155)
,p_name=>'Activity Last &P1_PERIOD_IN_DAYS. Days'
,p_template=>wwv_flow_imp.id(8490381578518205)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--medium:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--4cols:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   sum( ls.page_views )         as page_views',
'  ,sum( ls.total_rows_queried ) as rows_queried',
'  ,sum( ls.apex_sessions )      as apex_sessions',
'  ,sum( ls.ip_addresses )       as ip_addresses',
'from apex_workspace_log_summary ls',
'where 1 = 1',
'  and ls.application_id = :G_PUB_APP_ID'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8515750866518222)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20240924845665086)
,p_query_column_id=>1
,p_column_alias=>'PAGE_VIEWS'
,p_column_display_sequence=>10
,p_column_heading=>'Page Views'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20241798513665088)
,p_query_column_id=>2
,p_column_alias=>'ROWS_QUERIED'
,p_column_display_sequence=>30
,p_column_heading=>'Rows Queried'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20242109347665088)
,p_query_column_id=>3
,p_column_alias=>'APEX_SESSIONS'
,p_column_display_sequence=>40
,p_column_heading=>'Sessions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17116268743199924)
,p_query_column_id=>4
,p_column_alias=>'IP_ADDRESSES'
,p_column_display_sequence=>50
,p_column_heading=>'IP Addresses'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(145874845182292377)
,p_plug_name=>'Blog Public URLs'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_imp.id(8490381578518205)
,p_plug_display_sequence=>50
,p_list_id=>wwv_flow_imp.id(43181213072992711)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(8538547318518236)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17114949614199911)
,p_name=>'P1_PERIOD_IN_DAYS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(108235555993675155)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17115065731199912)
,p_computation_sequence=>10
,p_computation_item=>'P1_PERIOD_IN_DAYS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select round( ls.period_in_days ) as period_in_days',
'from apex_workspace_log_summary ls',
'where 1 = 1',
'  and ls.application_id = :G_PUB_APP_ID'))
);
wwv_flow_imp.component_end;
end;
/
