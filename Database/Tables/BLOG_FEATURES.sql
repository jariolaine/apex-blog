--------------------------------------------------------
--  DDL for Table BLOG_FEATURES
--------------------------------------------------------
create table blog_features(
  build_option_name varchar2( 255 char ) not null,
  build_option_group varchar2( 255 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  notes varchar2( 4000 char ),
  constraint blog_features_pk primary key( build_option_name ),
  constraint blog_features_ck1 check( display_seq > 0 ),
  constraint blog_features_ck2 check( is_active in( 0, 1 ) )
)
/
