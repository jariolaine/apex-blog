--------------------------------------------------------
--  DDL for Table BLOG_LINK_ROUPS
--------------------------------------------------------
create table blog_link_groups(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  title varchar2( 256 char ) not null,
  title_unique varchar2( 256 char ) as ( upper( title ) ) virtual ,
  notes varchar2( 4000 byte ),
  constraint blog_link_groups_pk primary key( id ),
  constraint blog_link_groups_uk1 unique( title_unique ),
  constraint blog_link_groups_ck1 check( row_version > 0 ),
  constraint blog_link_groups_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_link_groups_ck3 check( display_seq > 0 )
)
/
