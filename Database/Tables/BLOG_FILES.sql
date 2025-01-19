--------------------------------------------------------
--  DDL for Table BLOG_FILES
--------------------------------------------------------
create table blog_files (
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  is_download number( 1, 0 ) not null,
  file_path varchar2( 256 char ) not null,
  mime_type varchar2( 256 char ) not null,
  blob_content blob,
  file_size number( 38, 0 ) not null,
  file_charset varchar2( 256 char ),
  file_desc varchar2( 4000 byte ),
  md5 varchar2( 256 char ),
  etag varchar2( 256 char ),
  notes varchar2( 4000 byte ),
	apex$sync_step_static_id varchar2( 255 byte ),
	apex$row_sync_timestamp timestamp with time zone,
  file_dir  varchar2(260 char) generated always as ( '/' || substr( file_path, 1, instr( file_path, '/', - 1 ) ) ) virtual not null,
  file_name varchar2(260 char) generated always as ( substr( file_path, instr( file_path, '/', - 1 ) + 1 ) ) virtual not null,
  constraint blog_files_pk primary key( id ),
  constraint blog_files_uk1 unique( file_path ),
  constraint blog_files_ck1 check( row_version > 0 ),
  constraint blog_files_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_files_ck3 check( is_download in( 0, 1 ) ),
  constraint blog_files_ck4 check( is_download = 0 or is_download = 1 and file_desc is not null )
)
/
