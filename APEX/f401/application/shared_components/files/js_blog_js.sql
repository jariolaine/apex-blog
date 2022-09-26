prompt --application/shared_components/files/js_blog_js
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
wwv_flow_imp.g_varchar2_table(1) := '202F2A2A0A202A20406E616D65737061636520626C6F670A202A2A2F0A2076617220626C6F67203D20626C6F67207C7C207B7D3B0A0A2866756E6374696F6E28242C20626C6F6729207B0A0A20202F2F206F6E20706167652072656164790A20202F2F20';
wwv_flow_imp.g_varchar2_table(2) := '68696465206175746F6D61746963616C6C792073756363657373206D6573736167650A2020242866756E6374696F6E2829207B0A20202020617065782E7468656D6534322E7574696C2E636F6E666967415045584D736773287B0A202020202020617574';
wwv_flow_imp.g_varchar2_table(3) := '6F4469736D6973733A20747275650A2020202020202F2F206475726174696F6E206973206F7074696F6E616C202844656661756C742069732033303030206D696C6C697365636F6E6473290A2020202020202C6475726174696F6E3A2031303030300A20';
wwv_flow_imp.g_varchar2_table(4) := '2020207D293B0A20207D293B0A0A20202F2A2A0A20202A20406D6F64756C6520626C6F672E55490A20202A2A2F0A2020626C6F672E5549203D207B0A0A202020202F2A2A0A202020202A204066756E6374696F6E207365744C69737443757272656E7449';
wwv_flow_imp.g_varchar2_table(5) := '74656D0A202020202A20406578616D706C6520626C6F672E55492E7365744C69737443757272656E744974656D287B206166666563746564456C656D656E74733A20746869732E6166666563746564456C656D656E74732C20706167654974656D3A2022';
wwv_flow_imp.g_varchar2_table(6) := '50585F4954454D22207D293B0A202020202A2A2F0A202020207365744C69737443757272656E744974656D3A2066756E6374696F6E286F7074696F6E73297B0A0A2020202020206F7074696F6E73203D20242E657874656E64287B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(7) := '63757272656E74436C6173733A202269732D63757272656E74222C0A202020202020202064617461417474724E616D653A2022626C6F672D636F6E74656E742D6964220A2020202020207D2C206F7074696F6E7320293B0A0A2020202020206F7074696F';
wwv_flow_imp.g_varchar2_table(8) := '6E732E6166666563746564456C656D656E74732E66696E642820226C692220292E66696C746572282066756E6374696F6E28297B0A0A2020202020202020766172206C4461746156616C7565203D20242874686973292E6368696C6472656E2820226122';
wwv_flow_imp.g_varchar2_table(9) := '20292E6461746128206F7074696F6E732E64617461417474724E616D6520292C0A202020202020202020202020726573756C74203D2066616C73650A20202020202020203B0A20202020202020200A2020202020202020696628206C4461746156616C75';
wwv_flow_imp.g_varchar2_table(10) := '6520297B0A20202020202020202020726573756C74203D2024765F436865636B56616C7565416761696E7374280A202020202020202020202020206F7074696F6E732E706167654974656D0A2020202020202020202020202C6C4461746156616C75650A';
wwv_flow_imp.g_varchar2_table(11) := '20202020202020202020293B0A20202020202020207D0A0A202020202020202072657475726E20726573756C743B0A0A2020202020207D292E616464436C61737328206F7074696F6E732E63757272656E74436C61737320293B0A0A202020207D0A0A20';
wwv_flow_imp.g_varchar2_table(12) := '207D3B0A0A7D2928617065782E6A51756572792C20626C6F67293B0A';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(42962234337403863)
,p_file_name=>'js/blog.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
