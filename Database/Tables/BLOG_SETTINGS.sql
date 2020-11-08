--------------------------------------------------------
--  DDL for Table BLOG_POST_SETTINGS
--------------------------------------------------------
create table blog_settings(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_nullable number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  group_name varchar2( 64 char ) not null,
  attribute_name varchar2( 64 char ) not null,
  attribute_value varchar2( 4000 char ),
  data_type varchar2( 64 char ) not null,
  post_expression varchar2( 4000 char ),
  int_min number(2,0),
  int_max number(2,0),
  notes varchar2(4000 char),
  install_value varchar2( 4000 char ),
  constraint blog_settings_pk primary key( id ),
  constraint blog_settings_uk1 unique( attribute_name ),
  constraint blog_settings_ck1 check( row_version > 0 ),
  constraint blog_settings_ck2 check( is_nullable in( 0, 1 ) ),
  constraint blog_settings_ck3 check( display_seq > 0 ),
  constraint blog_settings_ck4 check(
    is_nullable = 1 or
    is_nullable = 0 and
    attribute_value is not null
  ),
  constraint blog_settings_ck5 check(
    group_name in(
       'BLOG_PAR_GROUP_GENERAL'
      ,'BLOG_PAR_GROUP_REPORTS'
      ,'BLOG_PAR_GROUP_SEO'
      ,'BLOG_PAR_GROUP_UI'
      ,'INTERNAL'
    )
  ),
  constraint blog_settings_ck6 check(
    data_type in(
       'INTEGER'
      ,'STRING'
      ,'DATE_FORMAT'
      ,'URL'
      ,'EMAIL'
    )
  ),
  constraint blog_settings_ck7 check(
    data_type != 'INTEGER' or
    data_type = 'INTEGER' and
    int_min is not null and
    int_max is not null and
    round( to_number( attribute_value ) ) = to_number( attribute_value )
  ),
  constraint blog_settings_ck8 check(
      data_type != 'DATE_FORMAT' or
      data_type = 'DATE_FORMAT' and
      to_char( created_on, attribute_value ) is not null
  ),
  constraint blog_settings_ck9 check(
    data_type != 'URL' or
    data_type = 'URL' and
    regexp_like( attribute_value, '^https?\:\/\/.*$' )
  ),
  constraint blog_settings_ck10 check(
    data_type != 'EMAIL' or
    data_type = 'EMAIL' and
    regexp_like( attribute_value, '^.*\@.*\..*$' )
  )
)
/
