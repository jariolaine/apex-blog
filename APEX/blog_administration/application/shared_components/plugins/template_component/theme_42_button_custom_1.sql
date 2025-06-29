prompt --application/shared_components/plugins/template_component/theme_42_button_custom_1
begin
--   Manifest
--     PLUGIN: THEME_42$BUTTON_CUSTOM_1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(79580321894736208)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '42')
,p_name=>'THEME_42$BUTTON_CUSTOM_1'
,p_display_name=>'Button (Custom)'
,p_supported_component_types=>'PARTIAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('TEMPLATE COMPONENT','THEME_42$BUTTON_CUSTOM_1'),'')
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button type="button" id="#APEX$DOM_ID#" title="#LABEL!ATTR#"{if ?BUTTON_ACTION/}{if !NO_UPDATE/} data-no-update="true"{endif/}data-action="#BUTTON_ACTION!ATTR#"{endif/}{if ?BUTTON_ATTR/} #BUTTON_ATTR!RAW#{endif/} class="t-Button{if IS_HOT/} t-Button'
||'--hot{endif/}{if IS_ICON_ONLY/} t-Button--noLabel t-Button--icon{else/}{if ?ICON_CLASS/} {if ?ICON_POSITION/}t-Button--iconRight{else/}t-Button--iconLeft{endif/}{endif/}{endif/}{if ?BUTTON_SIZE/} #BUTTON_SIZE!ATTR#{endif/}{if ?BUTTON_STYLE/} #BUTTON_'
||'STYLE!ATTR#{endif/}{if ?BUTTON_TYPE/} #BUTTON_TYPE!ATTR#{endif/}{if ?BUTTON_WIDTH/} #BUTTON_WIDTH!ATTR#{endif/}{if ?CSS_CLASSES/} #CSS_CLASSES!ATTR#{endif/}"{if IS_DISABLED/} disabled{endif/}>',
'  {if ?ICON_POSITION/}<span class="t-Button-label">#LABEL!RAW#</span>{if ?ICON_CLASS/}<span class="t-Icon t-Icon--right fa #ICON_CLASS!ATTR#" aria-hidden="true"></span>{endif/}{else/}{if ?ICON_CLASS/}<span class="t-Icon t-Icon--left fa #ICON_CLASS!AT'
||'TR#" aria-hidden="true"></span>{endif/}<span class="t-Button-label">#LABEL!RAW#</span>{endif/}',
'</button>'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>1
,p_standard_attributes=>'REGION_TEMPLATE'
,p_substitute_attributes=>true
,p_version_scn=>42207590562127
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.4'
,p_updated_on=>wwv_flow_imp.dz('20250612022838Z')
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(79687770710854880)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_title=>'Appearance'
,p_display_sequence=>10
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79580678098736214)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'LABEL'
,p_prompt=>'Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>true
,p_help_text=>'Button label.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79581223604736215)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'BUTTON_ACTION'
,p_prompt=>'Action'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_examples=>'my-action?param1=test'
,p_help_text=>'Button action.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79653698776497923)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'NO_UPDATE'
,p_prompt=>'Update Title and Label'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(79581223604736215)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_help_text=>'If the action label or title are null they will be initialized with the text and title attribute value respectively from the first button (in document order) associated with the action. This is useful if the server has already rendered a localized bu'
||'tton for the action. The title comes from the button title attribute. The label comes from the first found of; aria-label attribute, title attribute if button has class t-Button--noLabel, content of the descendant element with class t-Button-label, a'
||'nd finally the button element content. If disabled is null it will be taken from the button disabled property.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79582706029736216)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'IS_DISABLED'
,p_prompt=>'Is Disabled'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_help_text=>'Is button enabled or disabled.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79615071461069064)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'BUTTON_ATTR'
,p_prompt=>'Custom Attributes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'RAW'
,p_is_translatable=>false
,p_help_text=>'Button custom HTML attributes.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79581671525736216)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'ICON_CLASS'
,p_prompt=>'Icon Class'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_help_text=>'Button icon class.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79582246412736216)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'CSS_CLASSES'
,p_prompt=>'CSS Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_help_text=>'Enter classes to add to this button. You may add multiple classes by separating them with spaces.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79583167871736217)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'IS_HOT'
,p_prompt=>'Is Hot'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_help_text=>'Specify whether to use the <strong>Normal</strong> or <strong>Hot</strong> button template when rendering this button.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79583742003736217)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'IS_ICON_ONLY'
,p_prompt=>'Icon Only'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_help_text=>'Hide button label and show only button icon.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79584171729736217)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'BUTTON_SIZE'
,p_prompt=>'Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_null_text=>'Default'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79584709817736218)
,p_plugin_attribute_id=>wwv_flow_imp.id(79584171729736217)
,p_display_sequence=>10
,p_display_value=>'Tiny'
,p_return_value=>'t-Button--tiny'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79585278911736219)
,p_plugin_attribute_id=>wwv_flow_imp.id(79584171729736217)
,p_display_sequence=>20
,p_display_value=>'Small'
,p_return_value=>'t-Button--small'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79585882729736219)
,p_plugin_attribute_id=>wwv_flow_imp.id(79584171729736217)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'t-Button--large'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79586528453736219)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'BUTTON_STYLE'
,p_prompt=>'Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_null_text=>'Default'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79587027915736220)
,p_plugin_attribute_id=>wwv_flow_imp.id(79586528453736219)
,p_display_sequence=>10
,p_display_value=>'Simple'
,p_return_value=>'t-Button--simple'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79587568180736220)
,p_plugin_attribute_id=>wwv_flow_imp.id(79586528453736219)
,p_display_sequence=>20
,p_display_value=>'Remove UI Decorations'
,p_return_value=>'t-Button--noUI'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79588230439736220)
,p_plugin_attribute_id=>wwv_flow_imp.id(79586528453736219)
,p_display_sequence=>30
,p_display_value=>'Display as Link'
,p_return_value=>'t-Button--link'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79594092381784834)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'BUTTON_TYPE'
,p_prompt=>'Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_null_text=>'Normal'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79594483735787715)
,p_plugin_attribute_id=>wwv_flow_imp.id(79594092381784834)
,p_display_sequence=>10
,p_display_value=>'Primary'
,p_return_value=>'t-Button--primary'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79594957902789979)
,p_plugin_attribute_id=>wwv_flow_imp.id(79594092381784834)
,p_display_sequence=>20
,p_display_value=>'Warning'
,p_return_value=>'t-Button--warning'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79595515121791607)
,p_plugin_attribute_id=>wwv_flow_imp.id(79594092381784834)
,p_display_sequence=>30
,p_display_value=>'Danger'
,p_return_value=>'t-Button--danger'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79596047702793338)
,p_plugin_attribute_id=>wwv_flow_imp.id(79594092381784834)
,p_display_sequence=>40
,p_display_value=>'Success'
,p_return_value=>'t-Button--success'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79597883357814299)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'BUTTON_WIDTH'
,p_prompt=>'Width'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_null_text=>'Auto - Default'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79598290205816372)
,p_plugin_attribute_id=>wwv_flow_imp.id(79597883357814299)
,p_display_sequence=>10
,p_display_value=>'Stretch'
,p_return_value=>'t-Button--stretch'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(79602957495878420)
,p_plugin_id=>wwv_flow_imp.id(79580321894736208)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_static_id=>'ICON_POSITION'
,p_prompt=>'Icon Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(79583742003736217)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_lov_type=>'STATIC'
,p_attribute_group_id=>wwv_flow_imp.id(79687770710854880)
,p_null_text=>'Left'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(79604289321885040)
,p_plugin_attribute_id=>wwv_flow_imp.id(79602957495878420)
,p_display_sequence=>10
,p_display_value=>'Right'
,p_return_value=>'RIGHT'
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
