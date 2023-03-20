prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(402)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:HOME:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(8450775247518171)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_imp.id(8542581297518238)
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--default:t-TreeNav--styleB'
,p_css_file_urls=>'#APP_FILES#css/admin#MIN#.css'
,p_javascript_file_urls=>'#APP_FILES#js/admin#MIN#.js'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(8570714984518262)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(8542379958518238)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
