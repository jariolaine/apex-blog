--------------------------------------------------------
--  DDL for Sequence BLOG_SEQ
--------------------------------------------------------
CREATE SEQUENCE "BLOG_SEQ"
minvalue 1
maxvalue 9999999999999999999999999999
increment by 1
start with 100001
/
--------------------------------------------------------
--  DDL for Type BLOG_T_POST
--------------------------------------------------------
CREATE OR REPLACE TYPE "BLOG_T_POST"
authid definer
as object(
  post_id     number(38,0),
  post_title  varchar2(256 char)
);
/
--------------------------------------------------------
--  DDL for Table BLOG_BLOGGERS
--------------------------------------------------------
create table blog_bloggers(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  blogger_name varchar2( 256 char ) not null,
  apex_username varchar2(  256 char ) not null,
  email varchar2( 256 char ),
  publish_desc number( 1, 0 ) not null,
  blogger_desc varchar2( 4000 byte ),
  show_desc number( 1, 0 ) as( is_active * publish_desc * case when blogger_desc is not null then 1 else 0 end ) virtual not null,
  constraint blog_bloggers_pk primary key( id ),
  constraint blog_bloggers_uk1 unique( apex_username ),
  constraint blog_bloggers_ck1 check( row_version > 0 ),
  constraint blog_bloggers_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_bloggers_ck3 check( display_seq > 0 ),
  constraint blog_bloggers_ck4 check( publish_desc in( 0 , 1 ) ),
  constraint blog_bloggers_ck5 check( show_desc in( 0 , 1 ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_CATEGORIES
--------------------------------------------------------
create table blog_categories(
  id number( 38, 0 ) not null,
  row_version number( 38 ,0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  title varchar2( 256 char ) not null,
  title_unique varchar2( 256 char ) as( upper( trim( title ) ) ) virtual not null,
  notes varchar2( 4000 byte ),
  constraint blog_categories_pk primary key( id ),
  constraint blog_categories_uk1 unique( title ),
  constraint blog_categories_uk2 unique( title_unique ),
  constraint blog_categories_ck1 check( row_version > 0 ),
  constraint blog_categories_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_categories_ck3 check( display_seq > 0 )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_COMMENTS
--------------------------------------------------------
create table blog_comments(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  post_id number( 38, 0 ) not null,
  parent_id number( 38, 0 ),
  comment_by varchar2( 256 char ) not null,
  body_html varchar2( 4000 byte ) not null,
  constraint blog_comments_pk primary key( id ),
  constraint blog_comment_ck1 check( row_version > 0 ),
  constraint blog_comment_ck2 check( is_active in( 0 , 1 ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_FLAGS
--------------------------------------------------------
create table blog_comment_flags (
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  comment_id number( 38, 0 ) not null,
  flag varchar2( 256 char ) not null,
  constraint blog_comment_flags_pk primary key( id ),
  constraint blog_comment_flags_uk1 unique( comment_id, flag ),
  constraint blog_comment_flags_ck1 check( row_version > 0 ),
  constraint blog_comment_flags_ck2 check( flag in( 'NEW', 'UNREAD', 'MODERATE' ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_COMMENT_SUBSCRIBERS
--------------------------------------------------------
create table blog_comment_subscribers(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  post_id number( 38, 0 ) not null,
  email_id number( 38, 0 ) not null,
  subscription_date date not null,
  constraint blog_comment_subscribers_pk primary key( id ),
  constraint blog_comment_subscribers_uk1 unique( post_id, email_id ),
  constraint blog_comment_subscribers_ck1 check( row_version > 0 ),
  constraint blog_comment_subscribers_ck2 check( is_active in( 0, 1 ) )
)
/
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
  file_name varchar2( 256 char ) not null,
  mime_type varchar2( 256 char ) not null,
  blob_content blob not null,
  file_size number( 38, 0 ) not null,
  file_charset varchar2( 256 char ),
  file_desc varchar2( 4000 byte ),
  notes varchar2( 4000 byte ),
  constraint blog_files_pk primary key( id ),
  constraint blog_files_uk1 unique( file_name  ),
  constraint blog_files_ck1 check( row_version > 0 ),
  constraint blog_files_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_files_ck3 check( is_download in( 0, 1 ) ),
  constraint blog_files_ck4 check( is_download = 0 or is_download = 1 and file_desc is not null )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_INIT_ITEMS
--------------------------------------------------------
create table blog_init_items(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  application_id number( 38,0 ) not null,
  item_name varchar2( 256 char ) not null,
  constraint blog_init_items_pk primary key( id ),
  constraint blog_init_items_uk1 unique( application_id, item_name ),
  constraint blog_init_items_ck1 check( row_version > 0 ),
  constraint blog_init_items_ck2 check( is_active in( 0, 1 ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_LINKS
--------------------------------------------------------
create table blog_links(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  link_group_id number not null,
  title varchar2( 256 char ) not null,
  link_desc varchar2( 4000 byte ) not null,
  link_url varchar2( 256 char ) not null,
  external_link number(1,0) not null,
  target_blank number(1,0) not null,
  notes varchar2( 4000 byte ),
  constraint blog_links_pk primary key( id ),
  constraint blog_links_uk1 unique( link_group_id, id ),
  constraint blog_links_ck1 check( row_version > 0 ),
  constraint blog_links_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_links_ck3 check( display_seq > 0 ),
  constraint blog_links_ck4 check( external_link in( 0, 1 ) ),
  constraint blog_links_ck5 check( target_blank in( 0, 1 ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_LINK_ROUPS
--------------------------------------------------------
create table blog_link_groups(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  title varchar2( 256 char ) not null,
  title_unique varchar2( 256 char ) as ( upper( title ) ) virtual not null,
  notes varchar2( 4000 byte ),
  constraint blog_link_groups_pk primary key( id ),
  constraint blog_link_groups_uk1 unique( title_unique ),
  constraint blog_link_groups_ck1 check( row_version > 0 ),
  constraint blog_link_groups_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_link_groups_ck3 check( display_seq > 0 )
)
/
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
  constraint blog_list_of_values_pk primary key( id ),
  constraint blog_list_of_values_uk1 unique( lov_name, return_value ),
  constraint blog_list_of_values_ck1 check( row_version > 0 ),
  constraint blog_list_of_values_ck2 check( is_active in( 0 , 1 ) ),
  constraint blog_list_of_values_ck3 check( display_seq > 0 )
)
/
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
--------------------------------------------------------
--  DDL for Table BLOG_POST_PREVIEW
--------------------------------------------------------
create table blog_post_preview(
  id number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone default localtimestamp not null,
  post_title varchar2( 256 char ),
  category_title varchar2( 256 char ),
  body_html clob,
  tags varchar2( 4000 byte ),
  constraint blog_post_preview_pk primary key( id )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_POST_TAGS
--------------------------------------------------------
create table blog_post_tags(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  display_seq number( 10, 0 ) not null,
  post_id number( 38, 0 ) not null,
  tag_id number( 38, 0 ) not null,
  constraint blog_post_tags_pk primary key( id ),
  constraint blog_post_tags_uk1 unique( post_id, tag_id ),
  constraint blog_post_tags_ck1 check( row_version > 0 ),
  constraint blog_post_tags_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_post_tags_ck3 check( display_seq > 0 )
)
/
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
  display_seq number( 10, 0 ) not null,
  is_nullable number( 1, 0 ) not null,
  attribute_group_message varchar2( 256 char ) not null,
  attribute_name varchar2( 128 char ) not null,
  data_type varchar2( 64 char ) not null,
  attribute_value varchar2( 4000 byte ),
  int_min number( 10,0 ),
  int_max number( 10,0 ),
  attribute_message varchar2( 256 char ) generated always as ( 'BLOG_SETTING_' || attribute_name ) virtual not null,
  help_message varchar2( 256 char ) generated always as ( 'BLOG_HELP_' || attribute_name ) virtual not null,
  constraint blog_settings_pk primary key( id ),
  constraint blog_settings_uk1 unique( attribute_name ),
  constraint blog_settings_ck1 check( row_version > 0 ),
  constraint blog_settings_ck2 check( is_nullable in( 0, 1 ) ),
  constraint blog_settings_ck3 check( display_seq > 0 ),
  constraint blog_settings_ck4 check( is_nullable = 1 or is_nullable = 0 and attribute_value is not null ),
  constraint blog_settings_ck5 check( data_type in( 'INTEGER', 'STRING', 'DATE_FORMAT', 'URL', 'EMAIL' ) ),
  constraint blog_settings_ck6 check(
    data_type != 'INTEGER' or
    data_type = 'INTEGER' and
    int_min is not null and
    int_max is not null and
    round( to_number( attribute_value ) ) = to_number( attribute_value ) and
    to_number( attribute_value ) between int_min and int_max
  ),
  constraint blog_settings_ck7 check(
    data_type != 'DATE_FORMAT' or
    data_type = 'DATE_FORMAT' and
    to_char( created_on, attribute_value ) is not null
  ),
  constraint blog_settings_ck8 check(
    data_type != 'URL' or
    data_type = 'URL' and
    regexp_like( attribute_value, '^https?\:\/\/.*$' )
  ),
  constraint blog_settings_ck9 check(
    data_type != 'EMAIL' or
    data_type = 'EMAIL' and
    regexp_like( attribute_value, '^.*\@.*\..*$' )
  )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_SUBSCRIBERS_EMAIL
--------------------------------------------------------
create table blog_subscribers_email(
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  email varchar2( 256 char ) not null,
  constraint blog_subscribers_email_pk primary key( id ),
  constraint blog_subscribers_email_uk1 unique( email ),
  constraint blog_subscribers_email_ck1 check( row_version > 0 ),
  constraint blog_subscribers_email_ck2 check( is_active in( 0, 1 ) ),
  constraint blog_subscribers_email_ck3 check( email = lower( trim( email ) ) )
)
/
--------------------------------------------------------
--  DDL for Table BLOG_TAGS
--------------------------------------------------------
create table blog_tags (
  id number( 38, 0 ) not null,
  row_version number( 38, 0 ) not null,
  created_on timestamp( 6 ) with local time zone not null,
  created_by varchar2( 256 char ) not null,
  changed_on timestamp( 6 ) with local time zone not null,
  changed_by varchar2( 256 char ) not null,
  is_active number( 1, 0 ) not null,
  tag varchar2( 256 char ) not null,
  tag_unique varchar2( 256 char ) as ( upper( trim( tag ) ) ) virtual not null,
  notes varchar2( 4000 byte ),
  constraint blog_tags_pk primary key( id ),
  constraint blog_tags_uk1 unique( tag ),
  constraint blog_tags_uk2 unique( tag_unique ),
  constraint blog_tags_ck1 check( row_version > 0 ),
  constraint blog_tags_ck2 check( is_active in( 0 , 1 ) )
)
/
create or replace package "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions for Oracle text
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.06.2020 - Created
--    Jari Laine 30.04.2022 - Changed procedure generate_post_datastore to use XML functions
--    Jari Laine 02.05.2022 - Improved text search query function get_post_search returns
--    Jari Laine 25.11.2022 - Changed generate_post_datastore remove HTML from post body
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid       in rowid,
    tlob      in out nocopy clob
  );
--------------------------------------------------------------------------------
  function get_post_search(
    p_search  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
create or replace package "BLOG_UTIL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for public application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 28.03.2020 - Signature 2 of get_year_month function
--    Jari Laine 15.04.2020 - function validate_comment
--    Jari Laine 26.04.2020 - Changed validate_comment us apex_util.savekey_vc2
--                            and removed custom functions that was doing same thing
--    Jari Laine 08.05.2020 - Functions get_year_month are obsolete
--                            application changed to group archives by year
--    Jari Laine 10.05.2020 - Procedure new_comment_notify to notify blogger about new comments
--                            Procedure subscribe to subscribe comment reply
--                            Procedure unsubscribe for unsubscribe comment reply
--    Jari Laine 11.05.2020 - Procedures and functions relating comments moved to package blog_comm
--    Jari Laine 17.05.2020 - Added out parameters p_older_title and p_newer_title to procedure get_post_pagination
--                            Materialized view blog_items_init changed to view
--                            Removed function get_item_init_value
--    Jari Laine 18.05.2020 - Moved ORDS specific global constants
--    Jari Laine 19.05.2020 - Changed apex_debug to warn in no_data_found exception handlers
--                            Changed apex_error_handler honor error display position when
--                            ORA error is between -20999 and 20901
--                            Changed procedure get_post_pagination to raises ORA -20901 when no data found
--    Jari Laine 19.05.2020 - Removed global constants
--    Jari Laine 23.05.2020 - Modifications to remove ORDS depency
--    Jari Laine 05.11.2020 - Procedure render_dynamic_content
--    Jari Laine 18.12.2021 - Procedure redirect_search
--    Jari Laine 24.03.2022 - Parameter names to apex_debug procedure calls
--                          - Changes to procedure get_post_pagination and render_dynamic_content
--    Jari Laine 25.03.2022 - Added more comments
--                          - Changed variable names to more descriptive
--                          - Removed obsolete procedure check_archive_exists
--    Jari Laine 19.04.2022 - Changes to procedures download_file
--    Jari Laine 26.04.2022 - Parameter p_escape to function get_tag
--    Jari Laine 03.08.2022 - Changed procedure render_dynamic_content to use apex_util.prn
--    Jari Laine 16.11.2022 - Removed obsolete function get_post_title
--    Jari Laine 21.11.2022 - Added DETERMINISTIC caluse to function int_to_vc2
--    Jari Laine 23.11.2022 - Changed procedures exception handling and removed some unnecessary calls to apex_debug
--                          - Renamed procedure get_post_pagination to get_post_details and added more out parameters
--    Jari Laine 24.11.2022 . Removed obsolete parameter p_escape from functions get_category_title and get_tag
--    Jari Laine 29.11.2022 - Published procedure raise_http_error to
--                          - Exception handler to procedures download_file
--                          - Moved logic to fetch next and previous post to view blog_v_posts from procedure get_post_details
--    Jari Laine 15.01.2023 - Removed obsolete procedure render_dynamic_content
--    Jari Laine 19.01.2023 - Changed procedure get_post_details parameter names
--                          - Added global constants
--                            - g_nls_date_lang
--                            - g_iso_8601_date
--                            - g_rfc_2822_date
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  g_nls_date_lang constant varchar2(30) := 'NLS_DATE_LANGUAGE = ENGLISH';
  g_iso_8601_date constant varchar2(39) := 'YYYY-MM-DD"T"HH24:MI:SS"Z"';
  g_rfc_2822_date constant varchar2(39) := 'Dy, DD Mon YYYY HH24:MI:SS "GMT"';
--------------------------------------------------------------------------------
  procedure raise_http_error(
    p_error_code  in number
  );
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application definition Error Handling Function
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
-- Called from:
--  inside package and from other packages
  function int_to_vc2(
    p_value           in number
  ) return varchar2 deterministic;
--------------------------------------------------------------------------------
-- Called from:
--  other packages, public and admin application
  function get_attribute_value(
    p_attribute_name  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public and admin application process Initialize Items
  procedure initialize_items(
    p_app_id          in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure get_post_details(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_post_desc       out nocopy varchar2,
    p_post_category   out nocopy varchar2,
    p_post_author     out nocopy varchar2,
    p_post_published  out nocopy varchar2,
    p_post_modified   out nocopy varchar2,
    p_next_post_id    out nocopy varchar2,
    p_next_post_title out nocopy varchar2,
    p_prev_post_id    out nocopy varchar2,
    p_prev_post_title out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 14 Pre-Rendering Computations
  function get_category_title(
    p_category_id     in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 6 Pre-Rendering Computations
  function get_tag(
    p_tag_id          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  inside package and package BLOG_XML
  procedure download_file (
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "download"
  procedure download_file (
    p_file_name       in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app application process Redirect to search page
  procedure redirect_search(
    p_value           in varchar2,
    p_app_id          in varchar2 default null,
    p_session         in varchar2 default null
  );
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
CREATE OR REPLACE package "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions for admin application
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 10.01.2020 - Added procedure merge_files and file_upload
--    Jari Laine 12.01.2020 - Added function prepare_file_path
--    Jari Laine 09.04.2020 - Handling tags case insensitive
--    Jari Laine 09.05.2020 - Procedures and functions number input parameters changed to varchar2
--                            New functions get_comment_post_id and is_email
--    Jari Laine 10.05.2020 - Procedure send_reply_notify to send notify on reply to comment
--    Jari Laine 12.05.2020 - Removed function prepare_file_path
--    Jari Laine 17.05.2020 - Removed parameter p_err_mesg from function get_first_paragraph,
--                            function is called now from APEX application conputation
--    Jari Laine 19.05.2020 - Removed obsolete function get_post_title
--    Jari Laine 24.05.2020 - Added procedures:
--                              run_settings_post_expression
--                              run_feature_post_expression
--                              update_feature
--    Jari Laine 22.06.2020 - Bug fix to function is_integer
--                            Added parameters p_min and p_max to function is_integer
--    Jari Laine 30.09.2020 - Added procedure google_post_authentication
--    Jari Laine 28.11.2020 - Removed obsolete function get_comment_post_id
--                            Renamed function google_post_authentication to post_authentication
--    Jari Laine 28.02.2020 - New function get_footer_link_seq
--    Jari Laine 23.05.2020 - Modifications to remove ORDS depency
--    Jari Laine 21.03.2021 - Changed procedure get_blogger_details fetch authorization group name stored to BLOG_SETTINGS table
--                            Added trim to function remove_whitespace
--                            Changed procedures add_category and add_tag use function remove_whitespace
--    Jari Laine 11.04.2021 - Procedure send_reply_notify moved to package BLOG_COMM
--    Jari Laine 13.04.2021 - Changes to procedure post_authentication
--                            Function get_footer_link_seq renamed to get_modal_page_seq
--                            Removed procedure run_feature_post_expression
--    Jari Laine 18.04.2021 - Function is_email moved to package BLOG_COMM
--    Jari Laine 05.01.2022 - Removed unused parameters and variables from procedures: post_authentication, update_feature, get_blogger_details and add_blogger
--    Jari Laine 27.03.2022 - Fixed bug on function get_first_paragraph when search nested elements
--                            Removed obsolete procedures remove_unused_tags, purge_post_preview, purge_post_preview_job and save_post_preview
--    Jari Laine 13.04.2022 - Bug fix to functions is_integer, is_url and is_date_format error message handling
--    Jari Laine 01.05.2022 - Simple logic to function request_to_post_status
--    Jari Laine 07.05.2022 - Added procedure remove_unused_tags and remove_unused_categories
--                            Chenged private procedure add_tag to public
--                            Removed obsolete functions get_post_tags and get_category_title
--                            New procedures:
--                              resequence_link_groups
--                              resequence_links
--                              resequence_categories
--                              resequence_tags
--    Jari Laine 09.05.2022 - Removed obsolete procedure run_settings_post_expression
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  admin app application authentication scheme Google
  procedure post_authentication;
--------------------------------------------------------------------------------
-- Called from:
--  admin app application processes
  procedure get_blogger_details(
    p_app_id          in varchar2,
    p_username        in varchar2,
    p_id              out nocopy number,
    p_name            out nocopy varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  function get_category_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20
  function get_link_grp_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page xx
  function get_modal_page_seq return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 18
  function get_link_seq(
    p_link_group_id   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function get_first_paragraph(
    p_body_html       in clob
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  function request_to_post_status(
    p_request         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 22 Processing process "Close Dialog" condition
  function file_upload(
    p_file_name       in varchar2,
    p_collection_name in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
--  inside procedudre blog_cm.get_first_paragraph
  function remove_whitespace(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 23 and procedure blog_cm.file_upload
  procedure merge_files(
    p_collection_name in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12 Processing process "Process Category"
  procedure add_category(
    p_title           in varchar2,
    p_category_id     out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure remove_unused_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 14
  procedure resequence_categories;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 24 and inside this package
  procedure add_tag(
    p_tag             in varchar2,
    p_tag_id          out nocopy number
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 12
  procedure add_post_tags(
    p_post_id         in varchar2,
    p_tags            in varchar2,
    p_sep             in varchar2 default ','
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 19
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 24
  procedure resequence_tags(
    p_post_id         in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is Integer"
  function is_integer(
    p_value           in varchar2,
    p_min             in number,
    p_max             in number,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is URL"
  function is_url(
    p_value           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20012 validation "Is date format"
  function is_date_format(
    p_value           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 20011 Processing process "Features - Save Interactive Grid Data"
  procedure update_feature(
    p_app_id          in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 17
  procedure resequence_link_groups;
--------------------------------------------------------------------------------
-- Called from:
--  admin app page 17
  procedure resequence_links(
    p_link_group_id in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_CM";
/
create or replace package "BLOG_PLUGIN"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions for APEX plugins
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 03.01.2020 - Comments to package specs
--    Jari Laine 13.04.2022 - Bug fix to procedure validate_math_question_field error message handling
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item    in apex_plugin.t_item,
    p_plugin  in apex_plugin.t_plugin,
    p_param   in apex_plugin.t_item_render_param,
    p_result  in out nocopy apex_plugin.t_item_render_result
  );
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_ajax_param,
    p_result  in out nocopy apex_plugin.t_item_ajax_result
  );
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item    in            apex_plugin.t_item,
    p_plugin  in            apex_plugin.t_plugin,
    p_param   in            apex_plugin.t_item_validation_param,
    p_result  in out nocopy apex_plugin.t_item_validation_result
  );
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
  create or replace package "BLOG_URL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Generate URL
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 09.05.2020 - Functions that are called only from APEX
--                            number return value and number input parameters changed to varchar2.
--                            Functions that are also used in query
--                            another signature with varchar2 input and return values created for APEX
--                            Added parameter p_canonical to functions returning URL
--    Jari Laine 10.05.2020 - New function get_unsubscribe
--    Jari Laine 19.05.2020 - Changed page and items name to "hard coded" values
--                            and removed global constants from blog_util package
--    Jari Laine 23.05.2020 - Removed default from function get_tab parameter p_app_page_id
--    Jari Laine 13.11.2021 - New funtions get_sitemap_index, get_rss and get get_rss_xsl
--    Jari Laine 18.12.2021 - Moved procedure redirect_search to package blog_util.
--    Jari Laine 14.03.2022 - New function get_canonical_host
--    Jari Laine 24.11.2022 - Hard coded values to package private constants
--                          - Removed not used parammeters from functions
--                          - New function get_dynamic_page
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--
  function get_canonical_host return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_html
  function get_tab(
    p_page            in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_comm, blog_xml
-- view blog_v_posts
  function get_post(
    p_post_id         in number,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_post(
    p_post_id         in varchar2,
    p_application     in varchar2 default null,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_categories
  function get_category(
    p_category_id     in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_category(
    p_category_id     in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_archive_year
  function get_archive(
    p_archive_id      in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_archive(
    p_archive_id      in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_xml and view blog_v_post_tags
  function get_tag(
    p_tag_id          in number,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_url
  function get_tag(
    p_tag_id          in varchar2,
    p_canonical       in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- view blog_v_dynamic_content
  function get_dynamic_page(
    p_content_id      in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_url, blog_xml
  function get_process(
    p_application     in varchar2 default null,
    p_process         in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- package blog_comm
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_html, blog_xml
-- Blog Administration > Lists > Public Application Links
  function get_rss(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
-- packages blog_xml
  function get_rss_xsl(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  Blog Administration > Lists > Public Application Links
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_URL";
/
create or replace package "BLOG_COMM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for post comments
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 11.05.2020 - Created
--    Jari Laine 11.04.2021 - New procedure reply_notify
--                            New functions validate_email and is_email_verified
--    Jari Laine 18.04.2021 - New functions is_email
--    Jari Laine 30.10.2021 - Removed functions validate_email and is_email_verified
--    Jari Laine 13.04.2022 - Posibility add multiple flags using procedure flag_comment
--                            Posibility remove multiple flags using procedure unflag_comment
--    Jari Laine 27.11.2022 - Changed procedure build_code_tab remove leading and trailing line breaks from posted code
--
--  TO DO:
--    #1  comment HTML validation should be improved
--    #2  email validation should be improved
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function format_comment(
    p_comment           in varchar2,
    p_remove_anchors    in boolean default false
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001
  function validate_comment(
    p_comment           in varchar2,
    p_max_length        in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from:
  --  public app page 1001 and admin app page 20012 validation
  function is_email(
    p_email             in varchar2,
    p_err_mesg          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure flag_comment(
    p_comment_id        in varchar2,
    p_flags             in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--
  procedure unflag_comment(
    p_comment_id        in varchar2,
    p_flags             in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure new_comment_notify(
    p_post_id           in varchar2,
    p_app_name          in varchar2,
    p_email_template    in varchar2
  );
--------------------------------------------------------------------------------
  -- Called from:
  --  admin app pages 32
  procedure reply_notify(
    p_app_id            in varchar2,
    p_app_name          in varchar2,
    p_post_id           in varchar2,
    p_email_template    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1001
  procedure subscribe(
    p_post_id           in varchar2,
    p_email             in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 2
  procedure unsubscribe(
    p_subscription_id   in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_COMM";
/
create or replace package "BLOG_HTML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Functions to generate and return HTML code
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.04.2019 - Created
--    Jari Laine 29.04.2020 - New function get_robots_noindex_meta
--                            Functions to generate canonical link outputs robot noindex meta tag
--                            if proper link can't be generated
--                            Added apex_debug to functions generating meta and canonical link
--    Jari Laine 10.05.2020 - Utilize blog_url functions p_canonical
--    Jari Laine 19.05.2020 - Removed obsolete function get_search_button
--    Jari Laine 06.07.2020 - Added parameter p_rss_url to functions get_rss_link and get_rss_anchor
--                            Removed parameter p_build_option_status from function get_rss_link
--    Jari Laine 13.11.2021 - Changes to funtion get_rss_anchor and get get_rss_link
--                          - Removed obsolete functions
--    Jari Laine 27.03.2022 - Added parameter p_build_option and p_message to function get_rss_link
--                          - Added parameter p_message to function get_rss_anchor
--    Jari Laine 27.04.2022 - Removed obsolete functions get_tag_anchor and get_post_tags
--    Jari Laine 16.11.2022 - Removed obsolete functions:
--                              - get_robots_noindex_meta
--                              - get_post_description_meta
--                              - get_description_meta
--    Jari Laine 25.11.2022 - Removed unused parameters
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAB
  function get_tab_canonical_link(
    p_page          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_POST
  function get_post_canonical_link(
    p_post_id       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY
  function get_category_canonical_link(
    p_category_id   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE
  function get_archive_canonical_link(
    p_archive_id    in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_CANONICAL_LINK_TAG
  function get_tag_canonical_link(
    p_tag_id        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_ANCHOR
  function get_rss_anchor(
    p_app_name      in varchar2,
    p_message       in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
-- Called from:
--  pub app shortcut BLOG_RSS_LINK
  function get_rss_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions to generate and output RSS feed and sitemap
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 07.05.2019 - Created
--    Jari Laine 08.01.2020 - Removed categories sitemap
--    Jari Laine 08.01.2020 - Modified use ORDS and blog version 4
--    Jari Laine 09.04.2020 - Utilize blog_url functions parameter p_canonical
--    Jari Laine 17.05.2020 - Removed private function get_app_alias
--                            and constant c_pub_app_id
--                            Moved private function get_ords_service to blog_ords package
--    Jari Laine 23.05.2020 - Changed procedure sitemap_main to use table blog_pages
--                            Modifications to remove ORDS depency
--                            New procedures:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_tags
--    Jari Laine 30.10.2021 - Changed procedure sitemap_main to use view apex_application_pages
--    Jari Laine 13.11.2021 - Changed procedure rss
--    Jari Laine 30.12.2021 - Changed procedure rss_xsl. CSS file name moved to application settings
--    Jari Laine 05.01.2021 - Added parameter p_css_file to procedure rss_xsl
--    Jari Laine 13.03.2022 - Added parameter p_process_nae to procedure sitemap_index
--                            Removed build option check from query producing XML in procedure sitemap_index
--    Jari Laine 19.04.2022 - Changes relating procedure blog_util.download_file
--    Jari Laine 26.04.2022 - Added element lastmod to XML to functions:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_tags
--    Jari Laine 28.04.2020 - Changed rss_xsl
--    Jari Laine 29.11.2022 - Removed parameter p_lang from procedure rss
--                          - Added exception handler that raise also HTTP error to procedures
--                          - Other minor changes
--    Jari Laine 19.01.2023 - Repved parameter p_ws_images from procedure rss_xsl
--                          - Removed parameter p_page_group from procedure sitemap_main
--                          - Replaced private constant c_pubdate_lang with blog.util.g_nls_date_lang
--                          - Replaced private constant c_lastmod_format with blog_util.g_iso_8601_date
--                          - Replaced private constant c_pubdate_format with blog_util.g_rfc_2822_date
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xml"
  procedure rss(
    p_app_name      in varchar2,
    p_app_desc      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xsl"
  procedure rss_xsl(
    p_css_file      in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-index.xml"
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-main.xml"
  procedure sitemap_main(
    p_app_id        in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-posts.xml"
  procedure sitemap_posts;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-categories.xml"
  procedure sitemap_categories;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-archives.xml"
  procedure sitemap_archives;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-tags.xml"
  procedure sitemap_tags;
--------------------------------------------------------------------------------
end "BLOG_XML";
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_CATEGORIES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_CATEGORIES" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "TITLE", "TITLE_UNIQUE", "NOTES", "POSTS_COUNT", "ALLOWED_ROW_OPERATION") AS
  select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.display_seq       as display_seq
  ,t1.title             as title
  ,t1.title_unique      as title_unique
  ,t1.notes             as notes
  ,(
    select count(l1.id)
    from blog_posts l1
    where 1 = 1
    and l1.category_id = t1.id
   )                    as posts_count
  ,case
    when exists(
      select 1
      from blog_posts l2
      where 1 = 1
      and l2.category_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_categories t1
/
--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_COMMENTS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "POST_ID", "PARENT_ID", "POST_TITLE", "BODY_HTML", "COMMENT_BY", "STATUS", "FLAG", "USER_ICON", "ICON_MODIFIER")  AS
  select
   t1.id            as id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_active     as is_active
  ,t1.post_id       as post_id
  ,t1.parent_id     as parent_id
  ,(
    select title
    from blog_posts l1
    where 1 = 1
    and l1.id = t1.post_id
   )                as post_title
  ,t1.body_html     as body_html
  ,t1.comment_by    as comment_by
  ,case
    when exists(
      select 1
      from blog_comment_flags f1
      where 1 = 1
        and f1.comment_id = t1.id
        and f1.flag = 'MODERATE'
    )
    then 'MODERATE'
    else
      case t1.is_active
        when 1
        then 'ENABLED'
        else 'DISABLED'
      end
   end              as status
   ,case
     when exists(
       select 1
       from blog_comment_flags f1
       where 1 = 1
         and f1.comment_id = t1.id
         and f1.flag = 'NEW'
     )
     then 'NEW'
     when exists(
       select 1
       from blog_comment_flags f1
       where 1 = 1
         and f1.comment_id = t1.id
         and f1.flag = 'UNREAD'
     )
     then 'UNREAD'
     when t1.parent_id is not null
     then 'REPLY'
     else 'READ'
    end              as flag
  ,apex_string.get_initials(
    t1.comment_by
  )                 as user_icon
  ,'u-color-' ||
  (
    ora_hash( lower( t1.comment_by ), 44 ) + 1
  )                 as icon_modifier
from blog_comments t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_DYNAMIC_CONTENT
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_DYNAMIC_CONTENT" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "CONTENT_TYPE", "DISPLAY_SEQ", "SHOW_CHANGED_ON", "CONTENT_DESC", "CONTENT_HTML") AS
  select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.content_type      as content_type
  ,t1.display_seq       as display_seq
  ,t1.show_changed_on   as show_changed_on
  ,t1.content_desc      as content_desc
  ,t1.content_html      as content_html
from blog_dynamic_content t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FEATURES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FEATURES" ("ID", "APPLICATION_ID", "BUILD_OPTION_ID", "BUILD_OPTION_NAME", "BUILD_OPTION_GROUP", "DISPLAY_SEQ", "FEATURE_NAME", "FEATURE_GROUP", "FEATURE_GROUP_SEQ", "BUILD_OPTION_STATUS", "LAST_UPDATED_ON", "LAST_UPDATED_BY", "IS_ACTIVE", "FEATURE_PARENT", "HELP_MESSAGE") AS
  select
   t2.id                        as id
  ,t1.application_id            as application_id
  ,t1.build_option_id           as build_option_id
  ,t2.build_option_name         as build_option_name
  ,t2.build_option_group        as build_option_group
  ,t2.display_seq               as display_seq
  ,apex_lang.message(
    p_name => t2.build_option_name
  )                             as feature_name
  ,apex_lang.message(
    p_name => t2.build_option_group
  )                             as feature_group
  ,min( t2.display_seq ) over(
    partition by t2.build_option_group
  )                             as feature_group_seq
  ,t1.build_option_status       as build_option_status
  ,t1.last_updated_on           as last_updated_on
  ,lower( t1.last_updated_by )  as last_updated_by
  ,t2.is_active                 as is_active
  ,t2.build_option_parent       as feature_parent
  ,regexp_replace(
    t2.build_option_name
    ,'^(BLOG)'
    ,'\1_HELP'
  )                             as help_message
from apex_application_build_options t1
join blog_features t2
  on t1.build_option_name = t2.build_option_name
where 1 = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FILES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FILES" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "IS_DOWNLOAD", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC", "NOTES") AS
  select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.is_download       as is_download
  ,t1.file_name         as file_name
  ,t1.mime_type         as mime_type
  ,t1.blob_content      as blob_content
  ,t1.file_size         as file_size
  ,t1.file_charset      as file_charset
  ,t1.file_desc         as file_desc
  ,t1.notes             as notes
from blog_files t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINKS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_LINKS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "LINK_GROUP_ID", "IS_ACTIVE", "LINK_GROUP_IS_ACTIVE", "DISPLAY_SEQ", "LINK_GROUP_DISPLAY_SEQ", "TITLE", "LINK_GROUP_TITLE", "LINK_DESC", "NOTES", "LINK_URL", "LINK_STATUS") AS
  select
   t1.id                        as id
  ,t1.row_version               as row_version
  ,t1.created_on                as created_on
  ,lower(t1.created_by)         as created_by
  ,t1.changed_on                as changed_on
  ,lower(t1.changed_by)         as changed_by
  ,t2.id                        as link_group_id
  ,t1.is_active                 as is_active
  ,t2.is_active                 as link_group_is_active
  ,t1.display_seq               as display_seq
  ,t2.display_seq               as link_group_display_seq
  ,t1.title                     as title
  ,t2.title                     as link_group_title
  ,t1.link_desc                 as link_desc
  ,t1.notes                     as notes
  ,t1.link_url                  as link_url
  ,case t2.is_active
   when 1
   then case t1.is_active
     when 1
     then 'ENABLED'
     else 'DISABLED'
     end
   else 'GROUP_DISABLED'
   end                          as link_status
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINK_GROUPS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_LINK_GROUPS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "TITLE", "TITLE_UNIQUE", "NOTES", "LINK_COUNT") AS
  select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.display_seq       as display_seq
  ,t1.title             as title
  ,t1.title_unique      as title_unique
  ,t1.notes             as notes
  ,(
    select count(l1.id)
    from blog_links l1
    where 1 = 1
    and l1.link_group_id = t1.id
   )                    as link_count
from blog_link_groups t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POST_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POST_TAGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG", "TAG_IS_ACTIVE") AS
  select
   t1.id                        as id
  ,t1.row_version               as row_version
  ,t1.created_on                as created_on
  ,lower(t1.created_by)         as created_by
  ,t1.changed_on                as changed_on
  ,lower(t1.changed_by)         as changed_by
  ,t1.is_active                 as is_active
  ,t1.post_id                   as post_id
  ,t1.tag_id                    as tag_id
  ,t1.display_seq               as display_seq
  ,(
    select lkp.tag
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag
  ,(
    select lkp.is_active
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag_is_active
from blog_post_tags t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_SETTINGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_SETTINGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_NULLABLE", "DISPLAY_SEQ", "ATTRIBUTE_NAME", "ATTRIBUTE_VALUE", "DATA_TYPE", "ATTRIBUTE_MESSAGE", "ATTRIBUTE_DESC", "ATTRIBUTE_GROUP_MESSAGE", "ATTRIBUTE_GROUP", "ATTRIBUTE_GROUP_SEQ", "INT_MIN", "INT_MAX", "HELP_MESSAGE") AS
  select
   t1.id                      as id
  ,t1.row_version             as row_version
  ,t1.created_on              as created_on
  ,lower(t1.created_by)       as created_by
  ,t1.changed_on              as changed_on
  ,lower(t1.changed_by)       as changed_by
  ,t1.is_nullable             as is_nullable
  ,t1.display_seq             as display_seq
  ,t1.attribute_name          as attribute_name
  ,t1.attribute_value         as attribute_value
  ,t1.data_type               as data_type
  ,t1.attribute_message       as attribute_message
  ,apex_lang.message(
    p_name => t1.attribute_message
  )                           as attribute_desc
  ,t1.attribute_group_message as attribute_group_message
  ,apex_lang.message(
    p_name => t1.attribute_group_message
  )                           as attribute_group
  ,(
    select min( lkp.display_seq )
    from blog_settings lkp
    where 1 = 1
      and lkp.attribute_group_message = t1.attribute_group_message
  )                           as attribute_group_seq
  ,t1.int_min                 as int_min
  ,t1.int_max                 as int_max
  ,t1.help_message            as help_message
from blog_settings t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_TAGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "TAG", "TAG_UNIQUE", "NOTES", "POSTS_COUNT", "ALLOWED_ROW_OPERATION") AS
  select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.tag               as tag
  ,t1.tag_unique        as tag_unique
  ,t1.notes             as notes
  ,(
    select count(l1.id)
    from blog_post_tags l1
    where 1 = 1
    and l1.tag_id = t1.id
   )                    as posts_count
  ,case
    when exists(
      select 1
      from blog_post_tags l2
      where 1 = 1
      and l2.tag_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_tags t1
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_BLOGGERS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_BLOGGERS" ("BLOGGER_ID", "DISPLAY_SEQ", "BLOGGER_NAME", "BLOGGER_DESC") AS
select t1.id        as blogger_id
  ,t1.display_seq   as display_seq
  ,t1.blogger_name  as blogger_name
  ,t1.blogger_desc  as blogger_desc
from blog_bloggers t1
where 1 = 1
and t1.show_desc = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_COMMENTS" ("COMMENT_ID", "IS_ACTIVE", "POST_ID", "PARENT_ID", "CREATED_ON", "COMMENT_BY", "COMMENT_BODY", "USER_ICON", "ICON_MODIFIER") AS
  select
   t1.id          as comment_id
  ,t1.is_active   as is_active
  ,t1.post_id     as post_id
  ,t1.parent_id   as parent_id
  ,t1.created_on  as created_on
  ,t1.comment_by  as comment_by
  ,t1.body_html   as comment_body
  ,apex_string.get_initials(
    t1.comment_by
  )               as user_icon
  ,'u-color-'
  || (
   ora_hash( lower( t1.comment_by ), 44 ) + 1
  )               as icon_modifier
from blog_comments t1
where 1 = 1
  and t1.is_active = 1
  and not exists(
    select 1
    from blog_comment_flags x1
    where 1 = 1
      and x1.comment_id = t1.id
      and x1.flag = 'MODERATE'
  )
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_DYNAMIC_CONTENT
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_DYNAMIC_CONTENT" ("CONTENT_ID", "CONTENT_TYPE", "CHANGED_ON", "DISPLAY_SEQ", "SHOW_CHANGED_ON", "CONTENT_DESC", "CONTENT_HTML", "CONTENT_URL") AS
  select
   t1.id              as content_id
  ,t1.content_type    as content_type
  ,t1.changed_on      as changed_on
  ,t1.display_seq     as display_seq
  ,t1.show_changed_on as show_changed_on
  ,t1.content_desc    as content_desc
  ,t1.content_html    as content_html
  ,blog_url.get_dynamic_page(
    p_content_id => t1.id
  )                   as content_url
from blog_dynamic_content t1
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_FILES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_FILES" ("FILE_ID", "ROW_VERSION", "CREATED_ON", "CHANGED_ON", "IS_DOWNLOAD", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC") AS
select
   t1.id            as file_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.changed_on    as changed_on
  ,t1.is_download   as is_download
  ,t1.file_name     as file_name
  ,t1.mime_type     as mime_type
  ,t1.blob_content  as blob_content
  ,t1.file_size     as file_size
  ,t1.file_charset  as file_charset
  ,t1.file_desc     as file_desc
from blog_files t1
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_INIT_ITEMS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_INIT_ITEMS" ("APPLICATION_ID", "ITEM_NAME", "ITEM_VALUE") AS
  select
   i.application_id   as application_id
  ,i.item_name        as item_name
  ,s.attribute_value  as item_value
from blog_init_items i
join blog_settings s
  on i.item_name = s.attribute_name
where 1 = 1
and i.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_LINKS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_LINKS" ("LINK_ID", "GROUP_ID", "GROUP_TITLE", "GROUP_DISPLAY_SEQ", "DISPLAY_SEQ", "LINK_TITLE", "LINK_DESC", "LINK_URL", "LINK_ATTR") AS
  select
   t1.id          as link_id
  ,t2.id          as group_id
  ,t2.title       as group_title
  ,t2.display_seq as group_display_seq
  ,t1.display_seq as display_seq
  ,t1.title       as link_title
  ,t1.link_desc   as link_desc
  ,t1.link_url    as link_url
  ,case external_link + target_blank
    when 2
    then 'target="_blank" rel="external"'
    when 1
    then
      case external_link
      when 1
      then 'rel="external"'
      else 'target="_blank"'
    end
  end as
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_LOV
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_LOV" ("LOV_NAME", "DISPLAY_SEQ", "RETURN_VALUE", "DISPLAY_MESSAGE", "DISPLAY_VALUE") AS
  select
   t1.lov_name                              as lov_name
  ,t1.display_seq                           as display_seq
  ,t1.return_value                          as return_value
  ,t1.display_message                       as display_message
  ,apex_lang.message( t1.display_message )  as display_value
from blog_list_of_values t1
where 1 = 1
and t1.is_active = 1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POST_TAGS" ("POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG", "CHANGED_ON", "TAG_URL", "TAG_HTML1", "TAG_HTML2", "TAG_HTML3") AS
with q1 as(
  select
     t2.post_id     as post_id
    ,t2.tag_id      as tag_id
    ,t2.display_seq as display_seq
    ,t1.tag         as tag
    ,greatest(
       t1.changed_on
      ,t2.changed_on
    )               as changed_on
  -- Generate tag URL
    ,blog_url.get_tag(
      p_tag_id => t1.id
    )               as tag_url
  -- Generate HTML for tags used in APEX reports
    ,xmlelement( "span"
      ,xmlattributes(
        't-Icon fa fa-tag'  as "class"
        ,'true'             as "aria-hidden"
      )
    )               as tag_icon
    ,xmlelement( "span"
      ,xmlattributes(
        't-Button-label'    as "class"
      )
      ,t1.tag
    )               as tag_label
  -- Tag CSS class
    ,'t-Button t-Button--icon t-Button--large t-Button--noUI t-Button--iconLeft' as tag_class
  from blog_tags t1
  join blog_post_tags t2 on t1.id = t2.tag_id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
)
select
   q1.post_id                         as post_id
  ,q1.tag_id                          as tag_id
  ,q1.display_seq                     as display_seq
  ,q1.tag                             as tag
  ,q1.changed_on                      as changed_on
  ,q1.tag_url                         as tag_url
-- Generate HTML for tags used in APEX reports
  ,xmlelement( "a"
    ,xmlattributes(
      q1.tag_url        as "href"
      ,'z-search--tags' as "class"
    )
    ,q1.tag
  )                                   as tag_html1
  ,xmlelement( "a"
    ,xmlattributes(
       q1.tag_url       as "href"
      ,q1.tag_class     as "class"
      ,'tag'            as "rel"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                   as tag_html2
  ,xmlelement( "span"
    ,xmlattributes(
      q1.tag_class      as "class"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                    as tag_html3
from q1
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POSTS" ("ID", "CATEGORY_ID", "BLOGGER_ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "BLOGGER_NAME", "BLOGGER_EMAIL", "CATEGORY_TITLE", "TITLE", "POST_DESC", "BODY_HTML", "BODY_LENGTH", "PUBLISHED_ON", "NOTES", "CTX_RID", "PUBLISHED_DISPLAY", "TAG_ID", "POST_TAGS", "VISIBLE_TAGS", "HIDDEN_TAGS", "COMMENTS_COUNT", "PUBLISHED_COMMENTS_COUNT", "UNREAD_COMMENTS_COUNT", "MODERATE_COMMENTS_COUNT", "DISABLED_COMMENTS_COUNT", "POST_STATUS", "TAGS_HTML") AS
select
   t1.id                as id
  ,t1.category_id       as category_id
  ,t1.blogger_id        as blogger_id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t3.blogger_name      as blogger_name
  ,t3.email             as blogger_email
  ,t2.title             as category_title
  ,t1.title             as title
  ,t1.post_desc         as post_desc
  ,t1.body_html         as body_html
  ,t1.body_length       as body_length
  ,t1.published_on      as published_on
  ,t1.notes             as notes
  ,t1.rowid             as ctx_rid
  ,case t1.is_active * t2.is_active * t3.is_active
    when 1
    then t1.published_on
   end                  as published_display
   ,(
     select listagg( tags.tag_id, ':' )  within group( order by tags.display_seq )
     from blog_v_all_post_tags tags
     where 1 = 1
     and tags.post_id = t1.id
   )                     as tag_id
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
  )                     as post_tags
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
    and tags.is_active * tags.tag_is_active = 1
  )                     as visible_tags
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
    and tags.is_active * tags.tag_is_active = 0
  )                     as hidden_tags
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
  )                     as comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.is_active = 1
    and co.post_id  = t1.id
  )                     as published_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag in( 'NEW', 'UNREAD' )
      and x1.comment_id = co.id
    )
  )                     as unread_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                     as moderate_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and co.is_active = 0
    and not exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                     as disabled_comments_count
  ,case
    when t3.is_active = 0
    then 'BLOGGER_DISABLED'
    when t2.is_active = 0
    then 'CATEGORY_DISABLED'
    when t1.is_active = 0
    then 'DRAFT'
    when t1.published_on > localtimestamp
    then 'SCHEDULED'
    else 'PUBLISHED'
  end                   as post_status
-- Post tags for detail view
  ,(
    select
      xmlserialize(
        content xmlagg( lkp1.tag_html3 order by lkp1.display_seq )
      )
    from blog_v_post_tags lkp1
    where 1 = 1
      and lkp1.post_id = t1.id
  )                     as tags_html
from blog_posts t1
join blog_categories t2
  on t1.category_id = t2.id
join blog_bloggers t3
  on t1.blogger_id = t3.id
where 1 = 1
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS" ("POST_ID", "CATEGORY_ID", "BLOGGER_ID", "BLOGGER_NAME", "POST_TITLE", "CATEGORY_TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "PUBLISHED_ON", "CHANGED_ON", "ARCHIVE_YEAR", "CATEGORY_SEQ", "POST_URL", "TAGS_HTML1", "TAGS_HTML2", "TXT_POSTED_BY", "TXT_POSTED_ON", "TXT_CATEGORY", "TXT_READ_MORE", "TXT_TAGS", "NEXT_POST", "PREV_POST") AS
with q1 as(
  select
     t1.id              as post_id
    ,t3.id              as category_id
    ,t2.id              as blogger_id
    ,t2.blogger_name    as blogger_name
    ,t1.title           as post_title
    ,t3.title           as category_title
    ,t1.post_desc       as post_desc
    ,t1.first_paragraph as first_paragraph
    ,t1.body_html       as body_html
    ,t1.published_on    as published_on
    ,greatest(
       t1.published_on
      ,t1.changed_on
    )                   as changed_on
    ,t1.archive_year    as archive_year
    ,t3.display_seq     as category_seq
  -- Generate post URL
    ,blog_url.get_post(
      p_post_id => t1.id
    )                   as post_url
  -- Aggregate tag HTML for post
    ,(
      select
        xmlserialize(
          content xmlagg( lkp_tag.tag_html1 order by lkp_tag.display_seq )
        ) as tags_html
      from blog_v_post_tags lkp_tag
      where 1 = 1
        and lkp_tag.post_id = t1.id
    )                   as tags_html1
    ,(
      select
        xmlserialize(
          content xmlagg( lkp_tag.tag_html2 order by lkp_tag.display_seq )
        ) as tags_html
      from blog_v_post_tags lkp_tag
      where 1 = 1
        and lkp_tag.post_id = t1.id
    )                   as tags_html2
  from blog_posts t1
  join blog_bloggers t2
    on t1.blogger_id  = t2.id
  join blog_categories t3
    on t1.category_id = t3.id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
    and t3.is_active = 1
    and t1.published_on <= current_timestamp
)
select
   q1.post_id         as post_id
  ,q1.category_id     as category_id
  ,q1.blogger_id      as blogger_id
  ,q1.blogger_name    as blogger_name
  ,q1.post_title      as post_title
  ,q1.category_title  as category_title
  ,q1.post_desc       as post_desc
  ,q1.first_paragraph as first_paragraph
  ,q1.body_html       as body_html
  ,q1.published_on    as published_on
  ,q1.changed_on      as changed_on
  ,q1.archive_year    as archive_year
  ,q1.category_seq    as category_seq
  ,q1.post_url        as post_url
  ,q1.tags_html1      as tags_html1
  ,q1.tags_html2      as tags_html2
-- text, label etc. for APEX reports
  ,txt.posted_by      as txt_posted_by
  ,txt.posted_on      as txt_posted_on
  ,txt.category       as txt_category
  ,txt.read_more      as txt_read_more
  ,case
    when q1.tags_html1 is not null
    then txt.tags
  end                 as txt_tags
-- Fetch next post id and title
  ,(
    select
      blog_t_post(
         lkp_post.post_id
        ,lkp_post.post_title
      ) as post
    from q1 lkp_post
    where 1 = 1
      and lkp_post.published_on >= q1.published_on
      and lkp_post.post_id != q1.post_id
    order by lkp_post.published_on asc, lkp_post.post_id asc
    fetch first 1 rows only
  )                   as next_post
-- Fetch previous post id and title
  ,(
    select
      blog_t_post(
         lkp_post.post_id
        ,lkp_post.post_title
      ) as post
    from q1 lkp_post
    where 1 = 1
      and lkp_post.published_on <= q1.published_on
      and lkp_post.post_id != q1.post_id
    order by lkp_post.published_on desc, lkp_post.post_id desc
    fetch first 1 rows only
  )                   as prev_post
from q1
-- Fetch APEX messages
cross join(
  select
     apex_lang.message( 'BLOG_TXT_POSTED_BY' )  as posted_by
    ,apex_lang.message( 'BLOG_TXT_POSTED_ON' )  as posted_on
    ,apex_lang.message( 'BLOG_TXT_CATEGORY' )   as category
    ,apex_lang.message( 'BLOG_TXT_TAGS' )       as tags
    ,apex_lang.message( 'BLOG_TXT_READ_MORE' )  as read_more
  from dual
) txt
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR" ("ARCHIVE_YEAR", "POST_COUNT", "CHANGED_ON", "ARCHIVE_URL", "SHOW_POST_COUNT") AS
select
   v1.archive_year      as archive_year
  ,count( v1.post_id )  as post_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_archive(
    p_archive_id => v1.archive_year
  )                     as archive_url
  ,feat.show_post_count as show_post_count
from blog_v_posts v1
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_ARCHIVE_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.archive_year
  ,feat.show_post_count
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_CATEGORIES" ("CATEGORY_ID", "CATEGORY_TITLE", "DISPLAY_SEQ", "POSTS_COUNT", "CHANGED_ON", "CATEGORY_URL", "SHOW_POST_COUNT") AS
  select
   v1.category_id       as category_id
  ,v1.category_title    as category_title
  ,v1.category_seq      as display_seq
  ,count( v1.post_id )  as posts_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_category(
    p_category_id => v1.category_id
  )                     as category_url
  ,feat.show_post_count as show_post_count
from blog_v_posts v1
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_CATEGORY_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.category_id
  ,v1.category_title
  ,v1.category_seq
  ,feat.show_post_count
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST20
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_LAST20" ("DISPLAY_SEQ", "POST_ID", "PUBLISHED_ON", "BLOGGER_NAME", "POST_TITLE", "POST_DESC", "CATEGORY_TITLE", "POST_URL") AS
  select
   rownum             as display_seq
  ,q1.post_id         as post_id
  ,q1.published_on    as published_on
  ,q1.blogger_name    as blogger_name
  ,q1.post_title      as post_title
  ,q1.post_desc       as post_desc
  ,q1.category_title  as category_title
  ,q1.post_url        as post_url
from (
  select --+ first_rows(20)
     v1.post_id
    ,v1.published_on
    ,v1.blogger_name
    ,v1.post_title
    ,v1.post_desc
    ,v1.category_title
    ,v1.post_url
  from blog_v_posts v1
  order by v1.published_on desc
) q1
where 1 = 1
  and rownum <= 20
with read only
/
--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_TAGS" ("TAG_ID", "TAG", "TAG_URL", "POSTS_COUNT", "CHANGED_ON", "TAG_BUCKET", "SHOW_POST_COUNT") AS
  select
   v1.tag_id            as tag_id
  ,v1.tag               as tag
  ,v1.tag_url           as tag_url
  ,count( v1.post_id )  as posts_count
  ,max(
    greatest(
       v1.changed_on
      ,v2.changed_on
    )
  )                     as changed_on
  ,width_bucket(
     count( v1.post_id )
    ,min( count( v1.post_id ) ) over()
    ,max( count( v1.post_id ) ) over()
    ,7
  )                     as tag_bucket
  ,feat.show_post_count as show_post_count
from blog_v_post_tags v1
join blog_v_posts v2 on v1.post_id = v2.post_id
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.tag_id
  ,v1.tag
  ,v1.tag_url
  ,feat.show_post_count
with read only
/
--------------------------------------------------------
--  DDL for Trigger BLOG_BLOGGERS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_BLOGGERS_TRG"
before
insert or
update on blog_bloggers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_CATEGORIES_TRG"
before
insert or
update on blog_categories
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENTS_TRG"
before
insert or
update on blog_comments
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENT_FLAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE TRIGGER "BLOG_COMMENT_FLAGS_TRG"
before
insert or
update on blog_comment_flags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENT_SUBSCRIBERS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT_SUBSCRIBERS_TRG"
before
insert or
update on blog_comment_subscribers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_DYNAMIC_CONTENT_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_DYNAMIC_CONTENT_TRG"
before
insert or
update on blog_dynamic_content
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_FEATURES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FEATURES_TRG"
before
insert or
update on blog_features
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_FILES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FILES_TRG"
before
insert or
update on blog_files
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

  :new.file_size := sys.dbms_lob.getlength( :new.blob_content );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_INIT_ITEMS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_INIT_ITEMS_TRG"
before
insert or
update on blog_init_items
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LINKS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINKS_TRG"
before
insert or
update on blog_links
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LINK_GROUPS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINK_GROUPS_TRG"
before
insert or
update on blog_link_groups
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_LIST_OF_VALUES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LIST_OF_VALUES_TRG"
before
insert or
update on blog_list_of_values
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_TRG"
before
insert or
update on blog_posts
for each row
begin

  if inserting then
    :new.id           := coalesce(
        :new.id
      , to_number( to_char( sys_extract_utc( localtimestamp ), 'YYYYMMDDHH24MISSFF6' ) )
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_TAGS_TRG"
before
insert or
update on blog_post_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"
after
update on blog_categories
for each row
begin

  -- if category change update post user datastore table
  if :new.title != :old.title
  then

    update blog_posts t1
      set title = title
    where 1 = 1
      and t1.category_id = :new.id
    ;

  end if;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POST_TAGS_TRG"
for
insert or
update or
delete on blog_post_tags
compound trigger

  t_post_id apex_t_number;

  after each row is
  begin

    if deleting
    then

      apex_string.push( t_post_id, :old.post_id );

    else

      update blog_posts t1
        set title = title
      where 1 = 1
        and t1.id = :new.post_id
      ;

    end if;

  end after each row;

  after statement is
  begin

    update blog_posts t1
      set title = title
    where 1 = 1
      and exists(
        select 1
        from table( t_post_id ) x1
        where 1 = 1
          and x1.column_value = t1.id
      )
    ;

  end after statement;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"
after
update on blog_tags
for each row
begin

  if :new.tag != :old.tag
  or :new.is_active != :old.is_active
  then

    update blog_posts t1
      set title = title
    where 1 = 1
    and exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
        and x1.post_id = t1.id
        and x1.tag_id  = :new.id
      )
    ;

  end if;

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_SETTINGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SETTINGS_TRG"
before
insert or
update on blog_settings
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_SUBSCRIBERS_EMAIL_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SUBSCRIBERS_EMAIL_TRG"
before
insert or
update on blog_subscribers_email
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
--------------------------------------------------------
--  DDL for Trigger BLOG_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_TAGS_TRG"
before
insert or
update on blog_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );
  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

end;
/
create or replace package body "BLOG_CTX"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  )
  as
  begin

    select
      xmlserialize( content
        xmlconcat(
           xmlelement( "title", v1.title )
          ,xmlelement( "category", v1.category_title )
          ,xmlelement( "description", v1.post_desc )
          ,xmlelement( "body", apex_escape.striphtml( v1.body_html ) )
          ,xmlelement( "tags", v1.visible_tags )
        )
      )
    into tlob
    from blog_v_all_posts v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_search(
    p_search in varchar2
  ) return varchar2
  as
    c_xml constant varchar2(32767)
      := '<query><textquery><progression>'
      ||    '<seq>#NORMAL#</seq>'
      ||    '<seq>#WILDCARD#</seq>'
      ||    '<seq>#FUZZY#</seq>'
      || '</progression></textquery></query>'
    ;

    l_search    varchar2(32767);
    l_tokens    apex_t_varchar2;

    function generate_query(
      p_feature in varchar2,
      p_combine in varchar2 default null
    ) return varchar2
    as
      l_token   varchar2(32767);
      l_query   varchar2(32767);
    begin

      for i in 1 .. l_tokens.count
      loop

        l_token := trim( l_tokens(i) );

        if l_token is not null
        then

            l_query :=
              apex_string.format(
                p_message =>
                  case p_feature
                  when 'FUZZY' then '%s fuzzy({%s}, 55, 500) %s '
                  when 'WILDCARD' then '%s {%s}%% %s '
                  else '%s {%s} %s ' end
                ,p0 => l_query
                ,p1 => l_token
                ,p2 => case p_combine when 'OR' then 'or' else 'and' end
              )
            ;

        end if;

      end loop;

      if p_combine = 'AND' then
          l_query := substr( l_query, 1, length( l_query ) - 5 );
      else
          l_query := substr( l_query, 1, length( l_query ) - 4 );
      end if;

      return trim( l_query );

    end generate_query;

  begin

    if substr( p_search, 1, 8 ) = 'ORATEXT:'
    then
      l_search := substr( p_search, 9 );
    else

      -- remove special characters; irrelevant for full text search
      l_search := trim( regexp_replace( lower( p_search ), '[<>{}/()*%&!$?.:,;\+#]' ) );

      if l_search is not null
      then

        l_tokens := apex_string.split( l_search, ' ' );

        l_search := c_xml;
        l_search := replace( l_search, '#NORMAL#', generate_query( 'NORMAL' ) );
        l_search := replace( l_search, '#WILDCARD#', generate_query( 'WILDCARD' ) );
        l_search := replace( l_search, '#FUZZY#', generate_query( 'FUZZY' ) );

      end if;

    end if;

    return l_search;

  end get_post_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
create or replace package body "BLOG_UTIL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure raise_http_error(
    p_error_code  in number
  )
  as
  begin
    -- output HTTP status
    owa_util.status_line( p_error_code );
    -- stop APEX
    apex_application.stop_apex_engine;
  end raise_http_error;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function apex_error_handler(
    p_error in apex_error.t_error
  ) return apex_error.t_error_result
  as
    l_genereric_error constant varchar2(255) := 'BLOG_GENERIC_ERROR';

    l_result          apex_error.t_error_result;
    l_reference_id    pls_integer;
    l_constraint_name varchar2(255);
    l_err_mesg        varchar2(32700);

  begin

    -- This function must be used to ensure initialization is compatible
    -- with future changes to t_error_result.
    l_result :=
      apex_error.init_error_result(
        p_error => p_error
      );

    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then

      if not p_error.is_common_runtime_error then
        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.
        l_result.message := apex_lang.message(
          p_name => l_genereric_error
        );
        l_result.additional_info := null;
      end if;

    else

      -- Don't change display position for specific ORA eror codes
      if not p_error.ora_sqlcode between -20999 and -20901
      then
        -- Always show the error as inline error
        l_result.display_location := case
          when l_result.display_location = apex_error.c_on_error_page
          then apex_error.c_inline_in_notification
          else l_result.display_location
          end
       ;
      end if;

      -- If it's a constraint violation like
      --
      --   -) ORA-02292 ORA-02291 ORA-02290 ORA-02091 ORA-00001: unique constraint violated
      --   -) : transaction rolled back (-> can hide a deferred constraint)
      --   -) : check constraint violated
      --   -) : integrity constraint violated - parent key not found
      --   -) : integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from our constraint lookup configuration.
      -- If we don't find the constraint in our lookup table we fallback to
      -- the original ORA error message.

      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then

        l_constraint_name :=
          apex_error.extract_constraint_name(
            p_error => p_error
          );

        l_err_mesg := apex_lang.message(
          p_name => l_constraint_name
        );

        -- not every constraint has to be in our lookup table
        if not l_err_mesg = l_constraint_name then
          l_result.message := l_err_mesg;
          l_result.additional_info := null;
        end if;

      end if;

      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
      -- in a table trigger or in a PL/SQL package called by a process and we
      -- haven't found the error in our lookup table, then we just want to see
      -- the actual error text and not the full error stack with all the ORA error numbers.
      if p_error.ora_sqlcode is not null
      and l_result.message = p_error.message
      then
        l_result.message :=
          apex_error.get_first_ora_error_text (
            p_error => p_error
          );
        l_result.additional_info := null;
      end if;

      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      if l_result.page_item_name is null
      and l_result.column_alias is null then

        apex_error.auto_set_associated_item (
           p_error => p_error
          ,p_error_result => l_result
        );

      end if;

    end if;

    return l_result;

  end apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function int_to_vc2(
    p_value in number
  ) return varchar2
  as
  begin
    -- convert number to string without decimals
    return to_char( p_value,  'fm99999999999999999999999999999999999999' );
  end int_to_vc2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_attribute_value(
    p_attribute_name in varchar2
  ) return varchar2
  as
    l_value blog_settings.attribute_value%type;
  begin

    -- raise no data found error if parameter p_attribute_name is null
    if p_attribute_name is null then
      raise no_data_found;
    end if;

    -- fetch and return value from settings table
    select attribute_value
    into l_value
    from blog_settings
    where attribute_name = p_attribute_name
    ;

    apex_debug.info(
      p_message => 'Fetch attribute %s return: %s'
      ,p0 => p_attribute_name
      ,p1 => l_value
    );

    -- return attribute value
    return l_value;

  -- Handle error cases
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_attribute_name'
      ,p3 => coalesce( p_attribute_name, '(null)' )
    );
    raise;

  end get_attribute_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure initialize_items(
    p_app_id in varchar2
  )
  as
    l_app_id number;
  begin

    -- raise no data found error if parameter p_app_id_name is null
    if p_app_id is null then
      raise no_data_found;
    end if;

    -- conver application id string to number
    l_app_id := to_number( p_app_id );

    -- set items session state
    -- fetch items and values that session state need to be set
    for c1 in (
      select
        i.item_name,
        i.item_value
      from blog_v_init_items i
      where i.application_id = l_app_id
    ) loop

      -- set item session state and no commit
      apex_util.set_session_state(
        p_name    => c1.item_name
        ,p_value  => c1.item_value
        ,p_commit => false
      );

    end loop;

  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s. %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_app_id'
      ,p3 => coalesce( p_app_id, '(null)' )
    );

    raise;

  end initialize_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_post_details(
    p_post_id         in varchar2,
    p_post_title      out nocopy varchar2,
    p_post_desc       out nocopy varchar2,
    p_post_category   out nocopy varchar2,
    p_post_author     out nocopy varchar2,
    p_post_published  out nocopy varchar2,
    p_post_modified   out nocopy varchar2,
    p_next_post_id    out nocopy varchar2,
    p_next_post_title out nocopy varchar2,
    p_prev_post_id    out nocopy varchar2,
    p_prev_post_title out nocopy varchar2
  )
  as
    l_post_id       number;
    l_next          blog_t_post;
    l_prev          blog_t_post;
    l_published_on  blog_v_posts.published_on%type;
    l_changed_on    blog_v_posts.changed_on%type;
  begin

    -- raise no data found error if parameter p_post_id is null
    if p_post_id is null then
      raise no_data_found;
    end if;

    -- conver post id string to number
    l_post_id := to_number( p_post_id );

    -- fetch post title and description by post id
    -- also fetch prev and next post id and title
    select
      v1.post_title
      ,v1.post_desc
      ,v1.category_title
      ,v1.blogger_name
      ,v1.published_on
      ,v1.changed_on
      ,v1.next_post
      ,v1.prev_post
    into p_post_title
      ,p_post_desc
      ,p_post_category
      ,p_post_author
      ,l_published_on
      ,l_changed_on
      ,l_next
      ,l_prev
    from blog_v_posts v1
    where 1 = 1
      and post_id = l_post_id
    ;

    -- set procedure out parameters
    p_next_post_id    := int_to_vc2( l_next.post_id );
    p_next_post_title := l_next.post_title;
    p_prev_post_id    := int_to_vc2( l_prev.post_id );
    p_prev_post_title := l_prev.post_title;
    -- Get post published and modified UTC time
    p_post_published := to_char(
       sys_extract_utc( l_published_on )
      ,g_iso_8601_date
      ,g_nls_date_lang
    );
    p_post_modified := to_char(
       sys_extract_utc( l_changed_on )
      ,g_iso_8601_date
      ,g_nls_date_lang
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_post_id'
      ,p3 => coalesce( p_post_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_post_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_title(
    p_category_id in varchar2
  ) return varchar2
  as
    l_category_id   number;
    l_category_name blog_v_categories.category_title%type;
  begin

    -- raise no data found error if parameter p_category_id is null
    if p_category_id is null then
      raise no_data_found;
    end if;

    -- conver category id string to number
    l_category_id := to_number( p_category_id );

    -- fetch category name
    select v1.category_title
    into l_category_name
    from blog_v_categories v1
    where v1.category_id = l_category_id
    ;

    -- return category name
    return l_category_name;

  -- handle errors
  exception
  when others then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s, %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_category_id'
      ,p3 => coalesce( p_category_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_category_title;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_tag_id    number;
    l_tag_name  blog_v_tags.tag%type;
  begin

    -- raise no data found error if parameter p_tag_id is null
    if p_tag_id is null then
      raise no_data_found;
    end if;

    -- conver tag id string to number
    l_tag_id := to_number( p_tag_id );

    -- fetch tag name
    select t1.tag
    into l_tag_name
    from blog_v_tags t1
    where 1 = 1
    and t1.tag_id = l_tag_id
    ;

    -- return category name
    return l_tag_name;

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => 'Error: %s %s( %s => %s )'
      ,p0 => sqlerrm
      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p2 => 'p_tag_id'
      ,p3 => coalesce( p_tag_id, '(null)' )
    );

    -- show http error
    raise_http_error( 404 );
    raise;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file (
    p_blob_content    in out nocopy blob,
    p_mime_type       in varchar2,
    p_header_names    in apex_t_varchar2,
    p_header_values   in apex_t_varchar2,
    p_charset         in varchar2 default null
  )
  as
  begin

    -- init HTTP buffer
    --sys.htp.flush;
    --sys.htp.init;

    -- open HTTP header
    sys.owa_util.mime_header(
      ccontent_type   => coalesce ( p_mime_type, 'application/octet' )
      ,bclose_header  => false
      ,ccharset       => p_charset
    );

    apex_debug.info(
      p_message => 'Set response headers'
    );

    -- set response headers
    for i in 1 .. p_header_names.count
    loop

      apex_debug.info(
         p_message => 'Header name: %s , header value: %s'
        ,p0 => p_header_names(i)
        ,p1 => p_header_values(i)
      );
      -- output HTTP header
      sys.htp.p(
        apex_string.format(
           p_message => '%s: %s'
          ,p0 => p_header_names(i)
          ,p1 => p_header_values(i)
        )
      );

    end loop;

    -- close HTTP header
    sys.owa_util.http_header_close;

    -- output file
    sys.wpg_docload.download_file ( p_blob_content );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    raise_http_error( 500 );
    raise;

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download_file (
    p_file_name in varchar2
  )
  as
    l_file_t        blog_v_files%rowtype;
    l_header_names  apex_t_varchar2;
    l_header_values apex_t_varchar2;
  begin

    -- fetch file
    select *
    into l_file_t
    from blog_v_files t1
    where 1 = 1
    --and t1.is_download = 0
    and t1.file_name = p_file_name
    ;

    apex_debug.info(
      p_message => 'File name: %s, file size: %s, mime type: %s'
      ,p0 => l_file_t.file_name
      ,p1 => l_file_t.file_size
      ,p2 => l_file_t.mime_type
      ,p3 => l_file_t.file_charset
    );

    -- Add Last-Modified header
    apex_string.push(
        p_table => l_header_names
       ,p_value => 'Last-Modified'
    );
    apex_string.push(
       p_table => l_header_values
      ,p_value =>
        to_char(
          sys_extract_utc( l_file_t.changed_on )
          ,g_rfc_2822_date
          ,g_nls_date_lang
        )
    );

    -- Compare request If-Modified-Since header to Last-Modified
    -- If values are equal then set status header and exit from procedure
    if sys.owa_util.get_cgi_env('HTTP_IF_MODIFIED_SINCE') = l_header_values(1)
    then
      sys.owa_util.status_line( 304 );
      apex_debug.info(
         p_message => 'File not sent. If-Modified-Since: %s'
        ,p0 => l_header_values(1)
      );
      return;
    end if;

    -- Add Cache-Control header
    apex_string.push(
        p_table => l_header_names
       ,p_value => 'Cache-Control'
    );
    apex_string.push(
       p_table => l_header_values
      ,p_value =>
        apex_string.format(
           p_message => 'max-age=%s'
          ,p0 =>
            case l_file_t.is_download
              when 1
              then get_attribute_value( 'G_MAX_AGE_DOWNLOAD' )
              else get_attribute_value( 'G_MAX_AGE_FILE' )
            end
        )
    );

    -- add Content-Disposition header
    apex_string.push(
      p_table => l_header_names
     ,p_value => 'Content-Disposition'
    );
    apex_string.push(
      p_table => l_header_values
     ,p_value =>
        apex_string.format(
           p_message => '%s; filename="%s"'
          ,p0 =>
            case l_file_t.is_download
              when 1
              then 'attachment'
              else 'inline'
            end
          ,p1 => l_file_t.file_name
        )
    );

    -- download file
    download_file(
      p_blob_content    => l_file_t.blob_content
      ,p_mime_type      => l_file_t.mime_type
      ,p_header_names   => l_header_names
      ,p_header_values  => l_header_values
    );

  -- handle errors
  exception
  when no_data_found
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    raise_http_error( 404 );
    raise;

  end download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure redirect_search(
    p_value         in varchar2,
    p_app_id        in varchar2 default null,
    p_session       in varchar2 default null
  )
  as
  begin
    -- Get search page URL and redirect
    apex_util.redirect_url (
      apex_page.get_url(
         p_application => p_app_id
        ,p_page        => 'SEARCH'
        ,p_session     => p_session
--          ,p_clear_cache => 'RP'
        ,p_items       => 'P0_SEARCH'
        ,p_values      => p_value
        ,p_plain_url   => true
      )
    );
  end redirect_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_UTIL";
/
CREATE OR REPLACE package body "BLOG_CM"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function next_seq(
    p_max in number
  ) return number
  as
  begin
    return ceil( coalesce( p_max + 1, 1 ) / 10 ) * 10;
  end next_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag_to_post(
    p_post_id     in number,
    p_tag_id      in number,
    p_display_seq in number
  )
  as
  begin

    -- merge tag
    merge into blog_post_tags t1
    using dual on (
      t1.post_id  = p_post_id
      and t1.tag_id  = p_tag_id
    )
    when matched then
    -- update display sequence if it changed
      update set t1.display_seq = p_display_seq
        where t1.display_seq != p_display_seq
    -- insert post id, tag id and display sequency to table
    when not matched then
      insert ( is_active, post_id, tag_id, display_seq )
        values ( 1, p_post_id, p_tag_id, p_display_seq )
    ;

  end add_tag_to_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure cleanup_post_tags(
    p_post_id in number,
    p_tag_tab in apex_t_number
  )
  as
  begin

    -- delete relationship from tags that aren't belong to post anymore
    delete
    from blog_post_tags t1
    where 1 = 1
    and post_id = p_post_id
    and not exists(
      select 1
      from table( p_tag_tab ) x1
      where 1 = 1
      and x1.column_value = t1.tag_id
    );

  end cleanup_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_blogger(
    p_username  in varchar2,
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_max   blog_bloggers.display_seq%type;
    l_email varchar2(256);
  begin

    -- fetch next display_seq
    select max( t1.display_seq ) as display_seq
    into l_max
    from blog_bloggers t1
    ;

    l_max := next_seq( l_max );

    -- get APEX user email
    l_email := apex_util.get_email( p_username => p_username );

    -- get APEX user first and last name for blogger name
    p_name := apex_string.format(
       p_message  => '%s %s'
      ,p0 => apex_util.get_first_name( p_username => p_username )
      ,p1 => apex_util.get_last_name( p_username => p_username )
    );

    -- add new blogger
    insert into blog_bloggers
      ( is_active, publish_desc, display_seq, apex_username, blogger_name, email )
    values
      ( 1, 0, l_max, p_username, p_name, l_email )
    returning id into p_id
    ;

  end add_blogger;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure post_authentication
  as
    l_group_names apex_t_varchar2;
  begin

    -- collect user groups to PL/SQL table
    for c1 in(
      select group_name
      from apex_workspace_group_users
      where 1 = 1
        and user_name = sys_context( 'APEX$SESSION', 'APP_USER' )
    ) loop
      apex_string.push( l_group_names, c1.group_name );
    end loop;

    -- Enable user groups
    apex_authorization.enable_dynamic_groups (
      p_group_names => l_group_names
    );

  exception
  when others
  then
    apex_debug.error( 'Unhandled post authentication procedure error: %s: ', sqlerrm );
    raise;
  end post_authentication;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_blogger_details(
    p_app_id    in varchar2,
    p_username  in varchar2,
    p_id        out nocopy number,
    p_name      out nocopy varchar2
  )
  as
    l_app_id    number;
    l_authz_grp apex_applications.authorization_scheme%type;
  begin

    -- fetch user id and name
    select id
      ,blogger_name
    into p_id, p_name
    from blog_bloggers
    where apex_username = p_username
    ;

  -- if user not found, check is user authorized use blog
  exception
  when no_data_found
  then

    -- conver application id string to number
    l_app_id := to_number( p_app_id );

    -- fetch application authorization scheme name
    select authorization_scheme
    into l_authz_grp
    from apex_applications
    where 1 = 1
    and application_id = l_app_id
    ;

    -- verify user is authorized
    if apex_util.current_user_in_group( l_authz_grp )
    then
      -- if user is authorized add user to blog_bloggers table
      add_blogger(
         p_username => p_username
        ,p_id => p_id
        ,p_name => p_name
      );

    end if;

  end get_blogger_details;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_seq
  return varchar2
  as
    l_max_seq   blog_v_all_categories.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max category display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_categories v1
    ;
    -- get next category display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next category display sequence
    return l_next_seq;

  end get_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_grp_seq
  return varchar2
  as
    l_max_seq   blog_v_all_link_groups.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_link_groups v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_link_grp_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_modal_page_seq
  return varchar2
  as
    l_max_seq   blog_v_all_dynamic_content.display_seq%type;
    l_next_seq  varchar2(256);
  begin

    -- fetch max link group display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_dynamic_content v1
    ;
    -- get next link group display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link group display sequence
    return l_next_seq;

  end get_modal_page_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_link_seq(
    p_link_group_id in varchar2
  ) return varchar2
  as
    l_link_group_id number;
    l_max_seq       blog_v_all_links.display_seq%type;
    l_next_seq      varchar2(256);
  begin

    -- conver link group id string to number
    l_link_group_id := to_number( p_link_group_id );

    -- fetch max link display sequence
    select max( v1.display_seq ) as display_seq
    into l_max_seq
    from blog_v_all_links v1
    where 1 = 1
    and link_group_id = l_link_group_id
    ;
    -- get next link display sequence
    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );
    -- return next link display sequence
    return l_next_seq;

  end get_link_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function request_to_post_status(
    p_request in varchar2
  ) return varchar2
  as
  begin

    -- conver APEX request to post status (blog_posts.is_active)
    return case p_request
      when 'CREATE'
      then '1'
      when 'SAVE'
      then '1'
      when 'SAVE_AND_PUBLISH'
      then '1'
      else '0'
    end;

  end request_to_post_status;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_first_paragraph(
    p_body_html in clob
  ) return varchar2
  as
    l_first_p       clob;
    l_first_p_start number;
    l_first_p_end   number;
    l_length        number;
    l_next_p        number;
    l_cnt           number;
  begin

    l_cnt := 1;
    l_next_p := 1;

    -- get first opening and closing tag positions
    l_first_p_start := instr( p_body_html, '<p>' );
    l_first_p_end   := instr( p_body_html, '</p>', l_first_p_start ) + 4;

    -- check if there nested tags
    while l_next_p > 0
    loop
      l_cnt := l_cnt + 1;

      -- get string length between opening and closing tag
      l_length  := l_first_p_end - l_first_p_start;
      -- select contect between opening and closing tag
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- check if there is more opening tags inside selection
      l_next_p := instr( l_first_p, '<p', 1, l_cnt );

      if l_next_p > 0
      then
        -- if another opening tag found, find next closing tag
        l_first_p_end := instr( p_body_html, '</p>', 1, l_cnt ) + 4;
      end if;

      l_first_p := null;

    end loop;


    -- post must have at least one paragraph
    if l_first_p_start > 0 and l_first_p_end > 0 then

      l_length := l_first_p_end - l_first_p_start;

      -- get first paragraph
      l_first_p := substr( p_body_html, l_first_p_start, l_length );

      -- remove whitespace
      l_first_p := remove_whitespace( l_first_p );

    end if;

    return l_first_p;

  end get_first_paragraph;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function file_upload(
    p_file_name       in varchar2,
    p_collection_name in varchar2
  ) return boolean
  as
    l_file_exists boolean;
    l_file_names  apex_t_varchar2;
    l_file_name   varchar2(256);
  begin

    l_file_exists := false;

    -- Get file names
    l_file_names := apex_string.split (
      p_str => p_file_name
      ,p_sep => ':'
    );

    -- create apex_collection for storing files
    -- collection is used to show what files already exists in repository
    -- we prompt user to confirm those files overwrite
    apex_collection.create_or_truncate_collection(
      p_collection_name => p_collection_name
    );

    -- store uploaded files to apex_collection
    for i in 1 .. l_file_names.count
    loop

      l_file_name := substr(l_file_names(i), instr(l_file_names(i), '/') + 1);

      for c1 in(
        select
           t2.id            as file_id
          ,t2.row_version   as row_version
          ,t2.is_active     as is_active
          ,t2.is_download   as is_download
          ,t2.file_desc     as file_desc
          ,t1.mime_type     as mime_type
          ,t1.blob_content  as blob_content
        from apex_application_temp_files t1
        left join blog_v_all_files t2 on t2.file_name = l_file_name
        where 1 = 1
        and t1.name = l_file_names(i)
      ) loop

        l_file_exists := case
          when c1.file_id is not null
          then true
          else l_file_exists
          end
        ;

        apex_collection.add_member(
           p_collection_name => p_collection_name
          ,p_n001     => c1.file_id
          ,p_n002     => coalesce( c1.is_active, 1 )
          ,p_n003     => coalesce( c1.is_download, 0 )
          ,p_c001     => l_file_name
          ,p_c002     => c1.file_desc
          ,p_c003     => c1.mime_type
          ,p_blob001  => c1.blob_content
        );

      end loop;
    end loop;

    -- if non of files exists, insert files to blog_files
    if not l_file_exists then
      merge_files(
        p_collection_name => p_collection_name
      );
    end if;

    return not l_file_exists;

  end file_upload;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function remove_whitespace(
    p_string  in varchar2
  ) return varchar2
  as
  begin
    -- remove whitespace characters from string
    return trim( regexp_replace( p_string, '\s+', ' ' ) );
  end remove_whitespace;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_files(
    p_collection_name in varchar2
  )
  as
  begin

    -- insert new files and overwrite existing
    merge into blog_files t1 using (
      select
         n001     as id
        ,n002     as is_active
        ,n003     as is_download
        ,c001     as file_name
        ,c002     as file_desc
        ,c003     as mime_type
        ,blob001  as blob_content
      from apex_collections
      where 1 = 1
      and collection_name = p_collection_name
    ) new_files
    on ( t1.id = new_files.id )
    when matched then
      update
        set t1.blob_content = new_files.blob_content
    when not matched then
      insert (
         is_active
        ,is_download
        ,file_name
        ,mime_type
        ,blob_content
        ,file_desc
      )
      values (
         new_files.is_active
        ,new_files.is_download
        ,new_files.file_name
        ,new_files.mime_type
        ,new_files.blob_content
        ,new_files.file_desc
      );

  end merge_files;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_category(
    p_title       in varchar2,
    p_category_id out nocopy number
  )
  as
    l_next_seq      number;
    l_title         varchar2(512);
    l_title_unique  varchar2(512);
  begin

    -- remove whitespace from category title
    l_title := remove_whitespace( p_title );
    l_title_unique := upper( l_title );

    -- check if category already exists and fetch id
    begin
      select v1.id
      into p_category_id
      from blog_v_all_categories v1
      where 1 = 1
      and v1.title_unique = l_title_unique
      ;
    -- if category not exists insert and return id
    exception
    when no_data_found
    then
      -- get next sequence value
      l_next_seq := get_category_seq;
      -- insert category and return id for out parameter.
      insert into blog_categories
        ( is_active, display_seq, title )
          values( 1, l_next_seq, l_title )
      returning id into p_category_id
      ;
    end;
  -- fetch category id if it was inserted in other session but not commited
  exception
  when dup_val_on_index
  then
    select v1.id
    into p_category_id
    from blog_v_all_categories v1
    where 1 = 1
      and v1.title_unique = l_title_unique
    ;
  end add_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_categories
  as
  begin
    -- cleanup categories that aren't linked to any post
    delete from blog_categories t1
    where 1 = 1
    and not exists(
      select 1
      from blog_posts x1
      where 1 = 1
      and x1.category_id = t1.id
    );

  end remove_unused_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_categories
  as
  begin

    -- update categories display_seq if it different than new
    merge into blog_categories t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_categories
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_tag(
    p_tag     in varchar2,
    p_tag_id  out nocopy number
  )
  as
    l_value varchar2(256);
  begin

    p_tag_id  := null;
    l_value   := remove_whitespace( p_tag );

    -- if tag is not null then fetch id
    if l_value is not null then

      begin
        select id
        into p_tag_id
        from blog_v_all_tags
        where 1 = 1
        and tag_unique = upper( l_value )
        ;
      -- if tag not exists insert and return id
      exception when no_data_found then
        insert into blog_tags( is_active, tag )
        values ( 1, l_value )
        returning id into p_tag_id
        ;
      end;

    end if;

  end add_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure add_post_tags(
    p_post_id in varchar2,
    p_tags    in varchar2,
    p_sep     in varchar2 default ','
  )
  as
    l_post_id     number;
    l_tag_id      number;
    l_display_seq number;
    l_tag_tab     apex_t_varchar2;
    l_tag_id_tab  apex_t_number;
  begin

    l_post_id := to_number( p_post_id );

    -- split tags string to table and loop all values
    l_tag_tab := apex_string.split(
       p_str => p_tags
      ,p_sep => p_sep
    );

    for i in 1 .. l_tag_tab.count
    loop

      -- add tag to repository and return id
      add_tag(
         p_tag    => l_tag_tab(i)
        ,p_tag_id => l_tag_id
      );

      -- if the tag has been added or is already in the repository
      -- create relationships to post
      if l_tag_id is not null
      then

        -- collect tag id to table.
        -- table is used at end of procedure
        -- for checking relationships that should be removed
        apex_string.push( l_tag_id_tab, l_tag_id );

        -- get table record count for tag display sequence
        l_display_seq:= l_tag_id_tab.count * 10;

        -- add tag relationships to post
        add_tag_to_post(
           p_post_id     => l_post_id
          ,p_tag_id      => l_tag_id
          ,p_display_seq => l_display_seq
        );

      end if;

    end loop;

    -- delete removed tags relationships
    cleanup_post_tags(
       p_post_id => l_post_id
      ,p_tag_tab => l_tag_id_tab
    );

  end add_post_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_unused_tags
  as
  begin
    -- cleanup tags that aren't linked to any post
    delete from blog_tags t1
    where 1 = 1
    and not exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
      and x1.tag_id = t1.id
    );
  end remove_unused_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_tags(
    p_post_id in varchar2
  )
  as
    l_post_id number;
  begin

    l_post_id := to_number( p_post_id );

    -- update post tags display_seq if it different than new
    merge into blog_post_tags t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_post_tags
      where 1 = 1
      and post_id = l_post_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_integer(
    p_value     in varchar2,
    p_min       in number,
    p_max       in number,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_value     number;
    l_err_mesg  varchar2(32700);
  begin

    if p_value is not null
    then
      -- prepare validation error message
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
        ,p0 => p_min
        ,p1 => p_max
      );

      if l_err_mesg = apex_escape.html( upper( p_err_mesg ) )
      then
        l_err_mesg := p_err_mesg;
      end if;

      l_value := to_number( p_value );
      -- check value is integer and between range
      if round( l_value ) = l_value
      and l_value between p_min and p_max
      then
        -- if validation passes, clear error meassage
        l_err_mesg := null;
      end if;
    end if;

    return l_err_mesg;

  exception
  when invalid_number
  or value_error
  then
    -- return error message
    return l_err_mesg;
  end is_integer;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_url(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin

    if not regexp_like(p_value, '^https?\:\/\/.*$')
    then
      -- if validation fails prepare error message
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
      );

      if l_err_mesg = apex_escape.html( upper( p_err_mesg ) )
      then
        l_err_mesg := p_err_mesg;
      end if;

    end if;

    return l_err_mesg;

  end is_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_date_format(
    p_value     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg          varchar2(32700);
    invalid_date_format exception;
    pragma              exception_init(invalid_date_format, -1821);
  begin

    -- prepare validation error message
    l_err_mesg := apex_lang.message(
      p_name => p_err_mesg
    );

    if l_err_mesg = apex_escape.html( upper( p_err_mesg ) )
    then
      l_err_mesg := p_err_mesg;
    end if;

    -- try convert timestamp to string
    if to_char( systimestamp, p_value ) is not null
    then
      -- if validation passes, clear error meassage
      l_err_mesg := null;
    end if;

    return l_err_mesg;

  exception
  when invalid_date_format
  then
    -- return error message
    return l_err_mesg;
  end is_date_format;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_feature(
    p_app_id          in number,
    p_build_option_id in number,
    p_build_status    in varchar2
  )
  as
  begin

    -- update build option value
    apex_util.set_build_option_status(
       p_application_id => p_app_id
      ,p_id => p_build_option_id
      ,p_build_status => upper( p_build_status )
    );

  end update_feature;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_link_groups
  as
  begin

    -- update link groups display_seq if it different than new
    merge into blog_link_groups t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_link_groups
      where 1 = 1
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_link_groups;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure resequence_links(
    p_link_group_id in varchar2
  )
  as
    l_link_group_id number;
  begin

    -- convert link group id to number
    l_link_group_id := to_number( p_link_group_id );

    -- update links display_seq if it different than new
    merge into blog_links t1
    using (
      select id
        ,row_number() over(
          order by display_seq, created_on
        ) * 10 as new_display_seq
      from blog_links
      where 1 = 1
      and link_group_id = l_link_group_id
    ) v1
    on ( t1.id = v1.id )
    when matched then
      update set t1.display_seq = v1.new_display_seq
        where t1.display_seq != v1.new_display_seq
    ;

  end resequence_links;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CM";
/
create or replace package body "BLOG_PLUGIN"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function to_html_entities(
    p_number in number
  ) return varchar2
  as
    l_string varchar2(4000);
    l_result varchar2(4000);
  begin

    l_string := blog_util.int_to_vc2( p_number );
    for i in 1 .. length( l_string )
    loop
      l_result :=
        apex_string.format(
          p_message => '%s&#%s'
          ,p0 => l_result
          ,p1 => ascii( substr( l_string, i, 1 ) )
        )
      ;
    end loop;
    return l_result;

  end to_html_entities;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure render_math_question_field(
    p_item in apex_plugin.t_item,
    p_plugin in apex_plugin.t_plugin,
    p_param in apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
  )
  as
    l_name varchar2(30);
  begin

    l_name := apex_plugin.get_input_name_for_page_item(false);

    if not (p_param.is_readonly or p_param.is_printer_friendly) then

      sys.htp.p('<input type="text" '
        || case when p_item.element_width is not null
            then'size="' || p_item.element_width ||'" '
           end
        || case when p_item.element_max_length  is not null
            then 'maxlength="' || p_item.element_max_length || '" '
           end
        ||
          apex_plugin_util.get_element_attributes(
             p_item           => p_item
            ,p_name           => l_name
            ,p_default_class  => 'text_field apex-item-text'
          )
        || 'value="" />'
      );

      if p_item.icon_css_classes is not null
      then
        sys.htp.p('<span class="apex-item-icon fa '
          || p_item.icon_css_classes
          || '" aria-hidden="true"></span>'
        );
      end if;

      apex_javascript.add_onload_code (
        p_code => 'apex.server.plugin("' || apex_plugin.get_ajax_identifier || '",{},{'
        || 'dataType:"text",'
        || 'success:function(data){'
        || '$(data).insertBefore($("#' || p_item.name || '_LABEL").children());'
        || '}});'
      );
      -- Tell APEX that this textarea is navigable
      p_result.is_navigable := true;

    end if;

  end render_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure ajax_math_question_field(
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_ajax_param,
    p_result in out nocopy apex_plugin.t_item_ajax_result
  )
  as
    l_err   varchar2(4000);
    l_data  varchar2(4000);
    l_min   number;
    l_max   number;
    l_num_1 number;
    l_num_2 number;
    l_tab   apex_t_varchar2;
  begin

    l_min   := to_number( p_item.attribute_01 );
    l_max   := to_number( p_item.attribute_02 );
    l_num_1 := round( sys.dbms_random.value( l_min, l_max ) );

    l_min   := to_number( p_item.attribute_03 );
    l_max   := to_number( p_item.attribute_04 );
    l_num_2 := round( sys.dbms_random.value( l_min, l_max ) );

    l_data  :=
      apex_string.format(
        p_message =>'<span class="z-question">%s&nbsp;&#%s&nbsp;%s&#%s</span>'
        ,p0 => to_html_entities( l_num_1 )
        ,p1 => ascii('+')
        ,p2 => to_html_entities( l_num_2 )
        ,p3 => ascii('?')
      )
    ;
    -- set correct answer to item session state
    apex_util.set_session_state(
       p_name   => p_item.attribute_05
      ,p_value  => blog_util.int_to_vc2( l_num_1 + l_num_2 )
      ,p_commit => false
    );

    -- Write header for the output
    sys.owa_util.mime_header('text/plain', false);
    sys.htp.p('Cache-Control: no-cache');
    sys.htp.p('Pragma: no-cache');
    sys.owa_util.http_header_close;
    -- Write output
    sys.htp.prn( l_data );

  exception when others
  then

    apex_debug.error( 'ajax_math_question_field error: %s', sqlerrm );

    l_err := apex_lang.message(
       p_name => p_plugin.attribute_02
      ,p0 => p_item.plain_label
    );
    raise_application_error( -20002 ,  l_err );
    raise;

  end ajax_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure validate_math_question_field(
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result
  )
  as
    l_answer  varchar2(4000);
    l_value   varchar2(4000);
    l_result  boolean;
  begin

    if p_param.value is not null then

      l_value   := v(p_item.attribute_05);
      l_answer  := p_param.value;

      -- Check is answer correct
      l_result  := case when l_value = l_answer then true else false end;

    else
      l_result := false;
    end if;

    if not l_result then

      p_result.message := apex_lang.message(
        p_name => p_plugin.attribute_01
        ,p0 => p_item.plain_label
      );

      if p_result.message = apex_escape.html( upper( p_plugin.attribute_01 ) ) then
        p_result.message := p_plugin.attribute_01;
      end if;

    end if;

  end validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_PLUGIN";
/
create or replace package body "BLOG_URL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  type t_page_item is record(
    page_alias  varchar2(256),
    item_name   varchar2(256)
  );
-- constants for pages and id items
  c_post_page     constant t_page_item := t_page_item( 'POST',      'P2_POST_ID' );
  c_category_page constant t_page_item := t_page_item( 'CATEGORY',  'P14_CATEGORY_ID' );
  c_archive_page  constant t_page_item := t_page_item( 'ARCHIVES',  'P15_ARCHIVE_ID' );
  c_tags_page     constant t_page_item := t_page_item( 'TAG',       'P6_TAG_ID' );

-- cache rss url
  g_rss_url       varchar2(1024);
-- cache canonical host
  g_canonical_url varchar2(1024);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_canonical_host
  return varchar2
  as
  begin

    -- get canonical host from blog settings or use APEX provided value
    -- cache value to package private variable
    if g_canonical_url is null
    then

      g_canonical_url := blog_util.get_attribute_value( 'G_CANONICAL_HOST' );
      -- if host not found from settings, use APEX provided value
      if g_canonical_url is null
      then
        g_canonical_url := apex_util.host_url();
      end if;
      -- remove trailing slash
      g_canonical_url := rtrim( g_canonical_url, '/' );

    end if;

    return g_canonical_url;

  end get_canonical_host;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab(
    p_page        in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_url varchar2(4000);
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
         p_application  => p_application
        ,p_page         => p_page
        ,p_session      => ''
        ,p_plain_url    => true
      );

  end get_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in number,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_post_id varchar2(256);
  begin

    l_post_id := blog_util.int_to_vc2( p_post_id );

    return
      get_post(
         p_post_id      => l_post_id
        ,p_application  => p_application
        ,p_canonical    => p_canonical
      );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post(
    p_post_id     in varchar2,
    p_application in varchar2 default null,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_url varchar2(4000);
  begin

  return
    case p_canonical
      when 'YES' then get_canonical_host
    end ||
    apex_page.get_url(
      p_application => p_application
     ,p_page        => c_post_page.page_alias
     ,p_session     => ''
     ,p_items       => c_post_page.item_name
     ,p_values      => p_post_id
     ,p_plain_url   => true
   );

  end get_post;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_category_id varchar2(256);
  begin

    l_category_id := blog_util.int_to_vc2( p_category_id );

    return
      get_category(
         p_category_id  => l_category_id
        ,p_canonical    => p_canonical
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category(
    p_category_id in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
         p_page       => c_category_page.page_alias
        ,p_session    => ''
        ,p_items      => c_category_page.item_name
        ,p_values     => p_category_id
        ,p_plain_url  => true
      );

  end get_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_archive_id varchar2(256);
  begin

    l_archive_id := blog_util.int_to_vc2( p_archive_id );

    return
      get_archive(
         p_archive_id => l_archive_id
        ,p_canonical  => p_canonical
      );

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive(
    p_archive_id  in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end  ||
      apex_page.get_url(
         p_page       => c_archive_page.page_alias
        ,p_session    => ''
        ,p_items      => c_archive_page.item_name
        ,p_values     => p_archive_id
        ,p_plain_url  => true
      )
    ;

  end get_archive;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in number,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
    l_tag_id varchar2(256);
  begin

    l_tag_id := blog_util.int_to_vc2( p_tag_id );

    return
      get_tag(
         p_tag_id     => l_tag_id
        ,p_canonical  => p_canonical
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag(
    p_tag_id      in varchar2,
    p_canonical   in varchar2 default 'NO'
  ) return varchar2
  as
  begin

    return
      case p_canonical
        when 'YES' then get_canonical_host
      end ||
      apex_page.get_url(
         p_page       => c_tags_page.page_alias
        ,p_session    => ''
        ,p_items      => c_tags_page.item_name
        ,p_values     => p_tag_id
        ,p_plain_url  => true
      )
    ;

  end get_tag;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_dynamic_page(
    p_content_id in number
  ) return varchar2
  as
    l_content_id varchar(256);
  begin

    l_content_id := blog_util.int_to_vc2( p_content_id );

    return
      apex_page.get_url(
         p_page     => 'information'
        ,p_request  => l_content_id
      )
    ;

  end get_dynamic_page;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_process(
    p_application in varchar2 default null,
    p_process     in varchar2 default null
  ) return varchar2
  as
  begin

    return get_canonical_host ||
      apex_page.get_url(
         p_application  => p_application
        ,p_page         => 'pgm'
        ,p_session      => ''
        ,p_request      => 'application_process=' || p_process
        ,p_plain_url    => true
      );

  end get_process;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_unsubscribe(
    p_application     in varchar2,
    p_post_id         in varchar2,
    p_subscription_id in number
  ) return varchar2
  as
    l_url     varchar2(4000);
    l_subs_id varchar2(256);
  begin

    l_subs_id := blog_util.int_to_vc2( p_subscription_id );
    -- workaround because APEX 19.2
    -- apex_page.get_url don't have parameter p_plain_url
    l_url := 'f?p='
      || p_application
      || ':POST:::NO::'
      || 'P2_POST_ID'
      || ','
      || 'P2_SUBSCRIPTION_ID'
      || ':'
      || p_post_id
      || ','
      || l_subs_id
    ;

    l_url :=
      apex_util.prepare_url(
         p_url            => l_url
        ,p_checksum_type  => 'PUBLIC_BOOKMARK'
        ,p_plain_url      => true
      );

    return get_canonical_host || l_url;

  end get_unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss(
    p_application in varchar2 default null
  ) return varchar2
  as
  begin
    -- get rss url from blog settings or use default value
    -- cache value to package private variable
    if g_rss_url is null
    then
      -- Fetch RSS URL override from settings
      g_rss_url := blog_util.get_attribute_value( 'G_RSS_URL' );
      -- If there isn't override custruct URL
      if g_rss_url is null
      then
        g_rss_url :=
          get_process(
             p_application  => p_application
            ,p_process      => 'rss.xml'
          );
      end if;
    end if;

    return g_rss_url;

  end get_rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_xsl(
    p_application in varchar2 default null
  ) return varchar2
  as
    l_xsl_url varchar2(4000);
  begin

    -- Fetch XSL URL override from settings
    l_xsl_url := blog_util.get_attribute_value( 'G_RSS_XSL_URL' );
    -- If there isn't override use default XSL
    if l_xsl_url is null
    then
      l_xsl_url :=
        get_process(
           p_application  => p_application
          ,p_process      => 'rss.xsl'
        );
    end if;

    return l_xsl_url;

  end get_rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_sitemap_index(
    p_application     in varchar2 default null
  ) return varchar2
  as
    l_sitemap_url varchar2(4000);
  begin

    l_sitemap_url :=
      get_process(
         p_application  => p_application
        ,p_process      => 'sitemap-index.xml'
      );

    return l_sitemap_url;

  end get_sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_URL";
/
create or replace package body "BLOG_COMM"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_whitelist_tags  constant varchar2(256)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  c_code_block_html constant varchar2(256)  := '<pre class="z-program-code"><code>%s</code></pre>';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_ascii(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove unwanted ascii codes
    for i in 0 .. 31
    loop
      if i != 10 then
        p_string := trim( replace( p_string, chr(i) ) );
      end if;
    end loop;
  end remove_ascii;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure remove_anchor(
    p_string in out nocopy varchar2
  )
  as
  begin
    -- remove anchor tags
    p_string := regexp_replace( p_string, '<a[^>]*>(.*?)<\/a>', '', 1, 0, 'i' );
  end remove_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure escape_html(
    p_string in out nocopy varchar2
  )
  as
    l_hasmark constant varchar(10) := '#HashMark#';
  begin

    -- change all hash marks so we can escape those
    -- after calling apex_escape.html_whitelist
    -- escape of hash marks needed to prevent APEX substitutions
    p_string := replace( p_string, '#', l_hasmark );
    -- escape comment html
    p_string := apex_escape.html_whitelist(
       p_html            => p_string
      ,p_whitelist_tags  => c_whitelist_tags
    );
    -- escape hash marks
    p_string := replace( p_string, l_hasmark, '&#x23;' );

  end escape_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_code_tab(
    p_comment   in out nocopy varchar2,
    p_code_tab  in out nocopy apex_t_varchar2
  )
  as

    l_code      varchar2(32700);
    l_code_cnt  pls_integer := 0;
    l_start_pos pls_integer := 0;
    l_end_pos   pls_integer := 0;

  begin

    -- check code open tag count
    l_code_cnt := regexp_count( p_comment, '\<code\>', 1, 'i' );

    -- process code tags if open and close count match ( pre check is for valid HTML )
    if l_code_cnt = regexp_count( p_comment, '\<\/code\>', 1, 'i' )
    then

      -- collect content inside code tags to collection
      for i in 1 .. l_code_cnt
      loop

        l_code := null;

        -- get code start and end position
        l_start_pos := instr( lower( p_comment ), '<code>' );
        l_end_pos := instr( lower( p_comment ), '</code>' );

        l_code := trim( substr( p_comment, l_start_pos  + 6, l_end_pos - l_start_pos - 6 ) );
        l_code := trim( trim( both chr(10) from l_code ) );

        -- store code tag content to collection and wrap it to pre tag having class
        apex_string.push(
           p_table => p_code_tab
          ,p_value =>
            apex_string.format(
               p_message => c_code_block_html
              ,p0 => l_code
            )
        );

        -- substitude handled code tag
        p_comment :=
          apex_string.format(
             p_message => '%s%s#BLOG_COMMENT_CODE%s#%s%s'
            ,p0 => rtrim( substr( p_comment, 1, l_start_pos - 1 ), chr(10) )
            ,p1 => chr(10)
            ,p2 => i
            ,p3 => chr(10)
            ,p4 => ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )
          )
        ;

      end loop;

    end if;

  end build_code_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure build_comment_html(
    p_comment in out nocopy varchar2
  )
  as
    l_temp        varchar2(32700);
    l_code_row    number;
    l_code_tab    apex_t_varchar2;
    l_comment_tab apex_t_varchar2;
  begin

    -- process code tags
    build_code_tab(
       p_comment => p_comment
      ,p_code_tab => l_code_tab
    );

    -- split comment to collection by new line character
    l_comment_tab := apex_string.split( p_comment, chr(10) );

    -- comment is stored to collection
    -- start building comment with prober html tags
    p_comment := null;

    -- Format comment
    for i in 1 .. l_comment_tab.count
    loop

      l_temp := trim( l_comment_tab(i) );

      -- check if row is code block
      if regexp_like( l_temp, '^#BLOG_COMMENT_CODE[0-9]+\#$' )
      then
        -- get code block row number
        l_code_row := regexp_substr( l_temp, '[0-9]+' );
        -- close p tag, insert code block
        -- and open p tag again for text
        p_comment :=
          apex_string.format(
             p_message => '%s</p>%s<p>'
            ,p0 => p_comment
            ,p1 => l_code_tab( l_code_row )
          )
        ;

      else
        -- append text if row is not empty
        if l_temp is not null
        then
          -- if we are in first row
          if p_comment is null
          then
            p_comment := l_temp;
          else
            -- check if p tag is opened, then insert br for new line
            p_comment :=
              apex_string.format(
                 p_message => '%s%s%s'
                ,p0 => p_comment
                ,p1 =>
                  case
                  when not substr( p_comment, length( p_comment ) - 2 ) = '<p>'
                  then '<br/>' -- br element backlash needed because comment is validated as XML
                  end
                ,p2 => l_temp
              )
            ;
          end if;
        end if;

      end if;

    end loop;

    -- wrap comment to p tag.
    p_comment := apex_string.format( '<p>%s</p>', p_comment );
    -- there might be empty p, if comment e.g. ends code tag, remove that
    p_comment := replace( p_comment, '<p></p>' );

  end build_comment_html;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function format_comment(
    p_comment         in varchar2,
    p_remove_anchors  in boolean default false
  ) return varchar2
  as
    l_comment varchar2(32700);
  begin

    l_comment := p_comment;

    -- remove unwanted ascii codes
    remove_ascii(
      p_string => l_comment
    );
    -- remove all anchors
    if p_remove_anchors
    then
      remove_anchor(
        p_string => l_comment
      );
    end if;
    -- escape HTML
    escape_html(
      p_string => l_comment
    );
    -- build comment HTML
    build_comment_html(
      p_comment => l_comment
    );

    apex_debug.info( 'Formatted comment: %s', l_comment );
    -- return comment
    return l_comment;

  end format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000
  ) return varchar2
  as
    l_xml       xmltype;
    l_result    varchar2(32700);
    l_err_mesg  varchar2(32700);

    xml_parsing_failed exception;
    pragma exception_init( xml_parsing_failed, -31011 );
  begin

    -- check formatted comment length
    if lengthb( p_comment ) > p_max_length
    then
      -- set error message
      l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_LENGTH';
    else
      -- check HTML is valid
      -- TO DO see item 1 from package specs
      begin
        l_xml := xmltype.createxml(
          apex_string.format(
             p_message => '<comment>%s</comment>'
            ,p0 => p_comment
          )
        );
      exception when xml_parsing_failed then
        -- set error message
        l_err_mesg := 'BLOG_VALIDATION_ERR_COMMENT_HTML';
      end;

    end if;

    if l_err_mesg is not null
    then
      -- prepare return validation error message
      l_result := apex_lang.message(
        p_name => l_err_mesg
      );
    end if;
    -- return validation result
    -- if validation fails we return error message stored to variable
    return l_result;

  end validate_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_email(
    p_email     in varchar2,
    p_err_mesg  in varchar2
  ) return varchar2
  as
    l_err_mesg varchar2(32700);
  begin
    -- TO DO see item 3 from package specs

    -- do some basic check for email address
    if not regexp_like( p_email, '^.*\@.*\..*$' )
    then
      -- if validation fails prepare error message
      l_err_mesg := apex_lang.message(
        p_name => p_err_mesg
      );

      if l_err_mesg = apex_escape.html(
        p_string => p_err_mesg
      )
      then
        l_err_mesg := p_err_mesg;
      end if;

    end if;

    return l_err_mesg;

  end is_email;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure flag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop

      begin
        insert into blog_comment_flags( comment_id, flag )
          values( p_comment_id, l_flags(i) )
        ;
      exception when dup_val_on_index
      then
        null;
      end;

    end loop;

  end flag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unflag_comment(
    p_comment_id  in varchar2,
    p_flags       in varchar2
  )
  as
    l_flags apex_t_varchar2;
  begin

    l_flags := apex_string.split( p_flags, ':' );

    for i in 1 .. l_flags.count
    loop
      delete from blog_comment_flags
      where 1 = 1
        and comment_id = p_comment_id
        and flag = l_flags(i)
      ;
    end loop;

  end unflag_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  )
  as
    l_post_id   number;
    l_app_email varchar2(4000);
  begin

    l_post_id   := to_number( p_post_id );

    -- fetch application email address
    l_app_email := blog_util.get_attribute_value( 'G_APP_EMAIL' );
    -- if application email address is not set, exit from procedure
    if l_app_email is null
    then
      apex_debug.info( 'application email address is not set' );
      return;
    end if;

    -- get values for APEX email template
    -- send notify email if blog email address is set
    -- and blogger has set email
    for c1 in(
      select v1.blogger_email
        ,json_object (
           'APP_NAME'     value p_app_name
          ,'BLOGGER_NAME' value v1.blogger_name
          ,'POST_TITLE'   value v1.title
          ,'POST_LINK'    value
              blog_url.get_post(
                 p_post_id => v1.id
                ,p_canonical => 'YES'
              )
        ) as placeholders
      from blog_v_all_posts v1
      where 1 = 1
      and v1.id = l_post_id
      and v1.blogger_email is not null
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
        ,c1.blogger_email
        ,l_app_email
        ,p_email_template
        ,c1.placeholders
      );
      -- send notify email
      apex_mail.send (
         p_to                 => c1.blogger_email
        ,p_from               => l_app_email
        ,p_template_static_id => p_email_template
        ,p_placeholders       => c1.placeholders
      );

    end loop;

  end new_comment_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  )
  as
    l_watch_end     date;
    l_post_id       number;
    l_watch_months  number;
    l_app_email     varchar2(4000);
  begin

    l_post_id := to_number( p_post_id );

    -- fetch application email address
    l_app_email := blog_util.get_attribute_value( 'G_APP_EMAIL' );
    -- if application email address is not set, exit from procedure
    if l_app_email is null
    then
      apex_debug.info( 'application email address is not set' );
      return;
    end if;

    -- fetch comment watch expires
    l_watch_months := to_number(
        blog_util.get_attribute_value( 'G_COMMENT_WATCH_MONTHS' )
      ) * -1
    ;
    l_watch_end := add_months( trunc( sysdate ), l_watch_months );

    -- send notify users that have subscribed to replies to comment
    for c1 in(
      select t2.email
      ,json_object (
         'APP_NAME'         value p_app_name
        ,'POST_TITLE'       value v1.title
        ,'POST_LINK'        value
            blog_url.get_post(
               p_application  => p_app_id
              ,p_post_id      => p_post_id
              ,p_canonical    => 'YES'
            )
        ,'UNSUBSCRIBE_LINK' value
            blog_url.get_unsubscribe(
               p_application     => p_app_id
              ,p_post_id         => p_post_id
              ,p_subscription_id => t1.id
            )
       ) as placeholders
      from blog_comment_subscribers t1
      join blog_subscribers_email t2
        on t1.email_id = t2.id
      join blog_v_all_posts v1
        on t1.post_id = v1.id
      where 1 = 1
        and t1.is_active
          * t2.is_active
          * case v1.post_status when 'PUBLISHED' then 1 else 0 end
          = 1
        and v1.id = l_post_id
        -- send notification if subscription is created less than months ago specified in settings
        and t1.subscription_date > l_watch_end
    ) loop

      apex_debug.info(
        'Send email to: %s from: %s template: %s placeholders: %s'
        ,c1.email
        ,l_app_email
        ,p_email_template
        ,c1.placeholders
      );
      -- send notify email
      apex_mail.send (
         p_from => l_app_email
        ,p_to   => c1.email
        ,p_template_static_id => p_email_template
        ,p_placeholders => c1.placeholders
      );

    end loop;

  end reply_notify;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure subscribe(
    p_post_id in varchar2,
    p_email   in varchar2
  )
  as
    l_email     varchar2(256);
    l_post_id   number;
    l_email_id  number;
  begin

    l_email   := trim( lower( p_email ) );
    l_post_id := to_number( p_post_id );

    -- subscribe user to get notify on reply to comment
    if p_email is not null
    and p_post_id is not null
    then
      -- check if email address already exists and fetch id
      begin
        select id
        into l_email_id
        from blog_subscribers_email
        where 1 = 1
        and email = l_email
        ;
      -- if email address not exists, insert and return id
      exception when no_data_found
      then
        insert into
            blog_subscribers_email( email, is_active )
        values
          ( l_email, 1 )
        returning id into l_email_id
        ;
      end;
      -- insert post to email relation
      begin
        insert into
          blog_comment_subscribers( post_id, email_id, subscription_date, is_active )
        values
          ( p_post_id, l_email_id, trunc( sysdate ), 1 )
        ;
      -- if subscription already exists update subscription
      exception when dup_val_on_index
      then
        update blog_comment_subscribers
          set subscription_date = trunc( sysdate )
        where 1 = 1
        and is_active = 1
        and post_id = p_post_id
        and email_id = l_email_id
        ;
      end;
    end if;

  end subscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure unsubscribe(
    p_subscription_id in varchar2
  )
  as
  begin
    -- remove user subscribtion to get notify from replies
    delete
      from blog_comment_subscribers
    where 1 = 1
      and id = p_subscription_id
    ;
  end unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_COMM";
/
create or replace package body "BLOG_HTML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  c_link_canonical constant varchar2(34) := '<link rel="canonical" href="%s" />';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tab_canonical_link(
    p_page in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for tab
    if p_page is not null then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_tab(
               p_page       => p_page
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      -- if p_page is not defined
      apex_debug.warn( 'Canonical link tag not generated for tab.' );
      l_html := null;
    end if;
    -- return generated HTML
    return l_html;

  end get_tab_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_canonical_link(
    p_post_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for post
    if p_post_id is not null then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_post(
               p_post_id      => p_post_id
              ,p_canonical    => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for post.' );
      l_html := null;
    end if;
    -- return generated HTML
    return l_html;

  end get_post_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_category_canonical_link(
    p_category_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for category
    if p_category_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_category(
               p_category_id  => p_category_id
              ,p_canonical    => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for category.' );
      l_html := null;
    end if;
    -- return generated HTML
    return l_html;

  end get_category_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_archive_canonical_link(
    p_archive_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
      -- generate canonical link for archives
    if p_archive_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_archive(
               p_archive_id => p_archive_id
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for archive.' );
      l_html := null;
    end if;
    -- return generated HTML
    return l_html;

  end get_archive_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_tag_canonical_link(
    p_tag_id in varchar2
  ) return varchar2
  as
    l_html varchar2(32700);
  begin
    -- generate canonical link for tags
    if p_tag_id is not null
    then
      l_html :=
        apex_string.format(
          p_message => c_link_canonical
          ,p0 =>
            blog_url.get_tag(
               p_tag_id     => p_tag_id
              ,p_canonical  => 'YES'
            )
        )
      ;
    else
      apex_debug.warn( 'Canonical link tag not generated for tag.' );
      l_html := null;
    end if;

    -- return generated HTML
    return l_html;

  end get_tag_canonical_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_anchor(
    p_app_name  in varchar2,
    p_message   in varchar2
  ) return varchar2
  as
    l_rss_url     varchar2(4000);
    l_rss_title   varchar2(4000);
    l_rss_anchor  varchar2(4000);
  begin

    -- get rss title
    l_rss_title :=
      apex_lang.message(
        p_name => p_message
        ,p0 => p_app_name
      )
    ;

    -- get rss url
    l_rss_url :=  blog_url.get_rss;

    -- generate RSS anchor
    l_rss_anchor :=
      apex_string.format(
        p_message =>
          '<a href="%s" aria-label="%s" rel="alternate" type="%s" class="%s">'
          || '<span aria-hidden="true" class="%s"></span>'
          || '</a>'
        ,p0 => l_rss_url
        ,p1 => apex_escape.html_attribute( l_rss_title )
        ,p2 => 'application/rss+xml'
        ,p3 => 't-Button t-Button--noLabel t-Button--icon t-Button--link'
        ,p4 => 'fa fa-rss-square fa-3x fa-lg u-color-8-text'
      )
    ;
    -- return generated HTML
    return l_rss_anchor;

  end get_rss_anchor;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_rss_link(
    p_app_id        in varchar2,
    p_app_name      in varchar2,
    p_message       in varchar2,
    p_build_option  in varchar2
  ) return varchar2
  as
    l_app_id    number;
    l_rss_url   varchar2(4000);
    l_rss_title varchar2(4000);
  begin

    l_app_id := to_number( p_app_id );

    -- check build option should HTML generated
    if apex_util.get_build_option_status(
       p_application_id     => l_app_id
      ,p_build_option_name  => p_build_option
    ) = 'INCLUDE'
    then
      -- get rss url
      l_rss_url := blog_url.get_rss;

    -- generate link for RSS
      l_rss_title := apex_lang.message(
        p_name => p_message
        ,p0 => p_app_name
      );
      -- generate HTML
      l_rss_url :=
        apex_string.format(
          p_message => '<link href="%s" title="%s" rel="alternate" type="application/rss+xml" />'
          ,p0 => l_rss_url
          ,p1 =>
            apex_escape.html_attribute(
              p_string => l_rss_title
            )
        )
      ;

    end if;
    -- return generated HTML
    return l_rss_url;

  end get_rss_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_HTML";
/
create or replace package body "BLOG_XML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_app_name  in varchar2,
    p_app_desc  in varchar2
  )
  as
    l_xml           xmltype;
    l_rss           blob;
    l_lang          varchar2(256);
    l_app_id        varchar2(256);
    l_rss_url       varchar2(4000);
    l_xsl_url       varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_name      varchar2(4000);
    l_app_desc      varchar2(4000);
    l_cache_control varchar2(256);
    l_last_modified varchar2(256);
    l_max_published timestamp;

    l_rss_version   constant varchar2(5)  := '2.0';

  begin

    l_lang := apex_application.g_browser_language;

    -- RSS feed URL
    l_rss_url   := blog_url.get_rss;
    -- blog name
    l_app_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'G_APP_NAME' )
    );
    -- rss feed description
    l_app_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'G_APP_DESC' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_page       => 'HOME'
      ,p_canonical  => 'YES'
    );
    -- rss transformations (XSLT)
    l_xsl_url := blog_url.get_rss_xsl;

    -- generate RSS
    select xmlserialize(
      content xmlconcat(
        case when l_xsl_url is not null
          then xmlpi( "xml-stylesheet",
            apex_string.format(
               p_message => 'type="text/xsl" href="%s" media="screen"'
              ,p0 => l_xsl_url
            )
          )
        end,
        xmlelement(
          "rss", xmlattributes(
             l_rss_version                      as "version"
            ,'http://purl.org/dc/elements/1.1/' as "xmlns:dc"
            ,'http://www.w3.org/2005/Atom'      as "xmlns:atom"
          )
          ,xmlelement(
            "channel"
            ,xmlelement(
              "atom:link"
              ,xmlattributes(
                'self'                  as "rel"
                ,l_rss_url              as "href"
                ,'application/rss+xml'  as "type"
              )
            )
            ,xmlforest(
              l_app_name  as "title"
              ,l_home_url as "link"
              ,l_app_desc as "description"
              ,l_lang     as "language"
            )
            ,xmlagg(
              xmlelement(
                "item"
                ,xmlelement( "title",       posts.post_title )
                ,xmlelement( "dc:creator",  posts.blogger_name )
                ,xmlelement( "category",    posts.category_title )
                ,xmlelement( "link",
                  blog_url.get_post(
                     p_post_id    => posts.post_id
                    ,p_canonical  => 'YES'
                  )
                )
                ,xmlelement( "description", posts.post_desc )
                ,xmlelement( "pubDate",
                  to_char(
                     sys_extract_utc( posts.published_on )
                    ,blog_util.g_rfc_2822_date
                    ,blog_util.g_nls_date_lang
                  )
                )
                ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id )
              ) order by posts.published_on desc
            )
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    ,max( posts.published_on ) as max_published
    into l_rss, l_max_published
    from blog_v_posts_last20 posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS' )
      )
    ;

    l_last_modified :=
      to_char(
         sys_extract_utc( l_max_published )
        ,blog_util.g_rfc_2822_date
        ,blog_util.g_nls_date_lang
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_rss
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control',  'Content-Disposition',        'Last-Modified' )
      ,p_header_values  => apex_t_varchar2( l_cache_control,  'inline; filename="rss.xml"', l_last_modified  )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_css_file in varchar2
  )
  as
    l_xml           xmltype;
    l_xsl           blob;
    l_css_url       varchar2(1024);
    l_cache_control varchar2(256);
  begin

    -- Generate relaive URL for CSS file
    l_css_url := apex_util.host_url( 'APEX_PATH' );
    l_css_url := substr( l_css_url, instr( l_css_url, '/', 1, 3 ) );
    l_css_url := l_css_url || p_css_file;

    l_xml :=
      xmltype(
        apex_string.format(
          p_message => '
            <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
              <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. -->
              <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />
              <!-- Start matching at the Channel node within the XML RSS feed. -->
              <xsl:template match="/rss/channel">
                <html lang="%s">
                <head>
                  <meta charset="utf-8" />
                  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                  <title>
                    <xsl:value-of select="title" />
                  </title>
                  <link rel="stylesheet" type="text/css" href="%s" />
                </head>
                <body>
                  <h1><a class="z-rss--title" href="{ link }"><xsl:value-of select="title" /></a></h1>
                  <h2 class="z-rss--description"><xsl:value-of select="description" /></h2>
                  <xsl:for-each select="./item">
                    <article class="z-rss--post">
                      <header>
                        <h3 class="z-rss--postHeader"><a href="{ link }"><xsl:value-of select="title" /></a></h3>
                      </header>
                      <p class="z-rss--postBody"><xsl:value-of select="description" /></p>
                    </article>
                  </xsl:for-each>
                </body>
                </html>
              </xsl:template>
            </xsl:stylesheet>'
          ,p0 => apex_application.g_browser_language
          ,p1 => l_css_url
        )
      )
    ;

    select
      xmlserialize(
        content l_xml as blob encoding 'UTF-8' indent size = 2
      ) xsl
    into l_xsl
    from dual
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_RSS_XSL' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xsl
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="rss.xsl"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2,
    p_process_name  in varchar2
  )
  as
    l_url           varchar2(4000);
    l_xml           blob;
    l_cache_control varchar2(256);
    l_build_option  constant varchar2(256) := 'BLOG_FEATURE_SITEMAP';
  begin

    -- get url to call sitemaps process
    l_url := blog_url.get_process;

    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "sitemap"
              ,xmlelement( "loc", l_url || t1.process_name
              )
            ) order by t1.execution_sequence
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from apex_application_page_proc t1
    where 1 = 1
      and t1.process_name != p_process_name
      and t1.application_id = p_app_id
      and t1.page_id = p_app_page_id
      and t1.build_option = l_build_option
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-index.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main(
    p_app_id in varchar2
  )
  as
    l_xml   blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tab(
                   p_page       => v1.page_alias
                  ,p_canonical  => 'YES'
                )
              )
            ) order by v1.page_id
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from apex_application_pages v1
    where 1 = 1
      and v1.application_id = p_app_id
      and v1.page_alias in ( 'HOME', 'LINKS', 'REPOSITORY', 'ABOUT' )
      and case
        when v1.build_option is null
        then 'INCLUDE'
        else
          apex_util.get_build_option_status(
             p_application_id    => p_app_id
            ,p_build_option_name => v1.build_option
          )
      end = 'INCLUDE'
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-main.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_post(
                   p_post_id    => posts.post_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc(
                    greatest( posts.published_on, posts.changed_on )
                  )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by posts.published_on desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_posts posts
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-posts.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_categories
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_category(
                   p_category_id  => cat.category_id
                  ,p_canonical    => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( cat.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by cat.display_seq desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_categories cat
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-categories.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_archives
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_archive(
                   p_archive_id => arc.archive_year
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( arc.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by arc.archive_year desc
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_archive_year arc
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-archives.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_archives;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_tags
  as
    l_xml           blob;
    l_cache_control varchar2(256);
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc",
                blog_url.get_tag(
                   p_tag_id     => tags.tag_id
                  ,p_canonical  => 'YES'
                )
              )
              ,xmlelement( "lastmod",
                to_char(
                  sys_extract_utc( tags.changed_on )
                  ,blog_util.g_iso_8601_date
                )
              )
            ) order by tags.changed_on
          )
        )
      )
      as blob encoding 'UTF-8' indent size = 2
    )
    into l_xml
    from blog_v_tags tags
    ;

    l_cache_control :=
      apex_string.format(
         p_message => 'max-age=%s'
        ,p0 => blog_util.get_attribute_value( 'G_MAX_AGE_SITEMAP' )
      )
    ;

    blog_util.download_file(
       p_blob_content   => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_header_names   => apex_t_varchar2( 'Cache-Control', 'Content-Disposition' )
      ,p_header_values  => apex_t_varchar2( l_cache_control, 'inline; filename="sitemap-tags.xml"' )
      ,p_charset        => 'UTF-8'
    );

  -- handle errors
  exception
  when others
  then

    apex_debug.error(
       p_message => '%s Error: %s'
      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))
      ,p1 => sqlerrm
    );

    -- show http error
    blog_util.raise_http_error( 500 );
    raise;

  end sitemap_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
--------------------------------------------------------
--DDL for Foreign Keys
--------------------------------------------------------
ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_FK1" FOREIGN KEY ("POST_ID")
  REFERENCES "BLOG_POSTS" ("ID") ENABLE;
ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_FK2" FOREIGN KEY ("PARENT_ID")
  REFERENCES "BLOG_COMMENTS" ("ID") ENABLE;
ALTER TABLE "BLOG_COMMENT_FLAGS" ADD CONSTRAINT "BLOG_COMMENT_FLAGS_FK1" FOREIGN KEY ("COMMENT_ID")
  REFERENCES "BLOG_COMMENTS" ("ID") ON DELETE CASCADE ENABLE;
ALTER TABLE "BLOG_COMMENT_SUBSCRIBERS" ADD CONSTRAINT "BLOG_COMMENT_SUBSCRIBERS_FK1" FOREIGN KEY ("POST_ID")
  REFERENCES "BLOG_POSTS" ("ID") ON DELETE CASCADE ENABLE;
ALTER TABLE "BLOG_COMMENT_SUBSCRIBERS" ADD CONSTRAINT "BLOG_COMMENT_SUBSCRIBERS_FK2" FOREIGN KEY ("EMAIL_ID")
  REFERENCES "BLOG_SUBSCRIBERS_EMAIL" ("ID") ON DELETE CASCADE ENABLE;
ALTER TABLE "BLOG_FEATURES" ADD CONSTRAINT "BLOG_FEATURES_FK1" FOREIGN KEY ("BUILD_OPTION_PARENT")
  REFERENCES "BLOG_FEATURES" ("BUILD_OPTION_NAME") ENABLE;
ALTER TABLE "BLOG_INIT_ITEMS" ADD CONSTRAINT "BLOG_INIT_ITEMS_FK1" FOREIGN KEY ("ITEM_NAME")
  REFERENCES "BLOG_SETTINGS" ("ATTRIBUTE_NAME") ENABLE;
ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_FK1" FOREIGN KEY ("LINK_GROUP_ID")
  REFERENCES "BLOG_LINK_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK1" FOREIGN KEY ("BLOGGER_ID")
  REFERENCES "BLOG_BLOGGERS" ("ID") ENABLE;
ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK2" FOREIGN KEY ("CATEGORY_ID")
  REFERENCES "BLOG_CATEGORIES" ("ID") ENABLE;
ALTER TABLE "BLOG_POST_TAGS" ADD CONSTRAINT "BLOG_POST_TAGS_FK1" FOREIGN KEY ("POST_ID")
  REFERENCES "BLOG_POSTS" ("ID") ON DELETE CASCADE ENABLE;
ALTER TABLE "BLOG_POST_TAGS" ADD CONSTRAINT "BLOG_POST_TAGS_FK2" FOREIGN KEY ("TAG_ID")
  REFERENCES "BLOG_TAGS" ("ID") ENABLE;
