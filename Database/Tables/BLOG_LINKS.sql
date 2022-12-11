--------------------------------------------------------
--  DDL for Table BLOG_LINKS
--------------------------------------------------------
create table blog_links(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  link_group_id number not null,
  title varchar2( 256 char ) not null,
  link_desc varchar2( 4000 byte ) not null,
  link_url varchar2( 256 char ) not null,
  external_link number(1,0) not null,
  target_blank number(1,0) not null,
  notes varchar2( 4000 byte ),
  constraint blog_links_pk primary key( id ),
  constraint blog_links_uk1 unique( link_group_id, id ),
  constraint blog_links_ck1 check( row_version > 0 ),
  constraint blog_links_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_links_ck3 check( display_seq > 0 ),
  constraint blog_links_ck4 check( external_link in( 0, 1 ) ),
  constraint blog_links_ck5 check( target_blank in( 0, 1 ) )
)
/
