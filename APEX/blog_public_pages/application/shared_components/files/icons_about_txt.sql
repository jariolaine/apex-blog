prompt --application/shared_components/files/icons_about_txt
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
wwv_flow_imp.g_varchar2_table(1) := '546869732066617669636F6E207761732067656E657261746564207573696E672074686520666F6C6C6F77696E6720666F6E743A0A0A2D20466F6E74205469746C653A20506163696669636F0A2D20466F6E7420417574686F723A20436F707972696768';
wwv_flow_imp.g_varchar2_table(2) := '7420323031382054686520506163696669636F2050726F6A65637420417574686F7273202868747470733A2F2F6769746875622E636F6D2F676F6F676C65666F6E74732F506163696669636F290A2D20466F6E7420536F757263653A20687474703A2F2F';
wwv_flow_imp.g_varchar2_table(3) := '666F6E74732E677374617469632E636F6D2F732F706163696669636F2F7631372F46775A59372D516D79313475396C657A4A3936413473696A7046755F2E7474660A2D20466F6E74204C6963656E73653A2053494C204F70656E20466F6E74204C696365';
wwv_flow_imp.g_varchar2_table(4) := '6E73652C20312E312028687474703A2F2F736372697074732E73696C2E6F72672F4F464C290A';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(39219370462981354)
,p_file_name=>'icons/about.txt'
,p_mime_type=>'text/plain'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
