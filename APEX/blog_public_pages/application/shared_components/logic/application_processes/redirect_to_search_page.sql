prompt --application/shared_components/logic/application_processes/redirect_to_search_page
begin
--   Manifest
--     APPLICATION PROCESS: Redirect to search page
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(6988319204594678)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Redirect to search page'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'blog_util.redirect_search(',
'  p_value    => :P0_SEARCH',
', p_page_id  => 4',
');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'SEARCH'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_required_patch=>wwv_flow_imp.id(39030203881986717)
,p_process_comment=>'Redirect to search result when request is SEARCH'
,p_version_scn=>41109638349846
);
wwv_flow_imp.component_end;
end;
/
