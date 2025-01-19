prompt --application/pages/page_00061
begin
--   Manifest
--     PAGE: 00061
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>61
,p_name=>'View Comment'
,p_alias=>'VIEW-COMMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Comment'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(111116238069743467)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(113267549779639125)
,p_plug_name=>'Comment Sentiment'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(90942936064350300)
,p_plug_display_sequence=>40
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P61_SENTIMENT'
,p_required_patch=>wwv_flow_imp.id(113146485644291563)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(113122722789729936)
,p_name=>'Summary'
,p_parent_plug_id=>wwv_flow_imp.id(113267549779639125)
,p_template=>wwv_flow_imp.id(90942936064350300)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--stacked:t-Region--scrollBody:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--large:t-BadgeList--circular:t-BadgeList--fixed:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.sentiment              as sentiment',
', v1.sentiment_icon         as sentiment_icon',
', v1.sentiment_positive_pct as positive',
', v1.sentiment_neutral_pct  as neutral',
', v1.sentiment_negative_pct as negative',
', v1.sentiment_mixed_pct    as mixed',
'from blog_v_all_comments v1',
'where 1 = 1',
'and v1.id = :P61_ID',
'order by 1'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(90961873508350313)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(113146485644291563)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113122835596729937)
,p_query_column_id=>1
,p_column_alias=>'SENTIMENT'
,p_column_display_sequence=>10
,p_column_heading=>'Sentiment'
,p_use_as_row_header=>'Y'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TEXT:=#SENTIMENT#',
'ICON_CLASSES:=#SENTIMENT_ICON# fa-lg fa-2x',
'{apply THEME$ICON_CUSTOM/}'))
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113122998497729938)
,p_query_column_id=>2
,p_column_alias=>'SENTIMENT_ICON'
,p_column_display_sequence=>20
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113264231238639092)
,p_query_column_id=>3
,p_column_alias=>'POSITIVE'
,p_column_display_sequence=>30
,p_column_heading=>'Positive %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113123313783729941)
,p_query_column_id=>4
,p_column_alias=>'NEUTRAL'
,p_column_display_sequence=>40
,p_column_heading=>'Neutral %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113123180570729940)
,p_query_column_id=>5
,p_column_alias=>'NEGATIVE'
,p_column_display_sequence=>50
,p_column_heading=>'Negative %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113123039945729939)
,p_query_column_id=>6
,p_column_alias=>'MIXED'
,p_column_display_sequence=>60
,p_column_heading=>'Mixed %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(113265798603639107)
,p_name=>'Details'
,p_parent_plug_id=>wwv_flow_imp.id(113267549779639125)
,p_template=>wwv_flow_imp.id(90942936064350300)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--inline:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with qry as(',
'  select',
'    v1.sentiment_json',
'  from blog_v_all_comments v1',
'  where 1 = 1',
'    and v1.id = :P61_ID',
')',
'select ',
'  j.sentiment',
', j.sentence',
', j.mixed * 100     as sentiment_mixed_pct',
', j.negative * 100  as sentiment_negative_pct',
', j.neutral * 100   as sentiment_neutral_pct',
', j.positive * 100  as sentiment_positive_pct',
'from qry,',
'json_table( qry.sentiment_json , ''$.sentences[*]''',
'  columns (',
'    sentence path ''$.text''',
'  , sentence_order number path ''$.offset''',
'  , sentiment path ''$.sentiment''',
'  , mixed number path ''$.scores.Mixed''',
'  , negative number path ''$.scores.Negative''',
'  , neutral number path ''$.scores.Neutral''',
'  , positive number path ''$.scores.Positive''',
'  )',
') j',
'order by j.sentence_order'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(90965500862350315)
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(113146485644291563)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113266875737639118)
,p_query_column_id=>1
,p_column_alias=>'SENTIMENT'
,p_column_display_sequence=>20
,p_column_heading=>'Sentiment'
,p_use_as_row_header=>'Y'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{with/}',
'TEXT:=#SENTIMENT#',
'ICON_CLASSES:=fa-lg {case SENTIMENT/}',
'{when Mixed/}',
'fa-emoji-astonished u-info-text',
'{when Negative/}',
'fa-emoji-angry u-danger-text',
'{when Neutral/}',
'fa-emoji-neutral u-normal-text',
'{when Positive/}',
'fa-emoji-pleased u-success-text',
'{otherwise/}',
'fa-no-icon',
'{endcase/}',
'{apply THEME$ICON_CUSTOM/}'))
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113267624690639126)
,p_query_column_id=>2
,p_column_alias=>'SENTENCE'
,p_column_display_sequence=>10
,p_column_heading=>'Sentence'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113266967084639119)
,p_query_column_id=>3
,p_column_alias=>'SENTIMENT_MIXED_PCT'
,p_column_display_sequence=>60
,p_column_heading=>'Mixed %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113267075180639120)
,p_query_column_id=>4
,p_column_alias=>'SENTIMENT_NEGATIVE_PCT'
,p_column_display_sequence=>50
,p_column_heading=>'Negative %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113267181470639121)
,p_query_column_id=>5
,p_column_alias=>'SENTIMENT_NEUTRAL_PCT'
,p_column_display_sequence=>40
,p_column_heading=>'Neutral %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(113267258626639122)
,p_query_column_id=>6
,p_column_alias=>'SENTIMENT_POSITIVE_PCT'
,p_column_display_sequence=>30
,p_column_heading=>'Positive %'
,p_use_as_row_header=>'N'
,p_column_format=>'990D0'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(158267334687850985)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(166344494349889073)
,p_plug_name=>'Comment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90921646352350286)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_FORM_COMMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(181663971222025093)
,p_name=>'&P61_POST_TITLE.'
,p_template=>wwv_flow_imp.id(90936504220350296)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.comment_by   as user_name',
'  ,v1.body_html   as comment_text',
'  ,v1.created_on  as comment_date',
'  ,''u-hidden''     as icon_modifier',
'  ,''blog-comment'' as comment_modifiers',
'  ,null           as user_icon',
'  ,null           as actions',
'  ,null           as attribute_1',
'  ,null           as attribute_2',
'  ,null           as attribute_3',
'  ,null           as attribute_4',
'from blog_v_all_comments v1',
'where 1 = 1',
'  and v1.id = :P61_ID',
'order by v1.id'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(90968039851350316)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120631926150563882)
,p_query_column_id=>1
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120632398292563883)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120632780634563884)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120633535433563885)
,p_query_column_id=>4
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120633978253563885)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>6
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120633189552563884)
,p_query_column_id=>6
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>4
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120634350296563886)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>16
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120634798757563887)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>26
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120635159298563887)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>36
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120635549780563888)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>46
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(120635958086563888)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>56
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120623280777563870)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120623698002563870)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120624086316563871)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'UNREAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Mark as Unread'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P61_PARENT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-envelope-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120624477067563871)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'DISABLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Disable'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'ENABLED'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-lock'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120624888391563872)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'ENABLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Enable'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'DISABLED'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-unlock'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120625295945563872)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62:P62_ID:\&P61_ID.\'
,p_icon_css_classes=>'fa-pencil'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120622893934563869)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'REPLY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reply'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_comments v1',
'where 1 = 1',
'and v1.parent_id is null',
'and v1.comment_id = :P61_ID'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(120622477485563868)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(158267334687850985)
,p_button_name=>'APPROVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_button_condition=>'P61_COMMENT_STATUS_CODE'
,p_button_condition2=>'MODERATE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'62'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(113264331664639093)
,p_name=>'P61_SENTIMENT'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'SENTIMENT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120625988252563873)
,p_name=>'P61_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120626367712563874)
,p_name=>'P61_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120626759845563875)
,p_name=>'P61_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120627134882563875)
,p_name=>'P61_COMMENT_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'COMMENT_STATUS_CODE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120627543842563876)
,p_name=>'P61_POST_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'POST_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120627935323563876)
,p_name=>'P61_PARENT_ID'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'PARENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(120628373905563877)
,p_name=>'P61_POST_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_item_source_plug_id=>wwv_flow_imp.id(166344494349889073)
,p_source=>'POST_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(120636454861563890)
,p_computation_sequence=>10
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
,p_computation_comment=>'Disable comment.'
,p_compute_when=>'DISABLE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(120636891037563890)
,p_computation_sequence=>20
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_computation_comment=>'Enable comment.'
,p_compute_when=>'ENABLE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(120637226227563891)
,p_computation_sequence=>30
,p_computation_item=>'P61_IS_ACTIVE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_computation_comment=>'Enable comment when approving.'
,p_compute_when=>'APPROVE'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(120640821047563898)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(120623280777563870)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(120641235556563900)
,p_event_id=>wwv_flow_imp.id(120640821047563898)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120637583117563892)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Unflag unread and new'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'UNFLAG_COMMENT'
,p_internal_uid=>38191460475731801
,p_process_comment=>'When view comment remove new and unread flags.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120919241140115593)
,p_page_process_id=>wwv_flow_imp.id(120637583117563892)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120919338633115594)
,p_page_process_id=>wwv_flow_imp.id(120637583117563892)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'NEW:UNREAD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120631260072563881)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(166344494349889073)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Comment'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38185137430731790
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120637933644563892)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Unflag moderate'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'UNFLAG_COMMENT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(120622477485563868)
,p_process_success_message=>'Comment approved.'
,p_internal_uid=>38191811002731801
,p_process_comment=>'Remove moderate flag from comment.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120638450429563894)
,p_page_process_id=>wwv_flow_imp.id(120637933644563892)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120639000050563895)
,p_page_process_id=>wwv_flow_imp.id(120637933644563892)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'MODERATE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120639357090563896)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Flag unread'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_COMM'
,p_attribute_04=>'FLAG_COMMENT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(120624086316563871)
,p_process_success_message=>'Comment marked as unread.'
,p_internal_uid=>38193234448731805
,p_process_comment=>'Set unread flag to comment.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120639912692563896)
,p_page_process_id=>wwv_flow_imp.id(120639357090563896)
,p_page_id=>61
,p_name=>'p_comment_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P61_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(120640344826563897)
,p_page_process_id=>wwv_flow_imp.id(120639357090563896)
,p_page_id=>61
,p_name=>'p_flags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'UNREAD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(121036304293106393)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38590181651274302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120630827649563880)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(166344494349889073)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Comment'
,p_internal_uid=>38184705007731789
);
wwv_flow_imp.component_end;
end;
/
