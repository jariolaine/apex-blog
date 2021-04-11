--------------------------------------------------------
--  DDL for Table BLOG_POST_PREVIEW
--------------------------------------------------------
create table blog_post_preview(
  id number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone default localtimestamp not null,
  post_title varchar2( 128 char ),
  category_title varchar2( 128 char ),
  body_html clob,
  tags varchar2( 4000 byte ),
  constraint blog_post_preview_pk primary key( id )
)
/
