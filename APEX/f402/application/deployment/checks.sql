prompt --application/deployment/checks
begin
wwv_flow_api.create_install_check(
 p_id=>wwv_flow_api.id(32013595471612263)
,p_install_id=>wwv_flow_api.id(31706870664802069)
,p_name=>'Application parsing schema registered to ORDS'
,p_sequence=>10
,p_check_type=>'FUNCTION_BODY'
,p_check_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result boolean;',
'begin ',
'  l_result := false;',
'  for c1 in(',
'    select 1',
'    from user_ords_schemas',
'    where 1 = 1',
'    and parsing_schema = sys_context( ''USERENV'', ''CURRENT_SCHEMA'' )',
'  ) loop',
'    l_result := true;',
'  end loop;',
'  return l_result;',
'exception when others',
'then',
'  return false;',
'end;'))
,p_failure_message=>'You need register application parsing schema to Oracle REST Data Service.'
);
end;
/
