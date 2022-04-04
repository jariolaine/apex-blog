--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_SUBSCRIBERS
--------------------------------------------------------
create table blog_comment_subscribers(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  post_id number( 38, 0 ) not null,
  email_id number( 38, 0 ) not null,
  subscription_date date not null,
  constraint blog_comment_subscribers_pk primary key( id ),
  constraint blog_comment_subscribers_uk1 unique( post_id, email_id ),
  constraint blog_comment_subscribers_ck1 check( row_version > 0 )
  constraint blog_comment_subscribers_ck2 check( is_active in( 0, 1 ) )
)
/
