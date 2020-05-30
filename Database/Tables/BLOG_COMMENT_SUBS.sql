--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_SUBS
--------------------------------------------------------
create table blog_comment_subs(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  post_id number( 38, 0 ) not null,
  email_id number( 38, 0 ) not null,
  notes varchar2(4000 char),
  constraint blog_comment_subs_pk primary key( id ),
  constraint blog_comment_subs_uk1 unique( post_id, email_id ),
  constraint blog_comment_subs_ck1 check( row_version > 0 )
)
/
