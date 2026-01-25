prompt --application/pages/page_20010
begin
--   Manifest
--     PAGE: 20010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20010
,p_name=>'Administration'
,p_alias=>'ADMINISTRATION'
,p_step_title=>'Administration'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(102692173815582943)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows blogger to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, blogger can potentially change how the application is displayed and/or features available to the end users.</p>'))
,p_page_component_map=>'17'
,p_last_updated_on=>wwv_flow_imp.dz('20250630060126Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(96789109317172240)
,p_plug_name=>'Authentication'
,p_region_sub_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_list_id=>wwv_flow_imp.id(97782102761261998)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_created_on=>wwv_flow_imp.dz('20250120124649Z')
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(96789981500172248)
,p_plug_name=>'Oracle Cloud'
,p_region_sub_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG:margin-bottom-md'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_location=>null
,p_list_id=>wwv_flow_imp.id(98626541698938637)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_translate_title=>'N'
,p_plug_comment=>'List of cloud services'
,p_created_on=>wwv_flow_imp.dz('20250122024500Z')
,p_updated_on=>wwv_flow_imp.dz('20250630060107Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(113265661118639106)
,p_plug_name=>'Artificial Intelligence'
,p_region_sub_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG:margin-bottom-md'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_list_id=>wwv_flow_imp.id(114469191785084578)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_translate_title=>'N'
,p_plug_comment=>'List of cloud services'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(115297437283141422)
,p_plug_name=>'Storage'
,p_region_sub_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG:margin-bottom-md'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_list_id=>wwv_flow_imp.id(117524284844700814)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_translate_title=>'N'
,p_plug_comment=>'List of cloud services'
,p_updated_on=>wwv_flow_imp.dz('20250630060126Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134137683208437141)
,p_plug_name=>'Configuration'
,p_region_sub_css_classes=>'blog-shadow-md'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG:margin-bottom-md'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--large force-fa-lg:t-MediaList--iconsRounded'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>10
,p_location=>null
,p_list_id=>wwv_flow_imp.id(107244848973251914)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>2067994871570597190
,p_translate_title=>'N'
,p_plug_comment=>'Public application configuration'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(134585491353907257)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(102694851877614068)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96789203450172241)
,p_name=>'P20010_GOOGLE_AUTH_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(96789109317172240)
,p_source=>'APP_TEXT$BLOG_TXT_DISABLED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Holding badge value for list'
,p_created_on=>wwv_flow_imp.dz('20250120125400Z')
,p_updated_on=>wwv_flow_imp.dz('20250201041120Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96789359446172242)
,p_name=>'P20010_APEX_AUTH_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(96789109317172240)
,p_source=>'APP_TEXT$BLOG_TXT_DISABLED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Holding badge value for list'
,p_created_on=>wwv_flow_imp.dz('20250120125400Z')
,p_updated_on=>wwv_flow_imp.dz('20250201041120Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100872796773005392)
,p_name=>'P20010_OCI_OS_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(115297437283141422)
,p_source=>'APP_TEXT$BLOG_TXT_DISABLED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Holding badge value for list'
,p_updated_on=>wwv_flow_imp.dz('20250630060126Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(113950256968157915)
,p_name=>'P20010_OCI_LANG_AI_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(113265661118639106)
,p_source=>'APP_TEXT$BLOG_TXT_DISABLED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Holding badge value for list'
,p_updated_on=>wwv_flow_imp.dz('20250201041120Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(115295903874141406)
,p_name=>'P20010_GENERATIVE_AI_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(113265661118639106)
,p_source=>'APP_TEXT$BLOG_TXT_DISABLED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'Holding badge value for list'
,p_updated_on=>wwv_flow_imp.dz('20250201041120Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(100872915647005393)
,p_computation_sequence=>10
,p_computation_item=>'P20010_OCI_OS_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_TEXT$BLOG_TXT_ENABLED'
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
,p_computation_comment=>'If object storage is enabled'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(115295951760141407)
,p_computation_sequence=>20
,p_computation_item=>'P20010_GENERATIVE_AI_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_TEXT$BLOG_TXT_ENABLED'
,p_required_patch=>wwv_flow_imp.id(114745945789071814)
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(113950380398157916)
,p_computation_sequence=>30
,p_computation_item=>'P20010_OCI_LANG_AI_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_TEXT$BLOG_TXT_ENABLED'
,p_required_patch=>wwv_flow_imp.id(113146485644291563)
,p_computation_comment=>'If OCI language AI is enabled'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(96789446659172243)
,p_computation_sequence=>40
,p_computation_item=>'P20010_GOOGLE_AUTH_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_TEXT$BLOG_TXT_ENABLED'
,p_required_patch=>wwv_flow_imp.id(118121315777572996)
,p_computation_comment=>'If Google authentication is enabled'
,p_created_on=>wwv_flow_imp.dz('20250120125400Z')
,p_updated_on=>wwv_flow_imp.dz('20250120125400Z')
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(96789507307172244)
,p_computation_sequence=>50
,p_computation_item=>'P20010_APEX_AUTH_STATUS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_TEXT$BLOG_TXT_ENABLED'
,p_required_patch=>wwv_flow_imp.id(118121075712571408)
,p_computation_comment=>'If APEX authentication is enabled'
,p_created_on=>wwv_flow_imp.dz('20250120125400Z')
,p_updated_on=>wwv_flow_imp.dz('20250120125400Z')
);
wwv_flow_imp.component_end;
end;
/
