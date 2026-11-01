-- Run after Admin AND Public applications have been imported.
-- Each app's identity/version is checked by install_application.sql.
set serveroutput on size unlimited;

prompt -- Invalid BLOG_ database objects after installing both applications;
select object_type, object_name, status
  from user_objects
 where substr(object_name, 1, 5) = 'BLOG_'
   and status = 'INVALID'
 order by object_type, object_name;

prompt -- BLOG_ object compilation errors (if any);
select name, type, line, position, text
  from user_errors
 where substr(name, 1, 5) = 'BLOG_'
 order by name, type, sequence;

declare
  l_invalid_count pls_integer;
begin
  select count(*) into l_invalid_count
    from user_objects
   where substr(object_name, 1, 5) = 'BLOG_'
     and status = 'INVALID';
  if l_invalid_count > 0 then
    raise_application_error(-20057,
      'Installation left ' || l_invalid_count || ' invalid BLOG_ database object(s)');
  end if;
  dbms_output.put_line('APEX_BLOG_OBJECTS_VALID');
end;
/
