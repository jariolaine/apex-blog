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
'   p_value => :P0_SEARCH',
');'))
,p_process_when=>'P0_SEARCH'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_required_patch=>wwv_flow_api.id(8667733481689180)
,p_process_comment=>'Redirect to search result when request is P0_SEARCH'
);
end;
/
