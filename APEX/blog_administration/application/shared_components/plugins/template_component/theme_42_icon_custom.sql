prompt --application/shared_components/plugins/template_component/theme_42_icon_custom
begin
--   Manifest
--     PLUGIN: THEME_42$ICON_CUSTOM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(112973976899525626)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$ICON_CUSTOM'
,p_display_name=>'Icon (Custom)'
,p_supported_component_types=>'PARTIAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$ICON_CUSTOM'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if ?ICON_CLASSES/}',
'<span{if TEXT_IN_TITLE/} title="#TEXT!ATTR#"{endif/} aria-hidden="true" class="t-Icon fa #ICON_CLASSES!ATTR#"{if ?ICON_ID/} id="#ICON_ID!ATTR#"{endif/}></span>',
'{endif/}',
'{if ?TEXT/}',
'<span class="u-VisuallyHidden">#TEXT!HTML#</span>',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_standard_attributes=>'REGION_TEMPLATE'
,p_substitute_attributes=>true
,p_version_scn=>41484452504505
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112974928011580749)
,p_plugin_id=>wwv_flow_imp.id(112973976899525626)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'TEXT'
,p_prompt=>'Text'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112975391215583189)
,p_plugin_id=>wwv_flow_imp.id(112973976899525626)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'ICON_CLASSES'
,p_prompt=>'Icon Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112976414574608509)
,p_plugin_id=>wwv_flow_imp.id(112973976899525626)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'ICON_ID'
,p_prompt=>'Icon ID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(101873717851012367)
,p_plugin_id=>wwv_flow_imp.id(112973976899525626)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'TEXT_IN_TITLE'
,p_prompt=>'Text in Title Attribute'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Y'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
