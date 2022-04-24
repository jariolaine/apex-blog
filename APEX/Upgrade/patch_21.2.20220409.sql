--  Patch 21.2.20220409
--------------------------------------------------------
--  Changes to table BLOG_COMMENT_SUBSCRIBERS
--------------------------------------------------------
declare
  column_exists exception;
  pragma exception_init ( column_exists, -1430 );
begin
  -- Add new column IS_ACTIVE
  execute immediate
    'alter table blog_comment_subscribers add is_active number( 1, 0 )'
  ;
  -- Update default value to column IS_ACTIVE
  execute immediate
    'update blog_comment_subscribers set is_active = 1'
  ;
-- Handle excepion if column already exists
-- Column might exists if application is installed from development Git branch
exception when column_exists then
  null;
end;
/
declare
  already_not_null exception;
  pragma exception_init ( already_not_null, -1442 );
begin
  -- Add not null constraint to column IS_ACTIVE
  execute immediate
    'alter table blog_comment_subscribers modify is_active not null'
  ;
-- Handle excepion if column already not null
exception when already_not_null then
  null;
end;
/
declare
  name_already_use exception;
  pragma exception_init ( name_already_use, -2264 );
begin
  -- Add check constarint BLOG_COMMENT_SUBSCRIBERS_CK2
  execute immediate
    'alter table blog_comment_subscribers add
      constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) )'
  ;
-- Handle excepion if constraint already exists
-- Column might exists if application is installed from development Git branch
exception when name_already_use then
  null;
end;
/
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
begin
  insert into blog_settings (display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)
    values (10, 0, 'PATCH_20220409', 'STRING', 'INTERNAL', 'Patch 21.2.20220409')
  ;
-- Handle exception if patch version already inserted
exception when dup_val_on_index then
  null;
end;
/
