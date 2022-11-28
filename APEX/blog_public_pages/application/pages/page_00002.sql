prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Post and Comments'
,p_alias=>'POST'
,p_step_title=>'&P2_POST_TITLE. | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8697986188142973)
,p_html_page_header=>'"BLOG_CANONICAL_LINK_POST"'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'03'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221128153926'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6915627356677149)
,p_name=>'Comments'
,p_region_name=>'comments'
,p_template=>wwv_flow_imp.id(6802870362267386)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic:t-Comments--iconsRounded:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   null             as actions',
'  ,v1.comment_by    as user_name',
'  ,v1.comment_body  as comment_text',
'  ,v1.created_on    as comment_date',
'  ,v1.user_icon     as user_icon',
'  ,v1.icon_modifier as icon_modifier',
'  ,''z-comment''      as comment_modifiers',
'  ,null             as attribute_1',
'  ,null             as attribute_2',
'  ,null             as attribute_3',
'  ,null             as attribute_4',
'from #OWNER#.blog_v_comments v1',
'where 1 = 1',
'  and v1.post_id = :P2_POST_ID',
'order by v1.created_on desc',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_POST_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6828031165267399)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'&APP_TEXT$BLOG_MSG_NO_COMMENTS.'
,p_query_num_rows_item=>'P2_REPORT_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(7073708623458378)
,p_comment=>'Report to display comments relating current post'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6916242911677156)
,p_query_column_id=>1
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>1
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6915852055677152)
,p_query_column_id=>2
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'User Name'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6916022898677153)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Text'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6916106323677154)
,p_query_column_id=>4
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_APP_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6916229562677155)
,p_query_column_id=>5
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>5
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6915825737677151)
,p_query_column_id=>6
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6915679470677150)
,p_query_column_id=>7
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>7
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030291393368820)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>8
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030345827368821)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>9
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030407450368822)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>10
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4030571277368823)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>11
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9653988616337837)
,p_name=>'Post'
,p_template=>wwv_flow_imp.id(6781372168267375)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:z-posts:z-posts--paginationHidden'
,p_item_display_point=>'BELOW'
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
'  ,v1.body_html       as body_html',
'  ,v1.tags_html2      as tags_html',
'  ,null               as read_more_link',
'  ,v1.txt_posted_on   as txt_posted_on',
'  ,v1.txt_category    as txt_category',
'  ,v1.txt_tags        as txt_tags',
'from #OWNER#.blog_v_posts_apex v1',
'where 1 = 1',
'  and v1.post_id = :P2_POST_ID'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_translate_title=>'N'
,p_query_row_template=>wwv_flow_imp.id(6894976353301648)
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
 p_id=>wwv_flow_imp.id(3762522324646129)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Post Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7081847339178433)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Category Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27993118245607137)
,p_query_column_id=>3
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>12
,p_column_heading=>'Published On'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_POST_TITLE_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11415791287329115)
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
 p_id=>wwv_flow_imp.id(3762641236646130)
,p_query_column_id=>5
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>32
,p_column_heading=>'Post Title'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3762796274646131)
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
 p_id=>wwv_flow_imp.id(27990621426607112)
