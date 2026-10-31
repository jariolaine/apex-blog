set define '^' verify off concat on;
set concat .;
set serveroutput off;

define workspace = '^1';
define dbSchema = '^2';
define appId = '^3';
define installFile = '^4';

prompt ;
prompt ;
prompt -- Installing application from file: ^installFile.
prompt -- Workspace: ^workspace., Schema: ^dbSchema., Application ID: ^appId.;

set verify off;
begin
  apex_application_install.set_auto_install_sup_obj( p_auto_install_sup_obj => true );
  apex_application_install.set_workspace( '^workspace.' );
  apex_application_install.set_schema( '^dbSchema.' );
  apex_application_install.set_application_id( '^appId.' );
  apex_application_install.generate_offset;
  apex_application_install.set_remote_server(
    p_static_id => 'BLOG_OPEN_AI_API'
  , p_base_url  => 'https://example.com'
  );
  apex_application_install.set_remote_server(
    p_static_id => 'BLOG_LANGUAGE_AI'
  , p_base_url  => 'https://example.com'
  );
  apex_application_install.set_remote_server(
    p_static_id => 'BLOG_OBJECT_STORAGE'
  , p_base_url  => 'https://example.com'
  );
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
-- Verify the target application now exists before declaring success.
declare
  l_count number;
begin
  select count(*) into l_count
    from apex_applications
   where application_id = to_number('^appId.')
     and upper(workspace) = upper('^workspace.');
  if l_count = 0 then
    raise_application_error(-20055, 'Application not found after installation: ^appId.');
  end if;
  dbms_output.put_line('APEX_BLOG_INSTALL_OK');
end;
/
