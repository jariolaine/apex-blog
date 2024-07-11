prompt --application/shared_components/files/js_blog_min_js
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '76617220626C6F673D626C6F677C7C7B7D3B2866756E6374696F6E28652C74297B652866756E6374696F6E28297B617065782E7468656D6534322E7574696C2E636F6E666967415045584D736773287B6175746F4469736D6973733A21302C6475726174';
wwv_flow_imp.g_varchar2_table(2) := '696F6E3A3165347D297D292C742E7365617263683D66756E6374696F6E2874297B72657475726E20743D652E657874656E64287B6E6F5375626D6974506167653A2234222C726571756573743A22534541524348222C73686F77576169743A21307D2C74';
wwv_flow_imp.g_varchar2_table(3) := '292C282222213D3D742E656C656D656E742E76616C75652E7472696D28297C7C22456E74657222213D3D742E7375626D69744966456E7465722E6B657929262628742E63757272656E74506167653D3D3D742E6E6F5375626D6974506167653F742E7375';
wwv_flow_imp.g_varchar2_table(4) := '626D69744966456E7465722E6B65793A617065782E7375626D6974287B726571756573743A742E726571756573742C7375626D69744966456E7465723A742E7375626D69744966456E7465722C73686F77576169743A742E73686F77576169747D29297D';
wwv_flow_imp.g_varchar2_table(5) := '2C742E75693D7B7365744C69737443757272656E744974656D3A66756E6374696F6E2874297B743D652E657874656E64287B63757272656E74436C6173733A2269732D63757272656E74222C64617461417474724E616D653A226974656D2D6964227D2C';
wwv_flow_imp.g_varchar2_table(6) := '74292C742E6166666563746564456C656D656E74732E66696E6428226C6922292E66696C7465722866756E6374696F6E28297B76617220693D652874686973292E6368696C6472656E28226122292E6461746128742E64617461417474724E616D65292C';
wwv_flow_imp.g_varchar2_table(7) := '6E3D21313B72657475726E20692626286E3D24765F436865636B56616C7565416761696E737428742E706167654974656D2C6929292C6E7D292E616464436C61737328742E63757272656E74436C617373297D2C7365744469616C6F675469746C653A66';
wwv_flow_imp.g_varchar2_table(8) := '756E6374696F6E2865297B617065782E7574696C2E676574546F704170657828292E6A517565727928222E75692D6469616C6F672D636F6E74656E7422292E6469616C6F6728226F7074696F6E222C227469746C65222C65297D7D2C742E706C7567696E';
wwv_flow_imp.g_varchar2_table(9) := '3D7B6D6174685175657374696F6E4669656C643A7B6765745175657374696F6E3A66756E6374696F6E2874297B617065782E7365727665722E706C7567696E28742E616A61784964656E7469666965722C7B7D2C7B737563636573733A66756E6374696F';
wwv_flow_imp.g_varchar2_table(10) := '6E2869297B766172206E3D6528275B666F723D22272B742E6974656D49642B27225D27292C613D6E2E6368696C6472656E28292E64657461636828293B6E2E656D70747928292E68746D6C28692E6C6162656C292E617070656E642861297D7D297D7D7D';
wwv_flow_imp.g_varchar2_table(11) := '7D2928617065782E6A51756572792C626C6F67293B';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(20084379906800491)
,p_file_name=>'js/blog.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
