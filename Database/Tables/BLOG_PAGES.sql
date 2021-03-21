--------------------------------------------------------
--  DDL for Table BLOG_PAGES
--------------------------------------------------------
create table blog_pages(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  page_title varchar2( 256 char ) not null,
  page_alias varchar2( 256 char ) not null,
  page_type varchar2( 256 char ) not null,
  build_option varchar2( 256 char ),
  notes varchar2(4000 char),
  constraint blog_pages_pk primary key( id ),
  constraint blog_pages_uk1 unique( page_alias  ),
  constraint blog_pages_uk2 unique( page_type, page_alias  ),
  constraint blog_pages_ck1 check( row_version > 0 ),
  constraint blog_pages_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_pages_ck3 check( display_seq > 0 )
)
/
