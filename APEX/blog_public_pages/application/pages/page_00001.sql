prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Home | &P0_BLOG_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(148112101994847374)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"BLOG_CANONICAL_LINK_TAB"',
'"BLOG_RSS_LINK"',
'"BLOG_ATOM_LINK"',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_comment=>'Blog home page'
,p_page_component_map=>'03'
,p_last_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(133826029971790194)
,p_name=>'Posts'
,p_region_name=>'page-content-container'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.post_id         as post_id',
'  ,v1.category_id     as category_id',
'  ,v1.published_on    as published_on',
'  ,v1.published_on    as pubdate',
'  ,v1.post_title      as post_title',
'  ,v1.category_title  as category_title',
'  ,v1.first_paragraph as body_html',
'  ,null               as tags_html',
'  ,''Y''                as read_more_link',
'from blog_v_posts v1',
'where 1 = 1',
'order by v1.published_on desc',
''))
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(134288965682197782)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_num_rows_item=>'P1_BLOG_POST_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_updated_on=>wwv_flow_imp.dz('20250414014936Z')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131154879843542246)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Post Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134475697957074565)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Category Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(155387274746503272)
,p_query_column_id=>3
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>12
,p_column_heading=>'Published On'
,p_column_format=>'&P0_BLOG_POST_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138809604635225248)
,p_query_column_id=>4
,p_column_alias=>'PUBDATE'
,p_column_display_sequence=>22
,p_column_heading=>'Pubdate'
,p_column_format=>'YYYY-MM-DD'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131154946510542247)
,p_query_column_id=>5
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>32
,p_column_heading=>'Post Title'
,p_use_as_row_header=>'Y'
,p_column_link=>'f?p=&APP_ID.:POST:&SESSION.::&DEBUG.::P2_POST_ID:#POST_ID#'
,p_column_linktext=>'#POST_TITLE#'
,p_column_link_attr=>'class="u-normal-text"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131155049501542248)
,p_query_column_id=>6
,p_column_alias=>'CATEGORY_TITLE'
,p_column_display_sequence=>42
,p_column_heading=>'Category Title'
,p_use_as_row_header=>'Y'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.::P14_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(155384822884503248)
,p_query_column_id=>7
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>52
,p_column_heading=>'Body Html'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(148104896246791937)
,p_query_column_id=>8
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>62
,p_column_heading=>'Tags Html'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(156457288393053255)
,p_query_column_id=>9
,p_column_alias=>'READ_MORE_LINK'
,p_column_display_sequence=>72
,p_column_heading=>'Read More Link'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_POST_ID:#POST_ID#'
,p_column_linktext=>'&APP_TEXT$BLOG_TXT_READ_MORE.<span aria-hidden="true" class="fa fa-angle-double-right u-alignMiddle margin-left-sm"></span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(151862447653257638)
,p_name=>'P1_BLOG_POST_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Report rows to display per report page'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(153457430899003946)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Posts Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>26063441570107812
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(147541830620223656)
,p_meta_tag_name=>'og:image'
,p_meta_tag_value=>'&APP_FILES.icons/app-icon-512.png'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149915984473042548)
,p_meta_tag_name=>'description'
,p_meta_tag_value=>'&P0_BLOG_APP_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916040969042549)
,p_meta_tag_name=>'og:description'
,p_meta_tag_value=>'&P0_BLOG_APP_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916135840042550)
,p_meta_tag_name=>'og:title'
,p_meta_tag_value=>'Home | &P0_BLOG_APP_NAME.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916672525042555)
,p_meta_tag_name=>'og:type'
,p_meta_tag_value=>'website'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081772354157869)
,p_meta_tag_name=>'og:url'
,p_meta_tag_value=>'&P0_PAGE_URL.'
);
wwv_flow_imp.component_end;
end;
/