,p_query_column_id=>7
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>62
,p_column_heading=>'Body Html'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27990703148607113)
,p_query_column_id=>8
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>72
,p_column_heading=>'Tags Html'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(29063187084157120)
,p_query_column_id=>9
,p_column_alias=>'READ_MORE_LINK'
,p_column_display_sequence=>82
,p_column_heading=>'Read More Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11417381405329131)
,p_query_column_id=>10
,p_column_alias=>'TXT_POSTED_ON'
,p_column_display_sequence=>92
,p_column_heading=>'Txt Posted On'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11417417719329132)
,p_query_column_id=>11
,p_column_alias=>'TXT_CATEGORY'
,p_column_display_sequence=>102
,p_column_heading=>'Txt Category'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11417545272329133)
,p_query_column_id=>12
,p_column_alias=>'TXT_TAGS'
,p_column_display_sequence=>112
,p_column_heading=>'Txt Tags'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27860638995256805)
,p_plug_name=>'Other Posts'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'not( :P2_NEXT_POST_ID is null and :P2_PREV_POST_ID is null )'
,p_plug_display_when_cond2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region to hold buttons to paginate next and previous post'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27862487912256823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(27860638995256805)
,p_button_name=>'NEXT_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6855239813267414)
,p_button_image_alt=>'&P2_NEXT_POST_TITLE.'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::P2_POST_ID:&P2_NEXT_POST_ID.'
,p_button_condition=>'P2_NEXT_POST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'z-text-wrap u-pullLeft padding-left-none padding-right-sm'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_row=>'Y'
,p_grid_row_css_classes=>'u-flex-wrap-nowrap padding-sm'
,p_button_comment=>'Go to next post if there is any'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27862537321256824)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(27860638995256805)
,p_button_name=>'PREV_POST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6855239813267414)
,p_button_image_alt=>'&P2_PREV_POST_TITLE.'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::P2_POST_ID:&P2_PREV_POST_ID.'
,p_button_condition=>'P2_PREV_POST_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'z-text-wrap u-pullRight padding-left-sm padding-right-none'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_button_comment=>'Go to previous post if there is any'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3764423093646148)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6915627356677149)
,p_button_name=>'NEW_COMMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6855239813267414)
,p_button_image_alt=>'Post a Comment'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.:1001:P1001_POST_ID:&P2_POST_ID.'
,p_button_css_classes=>'u-bold'
,p_icon_css_classes=>'fa fa-comment-o'
,p_button_comment=>'Open comment modal dialog'
,p_required_patch=>wwv_flow_imp.id(7073708623458378)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6913773263677131)
,p_name=>'P2_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9653988616337837)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Post ID to filter report'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6914099568677134)
,p_name=>'P2_POST_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post title'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22523057039146425)
,p_name=>'P2_POST_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post description'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22523331057146428)
,p_name=>'P2_POST_CATEGORY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post category'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22523456606146429)
,p_name=>'P2_POST_AUTHOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post author'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22523516109146430)
,p_name=>'P2_POST_PUBLISHED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post published on'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22523608232146431)
,p_name=>'P2_POST_MODIFIED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Post modified on'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24468562639361505)
,p_name=>'P2_REPORT_ROWS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Comment report rows to display per report page'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27862178100256820)
,p_name=>'P2_NEXT_POST_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27862251117256821)
,p_name=>'P2_PREV_POST_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31250009146982940)
,p_name=>'P2_SUBSCRIPTION_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31617872589094014)
,p_name=>'P2_NEXT_POST_TITLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31617991042094015)
,p_name=>'P2_PREV_POST_TITLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_imp.id(27921011391085431)
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30121698483676060)
,p_name=>'Set is Current'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_da_event_comment=>'Because latest post list in global page is cached, we set is-current class here'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30122037928676059)
,p_event_id=>wwv_flow_imp.id(30121698483676060)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6913618929677129)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.UI.setListCurrentItem({',
'   affectedElements: this.affectedElements',
'  ,pageItem: "P2_POST_ID"',
'});',
''))
,p_da_action_comment=>'List anchors have data attribute where is post id. If that match item P2_POST_ID value set is-current class to list'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26385314057542646)
,p_name=>'New Comment'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6915627356677149)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_required_patch=>wwv_flow_imp.id(7073708623458378)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26385598142542648)
,p_event_id=>wwv_flow_imp.id(26385314057542646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(this.data.successMessage.text);',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26385449061542647)
,p_event_id=>wwv_flow_imp.id(26385314057542646)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6915627356677149)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27862651784256825)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Post Details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_post_details(',
'   p_post_id        => :P2_POST_ID',
'  ,p_post_title     => :P2_POST_TITLE',
'  ,p_post_desc      => :P2_POST_DESC',
'  ,p_post_category  => :P2_POST_CATEGORY',
'  ,p_post_author    => :P2_POST_AUTHOR',
'  ,p_post_published => :P2_POST_PUBLISHED',
'  ,p_post_modified  => :P2_POST_MODIFIED',
'  ,p_next_id        => :P2_NEXT_POST_ID',
'  ,p_next_title     => :P2_NEXT_POST_TITLE',
'  ,p_prev_id        => :P2_PREV_POST_ID',
'  ,p_prev_title     => :P2_PREV_POST_TITLE',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Post not found.'
,p_process_comment=>'Fetch post details for meta tags and pagination'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26063395480107811)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_RESET_PAGINATION'
,p_process_name=>'Reset Comments Pagination'
,p_attribute_01=>'THIS_PAGE'
,p_process_comment=>'Reset comments report pagination'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(31249019378982930)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Subscription'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_comm.unsubscribe(',
'  p_subscription_id => :P2_SUBSCRIPTION_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P2_SUBSCRIPTION_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'You have now unsubscribed from notifications for this post comments.'
,p_process_comment=>'Remove user subscription from getting notifications of new comments'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22522722454146422)
,p_meta_tag_name=>'og:type'
,p_meta_tag_value=>'article'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22522896166146423)
,p_meta_tag_name=>'og:title'
,p_meta_tag_value=>'&P2_POST_TITLE.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22522990702146424)
,p_meta_tag_name=>'og:site_name'
,p_meta_tag_value=>'&G_APP_NAME.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22523127818146426)
,p_meta_tag_name=>'description'
,p_meta_tag_value=>'&P2_POST_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22523270145146427)
,p_meta_tag_name=>'og:description'
,p_meta_tag_value=>'&P2_POST_DESC.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22523787649146432)
,p_meta_tag_name=>'article:author'
,p_meta_tag_value=>'&P2_POST_AUTHOR.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22523832614146433)
,p_meta_tag_name=>'article:section'
,p_meta_tag_value=>'&P2_POST_CATEGORY.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22523954031146434)
,p_meta_tag_name=>'article:published_time'
,p_meta_tag_value=>'&P2_POST_PUBLISHED.'
);
wwv_flow_imp_page.create_page_meta_tag(
 p_id=>wwv_flow_imp.id(22524014205146435)
,p_meta_tag_name=>'article:modified_time'
,p_meta_tag_value=>'&P2_POST_MODIFIED.'
);
wwv_flow_imp.component_end;
end;
/
