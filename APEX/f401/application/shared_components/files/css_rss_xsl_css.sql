prompt --application/shared_components/files/css_rss_xsl_css
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '68746D6C207B0A2020666F6E742D73697A653A2036322E35253B0A7D0A68746D6C207B0A2020666F6E742D66616D696C793A2073616E732D73657269663B0A7D0A626F6479207B0A2020666F6E742D66616D696C793A202D6170706C652D73797374656D';
wwv_flow_imp.g_varchar2_table(2) := '2C20426C696E6B4D616353797374656D466F6E742C20225365676F65205549222C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C2022466972612053616E73222C202244726F69642053616E73222C202248656C';
wwv_flow_imp.g_varchar2_table(3) := '766574696361204E657565222C2073616E732D73657269663B0A2020666F6E742D73697A653A20312E3472656D3B0A20206C696E652D6865696768743A203272656D3B0A20206261636B67726F756E642D636F6C6F723A20236664666466643B0A202063';
wwv_flow_imp.g_varchar2_table(4) := '6F6C6F723A20233234323432343B0A20206D617267696E3A20313670783B0A7D0A406D6564696120286D696E2D77696474683A20383030707829207B0A2020626F6479207B0A202020206D617267696E3A2031367078206175746F3B0A202020206D6178';
wwv_flow_imp.g_varchar2_table(5) := '2D77696474683A2037363070783B0A2020202070616464696E673A2030707820313670783B0A20207D0A7D0A61207B0A2020636F6C6F723A20233030366564303B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A7D0A2E7A2D7273732D';
wwv_flow_imp.g_varchar2_table(6) := '2D7469746C65207B0A2020636F6C6F723A20696E68657269743B0A2020666F6E742D73697A653A20322E3472656D3B0A7D0A2E7A2D7273732D2D6465736372697074696F6E207B0A20206D617267696E2D626F74746F6D3A20333270783B0A7D0A2E7A2D';
wwv_flow_imp.g_varchar2_table(7) := '7273732D2D706F7374207B0A20206D617267696E2D626F74746F6D3A20333270783B0A7D0A2E7A2D7273732D2D706F7374486561646572207B0A2020666F6E742D7765696768743A206E6F726D616C3B0A20206D617267696E2D626F74746F6D3A203870';
wwv_flow_imp.g_varchar2_table(8) := '783B0A7D0A2E7A2D7273732D2D706F7374426F6479207B0A20206D617267696E2D746F703A20303B0A7D0A';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(42961659162402615)
,p_file_name=>'css/rss-xsl.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
