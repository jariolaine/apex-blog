-- Strict post-deinstall check for the dedicated disposable TEST schema.
-- Do not filter by BLOG_: all user objects must be gone, including recyclebin
-- entries, object-generated indexes, triggers and leftover dependencies.
set define '^' verify off concat on;
set concat .;
set serveroutput on size unlimited;

define workspace = '^1';
define adminAppId = '^2';
define publicAppId = '^3';

declare
  l_objects number;
  l_apps number;
  l_reported number := 0;
begin
  select count(*) into l_objects from user_objects;
  if l_objects > 0 then
    dbms_output.put_line('Remaining TEST schema user objects (' || l_objects || ' total):');
    for item in (select object_type, object_name
                   from user_objects
                  order by object_type, object_name) loop
      dbms_output.put_line('  ' || item.object_type || ': ' || item.object_name);
      l_reported := l_reported + 1;
      exit when l_reported >= 30;
    end loop;
  end if;

  select count(*) into l_apps
    from apex_applications
   where upper(workspace) = upper('^workspace.')
     and application_id in (to_number('^adminAppId.'), to_number('^publicAppId.'));
  if l_apps > 0 then
    dbms_output.put_line('Remaining TEST APEX applications (' || l_apps || ' total):');
    for item in (select application_id
                   from apex_applications
                  where upper(workspace) = upper('^workspace.')
                    and application_id in (to_number('^adminAppId.'), to_number('^publicAppId.'))
                  order by application_id) loop
      dbms_output.put_line('  Application ' || item.application_id);
    end loop;
  end if;

  if l_objects > 0 or l_apps > 0 then
    raise_application_error(-20058,
      'TEST deinstall incomplete: ' || l_objects || ' user objects, ' || l_apps || ' applications remain');
  end if;
  dbms_output.put_line('APEX_BLOG_DEINSTALL_OK');
end;
/
