--------------------------------------------------------
--  DDL for Table BLOG_POST_TAGS
--------------------------------------------------------
create table blog_post_tags(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  post_id number( 38, 0 ) not null,
  tag_id number( 38, 0 ) not null,
  constraint blog_post_tags_pk primary key( id ),
  constraint blog_post_tags_uk1 unique( post_id, tag_id ),
  constraint blog_post_tags_ck1 check( row_version > 0 ),
  constraint blog_post_tags_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_post_tags_ck3 check( display_seq > 0 )
)
/
