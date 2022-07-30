--------------------------------------------------------
--  DDL for Table BLOG_FEATURES
--------------------------------------------------------
create table blog_features(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  build_option_name varchar2( 256 char ) not null,
  build_option_group varchar2( 256 char ) not null,
  build_option_parent varchar2( 256 char ),
  constraint blog_features_pk primary key( id ),
  constraint blog_features_uk1 unique( build_option_name ),
  constraint blog_features_ck1 check( row_version > 0 ),
  constraint blog_features_ck2 check( display_seq > 0 ),
  constraint blog_features_ck3 check( is_active in( 0, 1 ) )
)
/
