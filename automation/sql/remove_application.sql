set define '^' verify off concat on;
set concat .;
set serveroutput on size unlimited;

define workspace = '^1';
define dbSchema = '^2';
define appId = '^3';

prompt ;
prompt -- Remove application
prompt -- Workspace: ^workspace., Schema: ^dbSchema., Application ID: ^appId.;
set verify off;
declare
  l_count number;
begin
  select count(*) into l_count
    from apex_applications
   where application_id = to_number('^appId.')
     and upper(workspace) = upper('^workspace.');
  if l_count > 0 then
    apex_application_install.set_workspace('^workspace.');
    apex_application_install.set_schema('^dbSchema.');
    apex_application_install.remove_application('^appId.');
    commit;
  end if;
end;
/
prompt ;

set verify on;
set serveroutput off;
