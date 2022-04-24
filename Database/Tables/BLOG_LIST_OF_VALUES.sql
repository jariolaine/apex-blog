--------------------------------------------------------
--  DDL for Table BLOG_LIST_OF_VALUES
--------------------------------------------------------
create table blog_list_of_values(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  lov_name varchar2( 256 char ) not null,
  return_value varchar2(  256 char ) not null,
  display_message varchar2( 256 char ) not null,
  notes varchar2( 4000 byte ),
  constraint blog_list_of_values_pk primary key( id ),
  constraint blog_list_of_values_uk1 unique( lov_name, return_value ),
  constraint blog_list_of_values_ck1 check( row_version > 0 ),
  constraint blog_list_of_values_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_list_of_values_ck3 check( display_seq > 0 )
)
/
