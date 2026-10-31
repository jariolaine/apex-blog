-- Setup application
set define '^' verify off concat on;
set concat .;
set serveroutput on size unlimited;

define APP_OWNER = '^1';
define APP_OWNER_PASSWORD = '^2';
define WORKSPACE_NAME = '^3';
define APEX_USER_NAME = '^4';
define APEX_USER_PASSWORD = '^5';

define USER_GROUP_NAME = 'Bloggers';
define USER_GROUP_DESC = 'Blog application user group';

--whenever sqlerror exit sql.sqlcode
begin
  if '^APP_OWNER.' is null or
    '^APP_OWNER_PASSWORD.' is null or
    '^WORKSPACE_NAME.' is null or
    '^APEX_USER_NAME.' is null or
    '^APEX_USER_PASSWORD.' is null
  then
    raise_application_error( -20001, 'All variables not set.' );
  end if;
end;
/

-- Check if application already exists
declare
  l_count number;
begin

  select count(1)
  into l_count
  from dba_users
  where 1 = 1
    and username = upper( '^APP_OWNER.' )
  ;

  if l_count > 0
  then
    raise_application_error( -20002, 'User "^APP_OWNER." already exists. Database setup is skipped.' );
  end if;

  select count(1)
  into l_count
  from apex_workspaces
  where 1 = 1
    and workspace = upper( '^WORKSPACE_NAME.' )
  ;

  if l_count > 0
  then
    raise_application_error( -20003, 'APEX workspace "^WORKSPACE_NAME." already exists. Database setup is skipped.' );
  end if;

end;
/

-- Create user for application
create user ^APP_OWNER. identified by "^APP_OWNER_PASSWORD.";

-- Grant privileges
grant create indextype to ^APP_OWNER.;
grant create procedure to ^APP_OWNER.;
grant create sequence to ^APP_OWNER.;
grant create table to ^APP_OWNER.;
grant create trigger to ^APP_OWNER.;
grant create view to ^APP_OWNER.;
grant ctxapp to ^APP_OWNER.;
grant create session to ^APP_OWNER.;
alter user ^APP_OWNER. default role all;

-- Grant quota to tablespace
begin

  for c1 in(
    select default_tablespace
    from dba_users
    where 1 = 1
      and username = upper( '^APP_OWNER.' )
  ) loop
    execute immediate 'alter user ^APP_OWNER. quota unlimited on ' || c1.default_tablespace;
  end loop;

end;
/

-- Create APEX workspace, workspace group and user
declare
  l_workspace_id    number;
  l_app_ws_group_id number;
begin

  -- Create workspace
  apex_instance_admin.add_workspace (
    p_workspace       => upper( '^WORKSPACE_NAME.' )
  , p_primary_schema  => upper( '^APP_OWNER.' )
  );

  -- Get workspace id
  l_workspace_id :=
    apex_util.find_security_group_id (
      p_workspace => upper( '^WORKSPACE_NAME.' )
    )
  ;

  -- Set workspace id
  apex_util.set_security_group_id (
    p_security_group_id => l_workspace_id
  );

  -- Create workspace group for application authorization
  apex_util.create_user_group (
    p_security_group_id => l_workspace_id
  , p_group_name        => '^USER_GROUP_NAME.'
  , p_group_desc        => '^USER_GROUP_DESC.'
  );

  -- Get workspace group id
  l_app_ws_group_id :=
    apex_util.get_group_id(
      p_group_name => '^USER_GROUP_NAME.'
    )
  ;

  -- Create workspace admin user and assign workspace group
  apex_util.create_user(
    p_user_name                     => upper( '^APEX_USER_NAME.' )
  , p_web_password                  => '^APEX_USER_PASSWORD.'
  , p_developer_privs               => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL'
  , p_group_ids                     => l_app_ws_group_id
  , p_change_password_on_first_use  => 'N'
  );

  commit;

end;
/
