prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'&G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"BLOG_META_HOME_DESCRIPTION"',
'"BLOG_CANONICAL_LINK_TAB"',
'"BLOG_RSS_LINK"',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220411152539'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6432040642894060)
,p_name=>'Posts'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6781372168267375)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:z-posts:z-posts--paginationBorder'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   v1.post_id         as post_id',
'  ,v1.category_id     as category_id',
'  ,v1.post_title      as post_title',
'  ,v1.category_title  as category_title',
'  ,v1.published_on    as published_on',
'  ,v1.first_paragraph as body_html',
'  ,txt.read_more      as read_more_link',
'  ,null               as tags_html',
'from #OWNER#.blog_v_posts v1',
'cross join(',
'  select',
'    apex_lang.message(''BLOG_TXT_READ_MORE'') as read_more',
'  from dual',
') txt',
'where 1 = 1',
'order by v1.published_on desc',
'',
''))
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(6894976353301648)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_num_rows_item=>'P1_REPORT_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3760890514646112)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7081708628178431)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3760957181646113)
,p_query_column_id=>3
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Post Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:POST:&SESSION.::&DEBUG.::P2_POST_ID:#POST_ID#'
,p_column_linktext=>'#POST_TITLE#'
,p_column_link_attr=>'class="u-normal-text"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3761060172646114)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY_TITLE'
,p_column_display_sequence=>4
,p_column_heading=>'Category Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.::P14_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27993285417607138)
,p_query_column_id=>5
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>5
,p_column_heading=>'Published On'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_POST_TITLE_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27990833555607114)
,p_query_column_id=>6
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(29063299064157121)
,p_query_column_id=>7
,p_column_alias=>'READ_MORE_LINK'
,p_column_display_sequence=>7
,p_column_heading=>'Read More Link'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_POST_ID:#POST_ID#'
,p_column_linktext=>'#READ_MORE_LINK#<span aria-hidden="true" class="fa fa-angle-double-right u-alignMiddle margin-left-sm"></span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20710906917895803)
,p_query_column_id=>8
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24468458324361504)
,p_name=>'P1_REPORT_ROWS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Report rows to display per report page'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26063441570107812)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Posts Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
