--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_SUBS_EMAIL
--------------------------------------------------------
create table blog_comment_subs_email(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  email varchar2( 256 char ) not null,
  notes varchar2(4000 char),
  email_unique varchar2( 256 char ) as ( lower( trim( email ) ) ) virtual not null,
  constraint blog_comment_subs_email_pk primary key( id ),
  constraint blog_comment_subs_email_uk1 unique( email_unique ),
  constraint blog_comment_subs_email_ck1 check( row_version > 0 ),
  constraint blog_comment_subs_email_ck2 check( is_active in( 0, 1 ) )
)
/
