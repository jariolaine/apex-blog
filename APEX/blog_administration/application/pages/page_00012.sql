prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Add/Edit Post'
,p_alias=>'POST-PROPERTIES'
,p_page_mode=>'MODAL'
,p_step_title=>'Post'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91375656692427949)
,p_javascript_file_urls=>'#APP_FILES#js/showdown/showdown#MIN#.js'
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
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91086711973027073)
,p_plug_name=>'Post Properties'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_FORM_POSTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'COLUMN'
,p_row_version_column=>'ROW_VERSION'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92278754558047309)
,p_plug_name=>'Post Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_grid_column_css_classes=>'padding-right-none'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(115294817459141395)
,p_plug_name=>'Assistant'
,p_parent_plug_id=>wwv_flow_imp.id(92278754558047309)
,p_region_css_classes=>'blog-assistant blog-region-noItemHelp'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(90942936064350300)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'<div id="blog-ai-assistant"></div>'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(115295175750141399)
,p_plug_name=>'AI Assistant Buttons'
,p_parent_plug_id=>wwv_flow_imp.id(115294817459141395)
,p_region_css_classes=>'blog-assistant-buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92278923104047311)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(90922506604350286)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(100887648563125103)
,p_plug_name=>'Changes'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90921497390350286)
,p_plug_display_sequence=>40
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P12_ID'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(145730640846267592)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(115295175750141399)
,p_button_name=>'TALK_TO_ASSISTANT'
,p_button_static_id=>'TALK_TO_ASSISTANT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_image_alt=>'Talk to Assistant'
,p_button_position=>'CHANGE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-microphone'
,p_required_patch=>wwv_flow_imp.id(85903179208625536)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92493268085147910)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995237966350335)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101466414100662317)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'CREATE_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_image_alt=>'Save Draft'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91232422763442855)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'CREATE'
,p_button_static_id=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publish'
,p_button_position=>'CREATE'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91232701161442855)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91232612057442855)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'SAVE_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_image_alt=>'Save Draft'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(109417457615089432)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'SAVE_AND_PUBLISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publish'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(109417765912089435)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'SAVE_REVERT_TO_DRAFT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_image_alt=>'Revert to Draft'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-undo'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(109417689312089434)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(92278923104047311)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(90995384704350335)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P12_IS_ACTIVE'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(115295297023141400)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(115295175750141399)
,p_button_name=>'RESET_CHAT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(90995203660350334)
,p_button_image_alt=>'Reset Chat'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89375781017983083)
,p_name=>'P12_CATEGORY_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Category'
,p_post_element_text=>'"BLOG_BTN_POST_CATEGORY"'
,p_source=>'CATEGORY_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  v1.title                  as return_value',
'  ,v1.title                 as display_value',
'  ,v1.category_status_text  as status',
'  ,v1.display_seq           as display_seq',
'from blog_v_all_categories v1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_css_classes=>'blog-item'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Categories are case insensitive unique. Example, if you enter "my category" and there is already category "My Category", later will be used as post category. Use search to find existing categories. You can maintain categories information by clicking '
||'<em>Categories</em> tab at Posts page.'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91234725427442859)
,p_name=>'P12_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91237966843442871)
,p_name=>'P12_IS_ACTIVE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_source=>'IS_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91238334952442871)
,p_name=>'P12_BLOGGER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_default=>'G_BLOGGER_ID'
,p_item_default_type=>'ITEM'
,p_source=>'BLOGGER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91238728946442872)
,p_name=>'P12_CATEGORY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_source=>'CATEGORY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91239195415442872)
,p_name=>'P12_PUBLISHED_ON'
,p_source_data_type=>'TIMESTAMP_LTZ'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Set Published on'
,p_format_mask=>'&P501_INPUT_DATE_FORMAT.'
,p_source=>'PUBLISHED_ON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Date when post will be published.'
,p_attribute_01=>'Y'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91239986113442873)
,p_name=>'P12_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(92278754558047309)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Title'
,p_post_element_text=>'"BLOG_BTN_POST_TITLE"'
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_css_classes=>'blog-item'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Describes what your post is about.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91240395171442873)
,p_name=>'P12_POST_DESC'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Summary'
,p_post_element_text=>'"BLOG_BTN_POST_DESCRIPTION"'
,p_source=>'POST_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>1024
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_css_classes=>'blog-item blog-postText'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_help_text=>'Short description of post. Description is used in search results and RSS feed. Whitespaces other than spaces are removed when you save post.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91240797846442873)
,p_name=>'P12_BODY_HTML'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(92278754558047309)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Post Editor'
,p_post_element_text=>'"BLOG_BTN_POST_BODY"'
,p_source=>'BODY_HTML'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_imp.id(90995092856350334)
,p_item_css_classes=>'padding-bottom-none blog-item'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock:margin-bottom-none'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Refer online document <a target="_blank" href="https://ckeditor.com/docs/ckeditor5/latest/features/basic-styles.html">Basic Text Styles: Bold, Italic and More</a> how style your post.'
,p_plugin_init_javascript_code=>'blog.admin.editor.init'
,p_attribute_01=>'HTML'
,p_attribute_02=>'FULL'
,p_attribute_03=>'OVERFLOW'
,p_attribute_04=>'320'
,p_attribute_07=>'Y'
,p_attribute_25=>'CKEDITOR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91241997671442874)
,p_name=>'P12_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Tags'
,p_post_element_text=>'"BLOG_BTN_POST_TAGS"'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'POST_TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.tag             as return_value',
'  ,v1.tag             as display_value',
'  ,v1.tag_unique      as display_seq',
'  ,v1.tag_status_text as status',
'from blog_v_all_tags v1'))
,p_cSize=>30
,p_cMaxlength=>32767
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_css_classes=>'blog-item'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--postTextBlock'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Comma separated list of tags. ',
'Tags are case insensitive unique. ',
'Example, if you enter "my tag" and there is already tag "My Tag",',
'later will be used as tag. ',
'Use search to find existing tags. ',
'You can maintain  all tags information by clicking <em>All Tags</em> tab at Posts page. To edit e.g. display sequence of tags linked to post, click <em>Edit Tags</em> button on Posts page report.'))
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100887785988125104)
,p_name=>'P12_CHANGE_NOTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(100887648563125103)
,p_prompt=>'Change Notes'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_required_patch=>wwv_flow_imp.id(91382065723485903)
,p_help_text=>'If you edit existing post, you can add comments to version. This attribute is available only after you first time save post.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105403270855908119)
,p_name=>'P12_NOTES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Notes'
,p_source=>'NOTES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_css_classes=>'blog-item blog-noItemHelp'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_inline_help_text=>'Enter any comments or notes here. These notes not displayed for public.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(106319775507498994)
,p_name=>'P12_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_default=>'G_BLOGGER_ID'
,p_item_default_type=>'ITEM'
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(109418034258089438)
,p_name=>'P12_PUBLISHED_DISPLAY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Published on'
,p_format_mask=>'&P501_DISPLAY_DATE_FORMAT.'
,p_source=>'P12_PUBLISHED_ON'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P12_PUBLISHED_ON'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Date when post was/will be published.'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(109418132447089439)
,p_name=>'P12_SCHEDULE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_prompt=>'Schedule'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(90994779237350334)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_help_text=>'Enable editing publsih date.'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(114064266310926108)
,p_name=>'P12_FIRST_PARAGRAPH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_item_source_plug_id=>wwv_flow_imp.id(91086711973027073)
,p_source=>'FIRST_PARAGRAPH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(100010450788549698)
,p_computation_sequence=>10
,p_computation_item=>'P12_BODY_HTML'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'replace( :P12_BODY_HTML, ''#'', ''&#35;'' )'
,p_computation_comment=>'Replace hashmark to HTML entity for preventing APEX substitutions. This must be run before we compute item P12_FIRST_PARAGRAPH.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(89523970623004867)
,p_computation_sequence=>20
,p_computation_item=>'P12_POST_DESC'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.remove_whitespace(',
'  p_string => :P12_POST_DESC',
')'))
,p_computation_comment=>'Remove whitespace from description.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(119443441143869820)
,p_computation_sequence=>50
,p_computation_item=>'P12_PUBLISHED_ON'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'to_char( localtimestamp, :P501_INPUT_DATE_FORMAT )'
,p_computation_comment=>'Set published on if no schedule set when publishing post.'
,p_compute_when=>'P12_PUBLISHED_ON'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(101467085889662324)
,p_computation_sequence=>60
,p_computation_item=>'P12_IS_ACTIVE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.request_to_post_status(',
'  p_request => :REQUEST',
')'))
,p_computation_comment=>'Compute IS_ACTIVE from button request.'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(114064376631926109)
,p_computation_sequence=>70
,p_computation_item=>'P12_FIRST_PARAGRAPH'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_cm.get_first_paragraph(',
'  p_body_html => :P12_BODY_HTML',
')'))
,p_computation_comment=>'Get first paragraph fro post as preview. Must be run after computation of P12_HTML_BODY.'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(91239628180442872)
,p_validation_name=>'P12_VALID_FROM must be timestamp'
,p_validation_sequence=>10
,p_validation=>'P12_PUBLISHED_ON'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_imp.id(91239195415442872)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(114064460744926110)
,p_validation_name=>'First paragraph'
,p_validation_sequence=>20
,p_validation=>'P12_FIRST_PARAGRAPH'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Post must have at least one paragraph.'
,p_associated_item=>wwv_flow_imp.id(91240797846442873)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92280639734047328)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92493268085147910)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92280802486047329)
,p_event_id=>wwv_flow_imp.id(92280639734047328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(115295348045141401)
,p_name=>'Reset AI Assistant'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(115295297023141400)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(113951830973157931)
,p_event_id=>wwv_flow_imp.id(115295348045141401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Initialize Open AI Assistant'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'  return $.extend( options, {',
'    "view":{',
'      "focus": false',
'    }',
'  });',
'}'))
,p_attribute_01=>'INLINE'
,p_attribute_03=>'#blog-ai-assistant'
,p_attribute_09=>'JAVASCRIPT'
,p_attribute_11=>'blog.admin.ai.post.assistant.useResponse({ text: this });'
,p_ai_remote_server_id=>wwv_flow_imp.id(114707404165421999)
,p_ai_system_prompt=>'&APP_TEXT$BLOG_AI_SYSTEM_PROMPT_POST_ASSISTANT.'
,p_ai_welcome_message=>'&APP_TEXT$BLOG_MSG_AI_ASSISTANT_WELCOME.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(115295543533141403)
,p_event_id=>wwv_flow_imp.id(115295348045141401)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'Set Speech Recognition'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'.a-ChatInput-text'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.speechRecognition.init({',
'  element$: this.affectedElements',
', objectName: "assistant"',
', clearPreviousText: true',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(85796566366386067)
,p_event_id=>wwv_flow_imp.id(115295348045141401)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Show Talk to Assistant Button'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(145730640846267592)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(109418313557089440)
,p_name=>'Process Schedule'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_SCHEDULE'
,p_condition_element=>'P12_SCHEDULE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109506333133521194)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_DISPLAY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109418337216089441)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109506456195521195)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109506208779521192)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_DISPLAY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109506954946521200)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(91232612057442855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109507169703521202)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(91232612057442855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112692774593662819)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(101466414100662317)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112692974336662821)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(101466414100662317)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112693167953662823)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(109417765912089435)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109506891868521199)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(91232612057442855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112693418515662825)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(109417765912089435)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112692913913662820)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(101466414100662317)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109507034441521201)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(91232612057442855)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112693290898662824)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(109417765912089435)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112693035111662822)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(101466414100662317)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112693453499662826)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>100
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(109417765912089435)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109722045377907529)
,p_event_id=>wwv_flow_imp.id(109418313557089440)
,p_event_result=>'FALSE'
,p_action_sequence=>110
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_PUBLISHED_ON'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'&P12_PUBLISHED_ON.'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(113951791221157930)
,p_name=>'Generative AI Buttons'
,p_event_sequence=>110
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(115295061857141398)
,p_event_id=>wwv_flow_imp.id(113951791221157930)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.ai.post.buttonActions();',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(145730740935267593)
,p_name=>'Toggle AI Assistant Speech'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(145730640846267592)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'"webkitSpeechRecognition" in window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(145730907939267594)
,p_event_id=>wwv_flow_imp.id(145730740935267593)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Start / Stop Speech Recognition'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.speechRecognition.toggleRecording({',
'  element: this.triggeringElement',
', objectName: "assistant"',
'});'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(145731094763267596)
,p_event_id=>wwv_flow_imp.id(145730740935267593)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Remove Button'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'this.affectedElements.remove()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(115294887840141396)
,p_name=>'Post Speech Recognition Button'
,p_event_sequence=>120
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'"webkitSpeechRecognition" in window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(115294988865141397)
,p_event_id=>wwv_flow_imp.id(115294887840141396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Set Speech Recognition'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_BODY_HTML'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog.admin.speechRecognition.initButtonAction({',
'  element$: this.affectedElements',
', objectName: "post"',
', action: "record-post"',
', class: [ "u-warning-text" ]',
'});',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(115295661356141404)
,p_event_id=>wwv_flow_imp.id(115294887840141396)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Remove Button'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_BODY_HTML'
,p_attribute_01=>'this.affectedElements.siblings( ".t-Form-itemText--post" ).has( ":button" ).remove();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91248096510442880)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_imp.id(91086711973027073)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize Form Post'
,p_internal_uid=>8801973868610789
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(109506633313521197)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Published on'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P12_PUBLISHED_ON'
,p_process_when=>'P12_IS_ACTIVE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'0'
,p_internal_uid=>27060510671689106
,p_process_comment=>'Clear published on item if post was draft. Then new published on will be set automatically on after submit computation e.g. in case post is published.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89375900134983084)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Process Category'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_CM'
,p_attribute_04=>'ADD_CATEGORY'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_internal_uid=>6929777493150993
,p_process_comment=>'Add new category if not exists and get category id. If category exists return category id. Run only when post is inserted or updated.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115580730636145300)
,p_page_process_id=>wwv_flow_imp.id(89375900134983084)
,p_page_id=>12
,p_name=>'p_category_title'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P12_CATEGORY_TITLE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115580858875145301)
,p_page_process_id=>wwv_flow_imp.id(89375900134983084)
,p_page_id=>12
,p_name=>'p_category_id'
,p_direction=>'OUT'
,p_data_type=>'NUMBER'
,p_ignore_output=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P12_CATEGORY_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(103533215090076713)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(91086711973027073)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Post Properties'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>21087092448244622
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(89523836729004866)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Process Tags'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'BLOG_CM'
,p_attribute_04=>'ADD_POST_TAGS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_internal_uid=>7077714087172775
,p_process_comment=>'Add and or remove tags from post. Run only when post is inserted or updated.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115580946878145302)
,p_page_process_id=>wwv_flow_imp.id(89523836729004866)
,p_page_id=>12
,p_name=>'p_post_id'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P12_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115581100075145303)
,p_page_process_id=>wwv_flow_imp.id(89523836729004866)
,p_page_id=>12
,p_name=>'p_tags'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P12_TAGS'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115581208299145304)
,p_page_process_id=>wwv_flow_imp.id(89523836729004866)
,p_page_id=>12
,p_name=>'p_sep'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(109056959799343984)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Purge Public Application Global Page Cache'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_UTIL'
,p_attribute_04=>'CACHE_PURGE_BY_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>26610837157511893
,p_process_comment=>'Purge public application cached regions.'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115581943894145312)
,p_page_process_id=>wwv_flow_imp.id(109056959799343984)
,p_page_id=>12
,p_name=>'p_application'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'G_PUB_APP_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(115582129440145314)
,p_page_process_id=>wwv_flow_imp.id(109056959799343984)
,p_page_id=>12
,p_name=>'p_page'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'0'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(120922833770115629)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>38476711128283538
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(113950923106157922)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GENERATIVE_AI_CONTENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_ai.gen_ai_chat(',
'  p_post          => :APP_AJAX_X01',
', p_system_prompt => :APP_AJAX_X02',
');'))
,p_process_clob_language=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
,p_internal_uid=>31504800464325831
);
wwv_flow_imp.component_end;
end;
/
