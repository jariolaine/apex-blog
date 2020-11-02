prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(6877050287267426)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:HOME:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(34303351556032323)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_nav_list_template_options=>'#DEFAULT#:t-Tabs--pill'
,p_css_file_urls=>'#WORKSPACE_IMAGES#blog/1.0/css/Style.css?version=#APP_VERSION#'
,p_javascript_file_urls=>'#WORKSPACE_IMAGES#blog/1.0/js/blog.js?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(6876779235267426)
,p_nav_bar_list_template_id=>wwv_flow_api.id(6848359906267410)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_api.component_end;
end;
/
