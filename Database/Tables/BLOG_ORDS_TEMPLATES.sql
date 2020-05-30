--------------------------------------------------------
--  DDL for Table BLOG_ORDS_TEMPLATES
--------------------------------------------------------
create table blog_ords_templates(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number(10,0) not null,
  template_group varchar2( 256 char ) not null,
  uri_template varchar2( 256 char ) not null,
  http_method varchar2( 256 char ) not null,
  source_type  varchar2( 256 char ) not null,
  handler_source varchar2( 256 char ) not null,
  build_option varchar2( 256 char ),
  notes varchar2(4000 char),
  constraint blog_ords_templates_pk primary key( id ),
  constraint blog_ords_templates_uk1 unique( uri_template  ),
  constraint blog_ords_templates_ck1 check( row_version > 0 ),
  constraint blog_ords_templates_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_ords_templates_ck3 check( display_seq > 0 )
)
/
