prompt --application/shared_components/navigation/breadcrumbs/breadcumb
begin
--   Manifest
--     MENU: Breadcumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(20248729235781977)
,p_name=>'Breadcumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20248942446787159)
,p_short_name=>'Posts'
,p_long_name=>'Blog Posts'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(38535375938746116)
,p_short_name=>'Search'
,p_link=>'f?p=&APP_ID.:90:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>90
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(38342309035995162)
,p_option_sequence=>20
,p_short_name=>'Comments'
,p_link=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:::'
,p_page_id=>60
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20251171827808079)
,p_option_sequence=>30
,p_short_name=>'Links'
,p_long_name=>'Blog Links Collection'
,p_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:::'
,p_page_id=>50
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20252104594815741)
,p_option_sequence=>40
,p_short_name=>'Files'
,p_long_name=>'Blog Files Repository'
,p_link=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:::'
,p_page_id=>70
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20254123186834255)
,p_option_sequence=>50
,p_short_name=>'Administration'
,p_long_name=>'Administration and Configuration'
,p_link=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::'
,p_page_id=>20010
);
wwv_flow_imp.component_end;
end;
/
