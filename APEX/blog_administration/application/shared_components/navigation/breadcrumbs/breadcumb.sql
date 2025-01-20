prompt --application/shared_components/navigation/breadcrumbs/breadcumb
begin
--   Manifest
--     MENU: Breadcumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(102694851877614068)
,p_name=>'Breadcumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(96911872229614862)
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:30000:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>30000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(102695065088619250)
,p_short_name=>'Posts'
,p_long_name=>'Blog Posts'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(120788431677827253)
,p_option_sequence=>20
,p_short_name=>'Comments'
,p_link=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:::'
,p_page_id=>60
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(102697294469640170)
,p_option_sequence=>30
,p_short_name=>'Links'
,p_long_name=>'Blog Link Collections'
,p_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:::'
,p_page_id=>50
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(102698227236647832)
,p_option_sequence=>40
,p_short_name=>'File Repository'
,p_long_name=>'Blog File Repository'
,p_link=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::'
,p_page_id=>300
,p_required_patch=>-wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(105706834673784371)
,p_option_sequence=>50
,p_short_name=>'Object Storage'
,p_link=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::'
,p_page_id=>300
,p_required_patch=>wwv_flow_imp.id(102874015592702141)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(102700245828666346)
,p_option_sequence=>60
,p_short_name=>'Administration'
,p_long_name=>'Administration and Configuration'
,p_link=>'f?p=&APP_ID.:20010:&SESSION.::&DEBUG.:::'
,p_page_id=>20010
);
wwv_flow_imp.component_end;
end;
/
