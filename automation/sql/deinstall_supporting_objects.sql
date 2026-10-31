set define '^' verify off concat on;
set concat .;
set serveroutput off;

define deinstallFile = '^1';
prompt ;
prompt ;
prompt -- Remove database objects: ^deinstallFile.;

@^deinstallFile.;

prompt -- Purge recyclebin;
purge recyclebin;

prompt -- User objects after deinstall;
select
  object_name
, object_type
from user_objects
order by 2, 1
;

prompt ;
prompt ;
