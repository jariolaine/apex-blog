prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(90997460836350342)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(90915239628350278)
,p_default_dialog_template=>wwv_flow_imp.id(90900296285350269)
,p_error_template=>wwv_flow_imp.id(90901724729350270)
,p_printer_friendly_template=>wwv_flow_imp.id(90915239628350278)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(90901724729350270)
,p_default_button_template=>wwv_flow_imp.id(90995237966350335)
,p_default_region_template=>wwv_flow_imp.id(90942936064350300)
,p_default_chart_template=>wwv_flow_imp.id(90942936064350300)
,p_default_form_template=>wwv_flow_imp.id(90942936064350300)
,p_default_reportr_template=>wwv_flow_imp.id(90942936064350300)
,p_default_tabform_template=>wwv_flow_imp.id(90942936064350300)
,p_default_wizard_template=>wwv_flow_imp.id(90942936064350300)
,p_default_menur_template=>wwv_flow_imp.id(90952353111350306)
,p_default_listr_template=>wwv_flow_imp.id(90942936064350300)
,p_default_irr_template=>wwv_flow_imp.id(90941868795350300)
,p_default_report_template=>wwv_flow_imp.id(90965500862350315)
,p_default_label_template=>wwv_flow_imp.id(90994779237350334)
,p_default_menu_template=>wwv_flow_imp.id(90996108016350335)
,p_default_calendar_template=>wwv_flow_imp.id(90996212536350336)
,p_default_list_template=>wwv_flow_imp.id(90983093197350326)
,p_default_nav_list_template=>wwv_flow_imp.id(90990693740350331)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(90990693740350331)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(90988703939350329)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(90922506604350286)
,p_default_dialogr_template=>wwv_flow_imp.id(90921497390350286)
,p_default_option_label=>wwv_flow_imp.id(90994779237350334)
,p_default_required_label=>wwv_flow_imp.id(90995092856350334)
,p_default_navbar_list_template=>wwv_flow_imp.id(90988502600350329)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/24.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
