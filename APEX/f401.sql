prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
end;
/
 
prompt APPLICATION 401 - Blog Public Pages
--
-- Application Export:
--   Application:     401
--   Name:            Blog Public Pages
--   Exported By:     BLOG_040000
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     11
--       Items:                   20
--       Computations:             4
--       Validations:              1
--       Processes:                1
--       Regions:                 20
--       Buttons:                  3
--       Dynamic Actions:          3
--     Shared Components:
--       Logic:
--         Items:                  8
--         Processes:              2
--         Computations:           1
--         Build Options:         11
--       Navigation:
--         Lists:                  4
--       Security:
--         Authentication:         2
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                 9
--           Region:              16
--           Label:                7
--           List:                12
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              12
--         LOVs:                   2
--         Shortcuts:             11
--         Plug-ins:               3
--       Globalization:
--         Messages:               7
--       Reports:
--       E-Mail:
--     Supporting Objects:  Excluded
--   Version:         19.2.0.00.18
--   Instance ID:     9502710254078678
--

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'BLOG_040000')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Blog Public Pages')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BLOG_040000')
,p_application_group=>3742713376965422
,p_application_group_name=>'BLOG_040000'
,p_application_group_comment=>'APEX Blog '
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'A62184636C79274387CBB6C9840762CA531D62DEA8CD2BD8BA55E607E36A7AF2'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'19.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2019.04.21.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(23563845949734140)
,p_application_tab_set=>1
,p_logo_type=>'C'
,p_logo=>'<span class="z-app-logo">&G_APP_NAME.<q>&G_APP_DESC.</q></span>'
,p_app_builder_icon_name=>'app-icon.svg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'DD.MM.YYYY'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'#OWNER#.blog_err.apex_error_handler'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408184150'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>64
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6756817335267362)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6887418881267440)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:HOME:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-home'
,p_list_text_10=>'HOME'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6898961639645288)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Links'
,p_list_item_link_target=>'f?p=&APP_ID.:LINKS:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-link'
,p_list_text_10=>'LINKS'
,p_required_patch=>wwv_flow_api.id(6905258727754156)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7123115257892322)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Files'
,p_list_item_link_target=>'f?p=&APP_ID.:FILES:&SESSION.::&DEBUG.:RIR:::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_10=>'FILES'
,p_required_patch=>wwv_flow_api.id(24626889314854172)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7123379023897277)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'About'
,p_list_item_link_target=>'f?p=&APP_ID.:ABOUT:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_text_10=>'ABOUT'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6876779235267426)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8590719729560000)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Info'
,p_list_item_icon=>'fa-question-circle-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6892786786267448)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6893288762267448)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(6892786786267448)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(6893638948267449)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(6892786786267448)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/posts_categories
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6941496811819617)
,p_name=>'Posts Categories'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ result_cache */',
'   null              as link_level',
'  ,v1.category_title as link_text',
'  ,v1.category_url   as target_url',
'  ,case when :APP_PAGE_ID = 4 and :P4_CATEGORY_ID = v1.category_id',
'     then ''YES''',
'     else ''NO''',
'   end as is_current',
'from #OWNER#.blog_v_categories v1',
'where 1 = 1',
'order by v1.display_seq'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8635355820099640)
);
end;
/
prompt --application/shared_components/navigation/lists/latest_posts
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6945203882938984)
,p_name=>'Latest Posts'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ result_cache */',
'  null      as link_level',
'  ,v1.post_title as link_text',
'  ,v1.post_url   as target_url',
'  ,case when :APP_PAGE_ID = 2 and :P2_POST_ID = v1.post_id',
'     then''YES''',
'     else ''NO''',
'   end as is_current',
'from #OWNER#.blog_v_posts_last05 v1',
'order by v1.display_seq'))
,p_list_status=>'PUBLIC'
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20233330394644423B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(7065982260399982)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B222076696577426F783D223020302036342036';
wwv_flow_api.g_varchar2_table(2) := '34223E3C646566733E3C7374796C653E2E636C732D317B66696C6C3A75726C282372616469616C2D6772616469656E74293B7D2E636C732D322C2E636C732D332C2E636C732D347B66696C6C3A236666663B7D2E636C732D337B6F7061636974793A302E';
wwv_flow_api.g_varchar2_table(3) := '343B7D2E636C732D347B6F7061636974793A302E363B7D2E636C732D357B6F7061636974793A302E313B7D3C2F7374796C653E3C72616469616C4772616469656E742069643D2272616469616C2D6772616469656E74222063783D223332222063793D22';
wwv_flow_api.g_varchar2_table(4) := '2E30352220723D22363422206772616469656E74556E6974733D227573657253706163654F6E557365223E3C73746F70206F66667365743D2230222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D22302E3135222F3E3C';
wwv_flow_api.g_varchar2_table(5) := '73746F70206F66667365743D222E35222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D22302E31222F3E3C73746F70206F66667365743D2231222073746F702D636F6C6F723D2223666666222073746F702D6F70616369';
wwv_flow_api.g_varchar2_table(6) := '74793D2230222F3E3C2F72616469616C4772616469656E743E3C73796D626F6C2069643D22616D6269656E742D6C69676874696E67222076696577426F783D22302030203634203634223E3C7061746820636C6173733D22636C732D312220643D224D30';
wwv_flow_api.g_varchar2_table(7) := '2030683634763634682D36347A222F3E3C2F73796D626F6C3E3C2F646566733E3C7469746C653E63756265733C2F7469746C653E3C726563742077696474683D22363422206865696768743D223634222066696C6C3D2223333039464442222F3E3C6720';
wwv_flow_api.g_varchar2_table(8) := '69643D2269636F6E73223E3C7061746820636C6173733D22636C732D322220643D224D33322032346C2D382D3420382D34203820342D3820347A222F3E3C7061746820636C6173733D22636C732D332220643D224D33322032347631306C382D34762D31';
wwv_flow_api.g_varchar2_table(9) := '306C2D3820347A222F3E3C7061746820636C6173733D22636C732D342220643D224D33322032347631306C2D382D34762D31306C3820347A222F3E3C7061746820636C6173733D22636C732D322220643D224D32342033386C2D382D3420382D34203820';
wwv_flow_api.g_varchar2_table(10) := '342D3820347A222F3E3C7061746820636C6173733D22636C732D332220643D224D32342033387631306C382D34762D31306C2D3820347A222F3E3C7061746820636C6173733D22636C732D342220643D224D32342033387631306C2D382D34762D31306C';
wwv_flow_api.g_varchar2_table(11) := '3820347A222F3E3C7061746820636C6173733D22636C732D322220643D224D34302033386C2D382D3420382D34203820342D3820347A222F3E3C7061746820636C6173733D22636C732D332220643D224D34302033387631306C382D34762D31306C2D38';
wwv_flow_api.g_varchar2_table(12) := '20347A222F3E3C7061746820636C6173733D22636C732D342220643D224D34302033387631306C2D382D34762D31306C3820347A222F3E3C7061746820636C6173733D22636C732D352220643D224D33322034346C2D3820342D382D3476316C38203420';
wwv_flow_api.g_varchar2_table(13) := '382D342038203420382D34762D316C2D3820342D382D347A222F3E3C2F673E3C7573652077696474683D22363422206865696768743D2236342220786C696E6B3A687265663D2223616D6269656E742D6C69676874696E67222069643D226C6967687469';
wwv_flow_api.g_varchar2_table(14) := '6E67222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(7066277841401608)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/blog_js
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '202F2A2A0A202A20406E616D65737061636520626C6F670A202A2A2F0A2076617220626C6F67203D20626C6F67207C7C207B7D3B0A0A2866756E6374696F6E28242C20626C6F6729207B0A0A092F2A0A09202A206A517565727920706C7567696E3A2066';
wwv_flow_api.g_varchar2_table(2) := '69656C6453656C656374696F6E202D2076312E302E30202D206C617374206368616E67653A20323031372F31322F30350A09202A205375737461696E6564206279204E696B6F6C6173204C65697465202D2068747470733A2F2F6769746875622E636F6D';
wwv_flow_api.g_varchar2_table(3) := '2F6E696B6F6C61736D61676E6F0A09202A205374617274656420627920286329203230303620416C6578204272656D203C616C657840307861622E63643E202D20687474703A2F2F626C6F672E307861622E63640A09202A2F0A09766172206669656C64';
wwv_flow_api.g_varchar2_table(4) := '53656C656374696F6E203D207B0A0A090967657453656C656374696F6E3A2066756E6374696F6E2829207B0A0A0909097661722065203D2028746869732E6A717565727929203F20746869735B305D203A20746869733B0A0A09090972657475726E2028';
wwv_flow_api.g_varchar2_table(5) := '0A0A090909092F2A206D6F7A696C6C61202F20646F6D20332E30202A2F0A09090909282773656C656374696F6E53746172742720696E20652026262066756E6374696F6E2829207B0A0909090909766172206C203D20652E73656C656374696F6E456E64';
wwv_flow_api.g_varchar2_table(6) := '202D20652E73656C656374696F6E53746172743B0A090909090972657475726E207B2073746172743A20652E73656C656374696F6E53746172742C20656E643A20652E73656C656374696F6E456E642C206C656E6774683A206C2C20746578743A20652E';
wwv_flow_api.g_varchar2_table(7) := '76616C75652E73756273747228652E73656C656374696F6E53746172742C206C29207D3B0A090909097D29207C7C0A0A090909092F2A206578706C6F646572202A2F0A0909090928646F63756D656E742E73656C656374696F6E2026262066756E637469';
wwv_flow_api.g_varchar2_table(8) := '6F6E2829207B0A0A0909090909652E666F63757328293B0A0A09090909097661722072203D20646F63756D656E742E73656C656374696F6E2E63726561746552616E676528293B0A09090909096966202872203D3D3D206E756C6C29207B0A0909090909';
wwv_flow_api.g_varchar2_table(9) := '0972657475726E207B2073746172743A20302C20656E643A20652E76616C75652E6C656E6774682C206C656E6774683A2030207D0A09090909097D0A0A0909090909766172207265203D20652E6372656174655465787452616E676528293B0A09090909';
wwv_flow_api.g_varchar2_table(10) := '09766172207263203D2072652E6475706C696361746528293B0A090909090972652E6D6F7665546F426F6F6B6D61726B28722E676574426F6F6B6D61726B2829293B0A090909090972632E736574456E64506F696E742827456E64546F5374617274272C';
wwv_flow_api.g_varchar2_table(11) := '207265293B0A0A090909090972657475726E207B2073746172743A2072632E746578742E6C656E6774682C20656E643A2072632E746578742E6C656E677468202B20722E746578742E6C656E6774682C206C656E6774683A20722E746578742E6C656E67';
wwv_flow_api.g_varchar2_table(12) := '74682C20746578743A20722E74657874207D3B0A090909097D29207C7C0A0A090909092F2A2062726F77736572206E6F7420737570706F72746564202A2F0A0909090966756E6374696F6E2829207B2072657475726E206E756C6C3B207D0A0A09090929';
wwv_flow_api.g_varchar2_table(13) := '28293B0A0A09097D2C0A0A09097265706C61636553656C656374696F6E3A2066756E6374696F6E2829207B0A0A0909097661722065203D2028746869732E6A717565727929203F20746869735B305D203A20746869733B0A090909766172207465787420';
wwv_flow_api.g_varchar2_table(14) := '3D20617267756D656E74735B305D207C7C2027273B0A0A09090972657475726E20280A0A090909092F2A206D6F7A696C6C61202F20646F6D20332E30202A2F0A09090909282773656C656374696F6E53746172742720696E20652026262066756E637469';
wwv_flow_api.g_varchar2_table(15) := '6F6E2829207B0A0909090909652E76616C7565203D20652E76616C75652E73756273747228302C20652E73656C656374696F6E537461727429202B2074657874202B20652E76616C75652E73756273747228652E73656C656374696F6E456E642C20652E';
wwv_flow_api.g_varchar2_table(16) := '76616C75652E6C656E677468293B0A090909090972657475726E20746869733B0A090909097D29207C7C0A0A090909092F2A206578706C6F646572202A2F0A0909090928646F63756D656E742E73656C656374696F6E2026262066756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(17) := '207B0A0909090909652E666F63757328293B0A0909090909646F63756D656E742E73656C656374696F6E2E63726561746552616E676528292E74657874203D20746578743B0A090909090972657475726E20746869733B0A090909097D29207C7C0A0A09';
wwv_flow_api.g_varchar2_table(18) := '0909092F2A2062726F77736572206E6F7420737570706F72746564202A2F0A0909090966756E6374696F6E2829207B0A0909090909652E76616C7565202B3D20746578743B0A090909090972657475726E20242865293B0A090909097D0A0A0909092928';
wwv_flow_api.g_varchar2_table(19) := '293B0A0A09097D0A0A097D3B0A0A09242E65616368286669656C6453656C656374696F6E2C2066756E6374696F6E286929207B20242E666E5B695D203D20746869733B207D293B0A0A092F2A2A0A092A20406D6F64756C6520626C6F672E55490A092A2A';
wwv_flow_api.g_varchar2_table(20) := '2F0A09626C6F672E5549203D207B0A0A0920202F2A2A0A0920202A204066756E6374696F6E20666F726D617450726F6772616D436F64650A09092A204076657273696F6E20310A0920202A20406578616D706C6520626C6F672E55492E666F726D617450';
wwv_flow_api.g_varchar2_table(21) := '726F6772616D436F646528227072652E70726F6772616D2D636F646522293B0A0920202A2A2F0A092020666F726D617450726F6772616D436F64653A2066756E6374696F6E2820705F73656C6563746F7220297B0A09202020207661722024456C656D20';
wwv_flow_api.g_varchar2_table(22) := '3D20617065782E6A51756572792820705F73656C6563746F7220293B0A0A092020202024456C656D2E68746D6C202866756E6374696F6E2820696E642C206F6C6448544D4C20297B0A0A09202020202020766172206C726F7773203D205B5D3B0A092020';
wwv_flow_api.g_varchar2_table(23) := '202020206C726F7773203D206F6C6448544D4C2E73706C69742820225C6E2220293B0A0A09202020202020696628206C726F7773202626206C726F77732E6C656E67746820297B0A0A0920202020202020207768696C6528206C726F77732E6C656E6774';
wwv_flow_api.g_varchar2_table(24) := '68203E2030202626206C726F77735B6C726F77732E6C656E677468202D20315D2E7472696D28292E6C656E677468203D3D3D203020297B0A09202020202020202020206C726F77732E706F7028293B0A0920202020202020207D0A0A0920202020202020';
wwv_flow_api.g_varchar2_table(25) := '20696628206C726F7773202626206C726F77732E6C656E67746820297B0A092020202020202020202072657475726E20223C636F64653E22202B206C726F77732E6A6F696E2820223C2F636F64653E5C6E3C636F64653E222029202B20223C2F636F6465';
wwv_flow_api.g_varchar2_table(26) := '3E223B0A0920202020202020207D0A0A092020202020207D0A0A09202020207D293B0A0A0920207D2C0A0A097D3B0A0A092F2A2A0A092A20406D6F64756C6520626C6F672E706C7567696E0A092A2A2F0A09626C6F672E706C7567696E203D207B0A0A09';
wwv_flow_api.g_varchar2_table(27) := '20202F2A2A0A0920202A204066756E6374696F6E207772617053656C656374696F6E0A0920202A20406578616D706C6520626C6F672E706C7567696E2E7772617053656C656374696F6E282027636F6465272C202750785F4954454D5F4E414D45272029';
wwv_flow_api.g_varchar2_table(28) := '3B0A0920202A2A2F0A0920207772617053656C656374696F6E3A2066756E6374696F6E202820705461672C20704974656D4E616D652029207B0A0A092020202076617220244974656D20093D2024282024782820704974656D4E616D65202920292C0A09';
wwv_flow_api.g_varchar2_table(29) := '0909737461727454616709093D20223C22202B2070546167202B20223E222C0A090909656E645461670909093D20223C2F22202B2070546167202B20223E220A09090973656C6563746564547874203D20244974656D2E67657453656C656374696F6E28';
wwv_flow_api.g_varchar2_table(30) := '292E746578743B0A0A0920202020244974656D2E666F63757328292E7265706C61636553656C656374696F6E28207374617274546167202B2073656C656374656454787420202B20656E6454616720293B0A0A0920207D0A0A097D3B0A0A7D2928617065';
wwv_flow_api.g_varchar2_table(31) := '782E6A51756572792C20626C6F67293B0A';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(9501036133429890)
,p_file_name=>'blog.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6753928467267359)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6754162584267360)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6754443373267360)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6755115835267360)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6755338366267360)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(6755660794267361)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(30922209065378036)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_FI.JARIS.MATH_QUESTION_FIELD'
,p_attribute_01=>'Question answer isn''t correct.'
,p_attribute_02=>'Ajax call returned error.'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(30931664211449294)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_FI.JARIS.COMMENT_TEXTAREA'
,p_attribute_01=>'Comment is too long.'
,p_attribute_02=>'Comment is not valid. Please check e.g. allowed HTML tags are entered properly.'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/initiatize_items
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(6967440756284720)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Initiatize Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.initialize_items( ',
'  p_app_id => :APP_ID',
');'))
,p_process_comment=>'Set application and page item values on new session from parameter table'
);
end;
/
prompt --application/shared_components/logic/application_processes/redirect_to_search_page
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(6988319204594678)
,p_process_sequence=>1
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirect to search page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_url.redirect_search(',
'   p_value    => :P0_SEARCH',
');'))
,p_process_when=>'P0_SEARCH'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_comment=>'Redirect to search result when request is P0_SEARCH'
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(4237180620292482)
,p_name=>'G_ADMIN_APP_ID'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966805581190300)
,p_name=>'G_APP_DESC'
,p_protection_level=>'I'
,p_item_comment=>'Application description'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966581773188245)
,p_name=>'G_APP_NAME'
,p_protection_level=>'I'
,p_item_comment=>'Application name'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(24541154547469283)
,p_name=>'G_ARCHIVE_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Archive date format. Used e.g. in archive select list and archive report region header.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966958999192709)
,p_name=>'G_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Date format used e.g. on reports'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(7029499271806601)
,p_name=>'G_POST_TITLE_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Post title date format. Used e.g. in posts reports.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6967171655194779)
,p_name=>'G_SEARCH_ROWS'
,p_protection_level=>'I'
,p_item_comment=>'Search report rows to display per report page'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(23525984808193808)
,p_name=>'G_SHOW_TAGS_STATUS'
,p_protection_level=>'I'
,p_item_comment=>'Caches build option BLOG_FEATURE_TAGS status'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(23526323776199842)
,p_computation_sequence=>10
,p_computation_item=>'G_SHOW_TAGS_STATUS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status(',
'  p_application_id => :APP_ID',
'  ,p_build_option_name => ''BLOG_FEATURE_TAGS''',
')'))
,p_computation_comment=>'Set build option BLOG_FEATURE_TAGS status to item. Item is used in page 2 and 6 report query'
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/blog_archive_lov
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6913317691576071)
,p_lov_name=>'BLOG_ARCHIVE_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   #OWNER#.blog_util.get_year_month(',
'      p_archive_date => lov.archive_date',
'     ,p_date_format => :G_ARCHIVE_DATE_FORMAT',
'     ,p_posts_count  => lov.posts_count',
'   ) as display_value',
'  ,#OWNER#.blog_url.get_archive(',
'      p_year_month => lov.year_month',
'   ) as return_value',
'from #OWNER#.blog_v_archive_lov lov',
'order by lov.archive_date desc',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_optimizer_hint=>'result_cache'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'DESC'
);
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(6882607828267435)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(6882607828267435)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(6882965268267436)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8700188054171688)
,p_group_name=>'General'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8697986188142973)
,p_group_name=>'Posts'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(20718112665951240)
,p_group_name=>'Tabs'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6757068893267362)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14965885536305395)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14966376354305395)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14966848319305395)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14967395626305395)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14967844395305395)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14968313729305396)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14968827591305396)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14969352364305396)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14969886819305396)
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6760179457267364)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14979067051305401)
,p_page_template_id=>wwv_flow_api.id(6760179457267364)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14979503564305401)
,p_page_template_id=>wwv_flow_api.id(6760179457267364)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14980020753305402)
,p_page_template_id=>wwv_flow_api.id(6760179457267364)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6761688085267365)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-container">',
'  <header class="t-Login-containerHeader">#REGION_POSITION_01#</header>',
'  <main class="t-Login-containerBody" id="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</main>',
'  <footer class="t-Login-containerFooter">#REGION_POSITION_02#</footer>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14958178620305390)
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_name=>'Body Footer'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14958680512305390)
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14959141181305390)
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6762463719267365)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14997336262305410)
,p_page_template_id=>wwv_flow_api.id(6762463719267365)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14997869163305410)
,p_page_template_id=>wwv_flow_api.id(6762463719267365)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14998340827305411)
,p_page_template_id=>wwv_flow_api.id(6762463719267365)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6763958837267366)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14943680474305378)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14944154035305378)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14944665854305379)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14945133061305379)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14945664592305379)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14946119586305379)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14946676532305380)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14947158860305380)
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6766836658267367)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14984649390305404)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14985149534305404)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14985665489305405)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14986135323305405)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14986668157305405)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14987107539305405)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14987612373305405)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14988116251305406)
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6769628254267369)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14951873844305386)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14952317694305387)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14952831292305387)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14953324193305387)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14953824032305387)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14954395263305388)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14954869455305388)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14955353452305388)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14955852953305388)
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6772642789267370)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14973719181305398)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14974261392305399)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14974710067305399)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14975231092305399)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14975750102305399)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14976297212305399)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14976769759305400)
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(6775199272267372)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14992081623305408)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14992547702305408)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14993006386305408)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14993556268305408)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14994061463305409)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14994521590305409)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(14995073148305409)
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6855074105267413)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6855169478267414)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(6855239813267414)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5988422738475876)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15058053369305457)
,p_plug_template_id=>wwv_flow_api.id(5988422738475876)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6777727951267373)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15000109951305417)
,p_plug_template_id=>wwv_flow_api.id(6777727951267373)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6781372168267375)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6781539027267375)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15008976078305422)
,p_plug_template_id=>wwv_flow_api.id(6781539027267375)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15009468492305423)
,p_plug_template_id=>wwv_flow_api.id(6781539027267375)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6782379920267375)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15011014499305423)
,p_plug_template_id=>wwv_flow_api.id(6782379920267375)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15011515790305424)
,p_plug_template_id=>wwv_flow_api.id(6782379920267375)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6784592949267377)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15015884707305427)
,p_plug_template_id=>wwv_flow_api.id(6784592949267377)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15016376708305427)
,p_plug_template_id=>wwv_flow_api.id(6784592949267377)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6791752177267380)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15032011173305437)
,p_plug_template_id=>wwv_flow_api.id(6791752177267380)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15032593650305437)
,p_plug_template_id=>wwv_flow_api.id(6791752177267380)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6796339335267382)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6798176791267383)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15049084103305450)
,p_plug_template_id=>wwv_flow_api.id(6798176791267383)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6799730463267385)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15053540792305453)
,p_plug_template_id=>wwv_flow_api.id(6799730463267385)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6801762579267386)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6802357267267386)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">#BODY#</div>',
'  <div class="t-Login-buttons">#NEXT#</div>',
'  <div class="t-Login-links">#EDIT##CREATE#</div>',
'  <div class="t-Login-subRegions">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15066707507305463)
,p_plug_template_id=>wwv_flow_api.id(6802357267267386)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6802870362267386)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15070135028305465)
,p_plug_template_id=>wwv_flow_api.id(6802870362267386)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15070675724305465)
,p_plug_template_id=>wwv_flow_api.id(6802870362267386)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6809714944267390)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15089356116305477)
,p_plug_template_id=>wwv_flow_api.id(6809714944267390)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15089822303305478)
,p_plug_template_id=>wwv_flow_api.id(6809714944267390)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6812256103267391)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(6813273970267392)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(15096497768305482)
,p_plug_template_id=>wwv_flow_api.id(6813273970267392)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>false
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6833949072267402)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6838012936267404)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6842938924267407)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6844546976267407)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6847003968267409)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6847975075267409)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide"), iconType: ''fa'', callout: e.hasClass("js-menu-callout")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6848359906267410)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6848614889267410)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_preset_template_options=>'js-navCollapsed--default:t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6848962014267410)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6850610093267411)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("#t_MenuNav", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="t_MenuNav"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6851626345267411)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(6853224737267412)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></'
||'div></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>',
''))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6814607236267392)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6815219261267393)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_condition1=>':LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <div class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6817941349267394)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6820008141267395)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6821776972267396)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6825403942267398)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(6825403942267398)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6828031165267399)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6828763401267399)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6829031688267400)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6833829938267402)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/blog_posts_custom_1
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(6894976353301648)
,p_row_template_name=>'Blog Posts (Custom 1)'
,p_internal_name=>'BLOG_POSTS_CUSTOM_1'
,p_javascript_code_onload=>'blog.UI.formatProgramCode("pre.z-program-code");'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article role="article" class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TXT# #CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML##READ_MORE_TXT#</div>',
'  <footer class="z-post--footer"></footer>',
'</article>'))
,p_row_template_condition1=>':READ_MORE_TXT is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article role="article" class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TXT# #CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--footer">#TAGS_HTML#</footer>',
'</article>'))
,p_row_template_condition2=>':TAGS_HTML is not null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<article role="article" class="z-post">',
'  <header class="z-post--header">',
'    <h3>#PUBLISHED_ON#</h3>',
'    <h1>#POST_TITLE#</h1>',
'    <h2>#CATEGORY_TXT# #CATEGORY_TITLE#</h2>',
'  </header>',
'  <div class="z-post--body">#BODY_HTML#</div>',
'  <footer class="z-post--footer"></footer>',
'</article>'))
,p_row_template_before_rows=>'<div class="#COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_posts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">',
'      #PAGINATION#',
'  </table>',
'</div>',
''))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>'<button onclick="#LINK#" type="button" title="#PAGINATION_NEXT_SET#" aria-label="#PAGINATION_NEXT_SET#" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot t-Button--small t-Button--simple"><span aria-hidden="true" class="t-Icon fa fa-chev'
||'ron-right"></span></button>'
,p_previous_set_template=>'<button onclick="#LINK#" type="button" title="#PAGINATION_PREVIOUS_SET#" aria-label="#PAGINATION_PREVIOUS_SET#" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot t-Button--small t-Button--simple"><span aria-hidden="true" class="t-Icon fa'
||' fa-chevron-left"></span></button>'
,p_theme_id=>42
,p_theme_class_id=>7
);
end;
/
prompt --application/shared_components/user_interface/templates/report/content_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(13402107649108157)
,p_row_template_name=>'Content Row'
,p_internal_name=>'CONTENT_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-ContentRow-item #ITEM_CLASSES#">',
'  <div class="t-ContentRow-wrap">',
'    <div class="t-ContentRow-selection">#SELECTION#</div>',
'    <div class="t-ContentRow-iconWrap">',
'      <span class="t-ContentRow-icon #ICON_CLASS#">#ICON_HTML#</span>',
'    </div>',
'    <div class="t-ContentRow-body">',
'      <div class="t-ContentRow-content">',
'        <h3 class="t-ContentRow-title">#TITLE#</h3>',
'        <div class="t-ContentRow-description">#DESCRIPTION#</div>',
'      </div>',
'      <div class="t-ContentRow-misc">#MISC#</div>',
'      <div class="t-ContentRow-actions">#ACTIONS#</div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-ContentRow #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'#PAGINATION#'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1797843454948280151
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854381477267413)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854464528267413)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854610443267413)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854643778267413)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854769194267413)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6854890717267413)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(6855004103267413)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(6855961171267414)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(6856142557267414)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(6856080534267414)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(6857345069267416)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(6775199272267372)
,p_default_dialog_template=>wwv_flow_api.id(6760179457267364)
,p_error_template=>wwv_flow_api.id(6761688085267365)
,p_printer_friendly_template=>wwv_flow_api.id(6775199272267372)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(6761688085267365)
,p_default_button_template=>wwv_flow_api.id(6855169478267414)
,p_default_region_template=>wwv_flow_api.id(6802870362267386)
,p_default_chart_template=>wwv_flow_api.id(6802870362267386)
,p_default_form_template=>wwv_flow_api.id(6802870362267386)
,p_default_reportr_template=>wwv_flow_api.id(6802870362267386)
,p_default_tabform_template=>wwv_flow_api.id(6802870362267386)
,p_default_wizard_template=>wwv_flow_api.id(6802870362267386)
,p_default_menur_template=>wwv_flow_api.id(6812256103267391)
,p_default_listr_template=>wwv_flow_api.id(6802870362267386)
,p_default_irr_template=>wwv_flow_api.id(6801762579267386)
,p_default_report_template=>wwv_flow_api.id(6825403942267398)
,p_default_label_template=>wwv_flow_api.id(6854643778267413)
,p_default_menu_template=>wwv_flow_api.id(6855961171267414)
,p_default_calendar_template=>wwv_flow_api.id(6856080534267414)
,p_default_list_template=>wwv_flow_api.id(6842938924267407)
,p_default_nav_list_template=>wwv_flow_api.id(6850610093267411)
,p_default_top_nav_list_temp=>wwv_flow_api.id(6850610093267411)
,p_default_side_nav_list_temp=>wwv_flow_api.id(6848614889267410)
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>wwv_flow_api.id(6782379920267375)
,p_default_dialogr_template=>wwv_flow_api.id(6781372168267375)
,p_default_option_label=>wwv_flow_api.id(6854643778267413)
,p_default_required_label=>wwv_flow_api.id(6855004103267413)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(6848359906267410)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.4/')
,p_files_version=>101
,p_icon_library=>'FONTAPEX_LATEST'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(14702461193305227)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(14702871374305228)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(14703250032305228)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(14703600668305228)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(14704001967305228)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(15402514075800027)
,p_theme_id=>42
,p_name=>'Vita Blog'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"/*********************************\n*  Universal theme overrides\n*********************************/\n/**\n* Remove link button border when focused\n**/\n.t-Button--link:focus:before,\n.t-Button--link:focus:after{\n  outline:none!import'
||'ant;\n  box-shadow:none!important;\n}\n/*\n.t-Header .t-Header-nav {\n  box-shadow: 0 2px 4px -2px rgba(0,0,0,.075);\n  border-bottom: 1px solid rgba(0,0,0,.075);\n}\n*/\n/*********************************\n*  Custom styles\n*************************'
||'********/\n/***\n* Elements\n***/\nblockquote::before{\n  content: open-quote;\n  font-size: 2.2rem;\n}\nblockquote::after{\n  content: close-quote;\n  font-size: 2.2rem;\n}\nblockquote p{\n  display: inline;\n}\n\n/**\n* Logo\n**/\n.z-app-logo q{\n '
||' display: block;\n  font-size: 1.4rem;\n  font-style: oblique;\n  font-weight: normal;\n}\n\n/**\n* Author info\n**/\n.z-author--card .t-Card{\n  margin: 0;\n  padding: 0;\n  width: 100%;\n}\n.z-author--card .t-Card-titleWrap {\n  min-height: initial'
||';\n  border-bottom: 1px solid rgba(0,0,0,.075);\n  box-shadow: none;\n}\n.z-author--card .t-Card-title {\n  font-size: 1.6rem;\n  font-weight: 500;\n  line-height: 2.4rem;\n}\n.z-author--card .t-Card-wrap{\n  border: none;\n}\n.z-author--card .t-Card'
||'-colorFill{\n  background-color: transparent;\n}\n.z-author-container{\n  display: flex;\n  flex-flow: row;\n  width: 100%;\n}\n.z-author-left{\n  order: 1;\n}\n.z-author-left img{\n  display: block;\n}\n.z-author-right{\n  order: 2;\n  padding-left:'
||' 16px;\n}\n\n/**\n* Reports\n**/\n.nodatafound{\n  font-size: 1.2rem;\n}\n\n/**\n* Post report\n**/\n.z-post{\n  background-color: #ffffff;\n  margin-bottom: 16px;\n  border: 1px solid rgba(0,0,0,.1);\n  border-radius: 2px;\n  box-shadow: 0 2px 4px -'
||'2px rgba(0,0,0,.075);\n  padding: 16px;\n}\n.z-post--header{\n  clear: both;\n}\n.z-post--header h1{\n  font-size: 1.6em;\n  margin: 0 0 0.2rem;\n}\n.z-post--header h1 a{\n  color: inherit;\n}\n.z-post--header h2{\n  font-size: 1.4rem;\n  margin: 0 0'
||' 1.8rem;\n}\n.z-post--header h3{\n  font-size: 1.4rem;\n  margin: 0 0 0.2rem;\n}\n.z-post--body img{\n  max-width: 100%;\n  height: auto;\n}\n.z-post--body br{\n  clear: none!important;\n}\n.z-post--footer{\n  width: 100%;\n  clear: both;\n  margin: '
||'1.2rem 0 0;\n}\n\n/**\n* Comments\n**/\n.z-comment .t-Comments-body{\n  flex: 1 1 auto;\n  width: 0;\n}\n.z-comment .t-Comments-comment{\n  width: 100%;\n  overflow-wrap: break-word;\n}\n.z-comment pre{\n  font-family: inherit;\n  font-style: inherit'
||';\n  font-size: inherit;\n  white-space: pre-wrap;\n}\n\n/**\n* Links Report\n**/\n.z-links{\n  background-color: transparent;\n}\nli.z-links--header{\n  display: flex;\n  flex-grow: 1;\n  border-top: 1px solid rgba(0,0,0,.1);\n  border-left: 1px sol'
||'id rgba(0,0,0,.1);\n  border-right: 1px solid rgba(0,0,0,.1);\n  border-bottom: none;\n  box-shadow: 0 2px 4px -2px rgba(0,0,0,.075);\n  margin-top: 16px;\n  background-color: #ffffff;\n  border-radius: 2px 2px 0 0;\n}\nli.z-links--header div{\n  wid'
||'th: 100%;\n  padding: 1.2rem;\n  font-size: 1.6rem;\n  font-weight: 500;\n  line-height: 2.4rem;\n  border-bottom: 1px solid rgba(0,0,0,.075);\n}\nli.z-links--header:first-child{\n  margin-top: 0;\n}\nli.z-links--item{\n  border-left: 1px solid rgba('
||'0,0,0,.1);\n  border-right: 1px solid rgba(0,0,0,.1);\n  border-bottom: 1px solid rgba(0,0,0,.075);\n  background-color: #ffffff;\n  border-radius: 0 0 2px 2px;\n  box-shadow: 0 2px 4px -2px rgba(0,0,0,.075);\n}\nli.z-links--item:last-child{\n  margi'
||'n-bottom: 16px;\n  border-bottom: 1px solid rgba(0,0,0,.1);\n}\n\n/**\n* Program code formating\n**/\npre.z-program-code{\n  font-family: \"Lucida Console\", Courier, monospace;\n  font-size: 1.2rem;\n  line-height: 1.4;\n  tab-size: 2;\n  counter-re'
||'set: line;\n  overflow-x: auto;\n}\npre.z-program-code code{\n  font-family: inherit;\n  font-size: inherit;\n  line-height: inherit;\n  tab-size: inherit;\n  counter-increment: line;\n  margin: 0;\n  padding: 0;\n  overflow: visible;\n}\npre.z-progr'
||'am-code code::before{\n  content: counter(line);\n  border-right: 2px solid #6ce26c;\n  margin: 0 0.4em 0 0;\n  padding: 0 0.2em 0 0;\n  display: inline-block;\n  text-align: right;\n  width: 2.2em;\n  color: #939393;\n  user-select: none;\n}\n\n/**\'
||'n* Right column link lists\n**/\n.z-link-list--no-border li,\n.z-link-list--no-border a:focus{\n  border: none;\n  outline: none;\n  box-shadow: none;\n}\n\n@media only screen and (max-width: 640px){\n  /**\n  * Post report\n  **/\n  .z-post{\n    pa'
||'dding: 12px;\n  }\n  .z-post--header h1{\n    font-size: 1.4em;\n  }\n  .z-post--header h2{\n    font-size: 1.3rem;\n  }\n  .z-post--header h3{\n    font-size: 1.3rem;\n  }\n  /**\n  * Author info\n  **/\n  .z-author-container{\n    flex-flow: column'
||';\n    align-items: center;\n  }\n  .z-author-right{\n    padding: 0;\n  }\n}\n\n.z-hidden{\n  display: none;\n  visibility: hidden;\n}\n","vars":{"@g_Nav_Style":"dark"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#15402514075800027.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A200D0A202A205669746120426C6F670D0A202A20202020284F7261636C65204170706C69636174696F6E2045787072657373205468656D65205374796C65290D0A202A200D0A202A2054686973204353532066696C65207761732067656E65726174';
wwv_flow_api.g_varchar2_table(2) := '6564207573696E6720746865204F7261636C65204170706C69636174696F6E204578707265737320352E30205468656D6520526F6C6C65722E200D0A202A200D0A202A2F0D0A0D0A2E742D4156504C6973742D6974656D207B0D0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(3) := '646F773A2030202D302E3172656D2030207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E742D4156504C6973742D6C6162656C2C0D0A2E742D4156504C6973742D76616C7565207B0D0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(4) := '203020302E3172656D207267626128302C20302C20302C20302E3037352920696E7365743B0D0A7D0D0A2E742D4156504C6973742D76616C7565207B0D0A2020636F6C6F723A20233462346234623B0D0A7D0D0A2E742D426F64792D696E666F202E742D';
wwv_flow_api.g_varchar2_table(5) := '4156504C6973742D76616C7565207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D526567696F6E202E742D4156504C6973742D76616C7565207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D4156504C6973';
wwv_flow_api.g_varchar2_table(6) := '742D6C6162656C207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D426F64792D696E666F202E742D4156504C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E74';
wwv_flow_api.g_varchar2_table(7) := '2D4156504C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4156504C697374202B202E742D5265706F72742D706167696E6174696F6E207B0D0A2020626F726465722D746F702D636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(8) := '6128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D416C6572742D2D77697A6172642C0D0A2E742D416C6572742D2D686F72697A6F6E74616C207B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F726465722D636F6C';
wwv_flow_api.g_varchar2_table(9) := '6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D7761726E696E672C0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D79656C6C6F77207B';
wwv_flow_api.g_varchar2_table(10) := '0D0A20206261636B67726F756E642D636F6C6F723A20236665663765303B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D73756363657373207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(11) := '6F756E642D636F6C6F723A20236634666366333B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D64616E6765722C0D0A2E742D416C6572742D2D636F6C6F7242472E742D';
wwv_flow_api.g_varchar2_table(12) := '416C6572742D2D726564207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663866373B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D2D636F6C6F7242472E742D416C6572742D2D696E666F207B0D';
wwv_flow_api.g_varchar2_table(13) := '0A20206261636B67726F756E642D636F6C6F723A20236639666366663B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(14) := '416C6572742D2D7761726E696E67202E742D416C6572742D69636F6E202E742D49636F6E2C0D0A2E742D416C6572742D2D79656C6C6F77202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20234642434534413B0D0A';
wwv_flow_api.g_varchar2_table(15) := '7D0D0A2E742D416C6572742D2D7761726E696E672E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E2C0D0A2E742D416C6572742D2D79656C6C6F772E742D416C6572742D2D686F72697A6F6E74616C202E742D416C65';
wwv_flow_api.g_varchar2_table(16) := '72742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235312C203230362C2037342C20302E3135293B0D0A7D0D0A2E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E202E742D49636F6E';
wwv_flow_api.g_varchar2_table(17) := '207B0D0A2020636F6C6F723A20233342414132433B0D0A7D0D0A2E742D416C6572742D2D737563636573732E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(18) := '20726762612835392C203137302C2034342C20302E3135293B0D0A7D0D0A2E742D416C6572742D2D696E666F202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D416C657274';
wwv_flow_api.g_varchar2_table(19) := '2D2D696E666F2E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C203131382C203232332C20302E3135293B0D0A7D0D0A2E742D416C6572';
wwv_flow_api.g_varchar2_table(20) := '742D2D64616E676572202E742D416C6572742D69636F6E202E742D49636F6E2C0D0A2E742D416C6572742D2D726564202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20236634343333363B0D0A7D0D0A2E742D416C';
wwv_flow_api.g_varchar2_table(21) := '6572742D2D64616E6765722E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E2C0D0A2E742D416C6572742D2D7265642E742D416C6572742D2D686F72697A6F6E74616C202E742D416C6572742D69636F6E207B0D0A20';
wwv_flow_api.g_varchar2_table(22) := '206261636B67726F756E642D636F6C6F723A2072676261283234342C2036372C2035342C20302E3135293B0D0A7D0D0A2E742D416C6572742D2D77697A617264202E742D416C6572742D696E736574207B0D0A2020626F726465722D7261646975733A20';
wwv_flow_api.g_varchar2_table(23) := '3270783B0D0A7D0D0A2E742D416C6572742D2D686F72697A6F6E74616C2C0D0A2E742D416C6572742D2D77697A617264207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D';
wwv_flow_api.g_varchar2_table(24) := '0A7D0D0A2E742D416C6572742D2D70616765207B0D0A2020626F782D736861646F773A20302030203020302E3172656D207267626128302C20302C20302C20302E312920696E7365742C20302033707820397078202D327078207267626128302C20302C';
wwv_flow_api.g_varchar2_table(25) := '20302C20302E31293B0D0A7D0D0A2E742D416C6572742D2D70616765202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D';
wwv_flow_api.g_varchar2_table(26) := '0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373207B0D0A20206261636B67726F756E642D636F6C6F723A20726762612835392C203137302C2034342C20302E39293B0D0A2020636F6C6F723A20234646463B0D0A';
wwv_flow_api.g_varchar2_table(27) := '7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20234646463B';
wwv_flow_api.g_varchar2_table(28) := '0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D73756363657373202E742D416C6572742D69636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D416C6572742D2D706167652E74';
wwv_flow_api.g_varchar2_table(29) := '2D416C6572742D2D73756363657373202E742D427574746F6E2D2D636C6F7365416C657274207B0D0A2020636F6C6F723A20234646462021696D706F7274616E743B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D7761726E69';
wwv_flow_api.g_varchar2_table(30) := '6E67207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D7761726E696E67202E742D416C6572742D69';
wwv_flow_api.g_varchar2_table(31) := '636F6E202E742D49636F6E207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D7761726E696E672061207B0D0A2020636F6C6F723A20696E68657269743B0D0A2020746578742D';
wwv_flow_api.g_varchar2_table(32) := '6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A2E742D416C6572742D2D706167652E742D416C6572742D2D7761726E696E67202E612D4E6F74696669636174696F6E2D6974656D3A6265666F7265207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(33) := '6E642D636F6C6F723A2063757272656E74436F6C6F723B0D0A7D0D0A2E742D4C6F67696E2D636F6E7461696E6572426F6479202E742D426F64792D616C657274207B0D0A202077696474683A2034363070783B0D0A7D0D0A2E742D42616467652D2D6261';
wwv_flow_api.g_varchar2_table(34) := '736963207B0D0A2020626F782D736861646F773A20302030203020302E3172656D2072676261283235352C203235352C203235352C20302E3032352920696E7365743B0D0A7D0D0A2E742D42616467652D2D6F72623A6265666F7265207B0D0A2020626F';
wwv_flow_api.g_varchar2_table(35) := '782D736861646F773A20302030203020302E3172656D2072676261283235352C203235352C203235352C20302E30352920696E7365743B0D0A7D0D0A2E742D42616467652D2D6F72622E69732D6E756C6C3A6265666F7265207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(36) := '20233730373037303B0D0A7D0D0A2E742D42616467652D2D62617369632E69732D6E756C6C207B0D0A2020636F6C6F723A20233730373037303B0D0A7D0D0A2E742D42616467654C6973742C0D0A2E742D42616467654C6973743A6E6F74282E752D636F';
wwv_flow_api.g_varchar2_table(37) := '6C6F7273292061202E742D42616467654C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C7565207B0D0A202062';
wwv_flow_api.g_varchar2_table(38) := '6F782D736861646F773A2030203020302031707820726762612833382C2033382C2033382C20302E312920696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D42616467654C6973742D2D6369';
wwv_flow_api.g_varchar2_table(39) := '7263756C617220612E742D42616467654C6973742D777261703A686F766572202E742D42616467654C6973742D76616C7565207B0D0A2020626F782D736861646F773A20302030203020347078202330303736646620696E7365743B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(40) := '67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A666F6375732C0D0A2E742D4261646765';
wwv_flow_api.g_varchar2_table(41) := '4C6973742D2D64617368202E742D42616467654C6973742D777261703A666F6375732D77697468696E2C0D0A2E742D42616467654C6973742D2D63697263756C617220612E742D42616467654C6973742D777261703A666F637573202E742D4261646765';
wwv_flow_api.g_varchar2_table(42) := '4C6973742D76616C75652C0D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E';
wwv_flow_api.g_varchar2_table(43) := '7365742C20302030203020327078202366666666666620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D42616467654C6973742D2D646173';
wwv_flow_api.g_varchar2_table(44) := '68202E742D42616467654C6973742D777261703A666F6375732D77697468696E2C0D0A2E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D76616C756520613A686F766572207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(45) := '2D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D42616467654C6973742D2D64617368202E742D42616467654C6973742D76616C756520';
wwv_flow_api.g_varchar2_table(46) := '613A666F6375732C0D0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A666F6375732D77697468696E202E742D42616467654C6973742D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(47) := '0D0A7D0D0A2E742D42616467654C6973742D6974656D3A61667465722C0D0A2E742D42616467654C6973742D6974656D3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D';
wwv_flow_api.g_varchar2_table(48) := '0A7D0D0A2E742D42616467654C6973742D2D6461736820612E742D42616467654C6973742D777261703A686F7665723A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D';
wwv_flow_api.g_varchar2_table(49) := '0D0A2E742D42616467654C6973742E752D636F6C6F72732E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D777261703A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(50) := '663B0D0A7D0D0A2E742D42616467654C6973742E752D636F6C6F72732E742D42616467654C6973742D2D63697263756C6172202E742D42616467654C6973742D6C6162656C207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4261';
wwv_flow_api.g_varchar2_table(51) := '6467654C6973742E752D636F6C6F7273202E742D42616467654C6973742D76616C75652061207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D4261724368617274202E612D42617243686172742D6974656D207B0D0A2020626F78';
wwv_flow_api.g_varchar2_table(52) := '2D736861646F773A2030202D302E3172656D2030207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E612D4261724368617274202E612D42617243686172742D6974656D3A686F766572207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(53) := '6E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D426F6479202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A2020636F6C6F723A20233765376537653B0D0A';
wwv_flow_api.g_varchar2_table(54) := '7D0D0A2E742D426F64792D7469746C65202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E66';
wwv_flow_api.g_varchar2_table(55) := '6F202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D526567696F6E202E612D4261724368617274202E612D42';
wwv_flow_api.g_varchar2_table(56) := '617243686172742D6974656D202E612D42617243686172742D76616C75652C0D0A2E742D427574746F6E526567696F6E202E612D4261724368617274202E612D42617243686172742D6974656D202E612D42617243686172742D76616C7565207B0D0A20';
wwv_flow_api.g_varchar2_table(57) := '20636F6C6F723A20233830383038303B0D0A7D0D0A2E612D4261724368617274202E612D42617243686172742D6974656D20696D67207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E612D4261724368617274202E612D4261';
wwv_flow_api.g_varchar2_table(58) := '7243686172742D626172207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A7D0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6C6162656C2C0D';
wwv_flow_api.g_varchar2_table(59) := '0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6261724C696E6B2C0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D76616C7565207B0D0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(60) := '30202D302E3172656D2030207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6261722C0D0A2E612D42617243686172742D2D636C617373';
wwv_flow_api.g_varchar2_table(61) := '6963202E612D42617243686172742D66696C6C6564207B0D0A2020626F726465722D7261646975733A203170783B0D0A7D0D0A2E612D42617243686172742D2D636C6173736963202E612D42617243686172742D6974656D3A686F766572202E612D4261';
wwv_flow_api.g_varchar2_table(62) := '7243686172742D626172207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D6261722C0D0A2E612D';
wwv_flow_api.g_varchar2_table(63) := '42617243686172742D2D6D6F6465726E202E612D42617243686172742D66696C6C6564207B0D0A2020626F726465722D7261646975733A203170783B0D0A7D0D0A2E612D42617243686172742D2D6D6F6465726E202E612D42617243686172742D697465';
wwv_flow_api.g_varchar2_table(64) := '6D3A686F766572202E612D42617243686172742D626172207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E612D42617243686172742D66696C6C6564207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(65) := '67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E617065785F776169745F6F7665726C6179207B0D0A20206261636B67726F756E643A2072676261283235352C203235352C203235352C20302E35293B0D0A7D0D0A626F6479207B0D';
wwv_flow_api.g_varchar2_table(66) := '0A20206261636B67726F756E642D636F6C6F723A20234644464446443B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A626F6479202E677269642D64656275672D6F6E202E636F6E7461696E6572207B0D0A2020626F726465722D626F7474';
wwv_flow_api.g_varchar2_table(67) := '6F6D2D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A61207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A2E742D426F64792D616374696F6E73207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(68) := '236639663966393B0D0A2020626F726465722D6C6566743A2031707820736F6C6964207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E752D52544C202E742D426F64792D616374696F6E73207B0D0A2020626F726465722D6C656674';
wwv_flow_api.g_varchar2_table(69) := '3A20303B0D0A2020626F726465722D72696768743A2031707820736F6C6964207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D426F64792D7469746C65207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(70) := '3235352C203235352C203235352C20302E39293B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A';
wwv_flow_api.g_varchar2_table(71) := '207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C2023745F426F64795F636F6E74656E745F6F6666736574207B0D0A20206261636B67726F756E642D636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(72) := '61283235352C203235352C203235352C20302E39293B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C202E742D426F64792D7469746C652E6861732D736861646F77207B0D0A2020626F782D736861646F773A203020317078';
wwv_flow_api.g_varchar2_table(73) := '2030207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C202E742D426F64792D7469746C652E6861732D736861646F773A6166746572207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(74) := '642D696D6167653A206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E3035292C207267626128302C20302C20302C203029293B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C202E61706578';
wwv_flow_api.g_varchar2_table(75) := '2D7264732D636F6E7461696E6572207B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D50616765426F64792D2D6D617374657244657461696C202E6170';
wwv_flow_api.g_varchar2_table(76) := '65782D7264732D636F6E7461696E65722E69732D737475636B3A6166746572207B0D0A20206261636B67726F756E642D696D6167653A206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E3035292C207267626128302C20';
wwv_flow_api.g_varchar2_table(77) := '302C20302C203029293B0D0A7D0D0A2E75692D7769646765742D636F6E74656E74207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E75692D7769646765742D636F6E74656E74207B0D0A';
wwv_flow_api.g_varchar2_table(78) := '2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F64792D7469746C65202E75692D7769646765742D636F6E74656E74207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E75692D776964';
wwv_flow_api.g_varchar2_table(79) := '6765742D636F6E74656E74207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E75692D7769646765742D636F6E74656E742C0D0A2E742D427574746F6E526567696F6E202E75692D7769646765742D636F6E7465';
wwv_flow_api.g_varchar2_table(80) := '6E74207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D73696465207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A406D6564';
wwv_flow_api.g_varchar2_table(81) := '6961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20202E742D426F64792D73696465207B0D0A20202020626F782D736861646F773A2031707820302030207267626128302C20302C20302C20302E31';
wwv_flow_api.g_varchar2_table(82) := '293B0D0A20207D0D0A20202E752D52544C202E742D426F64792D73696465207B0D0A20202020626F782D736861646F773A202D31707820302030207267626128302C20302C20302C20302E31293B0D0A20207D0D0A7D0D0A2E617065782D7264732D636F';
wwv_flow_api.g_varchar2_table(83) := '6E7461696E6572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D696E666F202E617065782D7264732D636F6E7461696E6572207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(84) := '6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D696E666F202E617065782D7264732D636F6E7461696E65722E69732D737475636B207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C20323535';
wwv_flow_api.g_varchar2_table(85) := '2C20302E3935293B0D0A20206261636B64726F702D66696C7465723A20626C757228347078293B0D0A7D0D0A2E742D426F64792D696E666F207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479';
wwv_flow_api.g_varchar2_table(86) := '2D7469746C652E6A732D6869646542726561646372756D6273207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3935293B0D0A7D0D0A2E742D426F64792D746F70427574746F6E207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(87) := '6465722D7261646975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20236536653665363B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20';
wwv_flow_api.g_varchar2_table(88) := '302C20302C20302E31293B0D0A7D0D0A2E742D426F64792D746F70427574746F6E3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742C20302031707820327078207267626128302C20';
wwv_flow_api.g_varchar2_table(89) := '302C20302C20302E3135293B0D0A7D0D0A2E742D426F64792D746F70427574746F6E3A686F7665722C0D0A2E742D426F64792D746F70427574746F6E3A666F637573207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D426F64792D';
wwv_flow_api.g_varchar2_table(90) := '746F70427574746F6E3A686F7665722C0D0A2E742D426F64792D746F70427574746F6E3A616374697665207B0D0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E31352920696E7365743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(91) := '0A2E742D426F64792D746F70427574746F6E3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20236536653665363B0D0A7D0D0A2E742D4865616465722D6272616E64696E6720';
wwv_flow_api.g_varchar2_table(92) := '7B0D0A20206865696768743A20343870783B0D0A7D0D0A2E742D4865616465722D6C6F676F2D6C696E6B20696D67207B0D0A20206D61782D6865696768743A20343070783B0D0A7D0D0A2E742D426F64792D636F6E74656E74207B0D0A20206D696E2D68';
wwv_flow_api.g_varchar2_table(93) := '65696768743A2063616C63283130307668202D202034387078293B0D0A7D0D0A2E617065782D736964652D6E6176202E742D426F64792D6E61762C0D0A2E617065782D736964652D6E6176202E742D426F64792D616374696F6E732C0D0A2E617065782D';
wwv_flow_api.g_varchar2_table(94) := '736964652D6E6176202E742D426F64792D7469746C65207B0D0A2020746F703A20343870783B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D5254';
wwv_flow_api.g_varchar2_table(95) := '4C29202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A202020206C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A20';
wwv_flow_api.g_varchar2_table(96) := '20202072696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20202E752D52544C202E';
wwv_flow_api.g_varchar2_table(97) := '617065782D736964652D6E6176202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A2020';
wwv_flow_api.g_varchar2_table(98) := '3A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E6176';
wwv_flow_api.g_varchar2_table(99) := '202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032343070783B0D0A20207D0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D6D61696E207B0D0A2020';
wwv_flow_api.g_varchar2_table(100) := '6D617267696E2D6C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E6176202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A20303B0D0A7D0D0A2E617065782D746F702D6E6176202E742D426F';
wwv_flow_api.g_varchar2_table(101) := '64792D616374696F6E73207B0D0A2020746F703A20383870783B0D0A7D0D0A2E617065782D746F702D6E6176202E742D426F64792D7469746C65207B0D0A2020746F703A20383870783B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E';
wwv_flow_api.g_varchar2_table(102) := '6420286D61782D77696474683A20363430707829207B0D0A20202E617065782D746F702D6E61762E6A732D6D656E754E6176436F6C6C6170736564202E742D4865616465722D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C6174';
wwv_flow_api.g_varchar2_table(103) := '6559282D31303025293B0D0A20207D0D0A7D0D0A2E742D426F64792D6E6176207B0D0A202077696474683A2032343070783B0D0A7D0D0A2E742D426F64792D616374696F6E73207B0D0A202077696474683A2032303070783B0D0A7D0D0A3A6E6F74282E';
wwv_flow_api.g_varchar2_table(104) := '752D52544C29202E742D426F64792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0D0A20207472616E73666F726D3A207472616E736C6174653364282D343070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D426F64';
wwv_flow_api.g_varchar2_table(105) := '792D616374696F6E73202E742D427574746F6E2D2D686561646572207B0D0A20207472616E73666F726D3A207472616E736C617465336428343070782C20302C2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E';
wwv_flow_api.g_varchar2_table(106) := '2D77696474683A20363431707829207B0D0A20202E742D426F64792D73696465207B0D0A2020202077696474683A2032343070783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A203634';
wwv_flow_api.g_varchar2_table(107) := '31707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E6176202E742D426F64792D73696465207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E617620';
wwv_flow_api.g_varchar2_table(108) := '2E742D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A7D0D0A2E6E6F2D616E696D202E742D426F64792D6E61762C0D0A2E6E6F2D616E696D202E742D547265654E6176207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(109) := '2D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D73696465';
wwv_flow_api.g_varchar2_table(110) := '2D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D6C6566743A20343870783B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E74';
wwv_flow_api.g_varchar2_table(111) := '2D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A20343870783B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A20';
wwv_flow_api.g_varchar2_table(112) := '207472616E73666F726D3A207472616E736C61746533642831393270782C20302C2030293B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A2020747261';
wwv_flow_api.g_varchar2_table(113) := '6E73666F726D3A207472616E736C6174653364282D31393270782C20302C2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20203A6E6F74282E752D52544C29202E';
wwv_flow_api.g_varchar2_table(114) := '617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7369';
wwv_flow_api.g_varchar2_table(115) := '64652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D';
wwv_flow_api.g_varchar2_table(116) := '52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D7469746C652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D736964';
wwv_flow_api.g_varchar2_table(117) := '652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52';
wwv_flow_api.g_varchar2_table(118) := '544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E';
wwv_flow_api.g_varchar2_table(119) := '6A732D6E6176457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E64';
wwv_flow_api.g_varchar2_table(120) := '6564202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A207472616E736C61746533642832343070782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E617645787061';
wwv_flow_api.g_varchar2_table(121) := '6E646564202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32343070782C20302C2030293B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D';
wwv_flow_api.g_varchar2_table(122) := '77696474683A20363431707829207B0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C652C0D0A20202E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(123) := '61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E742C0D0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D';
wwv_flow_api.g_varchar2_table(124) := '2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D';
wwv_flow_api.g_varchar2_table(125) := '50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D';
wwv_flow_api.g_varchar2_table(126) := '50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E617645787061';
wwv_flow_api.g_varchar2_table(127) := '6E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465';
wwv_flow_api.g_varchar2_table(128) := '642E742D50616765426F64792D2D686964654C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E';
wwv_flow_api.g_varchar2_table(129) := '6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2031393270783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A73';
wwv_flow_api.g_varchar2_table(130) := '2D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2031393270783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E';
wwv_flow_api.g_varchar2_table(131) := '617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20343870783B0D0A20207D0D0A20202E752D';
wwv_flow_api.g_varchar2_table(132) := '52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20343870783B0D0A20207D0D';
wwv_flow_api.g_varchar2_table(133) := '0A20202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D73696465207B0D0A202020207472616E73666F726D3A207472616E736C61746533642832343070782C20302C2030293B0D0A20207D0D0A20202E75';
wwv_flow_api.g_varchar2_table(134) := '2D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E646564202E742D426F64792D73696465207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32343070782C20302C2030293B0D0A20207D0D0A20';
wwv_flow_api.g_varchar2_table(135) := '202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F';
wwv_flow_api.g_varchar2_table(136) := '74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A2020';
wwv_flow_api.g_varchar2_table(137) := '7D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D';
wwv_flow_api.g_varchar2_table(138) := '0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206C6566743A20303B';
wwv_flow_api.g_varchar2_table(139) := '0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A2020202072696768743A20303B0D0A2020';
wwv_flow_api.g_varchar2_table(140) := '7D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C';
wwv_flow_api.g_varchar2_table(141) := '6566743A2032383870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020';
wwv_flow_api.g_varchar2_table(142) := '206D617267696E2D72696768743A2032383870783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64';
wwv_flow_api.g_varchar2_table(143) := '792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C61746533642831393270782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E74';
wwv_flow_api.g_varchar2_table(144) := '2D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D31393270782C20302C2030293B0D0A20207D0D0A20203A6E6F74282E752D52544C';
wwv_flow_api.g_varchar2_table(145) := '29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E61';
wwv_flow_api.g_varchar2_table(146) := '7065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29';
wwv_flow_api.g_varchar2_table(147) := '202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020207472616E73666F726D3A207472616E736C61746533642832343070';
wwv_flow_api.g_varchar2_table(148) := '782C20302C2030293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A20202020747261';
wwv_flow_api.g_varchar2_table(149) := '6E73666F726D3A207472616E736C6174653364282D32343070782C20302C2030293B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0D0A20202E617065782D736964';
wwv_flow_api.g_varchar2_table(150) := '652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C2920';
wwv_flow_api.g_varchar2_table(151) := '2E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D5254';
wwv_flow_api.g_varchar2_table(152) := '4C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20202E61';
wwv_flow_api.g_varchar2_table(153) := '7065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020207472616E73666F726D3A206E6F6E652021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(154) := '207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D6C65';
wwv_flow_api.g_varchar2_table(155) := '66743A2032343070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C65207B0D0A202020206D61';
wwv_flow_api.g_varchar2_table(156) := '7267696E2D72696768743A2032343070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D63';
wwv_flow_api.g_varchar2_table(157) := '6F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2034383070783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C65667420';
wwv_flow_api.g_varchar2_table(158) := '2E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2034383070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D506167';
wwv_flow_api.g_varchar2_table(159) := '65426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E742C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64';
wwv_flow_api.g_varchar2_table(160) := '792D636F6E74656E74207B0D0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A7D0D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E61762C0D0A2E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(161) := '61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176202E742D547265654E6176207B0D0A202077696474683A20343870783B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F';
wwv_flow_api.g_varchar2_table(162) := '6C6C6170736564202E742D426F64792D636F6E74656E742C0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0D0A3A6E6F74282E752D52544C29202E';
wwv_flow_api.g_varchar2_table(163) := '617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A20206D617267696E2D6C6566743A20343870783B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E617643';
wwv_flow_api.g_varchar2_table(164) := '6F6C6C6170736564202E742D426F64792D636F6E74656E742C0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652C0D0A2E752D52544C202E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(165) := '61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A20206D617267696E2D72696768743A20343870783B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61';
wwv_flow_api.g_varchar2_table(166) := '70736564202E742D426F64792D7469746C652E69732D737475636B207B0D0A20206C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C652E6973';
wwv_flow_api.g_varchar2_table(167) := '2D737475636B207B0D0A202072696768743A20303B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170';
wwv_flow_api.g_varchar2_table(168) := '736564202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C61746558282D34387078293B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E';
wwv_flow_api.g_varchar2_table(169) := '742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C617465582834387078293B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E';
wwv_flow_api.g_varchar2_table(170) := '742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D736964652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964';
wwv_flow_api.g_varchar2_table(171) := '652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C';
wwv_flow_api.g_varchar2_table(172) := '6C6170736564202E742D426F64792D7469746C652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D736964652C0D0A20202E752D52544C202E617065782D736964652D6E61';
wwv_flow_api.g_varchar2_table(173) := '762E6A732D6E6176436F6C6C6170736564202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D7769647468';
wwv_flow_api.g_varchar2_table(174) := '3A20363430707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B';
wwv_flow_api.g_varchar2_table(175) := '0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792E6A732D7269676874457870616E646564202E742D42';
wwv_flow_api.g_varchar2_table(176) := '6F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20203A6E6F74282E752D52544C';
wwv_flow_api.g_varchar2_table(177) := '29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E';
wwv_flow_api.g_varchar2_table(178) := '6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C';
wwv_flow_api.g_varchar2_table(179) := '6170736564202E742D426F64792D7469746C65207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D7469746C65207B';
wwv_flow_api.g_varchar2_table(180) := '0D0A2020202072696768743A20343870783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D';
wwv_flow_api.g_varchar2_table(181) := '73696465207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F';
wwv_flow_api.g_varchar2_table(182) := '64792D73696465207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F77';
wwv_flow_api.g_varchar2_table(183) := '4C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032383870783B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642E742D50616765';
wwv_flow_api.g_varchar2_table(184) := '426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032383870783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474';
wwv_flow_api.g_varchar2_table(185) := '683A20393933707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E';
wwv_flow_api.g_varchar2_table(186) := '752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C6170736564202E742D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A7D0D0A2E617065782D736964652D6E61762E6A732D6E6176';
wwv_flow_api.g_varchar2_table(187) := '436F6C6C61707365642D2D68696464656E2E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176207B0D0A202077696474683A20303B0D0A20207669736962696C6974793A2068696464656E3B0D0A7D0D0A2E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(188) := '61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E6A732D6E6176436F6C6C6170736564202E742D426F64792D6E6176202E612D54726565566965772D6261646765207B0D0A20207669736962696C6974793A2068696464656E2021696D';
wwv_flow_api.g_varchar2_table(189) := '706F7274616E743B0D0A7D0D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D6E61762C0D0A2E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D6869';
wwv_flow_api.g_varchar2_table(190) := '6464656E202E742D426F64792D6E6176202E742D547265654E6176207B0D0A202077696474683A2032343070783B0D0A7D0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464';
wwv_flow_api.g_varchar2_table(191) := '656E202E742D426F64792D636F6E74656E742C0D0A3A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C652C0D0A3A6E6F74282E752D52544C';
wwv_flow_api.g_varchar2_table(192) := '29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D73696465207B0D0A20206D617267696E2D6C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D736964652D6E6176';
wwv_flow_api.g_varchar2_table(193) := '2E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D636F6E74656E742C0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D746974';
wwv_flow_api.g_varchar2_table(194) := '6C652C0D0A2E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D73696465207B0D0A20206D617267696E2D72696768743A20303B0D0A7D0D0A3A6E6F74282E752D5254';
wwv_flow_api.g_varchar2_table(195) := '4C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C652E69732D737475636B207B0D0A20206C6566743A20303B0D0A7D0D0A2E752D52544C202E617065782D73696465';
wwv_flow_api.g_varchar2_table(196) := '2D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C652E69732D737475636B207B0D0A202072696768743A20303B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77';
wwv_flow_api.g_varchar2_table(197) := '696474683A20343830707829207B0D0A20202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C61746558283029';
wwv_flow_api.g_varchar2_table(198) := '3B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D6E6176207B0D0A202020207472616E73666F726D3A207472616E736C617465582830293B';
wwv_flow_api.g_varchar2_table(199) := '0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D52544C29202E617065782D7369';
wwv_flow_api.g_varchar2_table(200) := '64652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D736964652C0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E20';
wwv_flow_api.g_varchar2_table(201) := '2E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F6479';
wwv_flow_api.g_varchar2_table(202) := '2D7469746C652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D736964652C0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E';
wwv_flow_api.g_varchar2_table(203) := '6176436F6C6C61707365642D2D68696464656E202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D776964';
wwv_flow_api.g_varchar2_table(204) := '74683A20363430707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D42';
wwv_flow_api.g_varchar2_table(205) := '6F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792E6A732D';
wwv_flow_api.g_varchar2_table(206) := '7269676874457870616E646564202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A203634317078';
wwv_flow_api.g_varchar2_table(207) := '29207B0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D';
wwv_flow_api.g_varchar2_table(208) := '0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C65207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74';
wwv_flow_api.g_varchar2_table(209) := '282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D73';
wwv_flow_api.g_varchar2_table(210) := '6964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A';
wwv_flow_api.g_varchar2_table(211) := '732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E';
wwv_flow_api.g_varchar2_table(212) := '61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A2020202072696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E';
wwv_flow_api.g_varchar2_table(213) := '617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A203234307078';
wwv_flow_api.g_varchar2_table(214) := '3B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E2E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A20202020';
wwv_flow_api.g_varchar2_table(215) := '6D617267696E2D72696768743A2032343070783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0D0A20203A6E6F74282E752D52544C29202E617065782D73696465';
wwv_flow_api.g_varchar2_table(216) := '2D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E61';
wwv_flow_api.g_varchar2_table(217) := '76436F6C6C61707365642D2D68696464656E202E742D426F64792D73696465207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E617065782D736964652D6E61762E6A732D6E6176436F';
wwv_flow_api.g_varchar2_table(218) := '6C6C61707365642D2D68696464656E202E742D426F64792D73696465207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C202E617065782D736964652D6E61762E6A732D6E6176436F6C6C61707365642D2D68696464656E202E';
wwv_flow_api.g_varchar2_table(219) := '742D426F64792D73696465207B0D0A2020202072696768743A20303B0D0A20207D0D0A7D0D0A2E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A2030';
wwv_flow_api.g_varchar2_table(220) := '3B0D0A7D0D0A3A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6D61696E2C0D0A3A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D726967687445787061';
wwv_flow_api.g_varchar2_table(221) := '6E646564202E742D426F64792D6E6176207B0D0A20207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E64656420';
wwv_flow_api.g_varchar2_table(222) := '2E742D426F64792D6D61696E2C0D0A2E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E646564202E742D426F64792D6E6176207B0D0A20207472616E73666F726D3A207472616E736C61746533642832303070782C20302C';
wwv_flow_api.g_varchar2_table(223) := '2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20363431707829207B0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964';
wwv_flow_api.g_varchar2_table(224) := '654C656674202E742D426F64792D6D61696E2C0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6E6176207B0D0A202020207472616E73666F72';
wwv_flow_api.g_varchar2_table(225) := '6D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B0D0A20202020';
wwv_flow_api.g_varchar2_table(226) := '6D617267696E2D72696768743A2032303070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D426F64792D6D61696E207B';
wwv_flow_api.g_varchar2_table(227) := '0D0A202020206D617267696E2D6C6566743A2032303070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D';
wwv_flow_api.g_varchar2_table(228) := '426F64792D7469746C65207B0D0A2020202072696768743A2032303070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D686964654C656674202E742D';
wwv_flow_api.g_varchar2_table(229) := '426F64792D7469746C65207B0D0A202020206C6566743A2032303070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C6566';
wwv_flow_api.g_varchar2_table(230) := '74202E742D426F64792D7469746C65207B0D0A2020202072696768743A20303B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E74';
wwv_flow_api.g_varchar2_table(231) := '2D426F64792D7469746C65207B0D0A202020206C6566743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765';
wwv_flow_api.g_varchar2_table(232) := '426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20303B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E61';
wwv_flow_api.g_varchar2_table(233) := '76436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D72696768743A20303B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64';
wwv_flow_api.g_varchar2_table(234) := '792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206C6566743A20303B0D0A20207D0D0A20202E752D52544C20';
wwv_flow_api.g_varchar2_table(235) := '2E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A2020202072696768743A20303B0D0A20207D';
wwv_flow_api.g_varchar2_table(236) := '0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20393933707829207B0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765';
wwv_flow_api.g_varchar2_table(237) := '426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D72696768743A2032303070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E';
wwv_flow_api.g_varchar2_table(238) := '742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020206D617267696E2D6C6566743A2032303070783B0D0A20207D0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D';
wwv_flow_api.g_varchar2_table(239) := '50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E2C0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6E6176207B0D';
wwv_flow_api.g_varchar2_table(240) := '0A202020207472616E73666F726D3A206E6F6E653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F6479';
wwv_flow_api.g_varchar2_table(241) := '2D7469746C65207B0D0A2020202072696768743A2032303070783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F6479';
wwv_flow_api.g_varchar2_table(242) := '2D7469746C65207B0D0A202020206C6566743A2032303070783B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C61707365642E742D5061676542';
wwv_flow_api.g_varchar2_table(243) := '6F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206C6566743A20343870783B0D0A20207D0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E6A732D6E6176436F6C6C';
wwv_flow_api.g_varchar2_table(244) := '61707365642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A2020202072696768743A20343870783B0D0A20207D0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D776964';
wwv_flow_api.g_varchar2_table(245) := '74683A20393932707829207B0D0A20202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D6D61696E207B0D0A202020207472616E73666F726D3A206E6F6E';
wwv_flow_api.g_varchar2_table(246) := '653B0D0A20207D0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0D0A20203A6E6F74282E752D';
wwv_flow_api.g_varchar2_table(247) := '52544C29202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D736964652C0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D';
wwv_flow_api.g_varchar2_table(248) := '7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A20207D';
wwv_flow_api.g_varchar2_table(249) := '0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D7469746C652C0D0A20202E752D52544C202E742D50616765426F64792E6A73';
wwv_flow_api.g_varchar2_table(250) := '2D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D736964652C0D0A20202E752D52544C202E742D50616765426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D';
wwv_flow_api.g_varchar2_table(251) := '2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0D0A20207D0D0A20202E742D50616765426F64792E6A732D72696768744578';
wwv_flow_api.g_varchar2_table(252) := '70616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20343870782021696D706F7274616E743B0D0A20207D0D0A20202E752D52544C202E742D50616765';
wwv_flow_api.g_varchar2_table(253) := '426F64792E6A732D7269676874457870616E6465642E742D50616765426F64792D2D73686F774C656674202E742D426F64792D73696465207B0D0A202020206D617267696E2D6C6566743A20302021696D706F7274616E743B0D0A202020207269676874';
wwv_flow_api.g_varchar2_table(254) := '3A20343870782021696D706F7274616E743B0D0A20207D0D0A7D0D0A2E742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D6D61696E207B0D0A20206D617267696E2D72696768743A203070783B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(255) := '742D50616765426F64792E6A732D7269676874436F6C6C6170736564202E742D426F64792D7469746C65207B0D0A202072696768743A203070783B0D0A7D0D0A3A6E6F74282E752D52544C29202E742D50616765426F64792E6A732D7269676874436F6C';
wwv_flow_api.g_varchar2_table(256) := '6C6170736564202E742D426F64792D616374696F6E73207B0D0A20207472616E73666F726D3A207472616E736C61746533642832303070782C20302C2030293B0D0A7D0D0A2E752D52544C202E742D50616765426F64792E6A732D7269676874436F6C6C';
wwv_flow_api.g_varchar2_table(257) := '6170736564202E742D426F64792D616374696F6E73207B0D0A20207472616E73666F726D3A207472616E736C6174653364282D32303070782C20302C2030293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D776964';
wwv_flow_api.g_varchar2_table(258) := '74683A20363431707829207B0D0A20203A6E6F74282E752D52544C29202E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D6C6566743A2032343070783B0D0A20207D0D0A';
wwv_flow_api.g_varchar2_table(259) := '20202E752D52544C202E742D50616765426F64792D2D73686F774C656674202E742D426F64792D636F6E74656E74207B0D0A202020206D617267696E2D72696768743A2032343070783B0D0A20207D0D0A7D0D0A2E742D426F64792D636F6E74656E7449';
wwv_flow_api.g_varchar2_table(260) := '6E6E6572207B0D0A20206D617267696E3A2030206175746F3B0D0A20206D61782D77696474683A20313030253B0D0A7D0D0A23745F426F64795F736B6970546F436F6E74656E74207B0D0A2020636F6C6F723A20233030373664663B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(261) := '67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D42726561646372756D622D6974656D3A6166746572207B0D0A2020636F6C6F723A20726762612833362C2033362C2033362C20302E3735293B0D0A7D0D0A2E742D4272656164';
wwv_flow_api.g_varchar2_table(262) := '6372756D622D6974656D2C0D0A2E742D42726561646372756D622D6974656D2061207B0D0A2020636F6C6F723A20233537353735373B0D0A7D0D0A2E742D42726561646372756D622D6974656D20613A686F7665722C0D0A2E742D42726561646372756D';
wwv_flow_api.g_varchar2_table(263) := '622D6974656D20613A666F637573207B0D0A2020636F6C6F723A20233030366564303B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E742D426F64792D746974';
wwv_flow_api.g_varchar2_table(264) := '6C652D736872696E6B202E742D42726561646372756D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D426F64792D7469746C652D736872696E';
wwv_flow_api.g_varchar2_table(265) := '6B202E742D42726561646372756D62526567696F6E2D2D757365526567696F6E5469746C65202E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A406D6564696120';
wwv_flow_api.g_varchar2_table(266) := '6F6E6C792073637265656E20616E6420286D61782D77696474683A20363430707829207B0D0A20202E742D42726561646372756D62526567696F6E2D2D757365526567696F6E5469746C65202E742D42726561646372756D62526567696F6E2D7469746C';
wwv_flow_api.g_varchar2_table(267) := '6554657874207B0D0A20202020636F6C6F723A20233234323432343B0D0A20207D0D0A7D0D0A2E742D42726561646372756D622D6974656D202E742D49636F6E3A686F766572207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D42';
wwv_flow_api.g_varchar2_table(268) := '726561646372756D62526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D42726561646372756D62526567696F6E2D7469746C6554657874207B0D0A';
wwv_flow_api.g_varchar2_table(269) := '2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D426F64792D7469746C65202E742D42726561646372756D622D6974656D3A6166746572207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3735293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(270) := '0A2E742D426F64792D7469746C65202E742D42726561646372756D622D6974656D2C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D622D6974656D20612C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D62';
wwv_flow_api.g_varchar2_table(271) := '526567696F6E2D2D75736542726561646372756D625469746C65202E742D42726561646372756D622D6974656D2E69732D6163746976652C0D0A2E742D426F64792D7469746C65202E742D42726561646372756D62526567696F6E2D7469746C65546578';
wwv_flow_api.g_varchar2_table(272) := '74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D427574746F6E2C0D0A2E612D427574746F6E2C0D0A2E75692D627574746F6E207B0D0A2020626F726465723A206E6F6E653B0D0A2020746578742D736861646F773A206E6F6E';
wwv_flow_api.g_varchar2_table(273) := '653B0D0A2020626F726465722D7261646975733A203270783B0D0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E327320656173652C20626F782D736861646F7720302E327320656173652C20636F6C6F7220302E32';
wwv_flow_api.g_varchar2_table(274) := '7320656173653B0D0A7D0D0A2E742D427574746F6E202E742D49636F6E2C0D0A2E612D427574746F6E202E742D49636F6E2C0D0A2E75692D627574746F6E202E742D49636F6E207B0D0A20207472616E736974696F6E3A20696E68657269743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(275) := '0A2E742D427574746F6E3A686F7665722C0D0A2E612D427574746F6E3A686F7665722C0D0A2E75692D627574746F6E3A686F7665722C0D0A2E742D427574746F6E3A666F6375732C0D0A2E612D427574746F6E3A666F6375732C0D0A2E75692D62757474';
wwv_flow_api.g_varchar2_table(276) := '6F6E3A666F637573207B0D0A20207A2D696E6465783A203130303B0D0A20206F75746C696E653A206E6F6E652021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E3A666F6375733A6265666F72652C0D0A2E612D427574746F6E3A666F6375';
wwv_flow_api.g_varchar2_table(277) := '733A6265666F72652C0D0A2E75692D627574746F6E3A666F6375733A6265666F72652C0D0A2E742D427574746F6E2E69732D6163746976653A666F6375733A6265666F72652C0D0A2E612D427574746F6E2E69732D6163746976653A666F6375733A6265';
wwv_flow_api.g_varchar2_table(278) := '666F72652C0D0A2E75692D627574746F6E2E69732D6163746976653A666F6375733A6265666F7265207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742021696D706F7274616E743B0D0A20206F7061';
wwv_flow_api.g_varchar2_table(279) := '636974793A20313B0D0A7D0D0A2E742D427574746F6E3A666F6375733A6163746976653A6265666F72652C0D0A2E612D427574746F6E3A666F6375733A6163746976653A6265666F72652C0D0A2E75692D627574746F6E3A666F6375733A616374697665';
wwv_flow_api.g_varchar2_table(280) := '3A6265666F72652C0D0A2E742D427574746F6E2E69732D6163746976653A666F6375733A6163746976653A6265666F72652C0D0A2E612D427574746F6E2E69732D6163746976653A666F6375733A6163746976653A6265666F72652C0D0A2E75692D6275';
wwv_flow_api.g_varchar2_table(281) := '74746F6E2E69732D6163746976653A666F6375733A6163746976653A6265666F7265207B0D0A20206F7061636974793A20303B0D0A7D0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A6E6F74282E742D427574746F6E';
wwv_flow_api.g_varchar2_table(282) := '2D2D686561646572293A6163746976652C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A6E6F74282E742D427574746F6E2D2D686561646572292E69732D616374697665207B0D0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(283) := '302030203020317078207267626128302C20302C20302C20302E31352920696E7365742C20302032707820327078207267626128302C20302C20302C20302E31352920696E7365742021696D706F7274616E743B0D0A7D0D0A2E612D427574746F6E3A62';
wwv_flow_api.g_varchar2_table(284) := '65666F72652C0D0A2E742D427574746F6E3A6265666F72652C0D0A2E75692D627574746F6E3A6265666F72652C0D0A2E612D427574746F6E3A61667465722C0D0A2E742D427574746F6E3A61667465722C0D0A2E75692D627574746F6E3A616674657220';
wwv_flow_api.g_varchar2_table(285) := '7B0D0A2020636F6E74656E743A2027273B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020746F703A20303B0D0A20206C6566743A20303B0D0A202077696474683A20313030253B0D0A20206865696768743A20313030253B0D0A2020';
wwv_flow_api.g_varchar2_table(286) := '626F726465722D7261646975733A20696E68657269743B0D0A20206F7061636974793A20303B0D0A20207472616E736974696F6E3A20302E327320656173653B0D0A7D0D0A2E612D427574746F6E3A6265666F72652C0D0A2E742D427574746F6E3A6265';
wwv_flow_api.g_varchar2_table(287) := '666F72652C0D0A2E75692D627574746F6E3A6265666F7265207B0D0A20207A2D696E6465783A20313B0D0A7D0D0A2E612D427574746F6E3A61667465722C0D0A2E742D427574746F6E3A61667465722C0D0A2E75692D627574746F6E3A6166746572207B';
wwv_flow_api.g_varchar2_table(288) := '0D0A20207A2D696E6465783A202D313B0D0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E303735293B0D0A20207472616E73666F726D3A207472616E736C61746559282D327078293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(289) := '2E612D427574746F6E3A666F6375733A61667465722C0D0A2E742D427574746F6E3A666F6375733A61667465722C0D0A2E75692D627574746F6E3A666F6375733A61667465722C0D0A2E612D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C69';
wwv_flow_api.g_varchar2_table(290) := '6E6B293A686F7665723A61667465722C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A686F7665723A61667465722C0D0A2E75692D627574746F6E3A6E6F74282E742D427574746F6E2D2D6C696E6B293A686F766572';
wwv_flow_api.g_varchar2_table(291) := '3A6166746572207B0D0A20206F7061636974793A20313B0D0A20207472616E73666F726D3A207472616E736C617465592830293B0D0A7D0D0A2E612D427574746F6E3A666F6375733A6163746976653A61667465722C0D0A2E742D427574746F6E3A666F';
wwv_flow_api.g_varchar2_table(292) := '6375733A6163746976653A61667465722C0D0A2E75692D627574746F6E3A666F6375733A6163746976653A6166746572207B0D0A20206F7061636974793A20303B0D0A20207472616E73666F726D3A207472616E736C61746559282D327078293B0D0A7D';
wwv_flow_api.g_varchar2_table(293) := '0D0A2E612D427574746F6E3A666F6375733A61667465722C0D0A2E742D427574746F6E3A666F6375733A61667465722C0D0A2E75692D627574746F6E3A666F6375733A6166746572207B0D0A20207472616E73666F726D3A207472616E736C6174655928';
wwv_flow_api.g_varchar2_table(294) := '30293B0D0A2020626F782D736861646F773A203020302031707820317078207267626128302C203131382C203232332C20302E3235293B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570';
wwv_flow_api.g_varchar2_table(295) := '202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C2C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D7369';
wwv_flow_api.g_varchar2_table(296) := '6D706C65292C0D0A2E75692D627574746F6E2C0D0A2E612D427574746F6E2C0D0A2E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F56207B0D0A2020636F6C6F723A20233338333833383B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(297) := '6F723A20236638663866383B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F42';
wwv_flow_api.g_varchar2_table(298) := '7574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A686F7665722C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C3A686F7665722C0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(299) := '74746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A686F7665722C0D0A2E75692D627574746F6E3A686F7665722C0D0A2E612D427574746F6E3A686F7665722C0D0A2E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F';
wwv_flow_api.g_varchar2_table(300) := '563A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A7D0D0A2E742D46';
wwv_flow_api.g_varchar2_table(301) := '6F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A666F6375732C0D0A2E617065782D627574746F6E2D67726F75702069';
wwv_flow_api.g_varchar2_table(302) := '6E707574202B206C6162656C3A666F6375732C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A666F6375732C0D0A2E75692D627574746F6E3A666F6375732C0D0A2E612D427574746F6E3A666F6375732C0D0A2E';
wwv_flow_api.g_varchar2_table(303) := '612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F563A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F42';
wwv_flow_api.g_varchar2_table(304) := '7574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C2E69732D6163746976652C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C2E69732D616374697665';
wwv_flow_api.g_varchar2_table(305) := '2C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65292E69732D6163746976652C0D0A2E75692D627574746F6E2E69732D6163746976652C0D0A2E612D427574746F6E2E69732D6163746976652C0D0A2E612D42757474';
wwv_flow_api.g_varchar2_table(306) := '6F6E2E612D427574746F6E2D2D706F7075704C4F562E69732D6163746976652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075';
wwv_flow_api.g_varchar2_table(307) := '74202B206C6162656C3A6163746976652C0D0A2E617065782D627574746F6E2D67726F757020696E707574202B206C6162656C3A6163746976652C0D0A2E742D427574746F6E3A6E6F74282E742D427574746F6E2D2D73696D706C65293A616374697665';
wwv_flow_api.g_varchar2_table(308) := '2C0D0A2E75692D627574746F6E3A6163746976652C0D0A2E612D427574746F6E3A6163746976652C0D0A2E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F563A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(309) := '20236465646564653B0D0A7D0D0A2E75692D627574746F6E3A686F766572207B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E6170';
wwv_flow_api.g_varchar2_table(310) := '65782D6974656D2D67726964207B0D0A20206261636B67726F756E642D636F6C6F723A20236438643864383B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D72616469';
wwv_flow_api.g_varchar2_table(311) := '6F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A616374697665202B206C6162656C2C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E61';
wwv_flow_api.g_varchar2_table(312) := '7065782D6974656D2D67726F75702D2D726320696E7075743A666F6375733A6E6F74283A636865636B656429202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A616374697665202B206C6162656C2C0D0A2E6170';
wwv_flow_api.g_varchar2_table(313) := '65782D627574746F6E2D67726F757020696E7075743A666F6375733A6E6F74283A636865636B656429202B206C6162656C207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742C203020302030203270';
wwv_flow_api.g_varchar2_table(314) := '78202366396639663920696E7365742021696D706F7274616E743B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D';
wwv_flow_api.g_varchar2_table(315) := '726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B65643A666F637573202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F757020696E7075743A636865636B6564';
wwv_flow_api.g_varchar2_table(316) := '3A666F637573202B206C6162656C207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742C20302030203020327078202366396639663920696E7365742021696D706F7274616E743B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(317) := '466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726F75702D2D726320696E7075743A636865636B6564202B206C6162656C2C0D0A2E617065782D627574746F6E2D67726F75';
wwv_flow_api.g_varchar2_table(318) := '7020696E7075743A636865636B6564202B206C6162656C207B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(319) := '0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E612D427574746F6E2D2D686F742C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65292C0D0A626F6479202E75692D627574746F6E2E75';
wwv_flow_api.g_varchar2_table(320) := '692D627574746F6E2D2D686F742C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D617279207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(321) := '20236666666666663B0D0A7D0D0A2E612D427574746F6E2D2D686F743A686F7665722C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65293A686F7665722C0D0A626F6479202E75692D627574746F6E2E75';
wwv_flow_api.g_varchar2_table(322) := '692D627574746F6E2D2D686F743A686F7665722C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A686F7665722C0D0A2E612D427574746F6E2D2D686F743A6E6F74283A61637469766529';
wwv_flow_api.g_varchar2_table(323) := '3A666F6375732C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74283A616374697665293A666F6375732C0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F743A6E';
wwv_flow_api.g_varchar2_table(324) := '6F74283A616374697665293A666F6375732C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(325) := '6C6F723A20233030383366393B0D0A7D0D0A2E612D427574746F6E2D2D686F743A6163746976652C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65293A6163746976652C0D0A626F6479202E75692D6275';
wwv_flow_api.g_varchar2_table(326) := '74746F6E2E75692D627574746F6E2D2D686F743A6163746976652C0D0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172793A6163746976652C0D0A2E612D427574746F6E2D2D686F742E69732D61';
wwv_flow_api.g_varchar2_table(327) := '63746976652C0D0A2E742D427574746F6E2D2D686F743A6E6F74282E742D427574746F6E2D2D73696D706C65292E69732D6163746976652C0D0A626F6479202E75692D627574746F6E2E75692D627574746F6E2D2D686F742E69732D6163746976652C0D';
wwv_flow_api.g_varchar2_table(328) := '0A626F6479202E75692D73746174652D64656661756C742E75692D7072696F726974792D7072696D6172792E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233030363963363B0D0A7D0D0A626F6479202E75692D62';
wwv_flow_api.g_varchar2_table(329) := '7574746F6E2E75692D627574746F6E2D2D686F74207B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D4275';
wwv_flow_api.g_varchar2_table(330) := '74746F6E2D2D686F7429207B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F';
wwv_flow_api.g_varchar2_table(331) := '7665722C0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(332) := '6E642D636F6C6F723A20236663646337633B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D7761';
wwv_flow_api.g_varchar2_table(333) := '726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D73696D706C65293A';
wwv_flow_api.g_varchar2_table(334) := '6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A7D0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(335) := '73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E';
wwv_flow_api.g_varchar2_table(336) := '742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F';
wwv_flow_api.g_varchar2_table(337) := '637573207B0D0A20206261636B67726F756E642D636F6C6F723A20233432626533313B0D0A7D0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74';
wwv_flow_api.g_varchar2_table(338) := '292C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F6E2D2D737563636573733A6E6F74282E74';
wwv_flow_api.g_varchar2_table(339) := '2D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132433B0D0A7D0D0A2E742D427574746F6E2D2D64616E676572';
wwv_flow_api.g_varchar2_table(340) := '3A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E';
wwv_flow_api.g_varchar2_table(341) := '2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6E';
wwv_flow_api.g_varchar2_table(342) := '6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236635356134653B0D0A7D0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E';
wwv_flow_api.g_varchar2_table(343) := '742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A6163746976652C0D0A2E742D427574746F6E2D2D6461';
wwv_flow_api.g_varchar2_table(344) := '6E6765723A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A7D0D0A2E742D427574';
wwv_flow_api.g_varchar2_table(345) := '746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020636F6C6F723A20233030313832643B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172793A';
wwv_flow_api.g_varchar2_table(346) := '6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D';
wwv_flow_api.g_varchar2_table(347) := '427574746F6E2D2D686F74293A6E6F74283A616374697665293A666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A20236336653466663B0D0A7D0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E';
wwv_flow_api.g_varchar2_table(348) := '2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74293A616374697665';
wwv_flow_api.g_varchar2_table(349) := '2C0D0A2E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D73696D706C65293A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A202361';
wwv_flow_api.g_varchar2_table(350) := '63643866663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F7428';
wwv_flow_api.g_varchar2_table(351) := '2E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D7761726E696E6729207B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A2020636F6C6F723A20233430343034303B0D0A2020626F';
wwv_flow_api.g_varchar2_table(352) := '782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574';
wwv_flow_api.g_varchar2_table(353) := '746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D7761726E696E67293A686F7665722C0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(354) := '6F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F74282E742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373';
wwv_flow_api.g_varchar2_table(355) := '293A6E6F74282E742D427574746F6E2D2D7761726E696E67293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C653A6E6F74282E742D427574746F6E2D2D686F74293A6E6F74282E742D427574746F6E2D2D64616E676572293A6E6F74282E';
wwv_flow_api.g_varchar2_table(356) := '742D427574746F6E2D2D7072696D617279293A6E6F74282E742D427574746F6E2D2D73756363657373293A6E6F74282E742D427574746F6E2D2D7761726E696E67292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(357) := '236536653665363B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F74207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(358) := '2D636F6C6F723A20234646464646463B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F742C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F74202E742D49636F6E207B0D0A2020';
wwv_flow_api.g_varchar2_table(359) := '636F6C6F723A20233030373664663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A666F6375732C0D0A';
wwv_flow_api.g_varchar2_table(360) := '2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F742E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(361) := '427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A666F637573202E742D49636F6E2C0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(362) := '6F6E2D2D73696D706C652E742D427574746F6E2D2D686F742E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D';
wwv_flow_api.g_varchar2_table(363) := '6172793A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030203020317078202361636438666620696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(364) := '2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E74';
wwv_flow_api.g_varchar2_table(365) := '2D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20233264396366663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F';
wwv_flow_api.g_varchar2_table(366) := '74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F';
wwv_flow_api.g_varchar2_table(367) := '6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236163643866663B0D0A2020636F6C6F723A20233030313832643B0D0A7D0D0A2E742D42';
wwv_flow_api.g_varchar2_table(368) := '7574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D';
wwv_flow_api.g_varchar2_table(369) := '6172793A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A6E6F74282E742D427574746F6E2D2D686F74292E69732D61';
wwv_flow_api.g_varchar2_table(370) := '6374697665202E742D49636F6E207B0D0A2020636F6C6F723A20233030313832643B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020';
wwv_flow_api.g_varchar2_table(371) := '626F782D736861646F773A20302030203020317078202346424345344120696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D77';
wwv_flow_api.g_varchar2_table(372) := '61726E696E673A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F';
wwv_flow_api.g_varchar2_table(373) := '6C6F723A20236331393130343B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E';
wwv_flow_api.g_varchar2_table(374) := '742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74';
wwv_flow_api.g_varchar2_table(375) := '292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E69';
wwv_flow_api.g_varchar2_table(376) := '6E673A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74293A666F637573';
wwv_flow_api.g_varchar2_table(377) := '202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7761726E696E673A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20233434';
wwv_flow_api.g_varchar2_table(378) := '333330323B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030203020317078202366343433333620';
wwv_flow_api.g_varchar2_table(379) := '696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E74';
wwv_flow_api.g_varchar2_table(380) := '2D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20236634343333363B0D0A7D0D0A2E742D427574746F6E2D2D73696D';
wwv_flow_api.g_varchar2_table(381) := '706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D68';
wwv_flow_api.g_varchar2_table(382) := '6F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(383) := '236634343333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E';
wwv_flow_api.g_varchar2_table(384) := '2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E';
wwv_flow_api.g_varchar2_table(385) := '2D2D64616E6765723A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(386) := '737563636573733A6E6F74282E742D427574746F6E2D2D686F7429207B0D0A2020626F782D736861646F773A20302030203020317078202333424141324320696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D';
wwv_flow_api.g_varchar2_table(387) := '0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74292C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F';
wwv_flow_api.g_varchar2_table(388) := '74282E742D427574746F6E2D2D686F7429202E742D49636F6E207B0D0A2020636F6C6F723A20233362616132633B0D0A7D0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E';
wwv_flow_api.g_varchar2_table(389) := '2D2D686F74293A686F7665722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74293A666F6375732C0D0A2E742D427574746F6E2D2D73696D706C652E742D42';
wwv_flow_api.g_varchar2_table(390) := '7574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74292E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132433B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(391) := '2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74293A686F766572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(392) := '737563636573733A6E6F74282E742D427574746F6E2D2D686F74293A666F637573202E742D49636F6E2C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A6E6F74282E742D427574746F6E2D2D686F74292E';
wwv_flow_api.g_varchar2_table(393) := '69732D616374697665202E742D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2D2D6E6F5549207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F72';
wwv_flow_api.g_varchar2_table(394) := '74616E743B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55493A6E6F74283A686F766572293A6E6F74283A666F637573293A6E6F74282E69732D61637469766529207B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(395) := '6F6E2D2D6E6F55493A686F7665722C0D0A2E742D427574746F6E2D2D6E6F55493A666F6375732C0D0A2E742D427574746F6E2D2D6E6F55492E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A';
wwv_flow_api.g_varchar2_table(396) := '7D0D0A2E742D427574746F6E2D2D6E6F55493A666F6375733A686F766572207B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(397) := '2D6C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A2020626F782D736861646F773A206E6F6E652021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(398) := '6C696E6B3A686F766572207B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2C0D0A2E742D427574746F6E2D2D6C696E6B202E742D49636F6E207B';
wwv_flow_api.g_varchar2_table(399) := '0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F742C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D686F74202E742D49636F6E207B0D0A202063';
wwv_flow_api.g_varchar2_table(400) := '6F6C6F723A20233030373664663B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7072696D6172792C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7072696D6172792C0D0A2E742D427574746F6E';
wwv_flow_api.g_varchar2_table(401) := '2D2D6E6F55492E742D427574746F6E2D2D7072696D617279202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7072696D617279202E742D49636F6E207B0D0A2020636F6C6F723A20233264396366662021696D';
wwv_flow_api.g_varchar2_table(402) := '706F7274616E743B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7761726E696E672C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7761726E696E672C0D0A2E742D427574746F6E2D2D6E6F5549';
wwv_flow_api.g_varchar2_table(403) := '2E742D427574746F6E2D2D7761726E696E67202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D7761726E696E67202E742D49636F6E207B0D0A2020636F6C6F723A20236331393130342021696D706F7274616E';
wwv_flow_api.g_varchar2_table(404) := '743B0D0A7D0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D64616E6765722C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D64616E6765722C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F';
wwv_flow_api.g_varchar2_table(405) := '6E2D2D64616E676572202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D64616E676572202E742D49636F6E207B0D0A2020636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(406) := '427574746F6E2D2D6E6F55492E742D427574746F6E2D2D737563636573732C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D737563636573732C0D0A2E742D427574746F6E2D2D6E6F55492E742D427574746F6E2D2D7375636365';
wwv_flow_api.g_varchar2_table(407) := '7373202E742D49636F6E2C0D0A2E742D427574746F6E2D2D6C696E6B2E742D427574746F6E2D2D73756363657373202E742D49636F6E207B0D0A2020636F6C6F723A20233362616132632021696D706F7274616E743B0D0A7D0D0A2E742D486561646572';
wwv_flow_api.g_varchar2_table(408) := '2D6272616E64696E67202E742D427574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D686561646572207B0D0A2020626F726465722D72';
wwv_flow_api.g_varchar2_table(409) := '61646975733A203270783B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A6265666F72652C0D0A2E742D427574746F6E2E742D427574746F6E2D2D68';
wwv_flow_api.g_varchar2_table(410) := '65616465723A6163746976653A666F6375733A6265666F7265207B0D0A2020626F782D736861646F773A20302030203020317078202332643963666620696E7365742021696D706F7274616E743B0D0A7D0D0A2E742D427574746F6E2E742D427574746F';
wwv_flow_api.g_varchar2_table(411) := '6E2D2D6865616465723A686F7665722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375732C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A616374697665207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(412) := '6E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31';
wwv_flow_api.g_varchar2_table(413) := '293B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A6163746976652C0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465723A666F6375733A616374697665207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(414) := '6F6C6F723A207267626128302C20302C20302C20302E34293B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C';
wwv_flow_api.g_varchar2_table(415) := '20302C20302E3235293B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D68656164657254726565207B0D0A20206D696E2D77696474683A20333270783B0D0A7D0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(416) := '6F6E2E742D427574746F6E2D2D686561646572547265653A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202332643963666620696E7365743B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E642028';
wwv_flow_api.g_varchar2_table(417) := '6D61782D77696474683A20343830707829207B0D0A20202E742D427574746F6E2E742D427574746F6E2D2D68656164657254726565207B0D0A202020206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D';
wwv_flow_api.g_varchar2_table(418) := '0A20207D0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6865616465725269676874207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465723A2031707820736F6C696420236530653065';
wwv_flow_api.g_varchar2_table(419) := '303B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D68656164657252696768743A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236530653065303B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(420) := '2D68656164657252696768743A6163746976652C0D0A2E742D427574746F6E2E742D427574746F6E2D2D68656164657252696768742E69732D616374697665207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(421) := '6E6176426172202E742D427574746F6E2D6261646765207B0D0A2020626F726465722D7261646975733A20313670783B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3335293B0D0A7D0D0A2E742D4275';
wwv_flow_api.g_varchar2_table(422) := '74746F6E2D2D68656C70427574746F6E202E612D49636F6E207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A2E742D4865616465722D6E6176426172202E742D427574746F6E2D2D6865616465722E69732D616374697665207B0D0A20206261';
wwv_flow_api.g_varchar2_table(423) := '636B67726F756E642D636F6C6F723A20233030346539333B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D427574746F6E2E742D427574746F6E2D2D6E6F5549202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574';
wwv_flow_api.g_varchar2_table(424) := '746F6E2D2D6C696E6B202E66613A61667465722C0D0A2E742D427574746F6E2E742D427574746F6E2D2D73696D706C65202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234646463B0D0A7D0D0A2E742D427574746F';
wwv_flow_api.g_varchar2_table(425) := '6E2D2D64616E676572202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D64616E6765723A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A2023663434';
wwv_flow_api.g_varchar2_table(426) := '3333363B0D0A7D0D0A2E742D427574746F6E2D2D73756363657373202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D737563636573733A686F766572202E66613A6166746572207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(427) := '6B67726F756E642D636F6C6F723A20233342414132433B0D0A7D0D0A2E742D427574746F6E2D2D7072696D617279202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D427574746F6E2D2D7072696D6172793A686F766572';
wwv_flow_api.g_varchar2_table(428) := '202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236163643866663B0D0A7D0D0A2E742D427574746F6E2D2D7761726E696E67202E66613A61667465722C0D0A2E742D427574746F6E2D2D73696D706C652E742D4275';
wwv_flow_api.g_varchar2_table(429) := '74746F6E2D2D7761726E696E673A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A7D0D0A2E742D427574746F6E2D2D686F74202E66613A61667465722C0D0A2E742D42757474';
wwv_flow_api.g_varchar2_table(430) := '6F6E2D2D73696D706C652E742D427574746F6E2D2D686F743A686F766572202E66613A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D426F64792D616374696F6E73546F67676C65207B';
wwv_flow_api.g_varchar2_table(431) := '0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A2020626F726465722D72696768742D636F6C6F723A207472616E737061';
wwv_flow_api.g_varchar2_table(432) := '72656E743B0D0A2020636F6C6F723A20696E697469616C3B0D0A7D0D0A2E752D52544C202E742D426F64792D616374696F6E73546F67676C65207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A';
wwv_flow_api.g_varchar2_table(433) := '2020626F726465722D6C6566742D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73546F67676C653A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236530653065303B0D0A';
wwv_flow_api.g_varchar2_table(434) := '7D0D0A2E742D426F64792D616374696F6E73546F67676C653A666F6375732C0D0A2E742D426F64792D616374696F6E73546F67676C653A616374697665207B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D427574';
wwv_flow_api.g_varchar2_table(435) := '746F6E526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(436) := '207267626128302C20302C20302C20302E303735293B0D0A2020626F782D736861646F773A20302032707820327078207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D6E6F5549207B0D0A2020';
wwv_flow_api.g_varchar2_table(437) := '6261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D77697A6172642C0D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(438) := '65722D7261646975733A2030203020327078203270783B0D0A7D0D0A2E742D427574746F6E526567696F6E2D2D6469616C6F67526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(439) := '2D426F6479202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F64792D7469746C65202E742D427574';
wwv_flow_api.g_varchar2_table(440) := '746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E742D427574746F6E526567696F6E2D2D7368';
wwv_flow_api.g_varchar2_table(441) := '6F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F';
wwv_flow_api.g_varchar2_table(442) := '6E526567696F6E2D7469746C652C0D0A2E742D427574746F6E526567696F6E202E742D427574746F6E526567696F6E2D2D73686F775469746C65202E742D427574746F6E526567696F6E2D7469746C65207B0D0A2020636F6C6F723A2023343034303430';
wwv_flow_api.g_varchar2_table(443) := '3B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D427574746F6E526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F726465722D7261646975733A20303B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(444) := '742D4469616C6F672D666F6F746572202E742D427574746F6E526567696F6E207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E66632E75692D776964676574207B0D0A202062';
wwv_flow_api.g_varchar2_table(445) := '61636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E66632D746F6F6C626172207B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(446) := '0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E66632D746F6F6C6261722068322C0D0A2E6663202E66632D62617369632D766965772074642E66632D6461792D6E756D6265722C0D0A2E6663202E66632D6461';
wwv_flow_api.g_varchar2_table(447) := '792D6E756D626572207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E66632D6461792D6865616465722E75692D7769646765742D6865616465722C0D0A2E66632D76696577202E75692D7769646765742D686561646572207B0D0A2020';
wwv_flow_api.g_varchar2_table(448) := '6261636B67726F756E642D636F6C6F723A20236632663266323B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A6469762E66632D6167656E64614C697374207B0D0A202062';
wwv_flow_api.g_varchar2_table(449) := '61636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E6663202E66632D6167656E64614C6973742D646179486561';
wwv_flow_api.g_varchar2_table(450) := '646572207B0D0A20206261636B67726F756E642D636F6C6F723A20236439643964393B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D636F6C6F723A20236661666166613B0D0A7D0D0A2E6663202E66632D6167656E64614C';
wwv_flow_api.g_varchar2_table(451) := '6973742D646179207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E6663202E66632D6167656E64614C6973742D64617465207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E6663202E66632D6167656E64614C697374';
wwv_flow_api.g_varchar2_table(452) := '202E66632D6576656E742D73746172742D74696D652C0D0A2E6663202E66632D6167656E64614C697374202E66632D6576656E742D616C6C2D646179207B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A626F6479202E66632074642E6663';
wwv_flow_api.g_varchar2_table(453) := '2D746F6461792C0D0A626F6479202E6663202E75692D7769646765742D636F6E74656E74207B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D776964';
wwv_flow_api.g_varchar2_table(454) := '6765742D636F6E74656E742E66632D746F6461792E75692D73746174652D686967686C69676874207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E6663202E66632D6167656E64614C6973742D6974656D20';
wwv_flow_api.g_varchar2_table(455) := '7B0D0A2020626F726465722D636F6C6F723A20236661666166613B0D0A7D0D0A2E6663202E75692D627574746F6E3A6163746976652C0D0A2E6663202E75692D627574746F6E3A666F6375732C0D0A2E66632D766965773A6163746976652C0D0A2E6663';
wwv_flow_api.g_varchar2_table(456) := '2D766965773A666F637573207B0D0A20206F75746C696E653A2031707820736F6C696420233030373664663B0D0A7D0D0A2E66632D766965772D636F6E7461696E6572203E202E66632D766965773A6163746976652C0D0A2E66632D766965772D636F6E';
wwv_flow_api.g_varchar2_table(457) := '7461696E6572203E202E66632D766965773A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E742D43617264207B0D0A2020626F782D736861646F773A20302032707820347078202D327078207267626128302C20302C2030';
wwv_flow_api.g_varchar2_table(458) := '2C20302E303735293B0D0A7D0D0A2E742D436172642D77726170207B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(459) := '67626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D436172642D777261703A666F637573207B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D436172642D69636F6E207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(460) := '20236666666666663B0D0A7D0D0A2E742D436172642D64657363207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436172642D696E666F2C0D0A2E742D436172642D7375627469746C65207B0D0A2020636F6C6F723A2023363636';
wwv_flow_api.g_varchar2_table(461) := '3636363B0D0A7D0D0A2E742D436172642D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436172642D636F6C6F7246696C6C2C0D0A2E742D436172642D69636F6E207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(462) := '6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D43617264732D2D6665617475726564202E742D436172642D626F6479207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C2030';
wwv_flow_api.g_varchar2_table(463) := '2C20302C20302E303735293B0D0A7D0D0A2E742D43617264732D2D6261736963202E742D436172642D7469746C6557726170207B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E30352920696E73';
wwv_flow_api.g_varchar2_table(464) := '65743B0D0A7D0D0A2E742D43617264732D2D636F6D70616374202E742D436172642D7469746C6557726170207B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(465) := '0A2E742D43617264732D2D6665617475726564202E742D436172642D626F6479207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D43617264732D2D626C6F636B202E74';
wwv_flow_api.g_varchar2_table(466) := '2D49636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020746578742D736861646F773A20302031707820317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(467) := '742D43617264732D2D616E696D526169736543617264202E742D436172643A686F766572207B0D0A2020626F782D736861646F773A2030203130707820347078202D347078207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D4361';
wwv_flow_api.g_varchar2_table(468) := '7264732D2D73616D706C6541707073466F6F746572207B0D0A20206D617267696E2D746F703A20333270783B0D0A7D0D0A2E742D43617264732D2D73616D706C6541707073466F6F746572202E742D43617264207B0D0A2020626F782D736861646F773A';
wwv_flow_api.g_varchar2_table(469) := '206E6F6E653B0D0A7D0D0A2E742D43617264732D2D73616D706C6541707073466F6F746572202E742D43617264732D6974656D207B0D0A2020646973706C61793A20626C6F636B3B0D0A2020666C65782D67726F773A20313B0D0A202077696474683A20';
wwv_flow_api.g_varchar2_table(470) := '3235253B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20343830707829207B0D0A20202E742D43617264732D2D73616D706C6541707073466F6F746572202E742D43617264732D6974656D207B0D0A';
wwv_flow_api.g_varchar2_table(471) := '2020202077696474683A203530253B0D0A20207D0D0A7D0D0A2E742D43617264732D2D73616D706C6541707073466F6F746572202E742D436172642D777261702C0D0A2E742D43617264732D2D73616D706C6541707073466F6F746572202E742D436172';
wwv_flow_api.g_varchar2_table(472) := '642D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D43617264732D2D73616D706C6541707073466F6F';
wwv_flow_api.g_varchar2_table(473) := '746572202E742D436172642D69636F6E207B0D0A20207472616E736974696F6E3A20302E327320656173653B0D0A7D0D0A2E742D43617264732D2D73616D706C6541707073466F6F746572202E742D49636F6E207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(474) := '636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6D6F6E74685469746C65';
wwv_flow_api.g_varchar2_table(475) := '207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D646179436F6C756D6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020766572746963616C2D61';
wwv_flow_api.g_varchar2_table(476) := '6C69676E3A20746F703B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E742D436C617373696343616C656E6461722D646179207B0D0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(477) := '3A20236632663266323B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6461792E69732D696E616374697665202E742D436C617373696343616C656E6461722D64617465207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(478) := '436C617373696343616C656E6461722D6461792E69732D7765656B656E642C0D0A2E742D436C617373696343616C656E6461722D6461792E69732D696E616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236663666366633B0D';
wwv_flow_api.g_varchar2_table(479) := '0A7D0D0A2E742D436C617373696343616C656E6461722D6461792E69732D746F646179202E742D436C617373696343616C656E6461722D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(480) := '3A20236666666666663B0D0A7D0D0A2E742D436C617373696343616C656E6461722D64617465207B0D0A2020636F6C6F723A20233636363636363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E74207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(481) := '6F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6576656E7420';
wwv_flow_api.g_varchar2_table(482) := '61207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E64';
wwv_flow_api.g_varchar2_table(483) := '61722D74696D65436F6C2C0D0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D74696D65436F6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D';
wwv_flow_api.g_varchar2_table(484) := '0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E74732C0D0A2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C65';
wwv_flow_api.g_varchar2_table(485) := '6E6461722D6461794576656E7473207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461794576656E747320612C0D0A';
wwv_flow_api.g_varchar2_table(486) := '2E742D436C617373696343616C656E6461722D2D6461696C79202E742D436C617373696343616C656E6461722D6461794576656E74732061207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(487) := '6666666666663B0D0A7D0D0A2E742D436C617373696343616C656E6461722D2D7765656B6C79202E742D436C617373696343616C656E6461722D6461792E69732D746F6461792C0D0A2E742D436C617373696343616C656E6461722D2D6461696C79202E';
wwv_flow_api.g_varchar2_table(488) := '742D436C617373696343616C656E6461722D6461792E69732D746F646179207B0D0A20206261636B67726F756E642D636F6C6F723A20236466663066663B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6C697374207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(489) := '65722D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6C6973745469746C652C0D0A2E742D436C617373696343616C656E6461722D6C6973744576656E74207B0D0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(490) := '3A20236632663266323B0D0A7D0D0A2E742D436C617373696343616C656E6461722D6C6973745469746C65207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020636F6C6F723A20233464346434643B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(491) := '742D436C617373696343616C656E6461722D6C6973744576656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E74207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(492) := '67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020636F6C6F723A20233030303B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D636F6D6D656E743A6166746572207B';
wwv_flow_api.g_varchar2_table(493) := '0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C2030293B0D0A2020626F726465722D72696768742D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D436F6D6D656E74732D2D636861';
wwv_flow_api.g_varchar2_table(494) := '74202E742D436F6D6D656E74732D6974656D2E69732D616374697665202E742D436F6D6D656E74732D636F6D6D656E74207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(495) := '3A20233030303B0D0A7D0D0A2E742D436F6D6D656E74732D2D63686174202E742D436F6D6D656E74732D6974656D2E69732D616374697665202E742D436F6D6D656E74732D636F6D6D656E743A6166746572207B0D0A2020626F726465722D7269676874';
wwv_flow_api.g_varchar2_table(496) := '2D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D436F6D6D656E74732D2D6261736963202E742D436F6D6D656E74732D6974656D2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(497) := '20236662666266623B0D0A7D0D0A2E742D436F6D6D656E74732D6974656D2E69732D73797374656D4D657373616765207B0D0A20206261636B67726F756E642D636F6C6F723A20726762612831332C2031332C2031332C20302E3035293B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(498) := '742D436F6D6D656E74732D696E666F207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A7D0D0A2E742D436F6D6D656E74732D636F6D6D656E74207B0D0A2020636F6C6F723A20233030303B0D0A7D0D0A2E742D436F';
wwv_flow_api.g_varchar2_table(499) := '6D706C6574656E657373207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A612E';
wwv_flow_api.g_varchar2_table(500) := '742D436F6D706C6574656E6573733A686F766572202E742D436F6D706C6574656E6573732D6C6162656C57726170207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A612E742D43';
wwv_flow_api.g_varchar2_table(501) := '6F6D706C6574656E6573733A686F766572202E742D436F6D706C6574656E6573732D6C6162656C207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D436F6D706C6574656E6573732D66696C6C207B0D0A';
wwv_flow_api.g_varchar2_table(502) := '2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A7D0D0A2E742D436F6D706C6574656E6573732D6C6162656C207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(503) := '72676261283235352C203235352C203235352C20302E3735293B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A7D0D0A2E742D436F6E66696750616E656C207B0D0A2020626F782D736861646F773A2030202D317078';
wwv_flow_api.g_varchar2_table(504) := '2030207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D436F6E66696750616E656C2D61626F7574207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663765303B0D0A2020636F6C6F723A2023353635';
wwv_flow_api.g_varchar2_table(505) := '3635363B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D436F6E66696750616E656C2D6D61696E207B0D0A2020626F782D736861646F773A202D317078';
wwv_flow_api.g_varchar2_table(506) := '20302030207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20363430707829207B0D0A20202E742D436F6E66696750616E656C2D6D6169';
wwv_flow_api.g_varchar2_table(507) := '6E207B0D0A20202020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E312920696E7365743B0D0A20207D0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E207B0D0A2020626F726465722D726164';
wwv_flow_api.g_varchar2_table(508) := '6975733A20313030253B0D0A20206261636B67726F756E642D636F6C6F723A20234130413041303B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D656E61626C6564207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(509) := '6B67726F756E642D636F6C6F723A20233342414132433B0D0A7D0D0A2E742D436F6E66696750616E656C2D69636F6E2E69732D64697361626C6564207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A7D0D0A2E742D43';
wwv_flow_api.g_varchar2_table(510) := '6F6E66696750616E656C2D73657474696E672C0D0A2E742D436F6E66696750616E656C2D737461747573207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D436F6E66696750616E656C2D737461747573207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(511) := '3A20233236323632363B0D0A7D0D0A2E742D436F6E66696750616E656C2D617474724C696E6B207B0D0A2020636F6C6F723A20233733373337333B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(512) := '30352920696E7365743B0D0A7D0D0A2E742D436F6E66696750616E656C2D617474724C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020626F782D73686164';
wwv_flow_api.g_varchar2_table(513) := '6F773A2030203170782030207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D436F6E66696750616E656C2D6174747256616C7565207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A2E742D436F6E74656E74426C6F';
wwv_flow_api.g_varchar2_table(514) := '636B2D2D736861646F774247202E742D436F6E74656E74426C6F636B2D626F6479207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020626F726465722D636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(515) := '302C20302C20302C20302E31293B0D0A7D0D0A2E742D436F6E74656E74426C6F636B2D2D6C696768744247202E742D436F6E74656E74426C6F636B2D626F6479207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E';
wwv_flow_api.g_varchar2_table(516) := '31293B0D0A7D0D0A2E742D436F6E74656E74526F772D6974656D207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E742D436F6E74656E74526F772D69636F6E577261';
wwv_flow_api.g_varchar2_table(517) := '702C0D0A2E742D436F6E74656E74526F772D6465736372697074696F6E2C0D0A2E742D436F6E74656E74526F772D6D697363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D4469616C6F67207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(518) := '642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4469616C6F67203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20236266626662663B0D0A7D0D0A2E742D446961';
wwv_flow_api.g_varchar2_table(519) := '6C6F67203A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236233623362333B0D0A7D0D0A2E742D4469616C6F673A3A2D7765626B69742D7363726F6C6C626172';
wwv_flow_api.g_varchar2_table(520) := '2D747261636B207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4469616C6F67526567696F6E2D627574746F6E73207B0D0A2020626F782D736861646F773A20696E7365742030203170782030207267';
wwv_flow_api.g_varchar2_table(521) := '626128302C20302C20302C20302E3035293B0D0A7D0D0A2E612D46532D636F6E74726F6C202B202E612D46532D636F6E74726F6C207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(522) := '2E612D46532D746F67676C65207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E32293B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F726465722D7261646975733A203270783B0D0A7D';
wwv_flow_api.g_varchar2_table(523) := '0D0A2E612D46532D746F67676C653A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A2E612D46532D746F67676C653A666F637573207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(524) := '756E642D636F6C6F723A20233030373664663B0D0A2020626F782D736861646F773A203020317078203170782030207267626128302C203131382C203232332C20302E3835293B0D0A7D0D0A2E612D46532D636C656172427574746F6E2C0D0A2E612D46';
wwv_flow_api.g_varchar2_table(525) := '532D746F67676C654F766572666C6F77207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E612D46532D736561726368207370616E2E617065782D69';
wwv_flow_api.g_varchar2_table(526) := '74656D2D69636F6E2C0D0A2E612D46532D66696C746572207370616E2E617065782D6974656D2D69636F6E207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A7D0D0A2E612D46532D736561726368207B0D0A202062';
wwv_flow_api.g_varchar2_table(527) := '6F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D466F6F746572207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A20';
wwv_flow_api.g_varchar2_table(528) := '206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A7D0D0A2E742D466F6F7465722D746F70427574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020';
wwv_flow_api.g_varchar2_table(529) := '636F6C6F723A20233537353735373B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D466F6F7465722D746F70427574746F6E3A686F766572207B0D0A';
wwv_flow_api.g_varchar2_table(530) := '2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365742C20302032707820347078207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D466F6F7465722D746F704275';
wwv_flow_api.g_varchar2_table(531) := '74746F6E3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E65723A6265666F7265207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(532) := '3230323032303B0D0A7D0D0A2E612D4952522D7365617263682D6669656C642C0D0A2E612D4947202E612D546F6F6C6261722D696E70757454657874207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(533) := '723A20236639663966393B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E612D4947202E612D546F6F6C6261722D696E70757454657874207B0D0A2020626F782D736861646F773A203020302030203170782023646664';
wwv_flow_api.g_varchar2_table(534) := '66646620696E7365743B0D0A7D0D0A2E617065782D6974656D2D74657874617265612C0D0A2E617065782D6974656D2D746578742C0D0A2E617065782D6974656D2D73656C6563742C0D0A2E617065782D6974656D2D6D756C74692C0D0A73656C656374';
wwv_flow_api.g_varchar2_table(535) := '2E6C6973746D616E61676572207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E617065782D';
wwv_flow_api.g_varchar2_table(536) := '6974656D2D74657874617265612E617065782D706167652D6974656D2D6572726F722C0D0A2E617065782D6974656D2D746578742E617065782D706167652D6974656D2D6572726F722C0D0A2E617065782D6974656D2D73656C6563742E617065782D70';
wwv_flow_api.g_varchar2_table(537) := '6167652D6974656D2D6572726F722C0D0A2E617065782D6974656D2D6D756C74692E617065782D706167652D6974656D2D6572726F722C0D0A73656C6563742E6C6973746D616E616765722E617065782D706167652D6974656D2D6572726F72207B0D0A';
wwv_flow_api.g_varchar2_table(538) := '2020626F726465722D636F6C6F723A20236637373036363B0D0A7D0D0A2E617065782D6974656D2D74657874617265612E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A2E617065782D6974656D2D7465';
wwv_flow_api.g_varchar2_table(539) := '78742E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A2E617065782D6974656D2D73656C6563742E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A2E6170';
wwv_flow_api.g_varchar2_table(540) := '65782D6974656D2D6D756C74692E617065782D706167652D6974656D2D6572726F723A72657175697265643A76616C69642C0D0A73656C6563742E6C6973746D616E616765722E617065782D706167652D6974656D2D6572726F723A7265717569726564';
wwv_flow_api.g_varchar2_table(541) := '3A76616C6964207B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874';
wwv_flow_api.g_varchar2_table(542) := '617265612E6A732D73686F772D6C6162656C202E742D466F726D2D6C6162656C3A6265666F72652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74';
wwv_flow_api.g_varchar2_table(543) := '657874617265612E69732D616374697665202E742D466F726D2D6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D66';
wwv_flow_api.g_varchar2_table(544) := '6C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874617265613A666F6375732D77697468696E202E742D466F726D2D6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(545) := '66666666662021696D706F7274616E743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C2E617065782D6974656D2D777261707065722D2D74657874617265613A686F766572202E742D466F72';
wwv_flow_api.g_varchar2_table(546) := '6D2D6C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E617065782D6974656D2D746578742C0D0A2E617065782D6974656D2D73656C6563742C0D0A2E617065782D6974656D2D';
wwv_flow_api.g_varchar2_table(547) := '7465787461726561207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E617065782D6974656D2D6D756C7469202E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F76207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(548) := '67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E';
wwv_flow_api.g_varchar2_table(549) := '742D466F726D2D696E707574436F6E7461696E6572202E617065782D6974656D2D646973706C61792D6F6E6C79207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020';
wwv_flow_api.g_varchar2_table(550) := '626F726465722D636F6C6F723A20236466646664663B0D0A2020626F726465722D7374796C653A206461736865643B0D0A7D0D0A2E617065782D6974656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(551) := '6F6C6F723A20236666666666663B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E37293B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E617065782D6974656D';
wwv_flow_api.g_varchar2_table(552) := '2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E617065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(553) := '756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E617065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(554) := '6465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E617065782D6974656D2D66696C653A686F766572202B202E617065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F';
wwv_flow_api.g_varchar2_table(555) := '6E652D6C6162656C207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E617065782D6974656D2D66696C653A686F766572202B202E617065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64';
wwv_flow_api.g_varchar2_table(556) := '726F707A6F6E652D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E617065782D6974656D2D66696C653A666F637573202B202E617065782D6974';
wwv_flow_api.g_varchar2_table(557) := '656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F6E652D6C6162656C207B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(558) := '617065782D6974656D2D66696C653A666F637573202B202E617065782D6974656D2D66696C652D64726F707A6F6E65202E617065782D6974656D2D66696C652D64726F707A6F6E652D69636F6E207B0D0A2020626F726465722D636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(559) := '373664663B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E617065782D6974656D2D74657874617265613A666F6375732C0D0A2E617065782D6974656D2D7465';
wwv_flow_api.g_varchar2_table(560) := '78743A666F6375732C0D0A2E617065782D6974656D2D73656C6563743A666F6375732C0D0A2E617065782D6974656D2D6D756C74693A666F6375732C0D0A73656C6563742E6C6973746D616E616765723A666F637573207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(561) := '6E642D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A2020626F726465722D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365';
wwv_flow_api.g_varchar2_table(562) := '617263683A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F';
wwv_flow_api.g_varchar2_table(563) := '562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075';
wwv_flow_api.g_varchar2_table(564) := '702D6C6F762E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74693A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D';
wwv_flow_api.g_varchar2_table(565) := '756C74692E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263683A666F637573202B202E617065782D6974656D2D69636F6E202B20';
wwv_flow_api.g_varchar2_table(566) := '2E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682E69732D666F6375736564202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F';
wwv_flow_api.g_varchar2_table(567) := '7075704C4F562C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F637573202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D69';
wwv_flow_api.g_varchar2_table(568) := '74656D2D746578742E617065782D6974656D2D706F7075702D6C6F762E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74693A666F637573202B202E617065782D6974656D2D';
wwv_flow_api.g_varchar2_table(569) := '69636F6E202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E617065782D6974656D2D69636F6E202B202E612D427574746F6E2D2D706F7075704C4F56207B0D0A';
wwv_flow_api.g_varchar2_table(570) := '2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E617065782D6974656D2D74657874617265613A686F7665722C0D0A2E617065782D6974656D2D746578743A686F7665722C0D0A2E61706578';
wwv_flow_api.g_varchar2_table(571) := '2D6974656D2D73656C6563743A686F7665722C0D0A2E617065782D6974656D2D6D756C74693A686F7665722C0D0A73656C6563742E6C6973746D616E616765723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666';
wwv_flow_api.g_varchar2_table(572) := '663B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D7765626B69742D696E7075742D706C616365686F6C646572207B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E3632293B0D0A';
wwv_flow_api.g_varchar2_table(573) := '20206F7061636974793A20313B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A3A2D6D6F7A2D706C616365686F6C646572207B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E3632293B';
wwv_flow_api.g_varchar2_table(574) := '0D0A20206F7061636974793A20313B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075743A2D6D732D696E7075742D706C616365686F6C646572207B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20';
wwv_flow_api.g_varchar2_table(575) := '302E3632293B0D0A20206F7061636974793A20313B0D0A7D0D0A2E742D466F726D20696E7075742E66696C65207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D466F726D2D696E707574436F6E7461696E6572207370616E2E6469';
wwv_flow_api.g_varchar2_table(576) := '73706C61795F6F6E6C79207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F726D2D73656C6563742C0D0A2E74';
wwv_flow_api.g_varchar2_table(577) := '2D466F726D2D696E707574436F6E7461696E65722073656C6563742E7965735F6E6F207B0D0A2020636F6C6F723A20233230323032303B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E742D466F726D2D6669656C642D';
wwv_flow_api.g_varchar2_table(578) := '2D726561644F6E6C79207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F726D2D726164696F4C6162656C2C0D0A2E742D466F726D2D696E707574436F6E7461696E6572202E726164696F';
wwv_flow_api.g_varchar2_table(579) := '5F67726F7570206C6162656C2C0D0A2E742D466F726D2D636865636B626F784C6162656C2C0D0A2E742D466F726D2D696E707574436F6E7461696E6572202E636865636B626F785F67726F7570206C6162656C2C0D0A2E742D466F726D2D6C6162656C20';
wwv_flow_api.g_varchar2_table(580) := '7B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D6C6162656C207B0D0A2020636F6C6F723A20233539353935393B0D0A7D';
wwv_flow_api.g_varchar2_table(581) := '0D0A2E742D466F726D2D6572726F72207B0D0A2020636F6C6F723A20236634343333363B0D0A7D0D0A2E742D466F726D2D706F737454657874207B0D0A2020636F6C6F723A20236136613661363B0D0A7D0D0A2E742D466F726D2D2D7365617263682069';
wwv_flow_api.g_varchar2_table(582) := '6E7075742E742D466F726D2D7365617263684669656C64207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E612D427574746F6E2E612D427574746F6E2D2D63';
wwv_flow_api.g_varchar2_table(583) := '616C656E6461722C0D0A2E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F56207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E612D427574746F6E2E612D427574746F';
wwv_flow_api.g_varchar2_table(584) := '6E2D2D63616C656E6461722C0D0A2E752D52544C202E612D427574746F6E2E612D427574746F6E2D2D706F7075704C4F56207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D466F726D2D696E707574';
wwv_flow_api.g_varchar2_table(585) := '436F6E7461696E657220696E7075742E686173446174657069636B65722C0D0A2E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075705F6C6F76207B0D0A2020626F726465722D7261646975733A20327078203020302032';
wwv_flow_api.g_varchar2_table(586) := '70783B0D0A7D0D0A2E752D52544C202E742D466F726D2D696E707574436F6E7461696E657220696E7075742E686173446174657069636B65722C0D0A2E752D52544C202E742D466F726D2D696E707574436F6E7461696E657220696E7075742E706F7075';
wwv_flow_api.g_varchar2_table(587) := '705F6C6F76207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D726320696E707574207B0D0A20200D0A7D0D0A2E617065782D6974656D2D67726F75702D2D7263';
wwv_flow_api.g_varchar2_table(588) := '20696E707574202B206C6162656C3A6265666F7265207B0D0A2020626F782D736861646F773A20696E736574207267626128302C20302C20302C20302E313529203020302030203170783B0D0A20206261636B67726F756E642D636F6C6F723A20236639';
wwv_flow_api.g_varchar2_table(589) := '663966393B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D726320696E707574202B206C6162656C3A6166746572207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D726320696E70';
wwv_flow_api.g_varchar2_table(590) := '75743A686F766572202B206C6162656C3A6265666F7265207B0D0A2020626F782D736861646F773A20696E736574207267626128302C20302C20302C20302E323529203020302030203170783B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D';
wwv_flow_api.g_varchar2_table(591) := '726320696E7075743A666F637573202B206C6162656C3A6265666F7265207B0D0A2020626F782D736861646F773A20696E7365742023303037366466203020302030203170782C20696E7365742023666666666666203020302030203270783B0D0A7D0D';
wwv_flow_api.g_varchar2_table(592) := '0A2E636865636B626F785F67726F757020696E7075742C0D0A2E726164696F5F67726F757020696E707574207B0D0A20200D0A7D0D0A2E636865636B626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265';
wwv_flow_api.g_varchar2_table(593) := '666F72652C0D0A2E726164696F5F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265666F7265207B0D0A2020626F782D736861646F773A20696E7365742023303037366466203020302030203170782C20696E73';
wwv_flow_api.g_varchar2_table(594) := '65742023666666666666203020302030203270783B0D0A7D0D0A2E636865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A6265666F72652C0D0A2E726164696F5F67726F757020696E7075743A636865636B656420';
wwv_flow_api.g_varchar2_table(595) := '2B206C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E636865636B626F785F67726F757020696E7075743A636865636B65';
wwv_flow_api.g_varchar2_table(596) := '64202B206C6162656C3A686F7665723A6265666F72652C0D0A2E726164696F5F67726F757020696E7075743A636865636B6564202B206C6162656C3A686F7665723A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A2023303036';
wwv_flow_api.g_varchar2_table(597) := '3963363B0D0A7D0D0A2E726164696F5F67726F757020696E707574202B206C6162656C3A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E6572';
wwv_flow_api.g_varchar2_table(598) := '2D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E707574207B0D0A20200D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F';
wwv_flow_api.g_varchar2_table(599) := '785F67726F757020696E707574202B206C6162656C3A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D466F';
wwv_flow_api.g_varchar2_table(600) := '726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A666F637573202B206C6162656C3A6265666F7265207B0D0A2020626F726465722D636F6C6F723A202330';
wwv_flow_api.g_varchar2_table(601) := '30373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6265666F';
wwv_flow_api.g_varchar2_table(602) := '7265207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B';
wwv_flow_api.g_varchar2_table(603) := '0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A666F6375733A636865636B6564202B206C6162656C3A6166746572207B0D0A20';
wwv_flow_api.g_varchar2_table(604) := '20636F6C6F723A20233030373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A';
wwv_flow_api.g_varchar2_table(605) := '6265666F7265207B0D0A2020626F726465722D636F6C6F723A20236639663966393B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F4275';
wwv_flow_api.g_varchar2_table(606) := '74746F6E47726F7570202E636865636B626F785F67726F757020696E7075743A636865636B6564202B206C6162656C3A6166746572207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65';
wwv_flow_api.g_varchar2_table(607) := '722D2D70726554657874426C6F636B202E742D466F726D2D6974656D546578742D2D7072652C0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F726D2D6974656D546578742D2D706F7374';
wwv_flow_api.g_varchar2_table(608) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F782D736861646F773A20302030203020302E3172656D202364666466646620696E7365743B0D0A2020626F726465722D7261646975733A203270783B0D0A';
wwv_flow_api.g_varchar2_table(609) := '7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D70726554657874426C6F636B202E742D466F726D2D6974656D546578742D2D707265207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(610) := '752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D70726554657874426C6F636B202E742D466F726D2D6974656D546578742D2D707265207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D';
wwv_flow_api.g_varchar2_table(611) := '0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F726D2D6974656D546578742D2D706F7374207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(612) := '2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D706F737454657874426C6F636B202E742D466F726D2D6974656D546578742D2D706F7374207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B';
wwv_flow_api.g_varchar2_table(613) := '0D0A7D0D0A2E617065782D6974656D2D6861732D69636F6E3A666F637573202B202E617065782D6974656D2D69636F6E2C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E617065782D6974656D2D69636F6E207B0D0A';
wwv_flow_api.g_varchar2_table(614) := '2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D69636F6E207B0D0A2020636F6C6F723A20233430343034303B0D0A2020';
wwv_flow_api.g_varchar2_table(615) := '626F782D736861646F773A202D302E3172656D20302030202364666466646620696E7365743B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E746169';
wwv_flow_api.g_varchar2_table(616) := '6E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D69636F6E207B0D0A2020626F782D736861646F773A20302E3172656D20302030202364666466646620696E7365743B0D0A2020626F726465722D7261646975733A2030203270';
wwv_flow_api.g_varchar2_table(617) := '782032707820303B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D6861732D69636F6E3A666F637573202B202E617065782D6974656D2D69636F6E2C0D0A2E742D';
wwv_flow_api.g_varchar2_table(618) := '466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E617065782D6974656D2D69636F6E207B0D0A2020626F782D736861646F773A206E6F';
wwv_flow_api.g_varchar2_table(619) := '6E653B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D466F726D2D68656C70427574746F6E3A666F637573202E612D49636F6E207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(620) := '3A20233030373664663B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E742D466F726D2D6974656D57726170706572203E202E617065782D6974656D2D67726F7570203E202E6170';
wwv_flow_api.g_varchar2_table(621) := '65782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D72616469';
wwv_flow_api.g_varchar2_table(622) := '6F427574746F6E47726F7570202E742D466F726D2D6974656D57726170706572203E202E617065782D6974656D2D67726F7570203E202E617065782D6974656D2D6F7074696F6E3A6C6173742D6F662D74797065206C6162656C207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(623) := '65722D7261646975733A2030203020327078203270783B0D0A7D0D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065782D6974656D2D67726964';
wwv_flow_api.g_varchar2_table(624) := '2D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D466F726D2D66';
wwv_flow_api.g_varchar2_table(625) := '69656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A6C6173';
wwv_flow_api.g_varchar2_table(626) := '742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570';
wwv_flow_api.g_varchar2_table(627) := '202E617065782D6974656D2D67726964202E617065782D6974656D2D677269642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A66697273742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(628) := '646975733A2030203270782032707820303B0D0A7D0D0A2E752D52544C202E742D466F726D2D6669656C64436F6E7461696E65722D2D726164696F427574746F6E47726F7570202E617065782D6974656D2D67726964202E617065782D6974656D2D6772';
wwv_flow_api.g_varchar2_table(629) := '69642D726F773A6F6E6C792D6368696C64202E617065782D6974656D2D6F7074696F6E3A6C6173742D6F662D74797065206C6162656C207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E612D5377697463';
wwv_flow_api.g_varchar2_table(630) := '682D746F67676C65207B0D0A2020626F782D736861646F773A20696E736574207267626128302C20302C20302C20302E303529203020302030203170783B0D0A20206261636B67726F756E642D636F6C6F723A20233863386338633B0D0A7D0D0A2E612D';
wwv_flow_api.g_varchar2_table(631) := '5377697463682D746F67676C653A6265666F7265207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D5377697463683A686F766572202E612D5377697463682D746F67676C65207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(632) := '6E642D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A7D0D0A2E612D5377697463683A616374697665202E612D5377697463682D746F67676C653A6265666F7265207B0D0A20207472616E73666F726D3A207363616C6528302E';
wwv_flow_api.g_varchar2_table(633) := '3735293B0D0A7D0D0A2E612D53776974636820696E7075745B747970653D636865636B626F785D3A666F637573202B202E612D5377697463682D746F67676C65207B0D0A2020626F782D736861646F773A20696E73657420233030373664662030203020';
wwv_flow_api.g_varchar2_table(634) := '30203170782C20696E7365742023666666203020302030203270783B0D0A7D0D0A2E612D53776974636820696E7075745B747970653D636865636B626F785D3A696E64657465726D696E617465202B202E612D5377697463682D746F67676C653A626566';
wwv_flow_api.g_varchar2_table(635) := '6F7265207B0D0A20207472616E73666F726D2D6F726967696E3A203530253B0D0A2020626F782D736861646F773A20696E7365742023303037366466203020302030203170783B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(636) := '203131382C203232332C20302E303035293B0D0A7D0D0A2E612D53776974636820696E7075745B747970653D636865636B626F785D3A636865636B6564202B202E612D5377697463682D746F67676C65207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(637) := '6F723A20233030373664663B0D0A7D0D0A2E612D53776974636820696E7075745B747970653D636865636B626F785D3A636865636B6564202B202E612D5377697463682D746F67676C653A6265666F7265207B0D0A20207472616E73666F726D2D6F7269';
wwv_flow_api.g_varchar2_table(638) := '67696E3A207269676874203530253B0D0A7D0D0A2E612D5377697463683A686F76657220696E7075745B747970653D636865636B626F785D3A636865636B6564202B202E612D5377697463682D746F67676C65207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(639) := '636F6C6F723A20233030363963363B0D0A7D0D0A2E742D4865616465722D6272616E64696E67207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D4865616465722D6C6F676F2C0D0A2E742D4865616465';
wwv_flow_api.g_varchar2_table(640) := '72202E742D427574746F6E2D2D6865616465722E69732D6163746976652C0D0A2E742D486561646572202E742D427574746F6E2D2D686561646572207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4865616465722D6C6F676F3A';
wwv_flow_api.g_varchar2_table(641) := '686F7665722C0D0A2E742D486561646572202E742D427574746F6E2D2D6865616465722E69732D6163746976653A686F7665722C0D0A2E742D486561646572202E742D427574746F6E2D2D6865616465723A686F766572207B0D0A2020746578742D6465';
wwv_flow_api.g_varchar2_table(642) := '636F726174696F6E3A206E6F6E653B0D0A7D0D0A2E742D4865616465722D6C6F676F2D6C696E6B207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D4865616465722D6C6F676F2D6C696E6B3A666F6375732C0D0A2E742D48656164';
wwv_flow_api.g_varchar2_table(643) := '65722D6C6F676F2D6C696E6B3A6163746976653A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A20302030203020317078202332643963666620696E7365743B0D0A7D0D0A2E742D4865726F526567';
wwv_flow_api.g_varchar2_table(644) := '696F6E2D69636F6E207B0D0A2020626F726465722D7261646975733A203470783B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4865726F526567696F6E';
wwv_flow_api.g_varchar2_table(645) := '2D7469746C65207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D4865726F526567696F6E2D636F6C2D2D636F6E74656E74207B0D0A2020636F6C6F723A20233731373137313B0D0A7D0D0A2E742D426F64792D7469746C65202E74';
wwv_flow_api.g_varchar2_table(646) := '2D4865726F526567696F6E2D7469746C652C0D0A2E742D426F64792D7469746C65202E742D4865726F526567696F6E2D636F6C2D2D636F6E74656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4947207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(647) := '6465722D636F6C6F723A20236563656365633B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D52562D746F6F6C626172207B0D0A2020626F726465722D636F6C6F723A20236431643164313B0D0A7D0D0A2E612D';
wwv_flow_api.g_varchar2_table(648) := '47562D6864722C0D0A2E612D49472D686561646572207B0D0A2020626F726465722D636F6C6F723A20236563656365633B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D47562D772D66726F7A656E202E';
wwv_flow_api.g_varchar2_table(649) := '612D47562D7461626C652C0D0A2E612D47562D772D686472202E612D47562D7461626C65207B0D0A2020626F726465722D636F6C6F723A20236530653065302021696D706F7274616E743B0D0A7D0D0A2E612D47562D626479207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(650) := '726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D47562D6865616465722C0D0A2E612D47562D68656164657247726F75702C0D0A2E612D546F6F6C6261722D67726F7570207B0D0A2020626F726465722D636F6C6F723A20236563656365';
wwv_flow_api.g_varchar2_table(651) := '633B0D0A7D0D0A2E612D47562D7461626C65202E612D47562D63656C6C207B0D0A2020626F726465722D636F6C6F723A20236563656365633B0D0A7D0D0A2E612D47562D7461626C652074722E69732D73656C6563746564202E612D47562D63656C6C20';
wwv_flow_api.g_varchar2_table(652) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20236536663166633B0D0A7D0D0A2E612D4952522D706167696E6174696F6E577261702D2D626F74746F6D207B0D0A2020626F726465722D746F702D636F6C6F723A20236563656365633B0D0A7D';
wwv_flow_api.g_varchar2_table(653) := '0D0A2E612D49472D6772696456696577202E612D47562D666F6F746572207B0D0A2020626F726465722D636F6C6F723A20236563656365633B0D0A7D0D0A2E612D47562D666F6F746572207B0D0A2020626F726465722D636F6C6F723A20236563656365';
wwv_flow_api.g_varchar2_table(654) := '633B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D47562D7061676552616E6765207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A7D0D0A2E612D47562D70616765427574';
wwv_flow_api.g_varchar2_table(655) := '746F6E207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3635293B0D0A7D0D0A2E612D47562D70616765427574746F6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C';
wwv_flow_api.g_varchar2_table(656) := '20302E303735293B0D0A7D0D0A2E612D47562D7061676553656C6563746F722D6974656D2E69732D73656C6563746564202E612D47562D70616765427574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20';
wwv_flow_api.g_varchar2_table(657) := '302C20302E3135293B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3935293B0D0A7D0D0A2E612D47562D7461626C652074682E612D47562D636F6E74726F6C427265616B486561646572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(658) := '636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(659) := '2E612D47562D2D656469744D6F6465202E612D47562D726F772E69732D726561646F6E6C79202E612D47562D63656C6C2C0D0A2E612D47562D2D656469744D6F6465202E612D47562D63656C6C2E69732D726561646F6E6C79207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(660) := '726F756E642D636F6C6F723A20236639663966393B0D0A2020636F6C6F723A20233730373037303B0D0A7D0D0A2E612D47562D636F6C756D6E436F6E74726F6C73202E612D427574746F6E207B0D0A2020636F6C6F723A20233338333833383B0D0A2020';
wwv_flow_api.g_varchar2_table(661) := '6261636B67726F756E642D636F6C6F723A20236638663866383B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E612D47562D636F6C756D6E436F6E74';
wwv_flow_api.g_varchar2_table(662) := '726F6C73202E612D427574746F6E2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3032';
wwv_flow_api.g_varchar2_table(663) := '352920696E7365743B0D0A7D0D0A2E612D495252207B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(664) := '6F723A20236666666666663B0D0A7D0D0A2E612D495252202E612D4952522D706167696E6174696F6E2D6C6162656C207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E612D4952522D7265706F727453756D6D6172792D76616C756520';
wwv_flow_api.g_varchar2_table(665) := '7B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4952522D636F6E74726F6C73436F6E7461696E6572207B0D0A2020626F726465722D746F702D636F6C6F723A20236635663566353B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(666) := '723A20236661666166613B0D0A7D0D0A2E612D4952522D66756C6C56696577207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D636F6E74';
wwv_flow_api.g_varchar2_table(667) := '726F6C73207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E612D4952522D746F6F6C626172207B0D0A20206261636B67726F756E643A20236666666666663B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(668) := '723A20236536653665363B0D0A7D0D0A2E612D5265706F72742D70657263656E7443686172742D66696C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E612D5265706F72742D70657263656E74436861';
wwv_flow_api.g_varchar2_table(669) := '7274207B0D0A20206261636B67726F756E642D636F6C6F723A20236466663066663B0D0A7D0D0A2E612D4952522D627574746F6E2D2D636F6C536561726368207B0D0A2020626F726465722D746F702D72696768742D7261646975733A20302021696D70';
wwv_flow_api.g_varchar2_table(670) := '6F7274616E743B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A20302021696D706F7274616E743B0D0A7D0D0A2E752D52544C202E612D4952522D627574746F6E2D2D636F6C536561726368207B0D0A2020626F72646572';
wwv_flow_api.g_varchar2_table(671) := '2D746F702D72696768742D7261646975733A203270782021696D706F7274616E743B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270782021696D706F7274616E743B0D0A2020626F726465722D746F702D6C656674';
wwv_flow_api.g_varchar2_table(672) := '2D7261646975733A20302021696D706F7274616E743B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302021696D706F7274616E743B0D0A7D0D0A2E612D4952522D69636F6E566965775461626C652C0D0A2E612D495252';
wwv_flow_api.g_varchar2_table(673) := '2D6368617274566965772C0D0A2E612D4952522D7069766F74566965772C0D0A2E612D4952522D67726F75704279566965772C0D0A2E612D4952522D64657461696C56696577207B0D0A2020626F726465722D746F702D636F6C6F723A20236635663566';
wwv_flow_api.g_varchar2_table(674) := '353B0D0A7D0D0A2E612D4952522D746F6F6C6261722D2D73696E676C65526F77207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0D0A7D0D0A2E612D4952522D686561646572207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(675) := '642D636F6C6F723A20236661666166613B0D0A2020626F726465722D746F703A2031707820736F6C696420236536653665363B0D0A2020626F782D736861646F773A20696E7365742031707820302030203020236536653665363B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(676) := '3A207267626128302C20302C20302C20302E3935293B0D0A7D0D0A2E612D4952522D6865616465723A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E612D4952522D6865616465722E69732D';
wwv_flow_api.g_varchar2_table(677) := '616374697665207B0D0A2020626F782D736861646F773A20302031707820317078207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E612D4952522D6865616465722E69732D6163746976652061207B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(678) := '723A20696E68657269743B0D0A7D0D0A2E612D4952522D6865616465722E69732D616374697665202E612D4952522D686561646572536F7274207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D4952522D6865616465722E69732D';
wwv_flow_api.g_varchar2_table(679) := '6163746976652C0D0A2E612D47562D6865616465722E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20233230323032303B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E612D4952522D6865616465722D2D67';
wwv_flow_api.g_varchar2_table(680) := '726F7570207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E742D4952522D726567696F6E207B0D0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035';
wwv_flow_api.g_varchar2_table(681) := '292C20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E612D4952522D7461626C65436F6E7461696E6572202E6A732D737469636B795461626C654865616465722E69732D737475636B207B0D0A';
wwv_flow_api.g_varchar2_table(682) := '2020626F782D736861646F773A203020317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20373638707829207B0D0A20202E612D4952522D6275';
wwv_flow_api.g_varchar2_table(683) := '74746F6E733A6265666F7265207B0D0A202020206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A20207D0D0A7D0D0A2E612D4952522D7461626C65207472207464207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(684) := '642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E612D4952522D7461626C65207B0D0A2020626F726465722D636F6C6C617073653A2073657061726174653B0D0A7D0D0A2E612D4952522D746162';
wwv_flow_api.g_varchar2_table(685) := '6C652074723A686F766572207464207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E742D4952522D726567696F6E2D2D6E6F426F7264657273202E612D495252207B0D0A2020626F726465722D7261646975';
wwv_flow_api.g_varchar2_table(686) := '733A203270783B0D0A7D0D0A2E612D4952522D7461626C65207464207B0D0A2020626F726465722D6C6566743A2031707820736F6C696420236632663266323B0D0A2020626F726465722D746F703A2031707820736F6C696420236632663266323B0D0A';
wwv_flow_api.g_varchar2_table(687) := '7D0D0A2E612D4952522D7461626C652074722074643A6C6173742D6368696C64207B0D0A2020626F726465722D72696768742D636F6C6F723A20236632663266323B0D0A7D0D0A2E612D4952522D6865616465724C696E6B3A666F637573207B0D0A2020';
wwv_flow_api.g_varchar2_table(688) := '626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E612D4952522D7365617263682D6669656C643A666F637573207B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A2020626F';
wwv_flow_api.g_varchar2_table(689) := '782D736861646F773A202D31707820302030202330303736646620696E7365742C2031707820302030202330303736646620696E7365743B0D0A7D0D0A2E612D4952522D73696E676C65526F772D6E616D652C0D0A2E612D4952522D73696E676C65526F';
wwv_flow_api.g_varchar2_table(690) := '772D76616C7565207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20236630663066303B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E612D4952522D73696E676C65526F772D76616C7565207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(691) := '6F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D4952522D73696E676C65526F772D76616C7565207B0D0A20206261636B67726F756E642D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(692) := '37663766373B0D0A7D0D0A2E612D4952522D73696E676C65526F772D6E616D65207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E612D4952522D73696E676C65526F772D726F773A686F766572202E612D49';
wwv_flow_api.g_varchar2_table(693) := '52522D73696E676C65526F772D6E616D65207B0D0A20206261636B67726F756E642D636F6C6F723A20236630663066303B0D0A7D0D0A2E612D4952522D627574746F6E2E612D4952522D627574746F6E2D2D706167696E6174696F6E3A686F766572207B';
wwv_flow_api.g_varchar2_table(694) := '0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E612D4952522D7265706F727453756D6D6172792D6C6162656C2C0D0A2E612D4952522D636F6E74726F6C734C6162656C207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(695) := '2D636F6C6F723A20236666666666663B0D0A7D0D0A406D65646961206F6E6C792073637265656E20616E6420286D696E2D77696474683A20373639707829207B0D0A20202E69732D6D6178696D697A65642E742D4952522D726567696F6E202E742D6668';
wwv_flow_api.g_varchar2_table(696) := '742D7468656164202E612D4952522D686561646572207B0D0A20202020626F726465722D626F74746F6D3A2031707820736F6C696420236536653665363B0D0A20207D0D0A7D0D0A2E75692D7769646765742D636F6E74656E74202E612D4952522D6963';
wwv_flow_api.g_varchar2_table(697) := '6F6E4C6973742D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D4952522D69636F6E4C6973742D6C696E6B3A686F766572207B0D0A202062';
wwv_flow_api.g_varchar2_table(698) := '61636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E612D4952522D627574746F6E3A666F637573207B0D0A2020626F782D736861646F773A20696E68657269743B0D0A7D0D0A2E612D4952522D736F7274576964676574207B0D';
wwv_flow_api.g_varchar2_table(699) := '0A20206261636B67726F756E642D636F6C6F723A20726762612833322C2033322C2033322C20302E3935293B0D0A20202D7765626B69742D6261636B64726F702D66696C7465723A20626C757228347078293B0D0A2020636F6C6F723A20234646463B0D';
wwv_flow_api.g_varchar2_table(700) := '0A2020626F726465722D77696474683A20303B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A2020626F782D7368';
wwv_flow_api.g_varchar2_table(701) := '61646F773A2030203870782031367078207267626128302C20302C20302C20302E3235292C20302030203020317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E612D4952522D736F7274576964676574203A3A2D7765626B69742D';
wwv_flow_api.g_varchar2_table(702) := '7363726F6C6C626172207B0D0A202077696474683A203870783B0D0A20206865696768743A203870783B0D0A7D0D0A2E612D4952522D736F7274576964676574203A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(703) := '67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0D0A7D0D0A2E612D4952522D736F7274576964676574203A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(704) := '756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3235293B0D0A7D0D0A2E612D4952522D736F72745769646765742D68656C70207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B';
wwv_flow_api.g_varchar2_table(705) := '0D0A7D0D0A2E612D4952522D736F72745769646765742D616374696F6E73207B0D0A202070616464696E673A203870783B0D0A2020626F726465722D7261646975733A203270783B0D0A202077696474683A206175746F3B0D0A2020626F726465722D62';
wwv_flow_api.g_varchar2_table(706) := '6F74746F6D2D77696474683A20303B0D0A7D0D0A2E612D4952522D736F72745769646765742D616374696F6E732D6974656D207B0D0A2020626F726465722D72696768742D77696474683A20303B0D0A7D0D0A2E612D4952522D627574746F6E2E612D49';
wwv_flow_api.g_varchar2_table(707) := '52522D736F72745769646765742D627574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20234646463B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(708) := '2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E32293B0D0A7D0D0A2E612D4952522D6275';
wwv_flow_api.g_varchar2_table(709) := '74746F6E2E612D4952522D736F72745769646765742D627574746F6E3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E612D4952522D627574746F6E2E612D495252';
wwv_flow_api.g_varchar2_table(710) := '2D736F72745769646765742D627574746F6E2E69732D6163746976652C0D0A2E612D4952522D627574746F6E2E612D4952522D736F72745769646765742D627574746F6E3A6163746976653A666F637573207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(711) := '6C6F723A207267626128302C20302C20302C20302E35293B0D0A7D0D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C207B0D0A20206865696768743A20343070783B0D0A202070616464696E673A2031327078203870783B0D';
wwv_flow_api.g_varchar2_table(712) := '0A7D0D0A2E612D4952522D736F72745769646765742D7365617263684C6162656C3A6265666F7265207B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72';
wwv_flow_api.g_varchar2_table(713) := '745769646765742D7365617263684669656C645B747970653D2274657874225D207B0D0A2020617070656172616E63653A206E6F6E653B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E31';
wwv_flow_api.g_varchar2_table(714) := '293B0D0A20206865696768743A20343070783B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E612D4952522D736F72745769646765742D736561726368203E202E612D4952522D736F72745769646765742D7365617263684669656C645B747970';
wwv_flow_api.g_varchar2_table(715) := '653D2274657874225D3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F7773207B0D0A2020626F726465722D746F70';
wwv_flow_api.g_varchar2_table(716) := '2D77696474683A20303B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F77207B0D0A2020636F6C6F723A20234646463B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F';
wwv_flow_api.g_varchar2_table(717) := '773A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A7D0D0A2E612D4952522D736F72745769646765742D726F773A666F637573207B0D0A2020626F782D73';
wwv_flow_api.g_varchar2_table(718) := '6861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E612D4947202E612D4952522D736F72745769646765743A6265666F7265207B0D0A2020636F6C6F723A20726762612833322C2033322C2033322C20302E3935';
wwv_flow_api.g_varchar2_table(719) := '293B0D0A7D0D0A2E612D495252202E686F75722D6772617068207370616E2E686F75722E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236530653065302021696D706F7274616E743B0D0A7D0D0A2E612D495252202E68';
wwv_flow_api.g_varchar2_table(720) := '6F75722D6772617068207370616E2E686F7572207B0D0A20206261636B67726F756E642D636F6C6F723A20236231646461622021696D706F7274616E743B0D0A7D0D0A2E6F6A2D6476742D63617465676F727931207B0D0A2020636F6C6F723A20233330';
wwv_flow_api.g_varchar2_table(721) := '394644423B0D0A7D0D0A2E6F6A2D6476742D63617465676F727932207B0D0A2020636F6C6F723A20233343414638353B0D0A7D0D0A2E6F6A2D6476742D63617465676F727933207B0D0A2020636F6C6F723A20234642434534413B0D0A7D0D0A2E6F6A2D';
wwv_flow_api.g_varchar2_table(722) := '6476742D63617465676F727934207B0D0A2020636F6C6F723A20234539354235343B0D0A7D0D0A2E6F6A2D6476742D63617465676F727935207B0D0A2020636F6C6F723A20233835344539423B0D0A7D0D0A2E6F6A2D6476742D63617465676F72793620';
wwv_flow_api.g_varchar2_table(723) := '7B0D0A2020636F6C6F723A20233245424642433B0D0A7D0D0A2E6F6A2D6476742D63617465676F727937207B0D0A2020636F6C6F723A20234544383133453B0D0A7D0D0A2E6F6A2D6476742D63617465676F727938207B0D0A2020636F6C6F723A202345';
wwv_flow_api.g_varchar2_table(724) := '38354438383B0D0A7D0D0A2E6F6A2D6476742D63617465676F727939207B0D0A2020636F6C6F723A20233133423643463B0D0A7D0D0A2E6F6A2D6476742D63617465676F72793130207B0D0A2020636F6C6F723A20233831424235463B0D0A7D0D0A2E6F';
wwv_flow_api.g_varchar2_table(725) := '6A2D6476742D63617465676F72793131207B0D0A2020636F6C6F723A20234341353839443B0D0A7D0D0A2E6F6A2D6476742D63617465676F72793132207B0D0A2020636F6C6F723A20234444444535333B0D0A7D0D0A2E6F6A2D6C6567656E642C0D0A2E';
wwv_flow_api.g_varchar2_table(726) := '6F6A2D6C6567656E642D7469746C652C0D0A2E6F6A2D63686172742D7069652D63656E7465722D6C6162656C2C0D0A2E6F6A2D63686172742D78617869732D7469746C652C0D0A2E6F6A2D63686172742D79617869732D7469746C652C0D0A2E6F6A2D63';
wwv_flow_api.g_varchar2_table(727) := '686172742D7932617869732D7469746C652C0D0A2E6F6A2D63686172742D78617869732D7469636B2D6C6162656C2C0D0A2E6F6A2D63686172742D79617869732D7469636B2D6C6162656C2C0D0A2E6F6A2D63686172742D7932617869732D7469636B2D';
wwv_flow_api.g_varchar2_table(728) := '6C6162656C2C0D0A2E6F6A2D63686172742D646174612D6C6162656C2C0D0A2E6F6A2D6476742D6E6F2D646174612D6D657373616765207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2C0D0A';
wwv_flow_api.g_varchar2_table(729) := '2E742D4C696E6B734C6973742D6C696E6B207B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D4C696E6B734C6973742D69636F6E207B0D0A2020636F6C6F723A20236439643964393B0D0A7D0D0A2E742D4C696E6B';
wwv_flow_api.g_varchar2_table(730) := '734C6973742D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236632663266323B0D0A7D0D0A2E742D4C696E6B734C6973742D6C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020';
wwv_flow_api.g_varchar2_table(731) := '317078202330303736646620696E7365743B0D0A7D0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6974656D2D2D736570617261746F72207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(732) := '7267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D4C696E6B734C6973742D2D73686F774172726F77202E742D4C696E6B734C6973742D6C696E6B3A6265666F7265207B0D0A2020636F6C6F723A20236439643964393B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(733) := '742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(734) := '4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236562656265623B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(735) := '2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564203E202E742D4C696E6B734C6973742D6C696E6B202E742D4C696E6B734C6973742D6261646765207B0D0A20206261';
wwv_flow_api.g_varchar2_table(736) := '636B67726F756E642D636F6C6F723A20236266626662663B0D0A7D0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C69';
wwv_flow_api.g_varchar2_table(737) := '6E6B3A686F7665723A6265666F7265207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E35293B0D0A7D0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973742D6C696E';
wwv_flow_api.g_varchar2_table(738) := '6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4C696E6B734C6973742D2D627269676874486F766572202E742D4C696E6B734C6973';
wwv_flow_api.g_varchar2_table(739) := '742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3735293B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E';
wwv_flow_api.g_varchar2_table(740) := '646564207B0D0A20206261636B67726F756E642D636F6C6F723A20234643464346433B0D0A20206261636B67726F756E643A206C696E6561722D6772616469656E74287267626128302C20302C20302C20302E303135292C207267626128302C20302C20';
wwv_flow_api.g_varchar2_table(741) := '302C203029292C206C696E6561722D6772616469656E74287267626128302C20302C20302C2030292C207267626128302C20302C20302C20302E30313529293B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E';
wwv_flow_api.g_varchar2_table(742) := '742D4C696E6B734C6973742D6C696E6B3A686F7665723A6265666F7265207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D4C696E6B734C6973742D6974656D2E69732D657870616E646564202E742D4C696E6B734C6973742D6C69';
wwv_flow_api.g_varchar2_table(743) := '6E6B3A6265666F7265207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A2E742D4C696E6B734C6973742D2D73686F774261646765202E742D4C696E6B734C6973742D6261646765207B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(744) := '722D7261646975733A203470783B0D0A7D0D0A2E742D4C696E6B734C6973742D2D69636F6E4F6E6C79202E742D4C696E6B734C6973742D69636F6E207B0D0A2020626F726465722D7261646975733A20313030253B0D0A7D0D0A2E742D4C696E6B734C69';
wwv_flow_api.g_varchar2_table(745) := '73742D2D616374696F6E73202E742D4C696E6B734C6973742D6C6162656C207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D69636F6E207B0D0A20';
wwv_flow_api.g_varchar2_table(746) := '20636F6C6F723A20233230323032303B0D0A7D0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D69636F6E2C0D0A2E742D4C696E6B734C6973742D';
wwv_flow_api.g_varchar2_table(747) := '2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572202E742D4C696E6B734C6973742D6C6162656C2C0D0A2E742D4C696E6B734C6973742D2D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F76657220';
wwv_flow_api.g_varchar2_table(748) := '2E742D4C696E6B734C6973742D6261646765207B0D0A2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D4C696E6B734C6973742D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(749) := '636F6C6F723A20236563656365633B0D0A7D0D0A2E612D4C697374566965772D6974656D207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E612D4C69737456';
wwv_flow_api.g_varchar2_table(750) := '6965772D6974656D202E75692D62746E207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E612D4C697374566965772D6974656D202E75692D62746E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261';
wwv_flow_api.g_varchar2_table(751) := '28302C20302C20302C20302E3035293B0D0A7D0D0A2E612D4C697374566965772D6974656D202E6661207B0D0A2020636F6C6F723A20236439643964393B0D0A7D0D0A2E612D4C697374566965772D6974656D202E75692D6C692D636F756E74207B0D0A';
wwv_flow_api.g_varchar2_table(752) := '2020636F6C6F723A20233539353935393B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D50616765426F64792D2D6C6F67696E207B0D0A20206261636B67726F756E642D636F6C6F723A20236530653065';
wwv_flow_api.g_varchar2_table(753) := '303B0D0A7D0D0A2E742D4C6F67696E506167652D2D6267312C0D0A2E742D4C6F67696E506167652D2D6267322C0D0A2E742D4C6F67696E506167652D2D626733207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D';
wwv_flow_api.g_varchar2_table(754) := '0A2E6170702D69636F6E207B0D0A20206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0D0A20206261636B67726F756E642D73697A653A20636F7665723B0D0A20206261636B67726F756E642D706F736974696F6E3A20353025';
wwv_flow_api.g_varchar2_table(755) := '3B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D4C6F67696E2D69636F6E56616C69646174696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132433B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(756) := '3A20236666663B0D0A7D0D0A2E742D4C6F67696E2D726567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A2020626F782D736861646F773A2030203870782032';
wwv_flow_api.g_varchar2_table(757) := '347078202D347078207267626128302C20302C20302C20302E32292C20302030203020317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D4C6F67696E506167652D2D73706C6974202E742D4C6F67696E2D636F6E7461696E65';
wwv_flow_api.g_varchar2_table(758) := '72207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3635293B0D0A2020626F782D736861646F773A203020302032347078202D347078207267626128302C20302C20302C20302E32292C';
wwv_flow_api.g_varchar2_table(759) := '20302030203020317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E612D4D44456469746F72202E612D546F6F6C626172207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A';
wwv_flow_api.g_varchar2_table(760) := '20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A2020626F726465722D746F702D6C6566742D7261646975733A20302E3272656D3B0D0A2020626F726465722D746F702D72696768742D726164';
wwv_flow_api.g_varchar2_table(761) := '6975733A20302E3272656D3B0D0A7D0D0A2E612D4D44456469746F72202E612D546F6F6C626172202E612D427574746F6E3A6E6F74283A686F766572293A6E6F74283A616374697665293A6E6F74283A666F637573293A6E6F74282E69732D6163746976';
wwv_flow_api.g_varchar2_table(762) := '6529207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E612D4D44456469746F722D7072657669657750616E656C2C0D0A2E612D4D4445646974';
wwv_flow_api.g_varchar2_table(763) := '6F722074657874617265612E617065782D6974656D2D74657874617265612C0D0A2E612D4D44456469746F72202E436F64654D6972726F72207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A20';
wwv_flow_api.g_varchar2_table(764) := '206261636B67726F756E642D636F6C6F723A20236666663B0D0A2020636F6C6F723A20233230323032303B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A20302E3272656D3B0D0A2020626F726465722D626F74746F6D2D72';
wwv_flow_api.g_varchar2_table(765) := '696768742D7261646975733A20302E3272656D3B0D0A7D0D0A2E612D4D44456469746F722D7072657669657750616E656C3A666F6375732C0D0A2E612D4D44456469746F722074657874617265612E617065782D6974656D2D74657874617265613A666F';
wwv_flow_api.g_varchar2_table(766) := '6375732C0D0A2E612D4D44456469746F72202E436F64654D6972726F723A666F6375732C0D0A2E612D4D44456469746F722D7072657669657750616E656C2E436F64654D6972726F722D666F63757365642C0D0A2E612D4D44456469746F722074657874';
wwv_flow_api.g_varchar2_table(767) := '617265612E617065782D6974656D2D74657874617265612E436F64654D6972726F722D666F63757365642C0D0A2E612D4D44456469746F72202E436F64654D6972726F722E436F64654D6972726F722D666F6375736564207B0D0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(768) := '636F6C6F723A20233030373664663B0D0A7D0D0A2E436F64654D6972726F722D637572736F72207B0D0A2020626F726465722D6C6566742D636F6C6F723A20233230323032302021696D706F7274616E743B0D0A7D0D0A2E69732D6D61726B646F776E69';
wwv_flow_api.g_varchar2_table(769) := '666965642068312C0D0A2E69732D6D61726B646F776E69666965642068322C0D0A2E69732D6D61726B646F776E69666965642068332C0D0A2E69732D6D61726B646F776E69666965642068342C0D0A2E69732D6D61726B646F776E69666965642068352C';
wwv_flow_api.g_varchar2_table(770) := '0D0A2E69732D6D61726B646F776E6966696564206836207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E69732D6D61726B646F776E6966696564206872207B0D0A20206261636B67726F756E643A206E6F6E653B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(771) := '722D746F702D636F6C6F723A207267626128302C20302C20302C20302E32293B0D0A7D0D0A2E69732D6D61726B646F776E696669656420626C6F636B71756F7465207B0D0A2020626F726465722D6C6566742D636F6C6F723A207267626128302C20302C';
wwv_flow_api.g_varchar2_table(772) := '20302C20302E31293B0D0A7D0D0A2E69732D6D61726B646F776E696669656420636F6465207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A2020626F782D736861646F773A20696E7365';
wwv_flow_api.g_varchar2_table(773) := '74207267626128302C20302C20302C20302E303529203020302030203170783B0D0A7D0D0A2E69732D6D61726B646F776E696669656420707265207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235';
wwv_flow_api.g_varchar2_table(774) := '293B0D0A2020626F782D736861646F773A20696E736574207267626128302C20302C20302C20302E303529203020302030203170783B0D0A7D0D0A2E69732D6D61726B646F776E69666965642070726520636F6465207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(775) := '642D636F6C6F723A207472616E73706172656E743B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E69732D6D61726B646F776E6966696564207461626C65207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D';
wwv_flow_api.g_varchar2_table(776) := '0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A2020626F782D736861646F773A20302032707820347078202D327078207267626128302C20302C20302C20302E303735293B0D0A7D0D0A2E69732D6D6172';
wwv_flow_api.g_varchar2_table(777) := '6B646F776E6966696564207461626C65207468207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303135293B0D0A7D0D0A2E69732D6D61726B646F776E6966696564207461626C652074682C0D0A2E69';
wwv_flow_api.g_varchar2_table(778) := '732D6D61726B646F776E6966696564207461626C65207464207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E69732D6D61726B646F776E6966696564207461626C6520';
wwv_flow_api.g_varchar2_table(779) := '74723A686F766572207464207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E30313235293B0D0A7D0D0A2E69732D6D61726B646F776E6966696564207461626C652074723A686F766572207468207B0D';
wwv_flow_api.g_varchar2_table(780) := '0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3235293B0D0A7D0D0A2E742D4D656469614C697374207B0D0A2020626F726465722D636F6C6F723A20236530653065303B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(781) := '2D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4D656469614C6973742D6974656D207B0D0A2020626F726465722D636F6C6F723A20236530653065303B0D0A7D0D0A2E742D4D656469614C6973742D6974656D2E69732D616374697665207B';
wwv_flow_api.g_varchar2_table(782) := '0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D4D656469614C6973742D2D686F72697A6F6E74616C202E742D4D656469614C6973742D6974656D207B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(783) := '722D72696768743A2031707820736F6C696420236530653065303B0D0A7D0D0A612E742D4D656469614C6973742D6974656D57726170207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A612E742D4D656469614C6973742D6974656D5772';
wwv_flow_api.g_varchar2_table(784) := '61703A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A612E742D4D656469614C6973742D6974656D577261703A666F637573207B0D0A2020626F';
wwv_flow_api.g_varchar2_table(785) := '782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D4D656469614C6973742D6974656D57726170207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4D656469614C6973742D62';
wwv_flow_api.g_varchar2_table(786) := '61646765207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D4D656469614C6973742D62616467652C0D0A2E742D4D656469614C6973742D64657363207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(787) := '6F723A20233733373337333B0D0A7D0D0A2E742D4D656469614C6973742D69636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4D656469614C69';
wwv_flow_api.g_varchar2_table(788) := '73742D2D636F6C73207B0D0A2020626F782D736861646F773A202D317078202D31707820302030202365306530653020696E7365743B0D0A7D0D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974656D3A6265666F';
wwv_flow_api.g_varchar2_table(789) := '72652C0D0A2E742D4D656469614C6973742D2D636F6C73202E742D4D656469614C6973742D6974656D3A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E612D4D656E752D636F6E74656E7420';
wwv_flow_api.g_varchar2_table(790) := '7B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A2020626F726465722D77696474683A20303B0D0A2020626F782D736861646F773A2030203870782031367078';
wwv_flow_api.g_varchar2_table(791) := '207267626128302C20302C20302C20302E3235292C20302030203020317078207267626128302C20302C20302C20302E31293B0D0A202070616464696E673A2038707820303B0D0A7D0D0A2E612D4D656E752D636F6E74656E74202E612D4D656E752D73';
wwv_flow_api.g_varchar2_table(792) := '63726F6C6C42746E2D2D646F776E2C0D0A2E612D4D656E752D636F6E74656E74202E612D4D656E752D7363726F6C6C42746E2D2D7570207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A2020636F6C6F723A20233236';
wwv_flow_api.g_varchar2_table(793) := '323632363B0D0A7D0D0A2E612D4D656E75207B0D0A20206D696E2D77696474683A2031363070783B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D207B0D0A20206C696E652D6865696768743A20333670783B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(794) := '233236323632363B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C2C0D0A2E612D4D656E75202E612D4D656E752D6974656D203E202E612D4D656E752D696E6E';
wwv_flow_api.g_varchar2_table(795) := '6572202E612D4D656E752D7375624D656E75436F6C207B0D0A20206F7061636974793A20302E38353B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D666F63757365642C0D0A2E612D4D656E75202E612D4D656E752D6974656D';
wwv_flow_api.g_varchar2_table(796) := '2E69732D657870616E646564207B0D0A2020636F6C6F723A20236666666666663B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D2E69732D64697361626C6564';
wwv_flow_api.g_varchar2_table(797) := '2E69732D666F6375736564207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E35293B0D0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D697465';
wwv_flow_api.g_varchar2_table(798) := '6D2E69732D64697361626C65642E69732D666F6375736564203E202E612D4D656E752D696E6E6572202E612D4D656E752D616363656C207B0D0A20206F7061636974793A20302E353B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D202E';
wwv_flow_api.g_varchar2_table(799) := '612D4D656E752D7375624D656E75436F6C207B0D0A20206865696768743A20333670783B0D0A202070616464696E673A203130707820347078203130707820303B0D0A7D0D0A2E612D4D656E75202E612D4D656E752D6974656D202E612D4D656E752D73';
wwv_flow_api.g_varchar2_table(800) := '7461747573436F6C207B0D0A202070616464696E673A2031307078203870783B0D0A7D0D0A2E612D4D656E752D68536570617261746F72207B0D0A2020626F726465722D636F6C6F723A20726762612833382C2033382C2033382C20302E31293B0D0A20';
wwv_flow_api.g_varchar2_table(801) := '206D617267696E2D746F703A203470783B0D0A202070616464696E672D746F703A203270783B0D0A202070616464696E672D626F74746F6D3A203270783B0D0A7D0D0A2E752D63616C6C6F75743A6265666F7265207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(802) := '2D636F6C6F723A20234646464646463B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E612D4D656E754261722D6C6162656C207B0D0A2020646973706C61793A20696E6C';
wwv_flow_api.g_varchar2_table(803) := '696E652D626C6F636B3B0D0A2020666F6E742D73697A653A20312E3472656D3B0D0A20206C696E652D6865696768743A20312E3672656D3B0D0A202070616464696E673A20313270783B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B';
wwv_flow_api.g_varchar2_table(804) := '0D0A2020666C65782D67726F773A20313B0D0A7D0D0A2E612D4D656E754261722D6C6162656C3A686F766572207B0D0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A2020746578742D6465636F726174696F6E3A20';
wwv_flow_api.g_varchar2_table(805) := '6E6F6E653B0D0A7D0D0A2E612D4D656E754261722D6C6162656C202B202E612D4D656E752D7375624D656E75436F6C207B0D0A2020666C65782D736872696E6B3A20303B0D0A2020616C69676E2D73656C663A2063656E7465723B0D0A20206C696E652D';
wwv_flow_api.g_varchar2_table(806) := '6865696768743A20313B0D0A7D0D0A2E612D4D656E754261722D6974656D207B0D0A2020646973706C61793A20666C65783B0D0A2020666C6F61743A206C6566743B0D0A202070616464696E673A20303B0D0A2020626F726465722D77696474683A2030';
wwv_flow_api.g_varchar2_table(807) := '203170783B0D0A2020626F782D736861646F773A206E6F6E653B0D0A20206D617267696E2D6C6566743A20303B0D0A20206261636B67726F756E642D636C69703A20636F6E74656E742D626F783B0D0A7D0D0A2E752D52544C202E612D4D656E75426172';
wwv_flow_api.g_varchar2_table(808) := '2D6974656D207B0D0A2020666C6F61743A2072696768743B0D0A7D0D0A2E612D4D656E754261722D6974656D2E69732D657870616E646564207B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E612D4D656E754261722D6974656D3A686F76';
wwv_flow_api.g_varchar2_table(809) := '6572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0D0A2020626F726465722D6C6566742D77696474683A20303B0D0A7D';
wwv_flow_api.g_varchar2_table(810) := '0D0A2E752D52544C202E612D4D656E754261722D6974656D3A66697273742D6368696C64207B0D0A2020626F726465722D72696768742D77696474683A20303B0D0A2020626F726465722D6C6566742D77696474683A203170783B0D0A7D0D0A2E612D4D';
wwv_flow_api.g_varchar2_table(811) := '656E754261722D6974656D2E69732D666F6375736564207B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261722D6C6162656C207B';
wwv_flow_api.g_varchar2_table(812) := '0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C2C0D0A2E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E61';
wwv_flow_api.g_varchar2_table(813) := '2D4D656E752D7375624D656E75436F6C207B0D0A2020626F726465722D77696474683A20303B0D0A202070616464696E673A20302031327078203020303B0D0A7D0D0A2E752D52544C202E612D4D656E754261722D6974656D203E202E612D4D656E752D';
wwv_flow_api.g_varchar2_table(814) := '7375624D656E75436F6C2C0D0A2E752D52544C202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D656E75436F6C207B0D0A202070616464696E672D72696768743A20303B0D0A2020706164';
wwv_flow_api.g_varchar2_table(815) := '64696E672D6C6566743A20313270783B0D0A2020626F726465722D72696768743A20302021696D706F7274616E743B0D0A7D0D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D0A';
wwv_flow_api.g_varchar2_table(816) := '2020626F726465722D7261646975733A2031322E35253B0D0A7D0D0A2E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E3A6265666F7265207B0D0A2020636F6E74656E743A20275C65306332';
wwv_flow_api.g_varchar2_table(817) := '273B0D0A7D0D0A2E612D4D656E754261722D6974656D203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C207B0D0A20206D617267696E2D6C6566743A202D3670783B0D0A7D0D0A2E752D52544C202E612D4D656E754261722D69';
wwv_flow_api.g_varchar2_table(818) := '74656D203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C207B0D0A20206D617267696E2D6C6566743A20303B0D0A20206D617267696E2D72696768743A202D3670783B0D0A7D0D0A2E742D4865616465722D6E61762D6C697374';
wwv_flow_api.g_varchar2_table(819) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20233333336434363B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D48656164';
wwv_flow_api.g_varchar2_table(820) := '65722D6E6176202E742D4D656E752D6261646765207B0D0A202070616464696E673A2030203670783B0D0A2020666F6E742D73697A653A20313170783B0D0A20206C696E652D6865696768743A20696E68657269743B0D0A2020666F6E742D7765696768';
wwv_flow_api.g_varchar2_table(821) := '743A203530303B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B0D0A2020766572746963616C2D616C69676E';
wwv_flow_api.g_varchar2_table(822) := '3A20746F703B0D0A20206D617267696E2D6C6566743A203470783B0D0A2020626F726465722D7261646975733A20313670783B0D0A7D0D0A2E752D52544C202E742D4865616465722D6E6176202E742D4D656E752D6261646765207B0D0A20206D617267';
wwv_flow_api.g_varchar2_table(823) := '696E2D6C6566743A20303B0D0A20206D617267696E2D72696768743A203470783B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D207B0D0A2020626F726465722D636F6C6F723A20233433346335333B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(824) := '2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20206261636B67726F756E642D636F6C6F723A20233234326233313B0D0A2020626F782D736861646F773A20302030203020317078202330';
wwv_flow_api.g_varchar2_table(825) := '303736646620696E7365743B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(826) := '2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F63';
wwv_flow_api.g_varchar2_table(827) := '757365642C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D';
wwv_flow_api.g_varchar2_table(828) := '657870616E646564207B0D0A20206261636B67726F756E642D636F6C6F723A20233165323332383B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E74202E612D4D656E754261';
wwv_flow_api.g_varchar2_table(829) := '722D6C6162656C2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4865616465722D6E617620';
wwv_flow_api.g_varchar2_table(830) := '2E612D4D656E754261722D6974656D2E69732D657870616E646564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D65787061';
wwv_flow_api.g_varchar2_table(831) := '6E646564202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E61';
wwv_flow_api.g_varchar2_table(832) := '2D49636F6E207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E38293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E';
wwv_flow_api.g_varchar2_table(833) := '752D7375624D656E75436F6C3A686F766572202E612D49636F6E2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D666F6375736564203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C20';
wwv_flow_api.g_varchar2_table(834) := '2E612D49636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3135293B0D0A7D0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E';
wwv_flow_api.g_varchar2_table(835) := '646564203E202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E2C0D0A2E742D4865616465722D6E6176202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C3A686F';
wwv_flow_api.g_varchar2_table(836) := '766572202E612D49636F6E207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4D656E75';
wwv_flow_api.g_varchar2_table(837) := '426172207B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A2E742D4D656E75';
wwv_flow_api.g_varchar2_table(838) := '426172202E612D4D656E754261722D6974656D207B0D0A2020626F726465722D636F6C6F723A20236534653465343B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D666F6375736564207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(839) := '726F756E642D636F6C6F723A20236630663066303B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D';
wwv_flow_api.g_varchar2_table(840) := '4D656E752D2D63757272656E742E69732D666F63757365642C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D657870616E6465642C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E';
wwv_flow_api.g_varchar2_table(841) := '752D2D63757272656E742E69732D657870616E646564207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E';
wwv_flow_api.g_varchar2_table(842) := '74202E612D4D656E754261722D6C6162656C2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D666F6375736564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4D656E';
wwv_flow_api.g_varchar2_table(843) := '75426172202E612D4D656E754261722D6974656D2E69732D657870616E646564202E612D4D656E754261722D6C6162656C2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D63757272656E742E69732D6578';
wwv_flow_api.g_varchar2_table(844) := '70616E646564202E612D4D656E754261722D6C6162656C207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D203E202E612D4D656E752D7375624D656E75436F6C202E612D';
wwv_flow_api.g_varchar2_table(845) := '49636F6E207B0D0A2020636F6C6F723A20726762612835362C2035362C2035362C20302E38293B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E612D4D656E752D2D73706C6974203E202E612D4D656E752D7375624D65';
wwv_flow_api.g_varchar2_table(846) := '6E75436F6C3A686F766572202E612D49636F6E2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D666F6375736564203E20627574746F6E202B202E612D4D656E752D7375624D656E75436F6C202E612D49636F6E207B0D';
wwv_flow_api.g_varchar2_table(847) := '0A20206261636B67726F756E642D636F6C6F723A20726762612835362C2035362C2035362C20302E3135293B0D0A7D0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375';
wwv_flow_api.g_varchar2_table(848) := '624D656E75436F6C202E612D49636F6E2C0D0A2E742D4D656E75426172202E612D4D656E754261722D6974656D2E69732D657870616E646564203E202E612D4D656E752D7375624D656E75436F6C3A686F766572202E612D49636F6E207B0D0A20206261';
wwv_flow_api.g_varchar2_table(849) := '636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E742D4E617654616273207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(850) := '2D636F6C6F723A20233333336434363B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D7363726F6C6C6261722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20233234326233313B0D0A2020626F782D73686164';
wwv_flow_api.g_varchar2_table(851) := '6F773A20696E7365742031707820302030203020233333336434363B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A202333';
wwv_flow_api.g_varchar2_table(852) := '65346135343B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0D0A20206261636B67726F756E643A20233333336434363B0D0A7D0D0A2E742D4E6176546162733A3A2D7765626B69742D736372';
wwv_flow_api.g_varchar2_table(853) := '6F6C6C6261722D747261636B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233534363437323B0D0A7D0D0A2E742D4E6176546162732D6974656D207B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(854) := '722D636F6C6F723A20233365346135343B0D0A7D0D0A2E742D4E6176546162732D6974656D3A686F7665722C0D0A2E742D4E6176546162732D6974656D2E69732D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A202331653233';
wwv_flow_api.g_varchar2_table(855) := '32383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D4E6176546162732D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233165323332383B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(856) := '742D506F7075704C4F562D6C696E6B7320613A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030366564303B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D506F7075704C4F562D726573756C747353';
wwv_flow_api.g_varchar2_table(857) := '65742074723A686F766572207464207B0D0A20206261636B67726F756E642D636F6C6F723A20234543463246422021696D706F7274616E743B0D0A7D0D0A2E742D506F7075704C4F562D726573756C74735365742074723A6E74682D6368696C6428326E';
wwv_flow_api.g_varchar2_table(858) := '29207464207B0D0A20206261636B67726F756E642D636F6C6F723A20234641464146413B0D0A7D0D0A2E742D506F7075704C4F562D726573756C74735365742D6C696E6B2C0D0A2E75692D7769646765742D636F6E74656E7420612E742D506F7075704C';
wwv_flow_api.g_varchar2_table(859) := '4F562D726573756C74735365742D6C696E6B207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A2E742D506167652D2D706F7075704C4F56207B0D0A20206261636B67726F756E642D636F6C6F723A20234646463B0D0A7D0D0A2E742D506F';
wwv_flow_api.g_varchar2_table(860) := '7075704C4F562D616374696F6E73207B0D0A20206261636B67726F756E642D636F6C6F723A20234644464446443B0D0A2020626F782D736861646F773A2030202D3170782030207267626128302C20302C20302C20302E31352920696E7365743B0D0A7D';
wwv_flow_api.g_varchar2_table(861) := '0D0A2E742D426F6479202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(862) := '20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E742D506F7075704C4F562D6C696E6B7320';
wwv_flow_api.g_varchar2_table(863) := '612C0D0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D6C696E6B732061207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D506F7075704C4F562D6C696E6B7320613A686F766572207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(864) := '67726F756E642D636F6C6F723A20233034383966663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E742D506F7075704C4F562D706167696E6174696F6E207B0D0A2020636F6C6F723A20233765376537653B0D0A7D';
wwv_flow_api.g_varchar2_table(865) := '0D0A2E742D426F64792D7469746C65202E742D506F7075704C4F562D706167696E6174696F6E207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E666F202E742D506F7075704C4F562D706167696E6174696F6E20';
wwv_flow_api.g_varchar2_table(866) := '7B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E2C0D0A2E742D427574746F6E526567696F6E202E742D506F7075704C4F562D706167696E6174696F6E207B';
wwv_flow_api.g_varchar2_table(867) := '0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E612D506F7075704C4F562D736561726368426172207B0D0A202070616464696E673A203870783B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D49636F6E4C697374';
wwv_flow_api.g_varchar2_table(868) := '2D6974656D207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D49636F6E4C6973742D6974656D3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(869) := '373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078202330303639633620696E7365743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D49636F6E4C697374';
wwv_flow_api.g_varchar2_table(870) := '2D6974656D3A686F7665722061207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D506F7075704C4F562D726573756C7473202E612D47562D6C6F61644D6F7265207B0D0A2020626F726465722D746F702D636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(871) := '6128302C20302C20302C20302E3135293B0D0A7D0D0A2E612D47562D6C6F61644D6F7265427574746F6E207B0D0A2020636F6C6F723A20233338333833383B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A2020626F78';
wwv_flow_api.g_varchar2_table(872) := '2D736861646F773A20302030203020317078207267626128302C20302C20302C20302E3132352920696E7365743B0D0A7D0D0A2E612D47562D6C6F61644D6F7265427574746F6E3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(873) := '20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E31352920696E7365743B0D0A7D0D0A2E612D47562D6C6F61644D6F7265427574746F6E3A666F637573207B0D0A20206261';
wwv_flow_api.g_varchar2_table(874) := '636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E612D47562D6C6F61644D6F7265427574746F6E3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0D0A7D0D0A2E612D47562D6C';
wwv_flow_api.g_varchar2_table(875) := '6F61644D6F7265427574746F6E3A6163746976653A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742C20302030203170782030207267626128352C203131342C203230362C20302E32';
wwv_flow_api.g_varchar2_table(876) := '35293B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D706F7075702D6C6F76202E617065782D6974656D2D6D756C74692D6974656D203E207370616E207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C2030';
wwv_flow_api.g_varchar2_table(877) := '2C20302E3035293B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D706F7075702D6C6F76202E617065782D6974656D2D6D756C74692D6974656D2E69732D616374697665203E207370616E207B0D0A2020626F782D736861646F773A20302030';
wwv_flow_api.g_varchar2_table(878) := '203020317078202330303736646620696E7365743B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D706F7075702D6C6F76202E617065782D6974656D2D6D756C74692D72656D6F7665207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(879) := '207472616E73706172656E743B0D0A7D0D0A2E617065782D6974656D2D67726F75702D2D706F7075702D6C6F76202E617065782D6974656D2D6D756C74692D72656D6F76653A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(880) := '67626128302C20302C20302C20302E3035293B0D0A7D0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F762C0D0A2E61';
wwv_flow_api.g_varchar2_table(881) := '7065782D6974656D2D6D756C7469207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D636F6C6F723A20236466646664663B0D0A7D0D0A2E617065';
wwv_flow_api.g_varchar2_table(882) := '782D6974656D2D746578742E612D506F7075704C4F562D7365617263683A666F6375732C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F6375732C0D0A2E617065782D6974656D2D6D756C74693A66';
wwv_flow_api.g_varchar2_table(883) := '6F6375732C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682E69732D666F63757365642C0D0A2E617065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F762E69732D666F6375736564';
wwv_flow_api.g_varchar2_table(884) := '2C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564207B0D0A2020636F6C6F723A20233230323032303B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666662021696D706F7274616E743B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(885) := '65722D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263683A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E61';
wwv_flow_api.g_varchar2_table(886) := '7065782D6974656D2D746578742E617065782D6974656D2D706F7075702D6C6F763A666F637573202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74693A666F637573202B202E612D427574746F6E2D2D';
wwv_flow_api.g_varchar2_table(887) := '706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E612D506F7075704C4F562D7365617263682E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D746578742E61706578';
wwv_flow_api.g_varchar2_table(888) := '2D6974656D2D706F7075702D6C6F762E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F562C0D0A2E617065782D6974656D2D6D756C74692E69732D666F6375736564202B202E612D427574746F6E2D2D706F7075704C4F56';
wwv_flow_api.g_varchar2_table(889) := '207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E742E612D506F7075704C4F562D6469616C6F67207B0D0A2020';
wwv_flow_api.g_varchar2_table(890) := '6261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D506F7075704C4F562D646F5365617263683A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(891) := '0A2E612D506F7075704C4F562D7365617263684261722C0D0A2E612D506F7075704C4F562D636C656172207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E612D506F7075';
wwv_flow_api.g_varchar2_table(892) := '704C4F562D636C656172427574746F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E612D506F7075704C4F562D636C656172427574746F6E3A';
wwv_flow_api.g_varchar2_table(893) := '686F766572207B0D0A2020636F6C6F723A20236666663B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E612D506F7075704C4F562D636C656172427574746F6E3A666F637573207B0D0A2020626F782D736861';
wwv_flow_api.g_varchar2_table(894) := '646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D526567696F6E207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D526567696F6E2C0D0A2E';
wwv_flow_api.g_varchar2_table(895) := '742D436F6E74656E74426C6F636B2D2D6C696768744247202E742D436F6E74656E74426C6F636B2D626F6479207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E6669656C646461746120';
wwv_flow_api.g_varchar2_table(896) := '62207B0D0A2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F64792D7469746C65202E6669656C64646174612062207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E6669656C646461';
wwv_flow_api.g_varchar2_table(897) := '74612062207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E6669656C646461746120622C0D0A2E742D427574746F6E526567696F6E202E6669656C64646174612062207B0D0A2020636F6C6F723A2023343034';
wwv_flow_api.g_varchar2_table(898) := '3034303B0D0A7D0D0A2E742D526567696F6E2D686561646572207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A20206261636B67726F756E642D636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(899) := '66663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020';
wwv_flow_api.g_varchar2_table(900) := '636F6C6F723A20233236323632363B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E643A207472616E73706172656E743B0D0A2020636F6C6F723A2023323032303230';
wwv_flow_api.g_varchar2_table(901) := '3B0D0A7D0D0A2E742D526567696F6E2D2D737461636B6564207B0D0A2020626F726465722D7261646975733A20302021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D6865616465';
wwv_flow_api.g_varchar2_table(902) := '72207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D42';
wwv_flow_api.g_varchar2_table(903) := '7574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D6E6F426F72646572203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567';
wwv_flow_api.g_varchar2_table(904) := '696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233330394644423B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D6163';
wwv_flow_api.g_varchar2_table(905) := '63656E7431203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7431203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A';
wwv_flow_api.g_varchar2_table(906) := '2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74312E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233330394644';
wwv_flow_api.g_varchar2_table(907) := '423B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233133423643463B0D0A2020636F6C6F723A20236534663966643B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(908) := '2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7432203E202E742D526567696F6E2D686561646572202E742D427574';
wwv_flow_api.g_varchar2_table(909) := '746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236534663966643B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74322E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020';
wwv_flow_api.g_varchar2_table(910) := '636F6C6F723A20233133423643463B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233245424642433B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(911) := '236630666366623B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7433203E202E742D526567696F6E2D';
wwv_flow_api.g_varchar2_table(912) := '686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236630666366623B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74332E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E';
wwv_flow_api.g_varchar2_table(913) := '2D686561646572207B0D0A2020636F6C6F723A20233245424642433B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233343414638';
wwv_flow_api.g_varchar2_table(914) := '353B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7434203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7434';
wwv_flow_api.g_varchar2_table(915) := '203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74342E742D526567696F6E2D2D74657874436F6E74656E';
wwv_flow_api.g_varchar2_table(916) := '74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233343414638353B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(917) := '636F6C6F723A20233831424235463B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D5265';
wwv_flow_api.g_varchar2_table(918) := '67696F6E2D2D616363656E7435203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74352E742D526567696F';
wwv_flow_api.g_varchar2_table(919) := '6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233831424235463B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D526567696F6E2D686561646572207B0D0A';
wwv_flow_api.g_varchar2_table(920) := '20206261636B67726F756E642D636F6C6F723A20234444444535333B0D0A2020636F6C6F723A20233261326130383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D';
wwv_flow_api.g_varchar2_table(921) := '2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7436203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233261326130383B0D0A7D0D0A2E742D526567696F6E2D2D6163';
wwv_flow_api.g_varchar2_table(922) := '63656E74362E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20234444444535333B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7437203E202E742D52656769';
wwv_flow_api.g_varchar2_table(923) := '6F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7437203E202E742D526567696F6E2D68656164';
wwv_flow_api.g_varchar2_table(924) := '6572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7437203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(925) := '2E742D526567696F6E2D2D616363656E74372E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20234642434534413B0D0A7D0D0A2E742D526567696F6E2D2D61636365';
wwv_flow_api.g_varchar2_table(926) := '6E7438203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234544383133453B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7438203E202E';
wwv_flow_api.g_varchar2_table(927) := '742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7438203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(928) := '236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74382E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20234544383133453B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(929) := '2D526567696F6E2D2D616363656E7439203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234539354235343B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E';
wwv_flow_api.g_varchar2_table(930) := '2D2D616363656E7439203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E7439203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B';
wwv_flow_api.g_varchar2_table(931) := '207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E74392E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A202345';
wwv_flow_api.g_varchar2_table(932) := '39354235343B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743130203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234538354438383B0D0A2020636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(933) := '0D0A7D0D0A2E742D526567696F6E2D2D616363656E743130203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743130203E202E742D526567696F6E2D686561646572';
wwv_flow_api.g_varchar2_table(934) := '202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431302E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D68656164';
wwv_flow_api.g_varchar2_table(935) := '6572207B0D0A2020636F6C6F723A20234538354438383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743131203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234341353839443B0D0A';
wwv_flow_api.g_varchar2_table(936) := '2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743131203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743131203E';
wwv_flow_api.g_varchar2_table(937) := '202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431312E742D526567696F6E2D2D74657874436F6E74656E74';
wwv_flow_api.g_varchar2_table(938) := '203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20234341353839443B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743132203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(939) := '636F6C6F723A20233835344539423B0D0A2020636F6C6F723A20236636663066383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743132203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D52';
wwv_flow_api.g_varchar2_table(940) := '6567696F6E2D2D616363656E743132203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236636663066383B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431322E742D5265';
wwv_flow_api.g_varchar2_table(941) := '67696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233835344539423B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743133203E202E742D526567696F6E2D686561646572';
wwv_flow_api.g_varchar2_table(942) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20233541363841443B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743133203E202E742D526567696F6E2D686561646572202E742D4275';
wwv_flow_api.g_varchar2_table(943) := '74746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743133203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D52656769';
wwv_flow_api.g_varchar2_table(944) := '6F6E2D2D616363656E7431332E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20233541363841443B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743134203E';
wwv_flow_api.g_varchar2_table(945) := '202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20234146424143353B0D0A2020636F6C6F723A20233331336134343B0D0A7D0D0A2E742D526567696F6E2D2D616363656E743134203E202E742D5265';
wwv_flow_api.g_varchar2_table(946) := '67696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743134203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E6B207B0D0A2020636F6C6F723A20233331';
wwv_flow_api.g_varchar2_table(947) := '336134343B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431342E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20234146424143353B0D0A7D0D0A2E742D52';
wwv_flow_api.g_varchar2_table(948) := '6567696F6E2D2D616363656E743135203E202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A20233645383539383B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D';
wwv_flow_api.g_varchar2_table(949) := '2D616363656E743135203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6E6F55492C0D0A2E742D526567696F6E2D2D616363656E743135203E202E742D526567696F6E2D686561646572202E742D427574746F6E2D2D6C696E';
wwv_flow_api.g_varchar2_table(950) := '6B207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E2D2D616363656E7431352E742D526567696F6E2D2D74657874436F6E74656E74203E202E742D526567696F6E2D686561646572207B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(951) := '233645383539383B0D0A7D0D0A2E742D526567696F6E2D626F6479207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E2D2D6869646553686F772E69732D636F6C6C6170736564207B0D0A2020626F726465722D626F';
wwv_flow_api.g_varchar2_table(952) := '74746F6D2D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F';
wwv_flow_api.g_varchar2_table(953) := '64792D616374696F6E73202E742D526567696F6E2D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D73696465202E742D526567696F6E207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(954) := '67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D526567696F6E2C0D0A2E742D526567696F6E2D686561646572207B0D0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A2E742D526567696F6E2D2D';
wwv_flow_api.g_varchar2_table(955) := '6E6F4247207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D526567696F6E207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E7370';
wwv_flow_api.g_varchar2_table(956) := '6172656E743B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E207B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20';
wwv_flow_api.g_varchar2_table(957) := '302C20302C20302E34293B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D526567696F6E2D2D636172';
wwv_flow_api.g_varchar2_table(958) := '6F7573656C202E612D546162732D627574746F6E3A686F766572207B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365742C20302031707820317078207267626128302C20302C';
wwv_flow_api.g_varchar2_table(959) := '20302C20302E3035293B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E3A6163746976652C0D0A';
wwv_flow_api.g_varchar2_table(960) := '2E742D526567696F6E2D2D6361726F7573656C202E612D546162732D627574746F6E3A6163746976653A666F637573207B0D0A20206F7061636974793A20313B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C';
wwv_flow_api.g_varchar2_table(961) := '20302C20302E312920696E7365742C20302031707820317078207267626128302C20302C20302C20302E30352920696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3735293B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(962) := '742D526567696F6E2D2D6361726F7573656C202E612D546162732D6E6578742D726567696F6E207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D54';
wwv_flow_api.g_varchar2_table(963) := '6162732D70726576696F75732D726567696F6E207B0D0A2020626F726465722D7261646975733A2030203270782032707820303B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974';
wwv_flow_api.g_varchar2_table(964) := '656D2E612D546162732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E34293B0D0A7D0D0A2E742D526567696F6E2D2D';
wwv_flow_api.g_varchar2_table(965) := '6361726F7573656C202E612D526567696F6E2D6361726F7573656C4E61764974656D2E612D546162732D73656C6563746564202E612D526567696F6E2D6361726F7573656C4C696E6B3A666F637573207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(966) := '723A20233030373664663B0D0A7D0D0A2E742D526567696F6E2D2D6361726F7573656C202E612D526567696F6E2D6361726F7573656C4C696E6B207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135';
wwv_flow_api.g_varchar2_table(967) := '293B0D0A2020626F726465722D7261646975733A20313030253B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D5265706F72742D63656C6C2C0D0A2E';
wwv_flow_api.g_varchar2_table(968) := '742D5265706F72742D636F6C48656164207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A7D0D0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D63656C6C3A6C6173742D6368696C642C0D';
wwv_flow_api.g_varchar2_table(969) := '0A2E742D5265706F72742D7265706F7274207472202E742D5265706F72742D636F6C486561643A6C6173742D6368696C64207B0D0A2020626F726465722D72696768743A2031707820736F6C696420236536653665363B0D0A7D0D0A2E752D52544C202E';
wwv_flow_api.g_varchar2_table(970) := '742D5265706F72742D7265706F7274207472202E742D5265706F72742D63656C6C3A6C6173742D6368696C642C0D0A2E752D52544C202E742D5265706F72742D7265706F7274207472202E742D5265706F72742D636F6C486561643A6C6173742D636869';
wwv_flow_api.g_varchar2_table(971) := '6C64207B0D0A2020626F726465722D6C6566743A2031707820736F6C696420236536653665363B0D0A7D0D0A2E742D5265706F72742D7265706F72742074723A6C6173742D6368696C64202E742D5265706F72742D63656C6C207B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(972) := '722D626F74746F6D3A2031707820736F6C696420236536653665363B0D0A7D0D0A2E742D5265706F7274202E69732D737475636B202E742D5265706F72742D636F6C48656164207B0D0A20206261636B67726F756E642D636F6C6F723A20726762612832';
wwv_flow_api.g_varchar2_table(973) := '35352C203235352C203235352C20302E3935293B0D0A20202D7765626B69742D6261636B64726F702D66696C7465723A20626C757228347078293B0D0A7D0D0A2E742D526567696F6E2D2D6E6F50616464696E67202E742D5265706F72742D2D686F7269';
wwv_flow_api.g_varchar2_table(974) := '7A6F6E74616C426F7264657273202E69732D737475636B202E742D5265706F72742D636F6C486561642C0D0A2E742D5265706F72742D2D696E6C696E65202E69732D737475636B202E742D5265706F72742D636F6C48656164207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(975) := '726F756E642D636F6C6F723A2072676261283235352C203235352C203235352C20302E3935293B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D5265706F72742D2D';
wwv_flow_api.g_varchar2_table(976) := '726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A686F766572202E742D5265706F72742D63656C6C2C0D0A2E742D5265706F72742D2D726F77486967686C69676874202E742D5265706F72742D7265706F72742074723A';
wwv_flow_api.g_varchar2_table(977) := '6E74682D6368696C64286F6464293A686F766572202E742D5265706F72742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236661666166612021696D706F7274616E743B0D0A7D0D0A2E742D5265706F72742D2D737461746963';
wwv_flow_api.g_varchar2_table(978) := '526F77436F6C6F7273202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(979) := '2E742D5265706F72742D2D616C74526F777344656661756C74202E742D5265706F72742D7265706F72742074723A6E74682D6368696C64286F646429202E742D5265706F72742D63656C6C207B0D0A20206261636B67726F756E642D636F6C6F723A2072';
wwv_flow_api.g_varchar2_table(980) := '67626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D5265706F72742D706167696E6174696F6E5465787420622C0D0A2E742D5265706F72742D706167696E6174696F6E5465787420613A686F766572207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(981) := '642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D5265706F72742D6C696E6B73207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E303735293B0D0A20';
wwv_flow_api.g_varchar2_table(982) := '206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A7D0D0A2E742D536561726368526573756C74732D64657363207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D5365617263';
wwv_flow_api.g_varchar2_table(983) := '68526573756C74732D64617465207B0D0A2020636F6C6F723A20233731373137313B0D0A7D0D0A2E742D536561726368526573756C74732D6D697363207B0D0A2020636F6C6F723A20233731373137313B0D0A7D0D0A2E742D526567696F6E202E742D53';
wwv_flow_api.g_varchar2_table(984) := '6561726368526573756C74732D64657363207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E742D536561726368526573756C74732D64617465207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(985) := '2E742D526567696F6E202E742D536561726368526573756C74732D6D697363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E612D53746172526174696E672D7374617273207B0D0A2020636F6C6F723A207267626128302C20302C20';
wwv_flow_api.g_varchar2_table(986) := '302C20302E3135293B0D0A7D0D0A2E612D53746172526174696E672D73746172732E69732D666F6375736564207B0D0A2020626F782D736861646F773A203020302030203170782063757272656E74436F6C6F7220696E7365743B0D0A7D0D0A2E612D53';
wwv_flow_api.g_varchar2_table(987) := '746172526174696E672D73746172732E69732D666F6375736564202E612D53746172526174696E672D73746172732D6667202E612D53746172526174696E672D73746172207B0D0A2020746578742D736861646F773A2030203020327078206375727265';
wwv_flow_api.g_varchar2_table(988) := '6E74436F6C6F723B0D0A7D0D0A2E612D53746172526174696E672D73746172732D6667207B0D0A2020636F6C6F723A20233030373664663B0D0A7D0D0A2E612D53746172526174696E672D76616C7565207B0D0A2020636F6C6F723A2023323432343234';
wwv_flow_api.g_varchar2_table(989) := '3B0D0A7D0D0A2E612D53746172526174696E672D636C6561723A666F637573207B0D0A2020626F782D736861646F773A20696E7365742023303037366466203020302030203170783B0D0A7D0D0A2E612D53746172526174696E672D2D64697361626C65';
wwv_flow_api.g_varchar2_table(990) := '64202E612D53746172526174696E672D73746172732D6667207B0D0A2020636F6C6F723A20696E697469616C3B0D0A7D0D0A2E742D5374617475734C6973742D626C6F636B486561646572207B0D0A2020636F6C6F723A20233236323632363B0D0A2020';
wwv_flow_api.g_varchar2_table(991) := '6261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(992) := '20302C20302C20302E3035293B0D0A7D0D0A2E742D5374617475734C6973742D68656164657254657874416C742C0D0A2E742D5374617475734C6973742D617474722C0D0A2E742D5374617475734C6973742D7465787444657363207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(993) := '6F723A20233733373337333B0D0A7D0D0A2E742D5374617475734C6973742D6974656D5469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C697374';
wwv_flow_api.g_varchar2_table(994) := '2D6D61726B6572207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E35293B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F782D';
wwv_flow_api.g_varchar2_table(995) := '736861646F773A20302030203020317078207267626128302C20302C20302C20302E312920696E7365743B0D0A7D0D0A2E742D5374617475734C6973742D2D6461746573202E742D5374617475734C6973742D6D61726B65723A6166746572207B0D0A20';
wwv_flow_api.g_varchar2_table(996) := '206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E32293B0D0A2020626F726465722D7261646975733A2032707820327078203020303B0D0A7D0D0A2E742D5374617475734C6973742D2D6461746573202E742D5374';
wwv_flow_api.g_varchar2_table(997) := '617475734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(998) := '0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6D61726B6572207B0D0A2020626F726465722D7261646975733A20323470783B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A20';
wwv_flow_api.g_varchar2_table(999) := '20636F6C6F723A20233430343034303B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E3135293B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D';
wwv_flow_api.g_varchar2_table(1000) := '2E69732D636F6D706C657465202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233730373037303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D53746174';
wwv_flow_api.g_varchar2_table(1001) := '75734C6973742D6974656D2E69732D64616E676572202E742D5374617475734C6973742D6D61726B65722C0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6572726F72202E742D53';
wwv_flow_api.g_varchar2_table(1002) := '74617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666336233303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D6974656D2E69732D6F70';
wwv_flow_api.g_varchar2_table(1003) := '656E202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233463643936343B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D5374617475734C6973742D697465';
wwv_flow_api.g_varchar2_table(1004) := '6D2E69732D7761726E696E67202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666636330303B0D0A7D0D0A2E742D5374617475734C6973742D2D62756C6C657473202E742D53746174';
wwv_flow_api.g_varchar2_table(1005) := '75734C6973742D6974656D2E69732D6E756C6C202E742D5374617475734C6973742D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3935293B0D0A2020636F6C6F723A207267626128';
wwv_flow_api.g_varchar2_table(1006) := '3235352C203235352C203235352C20302E3735293B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E742D5374617475734C6973742D6974656D49636F6E';
wwv_flow_api.g_varchar2_table(1007) := '207B0D0A2020636F6C6F723A207267626128302C20302C20302C20302E34293B0D0A2020626F782D736861646F773A203020302030207267626128302C20302C20302C20302E322920696E7365743B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1008) := '20236666666666663B0D0A7D0D0A2E612D5461626C652E752D5265706F72742074642C0D0A2E612D5461626C652E752D5265706F7274207468207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E612D546162';
wwv_flow_api.g_varchar2_table(1009) := '6C652E752D5265706F72742E7461626C652D7374726F6B652074642C0D0A2E612D5461626C652E752D5265706F72742E7461626C652D7374726F6B65207468207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31';
wwv_flow_api.g_varchar2_table(1010) := '293B0D0A7D0D0A2E612D5461626C652E752D5265706F72742074723A6E74682D6368696C64286576656E292074642C0D0A2E612D5461626C652E752D5265706F72742074723A6E74682D6368696C64286576656E292074685B73636F70653D22726F7722';
wwv_flow_api.g_varchar2_table(1011) := '5D207B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E612D5461626C652E752D5265706F72742E7461626C652D7374726970652074723A6E74682D6368696C64286576656E292074642C0D0A2E612D5461626C652E75';
wwv_flow_api.g_varchar2_table(1012) := '2D5265706F72742E7461626C652D7374726970652074723A6E74682D6368696C64286576656E292074685B73636F70653D22726F77225D207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B';
wwv_flow_api.g_varchar2_table(1013) := '0D0A7D0D0A406D6564696120286D61782D77696474683A20353630707829207B0D0A20202E612D5461626C652D2D7265666C6F772E75692D726573706F6E736976652074642C0D0A20202E612D5461626C652D2D7265666C6F772E75692D726573706F6E';
wwv_flow_api.g_varchar2_table(1014) := '73697665207468207B0D0A20202020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A20207D0D0A7D0D0A2E752D5265706F7274202E752D5265706F72742D6865616465722C0D0A2E752D5265';
wwv_flow_api.g_varchar2_table(1015) := '706F7274207468207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A2020636F6C6F723A20233030303B0D0A7D0D0A2E752D5265706F72742074685B73636F70653D22726F7767726F75';
wwv_flow_api.g_varchar2_table(1016) := '70225D207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E752D5265706F72742074685B73636F70653D22726F77225D207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1017) := '20236666663B0D0A7D0D0A2E752D5265706F7274207464207B0D0A2020636F6C6F723A20233030303B0D0A20206261636B67726F756E642D636F6C6F723A20236666663B0D0A7D0D0A2E752D5265706F72742074723A6E74682D6368696C64286576656E';
wwv_flow_api.g_varchar2_table(1018) := '292074642C0D0A2E752D5265706F72742074723A6E74682D6368696C64286576656E292074685B73636F70653D22726F77225D207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E303235293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1019) := '0A2E752D5265706F72742074642C0D0A2E752D5265706F7274207468207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E752D5265706F72742D2D73746174696342472074723A6E74682D63';
wwv_flow_api.g_varchar2_table(1020) := '68696C64286576656E292074642C0D0A2E752D5265706F72742D2D73746174696342472074723A6E74682D6368696C64286576656E292074685B73636F70653D22726F77225D207B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C';
wwv_flow_api.g_varchar2_table(1021) := '20302C20302E303235293B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B207B0D0A2020626F782D736861646F773A2030202D327078203020233030373664';
wwv_flow_api.g_varchar2_table(1022) := '6620696E7365743B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D546162';
wwv_flow_api.g_varchar2_table(1023) := '732D2D70696C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236639663966393B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F726465722D636F6C6F723A207267626128302C20302C20302C20302E31293B0D';
wwv_flow_api.g_varchar2_table(1024) := '0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D49636F6E207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(1025) := '546162732D2D70696C6C202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A2020626F726465722D6C6566742D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D546162732D2D';
wwv_flow_api.g_varchar2_table(1026) := '70696C6C202E742D546162732D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A666F637573207B0D0A2020626F';
wwv_flow_api.g_varchar2_table(1027) := '782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6C696E6B3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1028) := '6666663B0D0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E30352920696E7365743B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D3A66697273742D6368696C6420';
wwv_flow_api.g_varchar2_table(1029) := '2E742D546162732D6C696E6B207B0D0A2020626F726465722D7261646975733A2032707820302030203270783B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D3A6C6173742D6368696C64202E742D546162732D6C696E6B';
wwv_flow_api.g_varchar2_table(1030) := '207B0D0A2020626F726465722D72696768742D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D546162732D2D70696C6C202E742D546162732D6974656D2E69732D616374697665202E742D546162732D6C696E6B20';
wwv_flow_api.g_varchar2_table(1031) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D49636F6E207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D546162732D2D73696D706C65';
wwv_flow_api.g_varchar2_table(1032) := '202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20726762';
wwv_flow_api.g_varchar2_table(1033) := '6128302C20302C20302C20302E303235293B0D0A7D0D0A2E742D546162732D2D73696D706C65202E742D546162732D6C696E6B3A616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3135';
wwv_flow_api.g_varchar2_table(1034) := '293B0D0A7D0D0A2E742D426F6479202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D426F64792D7469746C65202E742D546162732D2D73696D706C65202E';
wwv_flow_api.g_varchar2_table(1035) := '742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E742D546162732D2D73696D706C65202E742D546162732D6C696E6B207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1036) := '0A2E617065782D726473202E617065782D7264732D73656C6563746564207370616E207B0D0A2020626F782D736861646F773A2030202D3270782030202330303736646620696E7365743B0D0A7D0D0A2E617065782D72647320613A666F637573207B0D';
wwv_flow_api.g_varchar2_table(1037) := '0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E617065782D7264732061207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D426F64792D7469746C65202E61706578';
wwv_flow_api.g_varchar2_table(1038) := '2D72647320612C0D0A2E742D426F64792D696E666F202E617065782D7264732061207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E617065782D7264732061207B0D0A2020636F6C6F723A2023323632363236';
wwv_flow_api.g_varchar2_table(1039) := '3B0D0A7D0D0A2E617065782D72647320613A686F766572207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A2E617065782D726473202E617065782D7264732D73656C65637465642061207B0D0A2020636F6C6F723A20233030366564303B';
wwv_flow_api.g_varchar2_table(1040) := '0D0A7D0D0A2E617065782D7264732D686F7665722E6C6566742061207B0D0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C2023666666666666203530252C2072676261283235352C203235';
wwv_flow_api.g_varchar2_table(1041) := '352C203235352C2030292031303025293B0D0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C2023666666666666203530252C2072676261283235352C203235352C203235352C203029203130302529';
wwv_flow_api.g_varchar2_table(1042) := '3B0D0A7D0D0A2E617065782D7264732D686F7665722E72696768742061207B0D0A20206261636B67726F756E643A202D7765626B69742D6C696E6561722D6772616469656E74286C6566742C20236666666666662030252C2072676261283235352C2032';
wwv_flow_api.g_varchar2_table(1043) := '35352C203235352C2030292031252C202366666666666620353025293B0D0A20206261636B67726F756E643A206C696E6561722D6772616469656E7428746F2072696768742C20236666666666662030252C2072676261283235352C203235352C203235';
wwv_flow_api.g_varchar2_table(1044) := '352C2030292031252C202366666666666620353025293B0D0A7D0D0A2E617065782D7264732D6974656D2D2D68696E742061207370616E207B0D0A2020626F782D736861646F773A2030202D3270782030207267626128302C20302C20302C20302E3229';
wwv_flow_api.g_varchar2_table(1045) := '20696E7365743B0D0A7D0D0A2E766572746963616C2D726473202E617065782D726473202E617065782D7264732D73656C6563746564207370616E2C0D0A2E742D426F64792D73696465202E617065782D726473202E617065782D7264732D73656C6563';
wwv_flow_api.g_varchar2_table(1046) := '746564207370616E207B0D0A2020626F782D736861646F773A2034707820302030202330303736646620696E7365743B0D0A7D0D0A2E752D52544C202E766572746963616C2D726473202E617065782D726473202E617065782D7264732D73656C656374';
wwv_flow_api.g_varchar2_table(1047) := '6564207370616E2C0D0A2E752D52544C202E742D426F64792D73696465202E617065782D726473202E617065782D7264732D73656C6563746564207370616E207B0D0A2020626F782D736861646F773A202D34707820302030202330303736646620696E';
wwv_flow_api.g_varchar2_table(1048) := '7365743B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B207B0D0A2020626F726465722D636F6C6F723A20236632663266323B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E643A20236661666166613B';
wwv_flow_api.g_varchar2_table(1049) := '0D0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F7220302E32732C20626F726465722D636F6C6F7220302E32732C20626F782D736861646F7720302E32732C20636F6C6F7220302E32733B0D0A2020636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(1050) := '366263623B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B207370616E207B0D0A20207472616E736974696F6E3A20636F6C6F7220302E32733B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B3A686F766572207B0D0A2020746578742D6465';
wwv_flow_api.g_varchar2_table(1051) := '636F726174696F6E3A206E6F6E653B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020626F726465722D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D7368';
wwv_flow_api.g_varchar2_table(1052) := '61646F773A20302030203020327078202330303736646620696E7365743B0D0A7D0D0A2E612D546167436C6F75642D6C696E6B3A686F766572207370616E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E612D546167436C6F75642D';
wwv_flow_api.g_varchar2_table(1053) := '636F756E74207B0D0A2020636F6C6F723A20233636363636363B0D0A2020666F6E742D7765696768743A203530303B0D0A7D0D0A2E742D54696D656C696E65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D54696D656C696E65';
wwv_flow_api.g_varchar2_table(1054) := '2D6974656D207B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D54696D656C696E652D757365726E616D652C0D0A2E742D54696D656C696E652D646174652C0D0A2E74';
wwv_flow_api.g_varchar2_table(1055) := '2D54696D656C696E652D64657363207B0D0A2020636F6C6F723A20233733373337333B0D0A7D0D0A2E742D54696D656C696E652D617661746172207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A';
wwv_flow_api.g_varchar2_table(1056) := '20236666666666663B0D0A7D0D0A2E742D54696D656C696E652D77726170207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A612E742D54696D656C696E652D777261703A686F7665722C0D0A612E742D54696D656C696E652D777261703A';
wwv_flow_api.g_varchar2_table(1057) := '666F637573207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C20302C20302C20302E3035293B0D0A2020626F782D736861646F773A20302038707820387078202D347078207267626128302C20302C20302C20302E3035292C';
wwv_flow_api.g_varchar2_table(1058) := '20302032707820387078202D327078207267626128302C20302C20302C20302E31293B0D0A7D0D0A2E742D54696D656C696E652D74797065207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1059) := '3236323632363B0D0A7D0D0A2E742D54696D656C696E652D747970652E69732D6E6577207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132433B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D656C696E652D';
wwv_flow_api.g_varchar2_table(1060) := '747970652E69732D75706461746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D656C696E652D747970652E69732D72656D6F766564207B0D0A20';
wwv_flow_api.g_varchar2_table(1061) := '206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D54696D656C696E652D777261703A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D7368';
wwv_flow_api.g_varchar2_table(1062) := '61646F773A20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E742D54696D656C696E65202B202E742D5265706F72742D706167696E6174696F6E207B0D0A2020626F726465722D746F702D636F6C6F723A207267626128302C';
wwv_flow_api.g_varchar2_table(1063) := '20302C20302C20302E31293B0D0A7D0D0A406D6564696120286D696E2D77696474683A20373639707829207B0D0A20202E742D426F64792D6E6176207B0D0A202020206261636B67726F756E642D636F6C6F723A20233333336434363B0D0A20207D0D0A';
wwv_flow_api.g_varchar2_table(1064) := '7D0D0A2E742D547265654E6176207B0D0A20206261636B67726F756E642D636F6C6F723A20233333336434363B0D0A7D0D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261';
wwv_flow_api.g_varchar2_table(1065) := '722D7468756D62207B0D0A20206261636B67726F756E642D636F6C6F723A20233234326233313B0D0A2020626F782D736861646F773A20696E7365742031707820302030203020233333336434363B0D0A7D0D0A2E742D50616765426F64792D2D6C6566';
wwv_flow_api.g_varchar2_table(1066) := '744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D7468756D623A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233365346135343B0D0A7D0D0A2E742D50616765426F64792D2D6C6566';
wwv_flow_api.g_varchar2_table(1067) := '744E6176202E742D426F64792D6E61763A3A2D7765626B69742D7363726F6C6C6261722D747261636B207B0D0A20206261636B67726F756E643A20233333336434363B0D0A7D0D0A2E742D50616765426F64792D2D6C6566744E6176202E742D426F6479';
wwv_flow_api.g_varchar2_table(1068) := '2D6E61763A3A2D7765626B69742D7363726F6C6C6261722D747261636B3A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233534363437323B0D0A7D0D0A2E742D526567696F6E207B0D0A20200D0A7D0D0A2E742D526567696F';
wwv_flow_api.g_varchar2_table(1069) := '6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A20';
wwv_flow_api.g_varchar2_table(1070) := '206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C';
wwv_flow_api.g_varchar2_table(1071) := '0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F70';
wwv_flow_api.g_varchar2_table(1072) := '4C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E742D526567696F6E202E612D54';
wwv_flow_api.g_varchar2_table(1073) := '726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C';
wwv_flow_api.g_varchar2_table(1074) := '6C61707369626C65203E202E612D54726565566965772D726F772C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B';
wwv_flow_api.g_varchar2_table(1075) := '0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A2023663066306630202169';
wwv_flow_api.g_varchar2_table(1076) := '6D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C652C0D0A2E';
wwv_flow_api.g_varchar2_table(1077) := '742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C2030';
wwv_flow_api.g_varchar2_table(1078) := '2E3735293B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C653A686F7665722C0D';
wwv_flow_api.g_varchar2_table(1079) := '0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A2023323632363236202169';
wwv_flow_api.g_varchar2_table(1080) := '6D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572207B0D0A2020636F6C6F723A202332363236323620';
wwv_flow_api.g_varchar2_table(1081) := '21696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E74';
wwv_flow_api.g_varchar2_table(1082) := '2D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E61';
wwv_flow_api.g_varchar2_table(1083) := '2D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3935293B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576';
wwv_flow_api.g_varchar2_table(1084) := '656C202E612D54726565566965772D636F6E74656E74202E66613A6265666F72652C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E';
wwv_flow_api.g_varchar2_table(1085) := '3A6265666F7265207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E';
wwv_flow_api.g_varchar2_table(1086) := '66612C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0D0A2E742D526567696F6E202E612D547265';
wwv_flow_api.g_varchar2_table(1087) := '65566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D';
wwv_flow_api.g_varchar2_table(1088) := '54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576';
wwv_flow_api.g_varchar2_table(1089) := '656C202E612D54726565566965772D6C6162656C207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E7465';
wwv_flow_api.g_varchar2_table(1090) := '6E742E69732D63757272656E742C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D73656C65637465642C0D0A2E742D526567696F6E202E612D';
wwv_flow_api.g_varchar2_table(1091) := '54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D526567696F6E202E612D5472';
wwv_flow_api.g_varchar2_table(1092) := '6565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A20726762612833382C2033382C2033382C20302E3735293B0D0A7D0D0A2E742D526567696F6E202E612D547265655669';
wwv_flow_api.g_varchar2_table(1093) := '65772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A20233236323632362021696D706F7274616E743B0D0A7D0D0A2E742D526567696F6E202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(1094) := '2D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D526567696F6E202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E';
wwv_flow_api.g_varchar2_table(1095) := '69732D636F6C6C61707369626C65203E202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A20206261636B67726F756E642D636F6C6F723A20236637663766373B0D0A7D0D0A2E742D547265654E6176202E612D547265655669';
wwv_flow_api.g_varchar2_table(1096) := '65772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365743B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1097) := '2D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742C0D0A2E742D547265654E';
wwv_flow_api.g_varchar2_table(1098) := '6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D73656C65637465642C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E61';
wwv_flow_api.g_varchar2_table(1099) := '2D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233234326233313B0D0A7D0D0A2E742D547265654E6176202E612D5472656556696577';
wwv_flow_api.g_varchar2_table(1100) := '2D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C6170736962';
wwv_flow_api.g_varchar2_table(1101) := '6C65203E202E612D54726565566965772D726F772C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A20233165323332383B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1102) := '2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233262333333612021696D706F72';
wwv_flow_api.g_varchar2_table(1103) := '74616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C652C0D0A2E742D54';
wwv_flow_api.g_varchar2_table(1104) := '7265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20';
wwv_flow_api.g_varchar2_table(1105) := '302E3735293B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D686F766572202B202E612D54726565566965772D746F67676C653A686F766572';
wwv_flow_api.g_varchar2_table(1106) := '2C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(1107) := '2021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572207B0D0A2020636F6C6F723A2023666666';
wwv_flow_api.g_varchar2_table(1108) := '6666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74207B0D0A2020636F6C6F723A20236666666666663B0D0A';
wwv_flow_api.g_varchar2_table(1109) := '7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C';
wwv_flow_api.g_varchar2_table(1110) := '6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54';
wwv_flow_api.g_varchar2_table(1111) := '726565566965772D636F6E74656E74202E66613A6265666F72652C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E74202E612D49636F6E3A6265666F72';
wwv_flow_api.g_varchar2_table(1112) := '65207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E66612C0D0A';
wwv_flow_api.g_varchar2_table(1113) := '2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E66612C0D0A2E742D547265654E6176202E612D547265655669';
wwv_flow_api.g_varchar2_table(1114) := '65772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D686F766572202E612D49636F6E2C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D5472';
wwv_flow_api.g_varchar2_table(1115) := '6565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C657665';
wwv_flow_api.g_varchar2_table(1116) := '6C202E612D54726565566965772D6C6162656C207B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E7465';
wwv_flow_api.g_varchar2_table(1117) := '6E742E69732D63757272656E742C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D73656C65637465642C0D0A2E742D547265654E6176202E';
wwv_flow_api.g_varchar2_table(1118) := '612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E61';
wwv_flow_api.g_varchar2_table(1119) := '2D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C65207B0D0A2020636F6C6F723A2072676261283235352C203235352C203235352C20302E3735293B0D0A7D0D0A2E742D547265654E6176202E61';
wwv_flow_api.g_varchar2_table(1120) := '2D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D746F67676C653A686F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E6176202E612D';
wwv_flow_api.g_varchar2_table(1121) := '54726565566965772D6E6F64652D2D746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E66612C0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D746F704C6576';
wwv_flow_api.g_varchar2_table(1122) := '656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74202E612D49636F6E207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6E6F64652D2D';
wwv_flow_api.g_varchar2_table(1123) := '746F704C6576656C2E69732D636F6C6C61707369626C65202E612D54726565566965772D636F6E74656E74207B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E6A732D6E6176436F6C6C6170736564202E742D547265654E6176202E612D';
wwv_flow_api.g_varchar2_table(1124) := '54726565566965772D6E6F64652D2D746F704C6576656C203E202E612D54726565566965772D636F6E74656E74202E612D54726565566965772D6C6162656C202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E643A2023';
wwv_flow_api.g_varchar2_table(1125) := '3133313631613B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D6261646765207B0D0A2020626F782D736861646F773A203020302030203170782072676261283235352C20323535';
wwv_flow_api.g_varchar2_table(1126) := '2C203235352C20302E31293B0D0A2020666F6E742D7765696768743A203430303B0D0A7D0D0A2E742D547265654E6176202E612D54726565566965772D636F6E74656E742E69732D63757272656E74202E612D54726565566965772D6C6162656C2C0D0A';
wwv_flow_api.g_varchar2_table(1127) := '2E742D547265654E6176202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70202E612D54726565566965772D6C6162656C207B0D0A2020666F6E742D7765696768743A203530303B0D0A7D0D0A2E742D547265654E';
wwv_flow_api.g_varchar2_table(1128) := '61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C69642072676261283235352C203235352C203235352C20302E303735293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1129) := '2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6541202E';
wwv_flow_api.g_varchar2_table(1130) := '612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E7365';
wwv_flow_api.g_varchar2_table(1131) := '74202330303736646620347078203020303B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D6375727265';
wwv_flow_api.g_varchar2_table(1132) := '6E742D2D746F702C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C20';
wwv_flow_api.g_varchar2_table(1133) := '2E612D54726565566965772D726F77207B0D0A2020626F782D736861646F773A20696E7365742023303037366466202D347078203020303B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F';
wwv_flow_api.g_varchar2_table(1134) := '704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E61';
wwv_flow_api.g_varchar2_table(1135) := '2D54726565566965772D726F772E69732D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E73657420233030373664662034707820302030';
wwv_flow_api.g_varchar2_table(1136) := '2C20302030203020317078202330303736646620696E7365743B0D0A7D0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E';
wwv_flow_api.g_varchar2_table(1137) := '69732D63757272656E742D2D746F702E69732D666F63757365642C0D0A2E752D52544C202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E6973';
wwv_flow_api.g_varchar2_table(1138) := '2D63757272656E742D2D746F70207E20756C202E612D54726565566965772D726F772E69732D666F6375736564207B0D0A2020626F782D736861646F773A20696E7365742023303037366466202D347078203020302C2030203020302031707820233030';
wwv_flow_api.g_varchar2_table(1139) := '3736646620696E7365743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(1140) := '66663B0D0A7D0D0A2E6A732D6E6176436F6C6C6170736564202E742D547265654E61762D2D7374796C6541202E612D54726565566965772D6E6F64652D2D746F704C6576656C203E202E612D54726565566965772D636F6E74656E74202E612D54726565';
wwv_flow_api.g_varchar2_table(1141) := '566965772D6C6162656C202E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A206E6F6E653B';
wwv_flow_api.g_varchar2_table(1142) := '0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C20756C207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E742D547265';
wwv_flow_api.g_varchar2_table(1143) := '654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565';
wwv_flow_api.g_varchar2_table(1144) := '566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1145) := '2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D726F772E69732D63757272656E742D2D746F702E69732D73656C6563746564202B202E612D5472656556';
wwv_flow_api.g_varchar2_table(1146) := '6965772D746F67676C652C0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F70207B0D0A2020';
wwv_flow_api.g_varchar2_table(1147) := '636F6C6F723A20236666666666663B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565566965772D636F6E74656E742E69732D63757272656E742D2D746F';
wwv_flow_api.g_varchar2_table(1148) := '702E69732D686F766572207B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C6542202E612D54726565566965772D6E6F64652D2D746F704C6576656C202E612D54726565';
wwv_flow_api.g_varchar2_table(1149) := '566965772D726F772E69732D63757272656E742D2D746F702E69732D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373965342021696D706F7274616E743B0D0A7D0D0A2E742D547265654E61762D2D7374796C654220';
wwv_flow_api.g_varchar2_table(1150) := '2E612D54726565566965772D6261646765207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A2E742D56616C';
wwv_flow_api.g_varchar2_table(1151) := '69646174696F6E2D64617465207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D56616C69646174696F6E2D75736572207B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D616374696F6E73202E74';
wwv_flow_api.g_varchar2_table(1152) := '2D56616C69646174696F6E2D64617465207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D426F64792D616374696F6E73202E742D56616C69646174696F6E2D75736572207B0D0A2020636F6C6F723A20233361336133613B0D0A7D';
wwv_flow_api.g_varchar2_table(1153) := '0D0A2E742D4469616C6F672D706167652D2D77697A617264207B0D0A2020626F726465723A20236536653665363B0D0A7D0D0A2E742D57697A617264207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(1154) := '65722D7261646975733A203270783B0D0A2020626F726465722D636F6C6F723A20236536653665363B0D0A2020626F782D736861646F773A20302031707820327078207267626128302C20302C20302C20302E3035293B0D0A7D0D0A2E742D57697A6172';
wwv_flow_api.g_varchar2_table(1155) := '64202E742D57697A6172642D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D57697A617264202E742D57697A6172642D686561646572207B0D0A20206261636B67726F756E642D636F6C6F723A2023666166616661';
wwv_flow_api.g_varchar2_table(1156) := '3B0D0A2020626F726465722D636F6C6F723A20236564656465643B0D0A7D0D0A2E742D57697A61726453746570732D777261703A6166746572207B0D0A20206261636B67726F756E642D636F6C6F723A20236536653665363B0D0A7D0D0A2E742D57697A';
wwv_flow_api.g_varchar2_table(1157) := '61726453746570732D73746570202E742D57697A61726453746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20236363636363633B0D0A7D0D0A2E742D57697A61726453746570732D737465702E69732D636F6D706C';
wwv_flow_api.g_varchar2_table(1158) := '657465202E742D57697A61726453746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132433B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E742D57697A61726453746570732D737465702E6973';
wwv_flow_api.g_varchar2_table(1159) := '2D616374697665202E742D57697A61726453746570732D6D61726B6572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A7D0D0A2E742D57697A61726453746570732D6C6162656C207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1160) := '3236323632363B0D0A7D0D0A612E742D57697A61726453746570732D777261705B687265665D3A686F766572202E742D57697A61726453746570732D6C6162656C2C0D0A612E742D57697A61726453746570732D777261705B687265665D3A666F637573';
wwv_flow_api.g_varchar2_table(1161) := '202E742D57697A61726453746570732D6C6162656C207B0D0A2020636F6C6F723A20233030366564303B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A612E742D57697A61726453746570732D777261705B68';
wwv_flow_api.g_varchar2_table(1162) := '7265665D3A666F637573202E742D57697A61726453746570732D6D61726B6572207B0D0A2020626F782D736861646F773A2030203020302031707820236666666666662C2030203020302032707820233030373664662C20302030203170782032707820';
wwv_flow_api.g_varchar2_table(1163) := '7267626128302C203131382C203232332C20302E3235293B0D0A7D0D0A626F6479202E75692D7769646765742D6F7665726C6179207B0D0A20206261636B67726F756E643A206E6F6E65207267626128302C20302C20302C20302E3235293B0D0A20206F';
wwv_flow_api.g_varchar2_table(1164) := '7061636974793A20313B0D0A7D0D0A2E75692D776964676574207B0D0A2020666F6E742D66616D696C793A202748656C766574696361204E657565272C20275365676F65205549272C2048656C7665746963612C20417269616C2C2073616E732D736572';
wwv_flow_api.g_varchar2_table(1165) := '69663B0D0A2020666F6E742D73697A653A20313270783B0D0A7D0D0A2E75692D776964676574202E75692D776964676574207B0D0A2020666F6E742D73697A653A20313270783B0D0A7D0D0A626F6479202E75692D7769646765742D636F6E74656E7420';
wwv_flow_api.g_varchar2_table(1166) := '7B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D7769646765742D636F6E';
wwv_flow_api.g_varchar2_table(1167) := '74656E742061207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A626F6479202E75692D7769646765742D686561646572207B0D0A2020626F726465722D636F6C6F723A20236562656265623B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1168) := '6F723A20236666666666663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D7769646765742D6865616465722061207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D7374617465';
wwv_flow_api.g_varchar2_table(1169) := '2D64656661756C742C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D64656661756C742C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D64656661756C74207B0D0A20';
wwv_flow_api.g_varchar2_table(1170) := '206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A2020636F6C6F723A20233338333833383B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E303132352920696E7365743B';
wwv_flow_api.g_varchar2_table(1171) := '0D0A7D0D0A626F6479202E75692D73746174652D64656661756C7420612C0D0A626F6479202E75692D73746174652D64656661756C7420613A6C696E6B2C0D0A626F6479202E75692D73746174652D64656661756C7420613A766973697465642C0D0A62';
wwv_flow_api.g_varchar2_table(1172) := '6F6479202E75692D73746174652D61637469766520612C0D0A626F6479202E75692D73746174652D61637469766520613A6C696E6B2C0D0A626F6479202E75692D73746174652D61637469766520613A76697369746564207B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1173) := '233030366564303B0D0A7D0D0A626F6479202E75692D73746174652D6163746976652C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6163746976652C0D0A626F6479202E75692D7769646765742D68656164';
wwv_flow_api.g_varchar2_table(1174) := '6572202E75692D73746174652D616374697665207B0D0A2020626F782D736861646F773A20302030203020317078207267626128302C20302C20302C20302E322920696E7365742C20302031707820327078207267626128302C20302C20302C20302E32';
wwv_flow_api.g_varchar2_table(1175) := '352920696E7365743B0D0A7D0D0A626F6479202E75692D73746174652D686F7665722C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686F7665722C0D0A626F6479202E75692D7769646765742D6865616465';
wwv_flow_api.g_varchar2_table(1176) := '72202E75692D73746174652D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233338333833383B0D0A2020626F782D736861646F773A2030203270782031707820726762612830';
wwv_flow_api.g_varchar2_table(1177) := '2C20302C20302C20302E3035292C20302030203020317078207267626128302C20302C20302C20302E303132352920696E7365743B0D0A7D0D0A626F6479202E75692D73746174652D666F6375732C0D0A626F6479202E75692D7769646765742D636F6E';
wwv_flow_api.g_varchar2_table(1178) := '74656E74202E75692D73746174652D666F6375732C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D666F637573207B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E73';
wwv_flow_api.g_varchar2_table(1179) := '65742C203020302031707820327078207267626128302C203131382C203232332C20302E3235292021696D706F7274616E743B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A20233338333833383B';
wwv_flow_api.g_varchar2_table(1180) := '0D0A7D0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F6E3A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A2030';
wwv_flow_api.g_varchar2_table(1181) := '2030203020317078202330303736646620696E7365742C203020302031707820327078207267626128302C203131382C203232332C20302E3235292021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D73746174652D686F76657220612C0D';
wwv_flow_api.g_varchar2_table(1182) := '0A626F6479202E75692D73746174652D686F76657220613A686F7665722C0D0A626F6479202E75692D73746174652D686F76657220613A6C696E6B2C0D0A626F6479202E75692D73746174652D686F76657220613A766973697465642C0D0A626F647920';
wwv_flow_api.g_varchar2_table(1183) := '2E75692D73746174652D666F63757320612C0D0A626F6479202E75692D73746174652D666F63757320613A686F7665722C0D0A626F6479202E75692D73746174652D666F63757320613A6C696E6B2C0D0A626F6479202E75692D73746174652D666F6375';
wwv_flow_api.g_varchar2_table(1184) := '7320613A76697369746564207B0D0A2020636F6C6F723A20233030366564303B0D0A7D0D0A626F6479202E75692D73746174652D6163746976652C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6163746976';
wwv_flow_api.g_varchar2_table(1185) := '652C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D616374697665207B0D0A20206261636B67726F756E642D636F6C6F723A20236465646564653B0D0A2020636F6C6F723A20233338333833383B0D0A7D0D0A62';
wwv_flow_api.g_varchar2_table(1186) := '6F6479202E75692D73746174652D686967686C696768742C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C696768742C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73';
wwv_flow_api.g_varchar2_table(1187) := '746174652D686967686C69676874207B0D0A20206261636B67726F756E642D636F6C6F723A20236466663066663B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D73746174652D686967686C6967687420612C0D0A62';
wwv_flow_api.g_varchar2_table(1188) := '6F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D686967686C6967687420612C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D686967686C696768742061207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1189) := '6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D73746174652D6572726F722C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722C0D0A626F6479202E75692D7769646765742D6865';
wwv_flow_api.g_varchar2_table(1190) := '61646572202E75692D73746174652D6572726F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A626F6479202E75692D73746174652D6572726F7220612C0D';
wwv_flow_api.g_varchar2_table(1191) := '0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F7220612C0D0A626F6479202E75692D7769646765742D686561646572202E75692D73746174652D6572726F722061207B0D0A2020636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1192) := '66666666663B0D0A7D0D0A626F6479202E75692D73746174652D6572726F722D746578742C0D0A626F6479202E75692D7769646765742D636F6E74656E74202E75692D73746174652D6572726F722D746578742C0D0A626F6479202E75692D7769646765';
wwv_flow_api.g_varchar2_table(1193) := '742D686561646572202E75692D73746174652D6572726F722D74657874207B0D0A2020636F6C6F723A20236634343333363B0D0A7D0D0A626F6479202E75692D646174657069636B6572207B0D0A2020626F782D736861646F773A203020327078203670';
wwv_flow_api.g_varchar2_table(1194) := '78207267626128302C20302C20302C20302E3035293B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742C0D0A626F6479202E75692D646174657069636B657220746420612E75';
wwv_flow_api.g_varchar2_table(1195) := '692D73746174652D64656661756C74207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370';
wwv_flow_api.g_varchar2_table(1196) := '616E2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D616374697665207B0D0A20';
wwv_flow_api.g_varchar2_table(1197) := '206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E';
wwv_flow_api.g_varchar2_table(1198) := '2E75692D73746174652D64656661756C742E75692D73746174652D6163746976652E75692D73746174652D686F7665722C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174';
wwv_flow_api.g_varchar2_table(1199) := '652D6163746976652E75692D73746174652D686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75';
wwv_flow_api.g_varchar2_table(1200) := '692D73746174652D64656661756C742E75692D73746174652D686F7665722C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686F766572207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1201) := '726F756E642D636F6C6F723A20236632663266322021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C743A666F6375732C0D0A626F6479202E75692D64';
wwv_flow_api.g_varchar2_table(1202) := '6174657069636B657220746420612E75692D73746174652D64656661756C743A666F637573207B0D0A20206F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A20302030203020317078202330303736646620696E7365742C203020';
wwv_flow_api.g_varchar2_table(1203) := '302031707820327078207267626128302C203131382C203232332C20302E3235292021696D706F7274616E743B0D0A7D0D0A626F6479202E75692D646174657069636B6572207464207370616E2E75692D73746174652D64656661756C742E75692D7374';
wwv_flow_api.g_varchar2_table(1204) := '6174652D686967686C696768742C0D0A626F6479202E75692D646174657069636B657220746420612E75692D73746174652D64656661756C742E75692D73746174652D686967686C69676874207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1205) := '236562656265623B0D0A7D0D0A626F6479202E75692D646174657069636B6572207468207B0D0A2020636F6C6F723A20233636363636363B0D0A2020626F726465722D626F74746F6D2D636F6C6F723A207267626128302C20302C20302C20302E31293B';
wwv_flow_api.g_varchar2_table(1206) := '0D0A7D0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6865616465722C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D627574746F6E70616E6520627574746F';
wwv_flow_api.g_varchar2_table(1207) := '6E2C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6E6578742C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D70726576207B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(1208) := '646975733A203270783B0D0A7D0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D707265763A6163746976652C0D0A626F6479202E75692D646174657069636B6572202E75692D646174657069636B65722D6E';
wwv_flow_api.g_varchar2_table(1209) := '6578743A616374697665207B0D0A2020626F782D736861646F773A20302032707820317078207267626128302C20302C20302C20302E30352920696E7365742C20302030203020317078207267626128302C20302C20302C20302E303132352920696E73';
wwv_flow_api.g_varchar2_table(1210) := '65743B0D0A7D0D0A2E75692D6469616C6F67207B0D0A2020626F782D736861646F773A2030203470782031367078202D347078207267626128302C20302C20302C20302E32292C20302038707820323470782030207267626128302C20302C20302C2030';
wwv_flow_api.g_varchar2_table(1211) := '2E3135292C20302030203020317078207267626128302C20302C20302C20302E32293B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65626172207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1212) := '6666666666663B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C20302C20302C20302E3035293B0D0A7D0D0A626F6479202E75692D6469616C6F672E742D4469616C6F672D706167652D2D77697A617264202E';
wwv_flow_api.g_varchar2_table(1213) := '75692D6469616C6F672D7469746C65626172207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0D0A2020636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1214) := '233236323632363B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E742C0D0A2E742D4469616C6F672D70616765207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020';
wwv_flow_api.g_varchar2_table(1215) := '636F6C6F723A20233236323632363B0D0A7D0D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F672C0D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722C0D0A';
wwv_flow_api.g_varchar2_table(1216) := '2E742D4469616C6F672D2D77697A61726420626F6479202E75692D6469616C6F67202E75692D6469616C6F672D636F6E74656E74207B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020636F6C6F723A202332363236';
wwv_flow_api.g_varchar2_table(1217) := '32363B0D0A7D0D0A2E742D4469616C6F672D2D77697A6172642E75692D6469616C6F67202E75692D6469616C6F672D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A626F6479202E75692D636F726E65722D616C6C207B0D';
wwv_flow_api.g_varchar2_table(1218) := '0A2020626F726465722D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D746F702C0D0A626F6479202E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D636F726E65722D746C207B0D0A2020626F7264';
wwv_flow_api.g_varchar2_table(1219) := '65722D746F702D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D746F702C0D0A626F6479202E75692D636F726E65722D72696768742C0D0A626F6479202E75692D636F726E65722D7472207B0D0A202062';
wwv_flow_api.g_varchar2_table(1220) := '6F726465722D746F702D72696768742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D626F74746F6D2C0D0A626F6479202E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D636F726E65722D626C20';
wwv_flow_api.g_varchar2_table(1221) := '7B0D0A2020626F726465722D626F74746F6D2D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D636F726E65722D626F74746F6D2C0D0A626F6479202E75692D636F726E65722D72696768742C0D0A626F6479202E75692D63';
wwv_flow_api.g_varchar2_table(1222) := '6F726E65722D6272207B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D616C6C207B0D0A2020626F726465722D7261646975733A';
wwv_flow_api.g_varchar2_table(1223) := '203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E6572';
wwv_flow_api.g_varchar2_table(1224) := '2D746C207B0D0A2020626F726465722D746F702D6C6566742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D746F702C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D';
wwv_flow_api.g_varchar2_table(1225) := '72696768742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D7472207B0D0A2020626F726465722D746F702D72696768742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65';
wwv_flow_api.g_varchar2_table(1226) := '722D626F74746F6D2C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D6C6566742C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626C207B0D0A2020626F726465722D626F74746F6D2D6C6566742D726164';
wwv_flow_api.g_varchar2_table(1227) := '6975733A203270783B0D0A7D0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D626F74746F6D2C0D0A626F6479202E75692D627574746F6E2E75692D636F726E65722D72696768742C0D0A626F6479202E75692D627574746F6E2E75';
wwv_flow_api.g_varchar2_table(1228) := '692D636F726E65722D6272207B0D0A2020626F726465722D626F74746F6D2D72696768742D7261646975733A203270783B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D7469746C656261722D636C6F7365207B0D0A20';
wwv_flow_api.g_varchar2_table(1229) := '20626F726465722D7261646975733A20313030253B0D0A7D0D0A626F6479202E75692D6469616C6F67202E75692D6469616C6F672D627574746F6E70616E65207B0D0A2020626F726465722D746F702D636F6C6F723A20236562656265623B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1230) := '2E752D7761726E696E67207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534412021696D706F7274616E743B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E752D7761726E696E672D74657874207B0D0A2020636F';
wwv_flow_api.g_varchar2_table(1231) := '6C6F723A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D7761726E696E672D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D7761726E696E67';
wwv_flow_api.g_varchar2_table(1232) := '2D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D73756363657373207B0D0A20206261636B67726F756E642D636F6C6F723A20233342414132432021696D706F7274';
wwv_flow_api.g_varchar2_table(1233) := '616E743B0D0A2020636F6C6F723A20234646463B0D0A7D0D0A2E752D737563636573732D74657874207B0D0A2020636F6C6F723A20233342414132432021696D706F7274616E743B0D0A7D0D0A2E752D737563636573732D6267207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1234) := '67726F756E642D636F6C6F723A20233342414132432021696D706F7274616E743B0D0A7D0D0A2E752D737563636573732D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233342414132432021696D706F7274616E743B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(1235) := '752D64616E676572207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333362021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D64616E6765722D74657874207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1236) := '3A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E752D64616E6765722D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E752D64616E6765722D626F7264';
wwv_flow_api.g_varchar2_table(1237) := '6572207B0D0A2020626F726465722D636F6C6F723A20236634343333362021696D706F7274616E743B0D0A7D0D0A2E752D696E666F207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A2020';
wwv_flow_api.g_varchar2_table(1238) := '636F6C6F723A20236666666666663B0D0A7D0D0A2E752D696E666F2D74657874207B0D0A2020636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E752D696E666F2D6267207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1239) := '723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E752D696E666F2D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E752D686F74207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1240) := '6B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D686F742D74657874207B0D0A2020636F6C6F723A20233030373664662021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1241) := '3B0D0A7D0D0A2E752D686F742D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664662021696D706F7274616E743B0D0A7D0D0A2E752D686F742D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023303037';
wwv_flow_api.g_varchar2_table(1242) := '3664662021696D706F7274616E743B0D0A7D0D0A2E752D6E6F726D616C207B0D0A20206261636B67726F756E642D636F6C6F723A20234644464446442021696D706F7274616E743B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E752D6E';
wwv_flow_api.g_varchar2_table(1243) := '6F726D616C2D74657874207B0D0A2020636F6C6F723A20233234323432342021696D706F7274616E743B0D0A7D0D0A2E752D6E6F726D616C2D6267207B0D0A20206261636B67726F756E642D636F6C6F723A20233234323432342021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1244) := '743B0D0A7D0D0A2E752D6E6F726D616C2D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233234323432342021696D706F7274616E743B0D0A7D0D0A2E742D426F6479207B0D0A20200D0A7D0D0A2E742D426F6479202E612D4D696E69';
wwv_flow_api.g_varchar2_table(1245) := '43616C207B0D0A2020626F726465723A2031707820736F6C696420236534653465343B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20234644464446443B0D0A7D0D0A2E742D426F6479';
wwv_flow_api.g_varchar2_table(1246) := '202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233234323432343B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A20233765376537653B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(1247) := '426F6479202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236637663766373B0D0A2020636F6C6F723A20233365336533653B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D746F64';
wwv_flow_api.g_varchar2_table(1248) := '6179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D';
wwv_flow_api.g_varchar2_table(1249) := '616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D646179';
wwv_flow_api.g_varchar2_table(1250) := '2E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236638663866383B0D0A7D0D0A2E742D426F6479202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(1251) := '3A20236633663366333B0D0A7D0D0A2E742D526567696F6E207B0D0A20200D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(1252) := '646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D';
wwv_flow_api.g_varchar2_table(1253) := '526567696F6E202E612D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A20236639';
wwv_flow_api.g_varchar2_table(1254) := '663966393B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(1255) := '3A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1256) := '2D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1257) := '6661666166613B0D0A7D0D0A2E742D526567696F6E202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E742D426F64792D616374696F6E73207B0D0A';
wwv_flow_api.g_varchar2_table(1258) := '20200D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236530653065303B0D0A2020626F726465722D7261646975733A203270783B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1259) := '6E642D636F6C6F723A20236639663966393B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233230323032303B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D';
wwv_flow_api.g_varchar2_table(1260) := '4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A20233761376137613B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A2023663366336633';
wwv_flow_api.g_varchar2_table(1261) := '3B0D0A2020636F6C6F723A20233361336133613B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1262) := '6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A20206261';
wwv_flow_api.g_varchar2_table(1263) := '636B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1264) := '726F756E642D636F6C6F723A20236634663466343B0D0A7D0D0A2E742D426F64792D616374696F6E73202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236566656665663B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1265) := '0A2E742D426F64792D696E666F207B0D0A20200D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C207B0D0A2020626F726465723A2031707820736F6C696420236536653665363B0D0A2020626F726465722D7261646975733A203270';
wwv_flow_api.g_varchar2_table(1266) := '783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D7469746C65207B0D0A2020636F6C6F723A20233236323632363B0D0A7D0D0A2E742D426F64792D';
wwv_flow_api.g_varchar2_table(1267) := '696E666F202E612D4D696E6943616C2D6461794F665765656B207B0D0A2020636F6C6F723A20233830383038303B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D646179207B0D0A2020626F726465722D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1268) := '39663966393B0D0A2020636F6C6F723A20233430343034303B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D746F646179202E612D4D696E6943616C2D64617465207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1269) := '6F6C6F723A20233030373664663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D616374697665202E612D4D696E6943616C2D64617465207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1270) := '6B67726F756E642D636F6C6F723A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D7765656B656E64207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1271) := '642D636F6C6F723A20236661666166613B0D0A7D0D0A2E742D426F64792D696E666F202E612D4D696E6943616C2D6461792E69732D6E756C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20236635663566353B0D0A7D0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1272) := '6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233330394644423B0D0A202066696C6C3A20233330394644423B0D0A2020636F6C6F723A202366666666';
wwv_flow_api.g_varchar2_table(1273) := '66663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D6261636B67';
wwv_flow_api.g_varchar2_table(1274) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233330394644423B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E';
wwv_flow_api.g_varchar2_table(1275) := '203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233330394644423B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1276) := '2D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233330394644423B0D0A20207374726F6B653A2023333039464442';
wwv_flow_api.g_varchar2_table(1277) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233133423643463B0D0A202066696C6C3A20233133423643463B0D0A2020';
wwv_flow_api.g_varchar2_table(1278) := '636F6C6F723A20236534663966643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E75';
wwv_flow_api.g_varchar2_table(1279) := '2D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233133423643463B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D7478742C0D';
wwv_flow_api.g_varchar2_table(1280) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233133423643463B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1281) := '203229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233133423643463B0D0A2020737472';
wwv_flow_api.g_varchar2_table(1282) := '6F6B653A20233133423643463B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233245424642433B0D0A202066696C6C3A20';
wwv_flow_api.g_varchar2_table(1283) := '233245424642433B0D0A2020636F6C6F723A20236630666366623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1284) := '2834356E202B203329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233245424642433B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E75';
wwv_flow_api.g_varchar2_table(1285) := '2D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233245424642433B0D0A7D0D0A2E752D636F6C6F7273203E203A6E7468';
wwv_flow_api.g_varchar2_table(1286) := '2D6368696C642834356E202B203329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233245';
wwv_flow_api.g_varchar2_table(1287) := '424642433B0D0A20207374726F6B653A20233245424642433B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233343414638';
wwv_flow_api.g_varchar2_table(1288) := '353B0D0A202066696C6C3A20233343414638353B0D0A2020636F6C6F723A20236630666166363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1289) := '3E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233343414638353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1290) := '2834356E202B203429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233343414638353B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1291) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465';
wwv_flow_api.g_varchar2_table(1292) := '722D636F6C6F723A20233343414638353B0D0A20207374726F6B653A20233343414638353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1293) := '6F6C6F723A20233831424235463B0D0A202066696C6C3A20233831424235463B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D62672C';
wwv_flow_api.g_varchar2_table(1294) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233831424235463B0D0A7D0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1295) := '3E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A202338314242';
wwv_flow_api.g_varchar2_table(1296) := '35463B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203529202E752D636F6C6F722D626F726465';
wwv_flow_api.g_varchar2_table(1297) := '72207B0D0A2020626F726465722D636F6C6F723A20233831424235463B0D0A20207374726F6B653A20233831424235463B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F72207B0D0A2020';
wwv_flow_api.g_varchar2_table(1298) := '6261636B67726F756E642D636F6C6F723A20234444444535333B0D0A202066696C6C3A20234444444535333B0D0A2020636F6C6F723A20233261326130383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20362920';
wwv_flow_api.g_varchar2_table(1299) := '2E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234444444535333B0D0A7D';
wwv_flow_api.g_varchar2_table(1300) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D74657874207B0D0A2020';
wwv_flow_api.g_varchar2_table(1301) := '636F6C6F723A20234444444535333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203629202E75';
wwv_flow_api.g_varchar2_table(1302) := '2D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234444444535333B0D0A20207374726F6B653A20234444444535333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E75';
wwv_flow_api.g_varchar2_table(1303) := '2D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534413B0D0A202066696C6C3A20234642434534413B0D0A2020636F6C6F723A20233434333330323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D636869';
wwv_flow_api.g_varchar2_table(1304) := '6C642834356E202B203729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1305) := '20234642434534413B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1306) := '722D74657874207B0D0A2020636F6C6F723A20234642434534413B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1307) := '2834356E202B203729202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234642434534413B0D0A20207374726F6B653A20234642434534413B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1308) := '2834356E202B203829202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234544383133453B0D0A202066696C6C3A20234544383133453B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1309) := '73203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1310) := '726F756E642D636F6C6F723A20234544383133453B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1311) := '2B203829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20234544383133453B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1312) := '3E203A6E74682D6368696C642834356E202B203829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234544383133453B0D0A20207374726F6B653A20234544383133453B0D0A7D0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1313) := '3E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234539354235343B0D0A202066696C6C3A20234539354235343B0D0A2020636F6C6F723A20236666666666663B0D';
wwv_flow_api.g_varchar2_table(1314) := '0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D6261636B67726F756E';
wwv_flow_api.g_varchar2_table(1315) := '64207B0D0A20206261636B67726F756E642D636F6C6F723A20234539354235343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1316) := '682D6368696C642834356E202B203929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20234539354235343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D62642C';
wwv_flow_api.g_varchar2_table(1317) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234539354235343B0D0A20207374726F6B653A20234539354235343B0D0A7D';
wwv_flow_api.g_varchar2_table(1318) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234538354438383B0D0A202066696C6C3A20234538354438383B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1319) := '6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D';
wwv_flow_api.g_varchar2_table(1320) := '636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234538354438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D7478742C0D';
wwv_flow_api.g_varchar2_table(1321) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20234538354438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1322) := '2B20313029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234538354438383B0D0A2020';
wwv_flow_api.g_varchar2_table(1323) := '7374726F6B653A20234538354438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234341353839443B0D0A20206669';
wwv_flow_api.g_varchar2_table(1324) := '6C6C3A20234341353839443B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D';
wwv_flow_api.g_varchar2_table(1325) := '6368696C642834356E202B20313129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234341353839443B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1326) := '20313129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20234341353839443B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1327) := '73203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(1328) := '636F6C6F723A20234341353839443B0D0A20207374726F6B653A20234341353839443B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1329) := '6C6F723A20233835344539423B0D0A202066696C6C3A20233835344539423B0D0A2020636F6C6F723A20236636663066383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D62672C';
wwv_flow_api.g_varchar2_table(1330) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233835344539423B0D0A7D0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1331) := '203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A202338';
wwv_flow_api.g_varchar2_table(1332) := '35344539423B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313229202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1333) := '626F72646572207B0D0A2020626F726465722D636F6C6F723A20233835344539423B0D0A20207374726F6B653A20233835344539423B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1334) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20233541363841443B0D0A202066696C6C3A20233541363841443B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E';
wwv_flow_api.g_varchar2_table(1335) := '202B20313329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233541';
wwv_flow_api.g_varchar2_table(1336) := '363841443B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1337) := '74657874207B0D0A2020636F6C6F723A20233541363841443B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1338) := '34356E202B20313329202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233541363841443B0D0A20207374726F6B653A20233541363841443B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1339) := '2834356E202B20313429202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20234146424143353B0D0A202066696C6C3A20234146424143353B0D0A2020636F6C6F723A20233331336134343B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1340) := '7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261';
wwv_flow_api.g_varchar2_table(1341) := '636B67726F756E642D636F6C6F723A20234146424143353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1342) := '34356E202B20313429202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20234146424143353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D62642C0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1343) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20313429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234146424143353B0D0A20207374726F6B653A20234146424143353B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1344) := '636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233645383539383B0D0A202066696C6C3A20233645383539383B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1345) := '6666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1346) := '2D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233645383539383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D7478742C0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1347) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233645383539383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529';
wwv_flow_api.g_varchar2_table(1348) := '202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233645383539383B0D0A20207374726F6B';
wwv_flow_api.g_varchar2_table(1349) := '653A20233645383539383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265323B0D0A202066696C6C3A2023';
wwv_flow_api.g_varchar2_table(1350) := '3539623265323B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1351) := '2834356E202B20313629202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2031362920';
wwv_flow_api.g_varchar2_table(1352) := '2E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233539623265323B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1353) := '6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313629202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F72';
wwv_flow_api.g_varchar2_table(1354) := '3A20233539623265323B0D0A20207374726F6B653A20233539623265323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20';
wwv_flow_api.g_varchar2_table(1355) := '233432633564393B0D0A202066696C6C3A20233432633564393B0D0A2020636F6C6F723A20233035313531373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D62672C0D0A2E752D';
wwv_flow_api.g_varchar2_table(1356) := '636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233432633564393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1357) := '74682D6368696C642834356E202B20313729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A2023343263356439';
wwv_flow_api.g_varchar2_table(1358) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313729202E752D636F6C6F722D626F726465';
wwv_flow_api.g_varchar2_table(1359) := '72207B0D0A2020626F726465722D636F6C6F723A20233432633564393B0D0A20207374726F6B653A20233432633564393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F72207B0D0A20';
wwv_flow_api.g_varchar2_table(1360) := '206261636B67726F756E642D636F6C6F723A20233538636363393B0D0A202066696C6C3A20233538636363393B0D0A2020636F6C6F723A20233039316331633B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B203138';
wwv_flow_api.g_varchar2_table(1361) := '29202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363393B';
wwv_flow_api.g_varchar2_table(1362) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D7465787420';
wwv_flow_api.g_varchar2_table(1363) := '7B0D0A2020636F6C6F723A20233538636363393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1364) := '20313829202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233538636363393B0D0A20207374726F6B653A20233538636363393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1365) := '2B20313929202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639643B0D0A202066696C6C3A20233633626639643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E20';
wwv_flow_api.g_varchar2_table(1366) := '3A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F';
wwv_flow_api.g_varchar2_table(1367) := '756E642D636F6C6F723A20233633626639643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1368) := '20313929202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233633626639643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1369) := '203E203A6E74682D6368696C642834356E202B20313929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233633626639643B0D0A20207374726F6B653A20233633626639643B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1370) := '73203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937663B0D0A202066696C6C3A20233961633937663B0D0A2020636F6C6F723A20233230333331';
wwv_flow_api.g_varchar2_table(1371) := '363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D6261636B';
wwv_flow_api.g_varchar2_table(1372) := '67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1373) := '203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233961633937663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D63';
wwv_flow_api.g_varchar2_table(1374) := '6F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233961633937663B0D0A20207374726F6B653A202339';
wwv_flow_api.g_varchar2_table(1375) := '61633937663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236534653537353B0D0A202066696C6C3A20236534653537';
wwv_flow_api.g_varchar2_table(1376) := '353B0D0A2020636F6C6F723A20233463346330663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1377) := '2B20323129202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236534653537353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F';
wwv_flow_api.g_varchar2_table(1378) := '6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236534653537353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1379) := '68696C642834356E202B20323129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236534';
wwv_flow_api.g_varchar2_table(1380) := '653537353B0D0A20207374726F6B653A20236534653537353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A202366636438';
wwv_flow_api.g_varchar2_table(1381) := '36653B0D0A202066696C6C3A20236663643836653B0D0A2020636F6C6F723A20233639346630323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1382) := '73203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236663643836653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1383) := '696C642834356E202B20323229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236663643836653B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1384) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323229202E752D636F6C6F722D626F72646572207B0D0A';
wwv_flow_api.g_varchar2_table(1385) := '2020626F726465722D636F6C6F723A20236663643836653B0D0A20207374726F6B653A20236663643836653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F72207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1386) := '67726F756E642D636F6C6F723A20236631396136353B0D0A202066696C6C3A20236631396136353B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D';
wwv_flow_api.g_varchar2_table(1387) := '636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136353B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1388) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D74657874207B0D0A2020';
wwv_flow_api.g_varchar2_table(1389) := '636F6C6F723A20236631396136353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2032332920';
wwv_flow_api.g_varchar2_table(1390) := '2E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236631396136353B0D0A20207374726F6B653A20236631396136353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429';
wwv_flow_api.g_varchar2_table(1391) := '202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337363B0D0A202066696C6C3A20236564376337363B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D';
wwv_flow_api.g_varchar2_table(1392) := '6368696C642834356E202B20323429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D63';
wwv_flow_api.g_varchar2_table(1393) := '6F6C6F723A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2032342920';
wwv_flow_api.g_varchar2_table(1394) := '2E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1395) := '74682D6368696C642834356E202B20323429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376337363B0D0A20207374726F6B653A20236564376337363B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1396) := '6E74682D6368696C642834356E202B20323529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461303B0D0A202066696C6C3A20236564376461303B0D0A2020636F6C6F723A20236666666666663B0D0A7D';
wwv_flow_api.g_varchar2_table(1397) := '0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D6261636B67726F756E';
wwv_flow_api.g_varchar2_table(1398) := '64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1399) := '74682D6368696C642834356E202B20323529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236564376461303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1400) := '62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376461303B0D0A20207374726F6B653A2023656437646130';
wwv_flow_api.g_varchar2_table(1401) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962313B0D0A202066696C6C3A20236435373962313B0D0A20';
wwv_flow_api.g_varchar2_table(1402) := '20636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629';
wwv_flow_api.g_varchar2_table(1403) := '202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D74';
wwv_flow_api.g_varchar2_table(1404) := '78742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236435373962313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1405) := '34356E202B20323629202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323629202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236435373962313B';
wwv_flow_api.g_varchar2_table(1406) := '0D0A20207374726F6B653A20236435373962313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161663B0D0A';
wwv_flow_api.g_varchar2_table(1407) := '202066696C6C3A20233964373161663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1408) := '6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1409) := '356E202B20323729202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233964373161663B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1410) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323729202E752D636F6C6F722D626F72646572207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(1411) := '6465722D636F6C6F723A20233964373161663B0D0A20207374726F6B653A20233964373161663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F72207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1412) := '642D636F6C6F723A20233762383662643B0D0A202066696C6C3A20233762383662643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1413) := '2D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233762383662643B0D0A7D0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1414) := '6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1415) := '3A20233762383662643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323829202E752D636F';
wwv_flow_api.g_varchar2_table(1416) := '6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233762383662643B0D0A20207374726F6B653A20233762383662643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D63';
wwv_flow_api.g_varchar2_table(1417) := '6F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864313B0D0A202066696C6C3A20236266633864313B0D0A2020636F6C6F723A20233364343835343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(1418) := '2834356E202B20323929202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1419) := '20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F';
wwv_flow_api.g_varchar2_table(1420) := '6C6F722D74657874207B0D0A2020636F6C6F723A20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20323929202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1421) := '696C642834356E202B20323929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236266633864313B0D0A20207374726F6B653A20236266633864313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1422) := '68696C642834356E202B20333029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461643B0D0A202066696C6C3A20233862396461643B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1423) := '636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D6261636B67726F756E64207B0D0A';
wwv_flow_api.g_varchar2_table(1424) := '20206261636B67726F756E642D636F6C6F723A20233862396461643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1425) := '696C642834356E202B20333029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233862396461643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D62642C0D0A';
wwv_flow_api.g_varchar2_table(1426) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233862396461643B0D0A20207374726F6B653A20233862396461643B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1427) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363613B0D0A202066696C6C3A20233139386363613B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1428) := '723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D63';
wwv_flow_api.g_varchar2_table(1429) := '6F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D7478742C0D0A';
wwv_flow_api.g_varchar2_table(1430) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233139386363613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1431) := '20333129202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233139386363613B0D0A202073';
wwv_flow_api.g_varchar2_table(1432) := '74726F6B653A20233139386363613B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562653B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1433) := '6C3A20233032613562653B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D63';
wwv_flow_api.g_varchar2_table(1434) := '68696C642834356E202B20333229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1435) := '333229202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233032613562653B0D0A7D0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1436) := '203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D63';
wwv_flow_api.g_varchar2_table(1437) := '6F6C6F723A20233032613562653B0D0A20207374726F6B653A20233032613562653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1438) := '6F723A20233138623161653B0D0A202066696C6C3A20233138623161653B0D0A2020636F6C6F723A20233030303030303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D62672C0D';
wwv_flow_api.g_varchar2_table(1439) := '0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233138623161653B0D0A7D0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1440) := '3E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233138';
wwv_flow_api.g_varchar2_table(1441) := '623161653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333329202E752D636F6C6F722D62';
wwv_flow_api.g_varchar2_table(1442) := '6F72646572207B0D0A2020626F726465722D636F6C6F723A20233138623161653B0D0A20207374726F6B653A20233138623161653B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F7220';
wwv_flow_api.g_varchar2_table(1443) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437353B0D0A202066696C6C3A20233234613437353B0D0A2020636F6C6F723A20236566666266373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E20';
wwv_flow_api.g_varchar2_table(1444) := '2B20333429202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023323461';
wwv_flow_api.g_varchar2_table(1445) := '3437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D74';
wwv_flow_api.g_varchar2_table(1446) := '657874207B0D0A2020636F6C6F723A20233234613437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1447) := '356E202B20333429202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233234613437353B0D0A20207374726F6B653A20233234613437353B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1448) := '34356E202B20333529202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233661616434323B0D0A202066696C6C3A20233661616434323B0D0A2020636F6C6F723A20233063313530363B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1449) := '73203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D6261636B67726F756E64207B0D0A2020626163';
wwv_flow_api.g_varchar2_table(1450) := '6B67726F756E642D636F6C6F723A20233661616434323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834';
wwv_flow_api.g_varchar2_table(1451) := '356E202B20333529202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233661616434323B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1452) := '6C6F7273203E203A6E74682D6368696C642834356E202B20333529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233661616434323B0D0A20207374726F6B653A20233661616434323B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1453) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133393B0D0A202066696C6C3A20236339636133393B0D0A2020636F6C6F723A202332';
wwv_flow_api.g_varchar2_table(1454) := '64326530343B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1455) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D7478742C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1456) := '6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236339636133393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2033362920';
wwv_flow_api.g_varchar2_table(1457) := '2E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333629202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236339636133393B0D0A20207374726F6B65';
wwv_flow_api.g_varchar2_table(1458) := '3A20236339636133393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133623B0D0A202066696C6C3A202364';
wwv_flow_api.g_varchar2_table(1459) := '39623133623B0D0A2020636F6C6F723A20233436333430303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(1460) := '34356E202B20333729202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E';
wwv_flow_api.g_varchar2_table(1461) := '752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236439623133623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E';
wwv_flow_api.g_varchar2_table(1462) := '74682D6368696C642834356E202B20333729202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333729202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A';
wwv_flow_api.g_varchar2_table(1463) := '20236439623133623B0D0A20207374726F6B653A20236439623133623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1464) := '6437366132373B0D0A202066696C6C3A20236437366132373B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D62672C0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1465) := '6F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236437366132373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1466) := '682D6368696C642834356E202B20333829202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236437366132373B';
wwv_flow_api.g_varchar2_table(1467) := '0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333829202E752D636F6C6F722D626F72646572';
wwv_flow_api.g_varchar2_table(1468) := '207B0D0A2020626F726465722D636F6C6F723A20236437366132373B0D0A20207374726F6B653A20236437366132373B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F72207B0D0A2020';
wwv_flow_api.g_varchar2_table(1469) := '6261636B67726F756E642D636F6C6F723A20236432343233623B0D0A202066696C6C3A20236432343233623B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929';
wwv_flow_api.g_varchar2_table(1470) := '202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233623B0D';
wwv_flow_api.g_varchar2_table(1471) := '0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D74657874207B';
wwv_flow_api.g_varchar2_table(1472) := '0D0A2020636F6C6F723A20236432343233623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20333929202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1473) := '333929202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236432343233623B0D0A20207374726F6B653A20236432343233623B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1474) := '20343029202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336663B0D0A202066696C6C3A20236431343336663B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A';
wwv_flow_api.g_varchar2_table(1475) := '6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F75';
wwv_flow_api.g_varchar2_table(1476) := '6E642D636F6C6F723A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20';
wwv_flow_api.g_varchar2_table(1477) := '343029202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D62642C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1478) := '3E203A6E74682D6368696C642834356E202B20343029202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236431343336663B0D0A20207374726F6B653A20236431343336663B0D0A7D0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1479) := '203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438383B0D0A202066696C6C3A20236261336438383B0D0A2020636F6C6F723A2023666666666666';
wwv_flow_api.g_varchar2_table(1480) := '3B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D6261636B67';
wwv_flow_api.g_varchar2_table(1481) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F727320';
wwv_flow_api.g_varchar2_table(1482) := '3E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20236261336438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F';
wwv_flow_api.g_varchar2_table(1483) := '6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343129202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236261336438383B0D0A20207374726F6B653A20236261';
wwv_flow_api.g_varchar2_table(1484) := '336438383B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233737333339333B0D0A202066696C6C3A2023373733333933';
wwv_flow_api.g_varchar2_table(1485) := '3B0D0A2020636F6C6F723A20236636656666393B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B';
wwv_flow_api.g_varchar2_table(1486) := '20343229202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233737333339333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C';
wwv_flow_api.g_varchar2_table(1487) := '6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233737333339333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368';
wwv_flow_api.g_varchar2_table(1488) := '696C642834356E202B20343229202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343229202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023373733';
wwv_flow_api.g_varchar2_table(1489) := '3339333B0D0A20207374726F6B653A20233737333339333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561';
wwv_flow_api.g_varchar2_table(1490) := '333B0D0A202066696C6C3A20233364346561333B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273';
wwv_flow_api.g_varchar2_table(1491) := '203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D636869';
wwv_flow_api.g_varchar2_table(1492) := '6C642834356E202B20343329202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233364346561333B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1493) := '2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343329202E752D636F6C6F722D626F72646572207B0D0A20';
wwv_flow_api.g_varchar2_table(1494) := '20626F726465722D636F6C6F723A20233364346561333B0D0A20207374726F6B653A20233364346561333B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F72207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1495) := '726F756E642D636F6C6F723A20233863396562303B0D0A202066696C6C3A20233863396562303B0D0A2020636F6C6F723A20233238336134643B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D63';
wwv_flow_api.g_varchar2_table(1496) := '6F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233863396562303B0D0A7D0D0A2E';
wwv_flow_api.g_varchar2_table(1497) := '752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D74657874207B0D0A202063';
wwv_flow_api.g_varchar2_table(1498) := '6F6C6F723A20233863396562303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343429202E';
wwv_flow_api.g_varchar2_table(1499) := '752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233863396562303B0D0A20207374726F6B653A20233863396562303B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B2034352920';
wwv_flow_api.g_varchar2_table(1500) := '2E752D636F6C6F72207B0D0A20206261636B67726F756E642D636F6C6F723A20233465373339313B0D0A202066696C6C3A20233465373339313B0D0A2020636F6C6F723A20236666666666663B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D63';
null;
end;
/
begin
wwv_flow_api.g_varchar2_table(1501) := '68696C642834356E202B20343529202E752D636F6C6F722D62672C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F';
wwv_flow_api.g_varchar2_table(1502) := '6C6F723A20233465373339313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D7478742C0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E';
wwv_flow_api.g_varchar2_table(1503) := '752D636F6C6F722D74657874207B0D0A2020636F6C6F723A20233465373339313B0D0A7D0D0A2E752D636F6C6F7273203E203A6E74682D6368696C642834356E202B20343529202E752D636F6C6F722D62642C0D0A2E752D636F6C6F7273203E203A6E74';
wwv_flow_api.g_varchar2_table(1504) := '682D6368696C642834356E202B20343529202E752D636F6C6F722D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233465373339313B0D0A20207374726F6B653A20233465373339313B0D0A7D0D0A2E752D636F6C6F722D31207B0D0A';
wwv_flow_api.g_varchar2_table(1505) := '20206261636B67726F756E642D636F6C6F723A20233330394644422021696D706F7274616E743B0D0A202066696C6C3A20233330394644422021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1506) := '7D0D0A2E752D636F6C6F722D312D62672C0D0A2E752D636F6C6F722D312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233330394644422021696D706F7274616E743B0D0A202066696C6C3A2023333039464442';
wwv_flow_api.g_varchar2_table(1507) := '2021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D312D7478742C0D0A2E752D636F6C6F722D312D74657874207B0D0A2020636F6C6F723A20233330394644422021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D312D62642C';
wwv_flow_api.g_varchar2_table(1508) := '0D0A2E752D636F6C6F722D312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233330394644422021696D706F7274616E743B0D0A20207374726F6B653A20233330394644422021696D706F7274616E743B0D0A7D0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1509) := '6F722D32207B0D0A20206261636B67726F756E642D636F6C6F723A20233133423643462021696D706F7274616E743B0D0A202066696C6C3A20233133423643462021696D706F7274616E743B0D0A2020636F6C6F723A20236534663966642021696D706F';
wwv_flow_api.g_varchar2_table(1510) := '7274616E743B0D0A7D0D0A2E752D636F6C6F722D322D62672C0D0A2E752D636F6C6F722D322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233133423643462021696D706F7274616E743B0D0A202066696C6C3A';
wwv_flow_api.g_varchar2_table(1511) := '20233133423643462021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D322D7478742C0D0A2E752D636F6C6F722D322D74657874207B0D0A2020636F6C6F723A20233133423643462021696D706F7274616E743B0D0A7D0D0A2E752D636F6C';
wwv_flow_api.g_varchar2_table(1512) := '6F722D322D62642C0D0A2E752D636F6C6F722D322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233133423643462021696D706F7274616E743B0D0A20207374726F6B653A20233133423643462021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1513) := '0D0A2E752D636F6C6F722D33207B0D0A20206261636B67726F756E642D636F6C6F723A20233245424642432021696D706F7274616E743B0D0A202066696C6C3A20233245424642432021696D706F7274616E743B0D0A2020636F6C6F723A202366306663';
wwv_flow_api.g_varchar2_table(1514) := '66622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D332D62672C0D0A2E752D636F6C6F722D332D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233245424642432021696D706F7274616E743B0D';
wwv_flow_api.g_varchar2_table(1515) := '0A202066696C6C3A20233245424642432021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D332D7478742C0D0A2E752D636F6C6F722D332D74657874207B0D0A2020636F6C6F723A20233245424642432021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1516) := '0D0A2E752D636F6C6F722D332D62642C0D0A2E752D636F6C6F722D332D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233245424642432021696D706F7274616E743B0D0A20207374726F6B653A20233245424642432021696D706F72';
wwv_flow_api.g_varchar2_table(1517) := '74616E743B0D0A7D0D0A2E752D636F6C6F722D34207B0D0A20206261636B67726F756E642D636F6C6F723A20233343414638352021696D706F7274616E743B0D0A202066696C6C3A20233343414638352021696D706F7274616E743B0D0A2020636F6C6F';
wwv_flow_api.g_varchar2_table(1518) := '723A20236630666166362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D342D62672C0D0A2E752D636F6C6F722D342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233343414638352021696D70';
wwv_flow_api.g_varchar2_table(1519) := '6F7274616E743B0D0A202066696C6C3A20233343414638352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D342D7478742C0D0A2E752D636F6C6F722D342D74657874207B0D0A2020636F6C6F723A20233343414638352021696D706F72';
wwv_flow_api.g_varchar2_table(1520) := '74616E743B0D0A7D0D0A2E752D636F6C6F722D342D62642C0D0A2E752D636F6C6F722D342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233343414638352021696D706F7274616E743B0D0A20207374726F6B653A20233343414638';
wwv_flow_api.g_varchar2_table(1521) := '352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D35207B0D0A20206261636B67726F756E642D636F6C6F723A20233831424235462021696D706F7274616E743B0D0A202066696C6C3A20233831424235462021696D706F7274616E743B';
wwv_flow_api.g_varchar2_table(1522) := '0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D62672C0D0A2E752D636F6C6F722D352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023383142';
wwv_flow_api.g_varchar2_table(1523) := '4235462021696D706F7274616E743B0D0A202066696C6C3A20233831424235462021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D7478742C0D0A2E752D636F6C6F722D352D74657874207B0D0A2020636F6C6F723A20233831424235';
wwv_flow_api.g_varchar2_table(1524) := '462021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D352D62642C0D0A2E752D636F6C6F722D352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233831424235462021696D706F7274616E743B0D0A20207374726F6B65';
wwv_flow_api.g_varchar2_table(1525) := '3A20233831424235462021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D36207B0D0A20206261636B67726F756E642D636F6C6F723A20234444444535332021696D706F7274616E743B0D0A202066696C6C3A20234444444535332021696D';
wwv_flow_api.g_varchar2_table(1526) := '706F7274616E743B0D0A2020636F6C6F723A20233261326130382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D362D62672C0D0A2E752D636F6C6F722D362D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1527) := '6F723A20234444444535332021696D706F7274616E743B0D0A202066696C6C3A20234444444535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D362D7478742C0D0A2E752D636F6C6F722D362D74657874207B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1528) := '3A20234444444535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D362D62642C0D0A2E752D636F6C6F722D362D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234444444535332021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1529) := '20207374726F6B653A20234444444535332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D37207B0D0A20206261636B67726F756E642D636F6C6F723A20234642434534412021696D706F7274616E743B0D0A202066696C6C3A20234642';
wwv_flow_api.g_varchar2_table(1530) := '434534412021696D706F7274616E743B0D0A2020636F6C6F723A20233434333330322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D372D62672C0D0A2E752D636F6C6F722D372D6261636B67726F756E64207B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(1531) := '6F756E642D636F6C6F723A20234642434534412021696D706F7274616E743B0D0A202066696C6C3A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D372D7478742C0D0A2E752D636F6C6F722D372D74657874207B0D';
wwv_flow_api.g_varchar2_table(1532) := '0A2020636F6C6F723A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D372D62642C0D0A2E752D636F6C6F722D372D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234642434534412021696D706F';
wwv_flow_api.g_varchar2_table(1533) := '7274616E743B0D0A20207374726F6B653A20234642434534412021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D38207B0D0A20206261636B67726F756E642D636F6C6F723A20234544383133452021696D706F7274616E743B0D0A202066';
wwv_flow_api.g_varchar2_table(1534) := '696C6C3A20234544383133452021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D382D62672C0D0A2E752D636F6C6F722D382D6261636B67726F756E64207B0D0A';
wwv_flow_api.g_varchar2_table(1535) := '20206261636B67726F756E642D636F6C6F723A20234544383133452021696D706F7274616E743B0D0A202066696C6C3A20234544383133452021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D382D7478742C0D0A2E752D636F6C6F722D38';
wwv_flow_api.g_varchar2_table(1536) := '2D74657874207B0D0A2020636F6C6F723A20234544383133452021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D382D62642C0D0A2E752D636F6C6F722D382D626F72646572207B0D0A2020626F726465722D636F6C6F723A202345443831';
wwv_flow_api.g_varchar2_table(1537) := '33452021696D706F7274616E743B0D0A20207374726F6B653A20234544383133452021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D39207B0D0A20206261636B67726F756E642D636F6C6F723A20234539354235342021696D706F727461';
wwv_flow_api.g_varchar2_table(1538) := '6E743B0D0A202066696C6C3A20234539354235342021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D392D62672C0D0A2E752D636F6C6F722D392D6261636B6772';
wwv_flow_api.g_varchar2_table(1539) := '6F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234539354235342021696D706F7274616E743B0D0A202066696C6C3A20234539354235342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D392D7478742C0D0A2E75';
wwv_flow_api.g_varchar2_table(1540) := '2D636F6C6F722D392D74657874207B0D0A2020636F6C6F723A20234539354235342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D392D62642C0D0A2E752D636F6C6F722D392D626F72646572207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1541) := '723A20234539354235342021696D706F7274616E743B0D0A20207374726F6B653A20234539354235342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3130207B0D0A20206261636B67726F756E642D636F6C6F723A2023453835443838';
wwv_flow_api.g_varchar2_table(1542) := '2021696D706F7274616E743B0D0A202066696C6C3A20234538354438382021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31302D62672C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1543) := '722D31302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234538354438382021696D706F7274616E743B0D0A202066696C6C3A20234538354438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1544) := '2D31302D7478742C0D0A2E752D636F6C6F722D31302D74657874207B0D0A2020636F6C6F723A20234538354438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31302D62642C0D0A2E752D636F6C6F722D31302D626F72646572207B';
wwv_flow_api.g_varchar2_table(1545) := '0D0A2020626F726465722D636F6C6F723A20234538354438382021696D706F7274616E743B0D0A20207374726F6B653A20234538354438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3131207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1546) := '2D636F6C6F723A20234341353839442021696D706F7274616E743B0D0A202066696C6C3A20234341353839442021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1547) := '31312D62672C0D0A2E752D636F6C6F722D31312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20234341353839442021696D706F7274616E743B0D0A202066696C6C3A20234341353839442021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1548) := '743B0D0A7D0D0A2E752D636F6C6F722D31312D7478742C0D0A2E752D636F6C6F722D31312D74657874207B0D0A2020636F6C6F723A20234341353839442021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31312D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1549) := '6C6F722D31312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234341353839442021696D706F7274616E743B0D0A20207374726F6B653A20234341353839442021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D313220';
wwv_flow_api.g_varchar2_table(1550) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233835344539422021696D706F7274616E743B0D0A202066696C6C3A20233835344539422021696D706F7274616E743B0D0A2020636F6C6F723A20236636663066382021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1551) := '3B0D0A7D0D0A2E752D636F6C6F722D31322D62672C0D0A2E752D636F6C6F722D31322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233835344539422021696D706F7274616E743B0D0A202066696C6C3A202338';
wwv_flow_api.g_varchar2_table(1552) := '35344539422021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31322D7478742C0D0A2E752D636F6C6F722D31322D74657874207B0D0A2020636F6C6F723A20233835344539422021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1553) := '722D31322D62642C0D0A2E752D636F6C6F722D31322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233835344539422021696D706F7274616E743B0D0A20207374726F6B653A20233835344539422021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1554) := '7D0D0A2E752D636F6C6F722D3133207B0D0A20206261636B67726F756E642D636F6C6F723A20233541363841442021696D706F7274616E743B0D0A202066696C6C3A20233541363841442021696D706F7274616E743B0D0A2020636F6C6F723A20236666';
wwv_flow_api.g_varchar2_table(1555) := '666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31332D62672C0D0A2E752D636F6C6F722D31332D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233541363841442021696D706F727461';
wwv_flow_api.g_varchar2_table(1556) := '6E743B0D0A202066696C6C3A20233541363841442021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31332D7478742C0D0A2E752D636F6C6F722D31332D74657874207B0D0A2020636F6C6F723A20233541363841442021696D706F727461';
wwv_flow_api.g_varchar2_table(1557) := '6E743B0D0A7D0D0A2E752D636F6C6F722D31332D62642C0D0A2E752D636F6C6F722D31332D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233541363841442021696D706F7274616E743B0D0A20207374726F6B653A20233541363841';
wwv_flow_api.g_varchar2_table(1558) := '442021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3134207B0D0A20206261636B67726F756E642D636F6C6F723A20234146424143352021696D706F7274616E743B0D0A202066696C6C3A20234146424143352021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1559) := '3B0D0A2020636F6C6F723A20233331336134342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D62672C0D0A2E752D636F6C6F722D31342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1560) := '4146424143352021696D706F7274616E743B0D0A202066696C6C3A20234146424143352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D7478742C0D0A2E752D636F6C6F722D31342D74657874207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1561) := '4146424143352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31342D62642C0D0A2E752D636F6C6F722D31342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20234146424143352021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1562) := '207374726F6B653A20234146424143352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3135207B0D0A20206261636B67726F756E642D636F6C6F723A20233645383539382021696D706F7274616E743B0D0A202066696C6C3A20233645';
wwv_flow_api.g_varchar2_table(1563) := '383539382021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31352D62672C0D0A2E752D636F6C6F722D31352D6261636B67726F756E64207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1564) := '67726F756E642D636F6C6F723A20233645383539382021696D706F7274616E743B0D0A202066696C6C3A20233645383539382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31352D7478742C0D0A2E752D636F6C6F722D31352D746578';
wwv_flow_api.g_varchar2_table(1565) := '74207B0D0A2020636F6C6F723A20233645383539382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31352D62642C0D0A2E752D636F6C6F722D31352D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023364538353938';
wwv_flow_api.g_varchar2_table(1566) := '2021696D706F7274616E743B0D0A20207374726F6B653A20233645383539382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3136207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265322021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1567) := '743B0D0A202066696C6C3A20233539623265322021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31362D62672C0D0A2E752D636F6C6F722D31362D6261636B67';
wwv_flow_api.g_varchar2_table(1568) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233539623265322021696D706F7274616E743B0D0A202066696C6C3A20233539623265322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31362D7478742C0D0A';
wwv_flow_api.g_varchar2_table(1569) := '2E752D636F6C6F722D31362D74657874207B0D0A2020636F6C6F723A20233539623265322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31362D62642C0D0A2E752D636F6C6F722D31362D626F72646572207B0D0A2020626F72646572';
wwv_flow_api.g_varchar2_table(1570) := '2D636F6C6F723A20233539623265322021696D706F7274616E743B0D0A20207374726F6B653A20233539623265322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3137207B0D0A20206261636B67726F756E642D636F6C6F723A202334';
wwv_flow_api.g_varchar2_table(1571) := '32633564392021696D706F7274616E743B0D0A202066696C6C3A20233432633564392021696D706F7274616E743B0D0A2020636F6C6F723A20233035313531372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31372D62672C0D0A2E75';
wwv_flow_api.g_varchar2_table(1572) := '2D636F6C6F722D31372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233432633564392021696D706F7274616E743B0D0A202066696C6C3A20233432633564392021696D706F7274616E743B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1573) := '636F6C6F722D31372D7478742C0D0A2E752D636F6C6F722D31372D74657874207B0D0A2020636F6C6F723A20233432633564392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31372D62642C0D0A2E752D636F6C6F722D31372D626F72';
wwv_flow_api.g_varchar2_table(1574) := '646572207B0D0A2020626F726465722D636F6C6F723A20233432633564392021696D706F7274616E743B0D0A20207374726F6B653A20233432633564392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3138207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1575) := '726F756E642D636F6C6F723A20233538636363392021696D706F7274616E743B0D0A202066696C6C3A20233538636363392021696D706F7274616E743B0D0A2020636F6C6F723A20233039316331632021696D706F7274616E743B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1576) := '6F6C6F722D31382D62672C0D0A2E752D636F6C6F722D31382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233538636363392021696D706F7274616E743B0D0A202066696C6C3A20233538636363392021696D70';
wwv_flow_api.g_varchar2_table(1577) := '6F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31382D7478742C0D0A2E752D636F6C6F722D31382D74657874207B0D0A2020636F6C6F723A20233538636363392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31382D62642C0D0A';
wwv_flow_api.g_varchar2_table(1578) := '2E752D636F6C6F722D31382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233538636363392021696D706F7274616E743B0D0A20207374726F6B653A20233538636363392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1579) := '722D3139207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639642021696D706F7274616E743B0D0A202066696C6C3A20233633626639642021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F';
wwv_flow_api.g_varchar2_table(1580) := '7274616E743B0D0A7D0D0A2E752D636F6C6F722D31392D62672C0D0A2E752D636F6C6F722D31392D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233633626639642021696D706F7274616E743B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1581) := '6C3A20233633626639642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D31392D7478742C0D0A2E752D636F6C6F722D31392D74657874207B0D0A2020636F6C6F723A20233633626639642021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1582) := '2D636F6C6F722D31392D62642C0D0A2E752D636F6C6F722D31392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233633626639642021696D706F7274616E743B0D0A20207374726F6B653A20233633626639642021696D706F727461';
wwv_flow_api.g_varchar2_table(1583) := '6E743B0D0A7D0D0A2E752D636F6C6F722D3230207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937662021696D706F7274616E743B0D0A202066696C6C3A20233961633937662021696D706F7274616E743B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1584) := '3A20233230333331362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D62672C0D0A2E752D636F6C6F722D32302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233961633937662021696D';
wwv_flow_api.g_varchar2_table(1585) := '706F7274616E743B0D0A202066696C6C3A20233961633937662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D7478742C0D0A2E752D636F6C6F722D32302D74657874207B0D0A2020636F6C6F723A20233961633937662021696D';
wwv_flow_api.g_varchar2_table(1586) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32302D62642C0D0A2E752D636F6C6F722D32302D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233961633937662021696D706F7274616E743B0D0A20207374726F6B653A2023';
wwv_flow_api.g_varchar2_table(1587) := '3961633937662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3231207B0D0A20206261636B67726F756E642D636F6C6F723A20236534653537352021696D706F7274616E743B0D0A202066696C6C3A20236534653537352021696D706F';
wwv_flow_api.g_varchar2_table(1588) := '7274616E743B0D0A2020636F6C6F723A20233463346330662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32312D62672C0D0A2E752D636F6C6F722D32312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1589) := '6F723A20236534653537352021696D706F7274616E743B0D0A202066696C6C3A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32312D7478742C0D0A2E752D636F6C6F722D32312D74657874207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1590) := '6F723A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32312D62642C0D0A2E752D636F6C6F722D32312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236534653537352021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1591) := '743B0D0A20207374726F6B653A20236534653537352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3232207B0D0A20206261636B67726F756E642D636F6C6F723A20236663643836652021696D706F7274616E743B0D0A202066696C6C';
wwv_flow_api.g_varchar2_table(1592) := '3A20236663643836652021696D706F7274616E743B0D0A2020636F6C6F723A20233639346630322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32322D62672C0D0A2E752D636F6C6F722D32322D6261636B67726F756E64207B0D0A20';
wwv_flow_api.g_varchar2_table(1593) := '206261636B67726F756E642D636F6C6F723A20236663643836652021696D706F7274616E743B0D0A202066696C6C3A20236663643836652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32322D7478742C0D0A2E752D636F6C6F722D32';
wwv_flow_api.g_varchar2_table(1594) := '322D74657874207B0D0A2020636F6C6F723A20236663643836652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32322D62642C0D0A2E752D636F6C6F722D32322D626F72646572207B0D0A2020626F726465722D636F6C6F723A202366';
wwv_flow_api.g_varchar2_table(1595) := '63643836652021696D706F7274616E743B0D0A20207374726F6B653A20236663643836652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3233207B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136352021696D70';
wwv_flow_api.g_varchar2_table(1596) := '6F7274616E743B0D0A202066696C6C3A20236631396136352021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32332D62672C0D0A2E752D636F6C6F722D32332D';
wwv_flow_api.g_varchar2_table(1597) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236631396136352021696D706F7274616E743B0D0A202066696C6C3A20236631396136352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32332D74';
wwv_flow_api.g_varchar2_table(1598) := '78742C0D0A2E752D636F6C6F722D32332D74657874207B0D0A2020636F6C6F723A20236631396136352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32332D62642C0D0A2E752D636F6C6F722D32332D626F72646572207B0D0A202062';
wwv_flow_api.g_varchar2_table(1599) := '6F726465722D636F6C6F723A20236631396136352021696D706F7274616E743B0D0A20207374726F6B653A20236631396136352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3234207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1600) := '723A20236564376337362021696D706F7274616E743B0D0A202066696C6C3A20236564376337362021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32342D6267';
wwv_flow_api.g_varchar2_table(1601) := '2C0D0A2E752D636F6C6F722D32342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376337362021696D706F7274616E743B0D0A202066696C6C3A20236564376337362021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1602) := '0D0A2E752D636F6C6F722D32342D7478742C0D0A2E752D636F6C6F722D32342D74657874207B0D0A2020636F6C6F723A20236564376337362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32342D62642C0D0A2E752D636F6C6F722D32';
wwv_flow_api.g_varchar2_table(1603) := '342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376337362021696D706F7274616E743B0D0A20207374726F6B653A20236564376337362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3235207B0D0A2020';
wwv_flow_api.g_varchar2_table(1604) := '6261636B67726F756E642D636F6C6F723A20236564376461302021696D706F7274616E743B0D0A202066696C6C3A20236564376461302021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1605) := '0A2E752D636F6C6F722D32352D62672C0D0A2E752D636F6C6F722D32352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236564376461302021696D706F7274616E743B0D0A202066696C6C3A2023656437646130';
wwv_flow_api.g_varchar2_table(1606) := '2021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32352D7478742C0D0A2E752D636F6C6F722D32352D74657874207B0D0A2020636F6C6F723A20236564376461302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32352D';
wwv_flow_api.g_varchar2_table(1607) := '62642C0D0A2E752D636F6C6F722D32352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236564376461302021696D706F7274616E743B0D0A20207374726F6B653A20236564376461302021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1608) := '2D636F6C6F722D3236207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962312021696D706F7274616E743B0D0A202066696C6C3A20236435373962312021696D706F7274616E743B0D0A2020636F6C6F723A202366666666666620';
wwv_flow_api.g_varchar2_table(1609) := '21696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32362D62672C0D0A2E752D636F6C6F722D32362D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236435373962312021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1610) := '202066696C6C3A20236435373962312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32362D7478742C0D0A2E752D636F6C6F722D32362D74657874207B0D0A2020636F6C6F723A20236435373962312021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1611) := '7D0D0A2E752D636F6C6F722D32362D62642C0D0A2E752D636F6C6F722D32362D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236435373962312021696D706F7274616E743B0D0A20207374726F6B653A20236435373962312021696D';
wwv_flow_api.g_varchar2_table(1612) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3237207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161662021696D706F7274616E743B0D0A202066696C6C3A20233964373161662021696D706F7274616E743B0D0A2020';
wwv_flow_api.g_varchar2_table(1613) := '636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D62672C0D0A2E752D636F6C6F722D32372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233964373161';
wwv_flow_api.g_varchar2_table(1614) := '662021696D706F7274616E743B0D0A202066696C6C3A20233964373161662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D7478742C0D0A2E752D636F6C6F722D32372D74657874207B0D0A2020636F6C6F723A20233964373161';
wwv_flow_api.g_varchar2_table(1615) := '662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32372D62642C0D0A2E752D636F6C6F722D32372D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233964373161662021696D706F7274616E743B0D0A20207374726F';
wwv_flow_api.g_varchar2_table(1616) := '6B653A20233964373161662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3238207B0D0A20206261636B67726F756E642D636F6C6F723A20233762383662642021696D706F7274616E743B0D0A202066696C6C3A202337623836626420';
wwv_flow_api.g_varchar2_table(1617) := '21696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32382D62672C0D0A2E752D636F6C6F722D32382D6261636B67726F756E64207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(1618) := '642D636F6C6F723A20233762383662642021696D706F7274616E743B0D0A202066696C6C3A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32382D7478742C0D0A2E752D636F6C6F722D32382D74657874207B0D0A';
wwv_flow_api.g_varchar2_table(1619) := '2020636F6C6F723A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32382D62642C0D0A2E752D636F6C6F722D32382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233762383662642021696D70';
wwv_flow_api.g_varchar2_table(1620) := '6F7274616E743B0D0A20207374726F6B653A20233762383662642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3239207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864312021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1621) := '2066696C6C3A20236266633864312021696D706F7274616E743B0D0A2020636F6C6F723A20233364343835342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32392D62672C0D0A2E752D636F6C6F722D32392D6261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1622) := '207B0D0A20206261636B67726F756E642D636F6C6F723A20236266633864312021696D706F7274616E743B0D0A202066696C6C3A20236266633864312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32392D7478742C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1623) := '6C6F722D32392D74657874207B0D0A2020636F6C6F723A20236266633864312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D32392D62642C0D0A2E752D636F6C6F722D32392D626F72646572207B0D0A2020626F726465722D636F6C6F';
wwv_flow_api.g_varchar2_table(1624) := '723A20236266633864312021696D706F7274616E743B0D0A20207374726F6B653A20236266633864312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3330207B0D0A20206261636B67726F756E642D636F6C6F723A2023386239646164';
wwv_flow_api.g_varchar2_table(1625) := '2021696D706F7274616E743B0D0A202066696C6C3A20233862396461642021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33302D62672C0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1626) := '722D33302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233862396461642021696D706F7274616E743B0D0A202066696C6C3A20233862396461642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F72';
wwv_flow_api.g_varchar2_table(1627) := '2D33302D7478742C0D0A2E752D636F6C6F722D33302D74657874207B0D0A2020636F6C6F723A20233862396461642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33302D62642C0D0A2E752D636F6C6F722D33302D626F72646572207B';
wwv_flow_api.g_varchar2_table(1628) := '0D0A2020626F726465722D636F6C6F723A20233862396461642021696D706F7274616E743B0D0A20207374726F6B653A20233862396461642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3331207B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1629) := '2D636F6C6F723A20233139386363612021696D706F7274616E743B0D0A202066696C6C3A20233139386363612021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D';
wwv_flow_api.g_varchar2_table(1630) := '33312D62672C0D0A2E752D636F6C6F722D33312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233139386363612021696D706F7274616E743B0D0A202066696C6C3A20233139386363612021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1631) := '743B0D0A7D0D0A2E752D636F6C6F722D33312D7478742C0D0A2E752D636F6C6F722D33312D74657874207B0D0A2020636F6C6F723A20233139386363612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33312D62642C0D0A2E752D636F';
wwv_flow_api.g_varchar2_table(1632) := '6C6F722D33312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233139386363612021696D706F7274616E743B0D0A20207374726F6B653A20233139386363612021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D333220';
wwv_flow_api.g_varchar2_table(1633) := '7B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562652021696D706F7274616E743B0D0A202066696C6C3A20233032613562652021696D706F7274616E743B0D0A2020636F6C6F723A20233030303030302021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1634) := '3B0D0A7D0D0A2E752D636F6C6F722D33322D62672C0D0A2E752D636F6C6F722D33322D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233032613562652021696D706F7274616E743B0D0A202066696C6C3A202330';
wwv_flow_api.g_varchar2_table(1635) := '32613562652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33322D7478742C0D0A2E752D636F6C6F722D33322D74657874207B0D0A2020636F6C6F723A20233032613562652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1636) := '722D33322D62642C0D0A2E752D636F6C6F722D33322D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233032613562652021696D706F7274616E743B0D0A20207374726F6B653A20233032613562652021696D706F7274616E743B0D0A';
wwv_flow_api.g_varchar2_table(1637) := '7D0D0A2E752D636F6C6F722D3333207B0D0A20206261636B67726F756E642D636F6C6F723A20233138623161652021696D706F7274616E743B0D0A202066696C6C3A20233138623161652021696D706F7274616E743B0D0A2020636F6C6F723A20233030';
wwv_flow_api.g_varchar2_table(1638) := '303030302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33332D62672C0D0A2E752D636F6C6F722D33332D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233138623161652021696D706F727461';
wwv_flow_api.g_varchar2_table(1639) := '6E743B0D0A202066696C6C3A20233138623161652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33332D7478742C0D0A2E752D636F6C6F722D33332D74657874207B0D0A2020636F6C6F723A20233138623161652021696D706F727461';
wwv_flow_api.g_varchar2_table(1640) := '6E743B0D0A7D0D0A2E752D636F6C6F722D33332D62642C0D0A2E752D636F6C6F722D33332D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233138623161652021696D706F7274616E743B0D0A20207374726F6B653A20233138623161';
wwv_flow_api.g_varchar2_table(1641) := '652021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3334207B0D0A20206261636B67726F756E642D636F6C6F723A20233234613437352021696D706F7274616E743B0D0A202066696C6C3A20233234613437352021696D706F7274616E74';
wwv_flow_api.g_varchar2_table(1642) := '3B0D0A2020636F6C6F723A20236566666266372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D62672C0D0A2E752D636F6C6F722D33342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1643) := '3234613437352021696D706F7274616E743B0D0A202066696C6C3A20233234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D7478742C0D0A2E752D636F6C6F722D33342D74657874207B0D0A2020636F6C6F723A2023';
wwv_flow_api.g_varchar2_table(1644) := '3234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33342D62642C0D0A2E752D636F6C6F722D33342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233234613437352021696D706F7274616E743B0D0A20';
wwv_flow_api.g_varchar2_table(1645) := '207374726F6B653A20233234613437352021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3335207B0D0A20206261636B67726F756E642D636F6C6F723A20233661616434322021696D706F7274616E743B0D0A202066696C6C3A20233661';
wwv_flow_api.g_varchar2_table(1646) := '616434322021696D706F7274616E743B0D0A2020636F6C6F723A20233063313530362021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33352D62672C0D0A2E752D636F6C6F722D33352D6261636B67726F756E64207B0D0A20206261636B';
wwv_flow_api.g_varchar2_table(1647) := '67726F756E642D636F6C6F723A20233661616434322021696D706F7274616E743B0D0A202066696C6C3A20233661616434322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33352D7478742C0D0A2E752D636F6C6F722D33352D746578';
wwv_flow_api.g_varchar2_table(1648) := '74207B0D0A2020636F6C6F723A20233661616434322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33352D62642C0D0A2E752D636F6C6F722D33352D626F72646572207B0D0A2020626F726465722D636F6C6F723A2023366161643432';
wwv_flow_api.g_varchar2_table(1649) := '2021696D706F7274616E743B0D0A20207374726F6B653A20233661616434322021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3336207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133392021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1650) := '743B0D0A202066696C6C3A20236339636133392021696D706F7274616E743B0D0A2020636F6C6F723A20233264326530342021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33362D62672C0D0A2E752D636F6C6F722D33362D6261636B67';
wwv_flow_api.g_varchar2_table(1651) := '726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236339636133392021696D706F7274616E743B0D0A202066696C6C3A20236339636133392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33362D7478742C0D0A';
wwv_flow_api.g_varchar2_table(1652) := '2E752D636F6C6F722D33362D74657874207B0D0A2020636F6C6F723A20236339636133392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33362D62642C0D0A2E752D636F6C6F722D33362D626F72646572207B0D0A2020626F72646572';
wwv_flow_api.g_varchar2_table(1653) := '2D636F6C6F723A20236339636133392021696D706F7274616E743B0D0A20207374726F6B653A20236339636133392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3337207B0D0A20206261636B67726F756E642D636F6C6F723A202364';
wwv_flow_api.g_varchar2_table(1654) := '39623133622021696D706F7274616E743B0D0A202066696C6C3A20236439623133622021696D706F7274616E743B0D0A2020636F6C6F723A20233436333430302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33372D62672C0D0A2E75';
wwv_flow_api.g_varchar2_table(1655) := '2D636F6C6F722D33372D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236439623133622021696D706F7274616E743B0D0A202066696C6C3A20236439623133622021696D706F7274616E743B0D0A7D0D0A2E752D';
wwv_flow_api.g_varchar2_table(1656) := '636F6C6F722D33372D7478742C0D0A2E752D636F6C6F722D33372D74657874207B0D0A2020636F6C6F723A20236439623133622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33372D62642C0D0A2E752D636F6C6F722D33372D626F72';
wwv_flow_api.g_varchar2_table(1657) := '646572207B0D0A2020626F726465722D636F6C6F723A20236439623133622021696D706F7274616E743B0D0A20207374726F6B653A20236439623133622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3338207B0D0A20206261636B67';
wwv_flow_api.g_varchar2_table(1658) := '726F756E642D636F6C6F723A20236437366132372021696D706F7274616E743B0D0A202066696C6C3A20236437366132372021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D63';
wwv_flow_api.g_varchar2_table(1659) := '6F6C6F722D33382D62672C0D0A2E752D636F6C6F722D33382D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236437366132372021696D706F7274616E743B0D0A202066696C6C3A20236437366132372021696D70';
wwv_flow_api.g_varchar2_table(1660) := '6F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33382D7478742C0D0A2E752D636F6C6F722D33382D74657874207B0D0A2020636F6C6F723A20236437366132372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33382D62642C0D0A';
wwv_flow_api.g_varchar2_table(1661) := '2E752D636F6C6F722D33382D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236437366132372021696D706F7274616E743B0D0A20207374726F6B653A20236437366132372021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F';
wwv_flow_api.g_varchar2_table(1662) := '722D3339207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233622021696D706F7274616E743B0D0A202066696C6C3A20236432343233622021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F';
wwv_flow_api.g_varchar2_table(1663) := '7274616E743B0D0A7D0D0A2E752D636F6C6F722D33392D62672C0D0A2E752D636F6C6F722D33392D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236432343233622021696D706F7274616E743B0D0A202066696C';
wwv_flow_api.g_varchar2_table(1664) := '6C3A20236432343233622021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D33392D7478742C0D0A2E752D636F6C6F722D33392D74657874207B0D0A2020636F6C6F723A20236432343233622021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1665) := '2D636F6C6F722D33392D62642C0D0A2E752D636F6C6F722D33392D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236432343233622021696D706F7274616E743B0D0A20207374726F6B653A20236432343233622021696D706F727461';
wwv_flow_api.g_varchar2_table(1666) := '6E743B0D0A7D0D0A2E752D636F6C6F722D3430207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336662021696D706F7274616E743B0D0A202066696C6C3A20236431343336662021696D706F7274616E743B0D0A2020636F6C6F72';
wwv_flow_api.g_varchar2_table(1667) := '3A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D62672C0D0A2E752D636F6C6F722D34302D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20236431343336662021696D';
wwv_flow_api.g_varchar2_table(1668) := '706F7274616E743B0D0A202066696C6C3A20236431343336662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D7478742C0D0A2E752D636F6C6F722D34302D74657874207B0D0A2020636F6C6F723A20236431343336662021696D';
wwv_flow_api.g_varchar2_table(1669) := '706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34302D62642C0D0A2E752D636F6C6F722D34302D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236431343336662021696D706F7274616E743B0D0A20207374726F6B653A2023';
wwv_flow_api.g_varchar2_table(1670) := '6431343336662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3431207B0D0A20206261636B67726F756E642D636F6C6F723A20236261336438382021696D706F7274616E743B0D0A202066696C6C3A20236261336438382021696D706F';
wwv_flow_api.g_varchar2_table(1671) := '7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34312D62672C0D0A2E752D636F6C6F722D34312D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C';
wwv_flow_api.g_varchar2_table(1672) := '6F723A20236261336438382021696D706F7274616E743B0D0A202066696C6C3A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34312D7478742C0D0A2E752D636F6C6F722D34312D74657874207B0D0A2020636F6C';
wwv_flow_api.g_varchar2_table(1673) := '6F723A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34312D62642C0D0A2E752D636F6C6F722D34312D626F72646572207B0D0A2020626F726465722D636F6C6F723A20236261336438382021696D706F7274616E';
wwv_flow_api.g_varchar2_table(1674) := '743B0D0A20207374726F6B653A20236261336438382021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3432207B0D0A20206261636B67726F756E642D636F6C6F723A20233737333339332021696D706F7274616E743B0D0A202066696C6C';
wwv_flow_api.g_varchar2_table(1675) := '3A20233737333339332021696D706F7274616E743B0D0A2020636F6C6F723A20236636656666392021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34322D62672C0D0A2E752D636F6C6F722D34322D6261636B67726F756E64207B0D0A20';
wwv_flow_api.g_varchar2_table(1676) := '206261636B67726F756E642D636F6C6F723A20233737333339332021696D706F7274616E743B0D0A202066696C6C3A20233737333339332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34322D7478742C0D0A2E752D636F6C6F722D34';
wwv_flow_api.g_varchar2_table(1677) := '322D74657874207B0D0A2020636F6C6F723A20233737333339332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34322D62642C0D0A2E752D636F6C6F722D34322D626F72646572207B0D0A2020626F726465722D636F6C6F723A202337';
wwv_flow_api.g_varchar2_table(1678) := '37333339332021696D706F7274616E743B0D0A20207374726F6B653A20233737333339332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3433207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561332021696D70';
wwv_flow_api.g_varchar2_table(1679) := '6F7274616E743B0D0A202066696C6C3A20233364346561332021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34332D62672C0D0A2E752D636F6C6F722D34332D';
wwv_flow_api.g_varchar2_table(1680) := '6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233364346561332021696D706F7274616E743B0D0A202066696C6C3A20233364346561332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34332D74';
wwv_flow_api.g_varchar2_table(1681) := '78742C0D0A2E752D636F6C6F722D34332D74657874207B0D0A2020636F6C6F723A20233364346561332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34332D62642C0D0A2E752D636F6C6F722D34332D626F72646572207B0D0A202062';
wwv_flow_api.g_varchar2_table(1682) := '6F726465722D636F6C6F723A20233364346561332021696D706F7274616E743B0D0A20207374726F6B653A20233364346561332021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3434207B0D0A20206261636B67726F756E642D636F6C6F';
wwv_flow_api.g_varchar2_table(1683) := '723A20233863396562302021696D706F7274616E743B0D0A202066696C6C3A20233863396562302021696D706F7274616E743B0D0A2020636F6C6F723A20233238336134642021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34342D6267';
wwv_flow_api.g_varchar2_table(1684) := '2C0D0A2E752D636F6C6F722D34342D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233863396562302021696D706F7274616E743B0D0A202066696C6C3A20233863396562302021696D706F7274616E743B0D0A7D';
wwv_flow_api.g_varchar2_table(1685) := '0D0A2E752D636F6C6F722D34342D7478742C0D0A2E752D636F6C6F722D34342D74657874207B0D0A2020636F6C6F723A20233863396562302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34342D62642C0D0A2E752D636F6C6F722D34';
wwv_flow_api.g_varchar2_table(1686) := '342D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233863396562302021696D706F7274616E743B0D0A20207374726F6B653A20233863396562302021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D3435207B0D0A2020';
wwv_flow_api.g_varchar2_table(1687) := '6261636B67726F756E642D636F6C6F723A20233465373339312021696D706F7274616E743B0D0A202066696C6C3A20233465373339312021696D706F7274616E743B0D0A2020636F6C6F723A20236666666666662021696D706F7274616E743B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1688) := '0A2E752D636F6C6F722D34352D62672C0D0A2E752D636F6C6F722D34352D6261636B67726F756E64207B0D0A20206261636B67726F756E642D636F6C6F723A20233465373339312021696D706F7274616E743B0D0A202066696C6C3A2023346537333931';
wwv_flow_api.g_varchar2_table(1689) := '2021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34352D7478742C0D0A2E752D636F6C6F722D34352D74657874207B0D0A2020636F6C6F723A20233465373339312021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D34352D';
wwv_flow_api.g_varchar2_table(1690) := '62642C0D0A2E752D636F6C6F722D34352D626F72646572207B0D0A2020626F726465722D636F6C6F723A20233465373339312021696D706F7274616E743B0D0A20207374726F6B653A20233465373339312021696D706F7274616E743B0D0A7D0D0A2E75';
wwv_flow_api.g_varchar2_table(1691) := '2D636F6C6F722D7472616E73706172656E74207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A2020636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D';
wwv_flow_api.g_varchar2_table(1692) := '0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D6267207B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D';
wwv_flow_api.g_varchar2_table(1693) := '7478742C0D0A2E752D636F6C6F722D7472616E73706172656E742D74657874207B0D0A2020636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A2E752D636F6C6F722D7472616E73706172656E742D62642C0D0A2E75';
wwv_flow_api.g_varchar2_table(1694) := '2D636F6C6F722D7472616E73706172656E742D626F72646572207B0D0A2020626F726465722D636F6C6F723A207472616E73706172656E742021696D706F7274616E743B0D0A7D0D0A0D0A2F2A200D0A202A204F7261636C65204170706C69636174696F';
wwv_flow_api.g_varchar2_table(1695) := '6E204578707265737320352E30205468656D6520526F6C6C657220437573746F6D20435353200D0A202A0D0A202A2F0D0A0D0A2F2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0D0A2A2020556E6976657273616C20';
wwv_flow_api.g_varchar2_table(1696) := '7468656D65206F76657272696465730D0A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2F0D0A2F2A2A0D0A2A2052656D6F7665206C696E6B20627574746F6E20626F72646572207768656E20666F63757365640D0A';
wwv_flow_api.g_varchar2_table(1697) := '2A2A2F0D0A2E742D427574746F6E2D2D6C696E6B3A666F6375733A6265666F72652C0D0A2E742D427574746F6E2D2D6C696E6B3A666F6375733A61667465727B0D0A20206F75746C696E653A6E6F6E6521696D706F7274616E743B0D0A2020626F782D73';
wwv_flow_api.g_varchar2_table(1698) := '6861646F773A6E6F6E6521696D706F7274616E743B0D0A7D0D0A2F2A0D0A2E742D486561646572202E742D4865616465722D6E6176207B0D0A2020626F782D736861646F773A20302032707820347078202D327078207267626128302C302C302C2E3037';
wwv_flow_api.g_varchar2_table(1699) := '35293B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C302C302C2E303735293B0D0A7D0D0A2A2F0D0A2F2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0D0A2A2020437573';
wwv_flow_api.g_varchar2_table(1700) := '746F6D207374796C65730D0A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2F0D0A2F2A2A2A0D0A2A20456C656D656E74730D0A2A2A2A2F0D0A626C6F636B71756F74653A3A6265666F72657B0D0A2020636F6E7465';
wwv_flow_api.g_varchar2_table(1701) := '6E743A206F70656E2D71756F74653B0D0A2020666F6E742D73697A653A20322E3272656D3B0D0A7D0D0A626C6F636B71756F74653A3A61667465727B0D0A2020636F6E74656E743A20636C6F73652D71756F74653B0D0A2020666F6E742D73697A653A20';
wwv_flow_api.g_varchar2_table(1702) := '322E3272656D3B0D0A7D0D0A626C6F636B71756F746520707B0D0A2020646973706C61793A20696E6C696E653B0D0A7D0D0A0D0A2F2A2A0D0A2A204C6F676F0D0A2A2A2F0D0A2E7A2D6170702D6C6F676F20717B0D0A2020646973706C61793A20626C6F';
wwv_flow_api.g_varchar2_table(1703) := '636B3B0D0A2020666F6E742D73697A653A20312E3472656D3B0D0A2020666F6E742D7374796C653A206F626C697175653B0D0A2020666F6E742D7765696768743A206E6F726D616C3B0D0A7D0D0A0D0A2F2A2A0D0A2A20417574686F7220696E666F0D0A';
wwv_flow_api.g_varchar2_table(1704) := '2A2A2F0D0A2E7A2D617574686F722D2D63617264202E742D436172647B0D0A20206D617267696E3A20303B0D0A202070616464696E673A20303B0D0A202077696474683A20313030253B0D0A7D0D0A2E7A2D617574686F722D2D63617264202E742D4361';
wwv_flow_api.g_varchar2_table(1705) := '72642D7469746C6557726170207B0D0A20206D696E2D6865696768743A20696E697469616C3B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C302C302C2E303735293B0D0A2020626F782D736861646F773A20';
wwv_flow_api.g_varchar2_table(1706) := '6E6F6E653B0D0A7D0D0A2E7A2D617574686F722D2D63617264202E742D436172642D7469746C65207B0D0A2020666F6E742D73697A653A20312E3672656D3B0D0A2020666F6E742D7765696768743A203530303B0D0A20206C696E652D6865696768743A';
wwv_flow_api.g_varchar2_table(1707) := '20322E3472656D3B0D0A7D0D0A2E7A2D617574686F722D2D63617264202E742D436172642D777261707B0D0A2020626F726465723A206E6F6E653B0D0A7D0D0A2E7A2D617574686F722D2D63617264202E742D436172642D636F6C6F7246696C6C7B0D0A';
wwv_flow_api.g_varchar2_table(1708) := '20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A2E7A2D617574686F722D636F6E7461696E65727B0D0A2020646973706C61793A20666C65783B0D0A2020666C65782D666C6F773A20726F773B0D0A20207769';
wwv_flow_api.g_varchar2_table(1709) := '6474683A20313030253B0D0A7D0D0A2E7A2D617574686F722D6C6566747B0D0A20206F726465723A20313B0D0A7D0D0A2E7A2D617574686F722D6C65667420696D677B0D0A2020646973706C61793A20626C6F636B3B0D0A7D0D0A2E7A2D617574686F72';
wwv_flow_api.g_varchar2_table(1710) := '2D72696768747B0D0A20206F726465723A20323B0D0A202070616464696E672D6C6566743A20313670783B0D0A7D0D0A0D0A2F2A2A0D0A2A205265706F7274730D0A2A2A2F0D0A2E6E6F64617461666F756E647B0D0A2020666F6E742D73697A653A2031';
wwv_flow_api.g_varchar2_table(1711) := '2E3272656D3B0D0A7D0D0A0D0A2F2A2A0D0A2A20506F7374207265706F72740D0A2A2A2F0D0A2E7A2D706F73747B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A20206D617267696E2D626F74746F6D3A20313670783B';
wwv_flow_api.g_varchar2_table(1712) := '0D0A2020626F726465723A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A2020626F726465722D7261646975733A203270783B0D0A2020626F782D736861646F773A20302032707820347078202D327078207267626128302C302C';
wwv_flow_api.g_varchar2_table(1713) := '302C2E303735293B0D0A202070616464696E673A20313670783B0D0A7D0D0A2E7A2D706F73742D2D6865616465727B0D0A2020636C6561723A20626F74683B0D0A7D0D0A2E7A2D706F73742D2D6865616465722068317B0D0A2020666F6E742D73697A65';
wwv_flow_api.g_varchar2_table(1714) := '3A20312E36656D3B0D0A20206D617267696E3A2030203020302E3272656D3B0D0A7D0D0A2E7A2D706F73742D2D68656164657220683120617B0D0A2020636F6C6F723A20696E68657269743B0D0A7D0D0A2E7A2D706F73742D2D6865616465722068327B';
wwv_flow_api.g_varchar2_table(1715) := '0D0A2020666F6E742D73697A653A20312E3472656D3B0D0A20206D617267696E3A2030203020312E3872656D3B0D0A7D0D0A2E7A2D706F73742D2D6865616465722068337B0D0A2020666F6E742D73697A653A20312E3472656D3B0D0A20206D61726769';
wwv_flow_api.g_varchar2_table(1716) := '6E3A2030203020302E3272656D3B0D0A7D0D0A2E7A2D706F73742D2D626F647920696D677B0D0A20206D61782D77696474683A20313030253B0D0A20206865696768743A206175746F3B0D0A7D0D0A2E7A2D706F73742D2D626F64792062727B0D0A2020';
wwv_flow_api.g_varchar2_table(1717) := '636C6561723A206E6F6E6521696D706F7274616E743B0D0A7D0D0A2E7A2D706F73742D2D666F6F7465727B0D0A202077696474683A20313030253B0D0A2020636C6561723A20626F74683B0D0A20206D617267696E3A20312E3272656D203020303B0D0A';
wwv_flow_api.g_varchar2_table(1718) := '7D0D0A0D0A2F2A2A0D0A2A20436F6D6D656E74730D0A2A2A2F0D0A2E7A2D636F6D6D656E74202E742D436F6D6D656E74732D626F64797B0D0A2020666C65783A20312031206175746F3B0D0A202077696474683A20303B0D0A7D0D0A2E7A2D636F6D6D65';
wwv_flow_api.g_varchar2_table(1719) := '6E74202E742D436F6D6D656E74732D636F6D6D656E747B0D0A202077696474683A20313030253B0D0A20206F766572666C6F772D777261703A20627265616B2D776F72643B0D0A7D0D0A2E7A2D636F6D6D656E74207072657B0D0A2020666F6E742D6661';
wwv_flow_api.g_varchar2_table(1720) := '6D696C793A20696E68657269743B0D0A2020666F6E742D7374796C653A20696E68657269743B0D0A2020666F6E742D73697A653A20696E68657269743B0D0A202077686974652D73706163653A207072652D777261703B0D0A7D0D0A0D0A2F2A2A0D0A2A';
wwv_flow_api.g_varchar2_table(1721) := '204C696E6B73205265706F72740D0A2A2A2F0D0A2E7A2D6C696E6B737B0D0A20206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B0D0A7D0D0A6C692E7A2D6C696E6B732D2D6865616465727B0D0A2020646973706C61793A20';
wwv_flow_api.g_varchar2_table(1722) := '666C65783B0D0A2020666C65782D67726F773A20313B0D0A2020626F726465722D746F703A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A2020626F726465722D6C6566743A2031707820736F6C6964207267626128302C302C30';
wwv_flow_api.g_varchar2_table(1723) := '2C2E31293B0D0A2020626F726465722D72696768743A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A2020626F726465722D626F74746F6D3A206E6F6E653B0D0A2020626F782D736861646F773A20302032707820347078202D32';
wwv_flow_api.g_varchar2_table(1724) := '7078207267626128302C302C302C2E303735293B0D0A20206D617267696E2D746F703A20313670783B0D0A20206261636B67726F756E642D636F6C6F723A20236666666666663B0D0A2020626F726465722D7261646975733A2032707820327078203020';
wwv_flow_api.g_varchar2_table(1725) := '303B0D0A7D0D0A6C692E7A2D6C696E6B732D2D686561646572206469767B0D0A202077696474683A20313030253B0D0A202070616464696E673A20312E3272656D3B0D0A2020666F6E742D73697A653A20312E3672656D3B0D0A2020666F6E742D776569';
wwv_flow_api.g_varchar2_table(1726) := '6768743A203530303B0D0A20206C696E652D6865696768743A20322E3472656D3B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C302C302C2E303735293B0D0A7D0D0A6C692E7A2D6C696E6B732D2D68656164';
wwv_flow_api.g_varchar2_table(1727) := '65723A66697273742D6368696C647B0D0A20206D617267696E2D746F703A20303B0D0A7D0D0A6C692E7A2D6C696E6B732D2D6974656D7B0D0A2020626F726465722D6C6566743A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A20';
wwv_flow_api.g_varchar2_table(1728) := '20626F726465722D72696768743A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C302C302C2E303735293B0D0A20206261636B67726F756E64';
wwv_flow_api.g_varchar2_table(1729) := '2D636F6C6F723A20236666666666663B0D0A2020626F726465722D7261646975733A2030203020327078203270783B0D0A2020626F782D736861646F773A20302032707820347078202D327078207267626128302C302C302C2E303735293B0D0A7D0D0A';
wwv_flow_api.g_varchar2_table(1730) := '6C692E7A2D6C696E6B732D2D6974656D3A6C6173742D6368696C647B0D0A20206D617267696E2D626F74746F6D3A20313670783B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C6964207267626128302C302C302C2E31293B0D0A7D0D';
wwv_flow_api.g_varchar2_table(1731) := '0A0D0A2F2A2A0D0A2A2050726F6772616D20636F646520666F726D6174696E670D0A2A2A2F0D0A7072652E7A2D70726F6772616D2D636F64657B0D0A2020666F6E742D66616D696C793A20224C756369646120436F6E736F6C65222C20436F7572696572';
wwv_flow_api.g_varchar2_table(1732) := '2C206D6F6E6F73706163653B0D0A2020666F6E742D73697A653A20312E3272656D3B0D0A20206C696E652D6865696768743A20312E343B0D0A20207461622D73697A653A20323B0D0A2020636F756E7465722D72657365743A206C696E653B0D0A20206F';
wwv_flow_api.g_varchar2_table(1733) := '766572666C6F772D783A206175746F3B0D0A7D0D0A7072652E7A2D70726F6772616D2D636F646520636F64657B0D0A2020666F6E742D66616D696C793A20696E68657269743B0D0A2020666F6E742D73697A653A20696E68657269743B0D0A20206C696E';
wwv_flow_api.g_varchar2_table(1734) := '652D6865696768743A20696E68657269743B0D0A20207461622D73697A653A20696E68657269743B0D0A2020636F756E7465722D696E6372656D656E743A206C696E653B0D0A20206D617267696E3A20303B0D0A202070616464696E673A20303B0D0A20';
wwv_flow_api.g_varchar2_table(1735) := '206F766572666C6F773A2076697369626C653B0D0A7D0D0A7072652E7A2D70726F6772616D2D636F646520636F64653A3A6265666F72657B0D0A2020636F6E74656E743A20636F756E746572286C696E65293B0D0A2020626F726465722D72696768743A';
wwv_flow_api.g_varchar2_table(1736) := '2032707820736F6C696420233663653236633B0D0A20206D617267696E3A203020302E34656D203020303B0D0A202070616464696E673A203020302E32656D203020303B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B0D0A20207465';
wwv_flow_api.g_varchar2_table(1737) := '78742D616C69676E3A2072696768743B0D0A202077696474683A20322E32656D3B0D0A2020636F6C6F723A20233933393339333B0D0A2020757365722D73656C6563743A206E6F6E653B0D0A7D0D0A0D0A2F2A2A0D0A2A20526967687420636F6C756D6E';
wwv_flow_api.g_varchar2_table(1738) := '206C696E6B206C697374730D0A2A2A2F0D0A2E7A2D6C696E6B2D6C6973742D2D6E6F2D626F72646572206C692C0D0A2E7A2D6C696E6B2D6C6973742D2D6E6F2D626F7264657220613A666F6375737B0D0A2020626F726465723A206E6F6E653B0D0A2020';
wwv_flow_api.g_varchar2_table(1739) := '6F75746C696E653A206E6F6E653B0D0A2020626F782D736861646F773A206E6F6E653B0D0A7D0D0A0D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A203634307078297B0D0A20202F2A2A0D0A20202A20506F73';
wwv_flow_api.g_varchar2_table(1740) := '74207265706F72740D0A20202A2A2F0D0A20202E7A2D706F73747B0D0A2020202070616464696E673A20313270783B0D0A20207D0D0A20202E7A2D706F73742D2D6865616465722068317B0D0A20202020666F6E742D73697A653A20312E34656D3B0D0A';
wwv_flow_api.g_varchar2_table(1741) := '20207D0D0A20202E7A2D706F73742D2D6865616465722068327B0D0A20202020666F6E742D73697A653A20312E3372656D3B0D0A20207D0D0A20202E7A2D706F73742D2D6865616465722068337B0D0A20202020666F6E742D73697A653A20312E337265';
wwv_flow_api.g_varchar2_table(1742) := '6D3B0D0A20207D0D0A20202F2A2A0D0A20202A20417574686F7220696E666F0D0A20202A2A2F0D0A20202E7A2D617574686F722D636F6E7461696E65727B0D0A20202020666C65782D666C6F773A20636F6C756D6E3B0D0A20202020616C69676E2D6974';
wwv_flow_api.g_varchar2_table(1743) := '656D733A2063656E7465723B0D0A20207D0D0A20202E7A2D617574686F722D72696768747B0D0A2020202070616464696E673A20303B0D0A20207D0D0A7D0D0A0D0A2E7A2D68696464656E7B0D0A2020646973706C61793A206E6F6E653B0D0A20207669';
wwv_flow_api.g_varchar2_table(1744) := '736962696C6974793A2068696464656E3B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_theme_file(
 p_id=>wwv_flow_api.id(15402941797800057)
,p_theme_id=>42
,p_file_name=>'15402514075800027.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14834535132305318)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14834978747305318)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14835326890305318)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14835715290305318)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14836123147305319)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14836542837305319)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14836977881305319)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14837321953305319)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14837798551305319)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14838120281305320)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14838541067305320)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14838940783305320)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14839352942305320)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14839791161305320)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14840180696305320)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14840567612305321)
,p_theme_id=>42
,p_name=>'PRESERVE_LABEL_SPACING'
,p_display_name=>'Preserve Label Spacing'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_help_text=>'Preserves the label space and enables use of the Label Column Span property.'
,p_null_text=>'Yes'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14840901921305321)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14841394533305321)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14841714303305321)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14842150947305321)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14842572125305321)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14842908527305322)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14843303628305322)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14843761936305322)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE'
,p_display_name=>'Collapse Mode'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Icon (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14844101849305322)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14844518320305322)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14844980470305322)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14845306996305323)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14845705089305323)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14846104415305323)
,p_theme_id=>42
,p_name=>'ICON_STYLE'
,p_display_name=>'Icon Style'
,p_display_sequence=>35
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14846504034305323)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14846958675305323)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14847307418305324)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14847727799305324)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14848159039305324)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14848590679305324)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND'
,p_display_name=>'Page Background'
,p_display_sequence=>20
,p_template_types=>'PAGE'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14848932351305324)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT'
,p_display_name=>'Page Layout'
,p_display_sequence=>10
,p_template_types=>'PAGE'
,p_null_text=>'Floating (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14849388023305324)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14849753333305325)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14850125169305325)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14850518814305325)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14850905662305325)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14851378489305325)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14851750172305325)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14852171214305326)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14852572902305326)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14852978934305326)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14853376147305326)
,p_theme_id=>42
,p_name=>'CALLOUT_POSITION'
,p_display_name=>'Callout Position'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Determines where the callout for the popup will be positioned relative to its parent.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14853728710305326)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14854107466305326)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14854587209305327)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14854975016305327)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14855306097305327)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14855702622305327)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14856146132305327)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14856537426305328)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14856967337305328)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14857327121305328)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14857787114305328)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14858115998305328)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14858553952305328)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14858992722305329)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14859388165305329)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER'
,p_display_name=>'Login Header'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the Login region header.'
,p_null_text=>'Icon and Title (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14859751317305329)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14860148634305329)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14860551109305329)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14860972015305329)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14861349924305330)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14861747821305330)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14862108331305330)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14862581443305330)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14862931400305330)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14863332252305330)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14863787824305331)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14864116488305331)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14864588955305331)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14864916997305331)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14865317554305331)
,p_theme_id=>42
,p_name=>'COL_ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>150
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14865777579305331)
,p_theme_id=>42
,p_name=>'COL_CONTENT_DESCRIPTION'
,p_display_name=>'Description'
,p_display_sequence=>130
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14866143281305332)
,p_theme_id=>42
,p_name=>'COL_CONTENT_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>120
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14866590110305332)
,p_theme_id=>42
,p_name=>'COL_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>110
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14866968775305332)
,p_theme_id=>42
,p_name=>'COL_MISC'
,p_display_name=>'Misc'
,p_display_sequence=>140
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14867318247305332)
,p_theme_id=>42
,p_name=>'COL_SELECTION'
,p_display_name=>'Selection'
,p_display_sequence=>100
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14867722390305332)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14868189338305332)
,p_theme_id=>42
,p_name=>'CONTENT_ALIGNMENT'
,p_display_name=>'Content Alignment'
,p_display_sequence=>90
,p_template_types=>'REPORT'
,p_null_text=>'Center (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14868509072305333)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14868906562305333)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14869369304305333)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14869720730305333)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14870163460305333)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14870507609305333)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14870936534305334)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14871383713305334)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(14871717519305334)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5929537570475813)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(14853728710305326)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5930219924475814)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(14854107466305326)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5942270296475828)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5947825341475833)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(14856537426305328)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5948448098475834)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(14856537426305328)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5953357870475839)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5989377251475882)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5989793581475883)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5990169373475883)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5990611587475884)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5991014814475884)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5991370619475884)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5991827066475885)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6002389529475896)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(14845705089305323)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6003066087475896)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(14845705089305323)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6020313041475912)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(14845705089305323)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6020982949475913)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(14845705089305323)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6030384879475925)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6031044724475926)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6031754658475926)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6043856092475938)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6853224737267412)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6057138894475953)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6057838898475953)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6071436067475966)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6828031165267399)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6072095147475967)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6828031165267399)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6075497347475971)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6076187661475971)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(14868906562305333)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6102303900476005)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(6855074105267413)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(14834978747305318)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6103024172476006)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(6855074105267413)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(14834978747305318)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6104994311476009)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6105723779476009)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(14834978747305318)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6106400397476010)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(14834978747305318)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6760068626267364)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6757068893267362)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6761432850267365)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(6760179457267364)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6761555261267365)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(6760179457267364)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6763734634267366)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(6762463719267365)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6763889120267366)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(6762463719267365)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6766684833267367)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6763958837267366)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6769493284267369)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6766836658267367)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6772619796267370)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6769628254267369)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6775111656267372)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6772642789267370)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6777615153267373)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(6775199272267372)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6778315387267373)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6778669012267374)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(14850905662305325)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6779063701267374)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(14850518814305325)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6779305448267374)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(14850518814305325)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6779676291267374)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(14850125169305325)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6780086641267374)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(14849753333305325)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6780322922267374)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(14850905662305325)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6780455328267375)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(14850125169305325)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6780642068267375)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(14850905662305325)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6780881617267375)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(14850125169305325)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6781084960267375)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(14850905662305325)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6781333631267375)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6777727951267373)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(14849753333305325)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6783475163267376)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6782379920267375)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6783870739267376)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(6782379920267375)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(14852572902305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6784131409267376)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(6782379920267375)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6784318116267376)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(6782379920267375)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(14852572902305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6784532214267377)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6782379920267375)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6785668107267377)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(14862931400305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6785894516267377)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(14862931400305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6786060082267377)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(14862931400305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6786446905267378)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6786647358267378)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6786914707267378)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6787134871267378)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(14862931400305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6787321595267378)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6787652439267378)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6787895153267378)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6788054295267378)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6788256591267378)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6788447133267378)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6788875318267379)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(14855702622305327)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6789337986267379)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6789518562267379)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(14855702622305327)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6789679541267379)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6789878615267379)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6790049218267379)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6790264131267379)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6790512424267379)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6790657325267379)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6790895022267380)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6791294272267380)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(14851378489305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6791473980267380)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(14851378489305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6791683696267380)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6784592949267377)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6792702852267380)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6792898015267381)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6793110109267381)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6793280496267381)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6793505522267381)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6793690536267381)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6793911902267381)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6794082370267381)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6794327564267381)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6794655669267381)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(14854587209305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6794918047267382)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(14854587209305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6795092999267382)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6795289756267382)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6795503259267382)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6795710995267382)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6795927559267382)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6796057111267382)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6796332793267382)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6791752177267380)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6796732691267382)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6797045816267383)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(14860972015305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6797328953267383)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(14860972015305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6797494169267383)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(14860972015305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6797851586267383)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(14852978934305326)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6798105479267383)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6796339335267382)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(14852978934305326)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6798980193267384)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(14855306097305327)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6799196050267384)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6799394917267384)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6799568445267384)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6798176791267383)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6800243620267385)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6800509035267385)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6800869491267385)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6801084493267385)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6801329541267385)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6801505785267386)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6801653312267386)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6799730463267385)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(14854975016305327)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6802040130267386)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6801762579267386)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6802246114267386)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6801762579267386)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6803762727267387)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804015921267387)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804161150267387)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804399003267387)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(14851750172305325)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804546646267387)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804745785267387)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6804984548267387)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6805234991267387)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6805404196267388)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6805592027267388)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6805837752267388)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806012589267388)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806152330267388)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806354953267388)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806580945267388)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806763529267388)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6806991096267389)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6807222192267389)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6807430395267389)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(14849388023305324)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6807564621267389)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(14855702622305327)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6807755775267389)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6808035898267389)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(14855702622305327)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6808155504267389)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6808409132267389)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6808552332267389)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6808801425267389)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(14852171214305326)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6809019806267390)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6809220956267390)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6809396697267390)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6809588345267390)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(6802870362267386)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(14861747821305330)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6810819269267390)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(14858992722305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6811226373267391)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(14862581443305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6811368654267391)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6811555095267391)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(14862581443305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6811960725267391)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(14862108331305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6812163694267391)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6809714944267390)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(14862108331305330)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6812620093267391)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6812256103267391)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(14860972015305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6812828228267391)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6812256103267391)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6813036082267392)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(6812256103267391)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(14860972015305329)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6813152205267392)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6812256103267391)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6814054006267392)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6813273970267392)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(14856146132305327)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6814297857267392)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6813273970267392)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(14856146132305327)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6814465602267392)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6813273970267392)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6815090332267393)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(6814607236267392)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6815660705267393)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6815850574267393)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6816125339267393)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6816324515267393)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6816521328267393)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6816924534267394)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(14871383713305334)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6817086159267394)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6817306356267394)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6817509205267394)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6817726214267394)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6817931087267394)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(6815219261267393)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6818514303267394)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6818725935267395)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6818894635267395)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6819043992267395)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6819315170267395)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6819474904267395)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6819700694267395)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6819898676267395)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6817941349267394)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6820259378267395)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6820445081267395)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6820669062267396)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6820908506267396)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6821102729267396)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6821247283267396)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6821501258267396)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6821733547267396)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6820008141267395)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(14869369304305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6822290180267396)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(14864116488305331)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6822504400267396)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6822722068267396)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(14864116488305331)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6822887690267397)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6823047871267397)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(14864116488305331)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6823323593267397)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6823515139267397)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6823724343267397)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(14864116488305331)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6823888209267397)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(14864116488305331)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6824086194267397)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6824335562267397)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6824481510267397)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6824676271267397)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6824916874267398)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6825129440267398)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6825247855267398)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6821776972267396)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6825858252267398)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(14863332252305330)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6826043824267398)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(14863332252305330)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6826481606267398)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(14870936534305334)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6826911012267399)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(14870507609305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6827116845267399)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(14870507609305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6827292395267399)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(14870507609305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6827524293267399)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(14870936534305334)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6827666020267399)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6827881619267399)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6825403942267398)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(14870507609305333)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6828530916267399)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6828031165267399)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(14867722390305332)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6828658058267399)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6828031165267399)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(14867722390305332)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6829289103267400)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6829714236267400)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(14864588955305331)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6829855734267400)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6830128475267400)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(14864588955305331)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6830308217267400)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6830456953267400)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(14864588955305331)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6830695657267400)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6830912333267401)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6831062331267401)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6831537032267401)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(14863787824305331)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6831674137267401)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(14863787824305331)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6831840559267401)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6832296282267401)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(14868509072305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6832515986267401)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(14868509072305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6832666465267401)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6832920506267402)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6833137627267402)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6833276953267402)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(14864588955305331)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6833516304267402)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(14869720730305333)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6833640402267402)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(6829031688267400)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6834440931267402)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6834694835267403)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6834863378267403)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6835040251267403)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6835258363267403)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6835657663267403)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6835935057267403)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6836087427267403)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6836265924267403)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6836479325267403)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6836911244267404)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(14842908527305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6837072885267404)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(14842908527305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6837300700267404)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(14842908527305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6837531737267404)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6837693198267404)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(14842908527305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6837906951267404)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6833949072267402)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(14842908527305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6838238712267404)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6838640342267405)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(14843303628305322)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6838896066267405)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6839132096267405)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(14843303628305322)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6839249144267405)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6839513937267405)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(14843303628305322)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6839719484267405)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6839843091267405)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6840057870267405)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6840261033267405)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6840723555267406)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(14842572125305321)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6840908633267406)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6841331557267406)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(14845306996305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6841533691267406)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(14845306996305323)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6841675736267406)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6841923631267406)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6842059539267406)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6842277993267406)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(14843303628305322)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6842460634267406)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(14842572125305321)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6842700182267407)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6842896888267407)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6838012936267404)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6843257192267407)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6843471407267407)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6843730956267407)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6843934423267407)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6844318451267407)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(14844980470305322)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6844473032267407)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(14844980470305322)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6844905075267408)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6845105137267408)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6845248596267408)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6845528491267408)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6845663902267408)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6846038509267408)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(14847727799305324)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6846304346267408)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6846492011267409)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6846711093267409)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6846932937267409)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6844546976267407)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6847268561267409)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6847003968267409)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6847473214267409)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6847003968267409)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6847644960267409)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6847003968267409)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6847890258267409)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6847003968267409)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6848330407267409)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6847975075267409)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6848923922267410)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6849245197267410)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(14845306996305323)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6849442544267410)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(14846958675305323)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6849715877267410)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(14845306996305323)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6849929376267411)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(14847727799305324)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6850042431267411)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6850254949267411)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(14848159039305324)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6850454161267411)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(6848962014267410)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(14847727799305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6850859615267411)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6850610093267411)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6851058894267411)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6850610093267411)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6851289330267411)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6850610093267411)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6851438296267411)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(6850610093267411)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6852125892267412)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(14847307418305324)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6852282201267412)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(14847307418305324)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6852646231267412)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(14844518320305322)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6852921985267412)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(14844518320305322)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6853076569267412)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(14844518320305322)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6853641490267413)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6853224737267412)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(14846504034305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6853898844267413)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6853224737267412)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(14846504034305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6854096906267413)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(6853224737267412)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(14846504034305323)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6854261840267413)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6853224737267412)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6855714841267414)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(14835326890305318)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(6855926023267414)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(14835326890305318)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13177406323107845)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_api.id(14848932351305324)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13178103211107846)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_api.id(14848590679305324)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13178800352107846)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_api.id(14848590679305324)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13179577052107846)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(6761688085267365)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_api.id(14848590679305324)
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13194919998107864)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13195682955107865)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_api.id(14853376147305326)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13196383662107865)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_api.id(14853376147305326)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13197074075107866)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_api.id(14853376147305326)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13197712841107866)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_api.id(14853376147305326)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13198470758107866)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(5988422738475876)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_api.id(14853376147305326)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13236267600107916)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(6802357267267386)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_api.id(14859388165305329)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13236970663107916)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(6802357267267386)
,p_css_classes=>'t-Login-region--headerTitle'
,p_group_id=>wwv_flow_api.id(14859388165305329)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13237697792107917)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(6802357267267386)
,p_css_classes=>'t-Login-region--headerHidden'
,p_group_id=>wwv_flow_api.id(14859388165305329)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13331204521108041)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6847003968267409)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13333468328108046)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6847975075267409)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13334740480108050)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848359906267410)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13336089131108054)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_api.id(14843761936305322)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13336751611108055)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon (Default)'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(6848614889267410)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_api.id(14843761936305322)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13345290596108067)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(6850610093267411)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13402677239108160)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_api.id(14866143281305332)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13403080451108160)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_api.id(14867318247305332)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13403444884108160)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_api.id(14866590110305332)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13403857637108160)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_api.id(14865777579305331)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13404281728108160)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_api.id(14866968775305332)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13404637600108161)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_api.id(14865317554305331)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13405071333108161)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_api.id(14868189338305332)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(13405459345108161)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(13402107649108157)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_api.id(14871717519305334)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14893185438305348)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(14838940783305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14893869126305348)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(14859751317305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14894551094305349)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(14838940783305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14895228598305349)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(14859751317305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14895964651305349)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(14838940783305320)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14896692035305350)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(14859751317305329)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14897396362305350)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(14838940783305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14898066048305350)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(14859751317305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14898727820305351)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(14840180696305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14899417682305351)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(14860148634305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14900147609305352)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(14840180696305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14900854911305352)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(14860148634305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14901553139305352)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(14840180696305320)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14902235923305353)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(14860148634305329)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14902970492305353)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(14840180696305320)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14903603098305353)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(14860148634305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14904323103305354)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(14841394533305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14905087156305354)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(14860551109305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14905756918305354)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(14841394533305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14906401862305355)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(14860551109305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14907196900305355)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(14841394533305321)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14907827264305355)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(14860551109305329)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14908562046305356)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(14841394533305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14909286986305356)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(14860551109305329)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14909903320305357)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(14842150947305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14910647113305357)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(14861349924305330)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14911321661305357)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(14842150947305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14912085182305358)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(14861349924305330)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14912756458305358)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(14842150947305321)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14913481251305358)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(14861349924305330)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14914104600305359)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(14842150947305321)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14914899154305359)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(14861349924305330)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14915536177305359)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(14838120281305320)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14916201070305360)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(14836123147305319)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14916973536305360)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(14836542837305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14917678177305361)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(14836977881305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14918339227305361)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(14837321953305319)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14919040898305361)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(14835715290305318)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14919716557305362)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(14837798551305319)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14920425217305362)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(14837798551305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14921144600305363)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(14836123147305319)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14921854002305363)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(14836542837305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14922569374305363)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(14836977881305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14923201952305364)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(14837321953305319)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14923940572305364)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(14834535132305318)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14924618027305364)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(14834535132305318)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14925319481305365)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(14834535132305318)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14926060363305365)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(14838120281305320)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14926747266305365)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(14837798551305319)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14927428630305366)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(14835715290305318)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14928147318305366)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(14838541067305320)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14928874430305366)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(14838120281305320)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14929577409305367)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(14835715290305318)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14930247566305367)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(14838120281305320)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14930971283305368)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(14858553952305328)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14931651865305368)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(14857327121305328)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14932339228305368)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(14858115998305328)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14933012379305369)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(14856967337305328)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14933773389305369)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(14856967337305328)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14934402190305369)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(14857787114305328)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14935102278305370)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(14857327121305328)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14935851276305370)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(14841714303305321)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14936599567305370)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(14839352942305320)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14937232575305371)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(14839791161305320)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14937967467305372)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(14840901921305321)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14938324366305372)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14939027442305372)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(14841714303305321)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(14939757328305373)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(14870163460305333)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(6905258727754156)
,p_build_option_name=>'BLOG_FEATURE_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide link lists page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(7073708623458378)
,p_build_option_name=>'BLOG_FEATURE_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow commenting to posts'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(7122597691878829)
,p_build_option_name=>'Development not Ready'
,p_build_option_status=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(7226943678055745)
,p_build_option_name=>'BLOG_FEATURE_TAGS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide post tags'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8635198962090938)
,p_build_option_name=>'BLOG_FEATURE_RSS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide "Subscribe in a Reader" link and page header link tag'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8635355820099640)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide categories list'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8667733481689180)
,p_build_option_name=>'BLOG_FEATURE_SEARCH'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow search from posts'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8670890848739263)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide posts archives by year and month'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8677319562925389)
,p_build_option_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide latest posts list'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8678091133941547)
,p_build_option_name=>'BLOG_FEATURE_RIGHT_COLUMN'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide global page right column'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(24626889314854172)
,p_build_option_name=>'BLOG_FEATURE_FILES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/Hide files repository page'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24587047129774526)
,p_name=>'BLOG_CATEGORY_TXT'
,p_message_text=>'Category'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7036756648298659)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24586810319770154)
,p_name=>'BLOG_POSTED_BY_TXT'
,p_message_text=>'Posted by'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24586617313766281)
,p_name=>'BLOG_POSTED_ON_TXT'
,p_message_text=>'Posted on'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24586418712760715)
,p_name=>'BLOG_READ_MORE_TXT'
,p_message_text=>'Continue Reading'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7042120500196275)
,p_name=>'BLOG_RSS_TITLE'
,p_message_text=>'%0 &raquo; Feed'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24587228624778564)
,p_name=>'BLOG_TAGS_TXT'
,p_message_text=>'Tags'
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17102853959421145)
,p_language=>'en'
,p_from=>'Continue Reading'
,p_to=>'Continue Reading'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17102981920423336)
,p_language=>'en'
,p_from=>'Posted on'
,p_to=>'Posted on'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103073087426272)
,p_language=>'en'
,p_from=>'Posted by'
,p_to=>'Posted by'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103155724428190)
,p_language=>'en'
,p_from=>'Category'
,p_to=>'Category'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103299434430048)
,p_language=>'en'
,p_from=>'Tags'
,p_to=>'Tags'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103379457464978)
,p_language=>'en'
,p_from=>'Code'
,p_to=>'Code'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103414928466706)
,p_language=>'en'
,p_from=>'Italics'
,p_to=>'Italics'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103582927466714)
,p_language=>'en'
,p_from=>'Bold'
,p_to=>'Bold'
);
wwv_flow_api.create_dynamic_translation(
 p_id=>wwv_flow_api.id(17103740696472072)
,p_language=>'en'
,p_from=>'Underline'
,p_to=>'Underline'
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_rss_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(4293491733566665)
,p_shortcut_name=>'BLOG_RSS_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_link(',
'  p_app_name => :G_APP_NAME',
'  ,p_status => apex_util.get_build_option_status(',
'    p_application_id     => :APP_ID',
'    ,p_build_option_name => ''BLOG_FEATURE_RSS''',
'  )',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_search_button
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(6910189651535992)
,p_shortcut_name=>'BLOG_SEARCH_BUTTON'
,p_shortcut_type=>'FUNCTION_BODY'
,p_build_option=>wwv_flow_api.id(8667733481689180)
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_search_button(',
'  p_request => ''#CURRENT_ITEM_NAME#''',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_robots_noindex_meta
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7037777593887739)
,p_shortcut_name=>'BLOG_ROBOTS_NOINDEX_META'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'return #OWNER#.blog_html.get_robots_noindex_meta;'
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_rss_anchor
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(7038895780985689)
,p_shortcut_name=>'BLOG_RSS_ANCHOR'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_rss_anchor(',
'  p_app_name => :G_APP_NAME',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_home_description_meta
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14606629384151086)
,p_shortcut_name=>'BLOG_HOME_DESCRIPTION_META'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_description_meta(',
'  p_desc => :G_APP_DESC',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_post_description_meta
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14609528802278469)
,p_shortcut_name=>'BLOG_POST_DESCRIPTION_META'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_post_description_meta(',
'  p_post_id => :P2_POST_ID',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_post_canonical_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14610353218419017)
,p_shortcut_name=>'BLOG_POST_CANONICAL_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_post_canonical_link(',
'  p_post_id => :P2_POST_ID',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_category_canonical_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14613389629557078)
,p_shortcut_name=>'BLOG_CATEGORY_CANONICAL_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_category_canonical_link(',
'  p_category_id => :P4_CATEGORY_ID',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_tag_canonical_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14614320549586252)
,p_shortcut_name=>'BLOG_TAG_CANONICAL_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_tag_canonical_link(',
'  p_tag_id => :P6_TAG_ID',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_archive_canonical_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(14616166855626773)
,p_shortcut_name=>'BLOG_ARCHIVE_CANONICAL_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_archive_canonical_link(',
'  p_year_month => :P5_YEAR_MONTH',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/blog_tab_canonical_link
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(20324623827351948)
,p_shortcut_name=>'BLOG_TAB_CANONICAL_LINK'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return #OWNER#.blog_html.get_tab_canonical_link(',
'  p_app_page_id => :APP_PAGE_ALIAS',
'--  ,p_app_id => :APP_ALIAS',
');'))
);
end;
/
prompt --application/shared_components/security/authentications/blog_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(6755941601267361)
,p_name=>'Blog Authentication'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_05=>'N'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&G_ADMIN_APP_ID.:LOGIN_DESKTOP:&SESSION.::&DEBUG.:::'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/security/authentications/no_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(23563845949734140)
,p_name=>'No Authentication'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/plugins/item_type/fi_jaris_comment_textarea
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(30930964977416348)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'FI.JARIS.COMMENT_TEXTAREA'
,p_display_name=>'Comment Text'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','FI.JARIS.COMMENT_TEXTAREA'),'')
,p_api_version=>2
,p_render_function=>'#OWNER#.blog_plugin.render_comment_textarea'
,p_validation_function=>'#OWNER#.blog_plugin.validate_comment_textarea'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30931306969449292)
,p_plugin_id=>wwv_flow_api.id(30930964977416348)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Comment Length Validation Error'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Comment is too long.'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30933068285516469)
,p_plugin_id=>wwv_flow_api.id(30930964977416348)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Comment Content Validation Error'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Comment is not valid. Please check e.g. allowed HTML tags are entered properly.'
,p_is_translatable=>true
);
end;
/
prompt --application/shared_components/plugins/item_type/fi_jaris_formatting_buttons
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(37270807671295103)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'FI.JARIS.FORMATTING_BUTTONS'
,p_display_name=>'Formatting Buttons'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','FI.JARIS.FORMATTING_BUTTONS'),'')
,p_api_version=>2
,p_render_function=>'#OWNER#.blog_plugin.render_formatting_buttons'
,p_standard_attributes=>'VISIBLE:READONLY:ELEMENT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(37271167020302105)
,p_plugin_id=>wwv_flow_api.id(37270807671295103)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Page Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/shared_components/plugins/item_type/fi_jaris_math_question_field
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(68115044491002031)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'FI.JARIS.MATH_QUESTION_FIELD'
,p_display_name=>'Math Question Field'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','FI.JARIS.MATH_QUESTION_FIELD'),'')
,p_api_version=>2
,p_render_function=>'#OWNER#.blog_plugin.render_math_question_field'
,p_ajax_function=>'#OWNER#.blog_plugin.ajax_math_question_field'
,p_validation_function=>'#OWNER#.blog_plugin.validate_math_question_field'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ELEMENT:WIDTH:PLACEHOLDER:ICON'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(61849465817064829)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Validation Error Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Question answer isn''t correct.'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14501292973487759)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(68115749255002032)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(68116207240002032)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(68116582706002032)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(68116999025002033)
,p_plugin_id=>wwv_flow_api.id(68115044491002031)
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
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(6877050287267426)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:HOME:&SESSION.::&DEBUG.:RP'
,p_login_url=>'f?p=&G_ADMIN_APP_ID.:LOGIN_DESKTOP:&SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(6756817335267362)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_api.id(6851626345267411)
,p_nav_list_template_options=>'#DEFAULT#:t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_javascript_file_urls=>'#APP_IMAGES#blog.js?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(6876779235267426)
,p_nav_bar_list_template_id=>wwv_flow_api.id(6848359906267410)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8700188054171688)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408115621'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6433141607894071)
,p_plug_name=>'Not Rendered Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Region to hold items that shouldn''t rendered on page'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6433383599894073)
,p_plug_name=>'Global Right Column'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-none'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>9999
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>10
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'to_number(:APP_PAGE_ID) < 1000'
,p_required_patch=>wwv_flow_api.id(8678091133941547)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Application right side column holding e.g. search, archives, categories list and latest posts list'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6433488213894074)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_api.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(8667733481689180)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6433709308894076)
,p_plug_name=>'Archives'
,p_parent_plug_id=>wwv_flow_api.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody:t-Form--noPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(8670890848739263)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6913532952677128)
,p_plug_name=>'Categories'
,p_region_name=>'CATEGORIES_LIST'
,p_parent_plug_id=>wwv_flow_api.id(6433383599894073)
,p_region_css_classes=>'z-link-list--no-border'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>80
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(6941496811819617)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(8635355820099640)
,p_plug_comment=>'Categories link list'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6913618929677129)
,p_plug_name=>'Latest Posts'
,p_region_name=>'LATEST_POSTS_LIST'
,p_parent_plug_id=>wwv_flow_api.id(6433383599894073)
,p_region_css_classes=>'z-link-list--no-border'
,p_region_sub_css_classes=>'z-link-list--no-border'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>90
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(6945203882938984)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(6842938924267407)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(8677319562925389)
,p_plug_comment=>'Latest post link list'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6915495261677148)
,p_plug_name=>'Subscribe in a Reader'
,p_parent_plug_id=>wwv_flow_api.id(6433383599894073)
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>100
,p_plug_display_point=>'BODY'
,p_plug_source=>'"BLOG_RSS_ANCHOR"'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(8635198962090938)
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_plug_comment=>'Holds "Subscribe in a Reader" button shortcut'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6433577571894075)
,p_name=>'P0_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6433488213894074)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Search'
,p_post_element_text=>'"BLOG_SEARCH_BUTTON"'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(6854381477267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6913364163677127)
,p_name=>'P0_ARCHIVES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6433709308894076)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archives'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_url.get_archive(',
'   p_year_month      => :P5_YEAR_MONTH',
'  ,p_current_page_id => :APP_PAGE_ALIAS',
')'))
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BLOG_ARCHIVE_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   #OWNER#.blog_util.get_year_month(',
'      p_archive_date => lov.archive_date',
'     ,p_date_format => :G_ARCHIVE_DATE_FORMAT',
'     ,p_posts_count  => lov.posts_count',
'   ) as display_value',
'  ,#OWNER#.blog_url.get_archive(',
'      p_year_month => lov.year_month',
'   ) as return_value',
'from #OWNER#.blog_v_archive_lov lov',
'order by lov.archive_date desc',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select Month -'
,p_lov_null_value=>'f?p=&APP_ID.:HOME:&APP_SESSION_VISIBLE.::&DEBUG.:::'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(6854381477267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'I'
,p_attribute_01=>'REDIRECT_URL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7052827756664737)
,p_name=>'Scroll Top'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#page-content-container,#comments'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7053194281664738)
,p_event_id=>wwv_flow_api.id(7052827756664737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'html,body'
,p_attribute_01=>'apex.theme42.util.scrollTo( this.triggeringElement.id == "comments" ? this.triggeringElement.id : "wwvFlowForm" );'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'&G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"BLOG_HOME_DESCRIPTION_META"',
'"BLOG_TAB_CANONICAL_LINK"',
'"BLOG_RSS_LINK"',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044119'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6432040642894060)
,p_name=>'Posts'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6781539027267375)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.post_id',
'  ,v1.category_id',
'  ,v1.post_title',
'  ,v1.category_title',
'  ,v1.published_on',
'  ,v1.first_paragraph as body_html',
'  ,v1.read_more_txt',
'  ,v1.category_txt',
'  ,null as tags_html',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'order by v1.published_on desc',
'',
''))
,p_translate_title=>'N'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6894976353301648)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_item=>'P1_REPORT_ROWS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3760890514646112)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7081708628178431)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3760957181646113)
,p_query_column_id=>3
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>4
,p_column_heading=>'Post Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:POST:&SESSION.::&DEBUG.:RP:P2_POST_ID:#POST_ID#'
,p_column_linktext=>'#POST_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3761060172646114)
,p_query_column_id=>4
,p_column_alias=>'CATEGORY_TITLE'
,p_column_display_sequence=>5
,p_column_heading=>'Category Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.:RP:P4_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27993285417607138)
,p_query_column_id=>5
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>3
,p_column_heading=>'Published On'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_POST_TITLE_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27990833555607114)
,p_query_column_id=>6
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4029920883368817)
,p_query_column_id=>7
,p_column_alias=>'READ_MORE_TXT'
,p_column_display_sequence=>9
,p_column_heading=>'Read More Txt'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:POST:&SESSION.::&DEBUG.:RP:P2_POST_ID:#POST_ID#'
,p_column_linktext=>'#READ_MORE_TXT#<span class="t-Icon fa fa-arrow-right" aria-hidden="true"></span>'
,p_column_link_attr=>'class="t-Button t-Button--icon t-Button--small t-Button--iconRight"'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6432472782894064)
,p_query_column_id=>8
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20710906917895803)
,p_query_column_id=>9
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24468458324361504)
,p_name=>'P1_REPORT_ROWS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6432040642894060)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Report rows to display per report page'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Post and Comments'
,p_alias=>'POST'
,p_step_title=>'&P2_POST_TITLE. | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'"BLOG_POST_DESCRIPTION_META"',
'"BLOG_POST_CANONICAL_LINK"'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044317'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7082403673178438)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6781539027267375)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>9
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6915627356677149)
,p_name=>'Comments'
,p_region_name=>'comments'
,p_parent_plug_id=>wwv_flow_api.id(7082403673178438)
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_icon_css_classes=>'fa-comments-o'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--basic:t-Comments--iconsRounded:t-Report--hideNoPagination'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with q1 as (',
'  select ',
'    ceil(row_number() over(order by v1.created_on desc) / :P2_REPORT_ROWS) as rn',
'    ,v1.created_on',
'    ,v1.comment_by',
'    ,v1.comment_body',
'    ,v1.user_icon',
'    ,v1.icon_modifier',
'  from blog_v_comments v1',
'  where 1 = 1',
'    and v1.post_id = :P2_POST_ID',
')',
'select',
'   null as actions',
'  ,q1.comment_by    as user_name',
'  ,q1.comment_body  as comment_text',
'  ,q1.created_on    as comment_date',
'  ,q1.user_icon     as user_icon',
'  --,null as user_icon',
'  ,q1.icon_modifier as icon_modifier',
'  --,''u-color-14'' as icon_modifier',
'  ',
'  ,''z-comment'' as comment_modifiers',
'',
'  ,null as attribute_1',
'  ,null as attribute_2',
'  ,null as attribute_3',
'  ,null as attribute_4',
'',
'from q1',
'where 1 = 1',
'order by q1.rn',
''))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6828031165267399)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No comments yet on this post.'
,p_query_num_rows_item=>'P2_REPORT_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_api.id(7073708623458378)
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6916242911677156)
,p_query_column_id=>1
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6915852055677152)
,p_query_column_id=>2
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6916022898677153)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6916106323677154)
,p_query_column_id=>4
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>4
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6916229562677155)
,p_query_column_id=>5
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6915825737677151)
,p_query_column_id=>6
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6915679470677150)
,p_query_column_id=>7
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030291393368820)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030345827368821)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030407450368822)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030571277368823)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9653988616337837)
,p_name=>'Post'
,p_parent_plug_id=>wwv_flow_api.id(7082403673178438)
,p_template=>wwv_flow_api.id(6781539027267375)
,p_display_sequence=>10
,p_region_css_classes=>'z-post--single'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.post_id',
'  ,v1.category_id',
'  ,v1.published_on',
'  ,v1.post_title',
'  ,v1.category_title',
'  ,v1.body_html',
'  ,v1.category_txt',
'  ,null as read_more_txt',
'  ,#OWNER#.blog_html.get_post_tags(',
'    p_post_id => v1.post_id',
'    ,p_status => :G_SHOW_TAGS_STATUS',
'  ) as tags_html',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'and v1.post_id = :P2_POST_ID',
''))
,p_translate_title=>'N'
,p_query_row_template=>wwv_flow_api.id(6894976353301648)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_row_count_max=>1
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>'Report to display only one post'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3762522324646129)
,p_query_column_id=>1
,p_column_alias=>'POST_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7081847339178433)
,p_query_column_id=>2
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27993118245607137)
,p_query_column_id=>3
,p_column_alias=>'PUBLISHED_ON'
,p_column_display_sequence=>3
,p_column_heading=>'Published On'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_POST_TITLE_DATE_FORMAT.'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3762641236646130)
,p_query_column_id=>4
,p_column_alias=>'POST_TITLE'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3762796274646131)
,p_query_column_id=>5
,p_column_alias=>'CATEGORY_TITLE'
,p_column_display_sequence=>5
,p_column_heading=>'Category Title'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.:RP:P4_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#CATEGORY_TITLE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27990621426607112)
,p_query_column_id=>6
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6974337263420210)
,p_query_column_id=>7
,p_column_alias=>'CATEGORY_TXT'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20710843102895802)
,p_query_column_id=>8
,p_column_alias=>'READ_MORE_TXT'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27990703148607113)
,p_query_column_id=>9
,p_column_alias=>'TAGS_HTML'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3764423093646148)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6915627356677149)
,p_button_name=>'REPLY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_button_image_alt=>'Leave Reply'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1001:&SESSION.::&DEBUG.:1001:P1001_POST_ID:&P2_POST_ID.'
,p_icon_css_classes=>'fa fa-comment-o'
,p_required_patch=>wwv_flow_api.id(7073708623458378)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6913773263677131)
,p_name=>'P2_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9653988616337837)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Post ID to filter report'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6914099568677134)
,p_name=>'P2_POST_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24468562639361505)
,p_name=>'P2_REPORT_ROWS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6915627356677149)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Comment report rows to display per report page'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6914206729677135)
,p_computation_sequence=>10
,p_computation_item=>'P2_POST_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_post_title(',
'  p_post_id => :P2_POST_ID',
')'))
,p_computation_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Fetch post title to item. Item is used in page title.',
''))
,p_computation_error_message=>'Post not found.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6917083915677164)
,p_name=>'Format Code'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(6915627356677149)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6917183161677165)
,p_event_id=>wwv_flow_api.id(6917083915677164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'blog.UI.formatProgramCode($(this.triggeringElement).find("pre.z-program-code"))'
,p_da_action_comment=>'Format comments program code when paginated.'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Search Result'
,p_alias=>'SEARCH'
,p_step_title=>'Search Result | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>'"BLOG_ROBOTS_NOINDEX_META"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(8667733481689180)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044028'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6979825819516521)
,p_name=>'Search Result'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.category_id',
'  ,#OWNER#.blog_url.get_post(',
'     p_post_id => v1.post_id',
'   )                  as search_link',
'  ,v1.post_title      as search_title',
'  ,v1.post_desc       as search_desc',
'  ,v1.category_txt    as label_01',
'  ,v1.category_title  as value_01',
'  ,v1.posted_by_txt   as label_02',
'  ,v1.blogger_name    as value_02',
'  ,v1.posted_on_txt   as label_03',
'  ,v1.published_on    as value_03',
'  ,case when :G_SHOW_TAGS_STATUS = ''INCLUDE''',
'  then v1.tags_txt        ',
'  end as label_04',
'  ,#OWNER#.blog_html.get_post_tags(',
'    p_post_id => v1.post_id',
'    ,p_status => :G_SHOW_TAGS_STATUS',
'    ,p_button => ''NO''',
'   )                  as value_04',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'  and :P0_SEARCH is not null',
'  and ( contains( v1.body_html, ''{'' || :P0_SEARCH || ''}'', 1 ) > 0',
'       or instr( upper( v1.post_title ), upper( :P0_SEARCH ) ) > 0 )',
'order by score(1) desc',
'  ,v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6833829938267402)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Search didn''t result any rows.'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show search result'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6983768251516526)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6980149592516524)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6980571876516524)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6980967513516524)
,p_query_column_id=>4
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6981384371516525)
,p_query_column_id=>5
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6981783399516525)
,p_query_column_id=>6
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.:RP:P4_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#VALUE_01#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6982176508516525)
,p_query_column_id=>7
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>7
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6982558583516526)
,p_query_column_id=>8
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>8
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6982969774516526)
,p_query_column_id=>9
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>9
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6983432212516526)
,p_query_column_id=>10
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>10
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3879354480180110)
,p_query_column_id=>11
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>11
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3879437608180111)
,p_query_column_id=>12
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>12
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Posts in Category'
,p_alias=>'CATEGORY'
,p_step_title=>'Category &P4_CATEGORY_NAME. | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>'"BLOG_CATEGORY_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(8635355820099640)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044341'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(10221605832319899)
,p_name=>'Category &P4_CATEGORY_NAME.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  #OWNER#.blog_url.get_post(',
'     p_post_id => v1.post_id',
'  )                 as search_link',
'  ,v1.post_title    as search_title',
'  ,v1.post_desc     as search_desc',
'  ,v1.posted_by_txt as label_01',
'  ,v1.blogger_name  as value_01',
'  ,v1.posted_on_txt as label_02',
'  ,v1.published_on  as value_02',
'  ,case when :G_SHOW_TAGS_STATUS = ''INCLUDE''',
'  then v1.tags_txt        ',
'  end as label_03',
'  ,#OWNER#.blog_html.get_post_tags(',
'    p_post_id => v1.post_id',
'    ,p_status => :G_SHOW_TAGS_STATUS',
'    ,p_button => ''NO''',
'   )                as value_03',
'  ,null             as label_04',
'  ,null             as value_04',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'  and v1.category_id = :P4_CATEGORY_ID',
'order by v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6833829938267402)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show posts in category'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6993252466779807)
,p_query_column_id=>1
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>1
,p_column_heading=>'Search Link'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6993681586779807)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Search Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6994049340779807)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Search Desc'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6994523142779808)
,p_query_column_id=>4
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>4
,p_column_heading=>'Label 01'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6994918413779808)
,p_query_column_id=>5
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>5
,p_column_heading=>'Value 01'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6995304878779808)
,p_query_column_id=>6
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>6
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6995691606779809)
,p_query_column_id=>7
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>7
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3878676165180103)
,p_query_column_id=>8
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>8
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3878883700180105)
,p_query_column_id=>9
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>9
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992199956607127)
,p_query_column_id=>10
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>10
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992200341607128)
,p_query_column_id=>11
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>11
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6913868774677132)
,p_name=>'P4_CATEGORY_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10221605832319899)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
,p_item_comment=>'Category ID to filter report'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6913969264677133)
,p_name=>'P4_CATEGORY_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Item to hold category name for page title and region title'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6914334001677136)
,p_computation_sequence=>10
,p_computation_item=>'P4_CATEGORY_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_category_title(',
'  p_category_id => :P4_CATEGORY_ID',
')'))
,p_computation_comment=>'Fetch category name to item. Item is used in page and region title.'
,p_computation_error_message=>'Category not found.'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Archive by Year and Month'
,p_alias=>'ARCHIVE'
,p_step_title=>'Archive &P5_YEAR_MONTH_TITLE. | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>'"BLOG_ARCHIVE_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(8670890848739263)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044410'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(10238910547824257)
,p_name=>'Archive &P5_YEAR_MONTH_TITLE.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.category_id',
'  ,#OWNER#.blog_url.get_post(',
'     p_post_id => v1.post_id',
'   )                  as search_link',
'  ,v1.post_title      as search_title',
'  ,v1.post_desc       as search_desc',
'  ,v1.category_txt    as label_01',
'  ,v1.category_title  as value_01',
'  ,v1.posted_by_txt   as label_02',
'  ,v1.blogger_name    as value_02',
'  ,v1.posted_on_txt   as label_03',
'  ,v1.published_on    as value_03',
'  ,case when :G_SHOW_TAGS_STATUS = ''INCLUDE''',
'  then v1.tags_txt        ',
'  end as label_04',
'  ,#OWNER#.blog_html.get_post_tags(',
'    p_post_id => v1.post_id',
'    ,p_status => :G_SHOW_TAGS_STATUS',
'    ,p_button => ''NO''',
'   )                  as value_04',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'  and v1.year_month = :P5_YEAR_MONTH',
'order by v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6833829938267402)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show search result'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7014193647284167)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7010553895284164)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7011019478284164)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7011394825284165)
,p_query_column_id=>4
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7011756480284165)
,p_query_column_id=>5
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7012162541284165)
,p_query_column_id=>6
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.:RP:P4_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#VALUE_01#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7012606071284166)
,p_query_column_id=>7
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>7
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7012982817284166)
,p_query_column_id=>8
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>8
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7013357087284166)
,p_query_column_id=>9
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>9
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7013760451284167)
,p_query_column_id=>10
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>10
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3878907437180106)
,p_query_column_id=>11
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>11
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3879007531180107)
,p_query_column_id=>12
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>12
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6914654782677140)
,p_name=>'P5_YEAR_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10238910547824257)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6914826459677141)
,p_name=>'P5_YEAR_MONTH_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6916871240677162)
,p_computation_sequence=>10
,p_computation_item=>'P5_YEAR_MONTH_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_year_month(',
'  p_year_month  => :P5_YEAR_MONTH',
'  ,p_date_format => :G_ARCHIVE_DATE_FORMAT',
')'))
,p_computation_comment=>'Fetch archive title to item. Item is used in page and region title.'
,p_computation_error_message=>'Archive year and month not found.'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Post Under Tag'
,p_alias=>'TAG'
,p_step_title=>'Tag &P6_TAG_NAME. | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>'"BLOG_TAG_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(7226943678055745)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044427'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(13706719753736206)
,p_name=>'Tag &P6_TAG_NAME.'
,p_region_name=>'page-content-container'
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.category_id',
'  ,#OWNER#.blog_url.get_post(',
'     p_post_id => v1.post_id',
'   )                  as search_link',
'  ,v1.post_title      as search_title',
'  ,v1.post_desc       as search_desc',
'  ,v1.category_txt    as label_01',
'  ,v1.category_title  as value_01',
'  ,v1.posted_by_txt   as label_02',
'  ,v1.blogger_name    as value_02',
'  ,v1.posted_on_txt   as label_03',
'  ,v1.published_on    as value_03',
'  ,v1.tags_txt        as label_04',
'  ,#OWNER#.blog_html.get_post_tags(',
'    p_post_id => v1.post_id',
'    ,p_button => ''NO''',
'   )                  as value_04',
'from #OWNER#.blog_v_posts v1',
'where 1 = 1',
'and exists(',
'  select 1',
'  from #OWNER#.blog_v_posts_tags x1',
'  where 1 = 1',
'  and x1.tag_id = :P6_TAG_ID',
'  and x1.post_id = v1.post_id',
')',
'order by v1.published_on desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6833829938267402)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_item=>'G_SEARCH_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
,p_comment=>'Report to show search result'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7222845776888393)
,p_query_column_id=>1
,p_column_alias=>'CATEGORY_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7219254223888389)
,p_query_column_id=>2
,p_column_alias=>'SEARCH_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Search Link'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7219675482888390)
,p_query_column_id=>3
,p_column_alias=>'SEARCH_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Search Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7220092242888391)
,p_query_column_id=>4
,p_column_alias=>'SEARCH_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Search Desc'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7220468558888391)
,p_query_column_id=>5
,p_column_alias=>'LABEL_01'
,p_column_display_sequence=>5
,p_column_heading=>'Label 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7220907870888391)
,p_query_column_id=>6
,p_column_alias=>'VALUE_01'
,p_column_display_sequence=>6
,p_column_heading=>'Value 01'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:CATEGORY:&SESSION.::&DEBUG.:RP:P4_CATEGORY_ID:#CATEGORY_ID#'
,p_column_linktext=>'#VALUE_01#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7221258840888391)
,p_query_column_id=>7
,p_column_alias=>'LABEL_02'
,p_column_display_sequence=>7
,p_column_heading=>'Label 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7221720169888392)
,p_query_column_id=>8
,p_column_alias=>'VALUE_02'
,p_column_display_sequence=>8
,p_column_heading=>'Value 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7222126977888392)
,p_query_column_id=>9
,p_column_alias=>'LABEL_03'
,p_column_display_sequence=>9
,p_column_heading=>'Label 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7222531249888393)
,p_query_column_id=>10
,p_column_alias=>'VALUE_03'
,p_column_display_sequence=>10
,p_column_heading=>'Value 03'
,p_use_as_row_header=>'N'
,p_column_format=>'&G_DATE_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030160255368819)
,p_query_column_id=>11
,p_column_alias=>'LABEL_04'
,p_column_display_sequence=>11
,p_column_heading=>'Label 04'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4030024550368818)
,p_query_column_id=>12
,p_column_alias=>'VALUE_04'
,p_column_display_sequence=>12
,p_column_heading=>'Value 04'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7082507483178439)
,p_name=>'P6_TAG_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6433141607894071)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7223310957888413)
,p_name=>'P6_TAG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13706719753736206)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(7082548468178440)
,p_computation_sequence=>10
,p_computation_item=>'P6_TAG_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.get_tag(',
'  p_tag_id => :P6_TAG_ID',
')'))
,p_computation_comment=>'Fetch tag name to item. Item is used in page and region title.'
,p_computation_error_message=>'Tag not found.'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Links'
,p_alias=>'LINKS'
,p_step_title=>'Links | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>'"BLOG_TAB_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(6905258727754156)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044454'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(6899425042645290)
,p_name=>'Links'
,p_template=>wwv_flow_api.id(6781372168267375)
,p_display_sequence=>20
,p_region_sub_css_classes=>'z-links'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack:t-MediaList--iconsRounded:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.group_title         as link_group',
'  ,v1.link_title              as list_title',
'  ,v1.link_desc               as list_text',
'  ,v1.link_url                as link',
'  ,''target="_blank"''          as link_attr',
'  ,null                       as list_badge',
'  ,''fa fa-external-link''      as icon_class',
'  ,''z-dummy''                  as link_class',
'  ,''z-links--item''            as list_class',
'  ,''z-dummy''                  as icon_color_class',
'from blog_v_links v1',
'where 1 = 1',
'order by v1.group_display_seq',
'  ,v1.display_seq'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(6815219261267393)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_break_cols=>'1'
,p_break_type_flag=>'REPEAT_HEADINGS_ON_BREAK_1'
,p_break_repeat_heading_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="z-links--header"><div>#COLUMN_VALUE#</div></li>',
''))
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3879733779180114)
,p_query_column_id=>1
,p_column_alias=>'LINK_GROUP'
,p_column_display_sequence=>1
,p_column_heading=>'Link Group'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932489553156637)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932717290156639)
,p_query_column_id=>3
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932917055156641)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933569048156648)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>10
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933440945156647)
,p_query_column_id=>6
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>9
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933378544156646)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>8
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6932948311156642)
,p_query_column_id=>8
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933094682156643)
,p_query_column_id=>9
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(6933158603156644)
,p_query_column_id=>10
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'File Repository'
,p_alias=>'FILES'
,p_step_title=>'Files | &G_APP_NAME.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>'"BLOG_TAB_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_api.id(24626889314854172)
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408175316'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4818601776821836)
,p_plug_name=>'File Repository'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6801762579267386)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select v1.file_id as id',
'  ,v1.file_name',
'  ,v1.file_size as download',
'  ,v1.file_size',
'  ,v1.file_desc',
'from blog_v_files v1',
'where 1 = 1',
'and v1.is_download = 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4818785344821836)
,p_name=>'File Repository'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'LAINFJAR'
,p_internal_uid=>4818785344821836
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4819113251821846)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4823679230826204)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>11
,p_column_identifier=>'L'
,p_column_label=>'File Name'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4823763992826205)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>21
,p_column_identifier=>'M'
,p_column_label=>'File'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_format_mask=>'DOWNLOAD:BLOG_FILES:BLOB_CONTENT:ID::MIME_TYPE:FILE_NAME:CHANGED_ON:FILE_CHARSET:attachment:Download (#FILE_SIZE#):'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4821980171821856)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>31
,p_column_identifier=>'H'
,p_column_label=>'File Size'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4822772966821856)
,p_db_column_name=>'FILE_DESC'
,p_display_order=>41
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4830757646858580)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'48308'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'FILE_NAME:DOWNLOAD:FILE_DESC:'
,p_sort_column_1=>'FILE_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'About'
,p_alias=>'ABOUT'
,p_step_title=>'About | &G_APP_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(20718112665951240)
,p_html_page_header=>'"BLOG_TAB_CANONICAL_LINK"'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408044522'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(259567972026408072)
,p_name=>'About blogger '
,p_template=>wwv_flow_api.id(6802870362267386)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_grid_column_span=>9
,p_display_column=>1
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t1.blogger_name as card_title',
'  ,t1.bio as card_text',
'  ,''z-author--card'' as card_modifiers',
'  ,null as card_link',
'  ,null as card_icon',
'  ,null as card_initials',
'  ,null as card_subtitle',
'  ,null as card_subtext',
'  ,null as card_color',
'from #OWNER#.blog_bloggers t1',
'where 1 = 1',
'--and (t1.id = :P12_BLOGGER or :P12_BLOGGER is null)',
'order by t1.display_seq'))
,p_translate_title=>'N'
,p_query_row_template=>wwv_flow_api.id(6829031688267400)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9631772783644108)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9632148930644109)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992483622607130)
,p_query_column_id=>3
,p_column_alias=>'CARD_MODIFIERS'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(20711111133895805)
,p_query_column_id=>4
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992737503607133)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992843489607134)
,p_query_column_id=>6
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992522299607131)
,p_query_column_id=>7
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(9633301420644109)
,p_query_column_id=>8
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(27992611634607132)
,p_query_column_id=>9
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9633792069644125)
,p_name=>'P12_BLOGGER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(259567972026408072)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_01001
begin
wwv_flow_api.create_page(
 p_id=>1001
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Leave Reply'
,p_alias=>'REPLY'
,p_page_mode=>'MODAL'
,p_step_title=>'Leave Reply'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8697986188142973)
,p_html_page_header=>'"BLOG_ROBOTS_NOINDEX_META"'
,p_step_template=>wwv_flow_api.id(6762463719267365)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_required_patch=>wwv_flow_api.id(7073708623458378)
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_deep_linking=>'N'
,p_rejoin_existing_sessions=>'N'
,p_read_only_when_type=>'ITEM_IS_NULL'
,p_read_only_when=>'P1001_POST_ID'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20200408184137'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27990916738607115)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder'
,p_plug_template=>wwv_flow_api.id(6782379920267375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(147769743184406827)
,p_plug_name=>'Leave Reply'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(6802870362267386)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6283058393551656)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27990916738607115)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6283414650551656)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(27990916738607115)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(6855239813267414)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(27991328110607119)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=&APP_ALIAS.:2:&SESSION.::&DEBUG.:&APP_PAGE_ID.:P2_POST_ID:&P1001_POST_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6283829025551657)
,p_name=>'P1001_POST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6284602764551658)
,p_name=>'P1001_FIRST_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>80
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6285517297551658)
,p_name=>'P1001_LAST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>80
,p_grid_column_css_classes=>'z-hidden'
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_item_comment=>'Field is not for human input. In html document field looks like where user should fill last name. But field purpose is prevent bots insert comments. Process checks this field must be empty. If not empty dialog is closed without submitting comment.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6286425900551659)
,p_name=>'P1001_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cMaxlength=>256
,p_field_template=>wwv_flow_api.id(6854643778267413)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_inline_help_text=>'Provide your email address if you wish receive followup notification when new reply is posted to this post. Your email address will not be published or shared.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'EMAIL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6289109968551661)
,p_name=>'P1001_COMMENT'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Comment'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_FI.JARIS.COMMENT_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_css_classes=>'padding-top-none'
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_inline_help_text=>'You can use &lt;b&gt;, &lt;i&gt;, &lt;u&gt; and &lt;code&gt; HTML tags. Example, wrap program code to &lt;code&gt; tags so it is easier to read.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6290415932551662)
,p_name=>'P1001_SIMPLE_QUESTION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Answer to Question is'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_FI.JARIS.MATH_QUESTION_FIELD'
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(6855004103267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_inline_help_text=>'Please answer this simple question before you submit comment.'
,p_attribute_01=>'1'
,p_attribute_02=>'12'
,p_attribute_03=>'68'
,p_attribute_04=>'12'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9278488801652938)
,p_name=>'P1001_FORMATTING_BUTTONS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(147769743184406827)
,p_prompt=>'Formatting Buttons'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_FI.JARIS.FORMATTING_BUTTONS'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(6854381477267413)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'P1001_COMMENT'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(6291772805551664)
,p_validation_name=>'P1001_FIRST_NAME max length'
,p_validation_sequence=>60
,p_validation=>'length(:P1001_FIRST_NAME) <= 80'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Please enter no more than 80 characters for #LABEL#.'
,p_associated_item=>wwv_flow_api.id(6284602764551658)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2754144221851926)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6283058393551656)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2754217615851927)
,p_event_id=>wwv_flow_api.id(2754144221851926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6353910365469102)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'P1001_LAST_NAME is not null'
,p_process_error_message=>'Unhandled exception occurred.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P1001_LAST_NAME'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
