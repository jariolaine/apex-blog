--------------------------------------------------------
--  DDL for Table BLOG_FEATURE_PARENTS
--------------------------------------------------------
create table blog_feature_parents(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  build_option_name varchar2( 256 char ) not null,
  build_option_parent varchar2( 256 char ),
  constraint blog_feature_parents_pk primary key( id ),
  constraint blog_feature_parents_uk1 unique( build_option_name ),
  constraint blog_feature_parents_ck1 check( row_version > 0 ),
  constraint blog_feature_parents_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_feature_parents_ck3 check( build_option_name != build_option_parent )
)
/
