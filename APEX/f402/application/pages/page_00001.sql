prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
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
,p_last_upd_yyyymmddhh24miss=>'20220410030418'
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(37646499764287130)
,p_name=>'Posts'
,p_template=>wwv_flow_api.id(8496813422518209)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  count(1)                        as num_posts',
'  ,sum(',
'    case post_status',
'    when ''PUBLISHED''',
'      then 1',
'      else 0',
'    end',
'   )                              as num_published_posts',
'  ,sum(',
'    case post_status',
'    when ''DRAFT''',
'      then 1',
'      else 0',
'    end',
'   )                              as num_draft_posts',
'  ,sum(',
'    case post_status',
'    when ''SCHEDULED''',
'      then 1',
'      else 0',
'    end',
'   )                              as num_scheduled_posts',
'  ,sum(',
'    case when post_status not in( ''PUBLISHED'', ''DRAFT'', ''SCHEDULED'')',
'      then 1',
'      else 0',
'    end',
'   )                              as num_disabled_posts',
'from blog_v_all_posts'))
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
 p_id=>wwv_flow_api.id(37646819872287134)
,p_query_column_id=>1
,p_column_alias=>'NUM_POSTS'
,p_column_display_sequence=>10
,p_column_heading=>'Total'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37646955024287135)
,p_query_column_id=>2
,p_column_alias=>'NUM_PUBLISHED_POSTS'
,p_column_display_sequence=>20
,p_column_heading=>'Published'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37647063298287136)
,p_query_column_id=>3
,p_column_alias=>'NUM_DRAFT_POSTS'
,p_column_display_sequence=>30
,p_column_heading=>'Draft'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37647244028287138)
,p_query_column_id=>4
,p_column_alias=>'NUM_SCHEDULED_POSTS'
,p_column_display_sequence=>60
,p_column_heading=>'Scheduled'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37647322674287139)
,p_query_column_id=>5
,p_column_alias=>'NUM_DISABLED_POSTS'
,p_column_display_sequence=>70
,p_column_heading=>'Disabled'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_api.id(24687280101070827)
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(37647496544287140)
,p_name=>'Comments'
,p_template=>wwv_flow_api.id(8496813422518209)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   sum(comments_count)            as num_comments',
'  ,sum(unread_comments_count)     as num_unread_comments',
'  ,sum(moderate_comments_count)   as num_moderate_comments',
'  ,sum(published_comments_count)  as num_published_comments',
'  ,sum(disabled_comments_count)   as num_disabled_comments',
'from blog_v_all_posts'))
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
 p_id=>wwv_flow_api.id(37647532610287141)
,p_query_column_id=>1
,p_column_alias=>'NUM_COMMENTS'
,p_column_display_sequence=>10
,p_column_heading=>'Total'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20999739862414724)
,p_query_column_id=>2
,p_column_alias=>'NUM_UNREAD_COMMENTS'
,p_column_display_sequence=>30
,p_column_heading=>'Unread'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37648372416287149)
,p_query_column_id=>3
,p_column_alias=>'NUM_MODERATE_COMMENTS'
,p_column_display_sequence=>40
,p_column_heading=>'Need Moderate'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37647916852287145)
,p_query_column_id=>4
,p_column_alias=>'NUM_PUBLISHED_COMMENTS'
,p_column_display_sequence=>20
,p_column_heading=>'Published'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(37648440064287150)
,p_query_column_id=>5
,p_column_alias=>'NUM_DISABLED_COMMENTS'
,p_column_display_sequence=>50
,p_column_heading=>'Disabled'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_api.id(24687280101070827)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145874845182292377)
,p_plug_name=>'Blog Public URLs'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_api.id(8496813422518209)
,p_plug_display_sequence=>50
,p_list_id=>wwv_flow_api.id(43181213072992711)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(8538547318518236)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.component_end;
end;
/
