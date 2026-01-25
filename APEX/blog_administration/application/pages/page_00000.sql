prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(91376223235435262)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_last_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(105756857047179004)
,p_plug_name=>'Not Rendered Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_location=>null
,p_translate_title=>'N'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250414014901Z')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(137747872676218117)
,p_plug_name=>'Powered by APEX Blog'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_05'
,p_location=>null
,p_template_component_type=>'REGION_ONLY'
,p_plug_source_type=>'TMPL_THEME_42$FOOTER_LINK__CUSTOM'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'HAS_ICON', 'Y',
  'ICON_CLASS', 'fa-github',
  'LINK', 'https://github.com/jariolaine/apex-blog',
  'LINK_ATTR', 'target="_blank" rel="external"',
  'TEXT', 'Powered By APEX Blog',
  'TITLE', 'Blog application built with Oracle Application Express (APEX)')).to_clob
,p_plug_comment=>'Displays link to blog application source code in GitHub. Do not change!'
,p_updated_on=>wwv_flow_imp.dz('20250414014902Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105756989723179005)
,p_name=>'P0_BLOG_APP_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(105756857047179004)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201041134Z')
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105757036816179006)
,p_name=>'P0_BLOG_APP_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(105756857047179004)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20250201041134Z')
);
wwv_flow_imp.component_end;
end;
/
