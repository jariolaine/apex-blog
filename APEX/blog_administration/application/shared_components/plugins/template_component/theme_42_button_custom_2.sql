prompt --application/shared_components/plugins/template_component/theme_42_button_custom_2
begin
--   Manifest
--     PLUGIN: THEME_42$BUTTON_CUSTOM_2
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
 p_id=>wwv_flow_imp.id(112983441337730746)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$BUTTON_CUSTOM_2'
,p_display_name=>'Button (Custom 2)'
,p_supported_component_types=>'PARTIAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$BUTTON_CUSTOM_2'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button type="button"{if ?BUTTON_ATTR/} #BUTTON_ATTR!RAW#{endif/} class="t-Button{if IS_HOT/} t-Button--hot{endif/}{if IS_ICON_ONLY/} t-Button--noLabel t-Button--icon{else/}{if ?ICON_CLASSES/} t-Button--iconLeft{endif/}{endif/}{if ?SIZE/} #SIZE!ATTR#'
||'{endif/}{if ?STYLE/} #STYLE!ATTR#{endif/}{if ?CSS_CLASSES/} #CSS_CLASSES!ATTR#{endif/}" title="#LABEL!ATTR#"{if IS_DISABLED/} disabled{endif/}>',
'  {if ?ICON_CLASSES/}<span class="t-Icon t-Icon--left fa #ICON_CLASSES!ATTR#" aria-hidden="true"></span>{endif/}<span class="t-Button-label">#LABEL!RAW#</span>',
'</button>',
''))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_standard_attributes=>'REGION_TEMPLATE'
,p_substitute_attributes=>true
,p_version_scn=>41484859039232
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.2'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112986403295758541)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'LABEL'
,p_prompt=>'Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112991995252816955)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'BUTTON_ATTR'
,p_prompt=>'Button Attributes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112984885655742608)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'ICON_CLASSES'
,p_prompt=>'Icon Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112987040246762850)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'CSS_CLASSES'
,p_prompt=>'CSS Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112985390453750660)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'IS_DISABLED'
,p_prompt=>'Is Disabled'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112984063397736872)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'IS_HOT'
,p_prompt=>'Is Hot'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(112984486163740053)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'IS_ICON_ONLY'
,p_prompt=>'Icon Only'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(101471154543272118)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'SIZE'
,p_prompt=>'Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101471744024269164)
,p_plugin_attribute_id=>wwv_flow_imp.id(101471154543272118)
,p_display_sequence=>10
,p_display_value=>'Tiny'
,p_return_value=>'t-Button--tiny'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101472231611268320)
,p_plugin_attribute_id=>wwv_flow_imp.id(101471154543272118)
,p_display_sequence=>20
,p_display_value=>'Small'
,p_return_value=>'t-Button--small'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101472956538266670)
,p_plugin_attribute_id=>wwv_flow_imp.id(101471154543272118)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'t-Button--large'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(101483000998160639)
,p_plugin_id=>wwv_flow_imp.id(112983441337730746)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'STYLE'
,p_prompt=>'Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101483701128156136)
,p_plugin_attribute_id=>wwv_flow_imp.id(101483000998160639)
,p_display_sequence=>10
,p_display_value=>'Simple'
,p_return_value=>'t-Button--simple'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101484123405153408)
,p_plugin_attribute_id=>wwv_flow_imp.id(101483000998160639)
,p_display_sequence=>20
,p_display_value=>'Remove UI Decorations'
,p_return_value=>'t-Button--noUI'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(101484679708151103)
,p_plugin_attribute_id=>wwv_flow_imp.id(101483000998160639)
,p_display_sequence=>30
,p_display_value=>'Display as Link'
,p_return_value=>'t-Button--link'
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
