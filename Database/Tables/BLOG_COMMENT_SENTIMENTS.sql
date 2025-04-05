--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_SENTIMENTS
--------------------------------------------------------
create table blog_comment_sentiments(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  comment_id number( 38, 0 ) not null,
  dominant_language varchar2( 2 char ) not null,
  sentiment_json varchar2(4000 byte) not null,
  constraint blog_comment_sentiments_pk primary key( id ),
  constraint blog_comment_sentiments_uk1 unique( comment_id ),
  constraint blog_comment_sentiments_ck1 check( row_version > 0 ),
  constraint blog_comment_sentiments_ck2 check( sentiment_json is json )
)
/
