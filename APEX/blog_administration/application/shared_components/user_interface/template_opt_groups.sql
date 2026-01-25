prompt --application/shared_components/user_interface/template_opt_groups
begin
--   Manifest
--     THEME OPTION GROUPS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73933332263827647)
,p_theme_id=>42
,p_name=>'PRESERVE_LABEL_SPACING'
,p_display_name=>'Preserve Label Spacing'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_help_text=>'Preserves the label space and enables use of the Label Column Span property.'
,p_null_text=>'Yes'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192327Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192327Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73937295160827471)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192329Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192329Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73939150720827433)
,p_theme_id=>42
,p_name=>'ICON_STYLE'
,p_display_name=>'Icon Style'
,p_display_sequence=>35
,p_template_types=>'LIST'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192329Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192329Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73942290587827388)
,p_theme_id=>42
,p_name=>'DISPLAY_MODE'
,p_display_name=>'Display Mode'
,p_display_sequence=>30
,p_template_types=>'PAGE'
,p_help_text=>'Determines the default display appearance and positioning of the dialog. The default opens a floating dialog position at the center of the screen.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192330Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192330Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73950520107827295)
,p_theme_id=>42
,p_name=>'DISPLAY_MODE'
,p_display_name=>'Display Mode'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the default display appearance and positioning of the dialog. The default opens a floating dialog position at the center of the screen.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192331Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192331Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73960451217827166)
,p_theme_id=>42
,p_name=>'RESULT_SEPARATOR'
,p_display_name=>'Result Separator'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_null_text=>'Show'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192332Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192332Z')
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(73964305967826978)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
,p_created_on=>wwv_flow_imp.dz('20241124192334Z')
,p_updated_on=>wwv_flow_imp.dz('20241124192334Z')
);
wwv_flow_imp.component_end;
end;
/
