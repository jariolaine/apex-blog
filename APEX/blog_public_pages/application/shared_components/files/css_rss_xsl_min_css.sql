prompt --application/shared_components/files/css_rss_xsl_min_css
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '68746D6C7B666F6E742D73697A653A36322E35257D68746D6C7B666F6E742D66616D696C793A73616E732D73657269667D626F64797B666F6E742D66616D696C793A2D6170706C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C22';
wwv_flow_imp.g_varchar2_table(2) := '5365676F65205549222C526F626F746F2C4F787967656E2C5562756E74752C43616E746172656C6C2C22466972612053616E73222C2244726F69642053616E73222C2248656C766574696361204E657565222C73616E732D73657269663B666F6E742D73';
wwv_flow_imp.g_varchar2_table(3) := '697A653A312E3472656D3B6C696E652D6865696768743A3272656D3B6261636B67726F756E642D636F6C6F723A236664666466643B636F6C6F723A233234323432343B6D617267696E3A313670787D406D65646961286D696E2D77696474683A38303070';
wwv_flow_imp.g_varchar2_table(4) := '78297B626F64797B6D617267696E3A31367078206175746F3B6D61782D77696474683A37363070783B70616464696E673A3020313670787D7D617B636F6C6F723A233030366564303B746578742D6465636F726174696F6E3A6E6F6E657D2E7A2D727373';
wwv_flow_imp.g_varchar2_table(5) := '2D2D7469746C657B636F6C6F723A696E68657269743B666F6E742D73697A653A322E3472656D7D2E7A2D7273732D2D6465736372697074696F6E7B6D617267696E2D626F74746F6D3A333270787D2E7A2D7273732D2D706F73747B6D617267696E2D626F';
wwv_flow_imp.g_varchar2_table(6) := '74746F6D3A333270787D2E7A2D7273732D2D706F73744865616465727B666F6E742D7765696768743A6E6F726D616C3B6D617267696E2D626F74746F6D3A3870787D2E7A2D7273732D2D706F7374426F64797B6D617267696E2D746F703A307D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(19760172016137489)
,p_file_name=>'css/rss-xsl.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
