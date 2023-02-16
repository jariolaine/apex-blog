prompt --application/shared_components/plugins/item_type/fi_jaris_math_question_field
begin
--   Manifest
--     PLUGIN: FI.JARIS.MATH_QUESTION_FIELD
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(68115044491002031)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'FI.JARIS.MATH_QUESTION_FIELD'
,p_display_name=>'Math Question Field'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','FI.JARIS.MATH_QUESTION_FIELD'),'')
,p_api_version=>2
,p_render_function=>'#OWNER#.blog_plugin.render_math_question_field'
,p_ajax_function=>'#OWNER#.blog_plugin.ajax_math_question_field'
,p_validation_function=>'#OWNER#.blog_plugin.validate_math_question_field'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:ELEMENT:WIDTH:PLACEHOLDER:ICON'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(61849465817064829)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Validation Error Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Answer to question isn''t correct.'
,p_is_translatable=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(14501292973487759)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'AJAX Call Error Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Ajax call returned error.'
,p_is_translatable=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(68115749255002032)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>20
,p_prompt=>'First Number min Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(68116207240002032)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>30
,p_prompt=>'First Number max Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'40'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(68116582706002032)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>40
,p_prompt=>'Second Number min Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'1'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(68116999025002033)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>50
,p_prompt=>'Second Number max Value'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'40'
,p_display_length=>10
,p_max_length=>10
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(26783885395659297)
,p_plugin_id=>wwv_flow_imp.id(68115044491002031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>60
,p_prompt=>'Item Hold Correct Answer'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_is_translatable=>false
);
wwv_flow_imp.component_end;
end;
/
