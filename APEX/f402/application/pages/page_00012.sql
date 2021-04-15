prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Add/Edit Post'
,p_page_mode=>'MODAL'
,p_step_title=>'Post'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8929534050595858)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'Y'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2>',
'  Create, edit, manage or delete a post',
'</h2>',
'<h3>',
'  Write a new post',
'</h3>',
'<ol>',
'  <li>',
'    Click New Post.',
'  </li>  ',
'  <li>',
'    Create the post. Use editor options to format post. E.g. in "Styles" select list you find block style "Program Code" that is useful when posting code.',
'  </li>',
'  <li>',
'    To save your post without publishing it, click Save Draf. To publish your post, click Publish.',
'  </li>',
'</ol>',
'<h3>',
'  Edit a post',
'</h3>',
'<ol>',
'  <li>',
'    Click edit button on post you want to edit.',
'  </li>',
'  <li>',
'    Make your changes.',
'  </li>',
'  <li>',
'    Click Save.',
'  </li>',
'</ol>',
'<h3>',
'  Delete a post  ',
'</h3>',
'<ol>',
'  <li>',
'    Click edit button on post you want to delete.',
'  </li>',
'  <li>',
'    Click Delete.',
'  </li>',
'</ol>',
''))
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20210415130744'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8640589331194982)
,p_plug_name=>'Post Properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(8475374748518195)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'padding-left-none'
,p_plug_display_column=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_POSTS'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9832631916215218)
,p_plug_name=>'Post Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(8475523710518195)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_grid_column_css_classes=>'padding-right-none'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9832800462215220)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(8476383962518195)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18441525921293012)
,p_plug_name=>'Changes'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--controlsPosEnd:is-expanded:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(8485724502518203)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P12_ID'
,p_required_patch=>wwv_flow_api.id(8935943081653812)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10047145443315819)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19020291458830226)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'CREATE_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Save Draft'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8786300121610764)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publish'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8786578519610764)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(8786489415610764)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'SAVE_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26971334973257341)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'SAVE_AND_PUBLISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publish'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26971643270257344)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'REVERT_TO_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_image_alt=>'Revert to Draft'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-undo'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26971566670257343)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(9832800462215220)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(8549262062518244)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8788275995610767)
,p_branch_name=>'Go To Page 11'
,p_branch_action=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:12::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6929658376150992)
,p_name=>'P12_CATEGORY_TITLE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_category_title(',
'   p_category_id => :P12_CATEGORY_ID',
')'))
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Category'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select title    as return_value',
'  ,title        as display_value',
'  ,case is_active',
'  when 1',
'  then apex_lang.lang(''Enabled'')',
'  else apex_lang.lang(''Disabled'')',
'  end           as status',
'  ,display_seq  as display_seq',
'from #OWNER#.blog_v_all_categories',
'where 1 = 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Categories are case insensitive unique. Example, if you enter "my category" and there is already category "My Category", later will be used as post category. Use search to find existing categories. You can maintain categories information by clicking '
||'Categories tab at Posts page.'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8788602785610768)
,p_name=>'P12_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8791844201610780)
,p_name=>'P12_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8792212310610780)
,p_name=>'P12_BLOGGER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_default=>'G_BLOGGER_ID'
,p_item_default_type=>'ITEM'
,p_source=>'BLOGGER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8792606304610781)
,p_name=>'P12_CATEGORY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_source=>'CATEGORY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8793072773610781)
,p_name=>'P12_PUBLISHED_ON'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Set Date and Time'
,p_format_mask=>'&G_USER_INPUT_DATE_TIME_FORMAT.'
,p_source=>'PUBLISHED_ON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Date when post will be published.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8793863471610782)
,p_name=>'P12_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9832631916215218)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>512
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_css_classes=>'padding-top-none padding-bottom-none'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Describes what your post is about.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8794272529610782)
,p_name=>'P12_POST_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Description'
,p_source=>'POST_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(8548970214518243)
,p_item_css_classes=>'padding-top-none'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Short description of post. Description is used in search results and RSS feed. Whitespaces other than spaces are removed when you save post.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8794675204610782)
,p_name=>'P12_BODY_HTML'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9832631916215218)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Text Editor'
,p_source=>'BODY_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_cSize=>255
,p_cMaxlength=>30000
,p_cHeight=>20
,p_field_template=>wwv_flow_api.id(8548365426518242)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'&APP_TEXT$BLOG_HELP_POST_EDITOR!RAW.'
,p_inline_help_text=>'&APP_TEXT$BLOG_HELP_POST_EDITOR!RAW.'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ( options ) {',
'  options.contentsCss = [ "&APP_IMAGES.css/chkeditor.css" ];',
'  options = blog.admin.editorInit( options );',
'  return options;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'moonocolor'
,p_attribute_05=>'top'
,p_attribute_06=>'4'
,p_attribute_09=>'html'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8795875029610783)
,p_name=>'P12_TAGS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Tags'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_post_tags(',
'  p_post_id => :P12_ID',
')'))
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.tag        as return_value',
'  ,v1.tag        as display_value',
'  ,v1.tag_unique as display_seq',
'  ,case v1.is_active',
'  when 1',
'  then apex_lang.lang(''Enabled'')',
'  else apex_lang.lang(''Disabled'')',
'  end            as status',
'from #OWNER#.blog_v_all_tags v1',
'where 1 = 1',
''))
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Comma separated list of tags. ',
'Tags are case insensitive unique. ',
'Example, if you enter "my tag" and there is already tag "My Tag",',
'later will be used as tag. ',
'Use search to find existing tags. ',
'You can maintain tags information by clicking Tags tab at Posts page.'))
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_11=>','
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18441663346293013)
,p_name=>'P12_CHANGE_NOTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18441525921293012)
,p_prompt=>'Change Notes'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'u-warning'
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_css_classes=>'padding-top-none'
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_required_patch=>wwv_flow_api.id(8935943081653812)
,p_help_text=>'If you edit existing post, you can add comments to version. This attribute is available only after you first time save post.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22957148214076028)
,p_name=>'P12_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>16000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26971911616257347)
,p_name=>'P12_PUBLISHED_DISPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Publish Date'
,p_format_mask=>'&G_USER_INPUT_DATE_TIME_FORMAT.'
,p_source=>'P12_PUBLISHED_ON'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P12_PUBLISHED_ON'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Date when post was/will be published.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26972009805257348)
,p_name=>'P12_SCHEDULE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_prompt=>'Schedule'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(8548656595518243)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Enable editing publsih date.'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31618143669094017)
,p_name=>'P12_FIRST_PARAGRAPH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(8640589331194982)
,p_item_source_plug_id=>wwv_flow_api.id(8640589331194982)
,p_source=>'FIRST_PARAGRAPH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(7077847981172776)
,p_computation_sequence=>30
,p_computation_item=>'P12_POST_DESC'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.remove_whitespace(',
'  p_string => :P12_POST_DESC',
')'))
,p_computation_comment=>'Remove whitespace from description'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(19020963247830233)
,p_computation_sequence=>40
,p_computation_item=>'P12_IS_ACTIVE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.request_to_post_status(',
'  p_request    => :REQUEST',
')'))
,p_required_patch=>wwv_flow_api.id(24687510906079791)
,p_computation_comment=>'When adding now post IS_ACTIVE is defined by button CREATE or CREATE_DRAFT. When updating use visible item P12_IS_ACTIVE_DISPLAY'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(31618253990094018)
,p_computation_sequence=>50
,p_computation_item=>'P12_FIRST_PARAGRAPH'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.get_first_paragraph(',
'  p_body_html  => :P12_BODY_HTML',
')'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36997318502037729)
,p_computation_sequence=>60
,p_computation_item=>'P12_PUBLISHED_ON'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'to_char( localtimestamp, :G_USER_INPUT_DATE_TIME_FORMAT )'
,p_compute_when=>'P12_PUBLISHED_ON'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(8793505538610781)
,p_validation_name=>'P12_VALID_FROM must be timestamp'
,p_validation_sequence=>1
,p_validation=>'P12_PUBLISHED_ON'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(8793072773610781)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(31618338103094019)
,p_validation_name=>'First paragraph'
,p_validation_sequence=>11
,p_validation=>'P12_FIRST_PARAGRAPH'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Post must have at least one paragraph.'
,p_associated_item=>wwv_flow_api.id(8794675204610782)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9834517092215237)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10047145443315819)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9834679844215238)
,p_event_id=>wwv_flow_api.id(9834517092215237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(26972190915257349)
,p_name=>'Process Schedule'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_SCHEDULE'
,p_condition_element=>'P12_SCHEDULE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060832304689109)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8786489415610764)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060333553689104)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30246651951830728)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(19020291458830226)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27061047061689111)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8786489415610764)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30247045311830732)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(26971643270257344)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060210491689103)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_DISPLAY'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30246851694830730)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(19020291458830226)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060769226689108)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8786489415610764)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30247295873830734)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(26971643270257344)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060086137689101)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_DISPLAY'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30246791271830729)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(19020291458830226)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27060911799689110)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(8786489415610764)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30247168256830733)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(26971643270257344)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(26972214574257350)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30246912469830731)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(19020291458830226)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30247330857830735)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(26971643270257344)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(27275922736075438)
,p_event_id=>wwv_flow_api.id(26972190915257349)
,p_event_result=>'FALSE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'&P12_PUBLISHED_ON.'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8801973868610789)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_api.id(8640589331194982)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize Post'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(27060510671689106)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Published on'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P12_PUBLISHED_ON'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P12_IS_ACTIVE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'0'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6929777493150993)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Category'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.add_category(',
'   p_title       => :P12_CATEGORY_TITLE',
'  ,p_category_id => :P12_CATEGORY_ID',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'Add new category if not exists and get category id. If category exists return category id.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19355288927963204)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(8640589331194982)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Post'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7077714087172775)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Tags'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_cm.add_post_tags(',
'   p_post_id => :P12_ID',
'  ,p_tags    => :P12_TAGS',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_comment=>'Add and or remove tags from post. Run only when post is inserted or updated.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(26610837157511893)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Purge Public Application Cache'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.cache_purge_by_page(',
'   p_application => :G_PUB_APP_ID',
'  ,p_page => 0',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
