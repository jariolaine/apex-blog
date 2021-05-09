prompt --application/shared_components/files/ico_favicon_16x16_png
begin
--   Manifest
--     APP STATIC FILES: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF610000026D49444154384F95534B681351143D2F936426FF94C4622BB4163F88460312B4B5745B5BE84AC40FA828BA11A58A50116A172A4570A3B8B5D4A0157413B582D4';
wwv_flow_api.g_varchar2_table(2) := '5FAC56C482AD22FD506BB4145D5830094993CE4C3EE39D699B641A379ECD30EFDE77EEBDE79DCB6A6FC5BA00A59331F0F80F280A248075B3DA9E98C8A0142ED738189AD698B0CD6B448DD300A79969B43151C164348BC7910CC6FEE4B433054C626B7BA2';
wwv_flow_api.g_varchar2_table(3) := '8AFA53BFDA88B3DB05ECA02FA3765424E53CE665803702153CD3CE152A7D6354C4CDCFA296A311042A393C68734026E2A73F640CCCC81899CB214A5597E111184EF9051CF3091A494B2881AFF1FC22411DB5BA6FA319C1090902C770DCC7E3E3EF2CFABF';
wwv_flow_api.g_varchar2_table(4) := '67CA54193EE842A5D580F6D7F37842F1C208CB99971A2C38B25940EF98882BC30B3A022F7531B4DF059E03DA1E2530115DEAA034EBF91E073654187174208937BFB25AC84A1AA8C276042C58E7A671A7445C78B748AEEBC06506460FB9495DC07F37AE09';
wwv_flow_api.g_varchar2_table(5) := '7BADC906375556659D8EE7101C97707F4AD672CA081AAB8DE86B75603A9645732889862AEA640B0F3F3DE92A2B437836838EA134E252515C5D07AA7817775AD11F917066305D98CC6400EEB4D8515F6542DFA488AEF7456D7404571BAD38B089C7F59134';
wwv_flow_api.g_varchar2_table(6) := 'BD3319AD04E703024EFA2D78352BE3C48B5421A223B8D76AC7AE6A13CE0DA6F030420E5A82CFC321B8DB0E8FC580CB1F52B83D5E8CE908C27B9DA8737178FB338399440E3613C37A527DAB9783815CF88C0C763A9C42B62881FE15BE1C76C161A6819790';
wwv_flow_api.g_varchar2_table(7) := '27C7CDA5F3F844AE0C7D93F192445C09DD32F536DB3427B6D308229559201BE44AAAADBCAC28B44CDA3A3374966E6459997F1CA89B4866E8FE0B5128FA8C321B02410000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(40622769598095114)
,p_file_name=>'ico/favicon-16x16.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
