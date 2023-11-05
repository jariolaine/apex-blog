prompt --application/shared_components/plugins/template_component/theme_42_icon_custom_1
begin
--   Manifest
--     PLUGIN: THEME_42$ICON_CUSTOM_1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(30527854257693535)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$ICON_CUSTOM_1'
,p_display_name=>'Icon (Custom 1)'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$ICON_CUSTOM_1'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span{if TITLE/} title="#TITLE!ATTR#"{endif/} aria-hidden="true" class="t-Icon fa #ICON_CLASSES!ATTR#"{if ICON_ID/} id="#ICON_ID!ATTR#"{endif/}></span>',
'{if TITLE/}<span class="u-VisuallyHidden">#TITLE!HTML#</span>{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(30528805369748658)
,p_plugin_id=>wwv_flow_imp.id(30527854257693535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'TITLE'
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(30529268573751098)
,p_plugin_id=>wwv_flow_imp.id(30527854257693535)
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
 p_id=>wwv_flow_imp.id(30530291932776418)
,p_plugin_id=>wwv_flow_imp.id(30527854257693535)
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
wwv_flow_imp.component_end;
end;
/
