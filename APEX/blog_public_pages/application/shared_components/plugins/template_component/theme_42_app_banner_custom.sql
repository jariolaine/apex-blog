prompt --application/shared_components/plugins/template_component/theme_42_app_banner_custom
begin
--   Manifest
--     PLUGIN: THEME_42$APP_BANNER__CUSTOM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(153473518405260342)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$APP_BANNER__CUSTOM'
,p_display_name=>'Application Banner (Custom )'
,p_supported_component_types=>'REGION_ONLY'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$APP_BANNER__CUSTOM'),'')
,p_partial_template=>'<div class="blog-app-banner">#TITLE#</div>'
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_substitute_attributes=>true
,p_version_scn=>41471125207728
,p_subscribe_plugin_settings=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153474099496248465)
,p_plugin_id=>wwv_flow_imp.id(153473518405260342)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'TITLE'
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
