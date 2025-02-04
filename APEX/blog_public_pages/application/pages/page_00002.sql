prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Single Post'
,p_alias=>'POST'
,p_step_title=>'&P2_POST_TITLE. | &P0_BLOG_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(136091975517039107)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_POST"'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(134309616685573283)
,p_name=>'Comments'
,p_region_name=>'comments'
,p_template=>wwv_flow_imp.id(134196859691163520)
,p_display_sequence=>40
,p_region_css_classes=>'blog-shadow-sm'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic:t-Comments--iconsRounded:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.comment_by    as user_name',
'  ,v1.user_icon     as user_icon',
'  ,v1.icon_modifier as icon_modifier',
'  ,v1.comment_body  as comment_text',
'  ,v1.created_on    as comment_date',
'  ,null             as comment_modifiers -- see column HTML Expression',
'  ,null             as actions',
'  ,null             as attribute_1',
'  ,null             as attribute_2',
'  ,null             as attribute_3',
'  ,null             as attribute_4',
'from blog_v_comments v1',
'where 1 = 1',
'  and v1.post_id = :P2_POST_ID',
'order by v1.created_on desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_POST_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(134222020494163533)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_COMMENTS.'
,p_query_num_rows_item=>'P2_BLOG_COMMENT_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(134467697952354512)
,p_comment=>'Report to display comments relating current post'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134309841384573286)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'User Name'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134310218891573289)
,p_query_column_id=>2
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>12
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134309815066573285)
,p_query_column_id=>3
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>22
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134310012227573287)
,p_query_column_id=>4
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>32
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134310095652573288)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>42
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134309668799573284)
,p_query_column_id=>6
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>62
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'blog-comment padding-md'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134310232240573290)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>72
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131424280722264954)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>82
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131424335156264955)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>92
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131424396779264956)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>102
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131424560606264957)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>112
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(137047977945233971)
,p_name=>'Post'
,p_template=>wwv_flow_imp.id(134175361497163509)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:blog-posts--paginationHidden:t-Report--hideNoPagination'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  v1.post_id         as post_id',
', v1.category_id     as category_id',
', v1.published_on    as published_on',
', v1.published_on    as pubdate',
', v1.post_title      as post_title',
', v1.category_title  as category_title',
', v1.body_html       as body_html',
', v1.tags_html2      as tags_html',
', null               as read_more_link',
'from blog_v_posts v1',
'where 1 = 1',
'  and v1.post_id = :P2_POST_ID',
'order by 1'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_translate_title=>'N'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(134288965682197782)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_DATA_FOUND.'
,p_query_row_count_max=>1
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Report to display only one post'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131156511653542263)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Post Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(134475836668074567)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Category Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(155387107574503271)
,p_query_column_id=>3
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>12
,p_column_heading=>'Published On'
,p_use_as_row_header=>'N'
,p_column_format=>'&P0_BLOG_POST_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(138809780616225249)
,p_query_column_id=>4
,p_column_alias=>'PUBDATE'
,p_column_display_sequence=>22
,p_column_heading=>'Pubdate'
,p_use_as_row_header=>'N'
,p_column_format=>'YYYY-MM-DD'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131156630565542264)
,p_query_column_id=>5
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>32
,p_column_heading=>'Post Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(131156785603542265)
,p_query_column_id=>6
,p_column_alias=>'CATEGORY_TITLE'
,p_column_display_sequence=>42
,p_column_heading=>'Category Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.::P14_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(155384610755503246)
,p_query_column_id=>7
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>62
,p_column_heading=>'Body Html'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(155384692477503247)
,p_query_column_id=>8
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>72
,p_column_heading=>'Tags Html'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(156457176413053254)
,p_query_column_id=>9
,p_column_alias=>'READ_MORE_LINK'
,p_column_display_sequence=>82
,p_column_heading=>'Read More Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(155254628324152939)
,p_plug_name=>'Move to Another Post'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(134196859691163520)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'not( :P2_NEXT_POST_ID is null and :P2_PREV_POST_ID is null )'
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(155315000719981565)
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region to hold buttons to paginate next and previous post'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(155256477241152957)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(155254628324152939)
,p_button_name=>'NEXT_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(134249229142163548)
,p_button_image_alt=>'&P2_NEXT_POST_TITLE.'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::P2_POST_ID:&P2_NEXT_POST_ID.'
,p_button_condition=>'P2_NEXT_POST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'blog-text-wrap u-pullLeft padding-left-none padding-right-sm'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_row=>'Y'
,p_grid_row_css_classes=>'u-flex-wrap-nowrap padding-sm'
,p_button_comment=>'Go to next post if there is any'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(155256526650152958)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(155254628324152939)
,p_button_name=>'PREV_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(134249229142163548)
,p_button_image_alt=>'&P2_PREV_POST_TITLE.'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::P2_POST_ID:&P2_PREV_POST_ID.'
,p_button_condition=>'P2_PREV_POST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'blog-text-wrap u-pullRight padding-left-sm padding-right-none'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_button_comment=>'Go to previous post if there is any'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(131158412422542282)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(134309616685573283)
,p_button_name=>'NEW_COMMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(134249229142163548)
,p_button_image_alt=>'Post a Comment'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.:1001:P1001_POST_ID:&P2_POST_ID.'
,p_button_css_classes=>'u-bold'
,p_icon_css_classes=>'fa fa-comment-o'
,p_button_comment=>'Open comment modal dialog'
,p_required_patch=>wwv_flow_imp.id(134467697952354512)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134307762592573265)
,p_name=>'P2_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(137047977945233971)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post ID to filter report'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(134308088897573268)
,p_name=>'P2_POST_TITLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post title'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149917046368042559)
,p_name=>'P2_POST_DESC'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post description'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149917320386042562)
,p_name=>'P2_POST_CATEGORY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post category'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149917445935042563)
,p_name=>'P2_POST_AUTHOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post author'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149917505438042564)
,p_name=>'P2_POST_PUBLISHED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post published on'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149917597561042565)
,p_name=>'P2_POST_MODIFIED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post modified on'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(151862551968257639)
,p_name=>'P2_BLOG_COMMENT_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Comment report rows to display per report page. Value computed on new session using application process "Initialize Items"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(155256167429152954)
,p_name=>'P2_NEXT_POST_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(155256240446152955)
,p_name=>'P2_PREV_POST_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(158643998475879074)
,p_name=>'P2_SUBSCRIPTION_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159011861917990148)
,p_name=>'P2_NEXT_POST_TITLE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(159011980370990149)
,p_name=>'P2_PREV_POST_TITLE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(133827130936790205)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(157515687812572194)
,p_name=>'Set is Current'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_da_event_comment=>'Because latest post list in global page is cached, we set is-current class here'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(157516027257572193)
,p_event_id=>wwv_flow_imp.id(157515687812572194)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(134307608258573263)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.ui.setListCurrentItem({',
'   affectedElements: this.affectedElements',
'  ,pageItem: "P2_POST_ID"',
'});',
''))
,p_da_action_comment=>'List anchors have data attribute where is post id. If that match item P2_POST_ID value set is-current class to list'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(153779303386438780)
,p_name=>'New Comment'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(134309616685573283)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_required_patch=>wwv_flow_imp.id(134467697952354512)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(153779438390438781)
,p_event_id=>wwv_flow_imp.id(153779303386438780)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(134309616685573283)
,p_build_option_id=>-wwv_flow_imp.id(155675266349386026)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(153457384809003945)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset comments pagination'
,p_attribute_01=>'THIS_PAGE'
,p_internal_uid=>26063395480107811
,p_process_comment=>'Reset comments report pagination'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(155256641113152959)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Get post details'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_UTIL'
,p_attribute_04=>'GET_POST_DETAILS'
,p_process_error_message=>'Post not found.'
,p_internal_uid=>27862651784256825
,p_process_comment=>'Fetch post details for meta tags and pagination'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147862778195768936)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P2_POST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147862832510768937)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_title'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P2_POST_TITLE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147862889867768938)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_desc'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P2_POST_DESC'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863024450768939)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_category'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>40
,p_value_type=>'ITEM'
,p_value=>'P2_POST_CATEGORY'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863119714768940)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_author'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'P2_POST_AUTHOR'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863247812768941)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_published'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>60
,p_value_type=>'ITEM'
,p_value=>'P2_POST_PUBLISHED'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863291004768942)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_post_modified'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'P2_POST_MODIFIED'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863400646768943)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_next_post_id'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>80
,p_value_type=>'ITEM'
,p_value=>'P2_NEXT_POST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863522977768944)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_next_post_title'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>90
,p_value_type=>'ITEM'
,p_value=>'P2_NEXT_POST_TITLE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863666574768945)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_prev_post_id'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>100
,p_value_type=>'ITEM'
,p_value=>'P2_PREV_POST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147863777961768946)
,p_page_process_id=>wwv_flow_imp.id(155256641113152959)
,p_page_id=>2
,p_name=>'p_prev_post_title'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>110
,p_value_type=>'ITEM'
,p_value=>'P2_PREV_POST_TITLE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(158643008707879064)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Remove subscription'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'UNSUBSCRIBE'
,p_process_when=>'P2_SUBSCRIPTION_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'You have now unsubscribed from notifications for this post comments.'
,p_internal_uid=>31249019378982930
,p_process_comment=>'Remove user subscription from getting notifications of new comments'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(147862639173768935)
,p_page_process_id=>wwv_flow_imp.id(158643008707879064)
,p_page_id=>2
,p_name=>'p_subscription_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P2_SUBSCRIPTION_ID'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916711783042556)
,p_meta_tag_name=>'og:type'
,p_meta_tag_value=>'article'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916885495042557)
,p_meta_tag_name=>'og:title'
,p_meta_tag_value=>'&P2_POST_TITLE.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149916980031042558)
,p_meta_tag_name=>'og:site_name'
,p_meta_tag_value=>'&P0_BLOG_APP_NAME.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149917117147042560)
,p_meta_tag_name=>'description'
,p_meta_tag_value=>'&P2_POST_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149917259474042561)
,p_meta_tag_name=>'og:description'
,p_meta_tag_value=>'&P2_POST_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149917776978042566)
,p_meta_tag_name=>'article:author'
,p_meta_tag_value=>'&P2_POST_AUTHOR.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149917821943042567)
,p_meta_tag_name=>'article:section'
,p_meta_tag_value=>'&P2_POST_CATEGORY.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149917943360042568)
,p_meta_tag_name=>'article:published_time'
,p_meta_tag_value=>'&P2_POST_PUBLISHED.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(149918003534042569)
,p_meta_tag_name=>'article:modified_time'
,p_meta_tag_value=>'&P2_POST_MODIFIED.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168080765969157859)
,p_meta_tag_name=>'og:image'
,p_meta_tag_value=>'&APP_FILES.icons/app-icon-512.png'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(168081802281157870)
,p_meta_tag_name=>'og:url'
,p_meta_tag_value=>'&P0_PAGE_URL.'
);
wwv_flow_imp.component_end;
end;
/
