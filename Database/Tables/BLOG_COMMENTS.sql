--------------------------------------------------------
--  DDL for Table BLOG_COMMENTS
--------------------------------------------------------
create table blog_comments(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  post_id number( 38, 0 ) not null,
  parent_id number( 38, 0 ),
  comment_by varchar2( 256 char ) not null,
  body_html varchar2( 4000 byte ) not null,
  constraint blog_comments_pk primary key( id ),
  constraint blog_comment_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_comment_ck1 check( row_version > 0 )
)
/
