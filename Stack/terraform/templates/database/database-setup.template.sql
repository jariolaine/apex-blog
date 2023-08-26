-- Setup application

set serveroutput on size unlimited;

%{ if apex_image_prefix != "" }
-- Set APEX static files image prefix
whenever sqlerror exit sql.sqlcode
begin

  apex_instance_admin.set_parameter(
    p_parameter => 'IMAGE_PREFIX'
    ,p_value    => '${apex_image_prefix}'
  );

  commit;

end;
/
%{ endif }

-- Check if application already exists
whenever sqlerror exit 0
declare
  l_count number;
begin

  select count(1)
  into l_count
  from dba_users
  where 1 = 1
    and username = '${app_user_name}'
  ;

  if l_count > 0
  then
    raise_application_error( -20001, 'Application exists. Database setup is skipped.' );
  end if;

end;
/


-- Create user for application
whenever sqlerror exit sql.sqlcode

create user ${app_user_name} identified by "${app_user_password}";

-- Grant privileges
grant ctxapp to ${app_user_name};
grant dwrole to ${app_user_name};
alter user ${app_user_name} default role all;

begin

  for c1 in(
    select privilege
    from dba_sys_privs
    where 1 = 1
      and grantee = 'APEX_GRANTS_FOR_NEW_USERS_ROLE'
    order by 1
  ) loop
    execute immediate 'grant ' || c1.privilege || ' to ${app_user_name}';
  end loop;

end;
/

-- Grant quota to tablespace
begin

  for c1 in(
    select default_tablespace
    from dba_users
    where 1 = 1
      and username = '${app_user_name}'
  ) loop
    execute immediate 'alter user ${app_user_name} quota unlimited on ' || c1.default_tablespace;
  end loop;

end;
/

-- REST enable user
begin
  ords.enable_schema(
    p_enabled               => true
    ,p_schema               => '${app_user_name}'
    ,p_url_mapping_type     => 'BASE_PATH'
    ,p_url_mapping_pattern  => lower( '${app_user_name}' )
    ,p_auto_rest_auth       => false
  );
  commit;
end;
/

-- Create APEX workspace, workspace group and user
declare
  l_workspace_id    number;
  l_app_ws_group_id number;

  l_ws_user_group_name constant varchar2(256) := 'Bloggers';
begin

  -- Create workspace
  apex_instance_admin.add_workspace (
    p_workspace       => '${apex_workspace_name}'
    ,p_primary_schema => '${app_user_name}'
  );

  -- Get workspace id
  l_workspace_id :=
    apex_util.find_security_group_id (
      p_workspace => '${apex_workspace_name}'
    )
  ;

  -- Set workspace id
  apex_util.set_security_group_id (
    p_security_group_id => l_workspace_id
  );

  -- Create workspace group for application authorization
  apex_util.create_user_group (
    p_group_name          => l_ws_user_group_name
    ,p_security_group_id  => l_workspace_id
    ,p_group_desc         => 'Blog application user group'
  );

  -- Get workspace group id
  l_app_ws_group_id :=
    apex_util.get_group_id(
      p_group_name => l_ws_user_group_name
    )
  ;

  -- Create workspace admin user and assign workspace group
  apex_util.create_user(
    p_user_name                     => '${app_user_name}'
    ,p_web_password                 => '${app_user_password}'
    ,p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL'
    ,p_group_ids                    => l_app_ws_group_id
    ,p_change_password_on_first_use => 'Y'
  );

  commit;

end;
/

-- Install applications
begin
  apex_application_install.set_auto_install_sup_obj( p_auto_install_sup_obj => true );
  apex_application_install.set_workspace( '${apex_workspace_name}' );
  apex_application_install.set_schema( '${app_user_name}' );
  apex_application_install.generate_application_id;
  apex_application_install.generate_offset;
end;
/
@#ADMIN_APP_SQL#

begin
  apex_application_install.set_auto_install_sup_obj( p_auto_install_sup_obj => true );
  apex_application_install.set_workspace( '${apex_workspace_name}' );
  apex_application_install.set_schema( '${app_user_name}' );
  apex_application_install.generate_application_id;
  apex_application_install.generate_offset;
end;
/
@#PUBLIC_APP_SQL#