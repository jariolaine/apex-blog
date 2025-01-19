--------------------------------------------------------
--  DDL for Table BLOG_SETTING_FEATURES
--------------------------------------------------------
create table blog_setting_features(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  attribute_name varchar2( 128 char ) not null,
  build_option_name varchar2( 256 char ) not null,
  build_option_status varchar2( 10 char ) not null,
  constraint blog_setting_features_pk primary key( id ),
  constraint blog_setting_features_uk1 unique( attribute_name ),
  constraint blog_setting_features_ck1 check( row_version > 0 ),
  constraint blog_setting_features_ck2 check( build_option_status in( 'EXCLUDE', 'INCLUDE' ) )
)
/
