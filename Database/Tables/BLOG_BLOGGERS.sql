--------------------------------------------------------
--  DDL for Table BLOG_BLOGGERS
--------------------------------------------------------
create table blog_bloggers(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  blogger_name varchar2( 256 char ) not null,
  apex_username varchar2(  256 char ) not null,
  email varchar2( 256 char ),
  publish_desc number( 1, 0 ) not null,
  blogger_desc varchar2( 4000 byte ),
  show_desc number( 1, 0 ) as( is_active * publish_desc * case when blogger_desc is not null then 1 else 0 end ) virtual not null,
  constraint blog_bloggers_pk primary key( id ),
  constraint blog_bloggers_uk1 unique( apex_username ),
  constraint blog_bloggers_ck1 check( row_version > 0 ),
  constraint blog_bloggers_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_bloggers_ck3 check( display_seq > 0 ),
  constraint blog_bloggers_ck4 check( publish_desc in( 0 , 1 ) ),
  constraint blog_bloggers_ck5 check( show_desc in( 0 , 1 ) )
)
/
