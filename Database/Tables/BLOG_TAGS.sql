--------------------------------------------------------
--  DDL for Table BLOG_TAGS
--------------------------------------------------------
create table blog_tags (
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  tag varchar2( 256 char ) not null,
  tag_unique varchar2( 256 char ) as ( upper( trim( tag ) ) ) virtual ,
  notes varchar2( 4000 byte ),
  constraint blog_tags_pk primary key( id ),
  constraint blog_tags_uk1 unique( tag ),
  constraint blog_tags_uk2 unique( tag_unique ),
  constraint blog_tags_ck1 check( row_version > 0 ),
  constraint blog_tags_ck2 check( is_active in( 0 , 1 ) )
)
/
