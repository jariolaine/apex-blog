--------------------------------------------------------
--  DDL for Table BLOG_DYNAMIC_CONTENT
--------------------------------------------------------
create table blog_dynamic_content(
  id number( 38,0 ) not null enable,
	row_version number( 38,0 ) not null enable,
	created_on timestamp ( 6 ) with local time zone not null enable,
	created_by varchar2( 256 char ) not null,
	changed_on timestamp ( 6 ) with local time zone not null enable,
	changed_by varchar2( 256 char ) not null,
	is_active number( 1,0 ) not null enable,
	display_seq number( 10,0 ) not null enable,
  content_type varchar2( 256 char ) not null,
  content_desc varchar2( 256 char ) not null,
  show_changed_on number( 1,0 ) not null enable,
  content_html clob not null,
  notes varchar2( 4000 byte ),
  constraint blog_dynamic_content_pk primary key( id ),
  constraint blog_dynamic_content_ck1 check( row_version > 0 ),
  constraint blog_dynamic_content_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_dynamic_content_ck3 check( display_seq > 0 ),
  constraint blog_dynamic_content_ck4 check( content_type in( 'FOOTER_LINK' ) ),
  constraint blog_dynamic_content_ck5 check( show_changed_on in( 0, 1 ) )
)
/
