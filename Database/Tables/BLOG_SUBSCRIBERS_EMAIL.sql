--------------------------------------------------------
--  DDL for Table BLOG_SUBSCRIBERS_EMAIL
--------------------------------------------------------
create table blog_subscribers_email(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  email varchar2( 256 char ) not null,
  constraint blog_subscribers_email_pk primary key( id ),
  constraint blog_subscribers_email_uk1 unique( email ),
  constraint blog_subscribers_email_ck1 check( row_version > 0 ),
  constraint blog_subscribers_email_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_subscribers_email_ck3 check( email = lower( trim( email ) ) )
)
/
