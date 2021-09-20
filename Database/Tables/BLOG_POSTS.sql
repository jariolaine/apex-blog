--------------------------------------------------------
--  DDL for Table BLOG_POSTS
--------------------------------------------------------
create table blog_posts(
  id number( 38, 0 ) not null,
	row_version number( 38, 0 ) not null,
	created_on timestamp( 6 ) with local time zone not null,
	created_by varchar2( 256 char ) not null,
	changed_on timestamp( 6 ) with local time zone not null,
	changed_by varchar2( 256 char ) not null,
	is_active number( 1, 0 ) not null,
	blogger_id number( 38, 0 ) not null,
	category_id number( 38, 0 ) not null,
	title varchar2( 256 char ) not null,
	post_desc varchar2( 1024 char ) not null,
	body_html clob not null,
	first_paragraph varchar2( 4000 byte ) not null,
	published_on timestamp( 6 ) with local time zone not null,
	notes varchar2( 4000 byte ),
  body_length number( 38, 0 ) as ( sys.dbms_lob.getlength( body_html ) ) virtual not null,
	archive_year_month number( 6, 0 ) as ( to_number( to_char( published_on, 'YYYYMM' ) ) ) virtual not null,
	archive_year number( 4, 0 ) as ( to_number( to_char( published_on, 'YYYY' ) ) ) virtual not null,
	constraint blog_posts_pk primary key( id ),
  constraint blog_posts_ck1 check( row_version > 0 ),
  constraint blog_posts_ck2 check( is_active in( 0 , 1 ) )
)
/
