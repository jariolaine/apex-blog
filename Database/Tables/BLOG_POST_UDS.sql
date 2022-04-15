--------------------------------------------------------
--  DDL for Table BLOG_POST_UDS
--------------------------------------------------------
create table blog_post_uds(
  id number( 38, 0 ) not null,
	row_version number( 38, 0 ) not null,
	created_on timestamp( 6 ) with local time zone not null,
	created_by varchar2( 256 char ) not null,
	changed_on timestamp( 6 ) with local time zone not null,
	changed_by varchar2( 256 char ) not null,
  post_id number( 38, 0 ) not null,
  dummy char( 1 byte ) default 'X' not null,
	constraint blog_post_uds_pk primary key( id ),
  constraint blog_post_uds_uk1 unique( post_id ),
  constraint blog_post_uds_ck1 check( row_version > 0 )
)
/
