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
  update blog_comment_subscribers set is_active = 1;
  -- Change column not null
  execute immediate
    'alter table blog_comment_subscribers modify is_active not null'
  ;
  -- Add check constraint
  execute immediate
    'alter table blog_comment_subscribers add constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) )'
  ;
-- Handle excepion if column already exists
-- Column might exists if application is installed from development Git branch
exception when column_exists then
  null;
end;
/
--  Insert patch version info to BLOG_SETTINGS
insert into blog_settings (display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)
  values (10, 0, 'PATCH_20220409', 'STRING', 'INTERNAL', 'Patch 21.2.20220409')
;
