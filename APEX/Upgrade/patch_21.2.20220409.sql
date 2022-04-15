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
  update blog_comment_subscribers
    set is_active = 1
  ;
  -- Add not null constraint to column IS_ACTIVE
  execute immediate
    'alter table blog_comment_subscribers modify is_active not null'
  ;
  -- Add check constarint BLOG_COMMENT_SUBSCRIBERS_CK2
  execute immediate
    'alter table blog_comment_subscribers add
      constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) )'
  ;
-- Handle excepion ff column already exists
-- Column might exists if application is installed from development Git branch
exception when column_exists then
  null;
end;
/

--------------------------------------------------------
--  Update metadata
--------------------------------------------------------
-- Disable constraint BLOG_INIT_ITEMS_FK1
alter table blog_init_items modify
  constraint blog_init_items_fk1 disable
;
-- Update BLOG_SETTINGS
update blog_settings
  set attribute_name = 'G_APP_DATE_FORMAT'
where 1 = 1
  and attribute_name = 'G_DATE_FORMAT'
;
-- Update BLOG_INIT_ITEMS
update blog_init_items
  set item_name = 'G_APP_DATE_FORMAT'
where 1 = 1
  and item_name = 'G_DATE_FORMAT'
;
-- Enable constraint BLOG_INIT_ITEMS_FK1
alter table blog_init_items modify
  constraint blog_init_items_fk1 enable
;

--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
begin
  insert into blog_settings (display_seq, is_nullable, attribute_name, data_type, attribute_group_message, attribute_value)
    values (10, 0, 'PATCH_20220409', 'STRING', 'INTERNAL', 'Patch 21.2.20220409')
  ;
exception when dup_val_on_index then
  null;
end;
/
