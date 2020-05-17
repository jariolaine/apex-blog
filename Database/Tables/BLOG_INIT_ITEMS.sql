--------------------------------------------------------
--  DDL for Table BLOG_INIT_ITEMS
--------------------------------------------------------
create table blog_init_items(
  application_id number(38,0) not null,
  item_name varchar2(256 char) not null,
  constraint blog_init__items_pk primary key( application_id, item_name )
)
/
