--------------------------------------------------------
--  Drop constraint BLOG_COMMENT_FLAGS_CK2
--------------------------------------------------------
alter table blog_comment_flags drop
  constraint blog_comment_flags_ck2;

--------------------------------------------------------
--  Update table BLOG_COMMENT_FLAGS
--------------------------------------------------------
update blog_comment_flags
  set flag = 'UNREAD'
where 1 = 1
and flag = 'NEW'
;

--------------------------------------------------------
--  Add constraint BLOG_COMMENT_FLAGS_CK2
--------------------------------------------------------
alter table blog_comment_flags add
  constraint blog_comment_flags_ck2 check ( flag in( 'UNREAD', 'MODERATE' ) );

--------------------------------------------------------
--  Alter table BLOG_COMMENT_SUBSCRIBERS add column IS_ACTIVE
--------------------------------------------------------
alter table blog_comment_subscribers add is_active number( 1, 0 );

--------------------------------------------------------
--  Update table BLOG_COMMENT_SUBSCRIBERS
--------------------------------------------------------
update blog_comment_subscribers
  set is_active = 1
;

--------------------------------------------------------
--  Alter table BLOG_COMMENT_SUBSCRIBERS add constraints
--------------------------------------------------------
alter table blog_comment_subscribers modify is_active not null;

alter table blog_comment_subscribers add
  constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) );

--------------------------------------------------------
--  Disable constraint BLOG_INIT_ITEMS_FK1
--------------------------------------------------------
alter table blog_init_items modify
  constraint blog_init_items_fk1 disable;

--------------------------------------------------------
--  Update BLOG_SETTINGS
--------------------------------------------------------
update blog_settings
  set attribute_name = 'G_APP_DATE_FORMAT'
where 1 = 1
and attribute_name = 'G_DATE_FORMAT'
;

update blog_settings
  set is_nullable = 0
where 1 = 1
and attribute_name = 'G_ADMIN_APP_ID'
;

update blog_settings
  set is_nullable = 0
where 1 = 1
and attribute_name = 'G_PUB_APP_ID'
;

--------------------------------------------------------
--  Update BLOG_INIT_ITEMS
--------------------------------------------------------
update blog_init_items
  set item_name = 'G_APP_DATE_FORMAT'
where 1 = 1
and item_name = 'G_DATE_FORMAT'
;

--------------------------------------------------------
--  Enable constraint BLOG_INIT_ITEMS_FK1
--------------------------------------------------------
alter table blog_init_items modify
  constraint blog_init_items_fk1 enable;

--------------------------------------------------------
--  Insert patch version
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value) values ('10','0','PATCH_20220409','STRING','INTERNAL','Patch 21.2.20220409');

--------------------------------------------------------
--  Update application version
--------------------------------------------------------
update blog_settings
set attribute_value = 'Release 21.2.20220411'
where 1 = 1
and attribute_name = 'G_APP_VERSION'
;
