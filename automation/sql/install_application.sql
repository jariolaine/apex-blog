set define '^' verify off concat on;
set concat .;
set serveroutput off;

define workspace = '^1';
define dbSchema = '^2';
define appId = '^3';
define installFile = '^4';
define expectedVersion = '^5';

prompt ;
prompt ;
prompt -- Installing application from file: ^installFile.
prompt -- Workspace: ^workspace., Schema: ^dbSchema., Application ID: ^appId.;
prompt -- Expected application version: ^expectedVersion.;

set verify off;
begin
  apex_application_install.set_auto_install_sup_obj( p_auto_install_sup_obj => true );
  apex_application_install.set_workspace( '^workspace.' );
  apex_application_install.set_schema( '^dbSchema.' );
  apex_application_install.set_application_id( '^appId.' );
  apex_application_install.generate_offset;
end;
/
set verify on;
set serveroutput on size unlimited

@"^installFile."

set define '^' verify off;
set serveroutput on size unlimited;

prompt ;
prompt -- Errors after install;
select *
from user_errors
;
prompt ;
prompt ;


-- SQLcl exit codes are not always reliable for failed @script commands.
-- Verify the target app exists AND has the expected packaged version.
-- An existing app with an older version must not count as a successful import.
declare
  l_count number;
  l_actual_version varchar2(4000);
begin
  apex_util.set_workspace(p_workspace => '^workspace.');
  select count(*) into l_count
    from apex_applications
   where application_id = to_number('^appId.')
     and upper(workspace) = upper('^workspace.');
  if l_count = 0 then
    raise_application_error(-20055, 'Application not found after installation: ^appId.');
  end if;
  l_actual_version := apex_application_admin.get_application_version(
    p_application_id => to_number('^appId.')
  );
  if l_actual_version is null or l_actual_version <> '^expectedVersion.' then
    raise_application_error(-20056, 'Installed application ^appId. has version ' ||
      nvl(l_actual_version, '<missing>') || '; expected ^expectedVersion.');
  end if;
  dbms_output.put_line('APEX_BLOG_INSTALL_OK');
end;
/
