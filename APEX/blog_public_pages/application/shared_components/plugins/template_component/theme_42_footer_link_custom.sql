prompt --application/shared_components/plugins/template_component/theme_42_footer_link_custom
begin
--   Manifest
--     PLUGIN: THEME_42$FOOTER_LINK__CUSTOM
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(153476070523194689)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$FOOTER_LINK__CUSTOM'
,p_display_name=>'Footer Link (Custom)'
,p_supported_component_types=>'REGION_ONLY'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$FOOTER_LINK__CUSTOM'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="blog-copyright">',
'  <a href="#LINK#" class="blog-copyright-link t-Button t-Button--link{if HAS_ICON/} t-Button--icon t-Button--iconRight{endif/}"{if ?LINK_ATTR/}#LINK_ATTR#{endif/}{if ?TITLE/} title="#TITLE#"{endif/}>',
'    <span class="t-Button-label">#TEXT#</span>{if HAS_ICON/}<span class="t-Icon fa #ICON_CLASS#" aria-hidden="true"></span>{endif/}',
'  </a>',
'</div>'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_substitute_attributes=>true
,p_version_scn=>41471127708164
,p_subscribe_plugin_settings=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153476651869177628)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'LINK'
,p_prompt=>'Link'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153480242438144430)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'LINK_ATTR'
,p_prompt=>'Link Attributes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153477077509176490)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'TITLE'
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153477439503175662)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'TEXT'
,p_prompt=>'Text'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153483158491126107)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'HAS_ICON'
,p_prompt=>'Has Icon'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(153483547576123141)
,p_plugin_id=>wwv_flow_imp.id(153476070523194689)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'ICON_CLASS'
,p_prompt=>'Icon Class'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(153483158491126107)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
