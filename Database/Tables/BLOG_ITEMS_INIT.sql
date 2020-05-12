--------------------------------------------------------
--  DDL for Table BLOG_ITEMS_INIT
--------------------------------------------------------
create table blog_items_init(
  application_id number not null,
  item_name varchar2(255 byte) not null,
  item_value varchar2(4000 char) not null,
  constraint blog_items_init_pk primary key( application_id, item_name )
)
/
