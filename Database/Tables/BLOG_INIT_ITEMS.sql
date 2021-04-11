--------------------------------------------------------
--  DDL for Table BLOG_INIT_ITEMS
--------------------------------------------------------
create table blog_init_items(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  application_id number( 38,0 ) not null,
  item_name varchar2( 256 char ) not null,
  notes varchar2( 4000 byte ),
  constraint blog_init_items_pk primary key( id ),
  constraint blog_init_items_uk1 unique( application_id, item_name ),
  constraint blog_init_items_ck1 check( row_version > 0 ),
  constraint blog_init_items_ck2 check( is_active in( 0, 1 ) )
)
/
