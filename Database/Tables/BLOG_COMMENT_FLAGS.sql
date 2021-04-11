--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_FLAGS
--------------------------------------------------------
create table blog_comment_flags (
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  comment_id number( 38, 0 ) not null,
  flag varchar2( 64 char ) not null,
  notes varchar2( 4000 byte ),
  constraint blog_comment_flags_pk primary key( id ),
  constraint blog_comment_flags_ck1 check( row_version > 0 )
)
/
