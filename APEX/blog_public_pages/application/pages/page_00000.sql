prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8700188054171688)
,p_protection_level=>'D'
,p_page_comment=>'The global page'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6433141607894071)
,p_plug_name=>'Not Rendered Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_05'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region to hold items that shouldn''t rendered on page'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6433383599894073)
,p_plug_name=>'Global Column'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781372168267375)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'blog-global-column'
,p_plug_display_column=>10
,p_translate_title=>'N'
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'1001,1002,1003,9999'
,p_landmark_type=>'exclude_landmark'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Application global column holding e.g. search, archives, categories list and latest posts list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6913532952677128)
,p_plug_name=>'Categories'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showBadge'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(6941496811819617)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_required_patch=>wwv_flow_imp.id(8635355820099640)
,p_landmark_type=>'navigation'
,p_plug_comment=>'Post categories link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6913618929677129)
,p_plug_name=>'Latest Posts'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(6945203882938984)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_required_patch=>wwv_flow_imp.id(8677319562925389)
,p_landmark_type=>'navigation'
,p_plug_comment=>'Latest post link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6915495261677148)
,p_plug_name=>'Subscribe in a Reader'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return blog_html.get_rss_anchor(',
'  p_app_name  => :APP_TEXT$BLOG_APP_NAME',
', p_message   => ''BLOG_RSS_TITLE''',
');'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_required_patch=>wwv_flow_imp.id(8635198962090938)
,p_landmark_type=>'navigation'
,p_plug_comment=>'Displays link to RSS feed'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25734481162476838)
,p_plug_name=>'Tags'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(13220237658425595)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(13219456187408808)
,p_required_patch=>wwv_flow_imp.id(13229141933919002)
,p_landmark_type=>'navigation'
,p_plug_comment=>'Post tags link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28587492454643033)
,p_plug_name=>'Archives'
,p_parent_plug_id=>wwv_flow_imp.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-LinksList--showBadge'
,p_plug_template=>wwv_flow_imp.id(6802870362267386)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(30076925956418880)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(6842938924267407)
,p_required_patch=>wwv_flow_imp.id(8670890848739263)
,p_landmark_type=>'navigation'
,p_plug_comment=>'Post archives link list'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39334600992650406)
,p_plug_name=>'Powered by APEX Blog'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="blog-copyright">',
'  <a href="https://github.com/jariolaine/apex-blog" class="blog-copyright-link" target="_blank" rel="external" title="Blog application built with Oracle Application Express (APEX)">Powered By APEX Blog</a>',
'</div>'))
,p_translate_title=>'N'
,p_landmark_type=>'exclude_landmark'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Displays link to blog application source code in GitHub. Do not change!'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39335143698650411)
,p_plug_name=>'Application Banner'
,p_region_css_classes=>'blog-app-banner'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'&APP_TEXT$BLOG_APP_NAME.'
,p_translate_title=>'N'
,p_landmark_type=>'exclude_landmark'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_plug_comment=>'Region to displays blog name.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(40726951471800848)
,p_plug_name=>'Footer Links'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781539027267375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_05'
,p_list_id=>wwv_flow_imp.id(41857893903151708)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(61358318182072659)
,p_translate_title=>'N'
,p_required_patch=>wwv_flow_imp.id(42618909236023987)
,p_plug_comment=>'Footer links to modal dialog pages'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39215190511831947)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_display_point=>'BEFORE_NAVIGATION_BAR'
,p_prompt=>'Search'
,p_placeholder=>'Search ...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_tag_attributes=>'onkeypress="return blog.search({element:this,currentPage:''&APP_PAGE_ID.'',submitIfEnter:event});"'
,p_display_when=>'4'
,p_display_when_type=>'CURRENT_PAGE_NOT_EQUAL_CONDITION'
,p_field_template=>wwv_flow_imp.id(6854381477267413)
,p_item_css_classes=>'mxw340'
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:margin-bottom-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_required_patch=>wwv_flow_imp.id(39030203881986717)
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'SEARCH'
,p_attribute_05=>'BOTH'
,p_item_comment=>'When user press enter on field, page is submitted. Application process "Redirect to search page" handles redirect to search result page.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39994380321374338)
,p_name=>'P0_PAGE_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Page URL. Used in page meta tags. The value is set in the schortcuts.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39994434923374339)
,p_name=>'P0_BLOG_SEARCH_ROWS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Search report rows to display per report page. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47286750134121338)
,p_name=>'P0_BLOG_APP_DATE_FORMAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Date format used e.g. on reports. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47287179638121342)
,p_name=>'P0_BLOG_POST_DATE_FORMAT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_item_comment=>'Post title date format. Used e.g. in posts reports. The value is set in the application process "Initialize Items"'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7052827756664737)
,p_name=>'Scroll Top'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#page-content-container,#comments'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7053194281664738)
,p_event_id=>wwv_flow_imp.id(7052827756664737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.theme42.util.scrollTo( this.triggeringElement.id == "comments" ? this.triggeringElement.id : "wwvFlowForm" );'
);
wwv_flow_imp.component_end;
end;
/
