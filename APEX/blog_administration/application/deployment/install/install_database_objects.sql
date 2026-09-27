prompt --application/deployment/install/install_database_objects
begin
--   Manifest
--     INSTALL: INSTALL-Database objects
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Sequence BLOG_SEQ'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(2) := '-------------------------------------------'||wwv_flow.LF||
'create sequence blog_seq'||wwv_flow.LF||
'minvalue 1'||wwv_flow.LF||
'maxvalue 99999999999';
wwv_flow_imp.g_varchar2_table(3) := '99999999999999999'||wwv_flow.LF||
'increment by 1'||wwv_flow.LF||
'start with 100001'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(4) := '---------'||wwv_flow.LF||
'--  DDL for Table BLOG_BLOGGERS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'c';
wwv_flow_imp.g_varchar2_table(5) := 'reate table blog_bloggers('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(6) := 'created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,';
wwv_flow_imp.g_varchar2_table(7) := ''||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not nu';
wwv_flow_imp.g_varchar2_table(8) := 'll,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  display_seq number( 10, 0 ) not null,'||wwv_flow.LF||
'  blogger_name varc';
wwv_flow_imp.g_varchar2_table(9) := 'har2( 256 char ) not null,'||wwv_flow.LF||
'  apex_username varchar2(  256 char ) not null,'||wwv_flow.LF||
'  email varchar2( 256 cha';
wwv_flow_imp.g_varchar2_table(10) := 'r ),'||wwv_flow.LF||
'  publish_desc number( 1, 0 ) not null,'||wwv_flow.LF||
'  blogger_desc varchar2( 4000 byte ),'||wwv_flow.LF||
'  show_desc numbe';
wwv_flow_imp.g_varchar2_table(11) := 'r( 1, 0 ) as( is_active * publish_desc * case when blogger_desc is not null then 1 else 0 end ) virt';
wwv_flow_imp.g_varchar2_table(12) := 'ual not null,'||wwv_flow.LF||
'  constraint blog_bloggers_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_bloggers_uk1 unique';
wwv_flow_imp.g_varchar2_table(13) := '( apex_username ),'||wwv_flow.LF||
'  constraint blog_bloggers_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_blogge';
wwv_flow_imp.g_varchar2_table(14) := 'rs_ck2 check( is_active in( 0 , 1 ) ),'||wwv_flow.LF||
'  constraint blog_bloggers_ck3 check( display_seq > 0 ),'||wwv_flow.LF||
'  co';
wwv_flow_imp.g_varchar2_table(15) := 'nstraint blog_bloggers_ck4 check( publish_desc in( 0 , 1 ) ),'||wwv_flow.LF||
'  constraint blog_bloggers_ck5 check( ';
wwv_flow_imp.g_varchar2_table(16) := 'show_desc in( 0 , 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Tab';
wwv_flow_imp.g_varchar2_table(17) := 'le BLOG_CATEGORIES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_catego';
wwv_flow_imp.g_varchar2_table(18) := 'ries('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38 ,0 ) not null,'||wwv_flow.LF||
'  created_on timestamp(';
wwv_flow_imp.g_varchar2_table(19) := ' 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timesta';
wwv_flow_imp.g_varchar2_table(20) := 'mp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active numbe';
wwv_flow_imp.g_varchar2_table(21) := 'r( 1, 0 ) not null,'||wwv_flow.LF||
'  display_seq number( 10, 0 ) not null,'||wwv_flow.LF||
'  title varchar2( 256 char ) not null,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(22) := ' title_unique varchar2( 256 char ) as( upper( trim( title ) ) ) virtual not null,'||wwv_flow.LF||
'  notes varchar2( ';
wwv_flow_imp.g_varchar2_table(23) := '4000 byte ),'||wwv_flow.LF||
'  constraint blog_categories_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_categories_uk1 uni';
wwv_flow_imp.g_varchar2_table(24) := 'que( title_unique ),'||wwv_flow.LF||
'  constraint blog_categories_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_ca';
wwv_flow_imp.g_varchar2_table(25) := 'tegories_ck2 check( is_active in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_categories_ck3 check( display_seq > 0 ';
wwv_flow_imp.g_varchar2_table(26) := ')'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_COMMENTS'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(27) := '---------------------------------------------------'||wwv_flow.LF||
'create table blog_comments('||wwv_flow.LF||
'  id number( 38, 0 )';
wwv_flow_imp.g_varchar2_table(28) := ' not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone ';
wwv_flow_imp.g_varchar2_table(29) := 'not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zo';
wwv_flow_imp.g_varchar2_table(30) := 'ne not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  post';
wwv_flow_imp.g_varchar2_table(31) := '_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  parent_id number( 38, 0 ),'||wwv_flow.LF||
'  comment_by varchar2( 256 char ) not nul';
wwv_flow_imp.g_varchar2_table(32) := 'l,'||wwv_flow.LF||
'  body_html varchar2( 4000 byte ) not null,'||wwv_flow.LF||
'  comment_preview varchar2( 4000 byte ) not null,'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(33) := 'tx_search char( 1 byte ) not null,'||wwv_flow.LF||
'  constraint blog_comments_pk primary key( id ),'||wwv_flow.LF||
'  constraint blo';
wwv_flow_imp.g_varchar2_table(34) := 'g_comments_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_comments_ck2 check( is_active in( 0 , 1 )';
wwv_flow_imp.g_varchar2_table(35) := ' )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_COMMENT_FLAGS';
wwv_flow_imp.g_varchar2_table(36) := ''||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_comment_flags('||wwv_flow.LF||
'  id numb';
wwv_flow_imp.g_varchar2_table(37) := 'er( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local';
wwv_flow_imp.g_varchar2_table(38) := ' time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with lo';
wwv_flow_imp.g_varchar2_table(39) := 'cal time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  comment_id number( 38, 0 ) not';
wwv_flow_imp.g_varchar2_table(40) := ' null,'||wwv_flow.LF||
'  flag varchar2( 256 char ) not null,'||wwv_flow.LF||
'  constraint blog_comment_flags_pk primary key( id ),'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(41) := ' constraint blog_comment_flags_uk1 unique( comment_id, flag ),'||wwv_flow.LF||
'  constraint blog_comment_flags_ck1 c';
wwv_flow_imp.g_varchar2_table(42) := 'heck( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_comment_flags_ck2 check( flag in( ''NEW'', ''UNREAD'', ''MODER';
wwv_flow_imp.g_varchar2_table(43) := 'ATE'' ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_COMMENT';
wwv_flow_imp.g_varchar2_table(44) := '_SENTIMENTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_comment_senti';
wwv_flow_imp.g_varchar2_table(45) := 'ments('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp';
wwv_flow_imp.g_varchar2_table(46) := '( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timest';
wwv_flow_imp.g_varchar2_table(47) := 'amp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  comment_id num';
wwv_flow_imp.g_varchar2_table(48) := 'ber( 38, 0 ) not null,'||wwv_flow.LF||
'  original_language varchar2( 6 char ) not null,'||wwv_flow.LF||
'  sentiment_json varchar2(40';
wwv_flow_imp.g_varchar2_table(49) := '00 byte) not null,'||wwv_flow.LF||
'  constraint blog_comment_sentiments_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_comm';
wwv_flow_imp.g_varchar2_table(50) := 'ent_sentiments_uk1 unique( comment_id ),'||wwv_flow.LF||
'  constraint blog_comment_sentiments_ck1 check( row_version';
wwv_flow_imp.g_varchar2_table(51) := ' > 0 ),'||wwv_flow.LF||
'  constraint blog_comment_sentiments_ck2 check( sentiment_json is json )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(52) := '-----------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_COMMENT_SUBSCRIBERS'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(53) := '-----------------------------------------'||wwv_flow.LF||
'create table blog_comment_subscribers('||wwv_flow.LF||
'  id number( 38, 0 ';
wwv_flow_imp.g_varchar2_table(54) := ') not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone';
wwv_flow_imp.g_varchar2_table(55) := ' not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time z';
wwv_flow_imp.g_varchar2_table(56) := 'one not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  pos';
wwv_flow_imp.g_varchar2_table(57) := 't_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  email_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  subscription_date date not nul';
wwv_flow_imp.g_varchar2_table(58) := 'l,'||wwv_flow.LF||
'  constraint blog_comment_subscribers_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_comment_subscribers';
wwv_flow_imp.g_varchar2_table(59) := '_uk1 unique( post_id, email_id ),'||wwv_flow.LF||
'  constraint blog_comment_subscribers_ck1 check( row_version > 0 )';
wwv_flow_imp.g_varchar2_table(60) := ','||wwv_flow.LF||
'  constraint blog_comment_subscribers_ck2 check( is_active in( 0, 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(61) := '----------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_DYNAMIC_CONTENT'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(62) := '------------------------------'||wwv_flow.LF||
'create table blog_dynamic_content('||wwv_flow.LF||
'  id number( 38,0 ) not null enabl';
wwv_flow_imp.g_varchar2_table(63) := 'e,'||wwv_flow.LF||
'  row_version number( 38,0 ) not null enable,'||wwv_flow.LF||
'  created_on timestamp ( 6 ) with local time zone n';
wwv_flow_imp.g_varchar2_table(64) := 'ot null enable,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp ( 6 ) with local ';
wwv_flow_imp.g_varchar2_table(65) := 'time zone not null enable,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1,0 ) not';
wwv_flow_imp.g_varchar2_table(66) := ' null enable,'||wwv_flow.LF||
'  display_seq number( 10,0 ) not null enable,'||wwv_flow.LF||
'  content_type varchar2( 256 char ) not ';
wwv_flow_imp.g_varchar2_table(67) := 'null,'||wwv_flow.LF||
'  content_desc varchar2( 256 char ) not null,'||wwv_flow.LF||
'  show_changed_on number( 1,0 ) not null enable,';
wwv_flow_imp.g_varchar2_table(68) := ''||wwv_flow.LF||
'  content_html clob not null,'||wwv_flow.LF||
'  notes varchar2( 4000 byte ),'||wwv_flow.LF||
'  constraint blog_dynamic_content_pk p';
wwv_flow_imp.g_varchar2_table(69) := 'rimary key( id ),'||wwv_flow.LF||
'  constraint blog_dynamic_content_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_';
wwv_flow_imp.g_varchar2_table(70) := 'dynamic_content_ck2 check( is_active in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_dynamic_content_ck3 check( disp';
wwv_flow_imp.g_varchar2_table(71) := 'lay_seq > 0 ),'||wwv_flow.LF||
'  constraint blog_dynamic_content_ck4 check( content_type in( ''FOOTER_LINK'' ) ),'||wwv_flow.LF||
'  co';
wwv_flow_imp.g_varchar2_table(72) := 'nstraint blog_dynamic_content_ck5 check( show_changed_on in( 0, 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(73) := '------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_FEATURES'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(74) := '-------------------'||wwv_flow.LF||
'create table blog_features('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number(';
wwv_flow_imp.g_varchar2_table(75) := ' 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2(';
wwv_flow_imp.g_varchar2_table(76) := ' 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varcha';
wwv_flow_imp.g_varchar2_table(77) := 'r2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  display_seq number( 10, 0 ) not null';
wwv_flow_imp.g_varchar2_table(78) := ','||wwv_flow.LF||
'  build_option_name varchar2( 256 char ) not null,'||wwv_flow.LF||
'  build_option_group varchar2( 256 char ) not n';
wwv_flow_imp.g_varchar2_table(79) := 'ull,'||wwv_flow.LF||
'  build_option_parent varchar2( 256 char ),'||wwv_flow.LF||
'  ref_build_option_name varchar2( 256 char ),'||wwv_flow.LF||
'  ref';
wwv_flow_imp.g_varchar2_table(80) := '_build_option_status varchar2( 10 char ),'||wwv_flow.LF||
'  constraint blog_features_pk primary key( id ),'||wwv_flow.LF||
'  constra';
wwv_flow_imp.g_varchar2_table(81) := 'int blog_features_uk1 unique( build_option_name ),'||wwv_flow.LF||
'  constraint blog_features_ck1 check( row_version';
wwv_flow_imp.g_varchar2_table(82) := ' > 0 ),'||wwv_flow.LF||
'  constraint blog_features_ck2 check( display_seq > 0 ),'||wwv_flow.LF||
'  constraint blog_features_ck3 chec';
wwv_flow_imp.g_varchar2_table(83) := 'k( is_active in( 0, 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for T';
wwv_flow_imp.g_varchar2_table(84) := 'able BLOG_FILES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_files ('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(85) := ' id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) wi';
wwv_flow_imp.g_varchar2_table(86) := 'th local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 )';
wwv_flow_imp.g_varchar2_table(87) := ' with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0';
wwv_flow_imp.g_varchar2_table(88) := ' ) not null,'||wwv_flow.LF||
'  is_download number( 1, 0 ) not null,'||wwv_flow.LF||
'  file_path varchar2( 256 char ) not null,'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(89) := 'e_type varchar2( 256 char ) not null,'||wwv_flow.LF||
'  blob_content blob,'||wwv_flow.LF||
'  file_size number( 38, 0 ) not null,'||wwv_flow.LF||
'  f';
wwv_flow_imp.g_varchar2_table(90) := 'ile_charset varchar2( 256 char ),'||wwv_flow.LF||
'  file_desc varchar2( 4000 byte ),'||wwv_flow.LF||
'  md5 varchar2( 256 char ),'||wwv_flow.LF||
'  e';
wwv_flow_imp.g_varchar2_table(91) := 'tag varchar2( 256 char ),'||wwv_flow.LF||
'  notes varchar2( 4000 byte ),'||wwv_flow.LF||
'	apex$sync_step_static_id varchar2( 255 byt';
wwv_flow_imp.g_varchar2_table(92) := 'e ),'||wwv_flow.LF||
'	apex$row_sync_timestamp timestamp with time zone,'||wwv_flow.LF||
'  file_dir  varchar2(260 char) generated alw';
wwv_flow_imp.g_varchar2_table(93) := 'ays as ( ''/'' || substr( file_path, 1, instr( file_path, ''/'', - 1 ) ) ) virtual not null,'||wwv_flow.LF||
'  file_name';
wwv_flow_imp.g_varchar2_table(94) := ' varchar2(260 char) generated always as ( substr( file_path, instr( file_path, ''/'', - 1 ) + 1 ) ) vi';
wwv_flow_imp.g_varchar2_table(95) := 'rtual not null,'||wwv_flow.LF||
'  constraint blog_files_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_files_uk1 unique( fi';
wwv_flow_imp.g_varchar2_table(96) := 'le_path ),'||wwv_flow.LF||
'  constraint blog_files_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_files_ck2 check( ';
wwv_flow_imp.g_varchar2_table(97) := 'is_active in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_files_ck3 check( is_download in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint bl';
wwv_flow_imp.g_varchar2_table(98) := 'og_files_ck4 check( is_download = 0 or is_download = 1 and file_desc is not null )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(99) := '-------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_INIT_ITEMS'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(100) := '----------------------------------'||wwv_flow.LF||
'create table blog_init_items('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  ro';
wwv_flow_imp.g_varchar2_table(101) := 'w_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  cre';
wwv_flow_imp.g_varchar2_table(102) := 'ated_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(103) := 'changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  application_id numb';
wwv_flow_imp.g_varchar2_table(104) := 'er( 38,0 ) not null,'||wwv_flow.LF||
'  item_name varchar2( 256 char ) not null,'||wwv_flow.LF||
'  constraint blog_init_items_pk prim';
wwv_flow_imp.g_varchar2_table(105) := 'ary key( id ),'||wwv_flow.LF||
'  constraint blog_init_items_uk1 unique( application_id, item_name ),'||wwv_flow.LF||
'  constraint bl';
wwv_flow_imp.g_varchar2_table(106) := 'og_init_items_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_init_items_ck2 check( is_active in( 0,';
wwv_flow_imp.g_varchar2_table(107) := ' 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_LINKS'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(108) := '-----------------------------------------------------'||wwv_flow.LF||
'create table blog_links('||wwv_flow.LF||
'  id number( 38, 0 ) ';
wwv_flow_imp.g_varchar2_table(109) := 'not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone n';
wwv_flow_imp.g_varchar2_table(110) := 'ot null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zon';
wwv_flow_imp.g_varchar2_table(111) := 'e not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  displ';
wwv_flow_imp.g_varchar2_table(112) := 'ay_seq number( 10, 0 ) not null,'||wwv_flow.LF||
'  link_group_id number not null,'||wwv_flow.LF||
'  title varchar2( 256 char ) not n';
wwv_flow_imp.g_varchar2_table(113) := 'ull,'||wwv_flow.LF||
'  link_desc varchar2( 4000 byte ) not null,'||wwv_flow.LF||
'  link_url varchar2( 256 char ) not null,'||wwv_flow.LF||
'  externa';
wwv_flow_imp.g_varchar2_table(114) := 'l_link number(1,0) not null,'||wwv_flow.LF||
'  target_blank number(1,0) not null,'||wwv_flow.LF||
'  notes varchar2( 4000 byte ),'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(115) := 'onstraint blog_links_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_links_uk1 unique( link_group_id, id ),'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(116) := '  constraint blog_links_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_links_ck2 check( is_active i';
wwv_flow_imp.g_varchar2_table(117) := 'n( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_links_ck3 check( display_seq > 0 ),'||wwv_flow.LF||
'  constraint blog_links_ck4 check';
wwv_flow_imp.g_varchar2_table(118) := '( external_link in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_links_ck5 check( target_blank in( 0, 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(119) := '---------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_LINK_GROUPS'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(120) := '-------------------------------------------'||wwv_flow.LF||
'create table blog_link_groups('||wwv_flow.LF||
'  id number( 38, 0 ) not ';
wwv_flow_imp.g_varchar2_table(121) := 'null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone not n';
wwv_flow_imp.g_varchar2_table(122) := 'ull,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone no';
wwv_flow_imp.g_varchar2_table(123) := 't null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  display_s';
wwv_flow_imp.g_varchar2_table(124) := 'eq number( 10, 0 ) not null,'||wwv_flow.LF||
'  title varchar2( 256 char ) not null,'||wwv_flow.LF||
'  title_unique varchar2( 256 cha';
wwv_flow_imp.g_varchar2_table(125) := 'r ) as ( upper( title ) ) virtual not null,'||wwv_flow.LF||
'  notes varchar2( 4000 byte ),'||wwv_flow.LF||
'  constraint blog_link_gr';
wwv_flow_imp.g_varchar2_table(126) := 'oups_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_link_groups_uk1 unique( title_unique ),'||wwv_flow.LF||
'  constraint bl';
wwv_flow_imp.g_varchar2_table(127) := 'og_link_groups_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_link_groups_ck2 check( is_active in( ';
wwv_flow_imp.g_varchar2_table(128) := '0 , 1 ) ),'||wwv_flow.LF||
'  constraint blog_link_groups_ck3 check( display_seq > 0 )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(129) := '------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_LIST_OF_VALUES'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(130) := '-------------------------'||wwv_flow.LF||
'create table blog_list_of_values('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_ver';
wwv_flow_imp.g_varchar2_table(131) := 'sion number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_';
wwv_flow_imp.g_varchar2_table(132) := 'by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  chang';
wwv_flow_imp.g_varchar2_table(133) := 'ed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  display_seq number( 10, ';
wwv_flow_imp.g_varchar2_table(134) := '0 ) not null,'||wwv_flow.LF||
'  lov_name varchar2( 256 char ) not null,'||wwv_flow.LF||
'  return_value varchar2(  256 char ) not nul';
wwv_flow_imp.g_varchar2_table(135) := 'l,'||wwv_flow.LF||
'  display_message varchar2( 256 char ) not null,'||wwv_flow.LF||
'  constraint blog_list_of_values_pk primary key(';
wwv_flow_imp.g_varchar2_table(136) := ' id ),'||wwv_flow.LF||
'  constraint blog_list_of_values_uk1 unique( lov_name, return_value ),'||wwv_flow.LF||
'  constraint blog_list';
wwv_flow_imp.g_varchar2_table(137) := '_of_values_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_list_of_values_ck2 check( is_active in( 0';
wwv_flow_imp.g_varchar2_table(138) := ' , 1 ) ),'||wwv_flow.LF||
'  constraint blog_list_of_values_ck3 check( display_seq > 0 )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(139) := '--------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_POSTS'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(140) := '------------------'||wwv_flow.LF||
'create table blog_posts('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38,';
wwv_flow_imp.g_varchar2_table(141) := ' 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256';
wwv_flow_imp.g_varchar2_table(142) := ' char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( ';
wwv_flow_imp.g_varchar2_table(143) := '256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  blogger_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(144) := 'ategory_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  title varchar2( 256 char ) not null,'||wwv_flow.LF||
'  post_desc varchar2( 40';
wwv_flow_imp.g_varchar2_table(145) := '00 byte) not null,'||wwv_flow.LF||
'  body_html clob not null,'||wwv_flow.LF||
'  first_paragraph varchar2( 4000 byte ) not null,'||wwv_flow.LF||
'  pu';
wwv_flow_imp.g_varchar2_table(146) := 'blished_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  ctx_search char( 1 byte ) not null,'||wwv_flow.LF||
'  not';
wwv_flow_imp.g_varchar2_table(147) := 'es varchar2( 4000 byte ),'||wwv_flow.LF||
'  body_length number( 38, 0 ) as ( sys.dbms_lob.getlength( body_html ) ) v';
wwv_flow_imp.g_varchar2_table(148) := 'irtual not null,'||wwv_flow.LF||
'  archive_year_month number( 6, 0 ) as ( to_number( to_char( published_on, ''YYYYMM''';
wwv_flow_imp.g_varchar2_table(149) := ' ) ) ) virtual not null,'||wwv_flow.LF||
'  archive_year number( 4, 0 ) as ( to_number( to_char( published_on, ''YYYY''';
wwv_flow_imp.g_varchar2_table(150) := ' ) ) ) virtual not null,'||wwv_flow.LF||
'  constraint blog_posts_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_posts_uk1 u';
wwv_flow_imp.g_varchar2_table(151) := 'nique( published_on ),'||wwv_flow.LF||
'  constraint blog_posts_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_posts';
wwv_flow_imp.g_varchar2_table(152) := '_ck2 check( is_active in( 0 , 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(153) := ' DDL for Table BLOG_POST_TAGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table ';
wwv_flow_imp.g_varchar2_table(154) := 'blog_post_tags('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on ';
wwv_flow_imp.g_varchar2_table(155) := 'timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_';
wwv_flow_imp.g_varchar2_table(156) := 'on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_ac';
wwv_flow_imp.g_varchar2_table(157) := 'tive number( 1, 0 ) not null,'||wwv_flow.LF||
'  display_seq number( 10, 0 ) not null,'||wwv_flow.LF||
'  post_id number( 38, 0 ) not ';
wwv_flow_imp.g_varchar2_table(158) := 'null,'||wwv_flow.LF||
'  tag_id number( 38, 0 ) not null,'||wwv_flow.LF||
'  constraint blog_post_tags_pk primary key( id ),'||wwv_flow.LF||
'  constra';
wwv_flow_imp.g_varchar2_table(159) := 'int blog_post_tags_uk1 unique( post_id, tag_id ),'||wwv_flow.LF||
'  constraint blog_post_tags_ck1 check( row_version';
wwv_flow_imp.g_varchar2_table(160) := ' > 0 ),'||wwv_flow.LF||
'  constraint blog_post_tags_ck2 check( is_active in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_post_tags_c';
wwv_flow_imp.g_varchar2_table(161) := 'k3 check( display_seq > 0 )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for';
wwv_flow_imp.g_varchar2_table(162) := ' Table BLOG_SETTINGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_sett';
wwv_flow_imp.g_varchar2_table(163) := 'ings('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp(';
wwv_flow_imp.g_varchar2_table(164) := ' 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timesta';
wwv_flow_imp.g_varchar2_table(165) := 'mp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  display_seq num';
wwv_flow_imp.g_varchar2_table(166) := 'ber( 10, 0 ) not null,'||wwv_flow.LF||
'  is_nullable number( 1, 0 ) not null,'||wwv_flow.LF||
'  attribute_group_message varchar2( 25';
wwv_flow_imp.g_varchar2_table(167) := '6 char ) not null,'||wwv_flow.LF||
'  attribute_name varchar2( 128 char ) not null,'||wwv_flow.LF||
'  data_type varchar2( 64 char ) n';
wwv_flow_imp.g_varchar2_table(168) := 'ot null,'||wwv_flow.LF||
'  attribute_value varchar2( 4000 byte ),'||wwv_flow.LF||
'  int_min number( 10,0 ),'||wwv_flow.LF||
'  int_max number( 10,0 )';
wwv_flow_imp.g_varchar2_table(169) := ','||wwv_flow.LF||
'  build_option_name varchar2( 256 char ),'||wwv_flow.LF||
'  build_option_status varchar2( 10 char ),'||wwv_flow.LF||
'  attribute_m';
wwv_flow_imp.g_varchar2_table(170) := 'essage varchar2( 256 char ) generated always as ( ''BLOG_SETTING_'' || attribute_name ) virtual not nu';
wwv_flow_imp.g_varchar2_table(171) := 'll,'||wwv_flow.LF||
'  help_message varchar2( 256 char ) generated always as ( ''BLOG_HELP_'' || attribute_name ) virtu';
wwv_flow_imp.g_varchar2_table(172) := 'al not null,'||wwv_flow.LF||
'  constraint blog_settings_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_settings_uk1 unique(';
wwv_flow_imp.g_varchar2_table(173) := ' attribute_name ),'||wwv_flow.LF||
'  constraint blog_settings_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_settin';
wwv_flow_imp.g_varchar2_table(174) := 'gs_ck2 check( is_nullable in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_settings_ck3 check( display_seq > 0 ),'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(175) := 'onstraint blog_settings_ck4 check( is_nullable = 1 or ( is_nullable = 0 and attribute_value is not n';
wwv_flow_imp.g_varchar2_table(176) := 'ull ) ),'||wwv_flow.LF||
'  constraint blog_settings_ck5 check( data_type in( ''INTEGER'', ''STRING'', ''DATE_FORMAT'', ''UR';
wwv_flow_imp.g_varchar2_table(177) := 'L'', ''EMAIL'' ) ),'||wwv_flow.LF||
'  constraint blog_settings_ck6 check('||wwv_flow.LF||
'    data_type != ''INTEGER'' or ('||wwv_flow.LF||
'      data_ty';
wwv_flow_imp.g_varchar2_table(178) := 'pe = ''INTEGER'' and'||wwv_flow.LF||
'      int_min is not null and'||wwv_flow.LF||
'      int_max is not null and'||wwv_flow.LF||
'      round( to_numbe';
wwv_flow_imp.g_varchar2_table(179) := 'r( attribute_value ) ) = to_number( attribute_value ) and'||wwv_flow.LF||
'      to_number( attribute_value ) between';
wwv_flow_imp.g_varchar2_table(180) := ' int_min and int_max'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  ),'||wwv_flow.LF||
'  constraint blog_settings_ck7 check('||wwv_flow.LF||
'    data_type != ''DATE_FORMAT''';
wwv_flow_imp.g_varchar2_table(181) := ' or ('||wwv_flow.LF||
'      data_type = ''DATE_FORMAT'' and'||wwv_flow.LF||
'      to_char( created_on, attribute_value ) is not null'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(182) := '   )'||wwv_flow.LF||
'  ),'||wwv_flow.LF||
'  constraint blog_settings_ck8 check('||wwv_flow.LF||
'    data_type != ''URL'' or ('||wwv_flow.LF||
'      data_type = ''URL'' ';
wwv_flow_imp.g_varchar2_table(183) := 'and'||wwv_flow.LF||
'      regexp_like( attribute_value, ''^https?\:\/\/.*$'' )'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  ),'||wwv_flow.LF||
'  constraint blog_settings_c';
wwv_flow_imp.g_varchar2_table(184) := 'k9 check('||wwv_flow.LF||
'    data_type != ''EMAIL'' or ('||wwv_flow.LF||
'      data_type = ''EMAIL'' and'||wwv_flow.LF||
'      regexp_like( attribute_v';
wwv_flow_imp.g_varchar2_table(185) := 'alue, ''^.*\@.*\..*$'' )'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DD';
wwv_flow_imp.g_varchar2_table(186) := 'L for Table BLOG_SUBSCRIBERS_EMAIL'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create t';
wwv_flow_imp.g_varchar2_table(187) := 'able blog_subscribers_email('||wwv_flow.LF||
'  id number( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(188) := '  created_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not nul';
wwv_flow_imp.g_varchar2_table(189) := 'l,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not ';
wwv_flow_imp.g_varchar2_table(190) := 'null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
'  email varchar2( 256 char ) not null,'||wwv_flow.LF||
'  constraint blog_';
wwv_flow_imp.g_varchar2_table(191) := 'subscribers_email_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_subscribers_email_uk1 unique( email ),'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(192) := 'onstraint blog_subscribers_email_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constraint blog_subscribers_email_c';
wwv_flow_imp.g_varchar2_table(193) := 'k2 check( is_active in( 0, 1 ) ),'||wwv_flow.LF||
'  constraint blog_subscribers_email_ck3 check( email = lower( trim';
wwv_flow_imp.g_varchar2_table(194) := '( email ) ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Table BLOG_TA';
wwv_flow_imp.g_varchar2_table(195) := 'GS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create table blog_tags ('||wwv_flow.LF||
'  id number( 38';
wwv_flow_imp.g_varchar2_table(196) := ', 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local time ';
wwv_flow_imp.g_varchar2_table(197) := 'zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with local ti';
wwv_flow_imp.g_varchar2_table(198) := 'me zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  is_active number( 1, 0 ) not null,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(199) := ' tag varchar2( 256 char ) not null,'||wwv_flow.LF||
'  tag_unique varchar2( 256 char ) as ( upper( trim( tag ) ) ) vi';
wwv_flow_imp.g_varchar2_table(200) := 'rtual not null,'||wwv_flow.LF||
'  notes varchar2( 4000 byte ),'||wwv_flow.LF||
'  constraint blog_tags_pk primary key( id ),'||wwv_flow.LF||
'  constr';
wwv_flow_imp.g_varchar2_table(201) := 'aint blog_tags_uk1 unique( tag_unique ),'||wwv_flow.LF||
'  constraint blog_tags_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  cons';
wwv_flow_imp.g_varchar2_table(202) := 'traint blog_tags_ck2 check( is_active in( 0 , 1 ) )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_CTX"'||wwv_flow.LF||
'authid ';
wwv_flow_imp.g_varchar2_table(203) := 'definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(204) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    This ';
wwv_flow_imp.g_varchar2_table(205) := 'package contains procedures for Oracle Text operations, including'||wwv_flow.LF||
'--    the generation of text datas';
wwv_flow_imp.g_varchar2_table(206) := 'tores for posts and comments.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ================================================';
wwv_flow_imp.g_varchar2_table(207) := '============================'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  ----------';
wwv_flow_imp.g_varchar2_table(208) := '---  ------------------------------------------------'||wwv_flow.LF||
'--  22.06.2020   Jari Laine     Created packag';
wwv_flow_imp.g_varchar2_table(209) := 'e.'||wwv_flow.LF||
'--  30.04.2022   Jari Laine     Updated procedure generate_post_datastore to utilize XML function';
wwv_flow_imp.g_varchar2_table(210) := 's.'||wwv_flow.LF||
'--  02.05.2022   Jari Laine     Improved function get_post_search to enhance text search query ha';
wwv_flow_imp.g_varchar2_table(211) := 'ndling.'||wwv_flow.LF||
'--  25.11.2022   Jari Laine     Updated procedure generate_post_datastore to remove HTML tag';
wwv_flow_imp.g_varchar2_table(212) := 's from post body.'||wwv_flow.LF||
'--  17.07.2024   Jari Laine     Removed obsolete function get_post_search.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(213) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(214) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure generate_post_datastore('||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(215) := 'id   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(216) := '-----------------------------'||wwv_flow.LF||
'  procedure generate_comment_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  ';
wwv_flow_imp.g_varchar2_table(217) := 'in out nocopy clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(218) := '----'||wwv_flow.LF||
'end "BLOG_CTX";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_INSTALL"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(219) := '--------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(220) := '-------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    Procedures and functions for appli';
wwv_flow_imp.g_varchar2_table(221) := 'cation install'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===============================================================';
wwv_flow_imp.g_varchar2_table(222) := '============='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ----------';
wwv_flow_imp.g_varchar2_table(223) := '--------------------------------------'||wwv_flow.LF||
'--  10.05.2025   Jari Laine     Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(224) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(225) := '----------------------------------------------------'||wwv_flow.LF||
'  procedure settings_merge('||wwv_flow.LF||
'    p_attribute_nam';
wwv_flow_imp.g_varchar2_table(226) := 'e          in varchar2,'||wwv_flow.LF||
'    p_display_seq             in number,'||wwv_flow.LF||
'    p_is_nullable             in nu';
wwv_flow_imp.g_varchar2_table(227) := 'mber,'||wwv_flow.LF||
'    p_data_type               in varchar2,'||wwv_flow.LF||
'    p_attribute_group_message in varchar2,'||wwv_flow.LF||
'    p_in';
wwv_flow_imp.g_varchar2_table(228) := 't_min                 in number   default null,'||wwv_flow.LF||
'    p_int_max                 in number   default nu';
wwv_flow_imp.g_varchar2_table(229) := 'll,'||wwv_flow.LF||
'    p_build_option_name       in varchar2 default null,'||wwv_flow.LF||
'    p_build_option_status     in varchar';
wwv_flow_imp.g_varchar2_table(230) := '2 default null,'||wwv_flow.LF||
'    p_attribute_value         in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(231) := '--------------------------------------------------------'||wwv_flow.LF||
'  procedure features_merge('||wwv_flow.LF||
'    p_build_opt';
wwv_flow_imp.g_varchar2_table(232) := 'ion_name       in varchar2,'||wwv_flow.LF||
'    p_is_active               in number,'||wwv_flow.LF||
'    p_display_seq             i';
wwv_flow_imp.g_varchar2_table(233) := 'n number,'||wwv_flow.LF||
'    p_build_option_group      in varchar2,'||wwv_flow.LF||
'    p_build_option_parent     in varchar2 defau';
wwv_flow_imp.g_varchar2_table(234) := 'lt null,'||wwv_flow.LF||
'    p_ref_build_option_name   in varchar2 default null,'||wwv_flow.LF||
'    p_ref_build_option_status in va';
wwv_flow_imp.g_varchar2_table(235) := 'rchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(236) := '-----'||wwv_flow.LF||
'  procedure list_of_values_ins('||wwv_flow.LF||
'    p_is_active               in number,'||wwv_flow.LF||
'    p_display_seq    ';
wwv_flow_imp.g_varchar2_table(237) := '         in number,'||wwv_flow.LF||
'    p_lov_name                in varchar2,'||wwv_flow.LF||
'    p_return_value            in varc';
wwv_flow_imp.g_varchar2_table(238) := 'har2,'||wwv_flow.LF||
'    p_display_message         in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(239) := '---------------------------------'||wwv_flow.LF||
'  procedure init_items_ins;'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(240) := '------------------------------------------'||wwv_flow.LF||
'end "BLOG_INSTALL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_MIM';
wwv_flow_imp.g_varchar2_table(241) := 'E"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(242) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(243) := '--    Procedures and functions for file mime type'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CREDITS:'||wwv_flow.LF||
'--    https://asktom.oracle.com/pl';
wwv_flow_imp.g_varchar2_table(244) := 's/apex/asktom.search?tag=mime-type-using-blob-data'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===========================';
wwv_flow_imp.g_varchar2_table(245) := '================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  --';
wwv_flow_imp.g_varchar2_table(246) := '---------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  21.07.2025   Jari Lai';
wwv_flow_imp.g_varchar2_table(247) := 'ne     Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(248) := '-------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  g_default';
wwv_flow_imp.g_varchar2_table(249) := '_mime constant varchar2(100) := ''application/octet-stream'';'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(250) := '----------------------------------------'||wwv_flow.LF||
'  function get_mime_type('||wwv_flow.LF||
'    p_file_name varchar2'||wwv_flow.LF||
'  ) retu';
wwv_flow_imp.g_varchar2_table(251) := 'rn varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "B';
wwv_flow_imp.g_varchar2_table(252) := 'LOG_MIME";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_FILE"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(253) := '-------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(254) := '------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    This package provides procedures and functions ';
wwv_flow_imp.g_varchar2_table(255) := 'for managing files in the'||wwv_flow.LF||
'--    admin application''s file repository. It includes operations for form';
wwv_flow_imp.g_varchar2_table(256) := 'atting'||wwv_flow.LF||
'--    file paths, uploading, replacing, selecting, deleting, and downloading files.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CH';
wwv_flow_imp.g_varchar2_table(257) := 'ANGE LOG'||wwv_flow.LF||
'--  ============================================================================'||wwv_flow.LF||
'--  DATE  ';
wwv_flow_imp.g_varchar2_table(258) := '       MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ----------------------------------';
wwv_flow_imp.g_varchar2_table(259) := '--------------'||wwv_flow.LF||
'--  21.07.2024   Jari Laine     Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(260) := '-----------------------------------------------'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(261) := '----------------------------'||wwv_flow.LF||
'  function get_zip_name return varchar2;'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(262) := '--------------------------------------------------'||wwv_flow.LF||
'  function format_file_path('||wwv_flow.LF||
'    p_file_name     ';
wwv_flow_imp.g_varchar2_table(263) := '    in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(264) := '------------------------------------------------------'||wwv_flow.LF||
'  function get_file_desc('||wwv_flow.LF||
'    p_file_path    ';
wwv_flow_imp.g_varchar2_table(265) := '     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(266) := '------------------'||wwv_flow.LF||
'  procedure upload_file('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'    p_dir          ';
wwv_flow_imp.g_varchar2_table(267) := '     in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''';
wwv_flow_imp.g_varchar2_table(268) := 'N'','||wwv_flow.LF||
'    p_overwrite_file    in varchar2 default ''N'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(269) := '-------------------------------------'||wwv_flow.LF||
'  procedure replace_file('||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(270) := '  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure fi';
wwv_flow_imp.g_varchar2_table(271) := 'le_select_collection('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_seq_id            in number,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(272) := 'id                in number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(273) := '-------------'||wwv_flow.LF||
'  procedure delete_selected_files('||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(274) := '----------------------------------------------------------------------'||wwv_flow.LF||
'  procedure download_selected';
wwv_flow_imp.g_varchar2_table(275) := '_files('||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(276) := '-----------------------------'||wwv_flow.LF||
'end "BLOG_FILE";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_UTIL"'||wwv_flow.LF||
'authid define';
wwv_flow_imp.g_varchar2_table(277) := 'r'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(278) := '------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Provides u';
wwv_flow_imp.g_varchar2_table(279) := 'tility procedures and functions for the public and administrative'||wwv_flow.LF||
'--    blog applications. This incl';
wwv_flow_imp.g_varchar2_table(280) := 'udes error handling, string manipulation,'||wwv_flow.LF||
'--    file operations, and support for application process';
wwv_flow_imp.g_varchar2_table(281) := 'es.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ==========================================================================';
wwv_flow_imp.g_varchar2_table(282) := '=='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ---------------------';
wwv_flow_imp.g_varchar2_table(283) := '---------------------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  28.03.2020   Jari L';
wwv_flow_imp.g_varchar2_table(284) := 'aine     Added alternate signature for get_year_month.'||wwv_flow.LF||
'--  15.04.2020   Jari Laine     Added functio';
wwv_flow_imp.g_varchar2_table(285) := 'n validate_comment.'||wwv_flow.LF||
'--  26.04.2020   Jari Laine     Replaced validate_comment with APEX_UTIL.SAVEKEY';
wwv_flow_imp.g_varchar2_table(286) := '_VC2.'||wwv_flow.LF||
'--                              Removed redundant custom functions.'||wwv_flow.LF||
'--  08.05.2020   Jari Lain';
wwv_flow_imp.g_varchar2_table(287) := 'e     Marked get_year_month functions as obsolete.'||wwv_flow.LF||
'--  10.05.2020   Jari Laine     Added procedures ';
wwv_flow_imp.g_varchar2_table(288) := 'new_comment_notify, subscribe,'||wwv_flow.LF||
'--                              and unsubscribe for comment replies.'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(289) := '--  11.05.2020   Jari Laine     Moved comment-related logic to BLOG_COMM package.'||wwv_flow.LF||
'--  17.05.2020   J';
wwv_flow_imp.g_varchar2_table(290) := 'ari Laine     Added out parameters p_older_title and p_newer_title to get_post_pagination.'||wwv_flow.LF||
'--       ';
wwv_flow_imp.g_varchar2_table(291) := '                       Replaced materialized view BLOG_ITEMS_INIT with a view.'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(292) := '           Removed obsolete function get_item_init_value.'||wwv_flow.LF||
'--  18.05.2020   Jari Laine     Moved ORDS';
wwv_flow_imp.g_varchar2_table(293) := '-specific global constants.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     Enhanced APEX debug logging and exceptio';
wwv_flow_imp.g_varchar2_table(294) := 'n handling.'||wwv_flow.LF||
'--                              Modified get_post_pagination to raise ORA-20901.'||wwv_flow.LF||
'--     ';
wwv_flow_imp.g_varchar2_table(295) := '                         Removed global constants.'||wwv_flow.LF||
'--  23.05.2020   Jari Laine     Removed dependenc';
wwv_flow_imp.g_varchar2_table(296) := 'y on ORDS.'||wwv_flow.LF||
'--  05.11.2020   Jari Laine     Added procedure render_dynamic_content.'||wwv_flow.LF||
'--  18.12.2021   ';
wwv_flow_imp.g_varchar2_table(297) := 'Jari Laine     Added procedure redirect_search.'||wwv_flow.LF||
'--  24.03.2022   Jari Laine     Added parameter name';
wwv_flow_imp.g_varchar2_table(298) := 's to APEX_DEBUG calls.'||wwv_flow.LF||
'--  25.03.2022   Jari Laine     Improved comments and renamed variables for c';
wwv_flow_imp.g_varchar2_table(299) := 'larity.'||wwv_flow.LF||
'--                              Removed obsolete procedure check_archive_exists.'||wwv_flow.LF||
'--  19.04.2';
wwv_flow_imp.g_varchar2_table(300) := '022   Jari Laine     Enhanced download_file procedures.'||wwv_flow.LF||
'--  26.04.2022   Jari Laine     Added parame';
wwv_flow_imp.g_varchar2_table(301) := 'ter p_escape to function get_tag.'||wwv_flow.LF||
'--  03.08.2022   Jari Laine     Updated render_dynamic_content to ';
wwv_flow_imp.g_varchar2_table(302) := 'use APEX_UTIL.PRN.'||wwv_flow.LF||
'--  16.11.2022   Jari Laine     Removed obsolete function get_post_title.'||wwv_flow.LF||
'--  21.';
wwv_flow_imp.g_varchar2_table(303) := '11.2022   Jari Laine     Added DETERMINISTIC clause to function int_to_vc2.'||wwv_flow.LF||
'--  23.11.2022   Jari La';
wwv_flow_imp.g_varchar2_table(304) := 'ine     Improved exception handling in procedures.'||wwv_flow.LF||
'--                              Renamed get_post_';
wwv_flow_imp.g_varchar2_table(305) := 'pagination to get_post_details.'||wwv_flow.LF||
'--  24.11.2022   Jari Laine     Removed obsolete parameter p_escape.';
wwv_flow_imp.g_varchar2_table(306) := ''||wwv_flow.LF||
'--  29.11.2022   Jari Laine     Added procedure raise_http_error.'||wwv_flow.LF||
'--                              M';
wwv_flow_imp.g_varchar2_table(307) := 'oved next/previous post logic to BLOG_V_POSTS view.'||wwv_flow.LF||
'--  15.01.2023   Jari Laine     Removed procedur';
wwv_flow_imp.g_varchar2_table(308) := 'e render_dynamic_content.'||wwv_flow.LF||
'--  19.01.2023   Jari Laine     Renamed get_post_details parameters.'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(309) := '                           Added global constants: g_nls_date_lang, g_iso_8601_date and g_rfc_2822_d';
wwv_flow_imp.g_varchar2_table(310) := 'ate.'||wwv_flow.LF||
'--  08.04.2023   Jari Laine     Modified redirect_search to accept p_page_id.'||wwv_flow.LF||
'--  05.09.2023   ';
wwv_flow_imp.g_varchar2_table(311) := 'Jari Laine     Removed use of BLOG_T_POST type in get_post_details.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(312) := 'Added new global constants and variables.'||wwv_flow.LF||
'--                              Minor changes to download_';
wwv_flow_imp.g_varchar2_table(313) := 'file.'||wwv_flow.LF||
'--  10.04.2024   Jari Laine     Updated initialize_items procedure.'||wwv_flow.LF||
'--  20.07.2024   Jari Lain';
wwv_flow_imp.g_varchar2_table(314) := 'e     Added RESULT_CACHE for function get_attribute_value.'||wwv_flow.LF||
'--  25.08.2024   Jari Laine     Added new';
wwv_flow_imp.g_varchar2_table(315) := ' function remove_whitespace.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(316) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  g_nl';
wwv_flow_imp.g_varchar2_table(317) := 's_date_lang constant varchar2(40) := ''NLS_DATE_LANGUAGE = ENGLISH'';'||wwv_flow.LF||
'  g_iso_8601_date constant varch';
wwv_flow_imp.g_varchar2_table(318) := 'ar2(40) := ''YYYY-MM-DD"T"HH24:MI:SS"Z"'';'||wwv_flow.LF||
'  g_rfc_2822_date constant varchar2(40) := ''Dy, DD Mon YYYY';
wwv_flow_imp.g_varchar2_table(319) := ' HH24:MI:SS "GMT"'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  g_mime_rss      constant varchar2(40) := ''application/rss+xml'';'||wwv_flow.LF||
'  g_mime_atom';
wwv_flow_imp.g_varchar2_table(320) := '     constant varchar2(40) := ''application/atom+xml'';'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(321) := '----------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'--  inside package blog_cm ';
wwv_flow_imp.g_varchar2_table(322) := 'and blog_comm'||wwv_flow.LF||
'  function remove_whitespace('||wwv_flow.LF||
'    p_string            in varchar2'||wwv_flow.LF||
'  ) return varchar2;';
wwv_flow_imp.g_varchar2_table(323) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure raise_';
wwv_flow_imp.g_varchar2_table(324) := 'http_error('||wwv_flow.LF||
'    p_error_code      in number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(325) := '-----------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public and admin application definition Error Hand';
wwv_flow_imp.g_varchar2_table(326) := 'ling Function'||wwv_flow.LF||
'  function apex_error_handler('||wwv_flow.LF||
'    p_error           in apex_error.t_error'||wwv_flow.LF||
'  ) return ';
wwv_flow_imp.g_varchar2_table(327) := 'apex_error.t_error_result;'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(328) := '-------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  inside package and from other packages'||wwv_flow.LF||
'  function int_to_vc2('||wwv_flow.LF||
'    p_valu';
wwv_flow_imp.g_varchar2_table(329) := 'e           in number'||wwv_flow.LF||
'  ) return varchar2 deterministic;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(330) := '-------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  other packages, public and admin applicati';
wwv_flow_imp.g_varchar2_table(331) := 'on'||wwv_flow.LF||
'  function get_attribute_value('||wwv_flow.LF||
'    p_attribute_name  in varchar2'||wwv_flow.LF||
'  ) return varchar2 result_cach';
wwv_flow_imp.g_varchar2_table(332) := 'e;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(333) := '--  public and admin application process Initialize Items'||wwv_flow.LF||
'  procedure initialize_items('||wwv_flow.LF||
'    p_app_id';
wwv_flow_imp.g_varchar2_table(334) := '          in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(335) := '-------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 2'||wwv_flow.LF||
'  procedure get_post_details('||wwv_flow.LF||
'    p_post_id         in';
wwv_flow_imp.g_varchar2_table(336) := ' varchar2,'||wwv_flow.LF||
'    p_post_title      out nocopy varchar2,'||wwv_flow.LF||
'    p_post_desc       out nocopy varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(337) := ' p_post_category   out nocopy varchar2,'||wwv_flow.LF||
'    p_post_author     out nocopy varchar2,'||wwv_flow.LF||
'    p_post_publis';
wwv_flow_imp.g_varchar2_table(338) := 'hed  out nocopy varchar2,'||wwv_flow.LF||
'    p_post_modified   out nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_id    out nocop';
wwv_flow_imp.g_varchar2_table(339) := 'y varchar2,'||wwv_flow.LF||
'    p_next_post_title out nocopy varchar2,'||wwv_flow.LF||
'    p_prev_post_id    out nocopy varchar2,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(340) := '  p_prev_post_title out nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(341) := '-------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 14 Pre-Rendering Computations'||wwv_flow.LF||
'  functi';
wwv_flow_imp.g_varchar2_table(342) := 'on get_category_title('||wwv_flow.LF||
'    p_category_id     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(343) := '----------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 6 Pre';
wwv_flow_imp.g_varchar2_table(344) := '-Rendering Computations'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(345) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(346) := 'inside package and package BLOG_XML'||wwv_flow.LF||
'  procedure download_file('||wwv_flow.LF||
'    p_blob_content    in out nocopy b';
wwv_flow_imp.g_varchar2_table(347) := 'lob,'||wwv_flow.LF||
'    p_mime_type       in varchar2,'||wwv_flow.LF||
'    p_header_names    in apex_t_varchar2,'||wwv_flow.LF||
'    p_header_value';
wwv_flow_imp.g_varchar2_table(348) := 's   in apex_t_varchar2,'||wwv_flow.LF||
'    p_charset         in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(349) := '--------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Aj';
wwv_flow_imp.g_varchar2_table(350) := 'ax Callback process "download"'||wwv_flow.LF||
'  procedure download_file('||wwv_flow.LF||
'    p_file_path       in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(351) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pu';
wwv_flow_imp.g_varchar2_table(352) := 'blic app application process Redirect to search page'||wwv_flow.LF||
'  procedure redirect_search('||wwv_flow.LF||
'    p_value       ';
wwv_flow_imp.g_varchar2_table(353) := '    in varchar2,'||wwv_flow.LF||
'    p_app_id          in varchar2 default null,'||wwv_flow.LF||
'    p_page_id         in varchar2 d';
wwv_flow_imp.g_varchar2_table(354) := 'efault ''SEARCH'','||wwv_flow.LF||
'    p_session         in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(355) := '-------------------------------------------------'||wwv_flow.LF||
'end "BLOG_UTIL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG';
wwv_flow_imp.g_varchar2_table(356) := '_ADMIN"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(357) := '------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPT';
wwv_flow_imp.g_varchar2_table(358) := 'ION'||wwv_flow.LF||
'--    This package contains procedures and functions for the Admin application,'||wwv_flow.LF||
'--    including ';
wwv_flow_imp.g_varchar2_table(359) := 'operations content handling, and utility functions.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ==========================';
wwv_flow_imp.g_varchar2_table(360) := '=================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -';
wwv_flow_imp.g_varchar2_table(361) := '----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  26.04.2019   Jari La';
wwv_flow_imp.g_varchar2_table(362) := 'ine     Created package.'||wwv_flow.LF||
'--  10.01.2020   Jari Laine     Added procedures:'||wwv_flow.LF||
'--                       ';
wwv_flow_imp.g_varchar2_table(363) := '         - merge_files'||wwv_flow.LF||
'--                                - file_upload'||wwv_flow.LF||
'--  12.01.2020   Jari Laine  ';
wwv_flow_imp.g_varchar2_table(364) := '   Added function prepare_file_path.'||wwv_flow.LF||
'--  09.04.2020   Jari Laine     Updated procedures for case-ins';
wwv_flow_imp.g_varchar2_table(365) := 'ensitive tag handling.'||wwv_flow.LF||
'--  09.05.2020   Jari Laine     Changed input parameters from NUMBER to VARCH';
wwv_flow_imp.g_varchar2_table(366) := 'AR2.'||wwv_flow.LF||
'--                              Added functions:'||wwv_flow.LF||
'--                                - get_commen';
wwv_flow_imp.g_varchar2_table(367) := 't_post_id'||wwv_flow.LF||
'--                                - is_email'||wwv_flow.LF||
'--  10.05.2020   Jari Laine     Added procedu';
wwv_flow_imp.g_varchar2_table(368) := 're send_reply_notify to notify replies.'||wwv_flow.LF||
'--  12.05.2020   Jari Laine     Removed function prepare_fil';
wwv_flow_imp.g_varchar2_table(369) := 'e_path.'||wwv_flow.LF||
'--  17.05.2020   Jari Laine     Removed parameter `p_err_mesg` from function get_first_parag';
wwv_flow_imp.g_varchar2_table(370) := 'raph.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     Removed obsolete function get_post_title.'||wwv_flow.LF||
'--  24.05.2020   Jar';
wwv_flow_imp.g_varchar2_table(371) := 'i Laine     Added procedures:'||wwv_flow.LF||
'--                                - run_settings_post_expression'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(372) := '                             - run_feature_post_expression'||wwv_flow.LF||
'--                                - updat';
wwv_flow_imp.g_varchar2_table(373) := 'e_feature'||wwv_flow.LF||
'--  22.06.2020   Jari Laine     Fixed bug in function is_integer.'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(374) := '        Added parameters `p_min` and `p_max` to function is_integer.'||wwv_flow.LF||
'--  30.09.2020   Jari Laine    ';
wwv_flow_imp.g_varchar2_table(375) := ' Added procedure google_post_authentication.'||wwv_flow.LF||
'--  28.11.2020   Jari Laine     Renamed google_post_aut';
wwv_flow_imp.g_varchar2_table(376) := 'hentication to post_authentication.'||wwv_flow.LF||
'--                              Removed obsolete function get_co';
wwv_flow_imp.g_varchar2_table(377) := 'mment_post_id.'||wwv_flow.LF||
'--  28.02.2021   Jari Laine     Added function get_footer_link_seq.'||wwv_flow.LF||
'--  23.05.2021   ';
wwv_flow_imp.g_varchar2_table(378) := 'Jari Laine     Updated package to remove ORDS dependency.'||wwv_flow.LF||
'--  21.03.2021   Jari Laine     Updated pr';
wwv_flow_imp.g_varchar2_table(379) := 'ocedure get_blogger_details:'||wwv_flow.LF||
'--                                - Fetch authorization group name from';
wwv_flow_imp.g_varchar2_table(380) := ' BLOG_SETTINGS table.'||wwv_flow.LF||
'--                              Enhanced function remove_whitespace by adding ';
wwv_flow_imp.g_varchar2_table(381) := 'TRIM.'||wwv_flow.LF||
'--                              Updated add_category and add_tag to use remove_whitespace.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(382) := ' 11.04.2021   Jari Laine     Moved send_reply_notify to package BLOG_COMM.'||wwv_flow.LF||
'--  13.04.2021   Jari Lai';
wwv_flow_imp.g_varchar2_table(383) := 'ne     Renamed function get_footer_link_seq to get_modal_page_seq.'||wwv_flow.LF||
'--                              R';
wwv_flow_imp.g_varchar2_table(384) := 'emoved procedure run_feature_post_expression.'||wwv_flow.LF||
'--                              Updated procedure post';
wwv_flow_imp.g_varchar2_table(385) := '_authentication.'||wwv_flow.LF||
'--  18.04.2021   Jari Laine     Moved function is_email to package BLOG_COMM.'||wwv_flow.LF||
'--  0';
wwv_flow_imp.g_varchar2_table(386) := '5.01.2022   Jari Laine     Removed unused parameters/variables from:'||wwv_flow.LF||
'--                             ';
wwv_flow_imp.g_varchar2_table(387) := '   - post_authentication'||wwv_flow.LF||
'--                                - update_feature'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(388) := '          - get_blogger_details'||wwv_flow.LF||
'--                                - add_blogger'||wwv_flow.LF||
'--  27.03.2022   Jar';
wwv_flow_imp.g_varchar2_table(389) := 'i Laine     Fixed bug in get_first_paragraph for nested elements.'||wwv_flow.LF||
'--                              Re';
wwv_flow_imp.g_varchar2_table(390) := 'moved obsolete procedures:'||wwv_flow.LF||
'--                                - remove_unused_tags'||wwv_flow.LF||
'--                ';
wwv_flow_imp.g_varchar2_table(391) := '                - purge_post_preview'||wwv_flow.LF||
'--                                - purge_post_preview_job'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(392) := '                              - save_post_preview'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Fixed error messag';
wwv_flow_imp.g_varchar2_table(393) := 'e handling in functions:'||wwv_flow.LF||
'--                                - is_integer'||wwv_flow.LF||
'--                          ';
wwv_flow_imp.g_varchar2_table(394) := '      - is_url'||wwv_flow.LF||
'--                                - is_date_format'||wwv_flow.LF||
'--  01.05.2022   Jari Laine     Si';
wwv_flow_imp.g_varchar2_table(395) := 'mplified logic in function request_to_post_status.'||wwv_flow.LF||
'--  07.05.2022   Jari Laine     Added procedures:';
wwv_flow_imp.g_varchar2_table(396) := ''||wwv_flow.LF||
'--                                - remove_unused_tags'||wwv_flow.LF||
'--                                - remove_u';
wwv_flow_imp.g_varchar2_table(397) := 'nused_categories'||wwv_flow.LF||
'--                              Changed add_tag from private to public.'||wwv_flow.LF||
'--         ';
wwv_flow_imp.g_varchar2_table(398) := '                     Removed obsolete functions:'||wwv_flow.LF||
'--                                - get_post_tags'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(399) := '-                                - get_category_title'||wwv_flow.LF||
'--                              Added procedur';
wwv_flow_imp.g_varchar2_table(400) := 'es:'||wwv_flow.LF||
'--                                - resequence_link_groups'||wwv_flow.LF||
'--                                - r';
wwv_flow_imp.g_varchar2_table(401) := 'esequence_links'||wwv_flow.LF||
'--                                - resequence_categories'||wwv_flow.LF||
'--                        ';
wwv_flow_imp.g_varchar2_table(402) := '        - resequence_tags'||wwv_flow.LF||
'--  09.05.2022   Jari Laine     Removed obsolete procedure run_settings_po';
wwv_flow_imp.g_varchar2_table(403) := 'st_expression.'||wwv_flow.LF||
'--  08.03.2023   Jari Laine     Updated function is_date_format to validate as DATE i';
wwv_flow_imp.g_varchar2_table(404) := 'nstead of TIMESTAMP.'||wwv_flow.LF||
'--  03.04.2023   Jari Laine     Converted function file_upload to procedure wit';
wwv_flow_imp.g_varchar2_table(405) := 'h OUT parameter.'||wwv_flow.LF||
'--  28.05.2023   Jari Laine     Added function request_to_post_success_message.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(406) := ' 01.06.2023   Jari Laine     Removed procedure file_upload.'||wwv_flow.LF||
'--                              Added fu';
wwv_flow_imp.g_varchar2_table(407) := 'nction file_exists.'||wwv_flow.LF||
'--                              Updated procedure merge_files.'||wwv_flow.LF||
'--  30.07.2023   ';
wwv_flow_imp.g_varchar2_table(408) := 'Jari Laine     Updated procedure post_authentication:'||wwv_flow.LF||
'--                                - Check if w';
wwv_flow_imp.g_varchar2_table(409) := 'orkspace user is locked.'||wwv_flow.LF||
'--                                - Replaced apex_util.set_build_option_sta';
wwv_flow_imp.g_varchar2_table(410) := 'tus with'||wwv_flow.LF||
'--                                  apex_application_admin.set_build_option_status.'||wwv_flow.LF||
'--  10.';
wwv_flow_imp.g_varchar2_table(411) := '03.2024   Jari Laine     Bug fix in post_authentication to check only the current workspace.'||wwv_flow.LF||
'--  08.';
wwv_flow_imp.g_varchar2_table(412) := '04.2024   Jari Laine     Removed functions:'||wwv_flow.LF||
'--                                - request_to_post_succ';
wwv_flow_imp.g_varchar2_table(413) := 'ess_message'||wwv_flow.LF||
'--                                - request_to_link_success_message'||wwv_flow.LF||
'--  11.04.2024   Jar';
wwv_flow_imp.g_varchar2_table(414) := 'i Laine     Added procedure resequence_dynamic_content.'||wwv_flow.LF||
'--  21.07.2024   Jari Laine     Added proced';
wwv_flow_imp.g_varchar2_table(415) := 'ures:'||wwv_flow.LF||
'--                                - update_feature (accepts build option name as parameter)'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(416) := '                                - set_attribute_value'||wwv_flow.LF||
'--                              Moved file rep';
wwv_flow_imp.g_varchar2_table(417) := 'ository-related procedures/functions to BLOG_FILE package.'||wwv_flow.LF||
'--                              Removed p';
wwv_flow_imp.g_varchar2_table(418) := 'rocedure update_text_messages.'||wwv_flow.LF||
'--  25.08.2024   Jari Laine     Moved function remove_whitespace to p';
wwv_flow_imp.g_varchar2_table(419) := 'ackage BLOG_UTIL.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine     Changes to procedure update_feature'||wwv_flow.LF||
'--  02.07.2025';
wwv_flow_imp.g_varchar2_table(420) := '   Jari Laine     Package renamed BLOG_CM -> BLOG_ADMIN'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(421) := '---------------------------------------'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(422) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app application authentication scheme Google'||wwv_flow.LF||
'  proced';
wwv_flow_imp.g_varchar2_table(423) := 'ure post_authentication;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(424) := '-----'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app application processes'||wwv_flow.LF||
'  procedure get_blogger_details('||wwv_flow.LF||
'    p_app';
wwv_flow_imp.g_varchar2_table(425) := '_id            in varchar2,'||wwv_flow.LF||
'    p_username          in varchar2,'||wwv_flow.LF||
'    p_user_id           out nocopy ';
wwv_flow_imp.g_varchar2_table(426) := 'number,'||wwv_flow.LF||
'    p_name              out nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(427) := '-------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 14'||wwv_flow.LF||
'  function get_category_';
wwv_flow_imp.g_varchar2_table(428) := 'seq return varchar2;'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(429) := '-'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 52'||wwv_flow.LF||
'  function get_link_grp_seq return varchar2;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(430) := '-----------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page';
wwv_flow_imp.g_varchar2_table(431) := ' 81'||wwv_flow.LF||
'  function get_modal_page_seq return varchar2;'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(432) := '-------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 51'||wwv_flow.LF||
'  function get_link_seq('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(433) := '_link_group_id     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(434) := '--------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  function request_to_post_st';
wwv_flow_imp.g_varchar2_table(435) := 'atus('||wwv_flow.LF||
'    p_request           in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(436) := '-------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  function get_fir';
wwv_flow_imp.g_varchar2_table(437) := 'st_paragraph('||wwv_flow.LF||
'    p_body_html         in clob'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(438) := '-----------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12 Processing pro';
wwv_flow_imp.g_varchar2_table(439) := 'cess "Process Category"'||wwv_flow.LF||
'  procedure add_category('||wwv_flow.LF||
'    p_category_title    in varchar2,'||wwv_flow.LF||
'    p_categor';
wwv_flow_imp.g_varchar2_table(440) := 'y_id       out nocopy number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(441) := '--------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 14'||wwv_flow.LF||
'  procedure remove_unused_categories;'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(442) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin ap';
wwv_flow_imp.g_varchar2_table(443) := 'p page 16 and inside this package'||wwv_flow.LF||
'  procedure add_tag('||wwv_flow.LF||
'    p_tag               in varchar2,'||wwv_flow.LF||
'    p_ta';
wwv_flow_imp.g_varchar2_table(444) := 'g_id            out nocopy number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(445) := '-------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  procedure add_post_tags('||wwv_flow.LF||
'    p_post_id  ';
wwv_flow_imp.g_varchar2_table(446) := '         in varchar2,'||wwv_flow.LF||
'    p_tags              in varchar2,'||wwv_flow.LF||
'    p_sep               in varchar2 defau';
wwv_flow_imp.g_varchar2_table(447) := 'lt '','''||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Call';
wwv_flow_imp.g_varchar2_table(448) := 'ed from:'||wwv_flow.LF||
'--  admin app page 15'||wwv_flow.LF||
'  procedure remove_unused_tags;'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(449) := '-------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20012 validation "Is ';
wwv_flow_imp.g_varchar2_table(450) := 'Integer"'||wwv_flow.LF||
'  function is_integer('||wwv_flow.LF||
'    p_value             in varchar2,'||wwv_flow.LF||
'    p_min               in numb';
wwv_flow_imp.g_varchar2_table(451) := 'er,'||wwv_flow.LF||
'    p_max               in number,'||wwv_flow.LF||
'    p_err_mesg          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(452) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  adm';
wwv_flow_imp.g_varchar2_table(453) := 'in app page 20012 validation "Is URL"'||wwv_flow.LF||
'  function is_url('||wwv_flow.LF||
'    p_value             in varchar2,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(454) := 'err_mesg          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(455) := '-------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20012 validation "Is date format"';
wwv_flow_imp.g_varchar2_table(456) := ''||wwv_flow.LF||
'  function is_date_format('||wwv_flow.LF||
'    p_value             in varchar2,'||wwv_flow.LF||
'    p_err_mesg          in varchar2';
wwv_flow_imp.g_varchar2_table(457) := ''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(458) := '--'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20011 Processing process "Features - Save Interactive Grid Dat';
wwv_flow_imp.g_varchar2_table(459) := 'a"'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_app_id            in number,'||wwv_flow.LF||
'    p_build_option_id   in number,';
wwv_flow_imp.g_varchar2_table(460) := ''||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(461) := '----------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20017 and 20018'||wwv_flow.LF||
'--  package blog_ai and bl';
wwv_flow_imp.g_varchar2_table(462) := 'og_oci_os'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_build_option_name in varchar2,'||wwv_flow.LF||
'    p_build_status      i';
wwv_flow_imp.g_varchar2_table(463) := 'n varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(464) := 'Called from:'||wwv_flow.LF||
'--  admin app page 14'||wwv_flow.LF||
'  procedure resequence_categories;'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(465) := '--------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 16'||wwv_flow.LF||
'  procedure';
wwv_flow_imp.g_varchar2_table(466) := ' resequence_tags('||wwv_flow.LF||
'    p_post_id           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(467) := '---------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 50'||wwv_flow.LF||
'  procedure resequence';
wwv_flow_imp.g_varchar2_table(468) := '_link_groups;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Ca';
wwv_flow_imp.g_varchar2_table(469) := 'lled from:'||wwv_flow.LF||
'--  admin app page 50'||wwv_flow.LF||
'  procedure resequence_links('||wwv_flow.LF||
'    p_link_group_id     in varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(470) := ' );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:';
wwv_flow_imp.g_varchar2_table(471) := ''||wwv_flow.LF||
'--  admin app page 80'||wwv_flow.LF||
'  procedure resequence_dynamic_content;'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(472) := '-------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--'||wwv_flow.LF||
'  procedure set_attribute_value('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(473) := 'p_attribute_list    in apex_t_varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(474) := '------------------------'||wwv_flow.LF||
'end "BLOG_ADMIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_PLUGIN"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(475) := 'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(476) := '----------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    This package';
wwv_flow_imp.g_varchar2_table(477) := ' contains procedures for rendering, validating, and handling AJAX requests for APEX plugins.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(478) := 'CHANGE LOG'||wwv_flow.LF||
'--  ============================================================================'||wwv_flow.LF||
'--  DATE';
wwv_flow_imp.g_varchar2_table(479) := '         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  --------------------------------';
wwv_flow_imp.g_varchar2_table(480) := '----------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  03.01.2020   Jari Laine     Ad';
wwv_flow_imp.g_varchar2_table(481) := 'ded comments to package specification.'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Bug fix in validate_math_ques';
wwv_flow_imp.g_varchar2_table(482) := 'tion_field.'||wwv_flow.LF||
'--                              Improved error message handling.'||wwv_flow.LF||
'--  07.05.2023   Jari L';
wwv_flow_imp.g_varchar2_table(483) := 'aine     Minor changes to enhance code readability.'||wwv_flow.LF||
'--  17.07.2024   Jari Laine     Removed deprecat';
wwv_flow_imp.g_varchar2_table(484) := 'ed apex_plugin.get_input_name_for_page_item usage.'||wwv_flow.LF||
'--                              Modified render p';
wwv_flow_imp.g_varchar2_table(485) := 'rocedure to pass label ID to JavaScript during load.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(486) := '------------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(487) := '-----------------'||wwv_flow.LF||
'  procedure render_math_question_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_';
wwv_flow_imp.g_varchar2_table(488) := 'item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_it';
wwv_flow_imp.g_varchar2_table(489) := 'em_render_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_render_result'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(490) := '---------------------------------------------------------------'||wwv_flow.LF||
'  procedure ajax_math_question_field';
wwv_flow_imp.g_varchar2_table(491) := '('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(492) := '    p_param   in            apex_plugin.t_item_ajax_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t';
wwv_flow_imp.g_varchar2_table(493) := '_item_ajax_result'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(494) := '---'||wwv_flow.LF||
'  procedure validate_math_question_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(495) := 'plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_validatio';
wwv_flow_imp.g_varchar2_table(496) := 'n_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_validation_result'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(497) := '-----------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_PLUGIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace p';
wwv_flow_imp.g_varchar2_table(498) := 'ackage "BLOG_URL"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(499) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(500) := '  DESCRIPTION:'||wwv_flow.LF||
'--    This package contains functions to generate various types of URLs'||wwv_flow.LF||
'--    for the';
wwv_flow_imp.g_varchar2_table(501) := ' blog application. The URLs support different content types,'||wwv_flow.LF||
'--    such as posts, categories, archiv';
wwv_flow_imp.g_varchar2_table(502) := 'es, tags, and dynamic pages,'||wwv_flow.LF||
'--    while offering flexibility with canonical options and APEX integr';
wwv_flow_imp.g_varchar2_table(503) := 'ations.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ======================================================================';
wwv_flow_imp.g_varchar2_table(504) := '======'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  -----------------';
wwv_flow_imp.g_varchar2_table(505) := '-------------------------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  09.05.2020   Ja';
wwv_flow_imp.g_varchar2_table(506) := 'ri Laine     Changed number input/output parameters to VARCHAR2 for APEX usage.'||wwv_flow.LF||
'--                  ';
wwv_flow_imp.g_varchar2_table(507) := '            Added canonical URL parameter to functions.'||wwv_flow.LF||
'--                              Created addi';
wwv_flow_imp.g_varchar2_table(508) := 'tional signatures for APEX usage.'||wwv_flow.LF||
'--  10.05.2020   Jari Laine     Added new function get_unsubscribe';
wwv_flow_imp.g_varchar2_table(509) := '.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     Hardcoded page and item names.'||wwv_flow.LF||
'--                              Rem';
wwv_flow_imp.g_varchar2_table(510) := 'oved global constants from BLOG_UTIL package.'||wwv_flow.LF||
'--  23.05.2020   Jari Laine     Removed default value ';
wwv_flow_imp.g_varchar2_table(511) := 'for get_tab parameter p_app_page_id.'||wwv_flow.LF||
'--  13.11.2021   Jari Laine     Added functions get_sitemap_ind';
wwv_flow_imp.g_varchar2_table(512) := 'ex, get_rss, and get_rss_xsl.'||wwv_flow.LF||
'--  18.12.2021   Jari Laine     Moved procedure redirect_search to BLO';
wwv_flow_imp.g_varchar2_table(513) := 'G_UTIL.'||wwv_flow.LF||
'--  14.03.2022   Jari Laine     Added new function get_canonical_host.'||wwv_flow.LF||
'--  24.11.2022   Jari';
wwv_flow_imp.g_varchar2_table(514) := ' Laine     Added new function get_dynamic_page.'||wwv_flow.LF||
'--                              Removed unused param';
wwv_flow_imp.g_varchar2_table(515) := 'eters from functions.'||wwv_flow.LF||
'--                              Hardcoded values moved to package private cons';
wwv_flow_imp.g_varchar2_table(516) := 'tants.'||wwv_flow.LF||
'--  18.11.2023   Jari Laine     Added new function get_atom.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(517) := 'Changed private constants to a JSON object.'||wwv_flow.LF||
'--  23.07.2024   Jari Laine     Added new function get_f';
wwv_flow_imp.g_varchar2_table(518) := 'ile.'||wwv_flow.LF||
'--  01.02.2025   Jari Laine     Added new procedure set_canonical_host and package initializati';
wwv_flow_imp.g_varchar2_table(519) := 'on code.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(520) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--'||wwv_flow.LF||
'  funct';
wwv_flow_imp.g_varchar2_table(521) := 'ion get_canonical_host return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(522) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_xml'||wwv_flow.LF||
'  function get_tab('||wwv_flow.LF||
'    p_page ';
wwv_flow_imp.g_varchar2_table(523) := '           in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_canonical       in var';
wwv_flow_imp.g_varchar2_table(524) := 'char2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(525) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_comm, blog_xml'||wwv_flow.LF||
'-- view blog_v_posts'||wwv_flow.LF||
'  function';
wwv_flow_imp.g_varchar2_table(526) := ' get_post('||wwv_flow.LF||
'    p_post_id         in number,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_ca';
wwv_flow_imp.g_varchar2_table(527) := 'nonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(528) := '----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(529) := 'get_post('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_c';
wwv_flow_imp.g_varchar2_table(530) := 'anonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(531) := '-----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog_xml and view blog_v_catego';
wwv_flow_imp.g_varchar2_table(532) := 'ries'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_id     in number,'||wwv_flow.LF||
'    p_canonical       in varchar2 def';
wwv_flow_imp.g_varchar2_table(533) := 'ault ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(534) := '-----------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_';
wwv_flow_imp.g_varchar2_table(535) := 'id     in varchar2,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(536) := '--------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog';
wwv_flow_imp.g_varchar2_table(537) := '_xml and view blog_v_archive_year'||wwv_flow.LF||
'  function get_archive('||wwv_flow.LF||
'    p_archive_id      in number,'||wwv_flow.LF||
'    p_can';
wwv_flow_imp.g_varchar2_table(538) := 'onical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(539) := '---------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  function g';
wwv_flow_imp.g_varchar2_table(540) := 'et_archive('||wwv_flow.LF||
'    p_archive_id      in varchar2,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) re';
wwv_flow_imp.g_varchar2_table(541) := 'turn varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- C';
wwv_flow_imp.g_varchar2_table(542) := 'alled from:'||wwv_flow.LF||
'-- package blog_xml and view blog_v_post_tags'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id          ';
wwv_flow_imp.g_varchar2_table(543) := 'in number,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(544) := '-----------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, b';
wwv_flow_imp.g_varchar2_table(545) := 'log_url'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id          in varchar2,'||wwv_flow.LF||
'    p_canonical       in varchar2 def';
wwv_flow_imp.g_varchar2_table(546) := 'ault ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(547) := '-----------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- view blog_v_dynamic_content'||wwv_flow.LF||
'  function get_dynamic_page('||wwv_flow.LF||
'    p_conten';
wwv_flow_imp.g_varchar2_table(548) := 't_id      in number'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(549) := '---------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_url, blog_xml'||wwv_flow.LF||
'  function get_process('||wwv_flow.LF||
'    p_a';
wwv_flow_imp.g_varchar2_table(550) := 'pplication     in varchar2 default null,'||wwv_flow.LF||
'    p_process         in varchar2 default null,'||wwv_flow.LF||
'    p_items';
wwv_flow_imp.g_varchar2_table(551) := '           in varchar2 default null,'||wwv_flow.LF||
'    p_values          in varchar2 default null,'||wwv_flow.LF||
'    p_canonical';
wwv_flow_imp.g_varchar2_table(552) := '       in varchar2 default ''YES'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(553) := '----------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog_comm'||wwv_flow.LF||
'  function get_unsubscribe('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(554) := '    p_application     in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_subscription_id in numbe';
wwv_flow_imp.g_varchar2_table(555) := 'r'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(556) := '---'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_xml'||wwv_flow.LF||
'-- Blog Administration > Lists > Public Applicat';
wwv_flow_imp.g_varchar2_table(557) := 'ion Links'||wwv_flow.LF||
'  function get_rss('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(558) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- pa';
wwv_flow_imp.g_varchar2_table(559) := 'ckages blog_html, blog_xml'||wwv_flow.LF||
'-- Blog Administration > Lists > Public Application Links'||wwv_flow.LF||
'  function get_';
wwv_flow_imp.g_varchar2_table(560) := 'atom('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(561) := '------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_xml'||wwv_flow.LF||
'  functi';
wwv_flow_imp.g_varchar2_table(562) := 'on get_rss_xsl('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(563) := '----------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Blog Administra';
wwv_flow_imp.g_varchar2_table(564) := 'tion > Lists > Public Application Links'||wwv_flow.LF||
'  function get_sitemap_index('||wwv_flow.LF||
'    p_application     in varch';
wwv_flow_imp.g_varchar2_table(565) := 'ar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(566) := '------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Blog Administration abd Public Application'||wwv_flow.LF||
'  function get_fil';
wwv_flow_imp.g_varchar2_table(567) := 'e('||wwv_flow.LF||
'    p_file_path       in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_canonica';
wwv_flow_imp.g_varchar2_table(568) := 'l       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(569) := '----------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(570) := '---------------'||wwv_flow.LF||
'end "BLOG_URL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_COMMENT"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(571) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(572) := '------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    This package provides p';
wwv_flow_imp.g_varchar2_table(573) := 'rocedures and functions for managing post comments,'||wwv_flow.LF||
'--    including functionality for replying, flag';
wwv_flow_imp.g_varchar2_table(574) := 'ging, email validation, and HTML content processing.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  =========================';
wwv_flow_imp.g_varchar2_table(575) := '==================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(576) := '-----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  11.05.2020   Jari L';
wwv_flow_imp.g_varchar2_table(577) := 'aine     Created package.'||wwv_flow.LF||
'--  11.04.2021   Jari Laine     Added new procedure:'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(578) := '             - reply_notify'||wwv_flow.LF||
'--                              Added new functions:'||wwv_flow.LF||
'--                 ';
wwv_flow_imp.g_varchar2_table(579) := '               - validate_email'||wwv_flow.LF||
'--                                - is_email_verified'||wwv_flow.LF||
'--  18.04.2021';
wwv_flow_imp.g_varchar2_table(580) := '   Jari Laine     Added new function is_email.'||wwv_flow.LF||
'--  30.10.2021   Jari Laine     Removed obsolete func';
wwv_flow_imp.g_varchar2_table(581) := 'tions:'||wwv_flow.LF||
'--                                - validate_email'||wwv_flow.LF||
'--                                - is_ema';
wwv_flow_imp.g_varchar2_table(582) := 'il_verified'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Enhanced flagging functionality:'||wwv_flow.LF||
'--                     ';
wwv_flow_imp.g_varchar2_table(583) := '           - Procedure flag_comment: Supports adding multiple flags.'||wwv_flow.LF||
'--                             ';
wwv_flow_imp.g_varchar2_table(584) := '   - Procedure unflag_comment: Supports removing multiple flags.'||wwv_flow.LF||
'--  27.11.2022   Jari Laine     Upd';
wwv_flow_imp.g_varchar2_table(585) := 'ated procedure build_code_tab:'||wwv_flow.LF||
'--                                - Removed leading and trailing line';
wwv_flow_imp.g_varchar2_table(586) := ' breaks from posted code.'||wwv_flow.LF||
'--  15.08.2024   Jari Laine     Modified and renamed procedure:'||wwv_flow.LF||
'--        ';
wwv_flow_imp.g_varchar2_table(587) := '                        - remove_anchor to remove_html_tags'||wwv_flow.LF||
'--                              Added ne';
wwv_flow_imp.g_varchar2_table(588) := 'w functions:'||wwv_flow.LF||
'--                                - plain_text'||wwv_flow.LF||
'--                                - shor';
wwv_flow_imp.g_varchar2_table(589) := 't_text'||wwv_flow.LF||
'--                              Updated procedure:'||wwv_flow.LF||
'--                                - build_';
wwv_flow_imp.g_varchar2_table(590) := 'comment_html'||wwv_flow.LF||
'--  02.07.2025   Jari Laine     Package renamed BLOG_COMM -> BLOG_COMMENTS'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  =====';
wwv_flow_imp.g_varchar2_table(591) := '======================================================================='||wwv_flow.LF||
'--  TO DO:'||wwv_flow.LF||
'--  =============';
wwv_flow_imp.g_varchar2_table(592) := '==============================================================='||wwv_flow.LF||
'--  #1 Improve HTML validation for c';
wwv_flow_imp.g_varchar2_table(593) := 'omment content.'||wwv_flow.LF||
'--  #2 Enhance email validation logic to handle edge cases.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(594) := '-----------------------------------------------------------'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(595) := '----------------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  --  admin ap';
wwv_flow_imp.g_varchar2_table(596) := 'p pages 62'||wwv_flow.LF||
'  function plain_text('||wwv_flow.LF||
'    p_string          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(597) := '---------------------------------------------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --'||wwv_flow.LF||
'  funct';
wwv_flow_imp.g_varchar2_table(598) := 'ion short_text('||wwv_flow.LF||
'    p_string          in varchar2,'||wwv_flow.LF||
'    p_plain_text      in boolean default true,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(599) := '  p_str_length      in number default 100'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(600) := '-------------------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(601) := 'format_comment('||wwv_flow.LF||
'    p_comment         in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(602) := '---------------------------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  f';
wwv_flow_imp.g_varchar2_table(603) := 'unction validate_comment('||wwv_flow.LF||
'    p_comment         in varchar2,'||wwv_flow.LF||
'    p_max_length      in number default';
wwv_flow_imp.g_varchar2_table(604) := ' 4000'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(605) := '-------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  --  admin app page 20012'||wwv_flow.LF||
'  function is_email(';
wwv_flow_imp.g_varchar2_table(606) := ''||wwv_flow.LF||
'    p_email           in varchar2,'||wwv_flow.LF||
'    p_err_mesg        in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(607) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public a';
wwv_flow_imp.g_varchar2_table(608) := 'pp page 1001'||wwv_flow.LF||
'--  admin app pages 61'||wwv_flow.LF||
'  procedure flag_comment('||wwv_flow.LF||
'    p_comment_id      in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(609) := ' p_flags           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(610) := '----------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app pages 61'||wwv_flow.LF||
'  procedure unflag_comment('||wwv_flow.LF||
'    p_comment_id';
wwv_flow_imp.g_varchar2_table(611) := '      in varchar2,'||wwv_flow.LF||
'    p_flags           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(612) := '--------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  procedure new_comm';
wwv_flow_imp.g_varchar2_table(613) := 'ent_notify('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_email_templa';
wwv_flow_imp.g_varchar2_table(614) := 'te  in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(615) := '-'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  admin app pages 62'||wwv_flow.LF||
'  procedure reply_notify('||wwv_flow.LF||
'    p_app_id          in varc';
wwv_flow_imp.g_varchar2_table(616) := 'har2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_email_template  in';
wwv_flow_imp.g_varchar2_table(617) := ' varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- C';
wwv_flow_imp.g_varchar2_table(618) := 'alled from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  procedure subscribe('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(619) := '_email           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(620) := '--------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 2'||wwv_flow.LF||
'  procedure unsubscribe('||wwv_flow.LF||
'    p_subscription_id ';
wwv_flow_imp.g_varchar2_table(621) := 'in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(622) := ' Called from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  procedure auto_approve('||wwv_flow.LF||
'    p_comment_id      in varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(623) := ' );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_COMME';
wwv_flow_imp.g_varchar2_table(624) := 'NT";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_HTML"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(625) := '-------------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(626) := '------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    This package contains functions and procedures for g';
wwv_flow_imp.g_varchar2_table(627) := 'enerating and returning'||wwv_flow.LF||
'--    HTML code, including canonical links, meta tags, RSS/Atom links, and b';
wwv_flow_imp.g_varchar2_table(628) := 'uttons.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ======================================================================';
wwv_flow_imp.g_varchar2_table(629) := '======'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  -----------------';
wwv_flow_imp.g_varchar2_table(630) := '-------------------------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  29.04.2020   Ja';
wwv_flow_imp.g_varchar2_table(631) := 'ri Laine     Added function get_robots_noindex_meta.'||wwv_flow.LF||
'--                              Updated canonic';
wwv_flow_imp.g_varchar2_table(632) := 'al link functions to return'||wwv_flow.LF||
'--                              robots noindex meta tag if canonical lin';
wwv_flow_imp.g_varchar2_table(633) := 'k generation fails.'||wwv_flow.LF||
'--                              Added apex_debug to meta and canonical link func';
wwv_flow_imp.g_varchar2_table(634) := 'tions.'||wwv_flow.LF||
'--  10.05.2020   Jari Laine     Integrated blog_url functions for parameter p_canonical.'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(635) := '19.05.2020   Jari Laine     Removed obsolete function get_search_button.'||wwv_flow.LF||
'--  06.07.2020   Jari Laine';
wwv_flow_imp.g_varchar2_table(636) := '     Added parameter p_rss_url to functions get_rss_link and get_rss_anchor.'||wwv_flow.LF||
'--                     ';
wwv_flow_imp.g_varchar2_table(637) := '         Removed p_build_option_status parameter from get_rss_link.'||wwv_flow.LF||
'--  13.11.2021   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(638) := 'Modified get_rss_anchor and get_rss_link.'||wwv_flow.LF||
'--                              Removed obsolete functions';
wwv_flow_imp.g_varchar2_table(639) := '.'||wwv_flow.LF||
'--  27.03.2022   Jari Laine     Added parameters p_build_option and p_message to get_rss_link.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(640) := '                             Added p_message to get_rss_anchor.'||wwv_flow.LF||
'--  27.04.2022   Jari Laine     Remo';
wwv_flow_imp.g_varchar2_table(641) := 'ved obsolete functions get_tag_anchor and get_post_tags.'||wwv_flow.LF||
'--  16.11.2022   Jari Laine     Removed obs';
wwv_flow_imp.g_varchar2_table(642) := 'olete functions get_post_description_meta and get_description_meta.'||wwv_flow.LF||
'--  25.11.2022   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(643) := 'Removed unused parameters.'||wwv_flow.LF||
'--  30.07.2023   Jari Laine     Replaced apex_util.get_build_option_statu';
wwv_flow_imp.g_varchar2_table(644) := 's with'||wwv_flow.LF||
'--                              apex_application_admin.get_build_option_status.'||wwv_flow.LF||
'--  18.11.202';
wwv_flow_imp.g_varchar2_table(645) := '3   Jari Laine     Added new function get_atom_link.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     Converted canon';
wwv_flow_imp.g_varchar2_table(646) := 'ical link functions to procedures:'||wwv_flow.LF||
'--                              - get_tab_canonical_link -> set_t';
wwv_flow_imp.g_varchar2_table(647) := 'ab_canonical_link'||wwv_flow.LF||
'--                              - get_post_canonical_link -> set_post_canonical_li';
wwv_flow_imp.g_varchar2_table(648) := 'nk'||wwv_flow.LF||
'--                              - get_category_canonical_link -> set_category_canonical_link'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(649) := '                            - get_archive_canonical_link -> set_archive_canonical_link'||wwv_flow.LF||
'--           ';
wwv_flow_imp.g_varchar2_table(650) := '                   - get_tag_canonical_link -> set_tag_canonical_link.'||wwv_flow.LF||
'--  10.04.2024   Jari Laine  ';
wwv_flow_imp.g_varchar2_table(651) := '   Added function get_page_canonical_link.'||wwv_flow.LF||
'--                              Renamed procedures for ca';
wwv_flow_imp.g_varchar2_table(652) := 'nonical links as listed above.'||wwv_flow.LF||
'--                              Updated get_rss_link and get_atom_lin';
wwv_flow_imp.g_varchar2_table(653) := 'k.'||wwv_flow.LF||
'--  18.04.2024   Jari Laine     Added new function get_button.'||wwv_flow.LF||
'--  01.02.2025   Jari Laine     Re';
wwv_flow_imp.g_varchar2_table(654) := 'moved function get_page_canonical_link.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(655) := '-----------------------'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(656) := '----'||wwv_flow.LF||
'  function get_robots_noindex_meta return varchar2;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(657) := '-------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_TAB'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(658) := ' function set_tab_canonical_link('||wwv_flow.LF||
'    p_page            in varchar2,'||wwv_flow.LF||
'    p_url             out nocop';
wwv_flow_imp.g_varchar2_table(659) := 'y varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(660) := '------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_POST'||wwv_flow.LF||
'  function set_post_canon';
wwv_flow_imp.g_varchar2_table(661) := 'ical_link('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return v';
wwv_flow_imp.g_varchar2_table(662) := 'archar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called ';
wwv_flow_imp.g_varchar2_table(663) := 'from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY'||wwv_flow.LF||
'  function set_category_canonical_link('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(664) := 'p_category_id     in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(665) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub a';
wwv_flow_imp.g_varchar2_table(666) := 'pp shortcut BLOG_CANONICAL_LINK_ARCHIVE'||wwv_flow.LF||
'  function set_archive_canonical_link('||wwv_flow.LF||
'    p_archive_id     ';
wwv_flow_imp.g_varchar2_table(667) := ' in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(668) := '---------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_';
wwv_flow_imp.g_varchar2_table(669) := 'CANONICAL_LINK_TAG'||wwv_flow.LF||
'  function set_tag_canonical_link('||wwv_flow.LF||
'    p_tag_id          in varchar2,'||wwv_flow.LF||
'    p_url  ';
wwv_flow_imp.g_varchar2_table(670) := '           out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(671) := '--------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_RSS_ANCHOR'||wwv_flow.LF||
'  function get';
wwv_flow_imp.g_varchar2_table(672) := '_rss_anchor('||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_message         in varchar2'||wwv_flow.LF||
'  ) return varchar';
wwv_flow_imp.g_varchar2_table(673) := '2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(674) := '--  pub app shortcut BLOG_RSS_LINK'||wwv_flow.LF||
'  function get_rss_link('||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(675) := '_app_name        in varchar2,'||wwv_flow.LF||
'    p_message         in varchar2,'||wwv_flow.LF||
'    p_build_option    in varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(676) := ' ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(677) := ''||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_ATOM_LINK'||wwv_flow.LF||
'  function get_atom_link('||wwv_flow.LF||
'    p_app_id         ';
wwv_flow_imp.g_varchar2_table(678) := ' in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_message         in varchar2,'||wwv_flow.LF||
'    p_build_opti';
wwv_flow_imp.g_varchar2_table(679) := 'on    in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(680) := '-------------------'||wwv_flow.LF||
'  function get_button('||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_title           ';
wwv_flow_imp.g_varchar2_table(681) := 'in varchar2,'||wwv_flow.LF||
'    p_action          in varchar2,'||wwv_flow.LF||
'    p_icon_classes    in varchar2,'||wwv_flow.LF||
'    p_button_clas';
wwv_flow_imp.g_varchar2_table(682) := 'ses  in varchar2 default null,'||wwv_flow.LF||
'    p_build_option    in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(683) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure prn_html';
wwv_flow_imp.g_varchar2_table(684) := '('||wwv_flow.LF||
'    p_markdown      in apex_application_global.vc_arr2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(685) := '------------------------------------------'||wwv_flow.LF||
'end "BLOG_HTML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_OCI_OS';
wwv_flow_imp.g_varchar2_table(686) := '"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(687) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(688) := '-    Procedure and functions for Oracle cloud object storage'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CREDITS:'||wwv_flow.LF||
'--    https://blogs.ora';
wwv_flow_imp.g_varchar2_table(689) := 'cle.com/oraclemagazine/post/better-file-storage-in-oracle-cloud'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ==============';
wwv_flow_imp.g_varchar2_table(690) := '=============================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCR';
wwv_flow_imp.g_varchar2_table(691) := 'IPTION'||wwv_flow.LF||
'--  -----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  21.07.20';
wwv_flow_imp.g_varchar2_table(692) := '25   Jari Laine     Created package.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine     New function get_param_value'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(693) := '                              Changes to procedure set_object_storage'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(694) := '-----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(695) := '----------------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_name        in varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(696) := ' ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(697) := ''||wwv_flow.LF||
'  procedure set_object_storage('||wwv_flow.LF||
'    p_bucket_name       in varchar2,'||wwv_flow.LF||
'    p_base_url          in var';
wwv_flow_imp.g_varchar2_table(698) := 'char2,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(699) := '----------------------------'||wwv_flow.LF||
'  procedure upload_object('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'    p_d';
wwv_flow_imp.g_varchar2_table(700) := 'ir               in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_cache_control     in varcha';
wwv_flow_imp.g_varchar2_table(701) := 'r2 default null,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file    in varchar';
wwv_flow_imp.g_varchar2_table(702) := '2 default ''N'','||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(703) := '-------------------------------------------------'||wwv_flow.LF||
'  procedure file_sync('||wwv_flow.LF||
'    p_action            in ';
wwv_flow_imp.g_varchar2_table(704) := 'varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );';
wwv_flow_imp.g_varchar2_table(705) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure replac';
wwv_flow_imp.g_varchar2_table(706) := 'e_object('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );';
wwv_flow_imp.g_varchar2_table(707) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure downlo';
wwv_flow_imp.g_varchar2_table(708) := 'ad_selected_objects('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 defaul';
wwv_flow_imp.g_varchar2_table(709) := 't null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  proce';
wwv_flow_imp.g_varchar2_table(710) := 'dure rename_object('||wwv_flow.LF||
'    p_old_file_path     in varchar2,'||wwv_flow.LF||
'    p_old_if_match      in varchar2,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(711) := 'new_file_path     in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(712) := '-----------------------------------------------------------------'||wwv_flow.LF||
'  procedure delete_object('||wwv_flow.LF||
'    p_f';
wwv_flow_imp.g_varchar2_table(713) := 'ile_path         in varchar2,'||wwv_flow.LF||
'    p_if_match          in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varcha';
wwv_flow_imp.g_varchar2_table(714) := 'r2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(715) := '-'||wwv_flow.LF||
'  procedure delete_selected_objects('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id ';
wwv_flow_imp.g_varchar2_table(716) := 'in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(717) := '----------'||wwv_flow.LF||
'end "BLOG_OCI_OS";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_XML"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(718) := '-------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(719) := '------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Provides procedures and func';
wwv_flow_imp.g_varchar2_table(720) := 'tions to generate and output RSS feeds, Atom feeds,'||wwv_flow.LF||
'--    and various sitemap components (index, mai';
wwv_flow_imp.g_varchar2_table(721) := 'n, posts, categories, archives, and tags).'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===================================';
wwv_flow_imp.g_varchar2_table(722) := '========================================='||wwv_flow.LF||
'--    DATE        AUTHOR        DESCRIPTION'||wwv_flow.LF||
'--    --------';
wwv_flow_imp.g_varchar2_table(723) := '--  ------------  ------------------------------------------------'||wwv_flow.LF||
'--    07.05.2019  Jari Laine    C';
wwv_flow_imp.g_varchar2_table(724) := 'reated package.'||wwv_flow.LF||
'--    08.01.2020  Jari Laine    Removed categories sitemap.'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(725) := '        Modified to use ORDS and blog version 4.'||wwv_flow.LF||
'--    09.04.2020  Jari Laine    Updated to utilize ';
wwv_flow_imp.g_varchar2_table(726) := 'blog_url function parameter p_canonical.'||wwv_flow.LF||
'--    17.05.2020  Jari Laine    Removed private function ge';
wwv_flow_imp.g_varchar2_table(727) := 't_app_alias and constant c_pub_app_id.'||wwv_flow.LF||
'--                              Moved private function get_or';
wwv_flow_imp.g_varchar2_table(728) := 'ds_service to the blog_ords package.'||wwv_flow.LF||
'--    23.05.2020  Jari Laine    Changed sitemap_main to use the';
wwv_flow_imp.g_varchar2_table(729) := ' blog_pages table.'||wwv_flow.LF||
'--                              Removed ORDS dependency.'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(730) := '        Added procedures:'||wwv_flow.LF||
'--                                sitemap_categories'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(731) := '             sitemap_archives'||wwv_flow.LF||
'--                                sitemap_tags'||wwv_flow.LF||
'--    30.10.2021  Jari ';
wwv_flow_imp.g_varchar2_table(732) := 'Laine    Modified sitemap_main to use the apex_application_pages view.'||wwv_flow.LF||
'--    13.11.2021  Jari Laine ';
wwv_flow_imp.g_varchar2_table(733) := '   Changes to the rss procedure.'||wwv_flow.LF||
'--    30.12.2021  Jari Laine    Modified rss_xsl; CSS file name mov';
wwv_flow_imp.g_varchar2_table(734) := 'ed to application settings.'||wwv_flow.LF||
'--    05.01.2021  Jari Laine    Added parameter p_css_file to rss_xsl.'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(735) := '-    13.03.2022  Jari Laine    Added parameter p_process_name to sitemap_index.'||wwv_flow.LF||
'--                  ';
wwv_flow_imp.g_varchar2_table(736) := '            Removed build option check from XML query in sitemap_index.'||wwv_flow.LF||
'--    19.04.2022  Jari Laine';
wwv_flow_imp.g_varchar2_table(737) := '    Updates related to blog_util.download_file.'||wwv_flow.LF||
'--    26.04.2022  Jari Laine    Added <lastmod> elem';
wwv_flow_imp.g_varchar2_table(738) := 'ent to XML output for:'||wwv_flow.LF||
'--                                sitemap_categories'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(739) := '          sitemap_archives'||wwv_flow.LF||
'--                                sitemap_tags'||wwv_flow.LF||
'--    28.04.2020  Jari Lai';
wwv_flow_imp.g_varchar2_table(740) := 'ne    Changes to rss_xsl.'||wwv_flow.LF||
'--    29.11.2022  Jari Laine    Removed parameter p_lang from rss.'||wwv_flow.LF||
'--     ';
wwv_flow_imp.g_varchar2_table(741) := '                         Added exception handler to raise HTTP errors in relevant procedures.'||wwv_flow.LF||
'--    ';
wwv_flow_imp.g_varchar2_table(742) := '                          Minor refinements.'||wwv_flow.LF||
'--    19.01.2023  Jari Laine    Removed parameter p_ws_';
wwv_flow_imp.g_varchar2_table(743) := 'images from rss_xsl.'||wwv_flow.LF||
'--                              Removed parameter p_page_group from sitemap_mai';
wwv_flow_imp.g_varchar2_table(744) := 'n.'||wwv_flow.LF||
'--                              Replaced private constants with global ones from blog_util:'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(745) := '                             g_nls_date_lang'||wwv_flow.LF||
'--                                g_iso_8601_date'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(746) := '                             g_rfc_2822_date'||wwv_flow.LF||
'--    30.07.2023  Jari Laine    Replaced apex_util.get_';
wwv_flow_imp.g_varchar2_table(747) := 'build_option_status with apex_application_admin.get_build_option_status.'||wwv_flow.LF||
'--    12.11.2023  Jari Lain';
wwv_flow_imp.g_varchar2_table(748) := 'e    Updates to rss and rss_xsl.'||wwv_flow.LF||
'--    13.11.2023  Jari Laine    Added a new procedure: atom.'||wwv_flow.LF||
'--    ';
wwv_flow_imp.g_varchar2_table(749) := '10.03.2024  Jari Laine    Enhanced rss_xsl to handle application file absolute URLs.'||wwv_flow.LF||
'--    01.04.202';
wwv_flow_imp.g_varchar2_table(750) := '4  Jari Laine    Added parameter p_page_group to sitemap_main.'||wwv_flow.LF||
'--                              Updat';
wwv_flow_imp.g_varchar2_table(751) := 'ed package constants.'||wwv_flow.LF||
'--                              Introduced new constant: c_headers'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(752) := '------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(753) := '-----------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax ';
wwv_flow_imp.g_varchar2_table(754) := 'Callback process "rss.xml"'||wwv_flow.LF||
'  procedure rss('||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_app_desc      in ';
wwv_flow_imp.g_varchar2_table(755) := 'varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Ca';
wwv_flow_imp.g_varchar2_table(756) := 'lled from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "atom.xml"'||wwv_flow.LF||
'  procedure atom('||wwv_flow.LF||
'    p_app_nam';
wwv_flow_imp.g_varchar2_table(757) := 'e      in varchar2,'||wwv_flow.LF||
'    p_app_desc      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(758) := '-------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process';
wwv_flow_imp.g_varchar2_table(759) := ' "rss.xsl"'||wwv_flow.LF||
'  procedure rss_xsl('||wwv_flow.LF||
'    p_css_file      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(760) := '-------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Call';
wwv_flow_imp.g_varchar2_table(761) := 'back process "sitemap-index.xml"'||wwv_flow.LF||
'  procedure sitemap_index('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_a';
wwv_flow_imp.g_varchar2_table(762) := 'pp_page_id   in varchar2,'||wwv_flow.LF||
'    p_process_name  in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(763) := '-------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback p';
wwv_flow_imp.g_varchar2_table(764) := 'rocess "sitemap-main.xml"'||wwv_flow.LF||
'  procedure sitemap_main('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_page_grou';
wwv_flow_imp.g_varchar2_table(765) := 'p    in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(766) := '--'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "sitemap-posts.xml"'||wwv_flow.LF||
'  procedure si';
wwv_flow_imp.g_varchar2_table(767) := 'temap_posts;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Cal';
wwv_flow_imp.g_varchar2_table(768) := 'led from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "sitemap-categories.xml"'||wwv_flow.LF||
'  procedure sitema';
wwv_flow_imp.g_varchar2_table(769) := 'p_categories;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Ca';
wwv_flow_imp.g_varchar2_table(770) := 'lled from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "sitemap-archives.xml"'||wwv_flow.LF||
'  procedure sitemap';
wwv_flow_imp.g_varchar2_table(771) := '_archives;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Calle';
wwv_flow_imp.g_varchar2_table(772) := 'd from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "sitemap-tags.xml"'||wwv_flow.LF||
'  procedure sitemap_tags;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(773) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_XML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'c';
wwv_flow_imp.g_varchar2_table(774) := 'reate or replace package "BLOG_AI"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(775) := '---------------------------------'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(776) := '--------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    Procedures and functions for AI-related functionalities'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(777) := 'CHANGE LOG'||wwv_flow.LF||
'--  ============================================================================'||wwv_flow.LF||
'--  DATE';
wwv_flow_imp.g_varchar2_table(778) := '         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  --------------------------------';
wwv_flow_imp.g_varchar2_table(779) := '----------------'||wwv_flow.LF||
'--  15.08.2025   Jari Laine     Created package.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine     Ne';
wwv_flow_imp.g_varchar2_table(780) := 'w function get_param_value'||wwv_flow.LF||
'--                              Changes to procedures:'||wwv_flow.LF||
'--                ';
wwv_flow_imp.g_varchar2_table(781) := '                - set_gen_ai'||wwv_flow.LF||
'--                                - init_params'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(782) := '------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(783) := '-----------------------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_name      in varch';
wwv_flow_imp.g_varchar2_table(784) := 'ar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(785) := '-----'||wwv_flow.LF||
'  procedure set_lang_ai('||wwv_flow.LF||
'    p_compartment_id  in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,';
wwv_flow_imp.g_varchar2_table(786) := ''||wwv_flow.LF||
'    p_build_status    in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(787) := '--------------------'||wwv_flow.LF||
'  procedure set_gen_ai('||wwv_flow.LF||
'    p_build_status    in varchar2,'||wwv_flow.LF||
'    p_api_key       ';
wwv_flow_imp.g_varchar2_table(788) := '  in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_ai_model_name   in varchar2,'||wwv_flow.LF||
'    p_ai_http_h';
wwv_flow_imp.g_varchar2_table(789) := 'eaders in varchar2,'||wwv_flow.LF||
'    p_ai_attributes   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(790) := '---------------------------------------'||wwv_flow.LF||
'  procedure gen_ai_chat('||wwv_flow.LF||
'    p_post            in varchar2,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(791) := '    p_system_prompt   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(792) := '-------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Public app page 1001 and admin app 62'||wwv_flow.LF||
'  procedure merge_sent';
wwv_flow_imp.g_varchar2_table(793) := 'iment('||wwv_flow.LF||
'    p_language        in varchar2,'||wwv_flow.LF||
'    p_documents       in clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(794) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure get_lang_code('||wwv_flow.LF||
'    p_documents';
wwv_flow_imp.g_varchar2_table(795) := '       in clob,'||wwv_flow.LF||
'    p_lang_code       out nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(796) := '-------------------------------------------'||wwv_flow.LF||
'  procedure get_translation('||wwv_flow.LF||
'    p_documents       in cl';
wwv_flow_imp.g_varchar2_table(797) := 'ob,'||wwv_flow.LF||
'    p_translation     out nocopy clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(798) := '---------------------------'||wwv_flow.LF||
'end "BLOG_AI";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(799) := '-'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_DYNAMIC_CONTENT'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(800) := '--'||wwv_flow.LF||
'create or replace force view blog_v_all_dynamic_content as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id                as id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(801) := ' ,t1.row_version       as row_version'||wwv_flow.LF||
'  ,t1.created_on        as created_on'||wwv_flow.LF||
'  ,lower(t1.created_by) ';
wwv_flow_imp.g_varchar2_table(802) := 'as created_by'||wwv_flow.LF||
'  ,t1.changed_on        as changed_on'||wwv_flow.LF||
'  ,lower(t1.changed_by) as changed_by'||wwv_flow.LF||
'  ,t1.is_a';
wwv_flow_imp.g_varchar2_table(803) := 'ctive         as is_active'||wwv_flow.LF||
'  ,t1.content_type      as content_type'||wwv_flow.LF||
'  ,t1.display_seq       as displa';
wwv_flow_imp.g_varchar2_table(804) := 'y_seq'||wwv_flow.LF||
'  ,t1.show_changed_on   as show_changed_on'||wwv_flow.LF||
'  ,t1.content_desc      as content_desc'||wwv_flow.LF||
'  ,t1.conte';
wwv_flow_imp.g_varchar2_table(805) := 'nt_html      as content_html'||wwv_flow.LF||
'from blog_dynamic_content t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(806) := '----------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_FILES'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(807) := '-------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_files as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                 ';
wwv_flow_imp.g_varchar2_table(808) := '        as id'||wwv_flow.LF||
', t1.row_version                as row_version'||wwv_flow.LF||
', t1.created_on                 as crea';
wwv_flow_imp.g_varchar2_table(809) := 'ted_on'||wwv_flow.LF||
', lower(t1.created_by)          as created_by'||wwv_flow.LF||
', t1.changed_on                 as changed_on'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(810) := ' lower(t1.changed_by)          as changed_by'||wwv_flow.LF||
', t1.is_active                  as is_active'||wwv_flow.LF||
', t1.is_do';
wwv_flow_imp.g_varchar2_table(811) := 'wnload                as is_download'||wwv_flow.LF||
', t1.file_path                  as file_path'||wwv_flow.LF||
', t1.file_dir     ';
wwv_flow_imp.g_varchar2_table(812) := '              as file_dir'||wwv_flow.LF||
', t1.file_name                  as file_name'||wwv_flow.LF||
', t1.mime_type               ';
wwv_flow_imp.g_varchar2_table(813) := '   as mime_type'||wwv_flow.LF||
', t1.blob_content               as blob_content'||wwv_flow.LF||
', t1.file_size                  as f';
wwv_flow_imp.g_varchar2_table(814) := 'ile_size'||wwv_flow.LF||
', t1.file_charset               as file_charset'||wwv_flow.LF||
', t1.file_desc                  as file_des';
wwv_flow_imp.g_varchar2_table(815) := 'c'||wwv_flow.LF||
', t1.notes                      as notes'||wwv_flow.LF||
', t1.etag                       as etag'||wwv_flow.LF||
', t1.md5         ';
wwv_flow_imp.g_varchar2_table(816) := '               as md5'||wwv_flow.LF||
', t1.apex$row_sync_timestamp'||wwv_flow.LF||
', cast('||wwv_flow.LF||
'    t1.apex$row_sync_timestamp  as timest';
wwv_flow_imp.g_varchar2_table(817) := 'amp with local time zone'||wwv_flow.LF||
'  )                             as sync_timestamp'||wwv_flow.LF||
', apex_string_util.to_dis';
wwv_flow_imp.g_varchar2_table(818) := 'play_filesize('||wwv_flow.LF||
'    p_size_in_bytes => t1.file_size'||wwv_flow.LF||
'  )                             as file_size_disp';
wwv_flow_imp.g_varchar2_table(819) := 'lay'||wwv_flow.LF||
', dbms_lob.getlength('||wwv_flow.LF||
'    lob_loc => coalesce( blob_content, empty_blob() )'||wwv_flow.LF||
'  )                 ';
wwv_flow_imp.g_varchar2_table(820) := '            as local_size'||wwv_flow.LF||
', case lkp.object_storage'||wwv_flow.LF||
'    when ''INCLUDE'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      case when lkp.';
wwv_flow_imp.g_varchar2_table(821) := 'proxy_url is null'||wwv_flow.LF||
'        then lkp.bucket_url'||wwv_flow.LF||
'        else lkp.proxy_url'||wwv_flow.LF||
'      end || t1.file_path'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(822) := '   else'||wwv_flow.LF||
'      blog_url.get_file('||wwv_flow.LF||
'        p_application => lkp.pub_app_id'||wwv_flow.LF||
'      , p_file_path   => t1';
wwv_flow_imp.g_varchar2_table(823) := '.file_path'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  end                           as file_url'||wwv_flow.LF||
'from blog_files t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  sele';
wwv_flow_imp.g_varchar2_table(824) := 'ct'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id    => sys_context(';
wwv_flow_imp.g_varchar2_table(825) := ' ''APEX$SESSION'', ''APP_ID'')'||wwv_flow.LF||
'      , p_build_option_name => ''BLOG_FEATURE_OCI_OBJECT_STORAGE'''||wwv_flow.LF||
'      ) ';
wwv_flow_imp.g_varchar2_table(826) := 'as object_storage'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_name    => ''G_OCI_OS_BUCK';
wwv_flow_imp.g_varchar2_table(827) := 'ET_URL'''||wwv_flow.LF||
'      ) as bucket_url'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_name    => ''G';
wwv_flow_imp.g_varchar2_table(828) := '_OCI_OS_PROXY_URL'''||wwv_flow.LF||
'      ) as proxy_url'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_nam';
wwv_flow_imp.g_varchar2_table(829) := 'e    => ''G_PUB_APP_ID'''||wwv_flow.LF||
'      ) as pub_app_id'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') lkp'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(830) := '---------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_LINKS'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(831) := '------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_links as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id            ';
wwv_flow_imp.g_varchar2_table(832) := '       as id'||wwv_flow.LF||
', t1.row_version          as row_version'||wwv_flow.LF||
', t1.created_on           as created_on'||wwv_flow.LF||
', lowe';
wwv_flow_imp.g_varchar2_table(833) := 'r( t1.created_by )  as created_by'||wwv_flow.LF||
', t1.changed_on           as changed_on'||wwv_flow.LF||
', lower( t1.changed_by )  ';
wwv_flow_imp.g_varchar2_table(834) := 'as changed_by'||wwv_flow.LF||
', t2.id                   as link_group_id'||wwv_flow.LF||
', t1.is_active            as is_active'||wwv_flow.LF||
', t2';
wwv_flow_imp.g_varchar2_table(835) := '.is_active            as link_group_is_active'||wwv_flow.LF||
', t1.display_seq          as display_seq'||wwv_flow.LF||
', t2.display_';
wwv_flow_imp.g_varchar2_table(836) := 'seq          as link_group_display_seq'||wwv_flow.LF||
', t1.title                as title'||wwv_flow.LF||
', t2.title                ';
wwv_flow_imp.g_varchar2_table(837) := 'as link_group_title'||wwv_flow.LF||
', t1.link_desc            as link_desc'||wwv_flow.LF||
', t1.notes                as notes'||wwv_flow.LF||
', t1.l';
wwv_flow_imp.g_varchar2_table(838) := 'ink_url             as link_url'||wwv_flow.LF||
', case t2.is_active'||wwv_flow.LF||
'    when 1 then'||wwv_flow.LF||
'      case t1.is_active'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(839) := 'when 1'||wwv_flow.LF||
'        then ''ENABLED'''||wwv_flow.LF||
'        else ''DISABLED'''||wwv_flow.LF||
'        end'||wwv_flow.LF||
'    else ''GROUP_DISABLED'''||wwv_flow.LF||
'  end   ';
wwv_flow_imp.g_varchar2_table(840) := '                  as link_status_code'||wwv_flow.LF||
', t1.is_active'||wwv_flow.LF||
'  * t2.is_active          as link_is_active'||wwv_flow.LF||
'fro';
wwv_flow_imp.g_varchar2_table(841) := 'm blog_links t1'||wwv_flow.LF||
'join blog_link_groups t2'||wwv_flow.LF||
'  on t1.link_group_id = t2.id'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(842) := '-----------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_LINK_GROUPS'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(843) := '--------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_link_groups as'||wwv_flow.LF||
'select';
wwv_flow_imp.g_varchar2_table(844) := ''||wwv_flow.LF||
'   t1.id                  as id'||wwv_flow.LF||
'  ,t1.row_version         as row_version'||wwv_flow.LF||
'  ,t1.created_on          ';
wwv_flow_imp.g_varchar2_table(845) := 'as created_on'||wwv_flow.LF||
'  ,lower( t1.created_by ) as created_by'||wwv_flow.LF||
'  ,t1.changed_on          as changed_on'||wwv_flow.LF||
'  ,low';
wwv_flow_imp.g_varchar2_table(846) := 'er (t1.changed_by ) as changed_by'||wwv_flow.LF||
'  ,t1.is_active           as is_active'||wwv_flow.LF||
'  ,t1.display_seq         a';
wwv_flow_imp.g_varchar2_table(847) := 's display_seq'||wwv_flow.LF||
'  ,t1.title               as title'||wwv_flow.LF||
'  ,t1.title_unique        as title_unique'||wwv_flow.LF||
'  ,t1.not';
wwv_flow_imp.g_varchar2_table(848) := 'es               as notes'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_links lkp'||wwv_flow.LF||
'    where lk';
wwv_flow_imp.g_varchar2_table(849) := 'p.link_group_id = t1.id'||wwv_flow.LF||
'  )                       as link_count'||wwv_flow.LF||
'from blog_link_groups t1'||wwv_flow.LF||
'where 1 = 1';
wwv_flow_imp.g_varchar2_table(850) := ''||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_POST_TAGS'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(851) := '------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_post_';
wwv_flow_imp.g_varchar2_table(852) := 'tags as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id                        as id'||wwv_flow.LF||
'  ,t1.row_version               as row_version'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(853) := '  ,t1.created_on                as created_on'||wwv_flow.LF||
'  ,lower(t1.created_by)         as created_by'||wwv_flow.LF||
'  ,t1.ch';
wwv_flow_imp.g_varchar2_table(854) := 'anged_on                as changed_on'||wwv_flow.LF||
'  ,lower(t1.changed_by)         as changed_by'||wwv_flow.LF||
'  ,t1.is_active ';
wwv_flow_imp.g_varchar2_table(855) := '                as is_active'||wwv_flow.LF||
'  ,t1.post_id                   as post_id'||wwv_flow.LF||
'  ,t1.tag_id                ';
wwv_flow_imp.g_varchar2_table(856) := '    as tag_id'||wwv_flow.LF||
'  ,t1.display_seq               as display_seq'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.tag'||wwv_flow.LF||
'    from blog_t';
wwv_flow_imp.g_varchar2_table(857) := 'ags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.id = t1.tag_id'||wwv_flow.LF||
'  )                             as tag'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    s';
wwv_flow_imp.g_varchar2_table(858) := 'elect lkp.is_active'||wwv_flow.LF||
'    from blog_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.id = t1.tag_id'||wwv_flow.LF||
'  )           ';
wwv_flow_imp.g_varchar2_table(859) := '                  as tag_is_active'||wwv_flow.LF||
'from blog_post_tags t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(860) := '----------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_TAGS'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(861) := '------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_tags as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                 as';
wwv_flow_imp.g_varchar2_table(862) := ' id'||wwv_flow.LF||
', t1.row_version        as row_version'||wwv_flow.LF||
', t1.created_on         as created_on'||wwv_flow.LF||
', lower(t1.created_';
wwv_flow_imp.g_varchar2_table(863) := 'by)  as created_by'||wwv_flow.LF||
', t1.changed_on         as changed_on'||wwv_flow.LF||
', lower(t1.changed_by)  as changed_by'||wwv_flow.LF||
', t1.';
wwv_flow_imp.g_varchar2_table(864) := 'is_active          as is_active'||wwv_flow.LF||
', t1.tag                as tag'||wwv_flow.LF||
', t1.tag_unique         as tag_unique';
wwv_flow_imp.g_varchar2_table(865) := ''||wwv_flow.LF||
', t1.notes              as notes'||wwv_flow.LF||
', case t1.is_active'||wwv_flow.LF||
'    when 1'||wwv_flow.LF||
'      then c.txt_enabled'||wwv_flow.LF||
'      else';
wwv_flow_imp.g_varchar2_table(866) := ' c.txt_disabled'||wwv_flow.LF||
'  end                   as tag_status_text'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select count(1)'||wwv_flow.LF||
'    from blog_pos';
wwv_flow_imp.g_varchar2_table(867) := 't_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.tag_id = t1.id'||wwv_flow.LF||
'   )                    as posts_count'||wwv_flow.LF||
', case'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(868) := '    when exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_post_tags lkp'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and lkp.tag_id';
wwv_flow_imp.g_varchar2_table(869) := ' = t1.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    then ''U'''||wwv_flow.LF||
'    else ''UD'''||wwv_flow.LF||
'  end                   as allowed_row_operation'||wwv_flow.LF||
'from blog';
wwv_flow_imp.g_varchar2_table(870) := '_tags t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_lang.get_message( ''BLOG_TXT_ENABLED'' )   as txt_enabled'||wwv_flow.LF||
'  , a';
wwv_flow_imp.g_varchar2_table(871) := 'pex_lang.get_message( ''BLOG_TXT_DISABLED'' )  as txt_disabled'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') c'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(872) := '-----------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_BLOGGERS'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(873) := '-------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_bloggers as'||wwv_flow.LF||
'select t1.id  ';
wwv_flow_imp.g_varchar2_table(874) := '      as blogger_id'||wwv_flow.LF||
'  ,t1.display_seq   as display_seq'||wwv_flow.LF||
'  ,t1.blogger_name  as blogger_name'||wwv_flow.LF||
'  ,t1.blo';
wwv_flow_imp.g_varchar2_table(875) := 'gger_desc  as blogger_desc'||wwv_flow.LF||
'from blog_bloggers t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.show_desc = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(876) := '-------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_DYNAMIC_CONTENT'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(877) := '----------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_dynamic_con';
wwv_flow_imp.g_varchar2_table(878) := 'tent as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id              as content_id'||wwv_flow.LF||
'  ,t1.content_type    as content_type'||wwv_flow.LF||
'  ,t1.chang';
wwv_flow_imp.g_varchar2_table(879) := 'ed_on      as changed_on'||wwv_flow.LF||
'  ,t1.display_seq     as display_seq'||wwv_flow.LF||
'  ,t1.show_changed_on as show_changed_';
wwv_flow_imp.g_varchar2_table(880) := 'on'||wwv_flow.LF||
'  ,t1.content_desc    as content_desc'||wwv_flow.LF||
'  ,t1.content_html    as content_html'||wwv_flow.LF||
'  ,blog_url.get_dynam';
wwv_flow_imp.g_varchar2_table(881) := 'ic_page('||wwv_flow.LF||
'    p_content_id => t1.id'||wwv_flow.LF||
'  )                   as content_url'||wwv_flow.LF||
'from blog_dynamic_content t1';
wwv_flow_imp.g_varchar2_table(882) := ''||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(883) := '-------'||wwv_flow.LF||
'--  DDL for View BLOG_V_FEATURES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'cr';
wwv_flow_imp.g_varchar2_table(884) := 'eate or replace force view blog_v_features as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                       as id'||wwv_flow.LF||
', v1.applic';
wwv_flow_imp.g_varchar2_table(885) := 'ation_id           as application_id'||wwv_flow.LF||
', v1.build_option_id          as build_option_id'||wwv_flow.LF||
', v1.last_upda';
wwv_flow_imp.g_varchar2_table(886) := 'ted_on          as last_updated_on'||wwv_flow.LF||
', lower( v1.last_updated_by ) as last_updated_by'||wwv_flow.LF||
', t1.display_seq';
wwv_flow_imp.g_varchar2_table(887) := '              as display_seq'||wwv_flow.LF||
', t1.build_option_name        as build_option_name'||wwv_flow.LF||
', v1.build_option_st';
wwv_flow_imp.g_varchar2_table(888) := 'atus      as build_option_status'||wwv_flow.LF||
', t1.build_option_parent      as build_option_parent'||wwv_flow.LF||
', level       ';
wwv_flow_imp.g_varchar2_table(889) := '                as build_option_level'||wwv_flow.LF||
', case when connect_by_isleaf = 0'||wwv_flow.LF||
'    then ''Y'''||wwv_flow.LF||
'    else ''N'''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(890) := 'end                         as is_parent'||wwv_flow.LF||
', apex_lang.get_message('||wwv_flow.LF||
'    p_name => t1.build_option_name';
wwv_flow_imp.g_varchar2_table(891) := ''||wwv_flow.LF||
'  )                           as feature_desc'||wwv_flow.LF||
', regexp_replace('||wwv_flow.LF||
'    t1.build_option_name'||wwv_flow.LF||
'  , ''^(BLO';
wwv_flow_imp.g_varchar2_table(892) := 'G)'''||wwv_flow.LF||
'  , ''\1_HELP'''||wwv_flow.LF||
'  )                           as help_message'||wwv_flow.LF||
'-- HTML in query because IG removes ';
wwv_flow_imp.g_varchar2_table(893) := 'HTML from column HTM expression in control break column'||wwv_flow.LF||
'-- Contrel break is soretd and attribute dat';
wwv_flow_imp.g_varchar2_table(894) := 'a-sort-order gives correct sort order'||wwv_flow.LF||
', apex_string.format('||wwv_flow.LF||
'    p_message => ''<span data-sort-order=';
wwv_flow_imp.g_varchar2_table(895) := '"%s" class="u-bold">%s</span>'''||wwv_flow.LF||
'  , p0 => lpad( min( t1.display_seq ) over( partition by t1.build_opt';
wwv_flow_imp.g_varchar2_table(896) := 'ion_group ), 6, ''0'' )'||wwv_flow.LF||
'  , p1 =>'||wwv_flow.LF||
'      apex_lang.get_message('||wwv_flow.LF||
'        p_name => t1.build_option_group';
wwv_flow_imp.g_varchar2_table(897) := ''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  )                           as feature_group_html'||wwv_flow.LF||
', t1.build_option_group       as featur';
wwv_flow_imp.g_varchar2_table(898) := 'e_group'||wwv_flow.LF||
'from blog_features t1'||wwv_flow.LF||
'join apex_application_build_options v1'||wwv_flow.LF||
'  on t1.build_option_name = v1.';
wwv_flow_imp.g_varchar2_table(899) := 'build_option_name'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and t1.build_option_group != ''INTERNAL'''||wwv_flow.LF||
'  and t1.is_active = 1'||wwv_flow.LF||
'  and';
wwv_flow_imp.g_varchar2_table(900) := ' case'||wwv_flow.LF||
'    when t1.ref_build_option_name is null'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    when apex_application_admin.get_build';
wwv_flow_imp.g_varchar2_table(901) := '_option_status('||wwv_flow.LF||
'      p_application_id    => sys_context( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'    , p_build_o';
wwv_flow_imp.g_varchar2_table(902) := 'ption_name => t1.ref_build_option_name'||wwv_flow.LF||
'    ) = t1.ref_build_option_status'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    else 0'||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(903) := 'd = 1'||wwv_flow.LF||
'start with t1.build_option_parent is null'||wwv_flow.LF||
'connect by prior t1.build_option_name = t1.build_opt';
wwv_flow_imp.g_varchar2_table(904) := 'ion_parent'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Vie';
wwv_flow_imp.g_varchar2_table(905) := 'w BLOG_V_FILES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view';
wwv_flow_imp.g_varchar2_table(906) := ' blog_v_files as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id             as file_id'||wwv_flow.LF||
', t1.row_version    as row_version'||wwv_flow.LF||
', t1.creat';
wwv_flow_imp.g_varchar2_table(907) := 'ed_on     as created_on'||wwv_flow.LF||
', t1.changed_on     as changed_on'||wwv_flow.LF||
', t1.is_download    as is_download'||wwv_flow.LF||
', t1.fi';
wwv_flow_imp.g_varchar2_table(908) := 'le_name      as file_name'||wwv_flow.LF||
', t1.file_path      as file_path'||wwv_flow.LF||
', t1.mime_type      as mime_type'||wwv_flow.LF||
', t1.blo';
wwv_flow_imp.g_varchar2_table(909) := 'b_content   as blob_content'||wwv_flow.LF||
', apex_string_util.to_display_filesize('||wwv_flow.LF||
'    p_size_in_bytes => t1.file_s';
wwv_flow_imp.g_varchar2_table(910) := 'ize'||wwv_flow.LF||
'  )                 as file_size'||wwv_flow.LF||
', t1.file_charset   as file_charset'||wwv_flow.LF||
', t1.file_desc      as file';
wwv_flow_imp.g_varchar2_table(911) := '_desc'||wwv_flow.LF||
', lkp.object_storage'||wwv_flow.LF||
', case lkp.object_storage'||wwv_flow.LF||
'    when ''INCLUDE'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      case when lkp';
wwv_flow_imp.g_varchar2_table(912) := '.proxy_url is null'||wwv_flow.LF||
'        then lkp.bucket_url || t1.file_path'||wwv_flow.LF||
'        else lkp.proxy_url  || t1.fil';
wwv_flow_imp.g_varchar2_table(913) := 'e_path'||wwv_flow.LF||
'      end'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      blog_url.get_file('||wwv_flow.LF||
'        p_file_path => t1.file_path'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  end';
wwv_flow_imp.g_varchar2_table(914) := '             as file_url'||wwv_flow.LF||
'from blog_files t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'      apex_application_admin.get_bu';
wwv_flow_imp.g_varchar2_table(915) := 'ild_option_status('||wwv_flow.LF||
'        p_application_id    => sys_context( ''APEX$SESSION'', ''APP_ID'')'||wwv_flow.LF||
'      , p_b';
wwv_flow_imp.g_varchar2_table(916) := 'uild_option_name => ''BLOG_FEATURE_OCI_OBJECT_STORAGE'''||wwv_flow.LF||
'    )  as object_storage'||wwv_flow.LF||
'    , blog_util.get_a';
wwv_flow_imp.g_varchar2_table(917) := 'ttribute_value('||wwv_flow.LF||
'        p_attribute_name => ''G_OCI_OS_BUCKET_URL'''||wwv_flow.LF||
'      ) as bucket_url'||wwv_flow.LF||
'    , blog_u';
wwv_flow_imp.g_varchar2_table(918) := 'til.get_attribute_value('||wwv_flow.LF||
'        p_attribute_name => ''G_OCI_OS_PROXY_URL'''||wwv_flow.LF||
'      ) as proxy_url'||wwv_flow.LF||
'  fro';
wwv_flow_imp.g_varchar2_table(919) := 'm dual'||wwv_flow.LF||
') lkp'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(920) := '-------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_INIT_ITEMS'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(921) := '-----------'||wwv_flow.LF||
'create or replace force view blog_v_init_items as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  i.application_id  as applicat';
wwv_flow_imp.g_varchar2_table(922) := 'ion_id'||wwv_flow.LF||
', i.item_name       as item_name'||wwv_flow.LF||
', s.attribute_value as attribute_value'||wwv_flow.LF||
', v( i.item_name )  a';
wwv_flow_imp.g_varchar2_table(923) := 's session_value'||wwv_flow.LF||
'from blog_init_items i'||wwv_flow.LF||
'join blog_settings s'||wwv_flow.LF||
'  on i.item_name = s.attribute_name'||wwv_flow.LF||
'wher';
wwv_flow_imp.g_varchar2_table(924) := 'e 1 = 1'||wwv_flow.LF||
'and i.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(925) := '-'||wwv_flow.LF||
'--  DDL for View BLOG_V_LINKS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or r';
wwv_flow_imp.g_varchar2_table(926) := 'eplace force view blog_v_links as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id             as link_id'||wwv_flow.LF||
', t2.id             as group';
wwv_flow_imp.g_varchar2_table(927) := '_id'||wwv_flow.LF||
', t2.title          as group_title'||wwv_flow.LF||
', t2.display_seq    as group_display_seq'||wwv_flow.LF||
', t1.display_seq    ';
wwv_flow_imp.g_varchar2_table(928) := 'as display_seq'||wwv_flow.LF||
', t1.title          as link_title'||wwv_flow.LF||
', t1.link_desc      as link_desc'||wwv_flow.LF||
', t1.link_url     ';
wwv_flow_imp.g_varchar2_table(929) := '  as link_url'||wwv_flow.LF||
', t1.external_link'||wwv_flow.LF||
'  + t1.target_blank as link_attr_code'||wwv_flow.LF||
', case t1.external_link + t1.';
wwv_flow_imp.g_varchar2_table(930) := 'target_blank'||wwv_flow.LF||
'    when 2'||wwv_flow.LF||
'    then ''target="_blank" rel="external"'''||wwv_flow.LF||
'    when 1'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      case t1.';
wwv_flow_imp.g_varchar2_table(931) := 'external_link'||wwv_flow.LF||
'      when 1'||wwv_flow.LF||
'      then ''rel="external"'''||wwv_flow.LF||
'      else ''target="_blank"'''||wwv_flow.LF||
'    end'||wwv_flow.LF||
'  end as';
wwv_flow_imp.g_varchar2_table(932) := ' link_attr'||wwv_flow.LF||
'from blog_links t1'||wwv_flow.LF||
'join blog_link_groups t2'||wwv_flow.LF||
'  on t1.link_group_id = t2.id'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  a';
wwv_flow_imp.g_varchar2_table(933) := 'nd t1.is_active = 1'||wwv_flow.LF||
'  and t2.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(934) := '----------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_LOV'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(935) := '-'||wwv_flow.LF||
'create or replace force view blog_v_lov as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.lov_name                                 as';
wwv_flow_imp.g_varchar2_table(936) := ' lov_name'||wwv_flow.LF||
', t1.display_seq                              as display_seq'||wwv_flow.LF||
', t1.return_value            ';
wwv_flow_imp.g_varchar2_table(937) := '                 as return_value'||wwv_flow.LF||
', t1.display_message                          as display_message'||wwv_flow.LF||
', ';
wwv_flow_imp.g_varchar2_table(938) := 'apex_lang.get_message( t1.display_message ) as display_value'||wwv_flow.LF||
'from blog_list_of_values t1'||wwv_flow.LF||
'where 1 = 1';
wwv_flow_imp.g_varchar2_table(939) := ''||wwv_flow.LF||
'and t1.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(940) := 'DDL for View BLOG_V_POSTS_TAGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or re';
wwv_flow_imp.g_varchar2_table(941) := 'place force view blog_v_post_tags as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'     t2.post_id     as post_id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(942) := '    ,t2.tag_id      as tag_id'||wwv_flow.LF||
'    ,t2.display_seq as display_seq'||wwv_flow.LF||
'    ,t1.tag         as tag'||wwv_flow.LF||
'    ,gre';
wwv_flow_imp.g_varchar2_table(943) := 'atest('||wwv_flow.LF||
'       t1.changed_on'||wwv_flow.LF||
'      ,t2.changed_on'||wwv_flow.LF||
'    )               as changed_on'||wwv_flow.LF||
'  -- Generate tag';
wwv_flow_imp.g_varchar2_table(944) := ' URL'||wwv_flow.LF||
'    ,blog_url.get_tag('||wwv_flow.LF||
'      p_tag_id => t1.id'||wwv_flow.LF||
'    )               as tag_url'||wwv_flow.LF||
'  -- Generate HTM';
wwv_flow_imp.g_varchar2_table(945) := 'L for tags used in APEX reports'||wwv_flow.LF||
'    ,xmlelement( "span"'||wwv_flow.LF||
'      ,xmlattributes('||wwv_flow.LF||
'        ''t-Icon fa fa-';
wwv_flow_imp.g_varchar2_table(946) := 'tag''  as "class"'||wwv_flow.LF||
'        ,''true''             as "aria-hidden"'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    )               as tag_ico';
wwv_flow_imp.g_varchar2_table(947) := 'n'||wwv_flow.LF||
'    ,xmlelement( "span"'||wwv_flow.LF||
'      ,xmlattributes('||wwv_flow.LF||
'        ''t-Button-label''    as "class"'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(948) := ' ,t1.tag'||wwv_flow.LF||
'    )               as tag_label'||wwv_flow.LF||
'  -- Tag CSS class'||wwv_flow.LF||
'    ,''t-Button t-Button--icon t-Button-';
wwv_flow_imp.g_varchar2_table(949) := '-large t-Button--noUI t-Button--iconLeft'' as tag_class'||wwv_flow.LF||
'  from blog_tags t1'||wwv_flow.LF||
'  join blog_post_tags t2 ';
wwv_flow_imp.g_varchar2_table(950) := 'on t1.id = t2.tag_id'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and t1.is_active = 1'||wwv_flow.LF||
'    and t2.is_active = 1'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.';
wwv_flow_imp.g_varchar2_table(951) := 'post_id                         as post_id'||wwv_flow.LF||
'  ,q1.tag_id                          as tag_id'||wwv_flow.LF||
'  ,q1.dis';
wwv_flow_imp.g_varchar2_table(952) := 'play_seq                     as display_seq'||wwv_flow.LF||
'  ,q1.tag                             as tag'||wwv_flow.LF||
'  ,q1.chang';
wwv_flow_imp.g_varchar2_table(953) := 'ed_on                      as changed_on'||wwv_flow.LF||
'  ,q1.tag_url                         as tag_url'||wwv_flow.LF||
'-- Generat';
wwv_flow_imp.g_varchar2_table(954) := 'e HTML for tags used in APEX reports'||wwv_flow.LF||
'  ,xmlelement( "a"'||wwv_flow.LF||
'    ,xmlattributes('||wwv_flow.LF||
'      q1.tag_url        ';
wwv_flow_imp.g_varchar2_table(955) := '    as "href"'||wwv_flow.LF||
'      ,''blog-search--tags''  as "class"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag'||wwv_flow.LF||
'  )                          ';
wwv_flow_imp.g_varchar2_table(956) := '         as tag_html1'||wwv_flow.LF||
'  ,xmlelement( "a"'||wwv_flow.LF||
'    ,xmlattributes('||wwv_flow.LF||
'       q1.tag_url       as "href"'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(957) := ' ,q1.tag_class     as "class"'||wwv_flow.LF||
'      ,''tag''            as "rel"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag_icon'||wwv_flow.LF||
'    ,q1.tag_la';
wwv_flow_imp.g_varchar2_table(958) := 'bel'||wwv_flow.LF||
'  )                                   as tag_html2'||wwv_flow.LF||
'  ,xmlelement( "span"'||wwv_flow.LF||
'    ,xmlattributes('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(959) := '   q1.tag_class      as "class"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag_icon'||wwv_flow.LF||
'    ,q1.tag_label'||wwv_flow.LF||
'  )                        ';
wwv_flow_imp.g_varchar2_table(960) := '            as tag_html3'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(961) := '------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_CATEGORIES'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(962) := '--'||wwv_flow.LF||
'create or replace force view blog_v_all_categories as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id                as id'||wwv_flow.LF||
'  ,t1.';
wwv_flow_imp.g_varchar2_table(963) := 'row_version       as row_version'||wwv_flow.LF||
'  ,t1.created_on        as created_on'||wwv_flow.LF||
'  ,lower(t1.created_by) as cr';
wwv_flow_imp.g_varchar2_table(964) := 'eated_by'||wwv_flow.LF||
'  ,t1.changed_on        as changed_on'||wwv_flow.LF||
'  ,lower(t1.changed_by) as changed_by'||wwv_flow.LF||
'  ,t1.is_active';
wwv_flow_imp.g_varchar2_table(965) := '         as is_active'||wwv_flow.LF||
'  ,t1.display_seq       as display_seq'||wwv_flow.LF||
'  ,t1.title             as title'||wwv_flow.LF||
'  ,t1.';
wwv_flow_imp.g_varchar2_table(966) := 'title_unique      as title_unique'||wwv_flow.LF||
'  ,t1.notes             as notes'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.display_value';
wwv_flow_imp.g_varchar2_table(967) := ''||wwv_flow.LF||
'    from blog_v_lov lkp'||wwv_flow.LF||
'    where lkp.lov_name = ''IS_ACTIVE'''||wwv_flow.LF||
'      and to_number( lkp.return_value ';
wwv_flow_imp.g_varchar2_table(968) := ') = t1.is_active'||wwv_flow.LF||
'  )                     as category_status_text'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select count(1)'||wwv_flow.LF||
'    from b';
wwv_flow_imp.g_varchar2_table(969) := 'log_posts lkp'||wwv_flow.LF||
'    where lkp.category_id = t1.id'||wwv_flow.LF||
'   )                    as posts_count'||wwv_flow.LF||
'  ,case'||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(970) := 'hen exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_posts lkp'||wwv_flow.LF||
'      where lkp.category_id = t1.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    t';
wwv_flow_imp.g_varchar2_table(971) := 'hen ''U'''||wwv_flow.LF||
'    else ''UD'''||wwv_flow.LF||
'  end                   as allowed_row_operation'||wwv_flow.LF||
'from blog_categories t1'||wwv_flow.LF||
'where';
wwv_flow_imp.g_varchar2_table(972) := ' 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_COMMEN';
wwv_flow_imp.g_varchar2_table(973) := 'TS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_';
wwv_flow_imp.g_varchar2_table(974) := 'comments as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'    t1.id'||wwv_flow.LF||
'  , t1.row_version'||wwv_flow.LF||
'  , t1.created_on'||wwv_flow.LF||
'  , t1.cr';
wwv_flow_imp.g_varchar2_table(975) := 'eated_by'||wwv_flow.LF||
'  , t1.changed_on'||wwv_flow.LF||
'  , t1.changed_by'||wwv_flow.LF||
'  , t1.is_active'||wwv_flow.LF||
'  , t1.post_id'||wwv_flow.LF||
'  , t1.parent_id'||wwv_flow.LF||
'  , t1';
wwv_flow_imp.g_varchar2_table(976) := '.body_html'||wwv_flow.LF||
'  , t1.comment_preview'||wwv_flow.LF||
'  , t1.comment_by'||wwv_flow.LF||
'  , t1.ctx_search'||wwv_flow.LF||
'  , t1.rowid as ctx_rid'||wwv_flow.LF||
'  , t2';
wwv_flow_imp.g_varchar2_table(977) := '.sentiment_json'||wwv_flow.LF||
'  , t2.sentiment_json.documentSentiment as sentiment'||wwv_flow.LF||
'  , t2.sentiment_json.documentS';
wwv_flow_imp.g_varchar2_table(978) := 'cores.Positive.number()  * 100 as positive_pct'||wwv_flow.LF||
'  , t2.sentiment_json.documentScores.Neutral.number()';
wwv_flow_imp.g_varchar2_table(979) := '   * 100 as neutral_pct'||wwv_flow.LF||
'  , t2.sentiment_json.documentScores.Negative.number()  * 100 as negative_pc';
wwv_flow_imp.g_varchar2_table(980) := 't'||wwv_flow.LF||
'  , t2.sentiment_json.documentScores.Mixed.number()     * 100 as mixed_pct'||wwv_flow.LF||
'  , case'||wwv_flow.LF||
'      when ('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(981) := '       select count(1)'||wwv_flow.LF||
'        from blog_comment_flags f11'||wwv_flow.LF||
'        where f11.flag = ''MODERATE'''||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(982) := '     and f11.comment_id = t1.id'||wwv_flow.LF||
'      ) > 0'||wwv_flow.LF||
'        then ''MODERATE'''||wwv_flow.LF||
'      when t1.is_active = 1'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(983) := '    then ''ENABLED'''||wwv_flow.LF||
'        else ''DISABLED'''||wwv_flow.LF||
'    end as comment_status_code'||wwv_flow.LF||
'  , case'||wwv_flow.LF||
'      when ('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(984) := '    select count(1)'||wwv_flow.LF||
'        from blog_comment_flags f12'||wwv_flow.LF||
'        where f12.flag = ''NEW'''||wwv_flow.LF||
'          and';
wwv_flow_imp.g_varchar2_table(985) := ' f12.comment_id = t1.id'||wwv_flow.LF||
'      ) > 0'||wwv_flow.LF||
'        then ''NEW'''||wwv_flow.LF||
'      when ('||wwv_flow.LF||
'        select count(1)'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(986) := 'from blog_comment_flags f13'||wwv_flow.LF||
'        where f13.flag = ''UNREAD'''||wwv_flow.LF||
'          and f13.comment_id = t1.id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(987) := '     ) > 0'||wwv_flow.LF||
'        then ''UNREAD'''||wwv_flow.LF||
'      when t1.parent_id is not null'||wwv_flow.LF||
'        then ''REPLY'''||wwv_flow.LF||
'        el';
wwv_flow_imp.g_varchar2_table(988) := 'se ''READ'''||wwv_flow.LF||
'    end as comment_flag_code'||wwv_flow.LF||
'  from blog_comments t1'||wwv_flow.LF||
'  left join blog_comment_sentiments t';
wwv_flow_imp.g_varchar2_table(989) := '2 on t1.id = t2.comment_id'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  q1.id                   as id'||wwv_flow.LF||
', q1.row_version          as row';
wwv_flow_imp.g_varchar2_table(990) := '_version'||wwv_flow.LF||
', q1.created_on           as created_on'||wwv_flow.LF||
', lower( q1.created_by )  as created_by'||wwv_flow.LF||
', q1.change';
wwv_flow_imp.g_varchar2_table(991) := 'd_on           as changed_on'||wwv_flow.LF||
', lower( q1.changed_by )  as changed_by'||wwv_flow.LF||
', q1.is_active            as is';
wwv_flow_imp.g_varchar2_table(992) := '_active'||wwv_flow.LF||
', q1.post_id              as post_id'||wwv_flow.LF||
', q1.parent_id            as parent_id'||wwv_flow.LF||
', q1.body_html  ';
wwv_flow_imp.g_varchar2_table(993) := '          as body_html'||wwv_flow.LF||
', q1.comment_preview      as comment_preview'||wwv_flow.LF||
', q1.comment_by           as com';
wwv_flow_imp.g_varchar2_table(994) := 'ment_by'||wwv_flow.LF||
', q1.ctx_search           as ctx_search'||wwv_flow.LF||
', q1.ctx_rid              as ctx_rid'||wwv_flow.LF||
', q1.comment_st';
wwv_flow_imp.g_varchar2_table(995) := 'atus_code  as comment_status_code'||wwv_flow.LF||
', q1.comment_flag_code    as comment_flag_code'||wwv_flow.LF||
', q1.sentiment_json';
wwv_flow_imp.g_varchar2_table(996) := '       as sentiment_json'||wwv_flow.LF||
', q1.sentiment            as sentiment'||wwv_flow.LF||
', q1.positive_pct         as sentime';
wwv_flow_imp.g_varchar2_table(997) := 'nt_positive_pct'||wwv_flow.LF||
', q1.neutral_pct          as sentiment_neutral_pct'||wwv_flow.LF||
', q1.negative_pct         as sent';
wwv_flow_imp.g_varchar2_table(998) := 'iment_negative_pct'||wwv_flow.LF||
', q1.mixed_pct            as sentiment_mixed_pct'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lkp.title'||wwv_flow.LF||
'    fro';
wwv_flow_imp.g_varchar2_table(999) := 'm blog_posts lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.id = q1.post_id'||wwv_flow.LF||
'  )                       as post_tit';
wwv_flow_imp.g_varchar2_table(1000) := 'le'||wwv_flow.LF||
', case'||wwv_flow.LF||
'    when q1.comment_flag_code in( ''NEW'', ''UNREAD'' )'||wwv_flow.LF||
'      then ''true'''||wwv_flow.LF||
'      else ''false'''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1001) := ' end                     as data_unread'||wwv_flow.LF||
'-- lov return value fetch in view query because IR detail vi';
wwv_flow_imp.g_varchar2_table(1002) := 'ew'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lov1.display_value'||wwv_flow.LF||
'    from blog_v_lov lov1'||wwv_flow.LF||
'    where lov1.lov_name = ''COMME';
wwv_flow_imp.g_varchar2_table(1003) := 'NT_STATUS'''||wwv_flow.LF||
'      and lov1.return_value = q1.comment_status_code'||wwv_flow.LF||
'  )                       as comment';
wwv_flow_imp.g_varchar2_table(1004) := '_status_text'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lov2.display_value'||wwv_flow.LF||
'    from blog_v_lov lov2'||wwv_flow.LF||
'    where lov2.lov_nam';
wwv_flow_imp.g_varchar2_table(1005) := 'e = ''COMMENT_FLAG'''||wwv_flow.LF||
'      and lov2.return_value = q1.comment_flag_code'||wwv_flow.LF||
'  )                       as c';
wwv_flow_imp.g_varchar2_table(1006) := 'omment_flag_text'||wwv_flow.LF||
'-- class names in view query for reusability'||wwv_flow.LF||
', case q1.comment_status_code'||wwv_flow.LF||
'    when';
wwv_flow_imp.g_varchar2_table(1007) := ' ''MODERATE'''||wwv_flow.LF||
'      then ''fa-exclamation-circle u-warning-text'''||wwv_flow.LF||
'    when ''ENABLED'''||wwv_flow.LF||
'      then ''fa-chec';
wwv_flow_imp.g_varchar2_table(1008) := 'k-circle u-success-text'''||wwv_flow.LF||
'      else ''fa-minus-circle u-danger-text'''||wwv_flow.LF||
'  end                     as com';
wwv_flow_imp.g_varchar2_table(1009) := 'ment_status_icon'||wwv_flow.LF||
', case q1.comment_flag_code'||wwv_flow.LF||
'    when ''REPLY'''||wwv_flow.LF||
'      then ''fa-send-o'''||wwv_flow.LF||
'    when ''NEW'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1010) := '      then ''fa-envelope-arrow-down'''||wwv_flow.LF||
'    when ''UNREAD'''||wwv_flow.LF||
'      then ''fa-envelope-o'''||wwv_flow.LF||
'      else ''fa-enve';
wwv_flow_imp.g_varchar2_table(1011) := 'lope-open-o'''||wwv_flow.LF||
'  end                     as comment_flag_icon'||wwv_flow.LF||
', case q1.sentiment'||wwv_flow.LF||
'    when ''Mixed'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1012) := '   then ''fa-emoji-astonished u-info-text'''||wwv_flow.LF||
'    when ''Negative'''||wwv_flow.LF||
'      then ''fa-emoji-angry u-danger-te';
wwv_flow_imp.g_varchar2_table(1013) := 'xt'''||wwv_flow.LF||
'    when ''Neutral'''||wwv_flow.LF||
'      then ''fa-emoji-neutral u-normal-text'''||wwv_flow.LF||
'    when ''Positive'''||wwv_flow.LF||
'      then ''f';
wwv_flow_imp.g_varchar2_table(1014) := 'a-emoji-pleased u-success-text'''||wwv_flow.LF||
'      else ''fa-no-icon'''||wwv_flow.LF||
'  end                     as sentiment_icon'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1015) := ', xmlserialize( content'||wwv_flow.LF||
'    xmlforest('||wwv_flow.LF||
'      q1.comment_by as "commented_by"'||wwv_flow.LF||
'    , apex_escape.strip';
wwv_flow_imp.g_varchar2_table(1016) := 'html('||wwv_flow.LF||
'        p_string => q1.body_html'||wwv_flow.LF||
'      )             as "comment"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                   ';
wwv_flow_imp.g_varchar2_table(1017) := '    as ctx_datastore'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1018) := '--  DDL for View BLOG_V_ALL_POSTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or';
wwv_flow_imp.g_varchar2_table(1019) := ' replace force view blog_v_all_posts as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'     t1.id              as i';
wwv_flow_imp.g_varchar2_table(1020) := 'd'||wwv_flow.LF||
'    ,t1.category_id     as category_id'||wwv_flow.LF||
'    ,t1.blogger_id      as blogger_id'||wwv_flow.LF||
'    ,t1.row_version  ';
wwv_flow_imp.g_varchar2_table(1021) := '   as row_version'||wwv_flow.LF||
'    ,t1.created_on      as created_on'||wwv_flow.LF||
'    ,t1.created_by      as created_by'||wwv_flow.LF||
'    ,t';
wwv_flow_imp.g_varchar2_table(1022) := '1.changed_on      as changed_on'||wwv_flow.LF||
'    ,t1.changed_by      as changed_by'||wwv_flow.LF||
'    ,t3.blogger_name    as blo';
wwv_flow_imp.g_varchar2_table(1023) := 'gger_name'||wwv_flow.LF||
'    ,t3.email           as blogger_email'||wwv_flow.LF||
'    ,t2.title           as category_title'||wwv_flow.LF||
'    ,t1';
wwv_flow_imp.g_varchar2_table(1024) := '.title           as title'||wwv_flow.LF||
'    ,t1.post_desc       as post_desc'||wwv_flow.LF||
'    ,t1.first_paragraph as first_para';
wwv_flow_imp.g_varchar2_table(1025) := 'graph'||wwv_flow.LF||
'    ,t1.body_html       as body_html'||wwv_flow.LF||
'    ,t1.body_length     as body_length'||wwv_flow.LF||
'    ,t1.published_';
wwv_flow_imp.g_varchar2_table(1026) := 'on    as published_on'||wwv_flow.LF||
'    ,t1.notes           as notes'||wwv_flow.LF||
'    ,t1.ctx_search      as ctx_search'||wwv_flow.LF||
'    ,t1';
wwv_flow_imp.g_varchar2_table(1027) := '.rowid           as ctx_rid'||wwv_flow.LF||
'    ,case t1.is_active * t2.is_active * t3.is_active'||wwv_flow.LF||
'      when 1'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(1028) := 'then t1.published_on'||wwv_flow.LF||
'     end                as published_display'||wwv_flow.LF||
'    ,case'||wwv_flow.LF||
'      when t3.is_active ';
wwv_flow_imp.g_varchar2_table(1029) := '= 0'||wwv_flow.LF||
'        then ''BLOGGER_DISABLED'''||wwv_flow.LF||
'      when t2.is_active = 0'||wwv_flow.LF||
'        then ''CATEGORY_DISABLED'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1030) := '   when t1.is_active = 0'||wwv_flow.LF||
'        then ''DRAFT'''||wwv_flow.LF||
'      when t1.published_on > localtimestamp'||wwv_flow.LF||
'        th';
wwv_flow_imp.g_varchar2_table(1031) := 'en ''SCHEDULED'''||wwv_flow.LF||
'        else ''PUBLISHED'''||wwv_flow.LF||
'    end                 as post_status_code'||wwv_flow.LF||
'  from blog_post';
wwv_flow_imp.g_varchar2_table(1032) := 's t1'||wwv_flow.LF||
'  join blog_categories t2'||wwv_flow.LF||
'    on t1.category_id = t2.id'||wwv_flow.LF||
'  join blog_bloggers t3'||wwv_flow.LF||
'    on t1.blogg';
wwv_flow_imp.g_varchar2_table(1033) := 'er_id = t3.id'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.id                  as id'||wwv_flow.LF||
'  ,q1.category_id         as ca';
wwv_flow_imp.g_varchar2_table(1034) := 'tegory_id'||wwv_flow.LF||
'  ,q1.blogger_id          as blogger_id'||wwv_flow.LF||
'  ,q1.row_version         as row_version'||wwv_flow.LF||
'  ,q1.cre';
wwv_flow_imp.g_varchar2_table(1035) := 'ated_on          as created_on'||wwv_flow.LF||
'  ,lower( q1.created_by ) as created_by'||wwv_flow.LF||
'  ,q1.changed_on          as ';
wwv_flow_imp.g_varchar2_table(1036) := 'changed_on'||wwv_flow.LF||
'  ,lower( q1.changed_by ) as changed_by'||wwv_flow.LF||
'  ,q1.blogger_name        as blogger_name'||wwv_flow.LF||
'  ,q1.b';
wwv_flow_imp.g_varchar2_table(1037) := 'logger_email       as blogger_email'||wwv_flow.LF||
'  ,q1.category_title      as category_title'||wwv_flow.LF||
'  ,q1.title         ';
wwv_flow_imp.g_varchar2_table(1038) := '      as title'||wwv_flow.LF||
'  ,q1.post_desc           as post_desc'||wwv_flow.LF||
'  ,q1.first_paragraph     as first_paragraph'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1039) := ' ,q1.body_html           as body_html'||wwv_flow.LF||
'  ,q1.body_length         as body_length'||wwv_flow.LF||
'  ,q1.published_on   ';
wwv_flow_imp.g_varchar2_table(1040) := '     as published_on'||wwv_flow.LF||
'  ,q1.notes               as notes'||wwv_flow.LF||
'  ,q1.published_display   as published_displ';
wwv_flow_imp.g_varchar2_table(1041) := 'ay'||wwv_flow.LF||
'  ,q1.post_status_code    as post_status_code'||wwv_flow.LF||
'  ,q1.ctx_search          as ctx_search'||wwv_flow.LF||
'  ,q1.ctx_r';
wwv_flow_imp.g_varchar2_table(1042) := 'id             as ctx_rid'||wwv_flow.LF||
'  ,case q1.post_status_code'||wwv_flow.LF||
'    when ''BLOGGER_DISABLED'' then ''fa-stop-circ';
wwv_flow_imp.g_varchar2_table(1043) := 'le u-danger-text'''||wwv_flow.LF||
'    when ''CATEGORY_DISABLED''then ''fa-minus-circle u-danger-text'''||wwv_flow.LF||
'    when ''DRAFT'' ';
wwv_flow_imp.g_varchar2_table(1044) := '           then ''fa-pause-circle u-warning-text'''||wwv_flow.LF||
'    when ''SCHEDULED''        then ''fa-clock-o u-info';
wwv_flow_imp.g_varchar2_table(1045) := '-text'''||wwv_flow.LF||
'    when ''PUBLISHED''        then ''fa-check-circle u-success-text'''||wwv_flow.LF||
'                           ';
wwv_flow_imp.g_varchar2_table(1046) := ' else ''fa-question-circle'''||wwv_flow.LF||
'  end                     as post_status_icon'||wwv_flow.LF||
'-- Workaround for IR detail';
wwv_flow_imp.g_varchar2_table(1047) := ' view'||wwv_flow.LF||
'  ,to_char('||wwv_flow.LF||
'     q1.published_on'||wwv_flow.LF||
'    ,('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        blog_util.get_attribute_value( ''P';
wwv_flow_imp.g_varchar2_table(1048) := '0_BLOG_POST_DATE_FORMAT'' )'||wwv_flow.LF||
'       from dual'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as detail_view_published';
wwv_flow_imp.g_varchar2_table(1049) := ''||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'     select'||wwv_flow.LF||
'      listagg( tags.tag_id, '':'' )  within group( order by tags.display_seq ) as ta';
wwv_flow_imp.g_varchar2_table(1050) := 'g_ids'||wwv_flow.LF||
'     from blog_v_all_post_tags tags'||wwv_flow.LF||
'     where 1 = 1'||wwv_flow.LF||
'     and tags.post_id = q1.id'||wwv_flow.LF||
'   )       ';
wwv_flow_imp.g_varchar2_table(1051) := '               as tag_id'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      listagg( tags.tag, '', '' )  within group( order by tag';
wwv_flow_imp.g_varchar2_table(1052) := 's.display_seq ) as tags'||wwv_flow.LF||
'    from blog_v_all_post_tags tags'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and tags.post_id = q1';
wwv_flow_imp.g_varchar2_table(1053) := '.id'||wwv_flow.LF||
'    and tags.is_active * tags.tag_is_active = 1'||wwv_flow.LF||
'  )                       as visible_tags'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1054) := '   select'||wwv_flow.LF||
'      listagg( tags.tag, '', '' )  within group( order by tags.display_seq ) as tags'||wwv_flow.LF||
'    fro';
wwv_flow_imp.g_varchar2_table(1055) := 'm blog_v_all_post_tags tags'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and tags.post_id = q1.id'||wwv_flow.LF||
'    and tags.is_active * ta';
wwv_flow_imp.g_varchar2_table(1056) := 'gs.tag_is_active = 0'||wwv_flow.LF||
'  )                       as hidden_tags'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1057) := '    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'  )                       as c';
wwv_flow_imp.g_varchar2_table(1058) := 'omments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and ';
wwv_flow_imp.g_varchar2_table(1059) := 'co.is_active = 1'||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'  )                       as published_comments_cnt'||wwv_flow.LF||
'  ,';
wwv_flow_imp.g_varchar2_table(1060) := '('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and co.post_id  = q';
wwv_flow_imp.g_varchar2_table(1061) := '1.id'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_comment_flags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.';
wwv_flow_imp.g_varchar2_table(1062) := 'flag in( ''NEW'', ''UNREAD'' )'||wwv_flow.LF||
'      and x1.comment_id = co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as unread';
wwv_flow_imp.g_varchar2_table(1063) := '_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    an';
wwv_flow_imp.g_varchar2_table(1064) := 'd co.post_id  = q1.id'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_comment_flags x1'||wwv_flow.LF||
'      where 1 ';
wwv_flow_imp.g_varchar2_table(1065) := '= 1'||wwv_flow.LF||
'      and x1.flag = ''MODERATE'''||wwv_flow.LF||
'      and x1.comment_id = co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       a';
wwv_flow_imp.g_varchar2_table(1066) := 's moderate_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 ';
wwv_flow_imp.g_varchar2_table(1067) := '= 1'||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'    and co.is_active = 0'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      fr';
wwv_flow_imp.g_varchar2_table(1068) := 'om blog_comment_flags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.flag = ''MODERATE'''||wwv_flow.LF||
'      and x1.comment_id = ';
wwv_flow_imp.g_varchar2_table(1069) := 'co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as disabled_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lov.display_val';
wwv_flow_imp.g_varchar2_table(1070) := 'ue'||wwv_flow.LF||
'    from blog_v_lov lov'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lov.lov_name = ''POST_STATUS'''||wwv_flow.LF||
'      and lov.retu';
wwv_flow_imp.g_varchar2_table(1071) := 'rn_value = q1.post_status_code'||wwv_flow.LF||
'  )                       as post_status_txt'||wwv_flow.LF||
'-- Post tags for admin a';
wwv_flow_imp.g_varchar2_table(1072) := 'pp page 11 IR detail view'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xmlserialize('||wwv_flow.LF||
'        content xmlagg( lkp1.tag_html3';
wwv_flow_imp.g_varchar2_table(1073) := ' order by lkp1.display_seq )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    from blog_v_post_tags lkp1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp1.p';
wwv_flow_imp.g_varchar2_table(1074) := 'ost_id = q1.id'||wwv_flow.LF||
'  )                       as tags_html'||wwv_flow.LF||
'  ,apex_escape.striphtml('||wwv_flow.LF||
'    p_string => q1.f';
wwv_flow_imp.g_varchar2_table(1075) := 'irst_paragraph'||wwv_flow.LF||
'  )                       as search_desc'||wwv_flow.LF||
'-- XML for text index user datastore'||wwv_flow.LF||
'  ,xmls';
wwv_flow_imp.g_varchar2_table(1076) := 'erialize( content'||wwv_flow.LF||
'    xmlforest('||wwv_flow.LF||
'      q1.blogger_name     as "author"'||wwv_flow.LF||
'      ,q1.title           as ';
wwv_flow_imp.g_varchar2_table(1077) := '"title"'||wwv_flow.LF||
'      ,q1.category_title  as "category"'||wwv_flow.LF||
'      ,q1.post_desc       as "description"'||wwv_flow.LF||
'      --,';
wwv_flow_imp.g_varchar2_table(1078) := 'q1.notes           as "notes"'||wwv_flow.LF||
'      ,apex_escape.striphtml('||wwv_flow.LF||
'        p_string => q1.body_html'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(1079) := '                   as "post"'||wwv_flow.LF||
'      ,('||wwv_flow.LF||
'        select'||wwv_flow.LF||
'          xmlagg( xmlforest( tags.tag as "tag" ';
wwv_flow_imp.g_varchar2_table(1080) := ') )'||wwv_flow.LF||
'        from blog_v_all_post_tags tags'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'        and tags.post_id = q1.id'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1081) := '    and tags.is_active * tags.tag_is_active = 1'||wwv_flow.LF||
'      )                   as "tags"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )       ';
wwv_flow_imp.g_varchar2_table(1082) := '                as ctx_datastore'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(1083) := '-----------'||wwv_flow.LF||
'--  DDL for View BLOG_V_FORM_POSTS'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1084) := '---'||wwv_flow.LF||
'create or replace force view blog_v_form_posts as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id               as id'||wwv_flow.LF||
'  ,t1.row_v';
wwv_flow_imp.g_varchar2_table(1085) := 'ersion     as row_version'||wwv_flow.LF||
'  ,t1.blogger_id      as blogger_id'||wwv_flow.LF||
'  ,t1.category_id     as category_id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1086) := ' ,t1.first_paragraph as first_paragraph'||wwv_flow.LF||
'  ,t1.is_active       as is_active'||wwv_flow.LF||
'  ,t1.post_desc       as ';
wwv_flow_imp.g_varchar2_table(1087) := 'post_desc'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.title'||wwv_flow.LF||
'    from blog_categories lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.id = ';
wwv_flow_imp.g_varchar2_table(1088) := 't1.category_id'||wwv_flow.LF||
'  )                   as category_title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      listagg( lkp.tag, '','' )';
wwv_flow_imp.g_varchar2_table(1089) := ''||wwv_flow.LF||
'        within group( order by lkp.display_seq )'||wwv_flow.LF||
'    from blog_v_all_post_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1090) := '      and lkp.post_id = t1.id'||wwv_flow.LF||
'  )                   as tags'||wwv_flow.LF||
'  ,t1.published_on    as published_on'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1091) := ',t1.title           as title'||wwv_flow.LF||
'  ,t1.body_html       as body_html'||wwv_flow.LF||
'  ,t1.notes           as notes'||wwv_flow.LF||
'from ';
wwv_flow_imp.g_varchar2_table(1092) := 'blog_posts t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Vie';
wwv_flow_imp.g_varchar2_table(1093) := 'w BLOG_V_POSTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view';
wwv_flow_imp.g_varchar2_table(1094) := ' blog_v_posts as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'     t1.id              as post_id'||wwv_flow.LF||
'    ,t3.id      ';
wwv_flow_imp.g_varchar2_table(1095) := '        as category_id'||wwv_flow.LF||
'    ,t2.id              as blogger_id'||wwv_flow.LF||
'    ,t2.blogger_name    as blogger_name';
wwv_flow_imp.g_varchar2_table(1096) := ''||wwv_flow.LF||
'    ,t1.title           as post_title'||wwv_flow.LF||
'    ,t3.title           as category_title'||wwv_flow.LF||
'    ,t1.post_desc  ';
wwv_flow_imp.g_varchar2_table(1097) := '     as post_desc'||wwv_flow.LF||
'    ,t1.first_paragraph as first_paragraph'||wwv_flow.LF||
'    ,t1.body_html       as body_html'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1098) := '  ,t1.published_on    as published_on'||wwv_flow.LF||
'    ,t1.ctx_search      as ctx_search'||wwv_flow.LF||
'    ,t1.changed_on      ';
wwv_flow_imp.g_varchar2_table(1099) := 'as changed_on'||wwv_flow.LF||
'    ,t1.archive_year    as archive_year'||wwv_flow.LF||
'    ,t3.display_seq     as category_seq'||wwv_flow.LF||
'  from';
wwv_flow_imp.g_varchar2_table(1100) := ' blog_posts t1'||wwv_flow.LF||
'  join blog_bloggers t2'||wwv_flow.LF||
'    on t1.blogger_id  = t2.id'||wwv_flow.LF||
'  join blog_categories t3'||wwv_flow.LF||
'    o';
wwv_flow_imp.g_varchar2_table(1101) := 'n t1.category_id = t3.id'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and t1.is_active = 1'||wwv_flow.LF||
'    and t2.is_active = 1'||wwv_flow.LF||
'    and t3.';
wwv_flow_imp.g_varchar2_table(1102) := 'is_active = 1'||wwv_flow.LF||
'    and t1.published_on <= current_timestamp'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.post_id         as post_id';
wwv_flow_imp.g_varchar2_table(1103) := ''||wwv_flow.LF||
'  ,q1.category_id     as category_id'||wwv_flow.LF||
'  ,q1.blogger_id      as blogger_id'||wwv_flow.LF||
'  ,q1.blogger_name    as b';
wwv_flow_imp.g_varchar2_table(1104) := 'logger_name'||wwv_flow.LF||
'  ,q1.post_title      as post_title'||wwv_flow.LF||
'  ,q1.category_title  as category_title'||wwv_flow.LF||
'  ,q1.post_d';
wwv_flow_imp.g_varchar2_table(1105) := 'esc       as post_desc'||wwv_flow.LF||
'  ,q1.first_paragraph as first_paragraph'||wwv_flow.LF||
'  ,q1.body_html       as body_html'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1106) := ' ,q1.published_on    as published_on'||wwv_flow.LF||
'  ,q1.ctx_search      as ctx_search'||wwv_flow.LF||
'  ,q1.changed_on      as ch';
wwv_flow_imp.g_varchar2_table(1107) := 'anged_on'||wwv_flow.LF||
'  ,q1.archive_year    as archive_year'||wwv_flow.LF||
'  ,q1.category_seq    as category_seq'||wwv_flow.LF||
'-- Generate pos';
wwv_flow_imp.g_varchar2_table(1108) := 't URL'||wwv_flow.LF||
'  ,blog_url.get_post('||wwv_flow.LF||
'    p_post_id => q1.post_id'||wwv_flow.LF||
'  )                   as post_url'||wwv_flow.LF||
'-- Generat';
wwv_flow_imp.g_varchar2_table(1109) := 'e category URL'||wwv_flow.LF||
'  ,blog_url.get_category('||wwv_flow.LF||
'    p_category_id => q1.category_id'||wwv_flow.LF||
'  )                   a';
wwv_flow_imp.g_varchar2_table(1110) := 's category_url'||wwv_flow.LF||
'-- Aggregate tag HTML for post'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xmlserialize('||wwv_flow.LF||
'        content xm';
wwv_flow_imp.g_varchar2_table(1111) := 'lagg( lkp_tag.tag_html1 order by lkp_tag.display_seq ) as varchar2(4000)'||wwv_flow.LF||
'      ) as tags_html'||wwv_flow.LF||
'    fr';
wwv_flow_imp.g_varchar2_table(1112) := 'om blog_v_post_tags lkp_tag'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_tag.post_id = q1.post_id'||wwv_flow.LF||
'  )              ';
wwv_flow_imp.g_varchar2_table(1113) := '     as tags_html1'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xmlserialize('||wwv_flow.LF||
'        content xmlagg( lkp_tag.tag_html2 ord';
wwv_flow_imp.g_varchar2_table(1114) := 'er by lkp_tag.display_seq )'||wwv_flow.LF||
'      ) as tags_html'||wwv_flow.LF||
'    from blog_v_post_tags lkp_tag'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1115) := '     and lkp_tag.post_id = q1.post_id'||wwv_flow.LF||
'  )                   as tags_html2'||wwv_flow.LF||
'-- Fetch next post id and ';
wwv_flow_imp.g_varchar2_table(1116) := 'title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      json_object('||wwv_flow.LF||
'         ''post_id''    : lkp_next.post_id'||wwv_flow.LF||
'        ,''post_tit';
wwv_flow_imp.g_varchar2_table(1117) := 'le'' : lkp_next.post_title'||wwv_flow.LF||
'      ) as post'||wwv_flow.LF||
'    from q1 lkp_next'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_next.pu';
wwv_flow_imp.g_varchar2_table(1118) := 'blished_on > q1.published_on'||wwv_flow.LF||
'    order by lkp_next.published_on asc'||wwv_flow.LF||
'    fetch first 1 rows only'||wwv_flow.LF||
'  ) ';
wwv_flow_imp.g_varchar2_table(1119) := '                  as next_post'||wwv_flow.LF||
'-- Fetch previous post id and title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      json_object';
wwv_flow_imp.g_varchar2_table(1120) := '('||wwv_flow.LF||
'         ''post_id''    : lkp_prev.post_id'||wwv_flow.LF||
'        ,''post_title'' : lkp_prev.post_title'||wwv_flow.LF||
'      ) as po';
wwv_flow_imp.g_varchar2_table(1121) := 'st'||wwv_flow.LF||
'    from q1 lkp_prev'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_prev.published_on < q1.published_on'||wwv_flow.LF||
'    order ';
wwv_flow_imp.g_varchar2_table(1122) := 'by lkp_prev.published_on desc'||wwv_flow.LF||
'    fetch first 1 rows only'||wwv_flow.LF||
'  )                   as prev_post'||wwv_flow.LF||
'from q1';
wwv_flow_imp.g_varchar2_table(1123) := ''||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for V';
wwv_flow_imp.g_varchar2_table(1124) := 'iew BLOG_V_SETTINGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force';
wwv_flow_imp.g_varchar2_table(1125) := ' view blog_v_settings as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                       as id'||wwv_flow.LF||
', t1.row_version              as';
wwv_flow_imp.g_varchar2_table(1126) := ' row_version'||wwv_flow.LF||
', t1.changed_on               as changed_on'||wwv_flow.LF||
', lower(t1.changed_by)        as changed_by';
wwv_flow_imp.g_varchar2_table(1127) := ''||wwv_flow.LF||
', t1.is_nullable              as is_nullable'||wwv_flow.LF||
', t1.display_seq              as display_seq'||wwv_flow.LF||
', t1.attr';
wwv_flow_imp.g_varchar2_table(1128) := 'ibute_name           as attribute_name'||wwv_flow.LF||
', apex_lang.get_message('||wwv_flow.LF||
'    p_name => t1.attribute_message'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1129) := ' )                           as attribute_desc'||wwv_flow.LF||
', t1.attribute_value          as attribute_value'||wwv_flow.LF||
', t1';
wwv_flow_imp.g_varchar2_table(1130) := '.data_type                as data_type'||wwv_flow.LF||
', t1.int_min                  as int_min'||wwv_flow.LF||
', t1.int_max        ';
wwv_flow_imp.g_varchar2_table(1131) := '          as int_max'||wwv_flow.LF||
', t1.help_message             as help_message'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lov.display_value'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1132) := '    from blog_v_lov lov'||wwv_flow.LF||
'    where lov.lov_name = ''YES_NO'''||wwv_flow.LF||
'    and to_number( lov.return_value ) = ( ';
wwv_flow_imp.g_varchar2_table(1133) := 't1.is_nullable - 1 ) * -1'||wwv_flow.LF||
'  )                           as value_required'||wwv_flow.LF||
'-- HTML in query because I';
wwv_flow_imp.g_varchar2_table(1134) := 'G removes HTML from column HTM expression in control break column'||wwv_flow.LF||
'-- Control break is sorted and att';
wwv_flow_imp.g_varchar2_table(1135) := 'ribute data-sort-order gives correct order'||wwv_flow.LF||
', apex_string.format('||wwv_flow.LF||
'    p_message => ''<span data-sort-o';
wwv_flow_imp.g_varchar2_table(1136) := 'rder="%s" class="u-bold">%s</span>'''||wwv_flow.LF||
'  , p0 => lpad( min( t1.display_seq ) over( partition by t1.attr';
wwv_flow_imp.g_varchar2_table(1137) := 'ibute_group_message ), 5, ''0'' )'||wwv_flow.LF||
'  , p1 =>'||wwv_flow.LF||
'      apex_lang.get_message('||wwv_flow.LF||
'        p_name => t1.attribut';
wwv_flow_imp.g_varchar2_table(1138) := 'e_group_message'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  )                           as attribute_group_html'||wwv_flow.LF||
', t1.attribute_group_m';
wwv_flow_imp.g_varchar2_table(1139) := 'essage  as attribute_group'||wwv_flow.LF||
'from blog_settings t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and case'||wwv_flow.LF||
'    when t1.build_option_nam';
wwv_flow_imp.g_varchar2_table(1140) := 'e is null'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    when apex_application_admin.get_build_option_status('||wwv_flow.LF||
'      p_application_id';
wwv_flow_imp.g_varchar2_table(1141) := '    => sys_context( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'    , p_build_option_name => t1.build_option_name'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1142) := ' ) = t1.build_option_status'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    else 0'||wwv_flow.LF||
'  end = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(1143) := '---------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ARCHIVE_YEAR'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(1144) := '---------------------------'||wwv_flow.LF||
'create or replace force view blog_v_archive_year as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   v1.archive';
wwv_flow_imp.g_varchar2_table(1145) := '_year      as archive_year'||wwv_flow.LF||
'  ,count(1)             as post_count'||wwv_flow.LF||
'  ,max( v1.changed_on ) as changed_';
wwv_flow_imp.g_varchar2_table(1146) := 'on'||wwv_flow.LF||
'  ,blog_url.get_archive('||wwv_flow.LF||
'    p_archive_id => v1.archive_year'||wwv_flow.LF||
'  )                     as archive_u';
wwv_flow_imp.g_varchar2_table(1147) := 'rl'||wwv_flow.LF||
'  ,feat.show_post_count as show_post_count'||wwv_flow.LF||
'  ,case feat.show_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' then c';
wwv_flow_imp.g_varchar2_table(1148) := 'ount(1)'||wwv_flow.LF||
'  end                   as list_badge'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'    p_message => ''data-item-id=';
wwv_flow_imp.g_varchar2_table(1149) := '"%s"'''||wwv_flow.LF||
'    ,p0 => v1.archive_year'||wwv_flow.LF||
'  )                     as list_attr'||wwv_flow.LF||
'from blog_v_posts v1'||wwv_flow.LF||
'cross joi';
wwv_flow_imp.g_varchar2_table(1150) := 'n('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_application_admin.get_build_option_status('||wwv_flow.LF||
'       p_application_id     => sys_c';
wwv_flow_imp.g_varchar2_table(1151) := 'ontext( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'      ,p_build_option_name  => ''BLOG_FEATURE_ARCHIVE_POST_COUNT'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1152) := '    ) as show_post_count'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'group by v1.archive_year'||wwv_flow.LF||
'  ,feat.show_post_c';
wwv_flow_imp.g_varchar2_table(1153) := 'ount'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG';
wwv_flow_imp.g_varchar2_table(1154) := '_V_CATEGORIES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view ';
wwv_flow_imp.g_varchar2_table(1155) := 'blog_v_categories as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   v1.category_id       as category_id'||wwv_flow.LF||
'  ,v1.category_title    as catego';
wwv_flow_imp.g_varchar2_table(1156) := 'ry_title'||wwv_flow.LF||
'  ,v1.category_seq      as display_seq'||wwv_flow.LF||
'  ,count(1)             as posts_count'||wwv_flow.LF||
'-- if categor';
wwv_flow_imp.g_varchar2_table(1157) := 'y is changed, trigger tickles text index and post changes'||wwv_flow.LF||
'  ,max( v1.changed_on ) as changed_on'||wwv_flow.LF||
'  ,b';
wwv_flow_imp.g_varchar2_table(1158) := 'log_url.get_category('||wwv_flow.LF||
'    p_category_id => v1.category_id'||wwv_flow.LF||
'  )                     as category_url'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1159) := ',feat.show_post_count as show_post_count'||wwv_flow.LF||
'  ,case feat.show_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' then count(';
wwv_flow_imp.g_varchar2_table(1160) := '1)'||wwv_flow.LF||
'  end                   as list_badge'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'    p_message => ''data-item-id="%s"''';
wwv_flow_imp.g_varchar2_table(1161) := ''||wwv_flow.LF||
'    ,p0 => v1.category_id'||wwv_flow.LF||
'  )                     as list_attr'||wwv_flow.LF||
'from blog_v_posts v1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  s';
wwv_flow_imp.g_varchar2_table(1162) := 'elect'||wwv_flow.LF||
'    apex_application_admin.get_build_option_status('||wwv_flow.LF||
'       p_application_id     => sys_context';
wwv_flow_imp.g_varchar2_table(1163) := '( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'      ,p_build_option_name  => ''BLOG_FEATURE_CATEGORY_POST_COUNT'''||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(1164) := ' as show_post_count'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'group by v1.category_id'||wwv_flow.LF||
'  ,v1.category_title'||wwv_flow.LF||
'  ,v';
wwv_flow_imp.g_varchar2_table(1165) := '1.category_seq'||wwv_flow.LF||
'  ,feat.show_post_count'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1166) := '------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_COMMENTS'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1167) := '--'||wwv_flow.LF||
'create or replace force view blog_v_comments as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id          as comment_id'||wwv_flow.LF||
'  ,t1.post';
wwv_flow_imp.g_varchar2_table(1168) := '_id     as post_id'||wwv_flow.LF||
'  ,t1.parent_id   as parent_id'||wwv_flow.LF||
'  ,t1.created_on  as created_on'||wwv_flow.LF||
'  ,t1.comment_by  ';
wwv_flow_imp.g_varchar2_table(1169) := 'as comment_by'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      post_title'||wwv_flow.LF||
'    from blog_v_posts lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp';
wwv_flow_imp.g_varchar2_table(1170) := '.post_id = t1.post_id'||wwv_flow.LF||
'  )               as post_title'||wwv_flow.LF||
'-- Generate post URL'||wwv_flow.LF||
'  ,blog_url.get_post('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1171) := ' p_post_id => t1.post_id'||wwv_flow.LF||
'  )               as post_url'||wwv_flow.LF||
'  ,t1.body_html   as comment_body'||wwv_flow.LF||
'  ,t1.ctx_s';
wwv_flow_imp.g_varchar2_table(1172) := 'earch  as ctx_search'||wwv_flow.LF||
'  ,apex_string.get_initials('||wwv_flow.LF||
'    p_str => t1.comment_by'||wwv_flow.LF||
'  )               as us';
wwv_flow_imp.g_varchar2_table(1173) := 'er_icon'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'     p_message => ''u-color-%s'''||wwv_flow.LF||
'    ,p0 => ora_hash( lower( t1.comment';
wwv_flow_imp.g_varchar2_table(1174) := '_by ), 44 ) + 1'||wwv_flow.LF||
'  )               as icon_modifier'||wwv_flow.LF||
'from blog_comments t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and t1.is_act';
wwv_flow_imp.g_varchar2_table(1175) := 'ive = 1'||wwv_flow.LF||
'  and not exists('||wwv_flow.LF||
'    select 1'||wwv_flow.LF||
'    from blog_comment_flags x1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and x1.c';
wwv_flow_imp.g_varchar2_table(1176) := 'omment_id = t1.id'||wwv_flow.LF||
'      and x1.flag = ''MODERATE'''||wwv_flow.LF||
'  )'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(1177) := '--------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_FORM_COMMENTS'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(1178) := '---------------------'||wwv_flow.LF||
'create or replace force view blog_v_form_comments as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id'||wwv_flow.LF||
', t1.row_v';
wwv_flow_imp.g_varchar2_table(1179) := 'ersion'||wwv_flow.LF||
', t1.is_active'||wwv_flow.LF||
', t1.post_id'||wwv_flow.LF||
', t1.parent_id'||wwv_flow.LF||
', t1.body_html'||wwv_flow.LF||
', t1.comment_by'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1180) := '  lkp.sentiment_json.documentSentiment'||wwv_flow.LF||
'    from blog_comment_sentiments lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      an';
wwv_flow_imp.g_varchar2_table(1181) := 'd lkp.comment_id = t1.id'||wwv_flow.LF||
'  ) as sentiment'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lkp.title'||wwv_flow.LF||
'    from blog_posts lkp'||wwv_flow.LF||
'    where';
wwv_flow_imp.g_varchar2_table(1182) := ' 1 = 1'||wwv_flow.LF||
'      and lkp.id = t1.post_id'||wwv_flow.LF||
'  ) as post_title'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lkp.comment_status_code'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1183) := '    from blog_v_all_comments lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.id = t1.id'||wwv_flow.LF||
'  ) as comment_status_code';
wwv_flow_imp.g_varchar2_table(1184) := ''||wwv_flow.LF||
'from blog_comments t1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View B';
wwv_flow_imp.g_varchar2_table(1185) := 'LOG_V_POSTS_LAST20'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force ';
wwv_flow_imp.g_varchar2_table(1186) := 'view blog_v_posts_last20 as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  rownum             as display_seq'||wwv_flow.LF||
', q1.post_id         as post_';
wwv_flow_imp.g_varchar2_table(1187) := 'id'||wwv_flow.LF||
', q1.published_on    as published_on'||wwv_flow.LF||
', q1.blogger_name    as blogger_name'||wwv_flow.LF||
', q1.post_title      as';
wwv_flow_imp.g_varchar2_table(1188) := ' post_title'||wwv_flow.LF||
', q1.post_desc       as post_desc'||wwv_flow.LF||
', q1.category_title  as category_title'||wwv_flow.LF||
', q1.post_url  ';
wwv_flow_imp.g_varchar2_table(1189) := '      as post_url'||wwv_flow.LF||
', q1.body_html       as body_html'||wwv_flow.LF||
', q1.absolute_url    as absolute_url'||wwv_flow.LF||
', apex_stri';
wwv_flow_imp.g_varchar2_table(1190) := 'ng.format('||wwv_flow.LF||
'    p_message => ''data-item-id="%s"'''||wwv_flow.LF||
'    ,p0 => q1.post_id'||wwv_flow.LF||
'  )                   as list_';
wwv_flow_imp.g_varchar2_table(1191) := 'attr'||wwv_flow.LF||
'from ('||wwv_flow.LF||
'  select --+ first_rows(20)'||wwv_flow.LF||
'    v1.post_id'||wwv_flow.LF||
'  , v1.published_on'||wwv_flow.LF||
'  , v1.blogger_name'||wwv_flow.LF||
'  , v';
wwv_flow_imp.g_varchar2_table(1192) := '1.post_title'||wwv_flow.LF||
'  , v1.post_desc'||wwv_flow.LF||
'  , v1.category_title'||wwv_flow.LF||
'  , v1.post_url'||wwv_flow.LF||
'  , v1.body_html'||wwv_flow.LF||
'  , blog_url.ge';
wwv_flow_imp.g_varchar2_table(1193) := 't_post('||wwv_flow.LF||
'      p_post_id     => v1.post_id'||wwv_flow.LF||
'    , p_canonical  => ''YES'''||wwv_flow.LF||
'    ) as absolute_url'||wwv_flow.LF||
'  from b';
wwv_flow_imp.g_varchar2_table(1194) := 'log_v_posts v1'||wwv_flow.LF||
'  order by v1.published_on desc'||wwv_flow.LF||
') q1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and rownum <= 20'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1195) := '--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_TAGS'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(1196) := '------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_tags as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1197) := ' select'||wwv_flow.LF||
'    v1.tag_id'||wwv_flow.LF||
'  , v1.tag'||wwv_flow.LF||
'  , v1.tag_url'||wwv_flow.LF||
'  -- if tag is changed, trigger tickles text index a';
wwv_flow_imp.g_varchar2_table(1198) := 'nd post changes'||wwv_flow.LF||
'  , max( v2.changed_on ) as changed_on'||wwv_flow.LF||
'  , count( 1 ) as posts_count'||wwv_flow.LF||
'  from blog_v_p';
wwv_flow_imp.g_varchar2_table(1199) := 'ost_tags v1'||wwv_flow.LF||
'  join blog_v_posts v2 on v1.post_id = v2.post_id'||wwv_flow.LF||
'  group by'||wwv_flow.LF||
'    v1.tag_id'||wwv_flow.LF||
'  , v1.tag'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1200) := ', v1.tag_url'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  q1.tag_id             as tag_id'||wwv_flow.LF||
', q1.tag                as tag'||wwv_flow.LF||
', q1.tag_url ';
wwv_flow_imp.g_varchar2_table(1201) := '           as tag_url'||wwv_flow.LF||
', q1.posts_count        as posts_count'||wwv_flow.LF||
', q1.changed_on         as changed_on'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(1202) := ' width_bucket('||wwv_flow.LF||
'    q1.posts_count'||wwv_flow.LF||
'  , min( q1.posts_count ) over()'||wwv_flow.LF||
'  , max( q1.posts_count ) over()'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1203) := '  , 7'||wwv_flow.LF||
'  )                     as tag_bucket'||wwv_flow.LF||
', feat.show_post_count  as show_post_count'||wwv_flow.LF||
', case feat.s';
wwv_flow_imp.g_varchar2_table(1204) := 'how_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' then q1.posts_count'||wwv_flow.LF||
'  end                   as list_badge'||wwv_flow.LF||
'-- Get f';
wwv_flow_imp.g_varchar2_table(1205) := 'eature tag post count status'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_application_admin.get_build_optio';
wwv_flow_imp.g_varchar2_table(1206) := 'n_status('||wwv_flow.LF||
'      p_application_id     => sys_context( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'    , p_build_option';
wwv_flow_imp.g_varchar2_table(1207) := '_name  => ''BLOG_FEATURE_TAG_CLOUD_POST_COUNT'''||wwv_flow.LF||
'    ) as show_post_count'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = ';
wwv_flow_imp.g_varchar2_table(1208) := '1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG';
wwv_flow_imp.g_varchar2_table(1209) := '_BLOGGERS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE';
wwv_flow_imp.g_varchar2_table(1210) := ' TRIGGER "BLOG_BLOGGERS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_bloggers'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inser';
wwv_flow_imp.g_varchar2_table(1211) := 'ting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := c';
wwv_flow_imp.g_varchar2_table(1212) := 'oalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp )';
wwv_flow_imp.g_varchar2_table(1213) := ';'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_';
wwv_flow_imp.g_varchar2_table(1214) := 'USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' ';
wwv_flow_imp.g_varchar2_table(1215) := ')'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.chang';
wwv_flow_imp.g_varchar2_table(1216) := 'ed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER''';
wwv_flow_imp.g_varchar2_table(1217) := ' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'e';
wwv_flow_imp.g_varchar2_table(1218) := 'nd;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_CATEGORIES_T';
wwv_flow_imp.g_varchar2_table(1219) := 'RG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "B';
wwv_flow_imp.g_varchar2_table(1220) := 'LOG_CATEGORIES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_categories'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting th';
wwv_flow_imp.g_varchar2_table(1221) := 'en'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce';
wwv_flow_imp.g_varchar2_table(1222) := '( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :';
wwv_flow_imp.g_varchar2_table(1223) := 'new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )';
wwv_flow_imp.g_varchar2_table(1224) := ''||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(1225) := ';'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on :';
wwv_flow_imp.g_varchar2_table(1226) := '= localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1227) := ',sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(1228) := '-------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_COMMENTS_TRG'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(1229) := '--------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMME';
wwv_flow_imp.g_varchar2_table(1230) := 'NTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comments'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.i';
wwv_flow_imp.g_varchar2_table(1231) := 'd           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_ve';
wwv_flow_imp.g_varchar2_table(1232) := 'rsion, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_b';
wwv_flow_imp.g_varchar2_table(1233) := 'y   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_c';
wwv_flow_imp.g_varchar2_table(1234) := 'ontext( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif upd';
wwv_flow_imp.g_varchar2_table(1235) := 'ating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimest';
wwv_flow_imp.g_varchar2_table(1236) := 'amp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context(';
wwv_flow_imp.g_varchar2_table(1237) := ' ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- Generate comment';
wwv_flow_imp.g_varchar2_table(1238) := ' preview'||wwv_flow.LF||
'  :new.comment_preview := blog_comment.short_text( :new.body_html );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- tickle text inde';
wwv_flow_imp.g_varchar2_table(1239) := 'x'||wwv_flow.LF||
'  :new.ctx_search := ''X'';'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL';
wwv_flow_imp.g_varchar2_table(1240) := ' for Trigger BLOG_COMMENT_FLAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE ';
wwv_flow_imp.g_varchar2_table(1241) := 'OR REPLACE TRIGGER "BLOG_COMMENT_FLAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comment_flags'||wwv_flow.LF||
'for each r';
wwv_flow_imp.g_varchar2_table(1242) := 'ow'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :n';
wwv_flow_imp.g_varchar2_table(1243) := 'ew.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_';
wwv_flow_imp.g_varchar2_table(1244) := 'on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''';
wwv_flow_imp.g_varchar2_table(1245) := 'APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERE';
wwv_flow_imp.g_varchar2_table(1246) := 'NV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  e';
wwv_flow_imp.g_varchar2_table(1247) := 'nd if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$';
wwv_flow_imp.g_varchar2_table(1248) := 'SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SES';
wwv_flow_imp.g_varchar2_table(1249) := 'SION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigg';
wwv_flow_imp.g_varchar2_table(1250) := 'er BLOG_COMMENTS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDIT';
wwv_flow_imp.g_varchar2_table(1251) := 'IONABLE TRIGGER "BLOG_COMMENT_SENTIMENTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comment_sentiments'||wwv_flow.LF||
'for';
wwv_flow_imp.g_varchar2_table(1252) := ' each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );';
wwv_flow_imp.g_varchar2_table(1253) := ''||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.c';
wwv_flow_imp.g_varchar2_table(1254) := 'reated_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_con';
wwv_flow_imp.g_varchar2_table(1255) := 'text( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context(';
wwv_flow_imp.g_varchar2_table(1256) := ' ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version +';
wwv_flow_imp.g_varchar2_table(1257) := ' 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context(';
wwv_flow_imp.g_varchar2_table(1258) := ' ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV';
wwv_flow_imp.g_varchar2_table(1259) := ''', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL fo';
wwv_flow_imp.g_varchar2_table(1260) := 'r Trigger BLOG_COMMENT_SUBSCRIBERS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREA';
wwv_flow_imp.g_varchar2_table(1261) := 'TE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT_SUBSCRIBERS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_com';
wwv_flow_imp.g_varchar2_table(1262) := 'ment_subscribers'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id,';
wwv_flow_imp.g_varchar2_table(1263) := ' blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on  ';
wwv_flow_imp.g_varchar2_table(1264) := ' := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.creat';
wwv_flow_imp.g_varchar2_table(1265) := 'ed_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )';
wwv_flow_imp.g_varchar2_table(1266) := ''||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version :';
wwv_flow_imp.g_varchar2_table(1267) := '= :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesc';
wwv_flow_imp.g_varchar2_table(1268) := 'e('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,s';
wwv_flow_imp.g_varchar2_table(1269) := 'ys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1270) := '---------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_DYNAMIC_CONTENT_TRG'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(1271) := '-----------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_DYNAMIC_CONTENT_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update';
wwv_flow_imp.g_varchar2_table(1272) := ' on blog_dynamic_content'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( ';
wwv_flow_imp.g_varchar2_table(1273) := ':new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.crea';
wwv_flow_imp.g_varchar2_table(1274) := 'ted_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :n';
wwv_flow_imp.g_varchar2_table(1275) := 'ew.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY';
wwv_flow_imp.g_varchar2_table(1276) := '_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_v';
wwv_flow_imp.g_varchar2_table(1277) := 'ersion := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by :=';
wwv_flow_imp.g_varchar2_table(1278) := ' coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' ';
wwv_flow_imp.g_varchar2_table(1279) := ')'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(1280) := '-----------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_FEATURES_TRG'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1281) := '------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FEATURES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on bl';
wwv_flow_imp.g_varchar2_table(1282) := 'og_features'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog';
wwv_flow_imp.g_varchar2_table(1283) := '_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := c';
wwv_flow_imp.g_varchar2_table(1284) := 'oalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by';
wwv_flow_imp.g_varchar2_table(1285) := ''||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1286) := '  ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :ol';
wwv_flow_imp.g_varchar2_table(1287) := 'd.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1288) := '   sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_co';
wwv_flow_imp.g_varchar2_table(1289) := 'ntext( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1290) := '----'||wwv_flow.LF||
'--  DDL for Trigger BLOG_FILES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CRE';
wwv_flow_imp.g_varchar2_table(1291) := 'ATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FILES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_files'||wwv_flow.LF||
'for each r';
wwv_flow_imp.g_varchar2_table(1292) := 'ow'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
''||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :';
wwv_flow_imp.g_varchar2_table(1293) := 'new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created';
wwv_flow_imp.g_varchar2_table(1294) := '_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ';
wwv_flow_imp.g_varchar2_table(1295) := '''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USER';
wwv_flow_imp.g_varchar2_table(1296) := 'ENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    :new.is_active    := coalesce( :new.is_active, 1 );'||wwv_flow.LF||
'    :new.is_d';
wwv_flow_imp.g_varchar2_table(1297) := 'ownload  := coalesce( :new.is_download, 0 );'||wwv_flow.LF||
''||wwv_flow.LF||
'    :new.mime_type    := coalesce( :new.mime_type, blo';
wwv_flow_imp.g_varchar2_table(1298) := 'g_mime.get_mime_type( :new.file_name ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_ve';
wwv_flow_imp.g_varchar2_table(1299) := 'rsion + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_c';
wwv_flow_imp.g_varchar2_table(1300) := 'ontext( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''';
wwv_flow_imp.g_varchar2_table(1301) := 'USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.file_size := coalesce( :new.file_size, coalesce( sys.dbms_lo';
wwv_flow_imp.g_varchar2_table(1302) := 'b.getlength( :new.blob_content ), 0 ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1303) := '-----'||wwv_flow.LF||
'--  DDL for Trigger BLOG_INIT_ITEMS_TRG'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1304) := '--'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_INIT_ITEMS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_init_';
wwv_flow_imp.g_varchar2_table(1305) := 'items'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.n';
wwv_flow_imp.g_varchar2_table(1306) := 'extval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesc';
wwv_flow_imp.g_varchar2_table(1307) := 'e( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(1308) := ' ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys';
wwv_flow_imp.g_varchar2_table(1309) := '_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_';
wwv_flow_imp.g_varchar2_table(1310) := 'version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys';
wwv_flow_imp.g_varchar2_table(1311) := '_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context(';
wwv_flow_imp.g_varchar2_table(1312) := ' ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(1313) := '-  DDL for Trigger BLOG_LINKS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR';
wwv_flow_imp.g_varchar2_table(1314) := ' REPLACE EDITIONABLE TRIGGER "BLOG_LINKS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_links'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'beg';
wwv_flow_imp.g_varchar2_table(1315) := 'in'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row';
wwv_flow_imp.g_varchar2_table(1316) := '_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, lo';
wwv_flow_imp.g_varchar2_table(1317) := 'caltimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$S';
wwv_flow_imp.g_varchar2_table(1318) := 'ESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''';
wwv_flow_imp.g_varchar2_table(1319) := 'SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;';
wwv_flow_imp.g_varchar2_table(1320) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSIO';
wwv_flow_imp.g_varchar2_table(1321) := 'N'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_U';
wwv_flow_imp.g_varchar2_table(1322) := 'SER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLO';
wwv_flow_imp.g_varchar2_table(1323) := 'G_LINK_GROUPS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITION';
wwv_flow_imp.g_varchar2_table(1324) := 'ABLE TRIGGER "BLOG_LINK_GROUPS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_link_groups'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1325) := '  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_ver';
wwv_flow_imp.g_varchar2_table(1326) := 'sion  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localt';
wwv_flow_imp.g_varchar2_table(1327) := 'imestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSI';
wwv_flow_imp.g_varchar2_table(1328) := 'ON'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESS';
wwv_flow_imp.g_varchar2_table(1329) := 'ION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1330) := ':new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ';
wwv_flow_imp.g_varchar2_table(1331) := '''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER''';
wwv_flow_imp.g_varchar2_table(1332) := ' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_LI';
wwv_flow_imp.g_varchar2_table(1333) := 'ST_OF_VALUES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONA';
wwv_flow_imp.g_varchar2_table(1334) := 'BLE TRIGGER "BLOG_LIST_OF_VALUES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_list_of_values'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'be';
wwv_flow_imp.g_varchar2_table(1335) := 'gin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.ro';
wwv_flow_imp.g_varchar2_table(1336) := 'w_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, l';
wwv_flow_imp.g_varchar2_table(1337) := 'ocaltimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$';
wwv_flow_imp.g_varchar2_table(1338) := 'SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ';
wwv_flow_imp.g_varchar2_table(1339) := '''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if';
wwv_flow_imp.g_varchar2_table(1340) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSI';
wwv_flow_imp.g_varchar2_table(1341) := 'ON'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_';
wwv_flow_imp.g_varchar2_table(1342) := 'USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BL';
wwv_flow_imp.g_varchar2_table(1343) := 'OG_POSTS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE ';
wwv_flow_imp.g_varchar2_table(1344) := 'TRIGGER "BLOG_POSTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_posts'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting th';
wwv_flow_imp.g_varchar2_table(1345) := 'en'||wwv_flow.LF||
'    :new.id           := coalesce('||wwv_flow.LF||
'        :new.id'||wwv_flow.LF||
'      , to_number( to_char( sys_extract_utc( l';
wwv_flow_imp.g_varchar2_table(1346) := 'ocaltimestamp ), ''YYYYMMDDHH24MISSFF6'' ) )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_versio';
wwv_flow_imp.g_varchar2_table(1347) := 'n, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   ';
wwv_flow_imp.g_varchar2_table(1348) := ':= coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_conte';
wwv_flow_imp.g_varchar2_table(1349) := 'xt( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updatin';
wwv_flow_imp.g_varchar2_table(1350) := 'g then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;';
wwv_flow_imp.g_varchar2_table(1351) := ''||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''US';
wwv_flow_imp.g_varchar2_table(1352) := 'ERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- tickle text index'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1353) := ':new.ctx_search   := ''X'';'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL f';
wwv_flow_imp.g_varchar2_table(1354) := 'or Trigger BLOG_POST_TAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REP';
wwv_flow_imp.g_varchar2_table(1355) := 'LACE EDITIONABLE TRIGGER "BLOG_POST_TAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_post_tags'||wwv_flow.LF||
'for each row';
wwv_flow_imp.g_varchar2_table(1356) := ''||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new';
wwv_flow_imp.g_varchar2_table(1357) := '.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on';
wwv_flow_imp.g_varchar2_table(1358) := ', localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''AP';
wwv_flow_imp.g_varchar2_table(1359) := 'EX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV';
wwv_flow_imp.g_varchar2_table(1360) := ''', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end';
wwv_flow_imp.g_varchar2_table(1361) := ' if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SE';
wwv_flow_imp.g_varchar2_table(1362) := 'SSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSI';
wwv_flow_imp.g_varchar2_table(1363) := 'ON_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger';
wwv_flow_imp.g_varchar2_table(1364) := ' BLOG_POST_UDS_CATEGORIES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REP';
wwv_flow_imp.g_varchar2_table(1365) := 'LACE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"'||wwv_flow.LF||
'after'||wwv_flow.LF||
'update on blog_categories'||wwv_flow.LF||
'for each row';
wwv_flow_imp.g_varchar2_table(1366) := ''||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'-- if category is changed, update blog_posts table text index column'||wwv_flow.LF||
'  update blog_posts t1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1367) := '    set ctx_search = ctx_search'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and :new.title_unique != :old.title_unique'||wwv_flow.LF||
'    and';
wwv_flow_imp.g_varchar2_table(1368) := ' t1.category_id = :new.id'||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  D';
wwv_flow_imp.g_varchar2_table(1369) := 'DL for Trigger BLOG_POST_UDS_POST_TAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1370) := 'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POST_TAGS_TRG"'||wwv_flow.LF||
'for'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update or'||wwv_flow.LF||
'delete o';
wwv_flow_imp.g_varchar2_table(1371) := 'n blog_post_tags'||wwv_flow.LF||
'compound trigger'||wwv_flow.LF||
''||wwv_flow.LF||
'  t_post_id apex_t_number;'||wwv_flow.LF||
''||wwv_flow.LF||
'  after each row is'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- i';
wwv_flow_imp.g_varchar2_table(1372) := 'f tag is removed from post, save post id for after statement handling'||wwv_flow.LF||
'    if deleting'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1373) := '  apex_string.push( t_post_id, :old.post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if updating or inserting post tag, ';
wwv_flow_imp.g_varchar2_table(1374) := 'update blog_posts table text index column'||wwv_flow.LF||
'      update blog_posts t1'||wwv_flow.LF||
'        set ctx_search = ctx_se';
wwv_flow_imp.g_varchar2_table(1375) := 'arch'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and t1.id = :new.post_id'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end after each row;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1376) := ''||wwv_flow.LF||
'  after statement is'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- handle removed tags and update blog_posts table text index col';
wwv_flow_imp.g_varchar2_table(1377) := 'umn'||wwv_flow.LF||
'    update blog_posts t1'||wwv_flow.LF||
'      set ctx_search = ctx_search'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1378) := '     select 1'||wwv_flow.LF||
'        from table( t_post_id ) x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.column_value =';
wwv_flow_imp.g_varchar2_table(1379) := ' t1.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end after statement;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1380) := '---------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_POST_UDS_TAGS_TRG'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1381) := '---------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"'||wwv_flow.LF||
'after'||wwv_flow.LF||
'update on blog_tags'||wwv_flow.LF||
'f';
wwv_flow_imp.g_varchar2_table(1382) := 'or each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if :new.tag_unique != :old.tag_unique'||wwv_flow.LF||
'  or :new.is_active != :old.is_active'||wwv_flow.LF||
'  t';
wwv_flow_imp.g_varchar2_table(1383) := 'hen'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- if tag is changed, update blog_posts table text index column'||wwv_flow.LF||
'    update blog_posts t1'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1384) := '  set ctx_search = ctx_search'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_post_ta';
wwv_flow_imp.g_varchar2_table(1385) := 'gs x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and x1.post_id = t1.id'||wwv_flow.LF||
'        and x1.tag_id  = :new.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1386) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BL';
wwv_flow_imp.g_varchar2_table(1387) := 'OG_SETTINGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONAB';
wwv_flow_imp.g_varchar2_table(1388) := 'LE TRIGGER "BLOG_SETTINGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_settings'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if ins';
wwv_flow_imp.g_varchar2_table(1389) := 'erting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  :=';
wwv_flow_imp.g_varchar2_table(1390) := ' coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp';
wwv_flow_imp.g_varchar2_table(1391) := ' );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''AP';
wwv_flow_imp.g_varchar2_table(1392) := 'P_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER';
wwv_flow_imp.g_varchar2_table(1393) := ''' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.cha';
wwv_flow_imp.g_varchar2_table(1394) := 'nged_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USE';
wwv_flow_imp.g_varchar2_table(1395) := 'R'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1396) := ''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_SUBSCRIBER';
wwv_flow_imp.g_varchar2_table(1397) := 'S_EMAIL_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE T';
wwv_flow_imp.g_varchar2_table(1398) := 'RIGGER "BLOG_SUBSCRIBERS_EMAIL_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_subscribers_email'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'b';
wwv_flow_imp.g_varchar2_table(1399) := 'egin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.r';
wwv_flow_imp.g_varchar2_table(1400) := 'ow_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, ';
wwv_flow_imp.g_varchar2_table(1401) := 'localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX';
wwv_flow_imp.g_varchar2_table(1402) := '$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'',';
wwv_flow_imp.g_varchar2_table(1403) := ' ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end i';
wwv_flow_imp.g_varchar2_table(1404) := 'f;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESS';
wwv_flow_imp.g_varchar2_table(1405) := 'ION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION';
wwv_flow_imp.g_varchar2_table(1406) := '_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger B';
wwv_flow_imp.g_varchar2_table(1407) := 'LOG_TAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE ';
wwv_flow_imp.g_varchar2_table(1408) := 'TRIGGER "BLOG_TAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_tags'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then';
wwv_flow_imp.g_varchar2_table(1409) := ''||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( ';
wwv_flow_imp.g_varchar2_table(1410) := ':new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :ne';
wwv_flow_imp.g_varchar2_table(1411) := 'w.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1412) := '     ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1413) := '  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := ';
wwv_flow_imp.g_varchar2_table(1414) := 'localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,s';
wwv_flow_imp.g_varchar2_table(1415) := 'ys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(1416) := '-----------------------------------------------------'||wwv_flow.LF||
'--  Create text index preferences for index BL';
wwv_flow_imp.g_varchar2_table(1417) := 'OG_COMMENTS_CTX'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.create_pre';
wwv_flow_imp.g_varchar2_table(1418) := 'ference('||wwv_flow.LF||
'     preference_name  => ''BLOG_COMMENTS_UDS'''||wwv_flow.LF||
'    ,object_name      => ''USER_DATASTORE'''||wwv_flow.LF||
'  );';
wwv_flow_imp.g_varchar2_table(1419) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    preference_name   => ''BLOG_COMMENTS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''OU';
wwv_flow_imp.g_varchar2_table(1420) := 'TPUT_TYPE'''||wwv_flow.LF||
'    ,attribute_value  => ''CLOB'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    preference_name   => ''';
wwv_flow_imp.g_varchar2_table(1421) := 'BLOG_COMMENTS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''PROCEDURE'''||wwv_flow.LF||
'    ,attribute_value  =>'||wwv_flow.LF||
'      apex_string.f';
wwv_flow_imp.g_varchar2_table(1422) := 'ormat('||wwv_flow.LF||
'        p_message => ''%s.BLOG_CTX.GENERATE_COMMENT_DATASTORE'''||wwv_flow.LF||
'        ,p0 => sys_context( ''US';
wwv_flow_imp.g_varchar2_table(1423) := 'ERENV'', ''CURRENT_SCHEMA'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1424) := '----'||wwv_flow.LF||
'--  Create text index BLOG_COMMENTS_CTX'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1425) := '-'||wwv_flow.LF||
'create index blog_comments_ctx on blog_comments( ctx_search )'||wwv_flow.LF||
'indextype is ctxsys.context paramete';
wwv_flow_imp.g_varchar2_table(1426) := 'rs('||wwv_flow.LF||
'  ''datastore      blog_comments_uds'||wwv_flow.LF||
'   lexer          ctxsys.default_lexer'||wwv_flow.LF||
'   section group  ctx';
wwv_flow_imp.g_varchar2_table(1427) := 'sys.auto_section_group'||wwv_flow.LF||
'   stoplist       ctxsys.empty_stoplist'||wwv_flow.LF||
'   filter         ctxsys.null_filter'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1428) := '   sync           (on commit)'''||wwv_flow.LF||
');'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  Creat';
wwv_flow_imp.g_varchar2_table(1429) := 'e text index preferences for index BLOG_POSTS_CTX'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1430) := '------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.create_preference('||wwv_flow.LF||
'     preference_name  => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'    ,object_nam';
wwv_flow_imp.g_varchar2_table(1431) := 'e      => ''USER_DATASTORE'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute('||wwv_flow.LF||
'    preference_name   => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1432) := '    ,attribute_name   => ''OUTPUT_TYPE'''||wwv_flow.LF||
'    ,attribute_value  => ''CLOB'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ctx_ddl.set_attribute';
wwv_flow_imp.g_varchar2_table(1433) := '('||wwv_flow.LF||
'    preference_name   => ''BLOG_POSTS_UDS'''||wwv_flow.LF||
'    ,attribute_name   => ''PROCEDURE'''||wwv_flow.LF||
'    ,attribute_valu';
wwv_flow_imp.g_varchar2_table(1434) := 'e  =>'||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''%s.BLOG_CTX.GENERATE_POST_DATASTORE'''||wwv_flow.LF||
'        ,';
wwv_flow_imp.g_varchar2_table(1435) := 'p0 => sys_context( ''USERENV'', ''CURRENT_SCHEMA'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(1436) := '--------------------------'||wwv_flow.LF||
'--  Create text index BLOG_POSTS_CTX'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(1437) := '--------------------'||wwv_flow.LF||
'create index blog_posts_ctx on blog_posts( ctx_search )'||wwv_flow.LF||
'indextype is ctxsys.con';
wwv_flow_imp.g_varchar2_table(1438) := 'text parameters('||wwv_flow.LF||
'  ''datastore      blog_posts_uds'||wwv_flow.LF||
'   lexer          ctxsys.default_lexer'||wwv_flow.LF||
'   section ';
wwv_flow_imp.g_varchar2_table(1439) := 'group  ctxsys.auto_section_group'||wwv_flow.LF||
'   stoplist       ctxsys.empty_stoplist'||wwv_flow.LF||
'   filter         ctxsys.nu';
wwv_flow_imp.g_varchar2_table(1440) := 'll_filter'||wwv_flow.LF||
'   sync           (on commit)'''||wwv_flow.LF||
');'||wwv_flow.LF||
'create or replace package body "BLOG_CTX"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(1441) := '---------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(1442) := '--------------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(1443) := '------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(1444) := '-----------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1445) := '------------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1446) := '-----------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1447) := '----------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1448) := '---------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1449) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global proc';
wwv_flow_imp.g_varchar2_table(1450) := 'edures and functions'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1451) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure gener';
wwv_flow_imp.g_varchar2_table(1452) := 'ate_post_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1453) := '    ctx_datastore'||wwv_flow.LF||
'    into tlob'||wwv_flow.LF||
'    from blog_v_all_posts v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.ctx_rid = ';
wwv_flow_imp.g_varchar2_table(1454) := 'rid'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end generate_post_datastore;'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1455) := '----------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1456) := '---'||wwv_flow.LF||
'  procedure generate_comment_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  a';
wwv_flow_imp.g_varchar2_table(1457) := 's'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      ctx_datastore'||wwv_flow.LF||
'    into tlob'||wwv_flow.LF||
'    from blog_v_all_comments v1'||wwv_flow.LF||
'    where 1 ';
wwv_flow_imp.g_varchar2_table(1458) := '= 1'||wwv_flow.LF||
'      and v1.ctx_rid = rid'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end generate_comment_datastore;'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(1459) := '----------------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1460) := '---------------------------------'||wwv_flow.LF||
'end "BLOG_CTX";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_INSTALL"'||wwv_flow.LF||
'as';
wwv_flow_imp.g_varchar2_table(1461) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(1462) := '--------------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(1463) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(1464) := '-----------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(1465) := '------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1466) := '-----------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(1467) := '----------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1468) := '---------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1469) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(1470) := ' Global functions and procedures'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1471) := '-------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  pro';
wwv_flow_imp.g_varchar2_table(1472) := 'cedure settings_merge('||wwv_flow.LF||
'    p_attribute_name          in varchar2,'||wwv_flow.LF||
'    p_display_seq             in n';
wwv_flow_imp.g_varchar2_table(1473) := 'umber,'||wwv_flow.LF||
'    p_is_nullable             in number,'||wwv_flow.LF||
'    p_data_type               in varchar2,'||wwv_flow.LF||
'    p_att';
wwv_flow_imp.g_varchar2_table(1474) := 'ribute_group_message in varchar2,'||wwv_flow.LF||
'    p_int_min                 in number   default null,'||wwv_flow.LF||
'    p_int_';
wwv_flow_imp.g_varchar2_table(1475) := 'max                 in number   default null,'||wwv_flow.LF||
'    p_build_option_name       in varchar2 default null';
wwv_flow_imp.g_varchar2_table(1476) := ','||wwv_flow.LF||
'    p_build_option_status     in varchar2 default null,'||wwv_flow.LF||
'    p_attribute_value         in varchar2 ';
wwv_flow_imp.g_varchar2_table(1477) := 'default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    merge into blog_settings'||wwv_flow.LF||
'    using dual'||wwv_flow.LF||
'    on( attribute_name = ';
wwv_flow_imp.g_varchar2_table(1478) := 'p_attribute_name )'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      insert ( attribute_name, display_seq, is_nullable';
wwv_flow_imp.g_varchar2_table(1479) := ', data_type, attribute_group_message, int_min, int_max, build_option_name, build_option_status, attr';
wwv_flow_imp.g_varchar2_table(1480) := 'ibute_value )'||wwv_flow.LF||
'        values( p_attribute_name, p_display_seq, p_is_nullable, p_data_type, p_attribu';
wwv_flow_imp.g_varchar2_table(1481) := 'te_group_message, p_int_min, p_int_max, p_build_option_name, p_build_option_status, p_attribute_valu';
wwv_flow_imp.g_varchar2_table(1482) := 'e )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set'||wwv_flow.LF||
'        display_seq = p_display_seq'||wwv_flow.LF||
'      , is_nullable =';
wwv_flow_imp.g_varchar2_table(1483) := ' p_is_nullable'||wwv_flow.LF||
'      , data_type = p_data_type'||wwv_flow.LF||
'      , attribute_group_message = p_attribute_group_m';
wwv_flow_imp.g_varchar2_table(1484) := 'essage'||wwv_flow.LF||
'      , int_min = p_int_min'||wwv_flow.LF||
'      , int_max = p_int_max'||wwv_flow.LF||
'      , build_option_name = p_build_o';
wwv_flow_imp.g_varchar2_table(1485) := 'ption_name'||wwv_flow.LF||
'      , build_option_status = p_build_option_status'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end settings_merge;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(1486) := '------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(1487) := '-----------------------------------------------------'||wwv_flow.LF||
'  procedure features_merge('||wwv_flow.LF||
'    p_build_option';
wwv_flow_imp.g_varchar2_table(1488) := '_name       in varchar2,'||wwv_flow.LF||
'    p_is_active               in number,'||wwv_flow.LF||
'    p_display_seq             in n';
wwv_flow_imp.g_varchar2_table(1489) := 'umber,'||wwv_flow.LF||
'    p_build_option_group      in varchar2,'||wwv_flow.LF||
'    p_build_option_parent     in varchar2 default ';
wwv_flow_imp.g_varchar2_table(1490) := 'null,'||wwv_flow.LF||
'    p_ref_build_option_name   in varchar2 default null,'||wwv_flow.LF||
'    p_ref_build_option_status in varch';
wwv_flow_imp.g_varchar2_table(1491) := 'ar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    merge into blog_features'||wwv_flow.LF||
'    using dual'||wwv_flow.LF||
'    on( build_option_';
wwv_flow_imp.g_varchar2_table(1492) := 'name = p_build_option_name )'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      insert ( build_option_name, is_active, ';
wwv_flow_imp.g_varchar2_table(1493) := 'display_seq, build_option_group, build_option_parent, ref_build_option_name, ref_build_option_status';
wwv_flow_imp.g_varchar2_table(1494) := ' )'||wwv_flow.LF||
'        values( p_build_option_name, p_is_active, p_display_seq, p_build_option_group, p_build_op';
wwv_flow_imp.g_varchar2_table(1495) := 'tion_parent, p_ref_build_option_name, p_ref_build_option_status )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update';
wwv_flow_imp.g_varchar2_table(1496) := ' set'||wwv_flow.LF||
'        is_active = p_is_active'||wwv_flow.LF||
'      , display_seq = p_display_seq'||wwv_flow.LF||
'      , build_option_group ';
wwv_flow_imp.g_varchar2_table(1497) := '= p_build_option_group'||wwv_flow.LF||
'      , build_option_parent = p_build_option_parent'||wwv_flow.LF||
'      , ref_build_option_';
wwv_flow_imp.g_varchar2_table(1498) := 'name = p_ref_build_option_name'||wwv_flow.LF||
'      , ref_build_option_status = p_ref_build_option_status'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1499) := 'end features_merge;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1500) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure list_o';
null;
end;
/
begin
wwv_flow_imp.g_varchar2_table(1501) := 'f_values_ins('||wwv_flow.LF||
'    p_is_active       in number,'||wwv_flow.LF||
'    p_display_seq     in number,'||wwv_flow.LF||
'    p_lov_name      ';
wwv_flow_imp.g_varchar2_table(1502) := '  in varchar2,'||wwv_flow.LF||
'    p_return_value    in varchar2,'||wwv_flow.LF||
'    p_display_message in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin';
wwv_flow_imp.g_varchar2_table(1503) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    insert into blog_list_of_values( is_active, display_seq, lov_name, return_value, display_messa';
wwv_flow_imp.g_varchar2_table(1504) := 'ge )'||wwv_flow.LF||
'      values( p_is_active, p_display_seq, p_lov_name, p_return_value, p_display_message )'||wwv_flow.LF||
'    ;';
wwv_flow_imp.g_varchar2_table(1505) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  end list_of_values_ins;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1506) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(1507) := 'e init_items_ins'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    insert into blog_init_items(is_active, application_id, item_name)';
wwv_flow_imp.g_varchar2_table(1508) := ''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      1                 as is_active'||wwv_flow.LF||
'    , ai.application_id as application_id'||wwv_flow.LF||
'    , ai.';
wwv_flow_imp.g_varchar2_table(1509) := 'item_name      as item_name'||wwv_flow.LF||
'    from apex_application_items ai'||wwv_flow.LF||
'    join blog_settings s'||wwv_flow.LF||
'      on ai.';
wwv_flow_imp.g_varchar2_table(1510) := 'item_name = s.attribute_name'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select 1'||wwv_flow.LF||
'        from blog_se';
wwv_flow_imp.g_varchar2_table(1511) := 'ttings x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.attribute_name in( ''G_ADMIN_APP_ID'', ''G_PUB_APP_ID'' )';
wwv_flow_imp.g_varchar2_table(1512) := ''||wwv_flow.LF||
'          and to_number( x1.attribute_value ) = ai.application_id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    union all'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1513) := '      1                 as is_active'||wwv_flow.LF||
'    , pi.application_id as application_id'||wwv_flow.LF||
'    , pi.item_name   ';
wwv_flow_imp.g_varchar2_table(1514) := '   as item_name'||wwv_flow.LF||
'    from apex_application_page_items pi'||wwv_flow.LF||
'    join blog_settings s'||wwv_flow.LF||
'      on pi.item_na';
wwv_flow_imp.g_varchar2_table(1515) := 'me = s.attribute_name'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select 1'||wwv_flow.LF||
'        from blog_settings ';
wwv_flow_imp.g_varchar2_table(1516) := 'x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.attribute_name in( ''G_ADMIN_APP_ID'', ''G_PUB_APP_ID'' )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(1517) := '    and to_number( x1.attribute_value ) = pi.application_id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    order by 2, 3'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end i';
wwv_flow_imp.g_varchar2_table(1518) := 'nit_items_ins;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(1519) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_INSTALL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'c';
wwv_flow_imp.g_varchar2_table(1520) := 'reate or replace package body "BLOG_MIME"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1521) := '-------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1522) := '------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1523) := '----------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1524) := '---'||wwv_flow.LF||
'  type str_t is table of varchar2( 256 ) index by varchar2( 20 );'||wwv_flow.LF||
'  mime_t str_t;'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(1525) := '------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(1526) := '-----------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(1527) := '----------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(1528) := '---------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(1529) := '----------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1530) := '---------------'||wwv_flow.LF||
'-- Global procedures and functions'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1531) := '-------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1532) := '------------'||wwv_flow.LF||
'  function get_mime_type('||wwv_flow.LF||
'    p_file_name in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_mi';
wwv_flow_imp.g_varchar2_table(1533) := 'me_type	varchar2(2000);'||wwv_flow.LF||
'    l_extension varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_extension := lower( apex_stri';
wwv_flow_imp.g_varchar2_table(1534) := 'ng_util.get_file_extension( ''.'' || p_file_name ) );'||wwv_flow.LF||
'    l_mime_type := g_default_mime;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if mime_';
wwv_flow_imp.g_varchar2_table(1535) := 't.exists( l_extension )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_mime_type := lower( mime_t( l_extension ) );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1536) := '   return l_mime_type;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_mime_type;'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1537) := '-------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1538) := '------'||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1539) := '-------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'begin';
wwv_flow_imp.g_varchar2_table(1540) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  mime_t(''ez'') := ''application/andrew-inset'';'||wwv_flow.LF||
'  mime_t(''aw'') := ''application/applixware'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1541) := '(''atom'') := ''application/atom+xml'';'||wwv_flow.LF||
'  mime_t(''atomcat'') := ''application/atomcat+xml'';'||wwv_flow.LF||
'  mime_t(''atom';
wwv_flow_imp.g_varchar2_table(1542) := 'svc'') := ''application/atomsvc+xml'';'||wwv_flow.LF||
'  mime_t(''ccxml'') := ''application/ccxml+xml'';'||wwv_flow.LF||
'  mime_t(''cdmia'') ';
wwv_flow_imp.g_varchar2_table(1543) := ':= ''application/cdmi-capability'';'||wwv_flow.LF||
'  mime_t(''cdmic'') := ''application/cdmi-container'';'||wwv_flow.LF||
'  mime_t(''cdmid';
wwv_flow_imp.g_varchar2_table(1544) := ''') := ''application/cdmi-domain'';'||wwv_flow.LF||
'  mime_t(''cdmio'') := ''application/cdmi-object'';'||wwv_flow.LF||
'  mime_t(''cdmiq'') :';
wwv_flow_imp.g_varchar2_table(1545) := '= ''application/cdmi-queue'';'||wwv_flow.LF||
'  mime_t(''cu'') := ''application/cu-seeme'';'||wwv_flow.LF||
'  mime_t(''davmount'') := ''appli';
wwv_flow_imp.g_varchar2_table(1546) := 'cation/davmount+xml'';'||wwv_flow.LF||
'  mime_t(''dbk'') := ''application/docbook+xml'';'||wwv_flow.LF||
'  mime_t(''dssc'') := ''application';
wwv_flow_imp.g_varchar2_table(1547) := '/dssc+der'';'||wwv_flow.LF||
'  mime_t(''xdssc'') := ''application/dssc+xml'';'||wwv_flow.LF||
'  mime_t(''ecma'') := ''application/ecmascript';
wwv_flow_imp.g_varchar2_table(1548) := ''';'||wwv_flow.LF||
'  mime_t(''emma'') := ''application/emma+xml'';'||wwv_flow.LF||
'  mime_t(''epub'') := ''application/epub+zip'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1549) := '''exi'') := ''application/exi'';'||wwv_flow.LF||
'  mime_t(''pfr'') := ''application/font-tdpfr'';'||wwv_flow.LF||
'  mime_t(''gml'') := ''applic';
wwv_flow_imp.g_varchar2_table(1550) := 'ation/gml+xml'';'||wwv_flow.LF||
'  mime_t(''gpx'') := ''application/gpx+xml'';'||wwv_flow.LF||
'  mime_t(''gxf'') := ''application/gxf'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1551) := 'me_t(''stk'') := ''application/hyperstudio'';'||wwv_flow.LF||
'  mime_t(''ink'') := ''application/inkml+xml'';'||wwv_flow.LF||
'  mime_t(''inkm';
wwv_flow_imp.g_varchar2_table(1552) := 'l'') := ''application/inkml+xml'';'||wwv_flow.LF||
'  mime_t(''ipfix'') := ''application/ipfix'';'||wwv_flow.LF||
'  mime_t(''jar'') := ''applic';
wwv_flow_imp.g_varchar2_table(1553) := 'ation/java-archive'';'||wwv_flow.LF||
'  mime_t(''ser'') := ''application/java-serialized-object'';'||wwv_flow.LF||
'  mime_t(''class'') := ''';
wwv_flow_imp.g_varchar2_table(1554) := 'application/java-vm'';'||wwv_flow.LF||
'  mime_t(''json'') := ''application/json'';'||wwv_flow.LF||
'  mime_t(''jsonml'') := ''application/jso';
wwv_flow_imp.g_varchar2_table(1555) := 'nml+json'';'||wwv_flow.LF||
'  mime_t(''lostxml'') := ''application/lost+xml'';'||wwv_flow.LF||
'  mime_t(''hqx'') := ''application/mac-binhex';
wwv_flow_imp.g_varchar2_table(1556) := '40'';'||wwv_flow.LF||
'  mime_t(''cpt'') := ''application/mac-compactpro'';'||wwv_flow.LF||
'  mime_t(''mads'') := ''application/mads+xml'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1557) := 'mime_t(''mrc'') := ''application/marc'';'||wwv_flow.LF||
'  mime_t(''mrcx'') := ''application/marcxml+xml'';'||wwv_flow.LF||
'  mime_t(''ma'') :';
wwv_flow_imp.g_varchar2_table(1558) := '= ''application/mathematica'';'||wwv_flow.LF||
'  mime_t(''nb'') := ''application/mathematica'';'||wwv_flow.LF||
'  mime_t(''mb'') := ''applica';
wwv_flow_imp.g_varchar2_table(1559) := 'tion/mathematica'';'||wwv_flow.LF||
'  mime_t(''mathml'') := ''application/mathml+xml'';'||wwv_flow.LF||
'  mime_t(''mbox'') := ''application/';
wwv_flow_imp.g_varchar2_table(1560) := 'mbox'';'||wwv_flow.LF||
'  mime_t(''mscml'') := ''application/mediaservercontrol+xml'';'||wwv_flow.LF||
'  mime_t(''metalink'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1561) := 'on/metalink+xml'';'||wwv_flow.LF||
'  mime_t(''meta4'') := ''application/metalink4+xml'';'||wwv_flow.LF||
'  mime_t(''mets'') := ''application';
wwv_flow_imp.g_varchar2_table(1562) := '/mets+xml'';'||wwv_flow.LF||
'  mime_t(''mods'') := ''application/mods+xml'';'||wwv_flow.LF||
'  mime_t(''m21'') := ''application/mp21'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1563) := 'e_t(''mp21'') := ''application/mp21'';'||wwv_flow.LF||
'  mime_t(''mp4s'') := ''application/mp4'';'||wwv_flow.LF||
'  mime_t(''doc'') := ''applic';
wwv_flow_imp.g_varchar2_table(1564) := 'ation/msword'';'||wwv_flow.LF||
'  mime_t(''dot'') := ''application/msword'';'||wwv_flow.LF||
'  mime_t(''mxf'') := ''application/mxf'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1565) := '_t(''oda'') := ''application/oda'';'||wwv_flow.LF||
'  mime_t(''opf'') := ''application/oebps-package+xml'';'||wwv_flow.LF||
'  mime_t(''ogx'') ';
wwv_flow_imp.g_varchar2_table(1566) := ':= ''application/ogg'';'||wwv_flow.LF||
'  mime_t(''omdoc'') := ''application/omdoc+xml'';'||wwv_flow.LF||
'  mime_t(''onetoc'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1567) := 'on/onenote'';'||wwv_flow.LF||
'  mime_t(''onetoc2'') := ''application/onenote'';'||wwv_flow.LF||
'  mime_t(''onetmp'') := ''application/onenot';
wwv_flow_imp.g_varchar2_table(1568) := 'e'';'||wwv_flow.LF||
'  mime_t(''onepkg'') := ''application/onenote'';'||wwv_flow.LF||
'  mime_t(''oxps'') := ''application/oxps'';'||wwv_flow.LF||
'  mime_t(''x';
wwv_flow_imp.g_varchar2_table(1569) := 'er'') := ''application/patch-ops-error+xml'';'||wwv_flow.LF||
'  mime_t(''pdf'') := ''application/pdf'';'||wwv_flow.LF||
'  mime_t(''pgp'') := ';
wwv_flow_imp.g_varchar2_table(1570) := '''application/pgp-encrypted'';'||wwv_flow.LF||
'  mime_t(''asc'') := ''application/pgp-signature'';'||wwv_flow.LF||
'  mime_t(''sig'') := ''app';
wwv_flow_imp.g_varchar2_table(1571) := 'lication/pgp-signature'';'||wwv_flow.LF||
'  mime_t(''prf'') := ''application/pics-rules'';'||wwv_flow.LF||
'  mime_t(''p10'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1572) := 'n/pkcs10'';'||wwv_flow.LF||
'  mime_t(''p7m'') := ''application/pkcs7-mime'';'||wwv_flow.LF||
'  mime_t(''p7c'') := ''application/pkcs7-mime'';';
wwv_flow_imp.g_varchar2_table(1573) := ''||wwv_flow.LF||
'  mime_t(''p7s'') := ''application/pkcs7-signature'';'||wwv_flow.LF||
'  mime_t(''p8'') := ''application/pkcs8'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1574) := 'ac'') := ''application/pkix-attr-cert'';'||wwv_flow.LF||
'  mime_t(''cer'') := ''application/pkix-cert'';'||wwv_flow.LF||
'  mime_t(''crl'') :=';
wwv_flow_imp.g_varchar2_table(1575) := ' ''application/pkix-crl'';'||wwv_flow.LF||
'  mime_t(''pkipath'') := ''application/pkix-pkipath'';'||wwv_flow.LF||
'  mime_t(''pki'') := ''appl';
wwv_flow_imp.g_varchar2_table(1576) := 'ication/pkixcmp'';'||wwv_flow.LF||
'  mime_t(''pls'') := ''application/pls+xml'';'||wwv_flow.LF||
'  mime_t(''ai'') := ''application/postscrip';
wwv_flow_imp.g_varchar2_table(1577) := 't'';'||wwv_flow.LF||
'  mime_t(''eps'') := ''application/postscript'';'||wwv_flow.LF||
'  mime_t(''ps'') := ''application/postscript'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1578) := 't(''cww'') := ''application/prs.cww'';'||wwv_flow.LF||
'  mime_t(''pskcxml'') := ''application/pskc+xml'';'||wwv_flow.LF||
'  mime_t(''rdf'') :=';
wwv_flow_imp.g_varchar2_table(1579) := ' ''application/rdf+xml'';'||wwv_flow.LF||
'  mime_t(''rif'') := ''application/reginfo+xml'';'||wwv_flow.LF||
'  mime_t(''rnc'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1580) := 'n/relax-ng-compact-syntax'';'||wwv_flow.LF||
'  mime_t(''rl'') := ''application/resource-lists+xml'';'||wwv_flow.LF||
'  mime_t(''rld'') := ''';
wwv_flow_imp.g_varchar2_table(1581) := 'application/resource-lists-diff+xml'';'||wwv_flow.LF||
'  mime_t(''rs'') := ''application/rls-services+xml'';'||wwv_flow.LF||
'  mime_t(''gb';
wwv_flow_imp.g_varchar2_table(1582) := 'r'') := ''application/rpki-ghostbusters'';'||wwv_flow.LF||
'  mime_t(''mft'') := ''application/rpki-manifest'';'||wwv_flow.LF||
'  mime_t(''ro';
wwv_flow_imp.g_varchar2_table(1583) := 'a'') := ''application/rpki-roa'';'||wwv_flow.LF||
'  mime_t(''rsd'') := ''application/rsd+xml'';'||wwv_flow.LF||
'  mime_t(''rss'') := ''applica';
wwv_flow_imp.g_varchar2_table(1584) := 'tion/rss+xml'';'||wwv_flow.LF||
'  mime_t(''rtf'') := ''application/rtf'';'||wwv_flow.LF||
'  mime_t(''sbml'') := ''application/sbml+xml'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1585) := 'ime_t(''scq'') := ''application/scvp-cv-request'';'||wwv_flow.LF||
'  mime_t(''scs'') := ''application/scvp-cv-response'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1586) := 'mime_t(''spq'') := ''application/scvp-vp-request'';'||wwv_flow.LF||
'  mime_t(''spp'') := ''application/scvp-vp-response'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1587) := ' mime_t(''sdp'') := ''application/sdp'';'||wwv_flow.LF||
'  mime_t(''setpay'') := ''application/set-payment-initiation'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1588) := 'ime_t(''setreg'') := ''application/set-registration-initiation'';'||wwv_flow.LF||
'  mime_t(''shf'') := ''application/shf+xm';
wwv_flow_imp.g_varchar2_table(1589) := 'l'';'||wwv_flow.LF||
'  mime_t(''smi'') := ''application/smil+xml'';'||wwv_flow.LF||
'  mime_t(''smil'') := ''application/smil+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1590) := '''rq'') := ''application/sparql-query'';'||wwv_flow.LF||
'  mime_t(''srx'') := ''application/sparql-results+xml'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1591) := 'gram'') := ''application/srgs'';'||wwv_flow.LF||
'  mime_t(''grxml'') := ''application/srgs+xml'';'||wwv_flow.LF||
'  mime_t(''sru'') := ''appli';
wwv_flow_imp.g_varchar2_table(1592) := 'cation/sru+xml'';'||wwv_flow.LF||
'  mime_t(''ssdl'') := ''application/ssdl+xml'';'||wwv_flow.LF||
'  mime_t(''ssml'') := ''application/ssml+x';
wwv_flow_imp.g_varchar2_table(1593) := 'ml'';'||wwv_flow.LF||
'  mime_t(''tei'') := ''application/tei+xml'';'||wwv_flow.LF||
'  mime_t(''teicorpus'') := ''application/tei+xml'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1594) := 'e_t(''tfi'') := ''application/thraud+xml'';'||wwv_flow.LF||
'  mime_t(''tsd'') := ''application/timestamped-data'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1595) := '''plb'') := ''application/vnd.3gpp.pic-bw-large'';'||wwv_flow.LF||
'  mime_t(''psb'') := ''application/vnd.3gpp.pic-bw-small';
wwv_flow_imp.g_varchar2_table(1596) := ''';'||wwv_flow.LF||
'  mime_t(''pvb'') := ''application/vnd.3gpp.pic-bw-var'';'||wwv_flow.LF||
'  mime_t(''tcap'') := ''application/vnd.3gpp2.';
wwv_flow_imp.g_varchar2_table(1597) := 'tcap'';'||wwv_flow.LF||
'  mime_t(''pwn'') := ''application/vnd.3m.post-it-notes'';'||wwv_flow.LF||
'  mime_t(''aso'') := ''application/vnd.ac';
wwv_flow_imp.g_varchar2_table(1598) := 'cpac.simply.aso'';'||wwv_flow.LF||
'  mime_t(''imp'') := ''application/vnd.accpac.simply.imp'';'||wwv_flow.LF||
'  mime_t(''acu'') := ''applic';
wwv_flow_imp.g_varchar2_table(1599) := 'ation/vnd.acucobol'';'||wwv_flow.LF||
'  mime_t(''atc'') := ''application/vnd.acucorp'';'||wwv_flow.LF||
'  mime_t(''acutc'') := ''application';
wwv_flow_imp.g_varchar2_table(1600) := '/vnd.acucorp'';'||wwv_flow.LF||
'  mime_t(''air'') := ''application/vnd.adobe.air-application-installer-package+zip'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1601) := 'ime_t(''fcdt'') := ''application/vnd.adobe.formscentral.fcdt'';'||wwv_flow.LF||
'  mime_t(''fxp'') := ''application/vnd.adob';
wwv_flow_imp.g_varchar2_table(1602) := 'e.fxp'';'||wwv_flow.LF||
'  mime_t(''fxpl'') := ''application/vnd.adobe.fxp'';'||wwv_flow.LF||
'  mime_t(''xdp'') := ''application/vnd.adobe.x';
wwv_flow_imp.g_varchar2_table(1603) := 'dp+xml'';'||wwv_flow.LF||
'  mime_t(''xfdf'') := ''application/vnd.adobe.xfdf'';'||wwv_flow.LF||
'  mime_t(''ahead'') := ''application/vnd.ahe';
wwv_flow_imp.g_varchar2_table(1604) := 'ad.space'';'||wwv_flow.LF||
'  mime_t(''azf'') := ''application/vnd.airzip.filesecure.azf'';'||wwv_flow.LF||
'  mime_t(''azs'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1605) := 'on/vnd.airzip.filesecure.azs'';'||wwv_flow.LF||
'  mime_t(''azw'') := ''application/vnd.amazon.ebook'';'||wwv_flow.LF||
'  mime_t(''acc'') :=';
wwv_flow_imp.g_varchar2_table(1606) := ' ''application/vnd.americandynamics.acc'';'||wwv_flow.LF||
'  mime_t(''ami'') := ''application/vnd.amiga.ami'';'||wwv_flow.LF||
'  mime_t(''a';
wwv_flow_imp.g_varchar2_table(1607) := 'pk'') := ''application/vnd.android.package-archive'';'||wwv_flow.LF||
'  mime_t(''cii'') := ''application/vnd.anser-web-cer';
wwv_flow_imp.g_varchar2_table(1608) := 'tificate-issue-initiation'';'||wwv_flow.LF||
'  mime_t(''fti'') := ''application/vnd.anser-web-funds-transfer-initiation''';
wwv_flow_imp.g_varchar2_table(1609) := ';'||wwv_flow.LF||
'  mime_t(''atx'') := ''application/vnd.antix.game-component'';'||wwv_flow.LF||
'  mime_t(''mpkg'') := ''application/vnd.ap';
wwv_flow_imp.g_varchar2_table(1610) := 'ple.installer+xml'';'||wwv_flow.LF||
'  mime_t(''m3u8'') := ''application/vnd.apple.mpegurl'';'||wwv_flow.LF||
'  mime_t(''swi'') := ''applica';
wwv_flow_imp.g_varchar2_table(1611) := 'tion/vnd.aristanetworks.swi'';'||wwv_flow.LF||
'  mime_t(''iota'') := ''application/vnd.astraea-software.iota'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1612) := '''aep'') := ''application/vnd.audiograph'';'||wwv_flow.LF||
'  mime_t(''mpm'') := ''application/vnd.blueice.multipass'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1613) := 'me_t(''bmi'') := ''application/vnd.bmi'';'||wwv_flow.LF||
'  mime_t(''rep'') := ''application/vnd.businessobjects'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1614) := '(''cdxml'') := ''application/vnd.chemdraw+xml'';'||wwv_flow.LF||
'  mime_t(''mmd'') := ''application/vnd.chipnuts.karaoke-mm';
wwv_flow_imp.g_varchar2_table(1615) := 'd'';'||wwv_flow.LF||
'  mime_t(''cdy'') := ''application/vnd.cinderella'';'||wwv_flow.LF||
'  mime_t(''cla'') := ''application/vnd.claymore'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1616) := '  mime_t(''rp9'') := ''application/vnd.cloanto.rp9'';'||wwv_flow.LF||
'  mime_t(''c4g'') := ''application/vnd.clonk.c4group''';
wwv_flow_imp.g_varchar2_table(1617) := ';'||wwv_flow.LF||
'  mime_t(''c4d'') := ''application/vnd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4f'') := ''application/vnd.clonk.c4gr';
wwv_flow_imp.g_varchar2_table(1618) := 'oup'';'||wwv_flow.LF||
'  mime_t(''c4p'') := ''application/vnd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4u'') := ''application/vnd.clonk.';
wwv_flow_imp.g_varchar2_table(1619) := 'c4group'';'||wwv_flow.LF||
'  mime_t(''c11amc'') := ''application/vnd.cluetrust.cartomobile-config'';'||wwv_flow.LF||
'  mime_t(''c11amz'') :';
wwv_flow_imp.g_varchar2_table(1620) := '= ''application/vnd.cluetrust.cartomobile-config-pkg'';'||wwv_flow.LF||
'  mime_t(''csp'') := ''application/vnd.commonspac';
wwv_flow_imp.g_varchar2_table(1621) := 'e'';'||wwv_flow.LF||
'  mime_t(''cdbcmsg'') := ''application/vnd.contact.cmsg'';'||wwv_flow.LF||
'  mime_t(''cmc'') := ''application/vnd.cosmo';
wwv_flow_imp.g_varchar2_table(1622) := 'caller'';'||wwv_flow.LF||
'  mime_t(''clkx'') := ''application/vnd.crick.clicker'';'||wwv_flow.LF||
'  mime_t(''clkk'') := ''application/vnd.c';
wwv_flow_imp.g_varchar2_table(1623) := 'rick.clicker.keyboard'';'||wwv_flow.LF||
'  mime_t(''clkp'') := ''application/vnd.crick.clicker.palette'';'||wwv_flow.LF||
'  mime_t(''clkt''';
wwv_flow_imp.g_varchar2_table(1624) := ') := ''application/vnd.crick.clicker.template'';'||wwv_flow.LF||
'  mime_t(''clkw'') := ''application/vnd.crick.clicker.wo';
wwv_flow_imp.g_varchar2_table(1625) := 'rdbank'';'||wwv_flow.LF||
'  mime_t(''wbs'') := ''application/vnd.criticaltools.wbs+xml'';'||wwv_flow.LF||
'  mime_t(''pml'') := ''application';
wwv_flow_imp.g_varchar2_table(1626) := '/vnd.ctc-posml'';'||wwv_flow.LF||
'  mime_t(''ppd'') := ''application/vnd.cups-ppd'';'||wwv_flow.LF||
'  mime_t(''car'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1627) := 'curl.car'';'||wwv_flow.LF||
'  mime_t(''pcurl'') := ''application/vnd.curl.pcurl'';'||wwv_flow.LF||
'  mime_t(''dart'') := ''application/vnd.d';
wwv_flow_imp.g_varchar2_table(1628) := 'art'';'||wwv_flow.LF||
'  mime_t(''rdz'') := ''application/vnd.data-vision.rdz'';'||wwv_flow.LF||
'  mime_t(''uvf'') := ''application/vnd.dece';
wwv_flow_imp.g_varchar2_table(1629) := '.data'';'||wwv_flow.LF||
'  mime_t(''uvvf'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''uvd'') := ''application/vnd.dece.da';
wwv_flow_imp.g_varchar2_table(1630) := 'ta'';'||wwv_flow.LF||
'  mime_t(''uvvd'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''uvt'') := ''application/vnd.dece.ttml+';
wwv_flow_imp.g_varchar2_table(1631) := 'xml'';'||wwv_flow.LF||
'  mime_t(''uvvt'') := ''application/vnd.dece.ttml+xml'';'||wwv_flow.LF||
'  mime_t(''uvx'') := ''application/vnd.dece.';
wwv_flow_imp.g_varchar2_table(1632) := 'unspecified'';'||wwv_flow.LF||
'  mime_t(''uvvx'') := ''application/vnd.dece.unspecified'';'||wwv_flow.LF||
'  mime_t(''uvz'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1633) := 'n/vnd.dece.zip'';'||wwv_flow.LF||
'  mime_t(''uvvz'') := ''application/vnd.dece.zip'';'||wwv_flow.LF||
'  mime_t(''fe_launch'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1634) := 'on/vnd.denovo.fcselayout-link'';'||wwv_flow.LF||
'  mime_t(''dna'') := ''application/vnd.dna'';'||wwv_flow.LF||
'  mime_t(''mlp'') := ''applic';
wwv_flow_imp.g_varchar2_table(1635) := 'ation/vnd.dolby.mlp'';'||wwv_flow.LF||
'  mime_t(''dpg'') := ''application/vnd.dpgraph'';'||wwv_flow.LF||
'  mime_t(''dfac'') := ''application';
wwv_flow_imp.g_varchar2_table(1636) := '/vnd.dreamfactory'';'||wwv_flow.LF||
'  mime_t(''kpxx'') := ''application/vnd.ds-keypoint'';'||wwv_flow.LF||
'  mime_t(''ait'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1637) := 'on/vnd.dvb.ait'';'||wwv_flow.LF||
'  mime_t(''svc'') := ''application/vnd.dvb.service'';'||wwv_flow.LF||
'  mime_t(''geo'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1638) := 'nd.dynageo'';'||wwv_flow.LF||
'  mime_t(''mag'') := ''application/vnd.ecowin.chart'';'||wwv_flow.LF||
'  mime_t(''nml'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1639) := 'enliven'';'||wwv_flow.LF||
'  mime_t(''esf'') := ''application/vnd.epson.esf'';'||wwv_flow.LF||
'  mime_t(''msf'') := ''application/vnd.epson.';
wwv_flow_imp.g_varchar2_table(1640) := 'msf'';'||wwv_flow.LF||
'  mime_t(''qam'') := ''application/vnd.epson.quickanime'';'||wwv_flow.LF||
'  mime_t(''slt'') := ''application/vnd.eps';
wwv_flow_imp.g_varchar2_table(1641) := 'on.salt'';'||wwv_flow.LF||
'  mime_t(''ssf'') := ''application/vnd.epson.ssf'';'||wwv_flow.LF||
'  mime_t(''es3'') := ''application/vnd.eszign';
wwv_flow_imp.g_varchar2_table(1642) := 'o3+xml'';'||wwv_flow.LF||
'  mime_t(''et3'') := ''application/vnd.eszigno3+xml'';'||wwv_flow.LF||
'  mime_t(''ez2'') := ''application/vnd.ezpi';
wwv_flow_imp.g_varchar2_table(1643) := 'x-album'';'||wwv_flow.LF||
'  mime_t(''ez3'') := ''application/vnd.ezpix-package'';'||wwv_flow.LF||
'  mime_t(''fdf'') := ''application/vnd.fd';
wwv_flow_imp.g_varchar2_table(1644) := 'f'';'||wwv_flow.LF||
'  mime_t(''mseed'') := ''application/vnd.fdsn.mseed'';'||wwv_flow.LF||
'  mime_t(''seed'') := ''application/vnd.fdsn.see';
wwv_flow_imp.g_varchar2_table(1645) := 'd'';'||wwv_flow.LF||
'  mime_t(''dataless'') := ''application/vnd.fdsn.seed'';'||wwv_flow.LF||
'  mime_t(''gph'') := ''application/vnd.flograp';
wwv_flow_imp.g_varchar2_table(1646) := 'hit'';'||wwv_flow.LF||
'  mime_t(''ftc'') := ''application/vnd.fluxtime.clip'';'||wwv_flow.LF||
'  mime_t(''fm'') := ''application/vnd.framema';
wwv_flow_imp.g_varchar2_table(1647) := 'ker'';'||wwv_flow.LF||
'  mime_t(''frame'') := ''application/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''maker'') := ''application/vnd.frame';
wwv_flow_imp.g_varchar2_table(1648) := 'maker'';'||wwv_flow.LF||
'  mime_t(''book'') := ''application/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''fnc'') := ''application/vnd.frogan';
wwv_flow_imp.g_varchar2_table(1649) := 's.fnc'';'||wwv_flow.LF||
'  mime_t(''ltf'') := ''application/vnd.frogans.ltf'';'||wwv_flow.LF||
'  mime_t(''fsc'') := ''application/vnd.fsc.we';
wwv_flow_imp.g_varchar2_table(1650) := 'blaunch'';'||wwv_flow.LF||
'  mime_t(''oas'') := ''application/vnd.fujitsu.oasys'';'||wwv_flow.LF||
'  mime_t(''oa2'') := ''application/vnd.fu';
wwv_flow_imp.g_varchar2_table(1651) := 'jitsu.oasys2'';'||wwv_flow.LF||
'  mime_t(''oa3'') := ''application/vnd.fujitsu.oasys3'';'||wwv_flow.LF||
'  mime_t(''fg5'') := ''application/';
wwv_flow_imp.g_varchar2_table(1652) := 'vnd.fujitsu.oasysgp'';'||wwv_flow.LF||
'  mime_t(''bh2'') := ''application/vnd.fujitsu.oasysprs'';'||wwv_flow.LF||
'  mime_t(''ddd'') := ''app';
wwv_flow_imp.g_varchar2_table(1653) := 'lication/vnd.fujixerox.ddd'';'||wwv_flow.LF||
'  mime_t(''xdw'') := ''application/vnd.fujixerox.docuworks'';'||wwv_flow.LF||
'  mime_t(''xbd';
wwv_flow_imp.g_varchar2_table(1654) := ''') := ''application/vnd.fujixerox.docuworks.binder'';'||wwv_flow.LF||
'  mime_t(''fzs'') := ''application/vnd.fuzzysheet'';';
wwv_flow_imp.g_varchar2_table(1655) := ''||wwv_flow.LF||
'  mime_t(''txd'') := ''application/vnd.genomatix.tuxedo'';'||wwv_flow.LF||
'  mime_t(''ggb'') := ''application/vnd.geogebra';
wwv_flow_imp.g_varchar2_table(1656) := '.file'';'||wwv_flow.LF||
'  mime_t(''ggs'') := ''application/vnd.geogebra.slides'';'||wwv_flow.LF||
'  mime_t(''ggt'') := ''application/vnd.ge';
wwv_flow_imp.g_varchar2_table(1657) := 'ogebra.tool'';'||wwv_flow.LF||
'  mime_t(''gex'') := ''application/vnd.geometry-explorer'';'||wwv_flow.LF||
'  mime_t(''gre'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1658) := 'n/vnd.geometry-explorer'';'||wwv_flow.LF||
'  mime_t(''gxt'') := ''application/vnd.geonext'';'||wwv_flow.LF||
'  mime_t(''g2w'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1659) := 'ion/vnd.geoplan'';'||wwv_flow.LF||
'  mime_t(''g3w'') := ''application/vnd.geospace'';'||wwv_flow.LF||
'  mime_t(''gmx'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1660) := '.gmx'';'||wwv_flow.LF||
'  mime_t(''kml'') := ''application/vnd.google-earth.kml+xml'';'||wwv_flow.LF||
'  mime_t(''kmz'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1661) := 'd.google-earth.kmz'';'||wwv_flow.LF||
'  mime_t(''gqf'') := ''application/vnd.grafeq'';'||wwv_flow.LF||
'  mime_t(''gqs'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1662) := 'd.grafeq'';'||wwv_flow.LF||
'  mime_t(''gac'') := ''application/vnd.groove-account'';'||wwv_flow.LF||
'  mime_t(''ghf'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1663) := 'groove-help'';'||wwv_flow.LF||
'  mime_t(''gim'') := ''application/vnd.groove-identity-message'';'||wwv_flow.LF||
'  mime_t(''grv'') := ''appl';
wwv_flow_imp.g_varchar2_table(1664) := 'ication/vnd.groove-injector'';'||wwv_flow.LF||
'  mime_t(''gtm'') := ''application/vnd.groove-tool-message'';'||wwv_flow.LF||
'  mime_t(''tp';
wwv_flow_imp.g_varchar2_table(1665) := 'l'') := ''application/vnd.groove-tool-template'';'||wwv_flow.LF||
'  mime_t(''vcg'') := ''application/vnd.groove-vcard'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1666) := 'mime_t(''hal'') := ''application/vnd.hal+xml'';'||wwv_flow.LF||
'  mime_t(''zmm'') := ''application/vnd.handheld-entertainme';
wwv_flow_imp.g_varchar2_table(1667) := 'nt+xml'';'||wwv_flow.LF||
'  mime_t(''hbci'') := ''application/vnd.hbci'';'||wwv_flow.LF||
'  mime_t(''les'') := ''application/vnd.hhe.lesson-';
wwv_flow_imp.g_varchar2_table(1668) := 'player'';'||wwv_flow.LF||
'  mime_t(''hpgl'') := ''application/vnd.hp-hpgl'';'||wwv_flow.LF||
'  mime_t(''hpid'') := ''application/vnd.hp-hpid';
wwv_flow_imp.g_varchar2_table(1669) := ''';'||wwv_flow.LF||
'  mime_t(''hps'') := ''application/vnd.hp-hps'';'||wwv_flow.LF||
'  mime_t(''jlt'') := ''application/vnd.hp-jlyt'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1670) := '_t(''pcl'') := ''application/vnd.hp-pcl'';'||wwv_flow.LF||
'  mime_t(''pclxl'') := ''application/vnd.hp-pclxl'';'||wwv_flow.LF||
'  mime_t(''sf';
wwv_flow_imp.g_varchar2_table(1671) := 'd-hdstx'') := ''application/vnd.hydrostatix.sof-data'';'||wwv_flow.LF||
'  mime_t(''mpy'') := ''application/vnd.ibm.minipay';
wwv_flow_imp.g_varchar2_table(1672) := ''';'||wwv_flow.LF||
'  mime_t(''afp'') := ''application/vnd.ibm.modcap'';'||wwv_flow.LF||
'  mime_t(''listafp'') := ''application/vnd.ibm.modc';
wwv_flow_imp.g_varchar2_table(1673) := 'ap'';'||wwv_flow.LF||
'  mime_t(''list3820'') := ''application/vnd.ibm.modcap'';'||wwv_flow.LF||
'  mime_t(''irm'') := ''application/vnd.ibm.r';
wwv_flow_imp.g_varchar2_table(1674) := 'ights-management'';'||wwv_flow.LF||
'  mime_t(''sc'') := ''application/vnd.ibm.secure-container'';'||wwv_flow.LF||
'  mime_t(''icc'') := ''app';
wwv_flow_imp.g_varchar2_table(1675) := 'lication/vnd.iccprofile'';'||wwv_flow.LF||
'  mime_t(''icm'') := ''application/vnd.iccprofile'';'||wwv_flow.LF||
'  mime_t(''igl'') := ''appli';
wwv_flow_imp.g_varchar2_table(1676) := 'cation/vnd.igloader'';'||wwv_flow.LF||
'  mime_t(''ivp'') := ''application/vnd.immervision-ivp'';'||wwv_flow.LF||
'  mime_t(''ivu'') := ''appl';
wwv_flow_imp.g_varchar2_table(1677) := 'ication/vnd.immervision-ivu'';'||wwv_flow.LF||
'  mime_t(''igm'') := ''application/vnd.insors.igm'';'||wwv_flow.LF||
'  mime_t(''xpw'') := ''a';
wwv_flow_imp.g_varchar2_table(1678) := 'pplication/vnd.intercon.formnet'';'||wwv_flow.LF||
'  mime_t(''xpx'') := ''application/vnd.intercon.formnet'';'||wwv_flow.LF||
'  mime_t(''i';
wwv_flow_imp.g_varchar2_table(1679) := '2g'') := ''application/vnd.intergeo'';'||wwv_flow.LF||
'  mime_t(''qbo'') := ''application/vnd.intu.qbo'';'||wwv_flow.LF||
'  mime_t(''qfx'') :';
wwv_flow_imp.g_varchar2_table(1680) := '= ''application/vnd.intu.qfx'';'||wwv_flow.LF||
'  mime_t(''rcprofile'') := ''application/vnd.ipunplugged.rcprofile'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1681) := 'me_t(''irp'') := ''application/vnd.irepository.package+xml'';'||wwv_flow.LF||
'  mime_t(''xpr'') := ''application/vnd.is-xpr';
wwv_flow_imp.g_varchar2_table(1682) := ''';'||wwv_flow.LF||
'  mime_t(''fcs'') := ''application/vnd.isac.fcs'';'||wwv_flow.LF||
'  mime_t(''jam'') := ''application/vnd.jam'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1683) := '(''rms'') := ''application/vnd.jcp.javame.midlet-rms'';'||wwv_flow.LF||
'  mime_t(''jisp'') := ''application/vnd.jisp'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1684) := 'me_t(''joda'') := ''application/vnd.joost.joda-archive'';'||wwv_flow.LF||
'  mime_t(''ktz'') := ''application/vnd.kahootz'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1685) := '  mime_t(''ktr'') := ''application/vnd.kahootz'';'||wwv_flow.LF||
'  mime_t(''karbon'') := ''application/vnd.kde.karbon'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1686) := 'mime_t(''chrt'') := ''application/vnd.kde.kchart'';'||wwv_flow.LF||
'  mime_t(''kfo'') := ''application/vnd.kde.kformula'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1687) := ' mime_t(''flw'') := ''application/vnd.kde.kivio'';'||wwv_flow.LF||
'  mime_t(''kon'') := ''application/vnd.kde.kontour'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1688) := 'ime_t(''kpr'') := ''application/vnd.kde.kpresenter'';'||wwv_flow.LF||
'  mime_t(''kpt'') := ''application/vnd.kde.kpresenter';
wwv_flow_imp.g_varchar2_table(1689) := ''';'||wwv_flow.LF||
'  mime_t(''ksp'') := ''application/vnd.kde.kspread'';'||wwv_flow.LF||
'  mime_t(''kwd'') := ''application/vnd.kde.kword'';';
wwv_flow_imp.g_varchar2_table(1690) := ''||wwv_flow.LF||
'  mime_t(''kwt'') := ''application/vnd.kde.kword'';'||wwv_flow.LF||
'  mime_t(''htke'') := ''application/vnd.kenameaapp'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1691) := ' mime_t(''kia'') := ''application/vnd.kidspiration'';'||wwv_flow.LF||
'  mime_t(''kne'') := ''application/vnd.kinar'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1692) := '_t(''knp'') := ''application/vnd.kinar'';'||wwv_flow.LF||
'  mime_t(''skp'') := ''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skd'') := ';
wwv_flow_imp.g_varchar2_table(1693) := '''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skt'') := ''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skm'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1694) := 'nd.koan'';'||wwv_flow.LF||
'  mime_t(''sse'') := ''application/vnd.kodak-descriptor'';'||wwv_flow.LF||
'  mime_t(''lasxml'') := ''application/';
wwv_flow_imp.g_varchar2_table(1695) := 'vnd.las.las+xml'';'||wwv_flow.LF||
'  mime_t(''lbd'') := ''application/vnd.llamagraphics.life-balance.desktop'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1696) := '''lbe'') := ''application/vnd.llamagraphics.life-balance.exchange+xml'';'||wwv_flow.LF||
'  mime_t(''123'') := ''application';
wwv_flow_imp.g_varchar2_table(1697) := '/vnd.lotus-1-2-3'';'||wwv_flow.LF||
'  mime_t(''apr'') := ''application/vnd.lotus-approach'';'||wwv_flow.LF||
'  mime_t(''pre'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1698) := 'ion/vnd.lotus-freelance'';'||wwv_flow.LF||
'  mime_t(''nsf'') := ''application/vnd.lotus-notes'';'||wwv_flow.LF||
'  mime_t(''org'') := ''appl';
wwv_flow_imp.g_varchar2_table(1699) := 'ication/vnd.lotus-organizer'';'||wwv_flow.LF||
'  mime_t(''scm'') := ''application/vnd.lotus-screencam'';'||wwv_flow.LF||
'  mime_t(''lwp'') ';
wwv_flow_imp.g_varchar2_table(1700) := ':= ''application/vnd.lotus-wordpro'';'||wwv_flow.LF||
'  mime_t(''portpkg'') := ''application/vnd.macports.portpkg'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1701) := 'e_t(''mcd'') := ''application/vnd.mcd'';'||wwv_flow.LF||
'  mime_t(''mc1'') := ''application/vnd.medcalcdata'';'||wwv_flow.LF||
'  mime_t(''cdk';
wwv_flow_imp.g_varchar2_table(1702) := 'ey'') := ''application/vnd.mediastation.cdkey'';'||wwv_flow.LF||
'  mime_t(''mwf'') := ''application/vnd.mfer'';'||wwv_flow.LF||
'  mime_t(''m';
wwv_flow_imp.g_varchar2_table(1703) := 'fm'') := ''application/vnd.mfmp'';'||wwv_flow.LF||
'  mime_t(''flo'') := ''application/vnd.micrografx.flo'';'||wwv_flow.LF||
'  mime_t(''igx'')';
wwv_flow_imp.g_varchar2_table(1704) := ' := ''application/vnd.micrografx.igx'';'||wwv_flow.LF||
'  mime_t(''mif'') := ''application/vnd.mif'';'||wwv_flow.LF||
'  mime_t(''daf'') := ''';
wwv_flow_imp.g_varchar2_table(1705) := 'application/vnd.mobius.daf'';'||wwv_flow.LF||
'  mime_t(''dis'') := ''application/vnd.mobius.dis'';'||wwv_flow.LF||
'  mime_t(''mbk'') := ''ap';
wwv_flow_imp.g_varchar2_table(1706) := 'plication/vnd.mobius.mbk'';'||wwv_flow.LF||
'  mime_t(''mqy'') := ''application/vnd.mobius.mqy'';'||wwv_flow.LF||
'  mime_t(''msl'') := ''appl';
wwv_flow_imp.g_varchar2_table(1707) := 'ication/vnd.mobius.msl'';'||wwv_flow.LF||
'  mime_t(''plc'') := ''application/vnd.mobius.plc'';'||wwv_flow.LF||
'  mime_t(''txf'') := ''applic';
wwv_flow_imp.g_varchar2_table(1708) := 'ation/vnd.mobius.txf'';'||wwv_flow.LF||
'  mime_t(''mpn'') := ''application/vnd.mophun.application'';'||wwv_flow.LF||
'  mime_t(''mpc'') := ''';
wwv_flow_imp.g_varchar2_table(1709) := 'application/vnd.mophun.certificate'';'||wwv_flow.LF||
'  mime_t(''xul'') := ''application/vnd.mozilla.xul+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1710) := '''cil'') := ''application/vnd.ms-artgalry'';'||wwv_flow.LF||
'  mime_t(''cab'') := ''application/vnd.ms-cab-compressed'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1711) := 'ime_t(''xls'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlm'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1712) := '''xla'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlc'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlt'')';
wwv_flow_imp.g_varchar2_table(1713) := ' := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlw'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlam'') := ''';
wwv_flow_imp.g_varchar2_table(1714) := 'application/vnd.ms-excel.addin.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''xlsb'') := ''application/vnd.ms-excel.sheet';
wwv_flow_imp.g_varchar2_table(1715) := '.binary.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''xlsm'') := ''application/vnd.ms-excel.sheet.macroenabled.12'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1716) := 'me_t(''xltm'') := ''application/vnd.ms-excel.template.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''eot'') := ''application';
wwv_flow_imp.g_varchar2_table(1717) := '/vnd.ms-fontobject'';'||wwv_flow.LF||
'  mime_t(''chm'') := ''application/vnd.ms-htmlhelp'';'||wwv_flow.LF||
'  mime_t(''ims'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1718) := 'on/vnd.ms-ims'';'||wwv_flow.LF||
'  mime_t(''lrm'') := ''application/vnd.ms-lrm'';'||wwv_flow.LF||
'  mime_t(''thmx'') := ''application/vnd.ms';
wwv_flow_imp.g_varchar2_table(1719) := '-officetheme'';'||wwv_flow.LF||
'  mime_t(''cat'') := ''application/vnd.ms-pki.seccat'';'||wwv_flow.LF||
'  mime_t(''stl'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1720) := 'nd.ms-pki.stl'';'||wwv_flow.LF||
'  mime_t(''ppt'') := ''application/vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''pps'') := ''application/';
wwv_flow_imp.g_varchar2_table(1721) := 'vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''pot'') := ''application/vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''ppam'') := ''applica';
wwv_flow_imp.g_varchar2_table(1722) := 'tion/vnd.ms-powerpoint.addin.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''pptm'') := ''application/vnd.ms-powerpoint.pr';
wwv_flow_imp.g_varchar2_table(1723) := 'esentation.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''sldm'') := ''application/vnd.ms-powerpoint.slide.macroenabled.1';
wwv_flow_imp.g_varchar2_table(1724) := '2'';'||wwv_flow.LF||
'  mime_t(''ppsm'') := ''application/vnd.ms-powerpoint.slideshow.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''wav'') :';
wwv_flow_imp.g_varchar2_table(1725) := '= ''audio/x-wav'';'||wwv_flow.LF||
'  mime_t(''xm'') := ''audio/xm'';'||wwv_flow.LF||
'  mime_t(''cdx'') := ''chemical/x-cdx'';'||wwv_flow.LF||
'  mime_t(''cif'') ';
wwv_flow_imp.g_varchar2_table(1726) := ':= ''chemical/x-cif'';'||wwv_flow.LF||
'  mime_t(''cmdf'') := ''chemical/x-cmdf'';'||wwv_flow.LF||
'  mime_t(''cml'') := ''chemical/x-cml'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1727) := 'ime_t(''csml'') := ''chemical/x-csml'';'||wwv_flow.LF||
'  mime_t(''xyz'') := ''chemical/x-xyz'';'||wwv_flow.LF||
'  mime_t(''ttc'') := ''font/co';
wwv_flow_imp.g_varchar2_table(1728) := 'llection'';'||wwv_flow.LF||
'  mime_t(''otf'') := ''font/otf'';'||wwv_flow.LF||
'  mime_t(''ttf'') := ''font/ttf'';'||wwv_flow.LF||
'  mime_t(''woff'') := ''font/w';
wwv_flow_imp.g_varchar2_table(1729) := 'off'';'||wwv_flow.LF||
'  mime_t(''woff2'') := ''font/woff2'';'||wwv_flow.LF||
'  mime_t(''avif'') := ''image/avif'';'||wwv_flow.LF||
'  mime_t(''bmp'') := ''image';
wwv_flow_imp.g_varchar2_table(1730) := '/bmp'';'||wwv_flow.LF||
'  mime_t(''cgm'') := ''image/cgm'';'||wwv_flow.LF||
'  mime_t(''g3'') := ''image/g3fax'';'||wwv_flow.LF||
'  mime_t(''gif'') := ''image/gi';
wwv_flow_imp.g_varchar2_table(1731) := 'f'';'||wwv_flow.LF||
'  mime_t(''ief'') := ''image/ief'';'||wwv_flow.LF||
'  mime_t(''jpeg'') := ''image/jpeg'';'||wwv_flow.LF||
'  mime_t(''jpg'') := ''image/jpeg';
wwv_flow_imp.g_varchar2_table(1732) := ''';'||wwv_flow.LF||
'  mime_t(''jpe'') := ''image/jpeg'';'||wwv_flow.LF||
'  mime_t(''ktx'') := ''image/ktx'';'||wwv_flow.LF||
'  mime_t(''png'') := ''image/png'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1733) := '  mime_t(''btif'') := ''image/prs.btif'';'||wwv_flow.LF||
'  mime_t(''sgi'') := ''image/sgi'';'||wwv_flow.LF||
'  mime_t(''svg'') := ''image/svg+';
wwv_flow_imp.g_varchar2_table(1734) := 'xml'';'||wwv_flow.LF||
'  mime_t(''svgz'') := ''image/svg+xml'';'||wwv_flow.LF||
'  mime_t(''tiff'') := ''image/tiff'';'||wwv_flow.LF||
'  mime_t(''tif'') := ''ima';
wwv_flow_imp.g_varchar2_table(1735) := 'ge/tiff'';'||wwv_flow.LF||
'  mime_t(''psd'') := ''image/vnd.adobe.photoshop'';'||wwv_flow.LF||
'  mime_t(''uvi'') := ''image/vnd.dece.graphic';
wwv_flow_imp.g_varchar2_table(1736) := ''';'||wwv_flow.LF||
'  mime_t(''uvvi'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime_t(''uvg'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1737) := '_t(''uvvg'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime_t(''djvu'') := ''image/vnd.djvu'';'||wwv_flow.LF||
'  mime_t(''djv'') := ''im';
wwv_flow_imp.g_varchar2_table(1738) := 'age/vnd.djvu'';'||wwv_flow.LF||
'  mime_t(''sub'') := ''image/vnd.dvb.subtitle'';'||wwv_flow.LF||
'  mime_t(''dwg'') := ''image/vnd.dwg'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1739) := 'me_t(''dxf'') := ''image/vnd.dxf'';'||wwv_flow.LF||
'  mime_t(''fbs'') := ''image/vnd.fastbidsheet'';'||wwv_flow.LF||
'  mime_t(''fpx'') := ''ima';
wwv_flow_imp.g_varchar2_table(1740) := 'ge/vnd.fpx'';'||wwv_flow.LF||
'  mime_t(''fst'') := ''image/vnd.fst'';'||wwv_flow.LF||
'  mime_t(''mmr'') := ''image/vnd.fujixerox.edmics-mmr''';
wwv_flow_imp.g_varchar2_table(1741) := ';'||wwv_flow.LF||
'  mime_t(''rlc'') := ''image/vnd.fujixerox.edmics-rlc'';'||wwv_flow.LF||
'  mime_t(''mdi'') := ''image/vnd.ms-modi'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1742) := 'e_t(''wdp'') := ''image/vnd.ms-photo'';'||wwv_flow.LF||
'  mime_t(''npx'') := ''image/vnd.net-fpx'';'||wwv_flow.LF||
'  mime_t(''wbmp'') := ''ima';
wwv_flow_imp.g_varchar2_table(1743) := 'ge/vnd.wap.wbmp'';'||wwv_flow.LF||
'  mime_t(''xif'') := ''image/vnd.xiff'';'||wwv_flow.LF||
'  mime_t(''webp'') := ''image/webp'';'||wwv_flow.LF||
'  mime_t(''3';
wwv_flow_imp.g_varchar2_table(1744) := 'ds'') := ''image/x-3ds'';'||wwv_flow.LF||
'  mime_t(''ras'') := ''image/x-cmu-raster'';'||wwv_flow.LF||
'  mime_t(''cmx'') := ''image/x-cmx'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1745) := 'mime_t(''fh'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fhc'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fh4'') := ''image';
wwv_flow_imp.g_varchar2_table(1746) := '/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fh5'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fh7'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1747) := '(''ico'') := ''image/x-icon'';'||wwv_flow.LF||
'  mime_t(''sid'') := ''image/x-mrsid-image'';'||wwv_flow.LF||
'  mime_t(''pcx'') := ''image/x-pcx';
wwv_flow_imp.g_varchar2_table(1748) := ''';'||wwv_flow.LF||
'  mime_t(''pic'') := ''image/x-pict'';'||wwv_flow.LF||
'  mime_t(''pct'') := ''image/x-pict'';'||wwv_flow.LF||
'  mime_t(''pnm'') := ''image/x';
wwv_flow_imp.g_varchar2_table(1749) := '-portable-anymap'';'||wwv_flow.LF||
'  mime_t(''pbm'') := ''image/x-portable-bitmap'';'||wwv_flow.LF||
'  mime_t(''pgm'') := ''image/x-portabl';
wwv_flow_imp.g_varchar2_table(1750) := 'e-graymap'';'||wwv_flow.LF||
'  mime_t(''ppm'') := ''image/x-portable-pixmap'';'||wwv_flow.LF||
'  mime_t(''rgb'') := ''image/x-rgb'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1751) := '(''tga'') := ''image/x-tga'';'||wwv_flow.LF||
'  mime_t(''xbm'') := ''image/x-xbitmap'';'||wwv_flow.LF||
'  mime_t(''xpm'') := ''image/x-xpixmap''';
wwv_flow_imp.g_varchar2_table(1752) := ';'||wwv_flow.LF||
'  mime_t(''xwd'') := ''image/x-xwindowdump'';'||wwv_flow.LF||
'  mime_t(''eml'') := ''message/rfc822'';'||wwv_flow.LF||
'  mime_t(''mime'') :=';
wwv_flow_imp.g_varchar2_table(1753) := ' ''message/rfc822'';'||wwv_flow.LF||
'  mime_t(''igs'') := ''model/iges'';'||wwv_flow.LF||
'  mime_t(''iges'') := ''model/iges'';'||wwv_flow.LF||
'  mime_t(''msh''';
wwv_flow_imp.g_varchar2_table(1754) := ') := ''model/mesh'';'||wwv_flow.LF||
'  mime_t(''mesh'') := ''model/mesh'';'||wwv_flow.LF||
'  mime_t(''silo'') := ''model/mesh'';'||wwv_flow.LF||
'  mime_t(''dae';
wwv_flow_imp.g_varchar2_table(1755) := ''') := ''model/vnd.collada+xml'';'||wwv_flow.LF||
'  mime_t(''dwf'') := ''model/vnd.dwf'';'||wwv_flow.LF||
'  mime_t(''gdl'') := ''model/vnd.gdl';
wwv_flow_imp.g_varchar2_table(1756) := ''';'||wwv_flow.LF||
'  mime_t(''gtw'') := ''model/vnd.gtw'';'||wwv_flow.LF||
'  mime_t(''vtu'') := ''model/vnd.vtu'';'||wwv_flow.LF||
'  mime_t(''wrl'') := ''model';
wwv_flow_imp.g_varchar2_table(1757) := '/vrml'';'||wwv_flow.LF||
'  mime_t(''vrml'') := ''model/vrml'';'||wwv_flow.LF||
'  mime_t(''x3db'') := ''model/x3d+binary'';'||wwv_flow.LF||
'  mime_t(''x3dbz'') ';
wwv_flow_imp.g_varchar2_table(1758) := ':= ''model/x3d+binary'';'||wwv_flow.LF||
'  mime_t(''x3dv'') := ''model/x3d+vrml'';'||wwv_flow.LF||
'  mime_t(''x3dvz'') := ''model/x3d+vrml'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1759) := '  mime_t(''x3d'') := ''model/x3d+xml'';'||wwv_flow.LF||
'  mime_t(''x3dz'') := ''model/x3d+xml'';'||wwv_flow.LF||
'  mime_t(''appcache'') := ''te';
wwv_flow_imp.g_varchar2_table(1760) := 'xt/cache-manifest'';'||wwv_flow.LF||
'  mime_t(''ics'') := ''text/calendar'';'||wwv_flow.LF||
'  mime_t(''ifb'') := ''text/calendar'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1761) := '(''css'') := ''text/css'';'||wwv_flow.LF||
'  mime_t(''csv'') := ''text/csv'';'||wwv_flow.LF||
'  mime_t(''html'') := ''text/html'';'||wwv_flow.LF||
'  mime_t(''htm';
wwv_flow_imp.g_varchar2_table(1762) := ''') := ''text/html'';'||wwv_flow.LF||
'  mime_t(''js'') := ''text/javascript'';'||wwv_flow.LF||
'  mime_t(''mjs'') := ''text/javascript'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1763) := '_t(''n3'') := ''text/n3'';'||wwv_flow.LF||
'  mime_t(''txt'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''text'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1764) := 'conf'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''def'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''list'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1765) := '''log'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''in'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''dsc'') := ''text/prs.lines.tag'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1766) := 'ime_t(''rtx'') := ''text/richtext'';'||wwv_flow.LF||
'  mime_t(''sgml'') := ''text/sgml'';'||wwv_flow.LF||
'  mime_t(''sgm'') := ''text/sgml'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1767) := 'mime_t(''tsv'') := ''text/tab-separated-values'';'||wwv_flow.LF||
'  mime_t(''t'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''tr'') := ''text';
wwv_flow_imp.g_varchar2_table(1768) := '/troff'';'||wwv_flow.LF||
'  mime_t(''roff'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''man'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''me'') := ''text/';
wwv_flow_imp.g_varchar2_table(1769) := 'troff'';'||wwv_flow.LF||
'  mime_t(''ms'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''ttl'') := ''text/turtle'';'||wwv_flow.LF||
'  mime_t(''uri'') := ''text/u';
wwv_flow_imp.g_varchar2_table(1770) := 'ri-list'';'||wwv_flow.LF||
'  mime_t(''uris'') := ''text/uri-list'';'||wwv_flow.LF||
'  mime_t(''urls'') := ''text/uri-list'';'||wwv_flow.LF||
'  mime_t(''vcard''';
wwv_flow_imp.g_varchar2_table(1771) := ') := ''text/vcard'';'||wwv_flow.LF||
'  mime_t(''curl'') := ''text/vnd.curl'';'||wwv_flow.LF||
'  mime_t(''dcurl'') := ''text/vnd.curl.dcurl'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1772) := '  mime_t(''mcurl'') := ''text/vnd.curl.mcurl'';'||wwv_flow.LF||
'  mime_t(''scurl'') := ''text/vnd.curl.scurl'';'||wwv_flow.LF||
'  mime_t(''su';
wwv_flow_imp.g_varchar2_table(1773) := 'b'') := ''text/vnd.dvb.subtitle'';'||wwv_flow.LF||
'  mime_t(''fly'') := ''text/vnd.fly'';'||wwv_flow.LF||
'  mime_t(''flx'') := ''text/vnd.fmi.';
wwv_flow_imp.g_varchar2_table(1774) := 'flexstor'';'||wwv_flow.LF||
'  mime_t(''gv'') := ''text/vnd.graphviz'';'||wwv_flow.LF||
'  mime_t(''3dml'') := ''text/vnd.in3d.3dml'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1775) := '(''spot'') := ''text/vnd.in3d.spot'';'||wwv_flow.LF||
'  mime_t(''jad'') := ''text/vnd.sun.j2me.app-descriptor'';'||wwv_flow.LF||
'  mime_t(''w';
wwv_flow_imp.g_varchar2_table(1776) := 'ml'') := ''text/vnd.wap.wml'';'||wwv_flow.LF||
'  mime_t(''wmls'') := ''text/vnd.wap.wmlscript'';'||wwv_flow.LF||
'  mime_t(''s'') := ''text/x-a';
wwv_flow_imp.g_varchar2_table(1777) := 'sm'';'||wwv_flow.LF||
'  mime_t(''asm'') := ''text/x-asm'';'||wwv_flow.LF||
'  mime_t(''c'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''cc'') := ''text/x-c'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1778) := 'ime_t(''cxx'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''cpp'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''h'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''hh';
wwv_flow_imp.g_varchar2_table(1779) := ''') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''dic'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''f'') := ''text/x-fortran'';'||wwv_flow.LF||
'  mime_t(''for'') ';
wwv_flow_imp.g_varchar2_table(1780) := ':= ''text/x-fortran'';'||wwv_flow.LF||
'  mime_t(''f77'') := ''text/x-fortran'';'||wwv_flow.LF||
'  mime_t(''f90'') := ''text/x-fortran'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1781) := 'e_t(''java'') := ''text/x-java-source'';'||wwv_flow.LF||
'  mime_t(''nfo'') := ''text/x-nfo'';'||wwv_flow.LF||
'  mime_t(''opml'') := ''text/x-op';
wwv_flow_imp.g_varchar2_table(1782) := 'ml'';'||wwv_flow.LF||
'  mime_t(''p'') := ''text/x-pascal'';'||wwv_flow.LF||
'  mime_t(''pas'') := ''text/x-pascal'';'||wwv_flow.LF||
'  mime_t(''etx'') := ''text/';
wwv_flow_imp.g_varchar2_table(1783) := 'x-setext'';'||wwv_flow.LF||
'  mime_t(''sfv'') := ''text/x-sfv'';'||wwv_flow.LF||
'  mime_t(''uu'') := ''text/x-uuencode'';'||wwv_flow.LF||
'  mime_t(''vcs'') := ';
wwv_flow_imp.g_varchar2_table(1784) := '''text/x-vcalendar'';'||wwv_flow.LF||
'  mime_t(''vcf'') := ''text/x-vcard'';'||wwv_flow.LF||
'  mime_t(''3gp'') := ''video/3gpp'';'||wwv_flow.LF||
'  mime_t(''3g';
wwv_flow_imp.g_varchar2_table(1785) := '2'') := ''video/3gpp2'';'||wwv_flow.LF||
'  mime_t(''h261'') := ''video/h261'';'||wwv_flow.LF||
'  mime_t(''h263'') := ''video/h263'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1786) := 'h264'') := ''video/h264'';'||wwv_flow.LF||
'  mime_t(''jpgv'') := ''video/jpeg'';'||wwv_flow.LF||
'  mime_t(''jpm'') := ''video/jpm'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1787) := 'jpgm'') := ''video/jpm'';'||wwv_flow.LF||
'  mime_t(''mj2'') := ''video/mj2'';'||wwv_flow.LF||
'  mime_t(''mjp2'') := ''video/mj2'';'||wwv_flow.LF||
'  mime_t(''ts';
wwv_flow_imp.g_varchar2_table(1788) := ''') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''m2t'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''m2ts'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''mts';
wwv_flow_imp.g_varchar2_table(1789) := ''') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''mp4'') := ''video/mp4'';'||wwv_flow.LF||
'  mime_t(''mp4v'') := ''video/mp4'';'||wwv_flow.LF||
'  mime_t(''mpg4''';
wwv_flow_imp.g_varchar2_table(1790) := ') := ''video/mp4'';'||wwv_flow.LF||
'  mime_t(''mpeg'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''mpg'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''mpe'')';
wwv_flow_imp.g_varchar2_table(1791) := ' := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''m1v'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''m2v'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''ogv'') ';
wwv_flow_imp.g_varchar2_table(1792) := ':= ''video/ogg'';'||wwv_flow.LF||
'  mime_t(''qt'') := ''video/quicktime'';'||wwv_flow.LF||
'  mime_t(''mov'') := ''video/quicktime'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1793) := '''uvh'') := ''video/vnd.dece.hd'';'||wwv_flow.LF||
'  mime_t(''uvvh'') := ''video/vnd.dece.hd'';'||wwv_flow.LF||
'  mime_t(''uvm'') := ''video/vn';
wwv_flow_imp.g_varchar2_table(1794) := 'd.dece.mobile'';'||wwv_flow.LF||
'  mime_t(''uvvm'') := ''video/vnd.dece.mobile'';'||wwv_flow.LF||
'  mime_t(''uvp'') := ''video/vnd.dece.pd'';';
wwv_flow_imp.g_varchar2_table(1795) := ''||wwv_flow.LF||
'  mime_t(''uvvp'') := ''video/vnd.dece.pd'';'||wwv_flow.LF||
'  mime_t(''uvs'') := ''video/vnd.dece.sd'';'||wwv_flow.LF||
'  mime_t(''uvvs'') :';
wwv_flow_imp.g_varchar2_table(1796) := '= ''video/vnd.dece.sd'';'||wwv_flow.LF||
'  mime_t(''uvv'') := ''video/vnd.dece.video'';'||wwv_flow.LF||
'  mime_t(''uvvv'') := ''video/vnd.dec';
wwv_flow_imp.g_varchar2_table(1797) := 'e.video'';'||wwv_flow.LF||
'  mime_t(''dvb'') := ''video/vnd.dvb.file'';'||wwv_flow.LF||
'  mime_t(''fvt'') := ''video/vnd.fvt'';'||wwv_flow.LF||
'  mime_t(''mxu';
wwv_flow_imp.g_varchar2_table(1798) := ''') := ''video/vnd.mpegurl'';'||wwv_flow.LF||
'  mime_t(''m4u'') := ''video/vnd.mpegurl'';'||wwv_flow.LF||
'  mime_t(''pyv'') := ''video/vnd.ms-';
wwv_flow_imp.g_varchar2_table(1799) := 'playready.media.pyv'';'||wwv_flow.LF||
'  mime_t(''uvu'') := ''video/vnd.uvvu.mp4'';'||wwv_flow.LF||
'  mime_t(''uvvu'') := ''video/vnd.uvvu.m';
wwv_flow_imp.g_varchar2_table(1800) := 'p4'';'||wwv_flow.LF||
'  mime_t(''viv'') := ''video/vnd.vivo'';'||wwv_flow.LF||
'  mime_t(''webm'') := ''video/webm'';'||wwv_flow.LF||
'  mime_t(''f4v'') := ''vide';
wwv_flow_imp.g_varchar2_table(1801) := 'o/x-f4v'';'||wwv_flow.LF||
'  mime_t(''fli'') := ''video/x-fli'';'||wwv_flow.LF||
'  mime_t(''flv'') := ''video/x-flv'';'||wwv_flow.LF||
'  mime_t(''m4v'') := ''vi';
wwv_flow_imp.g_varchar2_table(1802) := 'deo/x-m4v'';'||wwv_flow.LF||
'  mime_t(''mkv'') := ''video/x-matroska'';'||wwv_flow.LF||
'  mime_t(''mk3d'') := ''video/x-matroska'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1803) := '''mks'') := ''video/x-matroska'';'||wwv_flow.LF||
'  mime_t(''mng'') := ''video/x-mng'';'||wwv_flow.LF||
'  mime_t(''asf'') := ''video/x-ms-asf'';';
wwv_flow_imp.g_varchar2_table(1804) := ''||wwv_flow.LF||
'  mime_t(''asx'') := ''video/x-ms-asf'';'||wwv_flow.LF||
'  mime_t(''vob'') := ''video/x-ms-vob'';'||wwv_flow.LF||
'  mime_t(''wm'') := ''video/';
wwv_flow_imp.g_varchar2_table(1805) := 'x-ms-wm'';'||wwv_flow.LF||
'  mime_t(''wmv'') := ''video/x-ms-wmv'';'||wwv_flow.LF||
'  mime_t(''wmx'') := ''video/x-ms-wmx'';'||wwv_flow.LF||
'  mime_t(''wvx'') ';
wwv_flow_imp.g_varchar2_table(1806) := ':= ''video/x-ms-wvx'';'||wwv_flow.LF||
'  mime_t(''avi'') := ''video/x-msvideo'';'||wwv_flow.LF||
'  mime_t(''movie'') := ''video/x-sgi-movie'';';
wwv_flow_imp.g_varchar2_table(1807) := ''||wwv_flow.LF||
'  mime_t(''smv'') := ''video/x-smv'';'||wwv_flow.LF||
'  mime_t(''ice'') := ''x-conference/x-cooltalk'';'||wwv_flow.LF||
'  mime_t(''potm'') :=';
wwv_flow_imp.g_varchar2_table(1808) := ' ''application/vnd.ms-powerpoint.template.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''mpp'') := ''application/vnd.ms-pr';
wwv_flow_imp.g_varchar2_table(1809) := 'oject'';'||wwv_flow.LF||
'  mime_t(''mpt'') := ''application/vnd.ms-project'';'||wwv_flow.LF||
'  mime_t(''docm'') := ''application/vnd.ms-wor';
wwv_flow_imp.g_varchar2_table(1810) := 'd.document.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''dotm'') := ''application/vnd.ms-word.template.macroenabled.12'';';
wwv_flow_imp.g_varchar2_table(1811) := ''||wwv_flow.LF||
'  mime_t(''wps'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''wks'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1812) := 'e_t(''wcm'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''wdb'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''w';
wwv_flow_imp.g_varchar2_table(1813) := 'pl'') := ''application/vnd.ms-wpl'';'||wwv_flow.LF||
'  mime_t(''xps'') := ''application/vnd.ms-xpsdocument'';'||wwv_flow.LF||
'  mime_t(''mse';
wwv_flow_imp.g_varchar2_table(1814) := 'q'') := ''application/vnd.mseq'';'||wwv_flow.LF||
'  mime_t(''mus'') := ''application/vnd.musician'';'||wwv_flow.LF||
'  mime_t(''msty'') := ''a';
wwv_flow_imp.g_varchar2_table(1815) := 'pplication/vnd.muvee.style'';'||wwv_flow.LF||
'  mime_t(''taglet'') := ''application/vnd.mynfc'';'||wwv_flow.LF||
'  mime_t(''nlu'') := ''appl';
wwv_flow_imp.g_varchar2_table(1816) := 'ication/vnd.neurolanguage.nlu'';'||wwv_flow.LF||
'  mime_t(''ntf'') := ''application/vnd.nitf'';'||wwv_flow.LF||
'  mime_t(''nitf'') := ''appl';
wwv_flow_imp.g_varchar2_table(1817) := 'ication/vnd.nitf'';'||wwv_flow.LF||
'  mime_t(''nnd'') := ''application/vnd.noblenet-directory'';'||wwv_flow.LF||
'  mime_t(''nns'') := ''appl';
wwv_flow_imp.g_varchar2_table(1818) := 'ication/vnd.noblenet-sealer'';'||wwv_flow.LF||
'  mime_t(''nnw'') := ''application/vnd.noblenet-web'';'||wwv_flow.LF||
'  mime_t(''ngdat'') :';
wwv_flow_imp.g_varchar2_table(1819) := '= ''application/vnd.nokia.n-gage.data'';'||wwv_flow.LF||
'  mime_t(''n-gage'') := ''application/vnd.nokia.n-gage.symbian.i';
wwv_flow_imp.g_varchar2_table(1820) := 'nstall'';'||wwv_flow.LF||
'  mime_t(''rpst'') := ''application/vnd.nokia.radio-preset'';'||wwv_flow.LF||
'  mime_t(''rpss'') := ''application/';
wwv_flow_imp.g_varchar2_table(1821) := 'vnd.nokia.radio-presets'';'||wwv_flow.LF||
'  mime_t(''edm'') := ''application/vnd.novadigm.edm'';'||wwv_flow.LF||
'  mime_t(''edx'') := ''app';
wwv_flow_imp.g_varchar2_table(1822) := 'lication/vnd.novadigm.edx'';'||wwv_flow.LF||
'  mime_t(''ext'') := ''application/vnd.novadigm.ext'';'||wwv_flow.LF||
'  mime_t(''odc'') := ''a';
wwv_flow_imp.g_varchar2_table(1823) := 'pplication/vnd.oasis.opendocument.chart'';'||wwv_flow.LF||
'  mime_t(''otc'') := ''application/vnd.oasis.opendocument.cha';
wwv_flow_imp.g_varchar2_table(1824) := 'rt-template'';'||wwv_flow.LF||
'  mime_t(''odb'') := ''application/vnd.oasis.opendocument.database'';'||wwv_flow.LF||
'  mime_t(''odf'') := ''';
wwv_flow_imp.g_varchar2_table(1825) := 'application/vnd.oasis.opendocument.formula'';'||wwv_flow.LF||
'  mime_t(''odft'') := ''application/vnd.oasis.opendocument';
wwv_flow_imp.g_varchar2_table(1826) := '.formula-template'';'||wwv_flow.LF||
'  mime_t(''odg'') := ''application/vnd.oasis.opendocument.graphics'';'||wwv_flow.LF||
'  mime_t(''otg''';
wwv_flow_imp.g_varchar2_table(1827) := ') := ''application/vnd.oasis.opendocument.graphics-template'';'||wwv_flow.LF||
'  mime_t(''odi'') := ''application/vnd.oas';
wwv_flow_imp.g_varchar2_table(1828) := 'is.opendocument.image'';'||wwv_flow.LF||
'  mime_t(''oti'') := ''application/vnd.oasis.opendocument.image-template'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1829) := 'me_t(''odp'') := ''application/vnd.oasis.opendocument.presentation'';'||wwv_flow.LF||
'  mime_t(''otp'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1830) := 'd.oasis.opendocument.presentation-template'';'||wwv_flow.LF||
'  mime_t(''ods'') := ''application/vnd.oasis.opendocument.';
wwv_flow_imp.g_varchar2_table(1831) := 'spreadsheet'';'||wwv_flow.LF||
'  mime_t(''ots'') := ''application/vnd.oasis.opendocument.spreadsheet-template'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1832) := '(''odt'') := ''application/vnd.oasis.opendocument.text'';'||wwv_flow.LF||
'  mime_t(''odm'') := ''application/vnd.oasis.open';
wwv_flow_imp.g_varchar2_table(1833) := 'document.text-master'';'||wwv_flow.LF||
'  mime_t(''ott'') := ''application/vnd.oasis.opendocument.text-template'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1834) := '_t(''oth'') := ''application/vnd.oasis.opendocument.text-web'';'||wwv_flow.LF||
'  mime_t(''xo'') := ''application/vnd.olpc-';
wwv_flow_imp.g_varchar2_table(1835) := 'sugar'';'||wwv_flow.LF||
'  mime_t(''dd2'') := ''application/vnd.oma.dd2+xml'';'||wwv_flow.LF||
'  mime_t(''oxt'') := ''application/vnd.openof';
wwv_flow_imp.g_varchar2_table(1836) := 'ficeorg.extension'';'||wwv_flow.LF||
'  mime_t(''pptx'') := ''application/vnd.openxmlformats-officedocument.presentationm';
wwv_flow_imp.g_varchar2_table(1837) := 'l.presentation'';'||wwv_flow.LF||
'  mime_t(''sldx'') := ''application/vnd.openxmlformats-officedocument.presentationml.s';
wwv_flow_imp.g_varchar2_table(1838) := 'lide'';'||wwv_flow.LF||
'  mime_t(''ppsx'') := ''application/vnd.openxmlformats-officedocument.presentationml.slideshow'';';
wwv_flow_imp.g_varchar2_table(1839) := ''||wwv_flow.LF||
'  mime_t(''potx'') := ''application/vnd.openxmlformats-officedocument.presentationml.template'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1840) := '_t(''xlsx'') := ''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'';'||wwv_flow.LF||
'  mime_t(''xltx'') ';
wwv_flow_imp.g_varchar2_table(1841) := ':= ''application/vnd.openxmlformats-officedocument.spreadsheetml.template'';'||wwv_flow.LF||
'  mime_t(''docx'') := ''appl';
wwv_flow_imp.g_varchar2_table(1842) := 'ication/vnd.openxmlformats-officedocument.wordprocessingml.document'';'||wwv_flow.LF||
'  mime_t(''dotx'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1843) := 'on/vnd.openxmlformats-officedocument.wordprocessingml.template'';'||wwv_flow.LF||
'  mime_t(''mgp'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1844) := '.osgeo.mapguide.package'';'||wwv_flow.LF||
'  mime_t(''dp'') := ''application/vnd.osgi.dp'';'||wwv_flow.LF||
'  mime_t(''esa'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1845) := 'on/vnd.osgi.subsystem'';'||wwv_flow.LF||
'  mime_t(''pdb'') := ''application/vnd.palm'';'||wwv_flow.LF||
'  mime_t(''pqa'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1846) := 'nd.palm'';'||wwv_flow.LF||
'  mime_t(''oprc'') := ''application/vnd.palm'';'||wwv_flow.LF||
'  mime_t(''paw'') := ''application/vnd.pawaafile''';
wwv_flow_imp.g_varchar2_table(1847) := ';'||wwv_flow.LF||
'  mime_t(''str'') := ''application/vnd.pg.format'';'||wwv_flow.LF||
'  mime_t(''ei6'') := ''application/vnd.pg.osasli'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1848) := 'mime_t(''efif'') := ''application/vnd.picsel'';'||wwv_flow.LF||
'  mime_t(''wg'') := ''application/vnd.pmi.widget'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1849) := '(''plf'') := ''application/vnd.pocketlearn'';'||wwv_flow.LF||
'  mime_t(''pbd'') := ''application/vnd.powerbuilder6'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1850) := '_t(''box'') := ''application/vnd.previewsystems.box'';'||wwv_flow.LF||
'  mime_t(''mgz'') := ''application/vnd.proteus.magaz';
wwv_flow_imp.g_varchar2_table(1851) := 'ine'';'||wwv_flow.LF||
'  mime_t(''qps'') := ''application/vnd.publishare-delta-tree'';'||wwv_flow.LF||
'  mime_t(''ptid'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1852) := 'nd.pvi.ptid1'';'||wwv_flow.LF||
'  mime_t(''qxd'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qxt'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1853) := 'on/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qwd'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qwt'') :';
wwv_flow_imp.g_varchar2_table(1854) := '= ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qxl'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1855) := 'e_t(''qxb'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''bed'') := ''application/vnd.realvnc.bed'';';
wwv_flow_imp.g_varchar2_table(1856) := ''||wwv_flow.LF||
'  mime_t(''mxl'') := ''application/vnd.recordare.musicxml'';'||wwv_flow.LF||
'  mime_t(''musicxml'') := ''application/vnd.r';
wwv_flow_imp.g_varchar2_table(1857) := 'ecordare.musicxml+xml'';'||wwv_flow.LF||
'  mime_t(''cryptonote'') := ''application/vnd.rig.cryptonote'';'||wwv_flow.LF||
'  mime_t(''cod'') ';
wwv_flow_imp.g_varchar2_table(1858) := ':= ''application/vnd.rim.cod'';'||wwv_flow.LF||
'  mime_t(''rm'') := ''application/vnd.rn-realmedia'';'||wwv_flow.LF||
'  mime_t(''rmvb'') := ';
wwv_flow_imp.g_varchar2_table(1859) := '''application/vnd.rn-realmedia-vbr'';'||wwv_flow.LF||
'  mime_t(''link66'') := ''application/vnd.route66.link66+xml'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1860) := 'me_t(''st'') := ''application/vnd.sailingtracker.track'';'||wwv_flow.LF||
'  mime_t(''see'') := ''application/vnd.seemail'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1861) := '  mime_t(''sema'') := ''application/vnd.sema'';'||wwv_flow.LF||
'  mime_t(''semd'') := ''application/vnd.semd'';'||wwv_flow.LF||
'  mime_t(''se';
wwv_flow_imp.g_varchar2_table(1862) := 'mf'') := ''application/vnd.semf'';'||wwv_flow.LF||
'  mime_t(''ifm'') := ''application/vnd.shana.informed.formdata'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1863) := '_t(''itp'') := ''application/vnd.shana.informed.formtemplate'';'||wwv_flow.LF||
'  mime_t(''iif'') := ''application/vnd.shan';
wwv_flow_imp.g_varchar2_table(1864) := 'a.informed.interchange'';'||wwv_flow.LF||
'  mime_t(''ipk'') := ''application/vnd.shana.informed.package'';'||wwv_flow.LF||
'  mime_t(''twd''';
wwv_flow_imp.g_varchar2_table(1865) := ') := ''application/vnd.simtech-mindmapper'';'||wwv_flow.LF||
'  mime_t(''twds'') := ''application/vnd.simtech-mindmapper'';';
wwv_flow_imp.g_varchar2_table(1866) := ''||wwv_flow.LF||
'  mime_t(''mmf'') := ''application/vnd.smaf'';'||wwv_flow.LF||
'  mime_t(''teacher'') := ''application/vnd.smart.teacher'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1867) := '  mime_t(''sdkm'') := ''application/vnd.solent.sdkm+xml'';'||wwv_flow.LF||
'  mime_t(''sdkd'') := ''application/vnd.solent.s';
wwv_flow_imp.g_varchar2_table(1868) := 'dkm+xml'';'||wwv_flow.LF||
'  mime_t(''dxp'') := ''application/vnd.spotfire.dxp'';'||wwv_flow.LF||
'  mime_t(''sfs'') := ''application/vnd.spo';
wwv_flow_imp.g_varchar2_table(1869) := 'tfire.sfs'';'||wwv_flow.LF||
'  mime_t(''sdc'') := ''application/vnd.stardivision.calc'';'||wwv_flow.LF||
'  mime_t(''sda'') := ''application/';
wwv_flow_imp.g_varchar2_table(1870) := 'vnd.stardivision.draw'';'||wwv_flow.LF||
'  mime_t(''sdd'') := ''application/vnd.stardivision.impress'';'||wwv_flow.LF||
'  mime_t(''smf'') :';
wwv_flow_imp.g_varchar2_table(1871) := '= ''application/vnd.stardivision.math'';'||wwv_flow.LF||
'  mime_t(''sdw'') := ''application/vnd.stardivision.writer'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1872) := 'ime_t(''vor'') := ''application/vnd.stardivision.writer'';'||wwv_flow.LF||
'  mime_t(''sgl'') := ''application/vnd.stardivis';
wwv_flow_imp.g_varchar2_table(1873) := 'ion.writer-global'';'||wwv_flow.LF||
'  mime_t(''smzip'') := ''application/vnd.stepmania.package'';'||wwv_flow.LF||
'  mime_t(''sm'') := ''app';
wwv_flow_imp.g_varchar2_table(1874) := 'lication/vnd.stepmania.stepchart'';'||wwv_flow.LF||
'  mime_t(''sxc'') := ''application/vnd.sun.xml.calc'';'||wwv_flow.LF||
'  mime_t(''stc''';
wwv_flow_imp.g_varchar2_table(1875) := ') := ''application/vnd.sun.xml.calc.template'';'||wwv_flow.LF||
'  mime_t(''sxd'') := ''application/vnd.sun.xml.draw'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1876) := 'ime_t(''std'') := ''application/vnd.sun.xml.draw.template'';'||wwv_flow.LF||
'  mime_t(''sxi'') := ''application/vnd.sun.xml';
wwv_flow_imp.g_varchar2_table(1877) := '.impress'';'||wwv_flow.LF||
'  mime_t(''sti'') := ''application/vnd.sun.xml.impress.template'';'||wwv_flow.LF||
'  mime_t(''sxm'') := ''applic';
wwv_flow_imp.g_varchar2_table(1878) := 'ation/vnd.sun.xml.math'';'||wwv_flow.LF||
'  mime_t(''sxw'') := ''application/vnd.sun.xml.writer'';'||wwv_flow.LF||
'  mime_t(''sxg'') := ''ap';
wwv_flow_imp.g_varchar2_table(1879) := 'plication/vnd.sun.xml.writer.global'';'||wwv_flow.LF||
'  mime_t(''stw'') := ''application/vnd.sun.xml.writer.template'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1880) := '  mime_t(''sus'') := ''application/vnd.sus-calendar'';'||wwv_flow.LF||
'  mime_t(''susp'') := ''application/vnd.sus-calendar';
wwv_flow_imp.g_varchar2_table(1881) := ''';'||wwv_flow.LF||
'  mime_t(''svd'') := ''application/vnd.svd'';'||wwv_flow.LF||
'  mime_t(''sis'') := ''application/vnd.symbian.install'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1882) := ' mime_t(''sisx'') := ''application/vnd.symbian.install'';'||wwv_flow.LF||
'  mime_t(''xsm'') := ''application/vnd.syncml+xml';
wwv_flow_imp.g_varchar2_table(1883) := ''';'||wwv_flow.LF||
'  mime_t(''bdm'') := ''application/vnd.syncml.dm+wbxml'';'||wwv_flow.LF||
'  mime_t(''xdm'') := ''application/vnd.syncml.';
wwv_flow_imp.g_varchar2_table(1884) := 'dm+xml'';'||wwv_flow.LF||
'  mime_t(''tao'') := ''application/vnd.tao.intent-module-archive'';'||wwv_flow.LF||
'  mime_t(''pcap'') := ''applic';
wwv_flow_imp.g_varchar2_table(1885) := 'ation/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'  mime_t(''cap'') := ''application/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'  mime_t(''dmp'') := ''appl';
wwv_flow_imp.g_varchar2_table(1886) := 'ication/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'  mime_t(''tmo'') := ''application/vnd.tmobile-livetv'';'||wwv_flow.LF||
'  mime_t(''tpt'') := ''';
wwv_flow_imp.g_varchar2_table(1887) := 'application/vnd.trid.tpt'';'||wwv_flow.LF||
'  mime_t(''mxs'') := ''application/vnd.triscape.mxs'';'||wwv_flow.LF||
'  mime_t(''tra'') := ''ap';
wwv_flow_imp.g_varchar2_table(1888) := 'plication/vnd.trueapp'';'||wwv_flow.LF||
'  mime_t(''ufd'') := ''application/vnd.ufdl'';'||wwv_flow.LF||
'  mime_t(''ufdl'') := ''application/';
wwv_flow_imp.g_varchar2_table(1889) := 'vnd.ufdl'';'||wwv_flow.LF||
'  mime_t(''utz'') := ''application/vnd.uiq.theme'';'||wwv_flow.LF||
'  mime_t(''umj'') := ''application/vnd.umaji';
wwv_flow_imp.g_varchar2_table(1890) := 'n'';'||wwv_flow.LF||
'  mime_t(''unityweb'') := ''application/vnd.unity'';'||wwv_flow.LF||
'  mime_t(''uoml'') := ''application/vnd.uoml+xml'';';
wwv_flow_imp.g_varchar2_table(1891) := ''||wwv_flow.LF||
'  mime_t(''vcx'') := ''application/vnd.vcx'';'||wwv_flow.LF||
'  mime_t(''vsd'') := ''application/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vst';
wwv_flow_imp.g_varchar2_table(1892) := ''') := ''application/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vss'') := ''application/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vsw'') := ''appli';
wwv_flow_imp.g_varchar2_table(1893) := 'cation/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vis'') := ''application/vnd.visionary'';'||wwv_flow.LF||
'  mime_t(''vsf'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1894) := 'nd.vsf'';'||wwv_flow.LF||
'  mime_t(''wbxml'') := ''application/vnd.wap.wbxml'';'||wwv_flow.LF||
'  mime_t(''wmlc'') := ''application/vnd.wap.';
wwv_flow_imp.g_varchar2_table(1895) := 'wmlc'';'||wwv_flow.LF||
'  mime_t(''wmlsc'') := ''application/vnd.wap.wmlscriptc'';'||wwv_flow.LF||
'  mime_t(''wtb'') := ''application/vnd.we';
wwv_flow_imp.g_varchar2_table(1896) := 'bturbo'';'||wwv_flow.LF||
'  mime_t(''nbp'') := ''application/vnd.wolfram.player'';'||wwv_flow.LF||
'  mime_t(''wpd'') := ''application/vnd.wo';
wwv_flow_imp.g_varchar2_table(1897) := 'rdperfect'';'||wwv_flow.LF||
'  mime_t(''wqd'') := ''application/vnd.wqd'';'||wwv_flow.LF||
'  mime_t(''stf'') := ''application/vnd.wt.stf'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1898) := ' mime_t(''xar'') := ''application/vnd.xara'';'||wwv_flow.LF||
'  mime_t(''xfdl'') := ''application/vnd.xfdl'';'||wwv_flow.LF||
'  mime_t(''hvd''';
wwv_flow_imp.g_varchar2_table(1899) := ') := ''application/vnd.yamaha.hv-dic'';'||wwv_flow.LF||
'  mime_t(''hvs'') := ''application/vnd.yamaha.hv-script'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1900) := 't(''hvp'') := ''application/vnd.yamaha.hv-voice'';'||wwv_flow.LF||
'  mime_t(''osf'') := ''application/vnd.yamaha.openscoref';
wwv_flow_imp.g_varchar2_table(1901) := 'ormat'';'||wwv_flow.LF||
'  mime_t(''osfpvg'') := ''application/vnd.yamaha.openscoreformat.osfpvg+xml'';'||wwv_flow.LF||
'  mime_t(''saf'') :';
wwv_flow_imp.g_varchar2_table(1902) := '= ''application/vnd.yamaha.smaf-audio'';'||wwv_flow.LF||
'  mime_t(''spf'') := ''application/vnd.yamaha.smaf-phrase'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1903) := 'me_t(''cmp'') := ''application/vnd.yellowriver-custom-menu'';'||wwv_flow.LF||
'  mime_t(''zir'') := ''application/vnd.zul'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1904) := '  mime_t(''zirz'') := ''application/vnd.zul'';'||wwv_flow.LF||
'  mime_t(''zaz'') := ''application/vnd.zzazz.deck+xml'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1905) := 'me_t(''vxml'') := ''application/voicexml+xml'';'||wwv_flow.LF||
'  mime_t(''wasm'') := ''application/wasm'';'||wwv_flow.LF||
'  mime_t(''wgt'') ';
wwv_flow_imp.g_varchar2_table(1906) := ':= ''application/widget'';'||wwv_flow.LF||
'  mime_t(''hlp'') := ''application/winhlp'';'||wwv_flow.LF||
'  mime_t(''wsdl'') := ''application/w';
wwv_flow_imp.g_varchar2_table(1907) := 'sdl+xml'';'||wwv_flow.LF||
'  mime_t(''wspolicy'') := ''application/wspolicy+xml'';'||wwv_flow.LF||
'  mime_t(''7z'') := ''application/x-7z-co';
wwv_flow_imp.g_varchar2_table(1908) := 'mpressed'';'||wwv_flow.LF||
'  mime_t(''abw'') := ''application/x-abiword'';'||wwv_flow.LF||
'  mime_t(''ace'') := ''application/x-ace-compres';
wwv_flow_imp.g_varchar2_table(1909) := 'sed'';'||wwv_flow.LF||
'  mime_t(''dmg'') := ''application/x-apple-diskimage'';'||wwv_flow.LF||
'  mime_t(''aab'') := ''application/x-authorwa';
wwv_flow_imp.g_varchar2_table(1910) := 're-bin'';'||wwv_flow.LF||
'  mime_t(''x32'') := ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''u32'') := ''application/x-author';
wwv_flow_imp.g_varchar2_table(1911) := 'ware-bin'';'||wwv_flow.LF||
'  mime_t(''vox'') := ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''aam'') := ''application/x-auth';
wwv_flow_imp.g_varchar2_table(1912) := 'orware-map'';'||wwv_flow.LF||
'  mime_t(''aas'') := ''application/x-authorware-seg'';'||wwv_flow.LF||
'  mime_t(''bcpio'') := ''application/x-';
wwv_flow_imp.g_varchar2_table(1913) := 'bcpio'';'||wwv_flow.LF||
'  mime_t(''torrent'') := ''application/x-bittorrent'';'||wwv_flow.LF||
'  mime_t(''blb'') := ''application/x-blorb'';';
wwv_flow_imp.g_varchar2_table(1914) := ''||wwv_flow.LF||
'  mime_t(''blorb'') := ''application/x-blorb'';'||wwv_flow.LF||
'  mime_t(''bz'') := ''application/x-bzip'';'||wwv_flow.LF||
'  mime_t(''bz2'')';
wwv_flow_imp.g_varchar2_table(1915) := ' := ''application/x-bzip2'';'||wwv_flow.LF||
'  mime_t(''boz'') := ''application/x-bzip2'';'||wwv_flow.LF||
'  mime_t(''cbr'') := ''application';
wwv_flow_imp.g_varchar2_table(1916) := '/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cba'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cbt'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''c';
wwv_flow_imp.g_varchar2_table(1917) := 'bz'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cb7'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''vcd'') := ''application';
wwv_flow_imp.g_varchar2_table(1918) := '/x-cdlink'';'||wwv_flow.LF||
'  mime_t(''cfs'') := ''application/x-cfs-compressed'';'||wwv_flow.LF||
'  mime_t(''chat'') := ''application/x-ch';
wwv_flow_imp.g_varchar2_table(1919) := 'at'';'||wwv_flow.LF||
'  mime_t(''pgn'') := ''application/x-chess-pgn'';'||wwv_flow.LF||
'  mime_t(''nsc'') := ''application/x-conference'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1920) := 'mime_t(''cpio'') := ''application/x-cpio'';'||wwv_flow.LF||
'  mime_t(''csh'') := ''application/x-csh'';'||wwv_flow.LF||
'  mime_t(''deb'') := ''';
wwv_flow_imp.g_varchar2_table(1921) := 'application/x-debian-package'';'||wwv_flow.LF||
'  mime_t(''udeb'') := ''application/x-debian-package'';'||wwv_flow.LF||
'  mime_t(''dgc'') :';
wwv_flow_imp.g_varchar2_table(1922) := '= ''application/x-dgc-compressed'';'||wwv_flow.LF||
'  mime_t(''dir'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''dcr'') := ''a';
wwv_flow_imp.g_varchar2_table(1923) := 'pplication/x-director'';'||wwv_flow.LF||
'  mime_t(''dxr'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''cst'') := ''application';
wwv_flow_imp.g_varchar2_table(1924) := '/x-director'';'||wwv_flow.LF||
'  mime_t(''cct'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''cxt'') := ''application/x-directo';
wwv_flow_imp.g_varchar2_table(1925) := 'r'';'||wwv_flow.LF||
'  mime_t(''w3d'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''fgd'') := ''application/x-director'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1926) := '_t(''swa'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''wad'') := ''application/x-doom'';'||wwv_flow.LF||
'  mime_t(''ncx'') := ''';
wwv_flow_imp.g_varchar2_table(1927) := 'application/x-dtbncx+xml'';'||wwv_flow.LF||
'  mime_t(''dtb'') := ''application/x-dtbook+xml'';'||wwv_flow.LF||
'  mime_t(''res'') := ''applic';
wwv_flow_imp.g_varchar2_table(1928) := 'ation/x-dtbresource+xml'';'||wwv_flow.LF||
'  mime_t(''dvi'') := ''application/x-dvi'';'||wwv_flow.LF||
'  mime_t(''evy'') := ''application/x-';
wwv_flow_imp.g_varchar2_table(1929) := 'envoy'';'||wwv_flow.LF||
'  mime_t(''eva'') := ''application/x-eva'';'||wwv_flow.LF||
'  mime_t(''bdf'') := ''application/x-font-bdf'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1930) := 't(''gsf'') := ''application/x-font-ghostscript'';'||wwv_flow.LF||
'  mime_t(''psf'') := ''application/x-font-linux-psf'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1931) := 'ime_t(''pcf'') := ''application/x-font-pcf'';'||wwv_flow.LF||
'  mime_t(''snf'') := ''application/x-font-snf'';'||wwv_flow.LF||
'  mime_t(''pfa';
wwv_flow_imp.g_varchar2_table(1932) := ''') := ''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''pfb'') := ''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''pfm'') := ';
wwv_flow_imp.g_varchar2_table(1933) := '''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''afm'') := ''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''arc'') := ''appli';
wwv_flow_imp.g_varchar2_table(1934) := 'cation/x-freearc'';'||wwv_flow.LF||
'  mime_t(''spl'') := ''application/x-futuresplash'';'||wwv_flow.LF||
'  mime_t(''gca'') := ''application/';
wwv_flow_imp.g_varchar2_table(1935) := 'x-gca-compressed'';'||wwv_flow.LF||
'  mime_t(''ulx'') := ''application/x-glulx'';'||wwv_flow.LF||
'  mime_t(''gnumeric'') := ''application/x-';
wwv_flow_imp.g_varchar2_table(1936) := 'gnumeric'';'||wwv_flow.LF||
'  mime_t(''gramps'') := ''application/x-gramps-xml'';'||wwv_flow.LF||
'  mime_t(''gtar'') := ''application/x-gtar';
wwv_flow_imp.g_varchar2_table(1937) := ''';'||wwv_flow.LF||
'  mime_t(''hdf'') := ''application/x-hdf'';'||wwv_flow.LF||
'  mime_t(''install'') := ''application/x-install-instruction';
wwv_flow_imp.g_varchar2_table(1938) := 's'';'||wwv_flow.LF||
'  mime_t(''iso'') := ''application/x-iso9660-image'';'||wwv_flow.LF||
'  mime_t(''jnlp'') := ''application/x-java-jnlp-f';
wwv_flow_imp.g_varchar2_table(1939) := 'ile'';'||wwv_flow.LF||
'  mime_t(''latex'') := ''application/x-latex'';'||wwv_flow.LF||
'  mime_t(''lzh'') := ''application/x-lzh-compressed'';';
wwv_flow_imp.g_varchar2_table(1940) := ''||wwv_flow.LF||
'  mime_t(''lha'') := ''application/x-lzh-compressed'';'||wwv_flow.LF||
'  mime_t(''mie'') := ''application/x-mie'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1941) := '(''prc'') := ''application/x-mobipocket-ebook'';'||wwv_flow.LF||
'  mime_t(''mobi'') := ''application/x-mobipocket-ebook'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1942) := ' mime_t(''application'') := ''application/x-ms-application'';'||wwv_flow.LF||
'  mime_t(''lnk'') := ''application/x-ms-short';
wwv_flow_imp.g_varchar2_table(1943) := 'cut'';'||wwv_flow.LF||
'  mime_t(''wmd'') := ''application/x-ms-wmd'';'||wwv_flow.LF||
'  mime_t(''wmz'') := ''application/x-ms-wmz'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1944) := '(''xbap'') := ''application/x-ms-xbap'';'||wwv_flow.LF||
'  mime_t(''mdb'') := ''application/x-msaccess'';'||wwv_flow.LF||
'  mime_t(''obd'') :=';
wwv_flow_imp.g_varchar2_table(1945) := ' ''application/x-msbinder'';'||wwv_flow.LF||
'  mime_t(''crd'') := ''application/x-mscardfile'';'||wwv_flow.LF||
'  mime_t(''clp'') := ''applic';
wwv_flow_imp.g_varchar2_table(1946) := 'ation/x-msclip'';'||wwv_flow.LF||
'  mime_t(''exe'') := ''application/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''dll'') := ''application/x-ms';
wwv_flow_imp.g_varchar2_table(1947) := 'download'';'||wwv_flow.LF||
'  mime_t(''com'') := ''application/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''bat'') := ''application/x-msdownlo';
wwv_flow_imp.g_varchar2_table(1948) := 'ad'';'||wwv_flow.LF||
'  mime_t(''msi'') := ''application/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''mvb'') := ''application/x-msmediaview'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1949) := '  mime_t(''m13'') := ''application/x-msmediaview'';'||wwv_flow.LF||
'  mime_t(''m14'') := ''application/x-msmediaview'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1950) := 'me_t(''wmf'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''wmz'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1951) := 'emf'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''emz'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''mny'') ';
wwv_flow_imp.g_varchar2_table(1952) := ':= ''application/x-msmoney'';'||wwv_flow.LF||
'  mime_t(''pub'') := ''application/x-mspublisher'';'||wwv_flow.LF||
'  mime_t(''scd'') := ''appl';
wwv_flow_imp.g_varchar2_table(1953) := 'ication/x-msschedule'';'||wwv_flow.LF||
'  mime_t(''trm'') := ''application/x-msterminal'';'||wwv_flow.LF||
'  mime_t(''wri'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1954) := 'n/x-mswrite'';'||wwv_flow.LF||
'  mime_t(''nc'') := ''application/x-netcdf'';'||wwv_flow.LF||
'  mime_t(''cdf'') := ''application/x-netcdf'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1955) := ' mime_t(''nzb'') := ''application/x-nzb'';'||wwv_flow.LF||
'  mime_t(''p12'') := ''application/x-pkcs12'';'||wwv_flow.LF||
'  mime_t(''pfx'') :=';
wwv_flow_imp.g_varchar2_table(1956) := ' ''application/x-pkcs12'';'||wwv_flow.LF||
'  mime_t(''p7b'') := ''application/x-pkcs7-certificates'';'||wwv_flow.LF||
'  mime_t(''spc'') := ''';
wwv_flow_imp.g_varchar2_table(1957) := 'application/x-pkcs7-certificates'';'||wwv_flow.LF||
'  mime_t(''p7r'') := ''application/x-pkcs7-certreqresp'';'||wwv_flow.LF||
'  mime_t(''r';
wwv_flow_imp.g_varchar2_table(1958) := 'ar'') := ''application/x-rar-compressed'';'||wwv_flow.LF||
'  mime_t(''ris'') := ''application/x-research-info-systems'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1959) := 'mime_t(''sh'') := ''application/x-sh'';'||wwv_flow.LF||
'  mime_t(''shar'') := ''application/x-shar'';'||wwv_flow.LF||
'  mime_t(''swf'') := ''ap';
wwv_flow_imp.g_varchar2_table(1960) := 'plication/x-shockwave-flash'';'||wwv_flow.LF||
'  mime_t(''xap'') := ''application/x-silverlight-app'';'||wwv_flow.LF||
'  mime_t(''sql'') :=';
wwv_flow_imp.g_varchar2_table(1961) := ' ''application/x-sql'';'||wwv_flow.LF||
'  mime_t(''sit'') := ''application/x-stuffit'';'||wwv_flow.LF||
'  mime_t(''sitx'') := ''application/x';
wwv_flow_imp.g_varchar2_table(1962) := '-stuffitx'';'||wwv_flow.LF||
'  mime_t(''srt'') := ''application/x-subrip'';'||wwv_flow.LF||
'  mime_t(''sv4cpio'') := ''application/x-sv4cpio';
wwv_flow_imp.g_varchar2_table(1963) := ''';'||wwv_flow.LF||
'  mime_t(''sv4crc'') := ''application/x-sv4crc'';'||wwv_flow.LF||
'  mime_t(''t3'') := ''application/x-t3vm-image'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1964) := 'e_t(''gam'') := ''application/x-tads'';'||wwv_flow.LF||
'  mime_t(''tar'') := ''application/x-tar'';'||wwv_flow.LF||
'  mime_t(''tcl'') := ''appl';
wwv_flow_imp.g_varchar2_table(1965) := 'ication/x-tcl'';'||wwv_flow.LF||
'  mime_t(''tex'') := ''application/x-tex'';'||wwv_flow.LF||
'  mime_t(''tfm'') := ''application/x-tex-tfm'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1966) := '  mime_t(''texinfo'') := ''application/x-texinfo'';'||wwv_flow.LF||
'  mime_t(''texi'') := ''application/x-texinfo'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1967) := 't(''obj'') := ''application/x-tgif'';'||wwv_flow.LF||
'  mime_t(''ustar'') := ''application/x-ustar'';'||wwv_flow.LF||
'  mime_t(''src'') := ''ap';
wwv_flow_imp.g_varchar2_table(1968) := 'plication/x-wais-source'';'||wwv_flow.LF||
'  mime_t(''der'') := ''application/x-x509-ca-cert'';'||wwv_flow.LF||
'  mime_t(''crt'') := ''appli';
wwv_flow_imp.g_varchar2_table(1969) := 'cation/x-x509-ca-cert'';'||wwv_flow.LF||
'  mime_t(''fig'') := ''application/x-xfig'';'||wwv_flow.LF||
'  mime_t(''xlf'') := ''application/x-x';
wwv_flow_imp.g_varchar2_table(1970) := 'liff+xml'';'||wwv_flow.LF||
'  mime_t(''xpi'') := ''application/x-xpinstall'';'||wwv_flow.LF||
'  mime_t(''xz'') := ''application/x-xz'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1971) := 'e_t(''z1'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z2'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z3'') :=';
wwv_flow_imp.g_varchar2_table(1972) := ' ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z4'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z5'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1973) := 'n/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z6'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z7'') := ''application/x-zmachine';
wwv_flow_imp.g_varchar2_table(1974) := ''';'||wwv_flow.LF||
'  mime_t(''z8'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''xaml'') := ''application/xaml+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1975) := '''xdf'') := ''application/xcap-diff+xml'';'||wwv_flow.LF||
'  mime_t(''xenc'') := ''application/xenc+xml'';'||wwv_flow.LF||
'  mime_t(''xhtml'')';
wwv_flow_imp.g_varchar2_table(1976) := ' := ''application/xhtml+xml'';'||wwv_flow.LF||
'  mime_t(''xht'') := ''application/xhtml+xml'';'||wwv_flow.LF||
'  mime_t(''xml'') := ''applica';
wwv_flow_imp.g_varchar2_table(1977) := 'tion/xml'';'||wwv_flow.LF||
'  mime_t(''xsl'') := ''application/xml'';'||wwv_flow.LF||
'  mime_t(''dtd'') := ''application/xml-dtd'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1978) := '''xop'') := ''application/xop+xml'';'||wwv_flow.LF||
'  mime_t(''xpl'') := ''application/xproc+xml'';'||wwv_flow.LF||
'  mime_t(''xslt'') := ''ap';
wwv_flow_imp.g_varchar2_table(1979) := 'plication/xslt+xml'';'||wwv_flow.LF||
'  mime_t(''xspf'') := ''application/xspf+xml'';'||wwv_flow.LF||
'  mime_t(''mxml'') := ''application/xv';
wwv_flow_imp.g_varchar2_table(1980) := '+xml'';'||wwv_flow.LF||
'  mime_t(''xhvml'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t(''xvml'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1981) := '(''xvm'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t(''yang'') := ''application/yang'';'||wwv_flow.LF||
'  mime_t(''yin'') := ''applica';
wwv_flow_imp.g_varchar2_table(1982) := 'tion/yin+xml'';'||wwv_flow.LF||
'  mime_t(''zip'') := ''application/zip'';'||wwv_flow.LF||
'  mime_t(''adp'') := ''audio/adpcm'';'||wwv_flow.LF||
'  mime_t(''au''';
wwv_flow_imp.g_varchar2_table(1983) := ') := ''audio/basic'';'||wwv_flow.LF||
'  mime_t(''snd'') := ''audio/basic'';'||wwv_flow.LF||
'  mime_t(''mid'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''mid';
wwv_flow_imp.g_varchar2_table(1984) := 'i'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''kar'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''rmi'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''m4a';
wwv_flow_imp.g_varchar2_table(1985) := ''') := ''audio/mp4'';'||wwv_flow.LF||
'  mime_t(''mp4a'') := ''audio/mp4'';'||wwv_flow.LF||
'  mime_t(''mpga'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''mp2''';
wwv_flow_imp.g_varchar2_table(1986) := ') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''mp2a'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''mp3'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''m2a''';
wwv_flow_imp.g_varchar2_table(1987) := ') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''m3a'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''oga'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''ogg'') ';
wwv_flow_imp.g_varchar2_table(1988) := ':= ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''spx'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''opus'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''s3m'') := ';
wwv_flow_imp.g_varchar2_table(1989) := '''audio/s3m'';'||wwv_flow.LF||
'  mime_t(''sil'') := ''audio/silk'';'||wwv_flow.LF||
'  mime_t(''uva'') := ''audio/vnd.dece.audio'';'||wwv_flow.LF||
'  mime_t(''u';
wwv_flow_imp.g_varchar2_table(1990) := 'vva'') := ''audio/vnd.dece.audio'';'||wwv_flow.LF||
'  mime_t(''eol'') := ''audio/vnd.digital-winds'';'||wwv_flow.LF||
'  mime_t(''dra'') := ''a';
wwv_flow_imp.g_varchar2_table(1991) := 'udio/vnd.dra'';'||wwv_flow.LF||
'  mime_t(''dts'') := ''audio/vnd.dts'';'||wwv_flow.LF||
'  mime_t(''dtshd'') := ''audio/vnd.dts.hd'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1992) := '(''lvp'') := ''audio/vnd.lucent.voice'';'||wwv_flow.LF||
'  mime_t(''pya'') := ''audio/vnd.ms-playready.media.pya'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1993) := '(''ecelp4800'') := ''audio/vnd.nuera.ecelp4800'';'||wwv_flow.LF||
'  mime_t(''ecelp7470'') := ''audio/vnd.nuera.ecelp7470'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1994) := '  mime_t(''ecelp9600'') := ''audio/vnd.nuera.ecelp9600'';'||wwv_flow.LF||
'  mime_t(''rip'') := ''audio/vnd.rip'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1995) := 'weba'') := ''audio/webm'';'||wwv_flow.LF||
'  mime_t(''aac'') := ''audio/x-aac'';'||wwv_flow.LF||
'  mime_t(''aif'') := ''audio/x-aiff'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1996) := 't(''aiff'') := ''audio/x-aiff'';'||wwv_flow.LF||
'  mime_t(''aifc'') := ''audio/x-aiff'';'||wwv_flow.LF||
'  mime_t(''caf'') := ''audio/x-caf'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1997) := ' mime_t(''flac'') := ''audio/x-flac'';'||wwv_flow.LF||
'  mime_t(''mka'') := ''audio/x-matroska'';'||wwv_flow.LF||
'  mime_t(''m3u'') := ''audio/';
wwv_flow_imp.g_varchar2_table(1998) := 'x-mpegurl'';'||wwv_flow.LF||
'  mime_t(''wax'') := ''audio/x-ms-wax'';'||wwv_flow.LF||
'  mime_t(''wma'') := ''audio/x-ms-wma'';'||wwv_flow.LF||
'  mime_t(''ram''';
wwv_flow_imp.g_varchar2_table(1999) := ') := ''audio/x-pn-realaudio'';'||wwv_flow.LF||
'  mime_t(''ra'') := ''audio/x-pn-realaudio'';'||wwv_flow.LF||
'  mime_t(''rmp'') := ''audio/x-p';
wwv_flow_imp.g_varchar2_table(2000) := 'n-realaudio-plugin'';'||wwv_flow.LF||
''||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2001) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_MIME";';
wwv_flow_imp.g_varchar2_table(2002) := ''||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_FILE"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2003) := '-----------------------------'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2004) := '----------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2005) := '--------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2006) := '-------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2007) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures ';
wwv_flow_imp.g_varchar2_table(2008) := 'and functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(2009) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure upload_to_da';
wwv_flow_imp.g_varchar2_table(2010) := 'tabase('||wwv_flow.LF||
'    p_file_name             in varchar2,'||wwv_flow.LF||
'    p_dir                   in varchar2,'||wwv_flow.LF||
'    p_mime';
wwv_flow_imp.g_varchar2_table(2011) := '_type             in varchar2,'||wwv_flow.LF||
'    p_file_size             in integer,'||wwv_flow.LF||
'    p_overwrite_file        i';
wwv_flow_imp.g_varchar2_table(2012) := 'n varchar2,'||wwv_flow.LF||
'    p_collection_name       in varchar2,'||wwv_flow.LF||
'    p_blob_content          in blob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2013) := '  l_file_path varchar2(2000);'||wwv_flow.LF||
'    l_file_desc varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''File n';
wwv_flow_imp.g_varchar2_table(2014) := 'ame to upload: %s'', p_file_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- format file path'||wwv_flow.LF||
'    l_file_path := format_file_path( p_f';
wwv_flow_imp.g_varchar2_table(2015) := 'ile_name, p_dir );'||wwv_flow.LF||
''||wwv_flow.LF||
'    case p_overwrite_file'||wwv_flow.LF||
'    when ''N'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        insert into';
wwv_flow_imp.g_varchar2_table(2016) := ' blog_files( file_path, file_size, mime_type, blob_content )'||wwv_flow.LF||
'          values( l_file_path, p_file_s';
wwv_flow_imp.g_varchar2_table(2017) := 'ize, p_mime_type, p_blob_content )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if file exists handle exception'||wwv_flow.LF||
'      excepti';
wwv_flow_imp.g_varchar2_table(2018) := 'on when dup_val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- create collection for storing file temporaly'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2019) := '-- we prompt user to confirm file overwrite'||wwv_flow.LF||
'        -- and show file information e.g. name and possi';
wwv_flow_imp.g_varchar2_table(2020) := 'ble description from collection'||wwv_flow.LF||
'        -- then if user confirms, we can overwrite file using data s';
wwv_flow_imp.g_varchar2_table(2021) := 'tored in collection'||wwv_flow.LF||
'        if not apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'        th';
wwv_flow_imp.g_varchar2_table(2022) := 'en'||wwv_flow.LF||
'          apex_collection.create_collection( p_collection_name );'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file';
wwv_flow_imp.g_varchar2_table(2023) := '_desc := get_file_desc( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- store file lob and other info to collection'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2024) := '   apex_collection.add_member('||wwv_flow.LF||
'          p_collection_name => p_collection_name'||wwv_flow.LF||
'        , p_c001    ';
wwv_flow_imp.g_varchar2_table(2025) := '        => l_file_path'||wwv_flow.LF||
'        , p_c002            => l_file_desc'||wwv_flow.LF||
'        , p_c003            => p_m';
wwv_flow_imp.g_varchar2_table(2026) := 'ime_type'||wwv_flow.LF||
'        , p_n001            => p_file_size'||wwv_flow.LF||
'        , p_blob001         => p_blob_content'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2027) := '      );'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    when ''Y'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- merge file info to blog_files'||wwv_flow.LF||
'      merge into ';
wwv_flow_imp.g_varchar2_table(2028) := 'blog_files t1'||wwv_flow.LF||
'      using dual on ( t1.file_path = l_file_path )'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2029) := ' insert( file_path, file_size, mime_type, blob_content )'||wwv_flow.LF||
'          values( l_file_path, p_file_size,';
wwv_flow_imp.g_varchar2_table(2030) := ' p_mime_type, p_blob_content )'||wwv_flow.LF||
'      when matched then'||wwv_flow.LF||
'        update set'||wwv_flow.LF||
'          file_size     = ';
wwv_flow_imp.g_varchar2_table(2031) := 'p_file_size'||wwv_flow.LF||
'        , mime_type     = p_mime_type'||wwv_flow.LF||
'        , blob_content  = p_blob_content'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2032) := '    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_to_database;'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2033) := '---------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2034) := '--'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2035) := '------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2036) := '  function get_zip_name return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_';
wwv_flow_imp.g_varchar2_table(2037) := 'message => ''%s.zip'''||wwv_flow.LF||
'      , p0 =>'||wwv_flow.LF||
'          apex_string_util.get_slug('||wwv_flow.LF||
'            p_string => lower';
wwv_flow_imp.g_varchar2_table(2038) := '( ''blog_files'' )'||wwv_flow.LF||
'          , p_hash_length => 6'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end get_zip_name;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2039) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2040) := '-------------------------------------------------------'||wwv_flow.LF||
'  function format_file_path('||wwv_flow.LF||
'    p_file_name';
wwv_flow_imp.g_varchar2_table(2041) := ' in varchar2,'||wwv_flow.LF||
'    p_dir       in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_path varchar2(2000);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2042) := '   l_dir       varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Formating file name %s, dir %s'', p_fil';
wwv_flow_imp.g_varchar2_table(2043) := 'e_name, p_dir );'||wwv_flow.LF||
'    -- format file path'||wwv_flow.LF||
'    l_dir := utl_url.escape( trim( trim( both ''/'' from p_di';
wwv_flow_imp.g_varchar2_table(2044) := 'r ) ) );'||wwv_flow.LF||
'    l_file_path := utl_url.escape( trim( regexp_replace( p_file_name, ''\s+'', ''_'' ) ) );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2045) := ' l_file_path :='||wwv_flow.LF||
'      case when l_dir is null'||wwv_flow.LF||
'        then l_file_path'||wwv_flow.LF||
'        else l_dir || ''/'' || ';
wwv_flow_imp.g_varchar2_table(2046) := 'l_file_path'||wwv_flow.LF||
'      end'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Formated file path: %s'', l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    retu';
wwv_flow_imp.g_varchar2_table(2047) := 'rn l_file_path;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end format_file_path;'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2048) := '---------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2049) := '--'||wwv_flow.LF||
'  function get_file_desc('||wwv_flow.LF||
'    p_file_path in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_desc va';
wwv_flow_imp.g_varchar2_table(2050) := 'rchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    -- fetch file description from database'||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1';
wwv_flow_imp.g_varchar2_table(2051) := '.file_desc'||wwv_flow.LF||
'      into l_file_desc'||wwv_flow.LF||
'      from blog_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and t1.file_path ';
wwv_flow_imp.g_varchar2_table(2052) := '= p_file_path'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    exception when no_data_found'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_file_desc := null;'||wwv_flow.LF||
'    end;';
wwv_flow_imp.g_varchar2_table(2053) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_file_desc;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_file_desc;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2054) := '----------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2055) := '---------'||wwv_flow.LF||
'  procedure upload_file('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'    p_dir               in v';
wwv_flow_imp.g_varchar2_table(2056) := 'archar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2057) := '_overwrite_file    in varchar2 default ''N'''||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_names    apex_t_varchar2;'||wwv_flow.LF||
'    l_file_';
wwv_flow_imp.g_varchar2_table(2058) := 'name     varchar2(500);'||wwv_flow.LF||
'    l_mime_type     varchar2(500);'||wwv_flow.LF||
'    l_file_size     integer;'||wwv_flow.LF||
'    l_zip_di';
wwv_flow_imp.g_varchar2_table(2059) := 'r       apex_zip.t_dir_entries;'||wwv_flow.LF||
'    l_zip_file_path varchar2(32767);'||wwv_flow.LF||
'    l_unzipped      blob := emp';
wwv_flow_imp.g_varchar2_table(2060) := 'ty_blob();'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      ape';
wwv_flow_imp.g_varchar2_table(2061) := 'x_collection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get file names'||wwv_flow.LF||
'    l_file_n';
wwv_flow_imp.g_varchar2_table(2062) := 'ames :='||wwv_flow.LF||
'      apex_string.split('||wwv_flow.LF||
'        p_str => p_file_names'||wwv_flow.LF||
'      , p_sep => '':'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2063) := '   -- loop file'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        files.filename'||wwv_flow.LF||
'      , files.mime_type'||wwv_flow.LF||
'      , f';
wwv_flow_imp.g_varchar2_table(2064) := 'iles.blob_content'||wwv_flow.LF||
'      from apex_application_temp_files files'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2065) := '       select 1'||wwv_flow.LF||
'        from table( l_file_names ) x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.column_va';
wwv_flow_imp.g_varchar2_table(2066) := 'lue = files.name'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Processing file %s : %s'''||wwv_flow.LF||
'      , c1.fil';
wwv_flow_imp.g_varchar2_table(2067) := 'ename'||wwv_flow.LF||
'      , c1.mime_type'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_extract = ''Y'''||wwv_flow.LF||
'      and c1.mime_type = ''application/';
wwv_flow_imp.g_varchar2_table(2068) := 'zip'''||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_dir :='||wwv_flow.LF||
'          apex_zip.get_dir_entries('||wwv_flow.LF||
'            p_zipped_blob ';
wwv_flow_imp.g_varchar2_table(2069) := '=> c1.blob_content'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_file_path := l_zip_dir.first;'||wwv_flow.LF||
''||wwv_flow.LF||
'        while';
wwv_flow_imp.g_varchar2_table(2070) := ' l_zip_file_path is not null'||wwv_flow.LF||
'        loop'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_unzipped :='||wwv_flow.LF||
'            apex_zip.get_file_con';
wwv_flow_imp.g_varchar2_table(2071) := 'tent('||wwv_flow.LF||
'              p_zipped_blob => c1.blob_content'||wwv_flow.LF||
'            , p_dir_entry   => l_zip_dir( l_zip';
wwv_flow_imp.g_varchar2_table(2072) := '_file_path )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_mime_type := blog_mime.get_mime_type( l_zip_file';
wwv_flow_imp.g_varchar2_table(2073) := '_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_file_size := dbms_lob.getlength( l_unzipped );'||wwv_flow.LF||
''||wwv_flow.LF||
'          upload_to_database('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2074) := '            p_file_name         => l_zip_file_path'||wwv_flow.LF||
'          , p_dir               => p_dir'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2075) := '  , p_mime_type         => l_mime_type'||wwv_flow.LF||
'          , p_file_size         => l_file_size'||wwv_flow.LF||
'          , p_';
wwv_flow_imp.g_varchar2_table(2076) := 'overwrite_file    => p_overwrite_file'||wwv_flow.LF||
'          , p_collection_name   => p_collection_name'||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2077) := ' , p_blob_content      => l_unzipped'||wwv_flow.LF||
'          );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_zip_file_path := l_zip_dir.next( l_zi';
wwv_flow_imp.g_varchar2_table(2078) := 'p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_size := dbms_lob.getlength( c1.blob_co';
wwv_flow_imp.g_varchar2_table(2079) := 'ntent );'||wwv_flow.LF||
''||wwv_flow.LF||
'        upload_to_database('||wwv_flow.LF||
'          p_file_name         => c1.filename'||wwv_flow.LF||
'        , p_dir  ';
wwv_flow_imp.g_varchar2_table(2080) := '             => p_dir'||wwv_flow.LF||
'        , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'        , p_file_size         =>';
wwv_flow_imp.g_varchar2_table(2081) := ' l_file_size'||wwv_flow.LF||
'        , p_overwrite_file    => p_overwrite_file'||wwv_flow.LF||
'        , p_collection_name   => p_co';
wwv_flow_imp.g_varchar2_table(2082) := 'llection_name'||wwv_flow.LF||
'        , p_blob_content      => c1.blob_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end lo';
wwv_flow_imp.g_varchar2_table(2083) := 'op;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_file;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2084) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure re';
wwv_flow_imp.g_varchar2_table(2085) := 'place_file('||wwv_flow.LF||
'    p_collection_name in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2086) := 'c001    as file_path'||wwv_flow.LF||
'      , c002    as file_desc'||wwv_flow.LF||
'      , c003    as mime_type'||wwv_flow.LF||
'      , n001    as fi';
wwv_flow_imp.g_varchar2_table(2087) := 'le_size'||wwv_flow.LF||
'      , blob001 as blob_content'||wwv_flow.LF||
'      from apex_collections'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and co';
wwv_flow_imp.g_varchar2_table(2088) := 'llection_name = p_collection_name'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_database('||wwv_flow.LF||
'        p_file_name         ';
wwv_flow_imp.g_varchar2_table(2089) := '=> c1.file_path'||wwv_flow.LF||
'      , p_dir               => null'||wwv_flow.LF||
'      , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2090) := '  , p_file_size         => c1.file_size'||wwv_flow.LF||
'      , p_overwrite_file    => ''Y'''||wwv_flow.LF||
'      , p_collection_name';
wwv_flow_imp.g_varchar2_table(2091) := '   => p_collection_name'||wwv_flow.LF||
'      , p_blob_content      => c1.blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2092) := 'if apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_coll';
wwv_flow_imp.g_varchar2_table(2093) := 'ection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end replace_file;'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(2094) := '------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2095) := '-----------------------'||wwv_flow.LF||
'  procedure file_select_collection('||wwv_flow.LF||
'    p_collection_name in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2096) := '_seq_id          in number,'||wwv_flow.LF||
'    p_id              in number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_seq number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2097) := '-- create collection if not exists'||wwv_flow.LF||
'    if not apex_collection.collection_exists( p_collection_name )';
wwv_flow_imp.g_varchar2_table(2098) := ''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.create_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if no se';
wwv_flow_imp.g_varchar2_table(2099) := 'q_id from Ajax call, save file id/name to collection'||wwv_flow.LF||
'    if trim( p_seq_id ) is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2100) := 'l_seq := apex_collection.add_member('||wwv_flow.LF||
'        p_collection_name => p_collection_name'||wwv_flow.LF||
'      , p_n001 =';
wwv_flow_imp.g_varchar2_table(2101) := '> p_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    -- if seq_id exists, delete row from collection'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_collection.d';
wwv_flow_imp.g_varchar2_table(2102) := 'elete_member('||wwv_flow.LF||
'        p_collection_name => p_collection_name'||wwv_flow.LF||
'      , p_seq => p_seq_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2103) := 'end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- write header for the output'||wwv_flow.LF||
'    apex_plugin_util.print_json_http_header;'||wwv_flow.LF||
'    -- writ';
wwv_flow_imp.g_varchar2_table(2104) := 'e seq_id to output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write('||wwv_flow.LF||
'      p_name        => ''seq'''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2105) := ', p_value       => l_seq'||wwv_flow.LF||
'    , p_write_null  => true'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception wh';
wwv_flow_imp.g_varchar2_table(2106) := 'en others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    -- if error happens'||wwv_flow.LF||
'    -- write header for the output'||wwv_flow.LF||
'    apex_debug.error( ''S';
wwv_flow_imp.g_varchar2_table(2107) := 'elect file failed: %s'', sqlerrm );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_plugin_util.print_json_http_header;'||wwv_flow.LF||
'    -- write error ';
wwv_flow_imp.g_varchar2_table(2108) := 'message to output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write('||wwv_flow.LF||
'      p_name  => ''status'''||wwv_flow.LF||
'    , p_';
wwv_flow_imp.g_varchar2_table(2109) := 'value => apex_lang.get_message( ''BLOG_GENERIC_ERROR'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end file_s';
wwv_flow_imp.g_varchar2_table(2110) := 'elect_collection;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(2111) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure delete_s';
wwv_flow_imp.g_varchar2_table(2112) := 'elected_files('||wwv_flow.LF||
'    p_collection_name in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- delete selected files'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2113) := 'delete'||wwv_flow.LF||
'    from blog_files t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'        from apex_col';
wwv_flow_imp.g_varchar2_table(2114) := 'lections x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.collection_name = p_collection_name'||wwv_flow.LF||
'          and x';
wwv_flow_imp.g_varchar2_table(2115) := '1.n001 = t1.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- truncate collection'||wwv_flow.LF||
'    apex_collection.truncate_collection( p_c';
wwv_flow_imp.g_varchar2_table(2116) := 'ollection_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_selected_files;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2117) := '----------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2118) := '---------'||wwv_flow.LF||
'  procedure download_selected_files('||wwv_flow.LF||
'    p_collection_name in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file';
wwv_flow_imp.g_varchar2_table(2119) := '_cnt      pls_integer := 0;'||wwv_flow.LF||
'    l_file_name     varchar2(256);'||wwv_flow.LF||
'    l_content_type  varchar2(256);'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2120) := '  l_blob_content  blob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- fetch selected files'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.f';
wwv_flow_imp.g_varchar2_table(2121) := 'ile_path'||wwv_flow.LF||
'      , t1.file_name'||wwv_flow.LF||
'      , t1.mime_type'||wwv_flow.LF||
'      , t1.blob_content'||wwv_flow.LF||
'      , count(1) over() a';
wwv_flow_imp.g_varchar2_table(2122) := 's num_rows'||wwv_flow.LF||
'      from blog_v_all_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2123) := '         from apex_collections x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.collection_name = p_colle';
wwv_flow_imp.g_varchar2_table(2124) := 'ction_name'||wwv_flow.LF||
'            and x1.n001 = t1.id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    )loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_file_cnt := c1.num_rows;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2125) := '    if l_file_cnt = 1'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        l_file_name     := c1.file_name;'||wwv_flow.LF||
'        l_content_type  :=';
wwv_flow_imp.g_varchar2_table(2126) := ' c1.mime_type;'||wwv_flow.LF||
'        l_blob_content  := c1.blob_content;'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- add file to zip'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2127) := '     apex_zip.add_file('||wwv_flow.LF||
'          p_zipped_blob => l_blob_content'||wwv_flow.LF||
'        , p_file_name   => c1.file';
wwv_flow_imp.g_varchar2_table(2128) := '_path'||wwv_flow.LF||
'        , p_content     => c1.blob_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_f';
wwv_flow_imp.g_varchar2_table(2129) := 'ile_cnt = 0'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- TO DO: raise error here'||wwv_flow.LF||
'      null;'||wwv_flow.LF||
'    elsif l_file_cnt > 1'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2130) := ''||wwv_flow.LF||
'      -- get zip name'||wwv_flow.LF||
'      l_file_name := get_zip_name;'||wwv_flow.LF||
'      -- set content type'||wwv_flow.LF||
'      l_content_';
wwv_flow_imp.g_varchar2_table(2131) := 'type := ''application/zip'';'||wwv_flow.LF||
'      -- close zip'||wwv_flow.LF||
'      apex_zip.finish('||wwv_flow.LF||
'        p_zipped_blob => l_blob';
wwv_flow_imp.g_varchar2_table(2132) := '_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- download file/zip'||wwv_flow.LF||
'    apex_http.download('||wwv_flow.LF||
'      p_blob       ';
wwv_flow_imp.g_varchar2_table(2133) := '   => l_blob_content'||wwv_flow.LF||
'    , p_content_type  => l_content_type'||wwv_flow.LF||
'    , p_filename      => l_file_name'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2134) := '  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_selected_files;'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2135) := '-----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'e';
wwv_flow_imp.g_varchar2_table(2136) := 'nd "BLOG_FILE";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_UTIL"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(2137) := '--------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2138) := '-------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2139) := '-----------------------------------------'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2140) := '----------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2141) := '-----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Priv';
wwv_flow_imp.g_varchar2_table(2142) := 'ate procedures and functions'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2143) := '---------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(2144) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(2145) := '------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(2146) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(2147) := '---------------------------------------------------------'||wwv_flow.LF||
'  function remove_whitespace('||wwv_flow.LF||
'    p_string';
wwv_flow_imp.g_varchar2_table(2148) := '  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove whitespace characters from string'||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2149) := 'eturn trim( regexp_replace( p_string, ''\s+'', '' '' ) );'||wwv_flow.LF||
'  end remove_whitespace;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2150) := '-----------------------------------------------------------'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(2151) := '----------------------------------------'||wwv_flow.LF||
'  procedure raise_http_error('||wwv_flow.LF||
'    p_error_code  in number'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2152) := ' )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- output HTTP status'||wwv_flow.LF||
'    owa_util.status_line( p_error_code );'||wwv_flow.LF||
'    -- stop APEX';
wwv_flow_imp.g_varchar2_table(2153) := ''||wwv_flow.LF||
'    apex_application.stop_apex_engine;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
'  end raise_http_';
wwv_flow_imp.g_varchar2_table(2154) := 'error;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(2155) := '--------------------------------------------------------------------'||wwv_flow.LF||
'  function apex_error_handler('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2156) := '    p_error in apex_error.t_error'||wwv_flow.LF||
'  ) return apex_error.t_error_result'||wwv_flow.LF||
'  as'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_genereric_error c';
wwv_flow_imp.g_varchar2_table(2157) := 'onstant varchar2(255) := ''BLOG_GENERIC_ERROR'';'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_result          apex_error.t_error_result;'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2158) := ' l_reference_id    pls_integer;'||wwv_flow.LF||
'    l_constraint_name varchar2(255);'||wwv_flow.LF||
'    l_err_mesg        varchar2(';
wwv_flow_imp.g_varchar2_table(2159) := '32700);'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- This function must be used to ensure initialization is compatible'||wwv_flow.LF||
'    -- wi';
wwv_flow_imp.g_varchar2_table(2160) := 'th future changes to t_error_result.'||wwv_flow.LF||
'    l_result :='||wwv_flow.LF||
'      apex_error.init_error_result('||wwv_flow.LF||
'        p_e';
wwv_flow_imp.g_varchar2_table(2161) := 'rror => p_error'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- If it''s an internal error raised by APEX, like an invalid state';
wwv_flow_imp.g_varchar2_table(2162) := 'ment or'||wwv_flow.LF||
'    -- code which can''t be executed, the error text might contain security sensitive'||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2163) := 'information. To avoid this security problem we can rewrite the error to'||wwv_flow.LF||
'    -- a generic error messa';
wwv_flow_imp.g_varchar2_table(2164) := 'ge and log the original error message for further'||wwv_flow.LF||
'    -- investigation by the help desk.'||wwv_flow.LF||
'    if p_er';
wwv_flow_imp.g_varchar2_table(2165) := 'ror.is_internal_error'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      if not p_error.is_common_runtime_error'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- Ch';
wwv_flow_imp.g_varchar2_table(2166) := 'ange the message to the generic error message which doesn''t expose'||wwv_flow.LF||
'        -- any sensitive informat';
wwv_flow_imp.g_varchar2_table(2167) := 'ion.'||wwv_flow.LF||
'        l_result.message :='||wwv_flow.LF||
'          apex_lang.get_message('||wwv_flow.LF||
'            p_name => l_genereric_';
wwv_flow_imp.g_varchar2_table(2168) := 'error'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_result.additional_info := null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2169) := '-- If it''s a constraint violation like'||wwv_flow.LF||
'      --'||wwv_flow.LF||
'      --   -) ORA-02292 ORA-02291 ORA-02290 ORA-0209';
wwv_flow_imp.g_varchar2_table(2170) := '1 ORA-00001: unique constraint violated'||wwv_flow.LF||
'      --   -) : transaction rolled back (-> can hide a defer';
wwv_flow_imp.g_varchar2_table(2171) := 'red constraint)'||wwv_flow.LF||
'      --   -) : check constraint violated'||wwv_flow.LF||
'      --   -) : integrity constraint viola';
wwv_flow_imp.g_varchar2_table(2172) := 'ted - parent key not found'||wwv_flow.LF||
'      --   -) : integrity constraint violated - child record found'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2173) := '--'||wwv_flow.LF||
'      -- we try to get a friendly error message from our constraint lookup configuration.'||wwv_flow.LF||
'      -';
wwv_flow_imp.g_varchar2_table(2174) := '- If we don''t find the constraint in our lookup table we fallback to'||wwv_flow.LF||
'      -- the original ORA error';
wwv_flow_imp.g_varchar2_table(2175) := ' message.'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292)'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        l_con';
wwv_flow_imp.g_varchar2_table(2176) := 'straint_name :='||wwv_flow.LF||
'          apex_error.extract_constraint_name('||wwv_flow.LF||
'            p_error => p_error'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2177) := '   )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_err_mesg :='||wwv_flow.LF||
'          apex_lang.get_message('||wwv_flow.LF||
'            p_name => l_constr';
wwv_flow_imp.g_varchar2_table(2178) := 'aint_name'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        -- not every constraint has to be in our lookup table'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2179) := '  if not l_err_mesg = l_constraint_name'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          l_result.message := l_err_mesg;'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2180) := '     l_result.additional_info := null;'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- If an ORA error has b';
wwv_flow_imp.g_varchar2_table(2181) := 'een raised, for example a raise_application_error(-20xxx, ''...'')'||wwv_flow.LF||
'      -- in a table trigger or in a';
wwv_flow_imp.g_varchar2_table(2182) := ' PL/SQL package called by a process and we'||wwv_flow.LF||
'      -- haven''t found the error in our lookup table, the';
wwv_flow_imp.g_varchar2_table(2183) := 'n we just want to see'||wwv_flow.LF||
'      -- the actual error text and not the full error stack with all the ORA e';
wwv_flow_imp.g_varchar2_table(2184) := 'rror numbers.'||wwv_flow.LF||
'      if p_error.ora_sqlcode is not null'||wwv_flow.LF||
'      and l_result.message = p_error.message'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2185) := '      then'||wwv_flow.LF||
'        l_result.message :='||wwv_flow.LF||
'          apex_error.get_first_ora_error_text('||wwv_flow.LF||
'            p_';
wwv_flow_imp.g_varchar2_table(2186) := 'error => p_error'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_result.additional_info := null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2187) := '  -- If no associated page item/tabular form column has been set, we can use'||wwv_flow.LF||
'      -- apex_error.aut';
wwv_flow_imp.g_varchar2_table(2188) := 'o_set_associated_item to automatically guess the affected'||wwv_flow.LF||
'      -- error field by examine the ORA er';
wwv_flow_imp.g_varchar2_table(2189) := 'ror for constraint names or column names.'||wwv_flow.LF||
'      if l_result.page_item_name is null'||wwv_flow.LF||
'      and l_resul';
wwv_flow_imp.g_varchar2_table(2190) := 't.column_alias is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_error.auto_set_associated_item('||wwv_flow.LF||
'          p_error => ';
wwv_flow_imp.g_varchar2_table(2191) := 'p_error'||wwv_flow.LF||
'        , p_error_result => l_result'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_res';
wwv_flow_imp.g_varchar2_table(2192) := 'ult;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end apex_error_handler;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2193) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  func';
wwv_flow_imp.g_varchar2_table(2194) := 'tion int_to_vc2('||wwv_flow.LF||
'    p_value in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- convert number to str';
wwv_flow_imp.g_varchar2_table(2195) := 'ing without decimals'||wwv_flow.LF||
'    return to_char( p_value,  ''fm99999999999999999999999999999999999999'' );'||wwv_flow.LF||
'  e';
wwv_flow_imp.g_varchar2_table(2196) := 'nd int_to_vc2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(2197) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_attribut';
wwv_flow_imp.g_varchar2_table(2198) := 'e_value('||wwv_flow.LF||
'    p_attribute_name in varchar2'||wwv_flow.LF||
'  ) return varchar2 result_cache'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_value blog_set';
wwv_flow_imp.g_varchar2_table(2199) := 'tings.attribute_value%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter p_attribute_name ';
wwv_flow_imp.g_varchar2_table(2200) := 'is null'||wwv_flow.LF||
'    if p_attribute_name is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch an';
wwv_flow_imp.g_varchar2_table(2201) := 'd return value from settings table'||wwv_flow.LF||
'    select attribute_value'||wwv_flow.LF||
'    into l_value'||wwv_flow.LF||
'    from blog_setting';
wwv_flow_imp.g_varchar2_table(2202) := 's'||wwv_flow.LF||
'    where attribute_name = p_attribute_name'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info('||wwv_flow.LF||
'      p_message => ''Fetch ';
wwv_flow_imp.g_varchar2_table(2203) := 'attribute %s return: %s'''||wwv_flow.LF||
'    , p0 => p_attribute_name'||wwv_flow.LF||
'    , p1 => l_value'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return attr';
wwv_flow_imp.g_varchar2_table(2204) := 'ibute value'||wwv_flow.LF||
'    return l_value;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- Handle error cases'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(2205) := 'debug.error('||wwv_flow.LF||
'       p_message => ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'      ,p0 => sqlerrm'||wwv_flow.LF||
'      ,p1 => utl_ca';
wwv_flow_imp.g_varchar2_table(2206) := 'll_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p2 => ''p_attribute_name'''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2207) := ',p3 => coalesce( p_attribute_name, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_attribute_value;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(2208) := '------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(2209) := '-----------------------------------------------------'||wwv_flow.LF||
'  procedure initialize_items('||wwv_flow.LF||
'    p_app_id in ';
wwv_flow_imp.g_varchar2_table(2210) := 'varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_app_id blog_v_init_items.application_id%type;'||wwv_flow.LF||
''||wwv_flow.LF||
'    type item_value_r is reco';
wwv_flow_imp.g_varchar2_table(2211) := 'rd('||wwv_flow.LF||
'      item_name   blog_v_init_items.item_name%type,'||wwv_flow.LF||
'      item_value  blog_v_init_items.attribut';
wwv_flow_imp.g_varchar2_table(2212) := 'e_value%type'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    type items_t is table of item_value_r;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_init_items items_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2213) := ''||wwv_flow.LF||
'    apex_debug.enter('||wwv_flow.LF||
'      p_routine_name  => ''blog_util.initialize_items'''||wwv_flow.LF||
'    , p_name01        =';
wwv_flow_imp.g_varchar2_table(2214) := '> ''p_app_id'''||wwv_flow.LF||
'    , p_value01       => p_app_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter';
wwv_flow_imp.g_varchar2_table(2215) := ' p_app_id_name is null'||wwv_flow.LF||
'    if p_app_id is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- c';
wwv_flow_imp.g_varchar2_table(2216) := 'onver application id string to number'||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch items and';
wwv_flow_imp.g_varchar2_table(2217) := ' values that session state need to be set'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      v1.item_name'||wwv_flow.LF||
'    , v1.attribute_value'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2218) := ' bulk collect into l_init_items'||wwv_flow.LF||
'    from blog_v_init_items v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.applicati';
wwv_flow_imp.g_varchar2_table(2219) := 'on_id = l_app_id'||wwv_flow.LF||
'      and ('||wwv_flow.LF||
'        v1.attribute_value != v1.session_value'||wwv_flow.LF||
'        or( v1.attribute';
wwv_flow_imp.g_varchar2_table(2220) := '_value is null and v1.session_value is not null )'||wwv_flow.LF||
'        or( v1.attribute_value is not null and v1.';
wwv_flow_imp.g_varchar2_table(2221) := 'session_value is null )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_init_items.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      -- set it';
wwv_flow_imp.g_varchar2_table(2222) := 'em session state. do not commit.'||wwv_flow.LF||
'      apex_util.set_session_state('||wwv_flow.LF||
'        p_name    => l_init_item';
wwv_flow_imp.g_varchar2_table(2223) := 's(i).item_name'||wwv_flow.LF||
'      , p_value   => l_init_items(i).item_value'||wwv_flow.LF||
'      , p_commit  => false'||wwv_flow.LF||
'      );'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2224) := '   end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''Error: %s';
wwv_flow_imp.g_varchar2_table(2225) := '. %s( %s => %s )'''||wwv_flow.LF||
'      ,p0 => sqlerrm'||wwv_flow.LF||
'      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_s';
wwv_flow_imp.g_varchar2_table(2226) := 'tack.subprogram(1))'||wwv_flow.LF||
'      ,p2 => ''p_app_id'''||wwv_flow.LF||
'      ,p3 => coalesce( p_app_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2227) := 'raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end initialize_items;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2228) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  proc';
wwv_flow_imp.g_varchar2_table(2229) := 'edure get_post_details('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_post_title      out nocopy varchar2';
wwv_flow_imp.g_varchar2_table(2230) := ','||wwv_flow.LF||
'    p_post_desc       out nocopy varchar2,'||wwv_flow.LF||
'    p_post_category   out nocopy varchar2,'||wwv_flow.LF||
'    p_post_a';
wwv_flow_imp.g_varchar2_table(2231) := 'uthor     out nocopy varchar2,'||wwv_flow.LF||
'    p_post_published  out nocopy varchar2,'||wwv_flow.LF||
'    p_post_modified   out ';
wwv_flow_imp.g_varchar2_table(2232) := 'nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_id    out nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_title out nocopy varchar';
wwv_flow_imp.g_varchar2_table(2233) := '2,'||wwv_flow.LF||
'    p_prev_post_id    out nocopy varchar2,'||wwv_flow.LF||
'    p_prev_post_title out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2234) := ' l_next_post_id  number;'||wwv_flow.LF||
'    l_prev_post_id  number;'||wwv_flow.LF||
'    l_post_id       blog_v_posts.post_id%type;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2235) := '    l_published_on  blog_v_posts.published_on%type;'||wwv_flow.LF||
'    l_changed_on    blog_v_posts.changed_on%type';
wwv_flow_imp.g_varchar2_table(2236) := ';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter p_post_id is null'||wwv_flow.LF||
'    if p_post_id is null ';
wwv_flow_imp.g_varchar2_table(2237) := 'then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- conver post id string to number'||wwv_flow.LF||
'    l_post_id := ';
wwv_flow_imp.g_varchar2_table(2238) := 'to_number( p_post_id );'||wwv_flow.LF||
'    -- fetch post title and description by post id'||wwv_flow.LF||
'    -- also fetch prev an';
wwv_flow_imp.g_varchar2_table(2239) := 'd next post id and title'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      v1.post_title'||wwv_flow.LF||
'    , v1.post_desc'||wwv_flow.LF||
'    , v1.category_title'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2240) := '   , v1.blogger_name'||wwv_flow.LF||
'    , v1.published_on'||wwv_flow.LF||
'    , v1.changed_on'||wwv_flow.LF||
'    , v1.next_post.post_id'||wwv_flow.LF||
'    , v1.n';
wwv_flow_imp.g_varchar2_table(2241) := 'ext_post.post_title'||wwv_flow.LF||
'    , v1.prev_post.post_id'||wwv_flow.LF||
'    , v1.prev_post.post_title'||wwv_flow.LF||
'    into p_post_title'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2242) := '   , p_post_desc'||wwv_flow.LF||
'    , p_post_category'||wwv_flow.LF||
'    , p_post_author'||wwv_flow.LF||
'    , l_published_on'||wwv_flow.LF||
'    , l_changed_on'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2243) := '   , l_next_post_id'||wwv_flow.LF||
'    , p_next_post_title'||wwv_flow.LF||
'    , l_prev_post_id'||wwv_flow.LF||
'    , p_prev_post_title'||wwv_flow.LF||
'    from bl';
wwv_flow_imp.g_varchar2_table(2244) := 'og_v_posts v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and post_id = l_post_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_next_post_id := int_to_vc2(';
wwv_flow_imp.g_varchar2_table(2245) := ' l_next_post_id );'||wwv_flow.LF||
'    p_prev_post_id := int_to_vc2( l_prev_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Get post published an';
wwv_flow_imp.g_varchar2_table(2246) := 'd modified UTC time'||wwv_flow.LF||
'    p_post_published :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'        sys_extract_utc( l_published_on )';
wwv_flow_imp.g_varchar2_table(2247) := ''||wwv_flow.LF||
'      , g_iso_8601_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    p_post_modified :='||wwv_flow.LF||
'      to_char(';
wwv_flow_imp.g_varchar2_table(2248) := ''||wwv_flow.LF||
'        sys_extract_utc( l_changed_on )'||wwv_flow.LF||
'      , g_iso_8601_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2249) := ' ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message => ''E';
wwv_flow_imp.g_varchar2_table(2250) := 'rror: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_subprogram(utl_c';
wwv_flow_imp.g_varchar2_table(2251) := 'all_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_post_id'''||wwv_flow.LF||
'    , p3 => coalesce( p_post_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2252) := ''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_post_details;'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(2253) := '---------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(2254) := '--------------------------------------------------'||wwv_flow.LF||
'  function get_category_title('||wwv_flow.LF||
'    p_category_id ';
wwv_flow_imp.g_varchar2_table(2255) := 'in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_category_id   blog_v_categories.category_id%type;'||wwv_flow.LF||
'    l_c';
wwv_flow_imp.g_varchar2_table(2256) := 'ategory_name blog_v_categories.category_title%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if par';
wwv_flow_imp.g_varchar2_table(2257) := 'ameter p_category_id is null'||wwv_flow.LF||
'    if p_category_id is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if';
wwv_flow_imp.g_varchar2_table(2258) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver category id string to number'||wwv_flow.LF||
'    l_category_id := to_number( p_category_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2259) := '-- fetch category name'||wwv_flow.LF||
'    select v1.category_title'||wwv_flow.LF||
'    into l_category_name'||wwv_flow.LF||
'    from blog_v_categor';
wwv_flow_imp.g_varchar2_table(2260) := 'ies v1'||wwv_flow.LF||
'    where v1.category_id = l_category_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return category name'||wwv_flow.LF||
'    return l_cate';
wwv_flow_imp.g_varchar2_table(2261) := 'gory_name;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message';
wwv_flow_imp.g_varchar2_table(2262) := ' => ''Error: %s %s( %s => %s, %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_';
wwv_flow_imp.g_varchar2_table(2263) := 'subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_category_id'''||wwv_flow.LF||
'    , p3 => coalesce( p_categor';
wwv_flow_imp.g_varchar2_table(2264) := 'y_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_c';
wwv_flow_imp.g_varchar2_table(2265) := 'ategory_title;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(2266) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2267) := ' p_tag_id in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_tag_id    blog_v_tags.tag_id%type;'||wwv_flow.LF||
'    l_tag_na';
wwv_flow_imp.g_varchar2_table(2268) := 'me  blog_v_tags.tag%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter p_tag_id is null'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2269) := '  if p_tag_id is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver tag id string to nu';
wwv_flow_imp.g_varchar2_table(2270) := 'mber'||wwv_flow.LF||
'    l_tag_id := to_number( p_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch tag name'||wwv_flow.LF||
'    select t1.tag'||wwv_flow.LF||
'    into l_tag_';
wwv_flow_imp.g_varchar2_table(2271) := 'name'||wwv_flow.LF||
'    from blog_v_tags t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and t1.tag_id = l_tag_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return categ';
wwv_flow_imp.g_varchar2_table(2272) := 'ory name'||wwv_flow.LF||
'    return l_tag_name;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug';
wwv_flow_imp.g_varchar2_table(2273) := '.error('||wwv_flow.LF||
'      p_message => ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack';
wwv_flow_imp.g_varchar2_table(2274) := '.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_tag_id'''||wwv_flow.LF||
'    , p3 => coalesce( p';
wwv_flow_imp.g_varchar2_table(2275) := '_tag_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ge';
wwv_flow_imp.g_varchar2_table(2276) := 't_tag;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(2277) := '--------------------------------------------------------------------'||wwv_flow.LF||
'  procedure download_file('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2278) := 'p_blob_content    in out nocopy blob,'||wwv_flow.LF||
'    p_mime_type       in varchar2,'||wwv_flow.LF||
'    p_header_names    in ap';
wwv_flow_imp.g_varchar2_table(2279) := 'ex_t_varchar2,'||wwv_flow.LF||
'    p_header_values   in apex_t_varchar2,'||wwv_flow.LF||
'    p_charset         in varchar2 default n';
wwv_flow_imp.g_varchar2_table(2280) := 'ull'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- init HTTP buffer'||wwv_flow.LF||
'    sys.htp.flush;'||wwv_flow.LF||
'    --sys.htp.init;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- open HT';
wwv_flow_imp.g_varchar2_table(2281) := 'TP header'||wwv_flow.LF||
'    sys.owa_util.mime_header('||wwv_flow.LF||
'      ccontent_type => coalesce( p_mime_type, blog_mime.g_de';
wwv_flow_imp.g_varchar2_table(2282) := 'fault_mime )'||wwv_flow.LF||
'    , bclose_header => false'||wwv_flow.LF||
'    , ccharset      => p_charset'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.in';
wwv_flow_imp.g_varchar2_table(2283) := 'fo('||wwv_flow.LF||
'      p_message => ''Set response headers'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set response headers'||wwv_flow.LF||
'    for i in 1 .. ';
wwv_flow_imp.g_varchar2_table(2284) := 'p_header_names.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info('||wwv_flow.LF||
'        p_message => ''Header name: %s , header';
wwv_flow_imp.g_varchar2_table(2285) := ' value: %s'''||wwv_flow.LF||
'      , p0 => p_header_names(i)'||wwv_flow.LF||
'      , p1 => p_header_values(i)'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_he';
wwv_flow_imp.g_varchar2_table(2286) := 'ader_values(i) is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- output HTTP header'||wwv_flow.LF||
'        sys.htp.p('||wwv_flow.LF||
'          ape';
wwv_flow_imp.g_varchar2_table(2287) := 'x_string.format('||wwv_flow.LF||
'            p_message => ''%s: %s'''||wwv_flow.LF||
'          , p0 => trim( p_header_names(i) )'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2288) := '     , p1 => trim( p_header_values(i) )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        apex_debug.info('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2289) := '         p_message => ''Header %s value is null. Header not set'''||wwv_flow.LF||
'        , p0 => p_header_names(i)'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2290) := '      );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- close HTTP header'||wwv_flow.LF||
'    sys.owa_util.http_header_close;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2291) := ''||wwv_flow.LF||
'    -- output file'||wwv_flow.LF||
'    sys.wpg_docload.download_file( p_blob_content );'||wwv_flow.LF||
''||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'      apex_appli';
wwv_flow_imp.g_varchar2_table(2292) := 'cation.stop_apex_engine;'||wwv_flow.LF||
'    exception'||wwv_flow.LF||
'    when apex_application.e_stop_apex_engine'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      n';
wwv_flow_imp.g_varchar2_table(2293) := 'ull;'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_me';
wwv_flow_imp.g_varchar2_table(2294) := 'ssage => ''%s Error: %s'''||wwv_flow.LF||
'    , p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(';
wwv_flow_imp.g_varchar2_table(2295) := '1))'||wwv_flow.LF||
'    , p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(2296) := 'd download_file;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(2297) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure download_';
wwv_flow_imp.g_varchar2_table(2298) := 'file('||wwv_flow.LF||
'    p_file_path in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_last_modified varchar2(256);'||wwv_flow.LF||
'    l_file_t        bl';
wwv_flow_imp.g_varchar2_table(2299) := 'og_v_files%rowtype;'||wwv_flow.LF||
'    l_header_names  apex_t_varchar2;'||wwv_flow.LF||
'    l_header_values apex_t_varchar2;'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(2300) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch file'||wwv_flow.LF||
'    select *'||wwv_flow.LF||
'    into l_file_t'||wwv_flow.LF||
'    from blog_v_files t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      a';
wwv_flow_imp.g_varchar2_table(2301) := 'nd t1.file_path = p_file_path'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_last_modified :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'        sys_extract_utc( ';
wwv_flow_imp.g_varchar2_table(2302) := 'l_file_t.changed_on )'||wwv_flow.LF||
'      , g_rfc_2822_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.';
wwv_flow_imp.g_varchar2_table(2303) := 'info('||wwv_flow.LF||
'      p_message => ''File name: %s, file size: %s, mime type: %s, charset: %s, last modified: %';
wwv_flow_imp.g_varchar2_table(2304) := 's'''||wwv_flow.LF||
'    , p0 => l_file_t.file_name'||wwv_flow.LF||
'    , p1 => l_file_t.file_size'||wwv_flow.LF||
'    , p2 => l_file_t.mime_type'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2305) := ', p3 => l_file_t.file_charset'||wwv_flow.LF||
'    , p4 => l_last_modified'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Compare request If-Modified';
wwv_flow_imp.g_varchar2_table(2306) := '-Since header to Last-Modified'||wwv_flow.LF||
'    -- If values are equal then set status header and exit from proce';
wwv_flow_imp.g_varchar2_table(2307) := 'dure'||wwv_flow.LF||
'    if sys.owa_util.get_cgi_env( ''HTTP_IF_MODIFIED_SINCE'' ) = l_last_modified'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      sy';
wwv_flow_imp.g_varchar2_table(2308) := 's.owa_util.status_line( 304 );'||wwv_flow.LF||
'      apex_debug.info('||wwv_flow.LF||
'        p_message => ''File not sent. If-Modifi';
wwv_flow_imp.g_varchar2_table(2309) := 'ed-Since: %s'''||wwv_flow.LF||
'      , p0 => l_last_modified'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      return;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Add Last-Modi';
wwv_flow_imp.g_varchar2_table(2310) := 'fied header'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_names'||wwv_flow.LF||
'    , p_value => ''Last-Modified'''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2311) := '   );'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_values'||wwv_flow.LF||
'    , p_value => l_last_modified'||wwv_flow.LF||
'    );';
wwv_flow_imp.g_varchar2_table(2312) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Add Cache-Control header'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_names'||wwv_flow.LF||
'    , p_valu';
wwv_flow_imp.g_varchar2_table(2313) := 'e => ''Cache-Control'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_values'||wwv_flow.LF||
'    , p_value =>';
wwv_flow_imp.g_varchar2_table(2314) := ''||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => ''max-age=%s'''||wwv_flow.LF||
'        , p0 =>'||wwv_flow.LF||
'            case l_';
wwv_flow_imp.g_varchar2_table(2315) := 'file_t.is_download'||wwv_flow.LF||
'              when 1'||wwv_flow.LF||
'              then get_attribute_value( ''G_MAX_AGE_DOWNLOAD''';
wwv_flow_imp.g_varchar2_table(2316) := ' )'||wwv_flow.LF||
'              else get_attribute_value( ''G_MAX_AGE_FILE'' )'||wwv_flow.LF||
'            end'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2317) := '-- add Content-Disposition header'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_names'||wwv_flow.LF||
'    , p_valu';
wwv_flow_imp.g_varchar2_table(2318) := 'e => ''Content-Disposition'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_values'||wwv_flow.LF||
'    , p_val';
wwv_flow_imp.g_varchar2_table(2319) := 'ue =>'||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'            p_message => ''%s filename="%s"'''||wwv_flow.LF||
'          , p0 =>'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2320) := '          case l_file_t.is_download'||wwv_flow.LF||
'                when 1'||wwv_flow.LF||
'                then ''attachment;'''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2321) := '        end'||wwv_flow.LF||
'          , p1 => l_file_t.file_name'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- download file'||wwv_flow.LF||
'    download';
wwv_flow_imp.g_varchar2_table(2322) := '_file('||wwv_flow.LF||
'      p_blob_content  => l_file_t.blob_content'||wwv_flow.LF||
'    , p_mime_type     => l_file_t.mime_type'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2323) := '  , p_header_names  => l_header_names'||wwv_flow.LF||
'    , p_header_values => l_header_values'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle e';
wwv_flow_imp.g_varchar2_table(2324) := 'rrors'||wwv_flow.LF||
'  exception when no_data_found'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message => ''Error: %s %s(';
wwv_flow_imp.g_varchar2_table(2325) := ' %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.su';
wwv_flow_imp.g_varchar2_table(2326) := 'bprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_file_path'''||wwv_flow.LF||
'    , p3 => coalesce( p_file_path, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    rai';
wwv_flow_imp.g_varchar2_table(2327) := 'se_http_error( 404 );'||wwv_flow.LF||
''||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message => ''Error: %s %s(';
wwv_flow_imp.g_varchar2_table(2328) := ' %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.su';
wwv_flow_imp.g_varchar2_table(2329) := 'bprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_file_path'''||wwv_flow.LF||
'    , p3 => coalesce( p_file_path, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    rai';
wwv_flow_imp.g_varchar2_table(2330) := 'se_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_file;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(2331) := '-----------------------------------'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2332) := '----------------'||wwv_flow.LF||
'  procedure redirect_search('||wwv_flow.LF||
'    p_value   in varchar2,'||wwv_flow.LF||
'    p_app_id  in varchar2 d';
wwv_flow_imp.g_varchar2_table(2333) := 'efault null,'||wwv_flow.LF||
'    p_page_id in varchar2 default ''SEARCH'','||wwv_flow.LF||
'    p_session in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2334) := '  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- Get search page URL and redirect'||wwv_flow.LF||
'    apex_util.redirect_url('||wwv_flow.LF||
'      apex_page.get';
wwv_flow_imp.g_varchar2_table(2335) := '_url('||wwv_flow.LF||
'        p_application => p_app_id'||wwv_flow.LF||
'      , p_page        => p_page_id'||wwv_flow.LF||
'      , p_session     => ';
wwv_flow_imp.g_varchar2_table(2336) := 'p_session'||wwv_flow.LF||
'      , p_items       => ''P4_SEARCH'''||wwv_flow.LF||
'      , p_values      => p_value'||wwv_flow.LF||
'      , p_plain_url ';
wwv_flow_imp.g_varchar2_table(2337) := '  => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  end redirect_search;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2338) := '----------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2339) := '---------'||wwv_flow.LF||
'end "BLOG_UTIL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_ADMIN"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2340) := '--------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2341) := '-------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(2342) := '-----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2343) := '----------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2344) := '-----------------------'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2345) := '----'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2346) := '---------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2347) := '--'||wwv_flow.LF||
'  function next_seq('||wwv_flow.LF||
'    p_max in number'||wwv_flow.LF||
'  ) return number'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return ceil( coalesce';
wwv_flow_imp.g_varchar2_table(2348) := '( p_max + 1, 1 ) / 10 ) * 10;'||wwv_flow.LF||
'  end next_seq;'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2349) := '--------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2350) := '-------'||wwv_flow.LF||
'  procedure add_tag_to_post('||wwv_flow.LF||
'    p_post_id     in number,'||wwv_flow.LF||
'    p_tag_id      in number,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2351) := '_display_seq in number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- merge tag'||wwv_flow.LF||
'    merge into blog_post_tags t1'||wwv_flow.LF||
'    using';
wwv_flow_imp.g_varchar2_table(2352) := ' dual on ('||wwv_flow.LF||
'      t1.post_id  = p_post_id'||wwv_flow.LF||
'      and t1.tag_id  = p_tag_id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    when matched then';
wwv_flow_imp.g_varchar2_table(2353) := ''||wwv_flow.LF||
'    -- update display sequence if it changed'||wwv_flow.LF||
'      update'||wwv_flow.LF||
'        set t1.display_seq = p_display_se';
wwv_flow_imp.g_varchar2_table(2354) := 'q'||wwv_flow.LF||
'      where t1.display_seq != p_display_seq'||wwv_flow.LF||
'    -- insert post id, tag id and display sequency to ';
wwv_flow_imp.g_varchar2_table(2355) := 'table'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      insert'||wwv_flow.LF||
'        ( is_active, post_id, tag_id, display_seq )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2356) := '   values'||wwv_flow.LF||
'        ( 1, p_post_id, p_tag_id, p_display_seq )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_tag_to_post;'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(2357) := '----------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(2358) := '---------------------------------------------------'||wwv_flow.LF||
'  procedure cleanup_post_tags('||wwv_flow.LF||
'    p_post_id in ';
wwv_flow_imp.g_varchar2_table(2359) := 'number,'||wwv_flow.LF||
'    p_tag_tab in apex_t_number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- delete relationship from tags that a';
wwv_flow_imp.g_varchar2_table(2360) := 'ren''t belong to post anymore'||wwv_flow.LF||
'    delete'||wwv_flow.LF||
'    from blog_post_tags t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and post_id =';
wwv_flow_imp.g_varchar2_table(2361) := ' p_post_id'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from table( p_tag_tab ) x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2362) := '   and x1.column_value = t1.tag_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end cleanup_post_tags;'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(2363) := '------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2364) := '-----------------------------'||wwv_flow.LF||
'  procedure add_blogger('||wwv_flow.LF||
'    p_app_id    in varchar2,'||wwv_flow.LF||
'    p_username  ';
wwv_flow_imp.g_varchar2_table(2365) := 'in varchar2,'||wwv_flow.LF||
'    p_user_id   out nocopy number,'||wwv_flow.LF||
'    p_name      out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_m';
wwv_flow_imp.g_varchar2_table(2366) := 'ax     blog_bloggers.display_seq%type;'||wwv_flow.LF||
'    l_email   blog_bloggers.email%type;'||wwv_flow.LF||
'    l_app_id  apex_ap';
wwv_flow_imp.g_varchar2_table(2367) := 'plications.application_id%type;'||wwv_flow.LF||
'    l_authz   apex_applications.authorization_scheme%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2368) := '    -- convert application id string to number'||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch ';
wwv_flow_imp.g_varchar2_table(2369) := 'application authorization scheme name.'||wwv_flow.LF||
'    select authorization_scheme'||wwv_flow.LF||
'    into l_authz'||wwv_flow.LF||
'    from ape';
wwv_flow_imp.g_varchar2_table(2370) := 'x_applications'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and application_id = l_app_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Check ';
wwv_flow_imp.g_varchar2_table(2371) := 'is user in group: %s.'', l_authz );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- verify user is authorized'||wwv_flow.LF||
'    if apex_authorization.is_au';
wwv_flow_imp.g_varchar2_table(2372) := 'thorized( l_authz )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if user is authorized add user to blog_bloggers table'||wwv_flow.LF||
'      a';
wwv_flow_imp.g_varchar2_table(2373) := 'pex_debug.info( ''User %s is authorized and added to bloggers.'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- fetch next d';
wwv_flow_imp.g_varchar2_table(2374) := 'isplay_seq'||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        max( t1.display_seq ) as display_seq'||wwv_flow.LF||
'      into l_max'||wwv_flow.LF||
'      from blo';
wwv_flow_imp.g_varchar2_table(2375) := 'g_bloggers t1'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_max := next_seq( l_max );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get APEX user email'||wwv_flow.LF||
'      l_email';
wwv_flow_imp.g_varchar2_table(2376) := ' := apex_util.get_email( p_username => p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get APEX user first and last name for';
wwv_flow_imp.g_varchar2_table(2377) := ' blogger name'||wwv_flow.LF||
'      p_name := apex_string.format('||wwv_flow.LF||
'        p_message  => ''%s %s'''||wwv_flow.LF||
'      , p0 => apex_u';
wwv_flow_imp.g_varchar2_table(2378) := 'til.get_first_name( p_username => p_username )'||wwv_flow.LF||
'      , p1 => apex_util.get_last_name( p_username => ';
wwv_flow_imp.g_varchar2_table(2379) := 'p_username )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- add new blogger'||wwv_flow.LF||
'      insert into blog_bloggers'||wwv_flow.LF||
'        ( is_active,';
wwv_flow_imp.g_varchar2_table(2380) := ' publish_desc, display_seq, apex_username, blogger_name, email )'||wwv_flow.LF||
'      values'||wwv_flow.LF||
'        ( 1, 0, l_max,';
wwv_flow_imp.g_varchar2_table(2381) := ' p_username, p_name, l_email )'||wwv_flow.LF||
'      returning id into p_user_id'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.';
wwv_flow_imp.g_varchar2_table(2382) := 'info( ''User %s is not authorized.'', p_username );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_blogger;'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2383) := '--------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(2384) := '-------------------------------------------'||wwv_flow.LF||
'  procedure set_attribute_value('||wwv_flow.LF||
'    p_attribute_name  i';
wwv_flow_imp.g_varchar2_table(2385) := 'n varchar2,'||wwv_flow.LF||
'    p_attribute_value in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Set parameter ';
wwv_flow_imp.g_varchar2_table(2386) := '%s: %s'', p_attribute_name, p_attribute_value );'||wwv_flow.LF||
''||wwv_flow.LF||
'    update blog_settings'||wwv_flow.LF||
'      set attribute_value ';
wwv_flow_imp.g_varchar2_table(2387) := '= p_attribute_value'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and attribute_name = p_attribute_name'||wwv_flow.LF||
'      and ('||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2388) := 'attribute_value != p_attribute_value'||wwv_flow.LF||
'        or( attribute_value is null and p_attribute_value is no';
wwv_flow_imp.g_varchar2_table(2389) := 't null )'||wwv_flow.LF||
'        or( attribute_value is not null and p_attribute_value is null )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(2390) := 'd set_attribute_value;'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2391) := '---'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global funct';
wwv_flow_imp.g_varchar2_table(2392) := 'ions and procedures'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2393) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure post_a';
wwv_flow_imp.g_varchar2_table(2394) := 'uthentication'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_group_names apex_t_varchar2;'||wwv_flow.LF||
'    l_user_name   apex_workspace_apex_users.us';
wwv_flow_imp.g_varchar2_table(2395) := 'er_name%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_user_name := sys_context( ''APEX$SESSION'', ''APP_USER'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- collect';
wwv_flow_imp.g_varchar2_table(2396) := ' user groups to PL/SQL table'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select distinct'||wwv_flow.LF||
'        g.group_name'||wwv_flow.LF||
'      from ap';
wwv_flow_imp.g_varchar2_table(2397) := 'ex_workspace_groups g'||wwv_flow.LF||
'      left join apex_workspace_group_groups gg on g.group_name = gg.grantee_na';
wwv_flow_imp.g_varchar2_table(2398) := 'me'||wwv_flow.LF||
'      left join apex_workspace_group_users gu on g.group_name = gu.group_name'||wwv_flow.LF||
'        and gu.user';
wwv_flow_imp.g_varchar2_table(2399) := '_name = l_user_name'||wwv_flow.LF||
'      left join apex_workspace_apex_users u on gu.user_name = u.user_name'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2400) := '  and u.account_locked  = ''No'''||wwv_flow.LF||
'        and u.user_name = l_user_name'||wwv_flow.LF||
'        start with u.user_name ';
wwv_flow_imp.g_varchar2_table(2401) := '= l_user_name'||wwv_flow.LF||
'      connect by nocycle prior gg.group_name = g.group_name'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
'      apex_stri';
wwv_flow_imp.g_varchar2_table(2402) := 'ng.push( l_group_names, c1.group_name );'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Enable user groups'||wwv_flow.LF||
'    apex_authoriza';
wwv_flow_imp.g_varchar2_table(2403) := 'tion.enable_dynamic_groups ('||wwv_flow.LF||
'      p_group_names => l_group_names'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2404) := '  then'||wwv_flow.LF||
'    apex_debug.error( ''Unhandled post authentication procedure error: %s: '', sqlerrm );'||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2405) := 'aise;'||wwv_flow.LF||
'  end post_authentication;'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2406) := '-------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  pro';
wwv_flow_imp.g_varchar2_table(2407) := 'cedure get_blogger_details('||wwv_flow.LF||
'    p_app_id      in varchar2,'||wwv_flow.LF||
'    p_username    in varchar2,'||wwv_flow.LF||
'    p_user';
wwv_flow_imp.g_varchar2_table(2408) := '_id     out nocopy number,'||wwv_flow.LF||
'    p_name        out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.in';
wwv_flow_imp.g_varchar2_table(2409) := 'fo( ''Fetch user id and name for username: %s'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch user id and name'||wwv_flow.LF||
'    sele';
wwv_flow_imp.g_varchar2_table(2410) := 'ct'||wwv_flow.LF||
'      id'||wwv_flow.LF||
'    , blogger_name'||wwv_flow.LF||
'    into p_user_id, p_name'||wwv_flow.LF||
'    from blog_bloggers'||wwv_flow.LF||
'    where apex_user';
wwv_flow_imp.g_varchar2_table(2411) := 'name = p_username'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- if user not found, try add user'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when no_data_found'||wwv_flow.LF||
'  the';
wwv_flow_imp.g_varchar2_table(2412) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''User %s not found from bloggers.'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'    add_blogger('||wwv_flow.LF||
'      p_';
wwv_flow_imp.g_varchar2_table(2413) := 'app_id    => p_app_id'||wwv_flow.LF||
'    , p_username  => p_username'||wwv_flow.LF||
'    , p_user_id   => p_user_id'||wwv_flow.LF||
'    , p_name   ';
wwv_flow_imp.g_varchar2_table(2414) := '   => p_name'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_blogger_details;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2415) := '----------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2416) := '---------'||wwv_flow.LF||
'  function get_category_seq'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_seq   blog_v_all_categories.d';
wwv_flow_imp.g_varchar2_table(2417) := 'isplay_seq%type;'||wwv_flow.LF||
'    l_next_seq  varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max category display sequence'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2418) := '    select max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_all_categories v1';
wwv_flow_imp.g_varchar2_table(2419) := ''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next category display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( next_seq( l';
wwv_flow_imp.g_varchar2_table(2420) := '_max_seq ) );'||wwv_flow.LF||
'    -- return next category display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_categor';
wwv_flow_imp.g_varchar2_table(2421) := 'y_seq;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(2422) := '--------------------------------------------------------------------'||wwv_flow.LF||
'  function get_link_grp_seq'||wwv_flow.LF||
'  r';
wwv_flow_imp.g_varchar2_table(2423) := 'eturn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_seq   blog_v_all_link_groups.display_seq%type;'||wwv_flow.LF||
'    l_next_seq  varchar';
wwv_flow_imp.g_varchar2_table(2424) := '2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max link group display sequence'||wwv_flow.LF||
'    select max( v1.display_seq ) as di';
wwv_flow_imp.g_varchar2_table(2425) := 'splay_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_all_link_groups v1'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next link group dis';
wwv_flow_imp.g_varchar2_table(2426) := 'play sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );'||wwv_flow.LF||
'    -- return next li';
wwv_flow_imp.g_varchar2_table(2427) := 'nk group display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_link_grp_seq;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(2428) := '------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(2429) := '-----------------------------------'||wwv_flow.LF||
'  function get_modal_page_seq'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_s';
wwv_flow_imp.g_varchar2_table(2430) := 'eq   blog_v_all_dynamic_content.display_seq%type;'||wwv_flow.LF||
'    l_next_seq  varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fet';
wwv_flow_imp.g_varchar2_table(2431) := 'ch max link group display sequence'||wwv_flow.LF||
'    select max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into l_max_se';
wwv_flow_imp.g_varchar2_table(2432) := 'q'||wwv_flow.LF||
'    from blog_v_all_dynamic_content v1'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next link group display sequence'||wwv_flow.LF||
'    l_nex';
wwv_flow_imp.g_varchar2_table(2433) := 't_seq := blog_util.int_to_vc2( next_seq( l_max_seq ) );'||wwv_flow.LF||
'    -- return next link group display sequen';
wwv_flow_imp.g_varchar2_table(2434) := 'ce'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_modal_page_seq;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2435) := '---------------------------------'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2436) := '--------------'||wwv_flow.LF||
'  function get_link_seq('||wwv_flow.LF||
'    p_link_group_id in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2437) := ' l_link_group_id number;'||wwv_flow.LF||
'    l_max_seq       blog_v_all_links.display_seq%type;'||wwv_flow.LF||
'    l_next_seq      ';
wwv_flow_imp.g_varchar2_table(2438) := 'varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver link group id string to number'||wwv_flow.LF||
'    l_link_group_id := to_numbe';
wwv_flow_imp.g_varchar2_table(2439) := 'r( p_link_group_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max link display sequence'||wwv_flow.LF||
'    select max( v1.display_seq ) as di';
wwv_flow_imp.g_varchar2_table(2440) := 'splay_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_all_links v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and link_group_id = l_';
wwv_flow_imp.g_varchar2_table(2441) := 'link_group_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next link display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( ne';
wwv_flow_imp.g_varchar2_table(2442) := 'xt_seq( l_max_seq ) );'||wwv_flow.LF||
'    -- return next link display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_li';
wwv_flow_imp.g_varchar2_table(2443) := 'nk_seq;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(2444) := '---------------------------------------------------------------------'||wwv_flow.LF||
'  function request_to_post_sta';
wwv_flow_imp.g_varchar2_table(2445) := 'tus('||wwv_flow.LF||
'    p_request in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver APEX request to post ';
wwv_flow_imp.g_varchar2_table(2446) := 'status (blog_posts.is_active)'||wwv_flow.LF||
'    return case p_request'||wwv_flow.LF||
'      when ''CREATE'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'      whe';
wwv_flow_imp.g_varchar2_table(2447) := 'n ''SAVE'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'      when ''SAVE_AND_PUBLISH'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'      else ''0'''||wwv_flow.LF||
'    end;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ';
wwv_flow_imp.g_varchar2_table(2448) := 'request_to_post_status;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2449) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get';
wwv_flow_imp.g_varchar2_table(2450) := '_first_paragraph('||wwv_flow.LF||
'    p_body_html in clob'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_first_p       clob;'||wwv_flow.LF||
'    l_f';
wwv_flow_imp.g_varchar2_table(2451) := 'irst_p_start number;'||wwv_flow.LF||
'    l_first_p_end   number;'||wwv_flow.LF||
'    l_length        number;'||wwv_flow.LF||
'    l_next_p        num';
wwv_flow_imp.g_varchar2_table(2452) := 'ber;'||wwv_flow.LF||
'    l_cnt           number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cnt := 1;'||wwv_flow.LF||
'    l_next_p := 1;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get first openi';
wwv_flow_imp.g_varchar2_table(2453) := 'ng and closing tag positions'||wwv_flow.LF||
'    l_first_p_start := instr( p_body_html, ''<p>'' );'||wwv_flow.LF||
'    l_first_p_end  ';
wwv_flow_imp.g_varchar2_table(2454) := ' := instr( p_body_html, ''</p>'', l_first_p_start ) + 4;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check if there nested tags'||wwv_flow.LF||
'    while ';
wwv_flow_imp.g_varchar2_table(2455) := 'l_next_p > 0'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      l_cnt := l_cnt + 1;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get string length between opening and clos';
wwv_flow_imp.g_varchar2_table(2456) := 'ing tag'||wwv_flow.LF||
'      l_length  := l_first_p_end - l_first_p_start;'||wwv_flow.LF||
'      -- select contect between opening ';
wwv_flow_imp.g_varchar2_table(2457) := 'and closing tag'||wwv_flow.LF||
'      l_first_p := substr( p_body_html, l_first_p_start, l_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- check';
wwv_flow_imp.g_varchar2_table(2458) := ' if there is more opening tags inside selection'||wwv_flow.LF||
'      l_next_p := instr( l_first_p, ''<p'', 1, l_cnt )';
wwv_flow_imp.g_varchar2_table(2459) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'      if l_next_p > 0'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- if another opening tag found, find next closing tag'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2460) := '       l_first_p_end := instr( p_body_html, ''</p>'', 1, l_cnt ) + 4;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_first_p :';
wwv_flow_imp.g_varchar2_table(2461) := '= null;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'    -- post must have at least one paragraph'||wwv_flow.LF||
'    if l_first_p_start > 0 and';
wwv_flow_imp.g_varchar2_table(2462) := ' l_first_p_end > 0 then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_length := l_first_p_end - l_first_p_start;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get first para';
wwv_flow_imp.g_varchar2_table(2463) := 'graph'||wwv_flow.LF||
'      l_first_p := substr( p_body_html, l_first_p_start, l_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- remove whitespa';
wwv_flow_imp.g_varchar2_table(2464) := 'ce'||wwv_flow.LF||
'      l_first_p := blog_util.remove_whitespace( l_first_p );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_first_p;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2465) := ''||wwv_flow.LF||
'  end get_first_paragraph;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2466) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(2467) := 'e add_category('||wwv_flow.LF||
'    p_category_title  in varchar2,'||wwv_flow.LF||
'    p_category_id out nocopy number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2468) := 'l_next_seq      number;'||wwv_flow.LF||
'    l_title         varchar2(512);'||wwv_flow.LF||
'    l_title_unique  varchar2(512);'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(2469) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- remove whitespace from category title'||wwv_flow.LF||
'    l_title := blog_util.remove_whitespace( p_catego';
wwv_flow_imp.g_varchar2_table(2470) := 'ry_title );'||wwv_flow.LF||
'    l_title_unique := upper( l_title );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check if category already exists and fet';
wwv_flow_imp.g_varchar2_table(2471) := 'ch id'||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'      select v1.id'||wwv_flow.LF||
'      into p_category_id'||wwv_flow.LF||
'      from blog_v_all_categories v1'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2472) := '  where 1 = 1'||wwv_flow.LF||
'      and v1.title_unique = l_title_unique'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    -- if category not exists inser';
wwv_flow_imp.g_varchar2_table(2473) := 't and return id'||wwv_flow.LF||
'    exception'||wwv_flow.LF||
'    when no_data_found'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- get next sequence value'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2474) := ' l_next_seq := get_category_seq;'||wwv_flow.LF||
'      -- insert category and return id for out parameter.'||wwv_flow.LF||
'      ins';
wwv_flow_imp.g_varchar2_table(2475) := 'ert into blog_categories'||wwv_flow.LF||
'        ( is_active, display_seq, title )'||wwv_flow.LF||
'      values'||wwv_flow.LF||
'        ( 1, l_next_';
wwv_flow_imp.g_varchar2_table(2476) := 'seq, l_title )'||wwv_flow.LF||
'      returning id into p_category_id'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'  -- fetch category id if it w';
wwv_flow_imp.g_varchar2_table(2477) := 'as inserted in other session but not commited'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when dup_val_on_index'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    select ';
wwv_flow_imp.g_varchar2_table(2478) := 'v1.id'||wwv_flow.LF||
'    into p_category_id'||wwv_flow.LF||
'    from blog_v_all_categories v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.title_un';
wwv_flow_imp.g_varchar2_table(2479) := 'ique = l_title_unique'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end add_category;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2480) := '----------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2481) := '---------'||wwv_flow.LF||
'  procedure remove_unused_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- cleanup categories that aren''t li';
wwv_flow_imp.g_varchar2_table(2482) := 'nked to any post'||wwv_flow.LF||
'    delete from blog_categories t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select';
wwv_flow_imp.g_varchar2_table(2483) := ' 1'||wwv_flow.LF||
'      from blog_posts x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.category_id = t1.id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end remove_';
wwv_flow_imp.g_varchar2_table(2484) := 'unused_categories;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2485) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure add_tag';
wwv_flow_imp.g_varchar2_table(2486) := '('||wwv_flow.LF||
'    p_tag     in varchar2,'||wwv_flow.LF||
'    p_tag_id  out nocopy number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_value varchar2(256);'||wwv_flow.LF||
'  b';
wwv_flow_imp.g_varchar2_table(2487) := 'egin'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_tag_id  := null;'||wwv_flow.LF||
'    l_value   := blog_util.remove_whitespace( p_tag );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if tag i';
wwv_flow_imp.g_varchar2_table(2488) := 's not null then fetch id'||wwv_flow.LF||
'    if l_value is not null then'||wwv_flow.LF||
''||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        select id'||wwv_flow.LF||
'        into';
wwv_flow_imp.g_varchar2_table(2489) := ' p_tag_id'||wwv_flow.LF||
'        from blog_v_all_tags'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'        and tag_unique = upper( l_value )';
wwv_flow_imp.g_varchar2_table(2490) := ''||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if tag not exists insert and return id'||wwv_flow.LF||
'      exception when no_data_found then'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2491) := '       insert into blog_tags'||wwv_flow.LF||
'          ( is_active, tag )'||wwv_flow.LF||
'        values'||wwv_flow.LF||
'          ( 1, l_value )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2492) := '      returning id into p_tag_id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_tag;'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(2493) := '---------------------------------------------------------------'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(2494) := '--------------------------------------------'||wwv_flow.LF||
'  procedure add_post_tags('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2495) := '   p_tags    in varchar2,'||wwv_flow.LF||
'    p_sep     in varchar2 default '','''||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id     number;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2496) := '   l_tag_id      number;'||wwv_flow.LF||
'    l_display_seq number;'||wwv_flow.LF||
'    l_tag_tab     apex_t_varchar2;'||wwv_flow.LF||
'    l_tag_id_t';
wwv_flow_imp.g_varchar2_table(2497) := 'ab  apex_t_number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- split tags string to ta';
wwv_flow_imp.g_varchar2_table(2498) := 'ble and loop all values'||wwv_flow.LF||
'    l_tag_tab := apex_string.split('||wwv_flow.LF||
'      p_str => p_tags'||wwv_flow.LF||
'    , p_sep => p_s';
wwv_flow_imp.g_varchar2_table(2499) := 'ep'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_tag_tab.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- add tag to repository and return id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2500) := '      add_tag('||wwv_flow.LF||
'        p_tag     => l_tag_tab(i)'||wwv_flow.LF||
'      , p_tag_id  => l_tag_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if';
wwv_flow_imp.g_varchar2_table(2501) := ' the tag has been added or is already in the repository'||wwv_flow.LF||
'      -- create relationships to post'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2502) := 'if l_tag_id is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- collect tag id to table.'||wwv_flow.LF||
'        -- table is used at ';
wwv_flow_imp.g_varchar2_table(2503) := 'end of procedure'||wwv_flow.LF||
'        -- for checking relationships that should be removed'||wwv_flow.LF||
'        apex_string.pu';
wwv_flow_imp.g_varchar2_table(2504) := 'sh( l_tag_id_tab, l_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- get table record count for tag display sequence'||wwv_flow.LF||
'        l_';
wwv_flow_imp.g_varchar2_table(2505) := 'display_seq:= l_tag_id_tab.count * 10;'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- add tag relationships to post'||wwv_flow.LF||
'        add_tag_to_';
wwv_flow_imp.g_varchar2_table(2506) := 'post('||wwv_flow.LF||
'          p_post_id     => l_post_id'||wwv_flow.LF||
'        , p_tag_id      => l_tag_id'||wwv_flow.LF||
'        , p_display_s';
wwv_flow_imp.g_varchar2_table(2507) := 'eq => l_display_seq'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- delete removed tags relationshi';
wwv_flow_imp.g_varchar2_table(2508) := 'ps'||wwv_flow.LF||
'    cleanup_post_tags('||wwv_flow.LF||
'      p_post_id => l_post_id'||wwv_flow.LF||
'    , p_tag_tab => l_tag_id_tab'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end';
wwv_flow_imp.g_varchar2_table(2509) := ' add_post_tags;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2510) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure remove_unu';
wwv_flow_imp.g_varchar2_table(2511) := 'sed_tags'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- cleanup tags that aren''t linked to any post'||wwv_flow.LF||
'    delete from blog_tags t';
wwv_flow_imp.g_varchar2_table(2512) := '1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_post_tags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2513) := '      and x1.tag_id = t1.id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  end remove_unused_tags;'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2514) := '-----------------------------------------'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2515) := '----------------------'||wwv_flow.LF||
'  function is_integer('||wwv_flow.LF||
'    p_value     in varchar2,'||wwv_flow.LF||
'    p_min       in number';
wwv_flow_imp.g_varchar2_table(2516) := ','||wwv_flow.LF||
'    p_max       in number,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_value     nu';
wwv_flow_imp.g_varchar2_table(2517) := 'mber;'||wwv_flow.LF||
'    l_err_mesg  varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_value is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- prepar';
wwv_flow_imp.g_varchar2_table(2518) := 'e validation error message for exception handler'||wwv_flow.LF||
'      l_err_mesg := apex_lang.get_message('||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2519) := 'p_name    => p_err_mesg'||wwv_flow.LF||
'      , p_params  =>'||wwv_flow.LF||
'          apex_t_varchar2('||wwv_flow.LF||
'            ''min'''||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(2520) := ', p_min'||wwv_flow.LF||
'          , ''max'''||wwv_flow.LF||
'          , p_max'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_value := to_number( p_value ';
wwv_flow_imp.g_varchar2_table(2521) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- check value is integer and between range'||wwv_flow.LF||
'      if round( l_value ) = l_value'||wwv_flow.LF||
'      and ';
wwv_flow_imp.g_varchar2_table(2522) := 'l_value between p_min and p_max'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- if validation passes, clear error meassage'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2523) := '     l_err_mesg := null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when inva';
wwv_flow_imp.g_varchar2_table(2524) := 'lid_number'||wwv_flow.LF||
'  or value_error'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    -- return error message'||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
'  end is_integ';
wwv_flow_imp.g_varchar2_table(2525) := 'er;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(2526) := '-----------------------------------------------------------------'||wwv_flow.LF||
'  function is_url('||wwv_flow.LF||
'    p_value    ';
wwv_flow_imp.g_varchar2_table(2527) := ' in varchar2,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err_mesg varchar2(32700);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2528) := ' begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if not regexp_like(p_value, ''^https?\:\/\/.*$'')'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- if validation fails pr';
wwv_flow_imp.g_varchar2_table(2529) := 'epare error message'||wwv_flow.LF||
'      l_err_mesg := p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end is_u';
wwv_flow_imp.g_varchar2_table(2530) := 'rl;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(2531) := '-----------------------------------------------------------------'||wwv_flow.LF||
'  function is_date_format('||wwv_flow.LF||
'    p_v';
wwv_flow_imp.g_varchar2_table(2532) := 'alue     in varchar2,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err_mesg          v';
wwv_flow_imp.g_varchar2_table(2533) := 'archar2(32700);'||wwv_flow.LF||
'    invalid_date_format exception;'||wwv_flow.LF||
'    pragma              exception_init(invalid_da';
wwv_flow_imp.g_varchar2_table(2534) := 'te_format, -1821);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare validation error message'||wwv_flow.LF||
'    l_err_mesg := p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2535) := '   -- try convert timestamp to string'||wwv_flow.LF||
'    if to_char( sysdate, p_value ) is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2536) := '-- if validation passes, clear error meassage'||wwv_flow.LF||
'      l_err_mesg := null;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_er';
wwv_flow_imp.g_varchar2_table(2537) := 'r_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when invalid_date_format'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    -- return error message'||wwv_flow.LF||
'    return l_err_';
wwv_flow_imp.g_varchar2_table(2538) := 'mesg;'||wwv_flow.LF||
'  end is_date_format;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2539) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(2540) := 'e update_feature('||wwv_flow.LF||
'    p_app_id          in number,'||wwv_flow.LF||
'    p_build_option_id in number,'||wwv_flow.LF||
'    p_build_stat';
wwv_flow_imp.g_varchar2_table(2541) := 'us    in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_build_status apex_application_admin.t_build_option_status;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2542) := ''||wwv_flow.LF||
'    l_build_status := upper( p_build_status );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update build option value'||wwv_flow.LF||
'    if'||wwv_flow.LF||
'      apex_';
wwv_flow_imp.g_varchar2_table(2543) := 'application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id  => p_app_id'||wwv_flow.LF||
'      , p_id       ';
wwv_flow_imp.g_varchar2_table(2544) := '       => p_build_option_id'||wwv_flow.LF||
'      ) != l_build_status'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_application_admin.set_bui';
wwv_flow_imp.g_varchar2_table(2545) := 'ld_option_status('||wwv_flow.LF||
'        p_application_id  => p_app_id'||wwv_flow.LF||
'      , p_id              => p_build_option_';
wwv_flow_imp.g_varchar2_table(2546) := 'id'||wwv_flow.LF||
'      , p_build_status    => l_build_status'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end update_feature;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(2547) := '------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(2548) := '-----------------------------------------------------'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_build_option';
wwv_flow_imp.g_varchar2_table(2549) := '_name in varchar2,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- get build option id b';
wwv_flow_imp.g_varchar2_table(2550) := 'y build option name for both applications'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.application_id'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2551) := '  , t1.build_option_id'||wwv_flow.LF||
'      from apex_application_build_options t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and t1';
wwv_flow_imp.g_varchar2_table(2552) := '.build_option_name  = p_build_option_name'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'          from blog';
wwv_flow_imp.g_varchar2_table(2553) := '_settings x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.attribute_name in( ''G_PUB_APP_ID'', ''G_ADMIN_AP';
wwv_flow_imp.g_varchar2_table(2554) := 'P_ID'' )'||wwv_flow.LF||
'            and to_number( x1.attribute_value ) = t1.application_id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2555) := '    -- update build option value'||wwv_flow.LF||
'      update_feature('||wwv_flow.LF||
'        p_app_id          => c1.application_i';
wwv_flow_imp.g_varchar2_table(2556) := 'd'||wwv_flow.LF||
'      , p_build_option_id => c1.build_option_id'||wwv_flow.LF||
'      , p_build_status    => p_build_status'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2557) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end update_feature;'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2558) := '---------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2559) := '--'||wwv_flow.LF||
'  procedure resequence_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update categories display_seq if it differ';
wwv_flow_imp.g_varchar2_table(2560) := 'ent than new'||wwv_flow.LF||
'    merge into blog_categories t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_numbe';
wwv_flow_imp.g_varchar2_table(2561) := 'r() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_display_seq'||wwv_flow.LF||
'      from bl';
wwv_flow_imp.g_varchar2_table(2562) := 'og_categories'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update';
wwv_flow_imp.g_varchar2_table(2563) := ' set t1.display_seq = v1.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2564) := ' end resequence_categories;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2565) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(2566) := 'e resequence_tags('||wwv_flow.LF||
'    p_post_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id :';
wwv_flow_imp.g_varchar2_table(2567) := '= to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update post tags display_seq if it different than new'||wwv_flow.LF||
'    merge in';
wwv_flow_imp.g_varchar2_table(2568) := 'to blog_post_tags t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order ';
wwv_flow_imp.g_varchar2_table(2569) := 'by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_display_seq'||wwv_flow.LF||
'      from blog_post_tags'||wwv_flow.LF||
'      where 1';
wwv_flow_imp.g_varchar2_table(2570) := ' = 1'||wwv_flow.LF||
'      and post_id = l_post_id'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      upd';
wwv_flow_imp.g_varchar2_table(2571) := 'ate set t1.display_seq = v1.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;';
wwv_flow_imp.g_varchar2_table(2572) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_tags;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2573) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure r';
wwv_flow_imp.g_varchar2_table(2574) := 'esequence_link_groups'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update link groups display_seq if it different than new'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2575) := '   merge into blog_link_groups t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2576) := '       order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_display_seq'||wwv_flow.LF||
'      from blog_link_group';
wwv_flow_imp.g_varchar2_table(2577) := 's'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.disp';
wwv_flow_imp.g_varchar2_table(2578) := 'lay_seq = v1.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end reseque';
wwv_flow_imp.g_varchar2_table(2579) := 'nce_link_groups;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(2580) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure resequenc';
wwv_flow_imp.g_varchar2_table(2581) := 'e_links('||wwv_flow.LF||
'    p_link_group_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_link_group_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver';
wwv_flow_imp.g_varchar2_table(2582) := 't link group id to number'||wwv_flow.LF||
'    l_link_group_id := to_number( p_link_group_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update links ';
wwv_flow_imp.g_varchar2_table(2583) := 'display_seq if it different than new'||wwv_flow.LF||
'    merge into blog_links t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        i';
wwv_flow_imp.g_varchar2_table(2584) := 'd'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_displa';
wwv_flow_imp.g_varchar2_table(2585) := 'y_seq'||wwv_flow.LF||
'      from blog_links'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and link_group_id = l_link_group_id'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2586) := ' on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v1.new_display_seq'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2587) := '     where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_links;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2588) := '-----------------------------------------------------------'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(2589) := '----------------------------------------'||wwv_flow.LF||
'  procedure resequence_dynamic_content'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2590) := 'Update dynamic content seq if it different than new'||wwv_flow.LF||
'    merge into blog_dynamic_content t1'||wwv_flow.LF||
'    using';
wwv_flow_imp.g_varchar2_table(2591) := ' ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2592) := '     ) * 10 as new_display_seq'||wwv_flow.LF||
'      from blog_dynamic_content'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t';
wwv_flow_imp.g_varchar2_table(2593) := '1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v1.new_display_seq'||wwv_flow.LF||
'        wh';
wwv_flow_imp.g_varchar2_table(2594) := 'ere t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end resequence_dynamic_content;'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2595) := '-------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(2596) := '------------------------------------------'||wwv_flow.LF||
'  procedure set_attribute_value('||wwv_flow.LF||
'    p_attribute_list in ';
wwv_flow_imp.g_varchar2_table(2597) := 'apex_t_varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_values  json_object_t;'||wwv_flow.LF||
'    l_keys    json_key_list;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_va';
wwv_flow_imp.g_varchar2_table(2598) := 'lues :='||wwv_flow.LF||
'      json_object_t.parse('||wwv_flow.LF||
'        apex_string.plist_to_json_clob( p_attribute_list )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2599) := ')'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_keys := l_values.get_keys;'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_keys.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      set_attrib';
wwv_flow_imp.g_varchar2_table(2600) := 'ute_value('||wwv_flow.LF||
'        p_attribute_name  => l_keys(i)'||wwv_flow.LF||
'      , p_attribute_value => l_values.get_string( ';
wwv_flow_imp.g_varchar2_table(2601) := 'l_keys(i) )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_attribute_value;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(2602) := '--------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2603) := '-------------------------'||wwv_flow.LF||
'end "BLOG_ADMIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_PLUGIN"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2604) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2605) := '-------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2606) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2607) := '----------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2608) := '-----------------------------------------'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2609) := '----------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(2610) := '---------------------------------------'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2611) := '--------------------'||wwv_flow.LF||
'  function to_html_entities('||wwv_flow.LF||
'    p_number in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2612) := '  l_string varchar2(4000);'||wwv_flow.LF||
'    l_result varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := blog_util.int_to_vc';
wwv_flow_imp.g_varchar2_table(2613) := '2( p_number );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. length( l_string )'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      l_result :='||wwv_flow.LF||
'        apex_string.';
wwv_flow_imp.g_varchar2_table(2614) := 'format('||wwv_flow.LF||
'          p_message => ''%s&#%s'''||wwv_flow.LF||
'        , p0 => l_result'||wwv_flow.LF||
'        , p1 => ascii( substr( l_st';
wwv_flow_imp.g_varchar2_table(2615) := 'ring, i, 1 ) )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_result;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end to_html_entities;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2616) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2617) := '-------------------------------------------------------'||wwv_flow.LF||
'-- Global procedures and functions'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2618) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2619) := '----------------------------------------------------'||wwv_flow.LF||
'  procedure render_math_question_field('||wwv_flow.LF||
'    p_i';
wwv_flow_imp.g_varchar2_table(2620) := 'tem    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_par';
wwv_flow_imp.g_varchar2_table(2621) := 'am   in            apex_plugin.t_item_render_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_r';
wwv_flow_imp.g_varchar2_table(2622) := 'ender_result'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_application.g_debug'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_plugin_util.debug';
wwv_flow_imp.g_varchar2_table(2623) := '_page_item('||wwv_flow.LF||
'        p_plugin      => p_plugin'||wwv_flow.LF||
'      , p_page_item  => p_item'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2624) := '   if not ( p_param.is_readonly or p_param.is_printer_friendly )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sys.htp.p( ''<input ';
wwv_flow_imp.g_varchar2_table(2625) := 'type="text" '''||wwv_flow.LF||
'        || case when p_item.element_width is not null'||wwv_flow.LF||
'            then ''size="'' || p_i';
wwv_flow_imp.g_varchar2_table(2626) := 'tem.element_width ||''" '''||wwv_flow.LF||
'           end'||wwv_flow.LF||
'        || case when p_item.element_max_length  is not null'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2627) := '            then ''maxlength="'' || p_item.element_max_length || ''" '''||wwv_flow.LF||
'           end'||wwv_flow.LF||
'        ||'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2628) := '    apex_plugin_util.get_element_attributes('||wwv_flow.LF||
'            p_item            => p_item'||wwv_flow.LF||
'          , p_n';
wwv_flow_imp.g_varchar2_table(2629) := 'ame            => p_item.name'||wwv_flow.LF||
'          , p_default_class   => ''text_field apex-item-text'''||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2630) := ' , p_add_labelledby  => false'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        || ''value="">'''||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_item.icon_css_';
wwv_flow_imp.g_varchar2_table(2631) := 'classes is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        sys.htp.p(''<span class="apex-item-icon fa '''||wwv_flow.LF||
'          || p_it';
wwv_flow_imp.g_varchar2_table(2632) := 'em.icon_css_classes'||wwv_flow.LF||
'          || ''" aria-hidden="true"></span>'''||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex';
wwv_flow_imp.g_varchar2_table(2633) := '_json.initialize_clob_output;'||wwv_flow.LF||
'      apex_json.open_object;'||wwv_flow.LF||
'      apex_json.write( ''labelId'', p_item.';
wwv_flow_imp.g_varchar2_table(2634) := 'name || ''_LABEL'' );'||wwv_flow.LF||
'      apex_json.write( ''ajaxIdentifier'', apex_plugin.get_ajax_identifier );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2635) := '  apex_json.close_object;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_javascript.add_onload_code('||wwv_flow.LF||
'        p_code =>'||wwv_flow.LF||
'          apex_s';
wwv_flow_imp.g_varchar2_table(2636) := 'tring.format('||wwv_flow.LF||
'            p_message => ''blog.plugin.mathQuestionField.getQuestion(%s)'''||wwv_flow.LF||
'          , p';
wwv_flow_imp.g_varchar2_table(2637) := '0 => apex_json.get_clob_output'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Tell APEX that this input is navigable';
wwv_flow_imp.g_varchar2_table(2638) := ''||wwv_flow.LF||
'      p_result.is_navigable := true;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      p_result.item_rendered := false;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2639) := '  end render_math_question_field;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2640) := '--------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  pr';
wwv_flow_imp.g_varchar2_table(2641) := 'ocedure ajax_math_question_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in  ';
wwv_flow_imp.g_varchar2_table(2642) := '          apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_ajax_param,'||wwv_flow.LF||
'    p_res';
wwv_flow_imp.g_varchar2_table(2643) := 'ult  in out nocopy apex_plugin.t_item_ajax_result'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err   varchar2(4000);'||wwv_flow.LF||
'    l_min   n';
wwv_flow_imp.g_varchar2_table(2644) := 'umber;'||wwv_flow.LF||
'    l_max   number;'||wwv_flow.LF||
'    l_num_1 number;'||wwv_flow.LF||
'    l_num_2 number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_min   := to_number';
wwv_flow_imp.g_varchar2_table(2645) := '( p_item.attribute_01 );'||wwv_flow.LF||
'    l_max   := to_number( p_item.attribute_02 );'||wwv_flow.LF||
'    l_num_1 := round( sys.';
wwv_flow_imp.g_varchar2_table(2646) := 'dbms_random.value( l_min, l_max ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_min   := to_number( p_item.attribute_03 );'||wwv_flow.LF||
'    l_max   :';
wwv_flow_imp.g_varchar2_table(2647) := '= to_number( p_item.attribute_04 );'||wwv_flow.LF||
'    l_num_2 := round( sys.dbms_random.value( l_min, l_max ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2648) := '    -- set correct answer to item session state'||wwv_flow.LF||
'    apex_util.set_session_state('||wwv_flow.LF||
'      p_name   => p';
wwv_flow_imp.g_varchar2_table(2649) := '_item.attribute_05'||wwv_flow.LF||
'    , p_value  => blog_util.int_to_vc2( l_num_1 + l_num_2 )'||wwv_flow.LF||
'    , p_commit => fal';
wwv_flow_imp.g_varchar2_table(2650) := 'se'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Write header for the output'||wwv_flow.LF||
'    apex_plugin_util.print_json_http_header;'||wwv_flow.LF||
'    -- Wr';
wwv_flow_imp.g_varchar2_table(2651) := 'ite output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write('||wwv_flow.LF||
'      ''label'''||wwv_flow.LF||
'      ,apex_string.format('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2652) := '        p_message => ''%s&nbsp;%s&nbsp;&#%s&nbsp;%s&nbsp;&#%s&nbsp;&#%s'''||wwv_flow.LF||
'      , p0 => p_item.plain_l';
wwv_flow_imp.g_varchar2_table(2653) := 'abel'||wwv_flow.LF||
'      , p1 => to_html_entities( l_num_1 )'||wwv_flow.LF||
'      , p2 => ascii(''+'')'||wwv_flow.LF||
'      , p3 => to_html_entiti';
wwv_flow_imp.g_varchar2_table(2654) := 'es( l_num_2 )'||wwv_flow.LF||
'      , p4 => ascii(''='')'||wwv_flow.LF||
'      , p5 => ascii(''?'')'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_json.close_a';
wwv_flow_imp.g_varchar2_table(2655) := 'll;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error( ''ajax_math_question_field error: %s'', sql';
wwv_flow_imp.g_varchar2_table(2656) := 'errm );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_err := apex_lang.get_message('||wwv_flow.LF||
'      p_name => p_plugin.attribute_02'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_';
wwv_flow_imp.g_varchar2_table(2657) := 'err = apex_escape.html( upper( p_plugin.attribute_02 ) )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_err := p_plugin.attribute_';
wwv_flow_imp.g_varchar2_table(2658) := '02;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    raise_application_error( -20002 ,  l_err );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ajax_math_questio';
wwv_flow_imp.g_varchar2_table(2659) := 'n_field;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(2660) := '----------------------------------------------------------------------'||wwv_flow.LF||
'  procedure validate_math_que';
wwv_flow_imp.g_varchar2_table(2661) := 'stion_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin';
wwv_flow_imp.g_varchar2_table(2662) := '.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_validation_param,'||wwv_flow.LF||
'    p_result  in out noc';
wwv_flow_imp.g_varchar2_table(2663) := 'opy apex_plugin.t_item_validation_result'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_answer  varchar2(4000);'||wwv_flow.LF||
'    l_value   varcha';
wwv_flow_imp.g_varchar2_table(2664) := 'r2(4000);'||wwv_flow.LF||
'    l_result  boolean;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_param.value is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_value  ';
wwv_flow_imp.g_varchar2_table(2665) := ' := v(p_item.attribute_05);'||wwv_flow.LF||
'      l_answer  := p_param.value;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Check is answer correct'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2666) := '  l_result  := case when l_value = l_answer then true else false end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      l_result := fa';
wwv_flow_imp.g_varchar2_table(2667) := 'lse;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if not l_result'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      p_result.message := apex_lang.get_message('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2668) := '     p_name => p_plugin.attribute_01'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_result.message = apex_escape.html( upper( ';
wwv_flow_imp.g_varchar2_table(2669) := 'p_plugin.attribute_01 ) )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        p_result.message := p_plugin.attribute_01;'||wwv_flow.LF||
'      end if';
wwv_flow_imp.g_varchar2_table(2670) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end validate_math_question_field;'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2671) := '--------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2672) := '-------------'||wwv_flow.LF||
'end "BLOG_PLUGIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_URL"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(2673) := '------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2674) := '-----------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(2675) := '---------------------------------------------------------'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(2676) := '--------------------------------------'||wwv_flow.LF||
'-- json for pages and items'||wwv_flow.LF||
'  c_page_and_items constant json_';
wwv_flow_imp.g_varchar2_table(2677) := 'object_t := json_object_t.parse('||wwv_flow.LF||
'    ''{'||wwv_flow.LF||
'      "post": {"page": "POST", "items": "P2_POST_ID"},'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2678) := ' "category": {"page": "CATEGORY", "items": "P14_CATEGORY_ID"},'||wwv_flow.LF||
'      "archive": {"page": "ARCHIVES",';
wwv_flow_imp.g_varchar2_table(2679) := ' "items": "P15_ARCHIVE_ID"},'||wwv_flow.LF||
'      "tag": {"page": "TAG", "items": "P6_TAG_ID"},'||wwv_flow.LF||
'      "unsubscribe"';
wwv_flow_imp.g_varchar2_table(2680) := ': {"page": "POST", "items": "P2_POST_ID,P2_SUBSCRIPTION_ID"},'||wwv_flow.LF||
'      "download": {"page": "PGM", "ite';
wwv_flow_imp.g_varchar2_table(2681) := 'ms": "P1003_FILE_NAME", "process": "download"}'||wwv_flow.LF||
'    }'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'-- cache rss and atom url'||wwv_flow.LF||
'  g_rss_url   ';
wwv_flow_imp.g_varchar2_table(2682) := '          varchar2(1024);'||wwv_flow.LF||
'  g_atom_url            varchar2(1024);'||wwv_flow.LF||
'-- cache canonical host url'||wwv_flow.LF||
'  g_ca';
wwv_flow_imp.g_varchar2_table(2683) := 'nonical_host_url  varchar2(1024);'||wwv_flow.LF||
''||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2684) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(2685) := 'Private procedures and functions'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2686) := '-------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- no';
wwv_flow_imp.g_varchar2_table(2687) := 'ne'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(2688) := '----------------------------------------------------------------'||wwv_flow.LF||
'-- Global procedures and functions'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2689) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2690) := '-------------------------------------------------------------'||wwv_flow.LF||
'  procedure set_canonical_host'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2691) := 'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get canonical host from blog settings or use APEX provided value'||wwv_flow.LF||
'    -- cache value to';
wwv_flow_imp.g_varchar2_table(2692) := ' package private variable'||wwv_flow.LF||
'    if g_canonical_host_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      g_canonical_host_url :';
wwv_flow_imp.g_varchar2_table(2693) := '= blog_util.get_attribute_value( ''G_CANONICAL_HOST'' );'||wwv_flow.LF||
'      -- if host not found from settings, use';
wwv_flow_imp.g_varchar2_table(2694) := ' APEX provided value'||wwv_flow.LF||
'      if g_canonical_host_url is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        g_canonical_host_url :';
wwv_flow_imp.g_varchar2_table(2695) := '= apex_util.host_url();'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'      -- remove trailing slash'||wwv_flow.LF||
'      g_canonical_host_url := r';
wwv_flow_imp.g_varchar2_table(2696) := 'trim( g_canonical_host_url, ''/'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_canonical_host;'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2697) := '-------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(2698) := '------------------------------------'||wwv_flow.LF||
'  function get_canonical_host'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2699) := '   return g_canonical_host_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_canonical_host;'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(2700) := '---------------------------------------'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2701) := '--------------------'||wwv_flow.LF||
'  function get_tab('||wwv_flow.LF||
'    p_page        in varchar2,'||wwv_flow.LF||
'    p_application in varchar';
wwv_flow_imp.g_varchar2_table(2702) := '2 default null,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url varcha';
wwv_flow_imp.g_varchar2_table(2703) := 'r2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2704) := '    end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application => p_application'||wwv_flow.LF||
'      , p_page        => ';
wwv_flow_imp.g_varchar2_table(2705) := 'p_page'||wwv_flow.LF||
'      , p_session     => '''''||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tab;'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(2706) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2707) := '--------------------------------------------------------'||wwv_flow.LF||
'  function get_post('||wwv_flow.LF||
'    p_post_id     in n';
wwv_flow_imp.g_varchar2_table(2708) := 'umber,'||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) re';
wwv_flow_imp.g_varchar2_table(2709) := 'turn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := blog_util.int_to_vc2( p_po';
wwv_flow_imp.g_varchar2_table(2710) := 'st_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_post('||wwv_flow.LF||
'        p_post_id     => l_post_id'||wwv_flow.LF||
'      , p_application => p_a';
wwv_flow_imp.g_varchar2_table(2711) := 'pplication'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_post;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2712) := '-----------------------------------------------------------'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(2713) := '----------------------------------------'||wwv_flow.LF||
'  function get_post('||wwv_flow.LF||
'    p_post_id     in varchar2,'||wwv_flow.LF||
'    p_a';
wwv_flow_imp.g_varchar2_table(2714) := 'pplication in varchar2 default null,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2715) := '  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  l_json := c_page_and_items.get_object( ''post'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  return';
wwv_flow_imp.g_varchar2_table(2716) := ''||wwv_flow.LF||
'    case p_canonical'||wwv_flow.LF||
'      when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'    end ||'||wwv_flow.LF||
'    apex_page.get_url('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2717) := '     p_application => p_application'||wwv_flow.LF||
'    , p_page        => l_json.get_string( ''page'' )'||wwv_flow.LF||
'    , p_sessi';
wwv_flow_imp.g_varchar2_table(2718) := 'on     => '''''||wwv_flow.LF||
'    , p_items       => l_json.get_string( ''items'' )'||wwv_flow.LF||
'    , p_values      => p_post_id'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2719) := '  , p_plain_url   => true'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_post;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2720) := '---------------------------------'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2721) := '--------------'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_id in number,'||wwv_flow.LF||
'    p_canonical   in varchar2 d';
wwv_flow_imp.g_varchar2_table(2722) := 'efault ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_category_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_category_id := ';
wwv_flow_imp.g_varchar2_table(2723) := 'blog_util.int_to_vc2( p_category_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_category('||wwv_flow.LF||
'        p_category_id => l_ca';
wwv_flow_imp.g_varchar2_table(2724) := 'tegory_id'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_category;'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2725) := '--------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(2726) := '-------------------------------------------'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_id in varchar2,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2727) := '    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(2728) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'  l_json := c_page_and_items.get_object( ''category'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2729) := ' when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'      end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_page      => l';
wwv_flow_imp.g_varchar2_table(2730) := '_json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session   => '''''||wwv_flow.LF||
'      , p_items     => l_json.get_string( ''item';
wwv_flow_imp.g_varchar2_table(2731) := 's'' )'||wwv_flow.LF||
'      , p_values    => p_category_id'||wwv_flow.LF||
'      , p_plain_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_categ';
wwv_flow_imp.g_varchar2_table(2732) := 'ory;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(2733) := '------------------------------------------------------------------'||wwv_flow.LF||
'  function get_archive('||wwv_flow.LF||
'    p_arc';
wwv_flow_imp.g_varchar2_table(2734) := 'hive_id  in number,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_archiv';
wwv_flow_imp.g_varchar2_table(2735) := 'e_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_archive_id := blog_util.int_to_vc2( p_archive_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2736) := '     get_archive('||wwv_flow.LF||
'        p_archive_id  => l_archive_id'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(2737) := ''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_archive;'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2738) := '-------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(2739) := 'get_archive('||wwv_flow.LF||
'    p_archive_id  in varchar2,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return va';
wwv_flow_imp.g_varchar2_table(2740) := 'rchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get_object( ''archive'' ';
wwv_flow_imp.g_varchar2_table(2741) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'      end  ||'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2742) := '   apex_page.get_url('||wwv_flow.LF||
'        p_page      => l_json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session   => '''''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2743) := '     , p_items     => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values    => p_archive_id'||wwv_flow.LF||
'      , p_pla';
wwv_flow_imp.g_varchar2_table(2744) := 'in_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_archive;'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2745) := '-----------------------------'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2746) := '----------'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id      in number,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''N';
wwv_flow_imp.g_varchar2_table(2747) := 'O'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_tag_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_tag_id := blog_util.int_to_vc';
wwv_flow_imp.g_varchar2_table(2748) := '2( p_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_tag('||wwv_flow.LF||
'        p_tag_id    => l_tag_id'||wwv_flow.LF||
'      , p_canonical => p_c';
wwv_flow_imp.g_varchar2_table(2749) := 'anonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tag;'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2750) := '-------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2751) := ''||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id      in varchar2,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) r';
wwv_flow_imp.g_varchar2_table(2752) := 'eturn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get_object( ''t';
wwv_flow_imp.g_varchar2_table(2753) := 'ag'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'      end ||'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2754) := '      apex_page.get_url('||wwv_flow.LF||
'        p_page      => l_json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session   => ''';
wwv_flow_imp.g_varchar2_table(2755) := ''''||wwv_flow.LF||
'      , p_items     => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values    => p_tag_id'||wwv_flow.LF||
'      , p_plai';
wwv_flow_imp.g_varchar2_table(2756) := 'n_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tag;'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2757) := '------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2758) := '-----'||wwv_flow.LF||
'  function get_dynamic_page('||wwv_flow.LF||
'    p_content_id in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_content';
wwv_flow_imp.g_varchar2_table(2759) := '_id varchar(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_content_id := blog_util.int_to_vc2( p_content_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2760) := '   apex_page.get_url('||wwv_flow.LF||
'        p_page    => ''information'''||wwv_flow.LF||
'      , p_request => l_content_id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2761) := '   ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_dynamic_page;'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2762) := '----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  functi';
wwv_flow_imp.g_varchar2_table(2763) := 'on get_process('||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_process     in varchar2 default nu';
wwv_flow_imp.g_varchar2_table(2764) := 'll,'||wwv_flow.LF||
'    p_items       in varchar2 default null,'||wwv_flow.LF||
'    p_values      in varchar2 default null,'||wwv_flow.LF||
'    p_ca';
wwv_flow_imp.g_varchar2_table(2765) := 'nonical   in varchar2 default ''YES'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_request varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2766) := '   l_request :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''application_process=%s'''||wwv_flow.LF||
'      , p0 =';
wwv_flow_imp.g_varchar2_table(2767) := '> p_process'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'      when ''YES'''||wwv_flow.LF||
'      then g_canonical_';
wwv_flow_imp.g_varchar2_table(2768) := 'host_url end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application => p_application'||wwv_flow.LF||
'      , p_page      ';
wwv_flow_imp.g_varchar2_table(2769) := '  => ''pgm'''||wwv_flow.LF||
'      , p_session     => '''''||wwv_flow.LF||
'      , p_request     => l_request'||wwv_flow.LF||
'      , p_items       => p';
wwv_flow_imp.g_varchar2_table(2770) := '_items'||wwv_flow.LF||
'      , p_values      => p_values'||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_proc';
wwv_flow_imp.g_varchar2_table(2771) := 'ess;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(2772) := '------------------------------------------------------------------'||wwv_flow.LF||
'  function get_unsubscribe('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2773) := '_application     in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_subscription_id in number'||wwv_flow.LF||
'  )';
wwv_flow_imp.g_varchar2_table(2774) := ' return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url     varchar2(4000);'||wwv_flow.LF||
'    l_subs_id varchar2(256);'||wwv_flow.LF||
'    l_json    json_';
wwv_flow_imp.g_varchar2_table(2775) := 'object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get_object( ''unsubscribe'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_subs_id := blo';
wwv_flow_imp.g_varchar2_table(2776) := 'g_util.int_to_vc2( p_subscription_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_url :='||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application';
wwv_flow_imp.g_varchar2_table(2777) := ' => p_application'||wwv_flow.LF||
'      , p_page        => l_json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session     => '''''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2778) := '     , p_items       => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values      => p_post_id || '','' || l_';
wwv_flow_imp.g_varchar2_table(2779) := 'subs_id'||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_canonical_host_url || l_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(2780) := 'd get_unsubscribe;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2781) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_rss(';
wwv_flow_imp.g_varchar2_table(2782) := ''||wwv_flow.LF||
'    p_application in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- get rss url from';
wwv_flow_imp.g_varchar2_table(2783) := ' blog settings or use default value'||wwv_flow.LF||
'    -- cache value to package private variable'||wwv_flow.LF||
'    if g_rss_url ';
wwv_flow_imp.g_varchar2_table(2784) := 'is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- Fetch RSS URL override from settings'||wwv_flow.LF||
'      g_rss_url := blog_util.get_attr';
wwv_flow_imp.g_varchar2_table(2785) := 'ibute_value( ''G_RSS_URL'' );'||wwv_flow.LF||
'      -- If there isn''t override custruct URL'||wwv_flow.LF||
'      if g_rss_url is null';
wwv_flow_imp.g_varchar2_table(2786) := ''||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        g_rss_url :='||wwv_flow.LF||
'          get_process('||wwv_flow.LF||
'            p_application => p_application'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2787) := '         , p_process     => ''rss.xml'''||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_';
wwv_flow_imp.g_varchar2_table(2788) := 'rss_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2789) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function ge';
wwv_flow_imp.g_varchar2_table(2790) := 't_atom('||wwv_flow.LF||
'    p_application in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- cache va';
wwv_flow_imp.g_varchar2_table(2791) := 'lue to package private variable'||wwv_flow.LF||
'    if g_atom_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      g_atom_url :='||wwv_flow.LF||
'        get_p';
wwv_flow_imp.g_varchar2_table(2792) := 'rocess('||wwv_flow.LF||
'          p_application => p_application'||wwv_flow.LF||
'        , p_process     => ''atom.xml'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2793) := '   ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_atom_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_atom;'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(2794) := '--------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2795) := '-------------------'||wwv_flow.LF||
'  function get_rss_xsl('||wwv_flow.LF||
'    p_application in varchar2 default null'||wwv_flow.LF||
'  ) return va';
wwv_flow_imp.g_varchar2_table(2796) := 'rchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xsl_url varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Fetch XSL URL override from settings'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(2797) := '_xsl_url := blog_util.get_attribute_value( ''G_RSS_XSL_URL'' );'||wwv_flow.LF||
'    -- If there isn''t override use def';
wwv_flow_imp.g_varchar2_table(2798) := 'ault XSL'||wwv_flow.LF||
'    if l_xsl_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_xsl_url :='||wwv_flow.LF||
'        get_process('||wwv_flow.LF||
'          p_appli';
wwv_flow_imp.g_varchar2_table(2799) := 'cation => p_application'||wwv_flow.LF||
'        , p_process     => ''rss.xsl'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    retu';
wwv_flow_imp.g_varchar2_table(2800) := 'rn l_xsl_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss_xsl;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2801) := '--------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  fu';
wwv_flow_imp.g_varchar2_table(2802) := 'nction get_sitemap_index('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2803) := '  l_sitemap_url varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_sitemap_url :='||wwv_flow.LF||
'      get_process('||wwv_flow.LF||
'        p_applicati';
wwv_flow_imp.g_varchar2_table(2804) := 'on => p_application'||wwv_flow.LF||
'      , p_process     => ''sitemap-index.xml'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_sitemap';
wwv_flow_imp.g_varchar2_table(2805) := '_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_sitemap_index;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2806) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  func';
wwv_flow_imp.g_varchar2_table(2807) := 'tion get_file('||wwv_flow.LF||
'    p_file_path       in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2808) := '  p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  be';
wwv_flow_imp.g_varchar2_table(2809) := 'gin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get_object( ''download'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_process('||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2810) := ' p_application => p_application'||wwv_flow.LF||
'      , p_process     => l_json.get_string( ''process'' )'||wwv_flow.LF||
'      , p_it';
wwv_flow_imp.g_varchar2_table(2811) := 'ems       => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values      => p_file_path'||wwv_flow.LF||
'      , p_canonical  ';
wwv_flow_imp.g_varchar2_table(2812) := ' => p_canonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_file;'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2813) := '---------------------------'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2814) := '--------'||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2815) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'beg';
wwv_flow_imp.g_varchar2_table(2816) := 'in'||wwv_flow.LF||
'  -- initialize parameters'||wwv_flow.LF||
'  apex_debug.info( ''----- Initialize package BLOG_URL -----'' );'||wwv_flow.LF||
'  set_';
wwv_flow_imp.g_varchar2_table(2817) := 'canonical_host;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2818) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_URL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'crea';
wwv_flow_imp.g_varchar2_table(2819) := 'te or replace package body "BLOG_COMMENT"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2820) := '-------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2821) := '------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2822) := '----------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2823) := '---'||wwv_flow.LF||
'  c_whitelist_tags  constant varchar2(256) := ''<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>'';'||wwv_flow.LF||
'  c_c';
wwv_flow_imp.g_varchar2_table(2824) := 'ode_block_html constant varchar2(256) := ''<pre class="blog-program-code"><code>%s</code></pre>'';'||wwv_flow.LF||
'  c';
wwv_flow_imp.g_varchar2_table(2825) := '_app_email       constant varchar2(256) := blog_util.get_attribute_value( ''G_APP_EMAIL'' );'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2826) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2827) := '----------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(2828) := '---------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(2829) := '--------------------------------------------------'||wwv_flow.LF||
'  procedure remove_html_tags('||wwv_flow.LF||
'    p_string    in ';
wwv_flow_imp.g_varchar2_table(2830) := 'out nocopy varchar2,'||wwv_flow.LF||
'    p_html_tags in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_html_tags apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2831) := '   -- create table of html tags'||wwv_flow.LF||
'    l_html_tags := apex_string.split( p_html_tags, '':'' );'||wwv_flow.LF||
'    -- loo';
wwv_flow_imp.g_varchar2_table(2832) := 'p table'||wwv_flow.LF||
'    for i in 1 .. l_html_tags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      -- remove html tag'||wwv_flow.LF||
'      p_string :='||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2833) := '    regexp_replace('||wwv_flow.LF||
'          p_string'||wwv_flow.LF||
'        , apex_string.format('||wwv_flow.LF||
'            p_message => ''<%0[^';
wwv_flow_imp.g_varchar2_table(2834) := '>]*>(.*?)<\/%0>'''||wwv_flow.LF||
'          , p0 => l_html_tags(i)'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        , '''', 1, 0, ''in'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2835) := '   ;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end remove_html_tags;'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2836) := '------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2837) := '-----'||wwv_flow.LF||
'  procedure remove_ascii('||wwv_flow.LF||
'    p_string in out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove u';
wwv_flow_imp.g_varchar2_table(2838) := 'nwanted ascii codes except new line chr 10'||wwv_flow.LF||
'    for i in 0 .. 31'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      if i != 10 then'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2839) := '   p_string := trim( replace( p_string, chr(i) ) );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
'  end remove_ascii;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2840) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2841) := '-------------------------------------------------------------'||wwv_flow.LF||
'  procedure escape_html('||wwv_flow.LF||
'    p_string ';
wwv_flow_imp.g_varchar2_table(2842) := 'in out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_hasmark constant varchar(10) := ''#HashMark#'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2843) := 'change all hash marks so we can escape those'||wwv_flow.LF||
'    -- after calling apex_escape.html_whitelist'||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2844) := 'escape of hash marks needed to prevent APEX substitutions'||wwv_flow.LF||
'    p_string := replace( p_string, ''#'', l_';
wwv_flow_imp.g_varchar2_table(2845) := 'hasmark );'||wwv_flow.LF||
'    -- escape comment html'||wwv_flow.LF||
'    p_string := apex_escape.html_whitelist('||wwv_flow.LF||
'      p_html      ';
wwv_flow_imp.g_varchar2_table(2846) := '      => p_string'||wwv_flow.LF||
'    , p_whitelist_tags  => c_whitelist_tags'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- escape hash marks'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(2847) := 'string := replace( p_string, l_hasmark, ''	&#35;'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end escape_html;'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2848) := '----------------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2849) := '---------------------------------'||wwv_flow.LF||
'  procedure build_code_tab('||wwv_flow.LF||
'    p_comment   in out nocopy varchar2';
wwv_flow_imp.g_varchar2_table(2850) := ','||wwv_flow.LF||
'    p_code_tab  in out nocopy apex_t_varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_code      varchar2(32700);'||wwv_flow.LF||
'    l_cod';
wwv_flow_imp.g_varchar2_table(2851) := 'e_cnt  pls_integer := 0;'||wwv_flow.LF||
'    l_start_pos pls_integer := 0;'||wwv_flow.LF||
'    l_end_pos   pls_integer := 0;'||wwv_flow.LF||
''||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(2852) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check code open tag count'||wwv_flow.LF||
'    l_code_cnt := regexp_count( p_comment, ''<code>'', 1, ''i'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2853) := '    -- process code tags if open and close count match ( pre check is for valid HTML )'||wwv_flow.LF||
'    if l_code';
wwv_flow_imp.g_varchar2_table(2854) := '_cnt = regexp_count( p_comment, ''<\/code>'', 1, ''i'' )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- collect content inside code ';
wwv_flow_imp.g_varchar2_table(2855) := 'tags to collection'||wwv_flow.LF||
'      for i in 1 .. l_code_cnt'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_code := null;'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- ge';
wwv_flow_imp.g_varchar2_table(2856) := 't code start and end position'||wwv_flow.LF||
'        l_start_pos := instr( lower( p_comment ), ''<code>'' );'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2857) := 'l_end_pos := instr( lower( p_comment ), ''</code>'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_code := trim( substr( p_comment, l_s';
wwv_flow_imp.g_varchar2_table(2858) := 'tart_pos  + 6, l_end_pos - l_start_pos - 6 ) );'||wwv_flow.LF||
'        l_code := trim( trim( both chr(10) from l_co';
wwv_flow_imp.g_varchar2_table(2859) := 'de ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- store code tag content to collection and wrap it to pre tag having class'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2860) := ' apex_string.push('||wwv_flow.LF||
'          p_table => p_code_tab'||wwv_flow.LF||
'        , p_value =>'||wwv_flow.LF||
'            apex_string.form';
wwv_flow_imp.g_varchar2_table(2861) := 'at('||wwv_flow.LF||
'              p_message => c_code_block_html'||wwv_flow.LF||
'            , p0 => l_code'||wwv_flow.LF||
'           )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2862) := ''||wwv_flow.LF||
'        -- substitude handled code tag'||wwv_flow.LF||
'        p_comment :='||wwv_flow.LF||
'          apex_string.format('||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2863) := '   p_message => ''%s%s#BLOG_COMMENT_CODE%s#%s%s'''||wwv_flow.LF||
'          , p0 => rtrim( substr( p_comment, 1, l_sta';
wwv_flow_imp.g_varchar2_table(2864) := 'rt_pos - 1 ), chr(10) )'||wwv_flow.LF||
'          , p1 => chr(10)'||wwv_flow.LF||
'          , p2 => i'||wwv_flow.LF||
'          , p3 => chr(10)'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2865) := '      , p4 => ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end ';
wwv_flow_imp.g_varchar2_table(2866) := 'loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end build_code_tab;'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2867) := '----------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2868) := '---'||wwv_flow.LF||
'  procedure build_comment_html('||wwv_flow.LF||
'    p_comment in out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_temp        ';
wwv_flow_imp.g_varchar2_table(2869) := 'varchar2(32700);'||wwv_flow.LF||
'    l_code_row    pls_integer;'||wwv_flow.LF||
'    l_code_tab    apex_t_varchar2;'||wwv_flow.LF||
'    l_comment_tab';
wwv_flow_imp.g_varchar2_table(2870) := ' apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process code tags'||wwv_flow.LF||
'    build_code_tab('||wwv_flow.LF||
'      p_comment => p_comment';
wwv_flow_imp.g_varchar2_table(2871) := ''||wwv_flow.LF||
'    , p_code_tab => l_code_tab'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- split comment to collection by new line character'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2872) := ' l_comment_tab := apex_string.split( p_comment, chr(10) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- comment is stored to collection'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2873) := '   -- start building comment with prober html tags'||wwv_flow.LF||
'    p_comment := null;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Format comment'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2874) := ' for i in 1 .. l_comment_tab.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_temp := trim( l_comment_tab(i) );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- che';
wwv_flow_imp.g_varchar2_table(2875) := 'ck if row is code block'||wwv_flow.LF||
'      if regexp_like( l_temp, ''^#BLOG_COMMENT_CODE[0-9]+\#$'' )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2876) := '      -- get code block row number'||wwv_flow.LF||
'        l_code_row := regexp_substr( l_temp, ''[0-9]+'' );'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2877) := '-- close p tag, insert code block'||wwv_flow.LF||
'        -- and open p tag again for text'||wwv_flow.LF||
'        p_comment :='||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2878) := '      apex_string.format('||wwv_flow.LF||
'            p_message => ''%s%s'''||wwv_flow.LF||
'          , p0 => p_comment'||wwv_flow.LF||
'          , p1';
wwv_flow_imp.g_varchar2_table(2879) := ' => l_code_tab( l_code_row )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- append text if row is not e';
wwv_flow_imp.g_varchar2_table(2880) := 'mpty'||wwv_flow.LF||
'        if l_temp is not null'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          p_comment :='||wwv_flow.LF||
'            apex_string.forma';
wwv_flow_imp.g_varchar2_table(2881) := 't('||wwv_flow.LF||
'              p_message => ''%s<p>%s</p>'''||wwv_flow.LF||
'            , p0 => p_comment'||wwv_flow.LF||
'            , p1 => l_temp';
wwv_flow_imp.g_varchar2_table(2882) := ''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end build_comment_html;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2883) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2884) := '-------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2885) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(2886) := '----------------------------------------------------------'||wwv_flow.LF||
'  function plain_text('||wwv_flow.LF||
'    p_string in va';
wwv_flow_imp.g_varchar2_table(2887) := 'rchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_string varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := p_string;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2888) := '  -- remove unwanted ascii'||wwv_flow.LF||
'    remove_ascii('||wwv_flow.LF||
'      p_string => l_string'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- Unescape HTML ';
wwv_flow_imp.g_varchar2_table(2889) := 'entities'||wwv_flow.LF||
'    l_string := utl_i18n.unescape_reference( l_string );'||wwv_flow.LF||
'    -- remove code and anchor HTML';
wwv_flow_imp.g_varchar2_table(2890) := ' tags'||wwv_flow.LF||
'    remove_html_tags('||wwv_flow.LF||
'      p_string    => l_string'||wwv_flow.LF||
'    , p_html_tags => ''code'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2891) := 'add space before html tag'||wwv_flow.LF||
'    -- needed for language AI sentence recognition'||wwv_flow.LF||
'    l_string := replace';
wwv_flow_imp.g_varchar2_table(2892) := '( l_string, ''<'', '' <'' );'||wwv_flow.LF||
'    -- remove HTML'||wwv_flow.LF||
'    l_string := apex_escape.striphtml( l_string );'||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(2893) := '- remove extra whitespaces'||wwv_flow.LF||
'    l_string := blog_util.remove_whitespace( l_string );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_st';
wwv_flow_imp.g_varchar2_table(2894) := 'ring;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end plain_text;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2895) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function sh';
wwv_flow_imp.g_varchar2_table(2896) := 'ort_text('||wwv_flow.LF||
'    p_string      in varchar2,'||wwv_flow.LF||
'    p_plain_text  in boolean default true,'||wwv_flow.LF||
'    p_str_length';
wwv_flow_imp.g_varchar2_table(2897) := '  in number default 100'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_length  pls_integer;'||wwv_flow.LF||
'    l_string  varchar2(3';
wwv_flow_imp.g_varchar2_table(2898) := '2700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := p_string;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_plain_text'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_string := plain_text';
wwv_flow_imp.g_varchar2_table(2899) := '( l_string );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_length := instr( l_string, '' '', p_str_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      c';
wwv_flow_imp.g_varchar2_table(2900) := 'ase when l_length > 0'||wwv_flow.LF||
'        then substr( l_string, 1, l_length ) || '' ...'''||wwv_flow.LF||
'        else l_string'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2901) := '     end'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end short_text;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2902) := '--------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  fu';
wwv_flow_imp.g_varchar2_table(2903) := 'nction format_comment('||wwv_flow.LF||
'    p_comment in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_comment varchar2(327';
wwv_flow_imp.g_varchar2_table(2904) := '00);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_comment := p_comment;'||wwv_flow.LF||
'    -- remove unwanted ascii'||wwv_flow.LF||
'    remove_ascii('||wwv_flow.LF||
'      p_str';
wwv_flow_imp.g_varchar2_table(2905) := 'ing => l_comment'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- remove anchors tags'||wwv_flow.LF||
'    remove_html_tags('||wwv_flow.LF||
'      p_string    => l_comm';
wwv_flow_imp.g_varchar2_table(2906) := 'ent'||wwv_flow.LF||
'    , p_html_tags => ''a'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- escape HTML'||wwv_flow.LF||
'    escape_html('||wwv_flow.LF||
'      p_string => l_comment'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2907) := '    );'||wwv_flow.LF||
'    -- build comment HTML'||wwv_flow.LF||
'    build_comment_html('||wwv_flow.LF||
'      p_comment => l_comment'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ap';
wwv_flow_imp.g_varchar2_table(2908) := 'ex_debug.info( ''Formatted comment: %s'', l_comment );'||wwv_flow.LF||
'    -- return comment'||wwv_flow.LF||
'    return l_comment;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2909) := 'end format_comment;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2910) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function validat';
wwv_flow_imp.g_varchar2_table(2911) := 'e_comment('||wwv_flow.LF||
'    p_comment     in varchar2,'||wwv_flow.LF||
'    p_max_length  in number default 4000'||wwv_flow.LF||
'  ) return varcha';
wwv_flow_imp.g_varchar2_table(2912) := 'r2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml       xmltype;'||wwv_flow.LF||
'    l_result    varchar2(32700);'||wwv_flow.LF||
'    l_err_mesg  varchar2(32700);'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2913) := '    xml_parsing_failed exception;'||wwv_flow.LF||
'    pragma exception_init( xml_parsing_failed, -31011 );'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2914) := '    -- check formatted comment length'||wwv_flow.LF||
'    if length( p_comment ) > p_max_length'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- se';
wwv_flow_imp.g_varchar2_table(2915) := 't error message'||wwv_flow.LF||
'      l_err_mesg := ''BLOG_VALIDATION_ERR_COMMENT_LENGTH'';'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      -- check HT';
wwv_flow_imp.g_varchar2_table(2916) := 'ML is valid'||wwv_flow.LF||
'      -- TO DO see item 1 from package specs'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        l_xml := xmltype.create';
wwv_flow_imp.g_varchar2_table(2917) := 'xml('||wwv_flow.LF||
'          apex_string.format('||wwv_flow.LF||
'            p_message => ''<comment>%s</comment>'''||wwv_flow.LF||
'          , p0 =';
wwv_flow_imp.g_varchar2_table(2918) := '> p_comment'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      exception when xml_parsing_failed then'||wwv_flow.LF||
'        -- set error';
wwv_flow_imp.g_varchar2_table(2919) := ' message'||wwv_flow.LF||
'        l_err_mesg := ''BLOG_VALIDATION_ERR_COMMENT_HTML'';'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'      if short_text( ';
wwv_flow_imp.g_varchar2_table(2920) := 'p_comment ) is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- set error message'||wwv_flow.LF||
'        l_err_mesg := ''BLOG_VALIDATION_E';
wwv_flow_imp.g_varchar2_table(2921) := 'RR_COMMENT_PREVIEW'';'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_err_mesg is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- pre';
wwv_flow_imp.g_varchar2_table(2922) := 'pare return validation error message'||wwv_flow.LF||
'      l_result := apex_lang.get_message('||wwv_flow.LF||
'        p_name => l_er';
wwv_flow_imp.g_varchar2_table(2923) := 'r_mesg'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return validation result'||wwv_flow.LF||
'    -- if validation fails we return err';
wwv_flow_imp.g_varchar2_table(2924) := 'or message stored to variable'||wwv_flow.LF||
'    return l_result;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end validate_comment;'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2925) := '--------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2926) := '-------------------------------------'||wwv_flow.LF||
'  function is_email('||wwv_flow.LF||
'    p_email     in varchar2,'||wwv_flow.LF||
'    p_err_me';
wwv_flow_imp.g_varchar2_table(2927) := 'sg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err_mesg varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- TO DO see it';
wwv_flow_imp.g_varchar2_table(2928) := 'em 3 from package specs'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- do some basic check for email address'||wwv_flow.LF||
'    if not regexp_like( p_emai';
wwv_flow_imp.g_varchar2_table(2929) := 'l, ''^.*\@.*\..*$'' )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- if validation fails prepare error message'||wwv_flow.LF||
'      l_err_mesg := ';
wwv_flow_imp.g_varchar2_table(2930) := 'p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end is_email;'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(2931) := '----------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2932) := '---------------------------'||wwv_flow.LF||
'  procedure flag_comment('||wwv_flow.LF||
'    p_comment_id  in varchar2,'||wwv_flow.LF||
'    p_flags    ';
wwv_flow_imp.g_varchar2_table(2933) := '   in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_flags apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_flags := apex_string.split( p_fl';
wwv_flow_imp.g_varchar2_table(2934) := 'ags, '':'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_flags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        insert into blog_comment_';
wwv_flow_imp.g_varchar2_table(2935) := 'flags( comment_id, flag )'||wwv_flow.LF||
'          values( p_comment_id, l_flags(i) )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      exception whe';
wwv_flow_imp.g_varchar2_table(2936) := 'n dup_val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.warn( ''Duplicate flag %s for comment id: %s'', l_fla';
wwv_flow_imp.g_varchar2_table(2937) := 'gs(i), p_comment_id );'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end flag_comment;'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(2938) := '--------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2939) := '-------------------------------'||wwv_flow.LF||
'  procedure unflag_comment('||wwv_flow.LF||
'    p_comment_id  in varchar2,'||wwv_flow.LF||
'    p_fla';
wwv_flow_imp.g_varchar2_table(2940) := 'gs       in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_flags apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_flags := apex_string.split';
wwv_flow_imp.g_varchar2_table(2941) := '( p_flags, '':'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_flags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      delete from blog_comment_flags'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2942) := '    where 1 = 1'||wwv_flow.LF||
'        and comment_id = p_comment_id'||wwv_flow.LF||
'        and flag = l_flags(i)'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      i';
wwv_flow_imp.g_varchar2_table(2943) := 'f sql%rowcount != 1'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.warn( ''Removed %s %s flags from comment id: %s'', s';
wwv_flow_imp.g_varchar2_table(2944) := 'ql%rowcount, l_flags(i), p_comment_id );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end unflag_comment;'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(2945) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(2946) := '------------------------------------------------------'||wwv_flow.LF||
'  procedure new_comment_notify('||wwv_flow.LF||
'    p_post_id';
wwv_flow_imp.g_varchar2_table(2947) := '         in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_email_template  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2948) := '    l_post_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id   := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if application ema';
wwv_flow_imp.g_varchar2_table(2949) := 'il address is not set, exit from procedure'||wwv_flow.LF||
'    if c_app_email is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_debug.warn';
wwv_flow_imp.g_varchar2_table(2950) := '( ''application email address is not set'' );'||wwv_flow.LF||
'      return;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get values for APEX em';
wwv_flow_imp.g_varchar2_table(2951) := 'ail template'||wwv_flow.LF||
'    -- send notify email if blog email address is set'||wwv_flow.LF||
'    -- and blogger has set email'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2952) := '    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        v1.blogger_email'||wwv_flow.LF||
'      , json_object('||wwv_flow.LF||
'          ''APP_NAME''      ';
wwv_flow_imp.g_varchar2_table(2953) := 'value p_app_name'||wwv_flow.LF||
'        , ''BLOGGER_NAME''  value v1.blogger_name'||wwv_flow.LF||
'        , ''POST_TITLE''    value v1.';
wwv_flow_imp.g_varchar2_table(2954) := 'title'||wwv_flow.LF||
'        , ''POST_LINK''     value'||wwv_flow.LF||
'            blog_url.get_post('||wwv_flow.LF||
'              p_post_id   => v1';
wwv_flow_imp.g_varchar2_table(2955) := '.id'||wwv_flow.LF||
'            , p_canonical => ''YES'''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        ) as placeholders'||wwv_flow.LF||
'      from blog_v_all';
wwv_flow_imp.g_varchar2_table(2956) := '_posts v1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and v1.id = l_post_id'||wwv_flow.LF||
'      and v1.blogger_email is not null'||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(2957) := ' loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info('||wwv_flow.LF||
'        ''Send email to: %s from: %s template: %s placeholders: %s'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2958) := '   , c1.blogger_email'||wwv_flow.LF||
'      , c_app_email'||wwv_flow.LF||
'      , p_email_template'||wwv_flow.LF||
'      , c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2959) := '      -- send notify email'||wwv_flow.LF||
'      apex_mail.send('||wwv_flow.LF||
'        p_to                  => c1.blogger_email'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2960) := '     , p_from                => c_app_email'||wwv_flow.LF||
'      , p_template_static_id  => p_email_template'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2961) := ', p_placeholders        => c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end new_comment_notify;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2962) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2963) := '-------------------------------------------------------'||wwv_flow.LF||
'  procedure reply_notify('||wwv_flow.LF||
'    p_app_id      ';
wwv_flow_imp.g_varchar2_table(2964) := '    in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_email_t';
wwv_flow_imp.g_varchar2_table(2965) := 'emplate  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_watch_end     date;'||wwv_flow.LF||
'    l_post_id       number;'||wwv_flow.LF||
'    l_watch_mont';
wwv_flow_imp.g_varchar2_table(2966) := 'hs  number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if application email address i';
wwv_flow_imp.g_varchar2_table(2967) := 's not set, exit from procedure'||wwv_flow.LF||
'    if c_app_email is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_debug.warn( ''applicati';
wwv_flow_imp.g_varchar2_table(2968) := 'on email address is not set'' );'||wwv_flow.LF||
'      return;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch comment watch expires'||wwv_flow.LF||
'    l_';
wwv_flow_imp.g_varchar2_table(2969) := 'watch_months := to_number('||wwv_flow.LF||
'        blog_util.get_attribute_value( ''G_COMMENT_WATCH_MONTHS'' )'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(2970) := ' * -1'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    l_watch_end := add_months( trunc( sysdate ), l_watch_months );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- send notify u';
wwv_flow_imp.g_varchar2_table(2971) := 'sers that have subscribed to replies to comment'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select t2.email'||wwv_flow.LF||
'      ,json_obj';
wwv_flow_imp.g_varchar2_table(2972) := 'ect('||wwv_flow.LF||
'         ''APP_NAME''         value p_app_name'||wwv_flow.LF||
'        ,''POST_TITLE''       value v1.title'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2973) := ' ,''POST_LINK''        value'||wwv_flow.LF||
'            blog_url.get_post('||wwv_flow.LF||
'              p_application => p_app_id'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2974) := '          , p_post_id     => p_post_id'||wwv_flow.LF||
'            , p_canonical   => ''YES'''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        ,''';
wwv_flow_imp.g_varchar2_table(2975) := 'UNSUBSCRIBE_LINK'' value'||wwv_flow.LF||
'            blog_url.get_unsubscribe('||wwv_flow.LF||
'              p_application     => p_a';
wwv_flow_imp.g_varchar2_table(2976) := 'pp_id'||wwv_flow.LF||
'            , p_post_id         => p_post_id'||wwv_flow.LF||
'            , p_subscription_id => t1.id'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2977) := '    )'||wwv_flow.LF||
'       ) as placeholders'||wwv_flow.LF||
'      from blog_comment_subscribers t1'||wwv_flow.LF||
'      join blog_subscribers_em';
wwv_flow_imp.g_varchar2_table(2978) := 'ail t2'||wwv_flow.LF||
'        on t1.email_id = t2.id'||wwv_flow.LF||
'      join blog_v_all_posts v1'||wwv_flow.LF||
'        on t1.post_id = v1.id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2979) := '     where 1 = 1'||wwv_flow.LF||
'        and t1.is_active'||wwv_flow.LF||
'          * t2.is_active'||wwv_flow.LF||
'          * case v1.post_status_c';
wwv_flow_imp.g_varchar2_table(2980) := 'ode when ''PUBLISHED'' then 1 else 0 end'||wwv_flow.LF||
'          = 1'||wwv_flow.LF||
'        and v1.id = l_post_id'||wwv_flow.LF||
'        -- send n';
wwv_flow_imp.g_varchar2_table(2981) := 'otification if subscription is created less than months ago specified in settings'||wwv_flow.LF||
'        and t1.sub';
wwv_flow_imp.g_varchar2_table(2982) := 'scription_date > l_watch_end'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info('||wwv_flow.LF||
'        ''Send email to: %s from: %s ';
wwv_flow_imp.g_varchar2_table(2983) := 'template: %s placeholders: %s'''||wwv_flow.LF||
'      , c1.email'||wwv_flow.LF||
'      , c_app_email'||wwv_flow.LF||
'      , p_email_template'||wwv_flow.LF||
'      ,';
wwv_flow_imp.g_varchar2_table(2984) := ' c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      -- send notify email'||wwv_flow.LF||
'      apex_mail.send('||wwv_flow.LF||
'        p_from => c_app_e';
wwv_flow_imp.g_varchar2_table(2985) := 'mail'||wwv_flow.LF||
'      , p_to => c1.email'||wwv_flow.LF||
'      , p_template_static_id => p_email_template'||wwv_flow.LF||
'      , p_placeholder';
wwv_flow_imp.g_varchar2_table(2986) := 's => c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end reply_notify;'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(2987) := '----------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2988) := '---------------------------'||wwv_flow.LF||
'  procedure subscribe('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
'    p_email   in varch';
wwv_flow_imp.g_varchar2_table(2989) := 'ar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_email     varchar2(256);'||wwv_flow.LF||
'    l_post_id   number;'||wwv_flow.LF||
'    l_email_id  number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2990) := ''||wwv_flow.LF||
'    l_email   := trim( lower( p_email ) );'||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- subscri';
wwv_flow_imp.g_varchar2_table(2991) := 'be user to get notify on reply to comment'||wwv_flow.LF||
'    if p_email is not null'||wwv_flow.LF||
'    and p_post_id is not null'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2992) := '   then'||wwv_flow.LF||
'      -- check if email address already exists and fetch id'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        select id'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2993) := '      into l_email_id'||wwv_flow.LF||
'        from blog_subscribers_email'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and email = ';
wwv_flow_imp.g_varchar2_table(2994) := 'l_email'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if email address not exists, insert and return id'||wwv_flow.LF||
'      exception when no';
wwv_flow_imp.g_varchar2_table(2995) := '_data_found'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        insert into'||wwv_flow.LF||
'            blog_subscribers_email( email, is_active )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2996) := '      values'||wwv_flow.LF||
'          ( l_email, 1 )'||wwv_flow.LF||
'        returning id into l_email_id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2997) := '  -- insert post to email relation'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        insert into'||wwv_flow.LF||
'          blog_comment_subscriber';
wwv_flow_imp.g_varchar2_table(2998) := 's( post_id, email_id, subscription_date, is_active )'||wwv_flow.LF||
'        values'||wwv_flow.LF||
'          ( p_post_id, l_email_i';
wwv_flow_imp.g_varchar2_table(2999) := 'd, trunc( sysdate ), 1 )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if subscription already exists update subscription'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3000) := ' exception when dup_val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        update blog_comment_subscribers'||wwv_flow.LF||
'          set su';
null;
end;
/
begin
wwv_flow_imp.g_varchar2_table(3001) := 'bscription_date = trunc( sysdate )'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and is_active = 1'||wwv_flow.LF||
'          and pos';
wwv_flow_imp.g_varchar2_table(3002) := 't_id = p_post_id'||wwv_flow.LF||
'          and email_id = l_email_id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end subscri';
wwv_flow_imp.g_varchar2_table(3003) := 'be;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(3004) := '-----------------------------------------------------------------'||wwv_flow.LF||
'  procedure unsubscribe('||wwv_flow.LF||
'    p_sub';
wwv_flow_imp.g_varchar2_table(3005) := 'scription_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove user subscribtion to get notify from replies';
wwv_flow_imp.g_varchar2_table(3006) := ''||wwv_flow.LF||
'    delete'||wwv_flow.LF||
'      from blog_comment_subscribers'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and id = p_subscription_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3007) := ' ;'||wwv_flow.LF||
'  end unsubscribe;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3008) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure auto';
wwv_flow_imp.g_varchar2_table(3009) := '_approve('||wwv_flow.LF||
'    p_comment_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_cnt number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Aut';
wwv_flow_imp.g_varchar2_table(3010) := 'omaticallu approve comment id %s if sentiment is Positive'', p_comment_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check that comme';
wwv_flow_imp.g_varchar2_table(3011) := 'nt exists'||wwv_flow.LF||
'    select 1'||wwv_flow.LF||
'    into l_cnt'||wwv_flow.LF||
'    from blog_comment_sentiments t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and ';
wwv_flow_imp.g_varchar2_table(3012) := 't1.comment_id = p_comment_id'||wwv_flow.LF||
'      and t1.sentiment_json.documentSentiment = ''Positive'''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(3013) := '- remove MODERATE flag'||wwv_flow.LF||
'    unflag_comment('||wwv_flow.LF||
'      p_comment_id  => p_comment_id'||wwv_flow.LF||
'    , p_flags       =';
wwv_flow_imp.g_varchar2_table(3014) := '> ''MODERATE'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set comment active'||wwv_flow.LF||
'    update blog_comments'||wwv_flow.LF||
'      set is_active = 1'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3015) := 'where 1 = 1'||wwv_flow.LF||
'      and id = p_comment_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when no_data_found'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    apex_debug.';
wwv_flow_imp.g_varchar2_table(3016) := 'warn( ''Comment id %s not found for automatic approve'', p_comment_id );'||wwv_flow.LF||
'  end auto_approve;'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(3017) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(3018) := '----------------------------------------------------'||wwv_flow.LF||
'end "BLOG_COMMENT";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package';
wwv_flow_imp.g_varchar2_table(3019) := ' body "BLOG_HTML"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3020) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private consta';
wwv_flow_imp.g_varchar2_table(3021) := 'nts and variables'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(3022) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  c_link_canonical_';
wwv_flow_imp.g_varchar2_table(3023) := 'template constant varchar2(64) := ''<link rel="canonical" href="%s">'';'||wwv_flow.LF||
'  c_link_alternate_template co';
wwv_flow_imp.g_varchar2_table(3024) := 'nstant varchar2(64) := ''<link rel="alternate" href="%s" title="%s &raquo; %s" type="%s">'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  g_link';
wwv_flow_imp.g_varchar2_table(3025) := '_canonical varchar2(1024);'||wwv_flow.LF||
''||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3026) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private';
wwv_flow_imp.g_varchar2_table(3027) := ' procedures and functions'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3028) := '------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(3029) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(3030) := '---------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3031) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3032) := '------------------------------------------------------'||wwv_flow.LF||
'  function get_robots_noindex_meta'||wwv_flow.LF||
'  return v';
wwv_flow_imp.g_varchar2_table(3033) := 'archar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return ''<meta name="robots" value="noindex">'';'||wwv_flow.LF||
'  end get_robots_noindex_met';
wwv_flow_imp.g_varchar2_table(3034) := 'a;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(3035) := '----------------------------------------------------------------'||wwv_flow.LF||
'  function set_tab_canonical_link('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3036) := '    p_page  in varchar2,'||wwv_flow.LF||
'    p_url   out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- gen';
wwv_flow_imp.g_varchar2_table(3037) := 'erate canonical link for tab'||wwv_flow.LF||
'    if p_page is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_url :='||wwv_flow.LF||
'        blog_url.get_';
wwv_flow_imp.g_varchar2_table(3038) := 'tab('||wwv_flow.LF||
'          p_page       => p_page'||wwv_flow.LF||
'        , p_canonical  => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link';
wwv_flow_imp.g_varchar2_table(3039) := '_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => c_link_canonical_template'||wwv_flow.LF||
'        ,';
wwv_flow_imp.g_varchar2_table(3040) := ' p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      -- if p_page is not defined'||wwv_flow.LF||
'      apex_debug.warn( ''Ca';
wwv_flow_imp.g_varchar2_table(3041) := 'nonical link tag not generated for tab.'' );'||wwv_flow.LF||
'      g_link_canonical := get_robots_noindex_meta;'||wwv_flow.LF||
'    e';
wwv_flow_imp.g_varchar2_table(3042) := 'nd if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_tab_canonical_link;'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(3043) := '------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3044) := '-----------------------------'||wwv_flow.LF||
'  function set_post_canonical_link('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
'    p_u';
wwv_flow_imp.g_varchar2_table(3045) := 'rl     out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link for post'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3046) := '    if p_post_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_url :='||wwv_flow.LF||
'        blog_url.get_post('||wwv_flow.LF||
'          p_post_id ';
wwv_flow_imp.g_varchar2_table(3047) := '     => p_post_id'||wwv_flow.LF||
'        , p_canonical    => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3048) := '    apex_string.format('||wwv_flow.LF||
'          p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3049) := '   )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.warn( ''Canonical link tag not generated for post.'' );'||wwv_flow.LF||
'      g';
wwv_flow_imp.g_varchar2_table(3050) := '_link_canonical := get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_pos';
wwv_flow_imp.g_varchar2_table(3051) := 't_canonical_link;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(3052) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'  function set_categ';
wwv_flow_imp.g_varchar2_table(3053) := 'ory_canonical_link('||wwv_flow.LF||
'    p_category_id in varchar2,'||wwv_flow.LF||
'    p_url         out nocopy varchar2'||wwv_flow.LF||
'  ) return ';
wwv_flow_imp.g_varchar2_table(3054) := 'varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link for category'||wwv_flow.LF||
'    if p_category_id is not null'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3055) := '   then'||wwv_flow.LF||
'      p_url :='||wwv_flow.LF||
'        blog_url.get_category('||wwv_flow.LF||
'          p_category_id  => p_category_id'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3056) := '    , p_canonical    => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format';
wwv_flow_imp.g_varchar2_table(3057) := '('||wwv_flow.LF||
'          p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3058) := '      apex_debug.warn( ''Canonical link tag not generated for category.'' );'||wwv_flow.LF||
'      g_link_canonical :=';
wwv_flow_imp.g_varchar2_table(3059) := ' get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_category_canonical_li';
wwv_flow_imp.g_varchar2_table(3060) := 'nk;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(3061) := '-----------------------------------------------------------------'||wwv_flow.LF||
'  function set_archive_canonical_l';
wwv_flow_imp.g_varchar2_table(3062) := 'ink('||wwv_flow.LF||
'    p_archive_id in varchar2,'||wwv_flow.LF||
'    p_url        out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  b';
wwv_flow_imp.g_varchar2_table(3063) := 'egin'||wwv_flow.LF||
'      -- generate canonical link for archives'||wwv_flow.LF||
'    if p_archive_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_';
wwv_flow_imp.g_varchar2_table(3064) := 'url :='||wwv_flow.LF||
'        blog_url.get_archive('||wwv_flow.LF||
'          p_archive_id => p_archive_id'||wwv_flow.LF||
'        , p_canonical  =';
wwv_flow_imp.g_varchar2_table(3065) := '> ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message ';
wwv_flow_imp.g_varchar2_table(3066) := '=> c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.warn(';
wwv_flow_imp.g_varchar2_table(3067) := ' ''Canonical link tag not generated for archive.'' );'||wwv_flow.LF||
'      g_link_canonical := get_robots_noindex_met';
wwv_flow_imp.g_varchar2_table(3068) := 'a;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_archive_canonical_link;'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(3069) := '------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(3070) := '-----------------------------------------'||wwv_flow.LF||
'  function set_tag_canonical_link('||wwv_flow.LF||
'    p_tag_id in varchar';
wwv_flow_imp.g_varchar2_table(3071) := '2,'||wwv_flow.LF||
'    p_url    out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link ';
wwv_flow_imp.g_varchar2_table(3072) := 'for tags'||wwv_flow.LF||
'    if p_tag_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_url :='||wwv_flow.LF||
'        blog_url.get_tag('||wwv_flow.LF||
'          p_t';
wwv_flow_imp.g_varchar2_table(3073) := 'ag_id     => p_tag_id'||wwv_flow.LF||
'        , p_canonical  => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3074) := '      apex_string.format('||wwv_flow.LF||
'          p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3075) := '     )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.warn( ''Canonical link tag not generated for tag.'' );'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3076) := 'g_link_canonical := get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_ta';
wwv_flow_imp.g_varchar2_table(3077) := 'g_canonical_link;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(3078) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_rss_a';
wwv_flow_imp.g_varchar2_table(3079) := 'nchor('||wwv_flow.LF||
'    p_app_name  in varchar2,'||wwv_flow.LF||
'    p_message   in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_rss_u';
wwv_flow_imp.g_varchar2_table(3080) := 'rl     varchar2(4000);'||wwv_flow.LF||
'    l_rss_anchor  varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get rss url'||wwv_flow.LF||
'    l_rss_url :';
wwv_flow_imp.g_varchar2_table(3081) := '=  blog_url.get_rss;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate RSS anchor'||wwv_flow.LF||
'    l_rss_anchor :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3082) := '   p_message =>'||wwv_flow.LF||
'          ''<a href="%s" aria-label="%s &raquo; %s" rel="alternate" type="%s" class="';
wwv_flow_imp.g_varchar2_table(3083) := '%s">'''||wwv_flow.LF||
'          || ''<span aria-hidden="true" class="%s"></span>'''||wwv_flow.LF||
'          || ''</a>'''||wwv_flow.LF||
'      , p0 => l';
wwv_flow_imp.g_varchar2_table(3084) := '_rss_url'||wwv_flow.LF||
'      , p1 => p_app_name'||wwv_flow.LF||
'      , p2 => p_message'||wwv_flow.LF||
'      , p3 => blog_util.g_mime_rss'||wwv_flow.LF||
'      ,';
wwv_flow_imp.g_varchar2_table(3085) := ' p4 => ''t-Button t-Button--noLabel t-Button--icon t-Button--link'''||wwv_flow.LF||
'      , p5 => ''fa fa-rss-square fa';
wwv_flow_imp.g_varchar2_table(3086) := '-3x fa-lg u-color-8-text'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- return generated HTML'||wwv_flow.LF||
'    return l_rss_anchor;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end';
wwv_flow_imp.g_varchar2_table(3087) := ' get_rss_anchor;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(3088) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_rss_li';
wwv_flow_imp.g_varchar2_table(3089) := 'nk('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_message       in varchar';
wwv_flow_imp.g_varchar2_table(3090) := '2,'||wwv_flow.LF||
'    p_build_option  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_app_id    number;'||wwv_flow.LF||
'    l_rss_url   ';
wwv_flow_imp.g_varchar2_table(3091) := 'varchar2(256);'||wwv_flow.LF||
'    l_rss_link  varchar2(2000);'||wwv_flow.LF||
'    --l_rss_title varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_app_';
wwv_flow_imp.g_varchar2_table(3092) := 'id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build option should HTML generated'||wwv_flow.LF||
'    if'||wwv_flow.LF||
'      apex_appl';
wwv_flow_imp.g_varchar2_table(3093) := 'ication_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id    => l_app_id'||wwv_flow.LF||
'      , p_build_optio';
wwv_flow_imp.g_varchar2_table(3094) := 'n_name => p_build_option'||wwv_flow.LF||
'      ) = apex_application_admin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3095) := '   -- get rss url'||wwv_flow.LF||
'      l_rss_url := blog_url.get_rss;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- generate HTML'||wwv_flow.LF||
'      l_rss_link :='||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3096) := '       apex_string.format('||wwv_flow.LF||
'          p_message => c_link_alternate_template'||wwv_flow.LF||
'        , p0 => l_rss_ur';
wwv_flow_imp.g_varchar2_table(3097) := 'l'||wwv_flow.LF||
'        , p1 => p_app_name'||wwv_flow.LF||
'        , p2 => p_message'||wwv_flow.LF||
'        , p3 => blog_util.g_mime_rss'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3098) := ')'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return generated HTML'||wwv_flow.LF||
'    return l_rss_link;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss_link;'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(3099) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(3100) := '--------------------------------------------------------'||wwv_flow.LF||
'  function get_atom_link('||wwv_flow.LF||
'    p_app_id     ';
wwv_flow_imp.g_varchar2_table(3101) := '   in varchar2,'||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_message       in varchar2,'||wwv_flow.LF||
'    p_build_option';
wwv_flow_imp.g_varchar2_table(3102) := '  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_app_id      number;'||wwv_flow.LF||
'    l_atom_url    varchar2(256);'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3103) := '  l_atom_link   varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build ';
wwv_flow_imp.g_varchar2_table(3104) := 'option should HTML generated'||wwv_flow.LF||
'    if'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_';
wwv_flow_imp.g_varchar2_table(3105) := 'application_id    => l_app_id'||wwv_flow.LF||
'      , p_build_option_name => p_build_option'||wwv_flow.LF||
'      ) = apex_applicati';
wwv_flow_imp.g_varchar2_table(3106) := 'on_admin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- get atom url'||wwv_flow.LF||
'      l_atom_url := blog_url.g';
wwv_flow_imp.g_varchar2_table(3107) := 'et_atom;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- generate HTML'||wwv_flow.LF||
'      l_atom_link :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_messag';
wwv_flow_imp.g_varchar2_table(3108) := 'e => c_link_alternate_template'||wwv_flow.LF||
'        , p0 => l_atom_url'||wwv_flow.LF||
'        , p1 => p_app_name'||wwv_flow.LF||
'        , p2 =>';
wwv_flow_imp.g_varchar2_table(3109) := ' p_message'||wwv_flow.LF||
'        , p3 => blog_util.g_mime_atom'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return genera';
wwv_flow_imp.g_varchar2_table(3110) := 'ted HTML'||wwv_flow.LF||
'    return l_atom_link;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_atom_link;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(3111) := '-----------------------------------'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3112) := '----------------'||wwv_flow.LF||
'  function get_button('||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_title           in ';
wwv_flow_imp.g_varchar2_table(3113) := 'varchar2,'||wwv_flow.LF||
'    p_action          in varchar2,'||wwv_flow.LF||
'    p_icon_classes    in varchar2,'||wwv_flow.LF||
'    p_button_classes';
wwv_flow_imp.g_varchar2_table(3114) := '  in varchar2 default null,'||wwv_flow.LF||
'    p_build_option    in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3115) := '    l_app_id  number;'||wwv_flow.LF||
'    l_button  varchar2(32700) := ''<span class="blog-hidden"></span>'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3116) := ''||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build option should button generated'||wwv_flow.LF||
'    if p_';
wwv_flow_imp.g_varchar2_table(3117) := 'build_option is null or'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_';
wwv_flow_imp.g_varchar2_table(3118) := 'id    => l_app_id'||wwv_flow.LF||
'      , p_build_option_name => p_build_option'||wwv_flow.LF||
'      ) = apex_application_admin.c_b';
wwv_flow_imp.g_varchar2_table(3119) := 'uild_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- generate button HTML'||wwv_flow.LF||
'      l_button :='||wwv_flow.LF||
'        apex_str';
wwv_flow_imp.g_varchar2_table(3120) := 'ing.format('||wwv_flow.LF||
'          p_message =>'||wwv_flow.LF||
'            ''<button type="button" data-action="%0" title="%1" ar';
wwv_flow_imp.g_varchar2_table(3121) := 'ia-label="%1" class="%2" data-no-update="true">'' ||'||wwv_flow.LF||
'            ''<span class="t-Icon fa %3" aria-hid';
wwv_flow_imp.g_varchar2_table(3122) := 'den="true"></span>'' ||'||wwv_flow.LF||
'            ''</button>'''||wwv_flow.LF||
'        , p0 => p_action'||wwv_flow.LF||
'        , p1 => p_title'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3123) := '    , p2 => coalesce( p_button_classes, ''t-Button t-Button--noLabel t-Button--icon t-Button--link'' )';
wwv_flow_imp.g_varchar2_table(3124) := ''||wwv_flow.LF||
'        , p3 => p_icon_classes'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_button;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_butto';
wwv_flow_imp.g_varchar2_table(3125) := 'n;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(3126) := '----------------------------------------------------------------'||wwv_flow.LF||
'  procedure prn_html('||wwv_flow.LF||
'    p_markdow';
wwv_flow_imp.g_varchar2_table(3127) := 'n in apex_application_global.vc_arr2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_response clob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response := apex_s';
wwv_flow_imp.g_varchar2_table(3128) := 'tring.table_to_clob('||wwv_flow.LF||
'      p_table => p_markdown'||wwv_flow.LF||
'    , p_sep   => null'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response := ape';
wwv_flow_imp.g_varchar2_table(3129) := 'x_markdown.to_html('||wwv_flow.LF||
'      p_markdown              => l_response'||wwv_flow.LF||
'    , p_softbreak             => ape';
wwv_flow_imp.g_varchar2_table(3130) := 'x_application.lf'||wwv_flow.LF||
'    , p_embedded_html_mode    => apex_markdown.c_embedded_html_escape'||wwv_flow.LF||
'    , p_extra';
wwv_flow_imp.g_varchar2_table(3131) := '_link_attributes => apex_t_varchar2( ''target'', ''_blank'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_util.prn('||wwv_flow.LF||
'      p_clob   ';
wwv_flow_imp.g_varchar2_table(3132) := ' => l_response'||wwv_flow.LF||
'    , p_escape  => false'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end prn_html;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(3133) := '--------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3134) := '-------------------------'||wwv_flow.LF||
'end "BLOG_HTML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_OCI_OS"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3135) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3136) := '------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(3137) := '----------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(3138) := '---------------------------------------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  type str_t is table of varchar2( 2000 ) index';
wwv_flow_imp.g_varchar2_table(3139) := ' by varchar2( 60 );'||wwv_flow.LF||
''||wwv_flow.LF||
'-- variables'||wwv_flow.LF||
'  param_t           str_t;'||wwv_flow.LF||
'  response_heade_t  str_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(3140) := '---------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(3141) := '--------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(3142) := '-------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(3143) := '------------------------------------------------'||wwv_flow.LF||
'  procedure init_params'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set va';
wwv_flow_imp.g_varchar2_table(3144) := 'lus for session'||wwv_flow.LF||
'    param_t( ''build_option_name'' ) := ''BLOG_FEATURE_OCI_OBJECT_STORAGE'';'||wwv_flow.LF||
'    param_t';
wwv_flow_imp.g_varchar2_table(3145) := '( ''module_static_id'' ) := ''BLOG_OBJECT_STORAGE_OBJECT'';'||wwv_flow.LF||
'    param_t( ''remote_server_static_id'' ) := ';
wwv_flow_imp.g_varchar2_table(3146) := '''BLOG_OBJECT_STORAGE'';'||wwv_flow.LF||
'    param_t( ''bucket_param_name'' ) := ''G_OCI_OS_BUCKET'';'||wwv_flow.LF||
'    param_t( ''namesp';
wwv_flow_imp.g_varchar2_table(3147) := 'ace_param_name'' ) := ''G_OCI_OS_NAMESPACE'';'||wwv_flow.LF||
'    param_t( ''region_param_name'' ) := ''G_OCI_OS_REGION'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3148) := '    param_t( ''bucket_url_param_name'' ) := ''G_OCI_OS_BUCKET_URL'';'||wwv_flow.LF||
'    param_t( ''bucket'' ) := blog_uti';
wwv_flow_imp.g_varchar2_table(3149) := 'l.get_attribute_value( param_t( ''bucket_param_name'' ) );'||wwv_flow.LF||
'    param_t( ''namespace'' ) := blog_util.get';
wwv_flow_imp.g_varchar2_table(3150) := '_attribute_value( param_t( ''namespace_param_name'' ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- query REST source module credential i';
wwv_flow_imp.g_varchar2_table(3151) := 'd and base url for session'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      t2.base_url'||wwv_flow.LF||
'    , t1.credential_static_id'||wwv_flow.LF||
'    into param';
wwv_flow_imp.g_varchar2_table(3152) := '_t( ''base_url'' ), param_t( ''credential'' )'||wwv_flow.LF||
'    from apex_appl_web_src_modules t1'||wwv_flow.LF||
'    join apex_worksp';
wwv_flow_imp.g_varchar2_table(3153) := 'ace_remote_servers t2 on 1 = 1'||wwv_flow.LF||
'      and t1.remote_server_static_id = t2.remote_server_static_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3154) := ' where 1 = 1'||wwv_flow.LF||
'      and t1.application_id = apex_application.g_flow_id'||wwv_flow.LF||
'      and t1.module_static_id ';
wwv_flow_imp.g_varchar2_table(3155) := '= param_t( ''module_static_id'' )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Debug parameters'||wwv_flow.LF||
'    apex_debug.info( ''Object storage ';
wwv_flow_imp.g_varchar2_table(3156) := 'build option name: %s'', param_t( ''build_option_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage modul';
wwv_flow_imp.g_varchar2_table(3157) := 'e static id: %s'', param_t( ''module_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage remote serve';
wwv_flow_imp.g_varchar2_table(3158) := 'r static id: %s'', param_t( ''remote_server_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage bucke';
wwv_flow_imp.g_varchar2_table(3159) := 't parameter name: %s'', param_t( ''bucket_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage namesp';
wwv_flow_imp.g_varchar2_table(3160) := 'ace parameter name: %s'', param_t( ''namespace_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage r';
wwv_flow_imp.g_varchar2_table(3161) := 'egion parameter name: %s'', param_t( ''region_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage bu';
wwv_flow_imp.g_varchar2_table(3162) := 'cket url parameter name: %s'', param_t( ''bucket_url_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object sto';
wwv_flow_imp.g_varchar2_table(3163) := 'rage bucket: %s'', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage namespace: %s'', param_';
wwv_flow_imp.g_varchar2_table(3164) := 't( ''namespace'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage base URL: %s'', param_t( ''base_url'' ) );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3165) := ' apex_debug.info( ''Object storage credential: %s'', param_t( ''credential'' ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end init_params;'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(3166) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(3167) := '-----------------------------------------------------------'||wwv_flow.LF||
'  procedure process_headers('||wwv_flow.LF||
'    p_is_er';
wwv_flow_imp.g_varchar2_table(3168) := 'ror in boolean'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_resp_status_msg constant varchar2(256) := ''Request HTTP status: %s - %';
wwv_flow_imp.g_varchar2_table(3169) := 's'';'||wwv_flow.LF||
'    l_resp_header_msg constant varchar2(256) := ''Response header %s: %s'';'||wwv_flow.LF||
'    l_req_header_msg c';
wwv_flow_imp.g_varchar2_table(3170) := 'onstant varchar2(256) := ''Request header %s: %s'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- debug request status'||wwv_flow.LF||
'    apex_debu';
wwv_flow_imp.g_varchar2_table(3171) := 'g.info( l_resp_status_msg, apex_web_service.g_status_code, apex_web_service.g_reason_phrase );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3172) := '-- if error debug request headers'||wwv_flow.LF||
'    if p_is_error'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( l_resp_status_';
wwv_flow_imp.g_varchar2_table(3173) := 'msg, apex_web_service.g_status_code, apex_web_service.g_reason_phrase );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- loop request head';
wwv_flow_imp.g_varchar2_table(3174) := 'ers'||wwv_flow.LF||
'      for i in 1 .. apex_web_service.g_request_headers.count'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
'        apex_debug.error';
wwv_flow_imp.g_varchar2_table(3175) := '( l_req_header_msg, apex_web_service.g_request_headers(i).name , apex_web_service.g_request_headers(';
wwv_flow_imp.g_varchar2_table(3176) := 'i).value );'||wwv_flow.LF||
'      end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop response headers and store it array'||wwv_flow.LF||
'    for i ';
wwv_flow_imp.g_varchar2_table(3177) := 'in 1 .. apex_web_service.g_headers.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_is_error'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug';
wwv_flow_imp.g_varchar2_table(3178) := '.error( l_resp_header_msg, apex_web_service.g_headers(i).name , apex_web_service.g_headers(i).value ';
wwv_flow_imp.g_varchar2_table(3179) := ');'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        apex_debug.info( l_resp_header_msg, apex_web_service.g_headers(i).name , apex_';
wwv_flow_imp.g_varchar2_table(3180) := 'web_service.g_headers(i).value );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- save response header to array for getting ';
wwv_flow_imp.g_varchar2_table(3181) := 'value by header name'||wwv_flow.LF||
'      response_heade_t( lower( trim( apex_web_service.g_headers(i).name ) ) ) :';
wwv_flow_imp.g_varchar2_table(3182) := '='||wwv_flow.LF||
'        trim( apex_web_service.g_headers(i).value )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end process_headers;';
wwv_flow_imp.g_varchar2_table(3183) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(3184) := '--------------------------------------------------------------'||wwv_flow.LF||
'  function get_response_header('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(3185) := '_header in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_header varchar2(256);'||wwv_flow.LF||
'    l_result varchar2(256);';
wwv_flow_imp.g_varchar2_table(3186) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_header := trim( lower( p_header ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get header by name if it exists in arra';
wwv_flow_imp.g_varchar2_table(3187) := 'y'||wwv_flow.LF||
'    if response_heade_t.exists( l_header )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_result := response_heade_t( l_header )';
wwv_flow_imp.g_varchar2_table(3188) := ';'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_result;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_response_header;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(3189) := '--------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3190) := '-------------------------'||wwv_flow.LF||
'  procedure append_default_request_headers'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- append def';
wwv_flow_imp.g_varchar2_table(3191) := 'ault headers'||wwv_flow.LF||
'    apex_web_service.set_request_headers('||wwv_flow.LF||
'      p_reset     => false'||wwv_flow.LF||
'    , p_name_01   ';
wwv_flow_imp.g_varchar2_table(3192) := '=> ''User-Agent'''||wwv_flow.LF||
'    , p_value_01  => ''Oracle Application Express (gzip)'''||wwv_flow.LF||
'    , p_name_02   => ''Accep';
wwv_flow_imp.g_varchar2_table(3193) := 't-Encoding'''||wwv_flow.LF||
'    , p_value_02  => ''gzip, deflate'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- debug request headers'||wwv_flow.LF||
'    if apex_ap';
wwv_flow_imp.g_varchar2_table(3194) := 'plication.g_debug'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- debug request headers'||wwv_flow.LF||
'      for i in 1..apex_web_service.g_reque';
wwv_flow_imp.g_varchar2_table(3195) := 'st_headers.count'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
'         apex_debug.info('||wwv_flow.LF||
'          p_message => ''Set request header %s ';
wwv_flow_imp.g_varchar2_table(3196) := 'value: %s'''||wwv_flow.LF||
'        , p0 => apex_web_service.g_request_headers(i).name'||wwv_flow.LF||
'        , p1 => apex_web_servi';
wwv_flow_imp.g_varchar2_table(3197) := 'ce.g_request_headers(i).value'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end append_default_request_';
wwv_flow_imp.g_varchar2_table(3198) := 'headers;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(3199) := '----------------------------------------------------------------------'||wwv_flow.LF||
'  procedure parse_error_json(';
wwv_flow_imp.g_varchar2_table(3200) := ''||wwv_flow.LF||
'    p_response  in clob,'||wwv_flow.LF||
'    p_code      out nocopy varchar2,'||wwv_flow.LF||
'    p_message   out nocopy varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3201) := ' )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_top_obj json_element_t;'||wwv_flow.LF||
'    l_err_obj json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error( ''E';
wwv_flow_imp.g_varchar2_table(3202) := 'rror response body: %s'', p_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- parse response to json'||wwv_flow.LF||
'    if p_response is not null ';
wwv_flow_imp.g_varchar2_table(3203) := 'and p_response is json'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_top_obj := json_element_t.parse( p_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if';
wwv_flow_imp.g_varchar2_table(3204) := ' top level is object try get error code and error message'||wwv_flow.LF||
'      if ( l_top_obj.is_object )'||wwv_flow.LF||
'      the';
wwv_flow_imp.g_varchar2_table(3205) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_err_obj := treat( l_top_obj as json_object_t );'||wwv_flow.LF||
''||wwv_flow.LF||
'        p_code := l_err_obj.get_string';
wwv_flow_imp.g_varchar2_table(3206) := '( ''code'' );'||wwv_flow.LF||
'        p_message := l_err_obj.get_string( ''message'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3207) := ' apex_debug.info( ''Error code: %s, error message: %s'', p_code, p_message );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end parse_error_json;';
wwv_flow_imp.g_varchar2_table(3208) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(3209) := '--------------------------------------------------------------'||wwv_flow.LF||
'  function prepare_object_url('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(3210) := 'file_path in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url_endpoint varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(3211) := 'debug.info( ''Prepare object URL for file path: %s'', p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare URL for object st';
wwv_flow_imp.g_varchar2_table(3212) := 'ore object'||wwv_flow.LF||
'    l_url_endpoint :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''%s/n/%s/b/%s/o/%s'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3213) := '      -- remote server'||wwv_flow.LF||
'      , p0 => rtrim( param_t( ''base_url'' ), ''/'' )'||wwv_flow.LF||
'      -- object storage nam';
wwv_flow_imp.g_varchar2_table(3214) := 'espace'||wwv_flow.LF||
'      , p1 => param_t( ''namespace'' )'||wwv_flow.LF||
'      -- bucket'||wwv_flow.LF||
'      , p2 => param_t( ''bucket'' )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3215) := '-- object'||wwv_flow.LF||
'      -- dir + file'||wwv_flow.LF||
'      , p3 => p_file_path'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Returni';
wwv_flow_imp.g_varchar2_table(3216) := 'ng object URL: %s'', l_url_endpoint );'||wwv_flow.LF||
'    -- return URL'||wwv_flow.LF||
'    return l_url_endpoint;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end prepare_ob';
wwv_flow_imp.g_varchar2_table(3217) := 'ject_url;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(3218) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'  procedure upload_to_bucket';
wwv_flow_imp.g_varchar2_table(3219) := '('||wwv_flow.LF||
'    p_file_name         in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_mime_type         ';
wwv_flow_imp.g_varchar2_table(3220) := 'in varchar2,'||wwv_flow.LF||
'    p_file_size         in pls_integer,'||wwv_flow.LF||
'    p_cache_control     in varchar2,'||wwv_flow.LF||
'    p_over';
wwv_flow_imp.g_varchar2_table(3221) := 'write_file    in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_blob_content      in blob,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3222) := ' p_client_request_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_etag          varchar2(2000);'||wwv_flow.LF||
'    l_md5           va';
wwv_flow_imp.g_varchar2_table(3223) := 'rchar2(2000);'||wwv_flow.LF||
'    l_file_path     varchar2(2000);'||wwv_flow.LF||
'    l_file_desc     varchar2(32700);'||wwv_flow.LF||
'    l_error_c';
wwv_flow_imp.g_varchar2_table(3224) := 'ode    varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_url_endpoint  varchar2(2000);'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(3225) := '_response_body clob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''File name to upload: %s'', p_file_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'    --';
wwv_flow_imp.g_varchar2_table(3226) := ' format file path'||wwv_flow.LF||
'    l_file_path := blog_file.format_file_path( p_file_name, p_dir );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepa';
wwv_flow_imp.g_varchar2_table(3227) := 're request URL'||wwv_flow.LF||
'    l_url_endpoint := prepare_object_url( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Reque';
wwv_flow_imp.g_varchar2_table(3228) := 'st URL: %s'', l_url_endpoint );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set request headers for request'||wwv_flow.LF||
'    apex_web_service.set_requ';
wwv_flow_imp.g_varchar2_table(3229) := 'est_headers('||wwv_flow.LF||
'      p_reset     => true'||wwv_flow.LF||
'    , p_name_01   => ''Content-Type'''||wwv_flow.LF||
'    , p_value_01  => p_mi';
wwv_flow_imp.g_varchar2_table(3230) := 'me_type'||wwv_flow.LF||
'    , p_name_02   => case when p_mime_type = blog_mime.g_default_mime then ''Content-Length'' ';
wwv_flow_imp.g_varchar2_table(3231) := 'end'||wwv_flow.LF||
'    , p_value_02  => case when p_mime_type = blog_mime.g_default_mime then p_file_size end'||wwv_flow.LF||
'    ,';
wwv_flow_imp.g_varchar2_table(3232) := ' p_name_03   => case when p_overwrite_file = ''N'' then ''if-none-match'' end'||wwv_flow.LF||
'    , p_value_03  => case ';
wwv_flow_imp.g_varchar2_table(3233) := 'when p_overwrite_file = ''N'' then ''*'' end'||wwv_flow.LF||
'    , p_name_04   => case when p_cache_control is not null ';
wwv_flow_imp.g_varchar2_table(3234) := 'then ''Cache-Control'' end'||wwv_flow.LF||
'    , p_value_04  => p_cache_control'||wwv_flow.LF||
'    , p_name_05   => case when p_clien';
wwv_flow_imp.g_varchar2_table(3235) := 't_request_id is not null then ''opc-client-request-id'' end'||wwv_flow.LF||
'    , p_value_05  => p_client_request_id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3236) := '   );'||wwv_flow.LF||
'    -- append default request headers'||wwv_flow.LF||
'    append_default_request_headers;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- make request';
wwv_flow_imp.g_varchar2_table(3237) := ' to put file to object storage'||wwv_flow.LF||
'    l_response_body :='||wwv_flow.LF||
'      apex_web_service.make_rest_request('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3238) := '    p_url                   => l_url_endpoint'||wwv_flow.LF||
'      , p_http_method           => ''PUT'''||wwv_flow.LF||
'      , p_bod';
wwv_flow_imp.g_varchar2_table(3239) := 'y_blob             => p_blob_content'||wwv_flow.LF||
'      , p_credential_static_id  => param_t( ''credential'' )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3240) := '  )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- debug request headers if error'||wwv_flow.LF||
'    process_headers';
wwv_flow_imp.g_varchar2_table(3241) := '('||wwv_flow.LF||
'      p_is_error => not apex_web_service.g_status_code in( 200, 412 )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- handle reques';
wwv_flow_imp.g_varchar2_table(3242) := 't status'||wwv_flow.LF||
'    case apex_web_service.g_status_code'||wwv_flow.LF||
'    when 200 then'||wwv_flow.LF||
'    -- if HTTP 200 request succee';
wwv_flow_imp.g_varchar2_table(3243) := 'ded'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_etag  := get_response_header( ''etag'' );'||wwv_flow.LF||
'      l_md5   := get_response_header( ''opc-cont';
wwv_flow_imp.g_varchar2_table(3244) := 'ent-md5'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- insert file info to blog_files'||wwv_flow.LF||
'      merge into blog_files t1'||wwv_flow.LF||
'      using dual';
wwv_flow_imp.g_varchar2_table(3245) := ' on ( t1.file_path = l_file_path )'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'        insert( file_path, file_size,';
wwv_flow_imp.g_varchar2_table(3246) := ' mime_type, etag, md5 )'||wwv_flow.LF||
'          values( l_file_path, p_file_size, p_mime_type, l_etag, l_md5 )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3247) := '   when matched then'||wwv_flow.LF||
'        update set'||wwv_flow.LF||
'          file_size     = p_file_size'||wwv_flow.LF||
'        , mime_type   ';
wwv_flow_imp.g_varchar2_table(3248) := '  = p_mime_type'||wwv_flow.LF||
'        , etag          = l_etag'||wwv_flow.LF||
'        , md5           = l_md5'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    when 4';
wwv_flow_imp.g_varchar2_table(3249) := '12 then'||wwv_flow.LF||
'    -- if HTTP 412 file already exists'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- create collection for storing file temporal';
wwv_flow_imp.g_varchar2_table(3250) := 'y'||wwv_flow.LF||
'      -- we prompt user to confirm file overwrite'||wwv_flow.LF||
'      -- and show file information e.g. name and';
wwv_flow_imp.g_varchar2_table(3251) := ' possible description from collection'||wwv_flow.LF||
'      -- then if user confirms, we can overwrite file using da';
wwv_flow_imp.g_varchar2_table(3252) := 'ta stored in collection'||wwv_flow.LF||
'      if not apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'      th';
wwv_flow_imp.g_varchar2_table(3253) := 'en'||wwv_flow.LF||
'        apex_collection.create_collection( p_collection_name );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- fetch fil';
wwv_flow_imp.g_varchar2_table(3254) := 'e description from database'||wwv_flow.LF||
'      l_file_desc := blog_file.get_file_desc( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex';
wwv_flow_imp.g_varchar2_table(3255) := '_debug.info('||wwv_flow.LF||
'        p_message => ''File exists: %s, desc: %s, mime: %s, size: %s'''||wwv_flow.LF||
'      , p0 => l_fi';
wwv_flow_imp.g_varchar2_table(3256) := 'le_path'||wwv_flow.LF||
'      , p1 => l_file_desc'||wwv_flow.LF||
'      , p2 => p_mime_type'||wwv_flow.LF||
'      , p3 => p_file_size'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3257) := ' -- store file lob and other info to collection'||wwv_flow.LF||
'      apex_collection.add_member('||wwv_flow.LF||
'        p_collecti';
wwv_flow_imp.g_varchar2_table(3258) := 'on_name => p_collection_name'||wwv_flow.LF||
'      , p_c001            => l_file_path'||wwv_flow.LF||
'      , p_c002            => l';
wwv_flow_imp.g_varchar2_table(3259) := '_file_desc'||wwv_flow.LF||
'      , p_c003            => p_mime_type'||wwv_flow.LF||
'      , p_c004            => p_cache_control'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3260) := '   , p_n001            => p_file_size'||wwv_flow.LF||
'      , p_blob001         => p_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else';
wwv_flow_imp.g_varchar2_table(3261) := ''||wwv_flow.LF||
'    -- treat other HTTP status codes as error'||wwv_flow.LF||
'    -- logic need to improved e.g. cases when two fil';
wwv_flow_imp.g_varchar2_table(3262) := 'es are uploaded and only second file goes error'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Error uploading file: %s'',';
wwv_flow_imp.g_varchar2_table(3263) := ' l_url_endpoint );'||wwv_flow.LF||
'      -- get error information from response body'||wwv_flow.LF||
'      parse_error_json( l_respo';
wwv_flow_imp.g_varchar2_table(3264) := 'nse_body, l_error_code, l_error_mesg);'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_message           => c';
wwv_flow_imp.g_varchar2_table(3265) := 'oalesce( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.';
wwv_flow_imp.g_varchar2_table(3266) := 'c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_to_bucket;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3267) := '------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(3268) := '-----------------------------------'||wwv_flow.LF||
'  procedure get_object('||wwv_flow.LF||
'    p_file_path         in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3269) := ' p_client_request_id in varchar2,'||wwv_flow.LF||
'    p_content_type      in out nocopy varchar2,'||wwv_flow.LF||
'    p_blob_content';
wwv_flow_imp.g_varchar2_table(3270) := '      in out nocopy blob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url_endpoint    varchar2(2000);'||wwv_flow.LF||
'    l_file_extension  varcha';
wwv_flow_imp.g_varchar2_table(3271) := 'r2(500);'||wwv_flow.LF||
'    l_response_body   clob;'||wwv_flow.LF||
'    l_error_code      varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg      var';
wwv_flow_imp.g_varchar2_table(3272) := 'char2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare request URL'||wwv_flow.LF||
'    l_url_endpoint := prepare_object_url( p_file_pa';
wwv_flow_imp.g_varchar2_table(3273) := 'th );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Object URL: %s'', l_url_endpoint);'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set request headers'||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(3274) := 'web_service.set_request_headers('||wwv_flow.LF||
'      p_reset     => true'||wwv_flow.LF||
'    , p_name_01   => ''Accept'''||wwv_flow.LF||
'    , p_val';
wwv_flow_imp.g_varchar2_table(3275) := 'ue_01  => ''*/*'''||wwv_flow.LF||
'    , p_name_02   => case when p_client_request_id is not null then ''opc-client-requ';
wwv_flow_imp.g_varchar2_table(3276) := 'est-id'' end'||wwv_flow.LF||
'    , p_value_02  => case when p_client_request_id is not null then p_client_request_id ';
wwv_flow_imp.g_varchar2_table(3277) := 'end'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- append default request headers'||wwv_flow.LF||
'    append_default_request_headers;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- make re';
wwv_flow_imp.g_varchar2_table(3278) := 'quest to get file from object storage'||wwv_flow.LF||
'    p_blob_content :='||wwv_flow.LF||
'      apex_web_service.make_rest_request';
wwv_flow_imp.g_varchar2_table(3279) := '_b('||wwv_flow.LF||
'        p_url                  => l_url_endpoint'||wwv_flow.LF||
'      , p_http_method          => ''GET'''||wwv_flow.LF||
'      ,';
wwv_flow_imp.g_varchar2_table(3280) := ' p_credential_static_id => param_t( ''credential'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3281) := '  -- debug request headers if error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'      p_is_error => apex_web_service.g_stat';
wwv_flow_imp.g_varchar2_table(3282) := 'us_code >= 400'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check reponse status'||wwv_flow.LF||
'    if apex_web_service.g_status_code >= 400'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3283) := 'then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Error downloading file: %s'', l_url_endpoint );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_response_body';
wwv_flow_imp.g_varchar2_table(3284) := ' := apex_util.blob_to_clob( p_blob_content ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_body, l_error_cod';
wwv_flow_imp.g_varchar2_table(3285) := 'e, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_message           => coalesce( l_error_mes';
wwv_flow_imp.g_varchar2_table(3286) := 'g, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.c_inline_in_notifica';
wwv_flow_imp.g_varchar2_table(3287) := 'tion'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      p_content_type := get_response_header( ''content-type'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_c';
wwv_flow_imp.g_varchar2_table(3288) := 'ontent_type is null'||wwv_flow.LF||
'      or p_content_type = blog_mime.g_default_mime'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug';
wwv_flow_imp.g_varchar2_table(3289) := '.info( ''File mime type is %s. Trying to fetch better one.'', coalesce( p_content_type, ''(null)'' ) );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3290) := '        p_content_type := blog_mime.get_mime_type( p_file_path );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.in';
wwv_flow_imp.g_varchar2_table(3291) := 'fo( ''File mime type: %s'', p_content_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_object;'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(3292) := '--------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(3293) := '-------------------------------------'||wwv_flow.LF||
'  procedure delete_bucket_object('||wwv_flow.LF||
'    p_file_path             ';
wwv_flow_imp.g_varchar2_table(3294) := 'in varchar2,'||wwv_flow.LF||
'    p_if_match              in varchar2,'||wwv_flow.LF||
'    p_client_request_id     in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3295) := 'as'||wwv_flow.LF||
'    l_error_code    varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_response_body clob;';
wwv_flow_imp.g_varchar2_table(3296) := ''||wwv_flow.LF||
'    l_del_params    apex_exec.t_parameters;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Object name for deletion';
wwv_flow_imp.g_varchar2_table(3297) := ': %s, etag: %s'', p_file_path, p_if_match );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''bucketName''';
wwv_flow_imp.g_varchar2_table(3298) := ', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''namespace'', param_t( ''namespace';
wwv_flow_imp.g_varchar2_table(3299) := ''' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''objectName'', p_file_path );'||wwv_flow.LF||
'    apex_exec.add_par';
wwv_flow_imp.g_varchar2_table(3300) := 'ameter( l_del_params, ''if-match'', p_if_match );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''opc-clie';
wwv_flow_imp.g_varchar2_table(3301) := 'nt-request-id'', p_client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.execute_rest_source('||wwv_flow.LF||
'      p_static_id        ';
wwv_flow_imp.g_varchar2_table(3302) := '   => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_static_id => ''delete_object'''||wwv_flow.LF||
'    , p_parameter';
wwv_flow_imp.g_varchar2_table(3303) := 's          => l_del_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body := apex_exec.get_parameter_clob( l_del_params';
wwv_flow_imp.g_varchar2_table(3304) := ', ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- debug request headers if error'||wwv_flow.LF||
'    proc';
wwv_flow_imp.g_varchar2_table(3305) := 'ess_headers('||wwv_flow.LF||
'      p_is_error => not apex_web_service.g_status_code in( 204, 404 )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ch';
wwv_flow_imp.g_varchar2_table(3306) := 'eck request status'||wwv_flow.LF||
'    -- don''t raise error on HTTP 404 error.'||wwv_flow.LF||
'    -- when HTTP 404 error file not e';
wwv_flow_imp.g_varchar2_table(3307) := 'xists in object storage'||wwv_flow.LF||
'    -- and file need to anyway deleted from blog_files table'||wwv_flow.LF||
'    if apex_web';
wwv_flow_imp.g_varchar2_table(3308) := '_service.g_status_code in( 204, 404 )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''File deleted from object sto';
wwv_flow_imp.g_varchar2_table(3309) := 'rage: %s'', apex_web_service.g_status_code );'||wwv_flow.LF||
''||wwv_flow.LF||
'      delete from blog_files'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3310) := '     and file_path = p_file_path'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''%s rows deleted from blog_files'', ';
wwv_flow_imp.g_varchar2_table(3311) := 'sql%rowcount );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Error deleting file: %s'', p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3312) := 'parse_error_json( l_response_body, l_error_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3313) := '  p_message           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_displa';
wwv_flow_imp.g_varchar2_table(3314) := 'y_location  => apex_error.c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_bucket_objec';
wwv_flow_imp.g_varchar2_table(3315) := 't;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(3316) := '----------------------------------------------------------------'||wwv_flow.LF||
'  procedure sync_from_database('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3317) := ' p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3318) := ''||wwv_flow.LF||
'    -- loop file'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        v1.file_name'||wwv_flow.LF||
'      , v1.file_dir'||wwv_flow.LF||
'      , v1.mi';
wwv_flow_imp.g_varchar2_table(3319) := 'me_type'||wwv_flow.LF||
'      , v1.local_size'||wwv_flow.LF||
'      , v1.blob_content'||wwv_flow.LF||
'      from blog_v_all_files v1'||wwv_flow.LF||
'      where 1 =';
wwv_flow_imp.g_varchar2_table(3320) := ' 1'||wwv_flow.LF||
'        and v1.is_active = 1'||wwv_flow.LF||
'        and v1.local_size > 0'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Pr';
wwv_flow_imp.g_varchar2_table(3321) := 'ocessing file %s : %s'', c1.file_name, c1.mime_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_bucket('||wwv_flow.LF||
'        p_file_name  ';
wwv_flow_imp.g_varchar2_table(3322) := '       => c1.file_name'||wwv_flow.LF||
'      , p_dir               => c1.file_dir'||wwv_flow.LF||
'      , p_mime_type         => c1.';
wwv_flow_imp.g_varchar2_table(3323) := 'mime_type'||wwv_flow.LF||
'      , p_file_size         => c1.local_size'||wwv_flow.LF||
'      , p_cache_control     => null'||wwv_flow.LF||
'      , p';
wwv_flow_imp.g_varchar2_table(3324) := '_overwrite_file    => ''N'''||wwv_flow.LF||
'      , p_collection_name   => p_collection_name'||wwv_flow.LF||
'      , p_blob_content   ';
wwv_flow_imp.g_varchar2_table(3325) := '   => c1.blob_content'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3326) := 'end sync_from_database;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3327) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure sy';
wwv_flow_imp.g_varchar2_table(3328) := 'nc_from_object_storage('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 def';
wwv_flow_imp.g_varchar2_table(3329) := 'ault null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_row_timestamp timestamp with time zone;'||wwv_flow.LF||
'    l_mime_type     varchar2(2000);';
wwv_flow_imp.g_varchar2_table(3330) := ''||wwv_flow.LF||
'    l_blob_content  blob;'||wwv_flow.LF||
'    l_file_exists   boolean := false;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get files max sync ';
wwv_flow_imp.g_varchar2_table(3331) := 'timestamp'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      coalesce( max( apex$row_sync_timestamp ), current_timestamp ) as row_sync';
wwv_flow_imp.g_varchar2_table(3332) := '_timestamp'||wwv_flow.LF||
'    into l_row_timestamp'||wwv_flow.LF||
'    from blog_v_all_files'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Max sync ';
wwv_flow_imp.g_varchar2_table(3333) := 'time: %s'', l_row_timestamp );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- create collection for storing filea temporaly'||wwv_flow.LF||
'    apex_collect';
wwv_flow_imp.g_varchar2_table(3334) := 'ion.create_or_truncate_collection( p_collection_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- sync files metadata from object stor';
wwv_flow_imp.g_varchar2_table(3335) := 'age'||wwv_flow.LF||
'    apex_rest_source_sync.synchronize_data('||wwv_flow.LF||
'      p_module_static_id => param_t( ''module_static_';
wwv_flow_imp.g_varchar2_table(3336) := 'id'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop files'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        v1.id'||wwv_flow.LF||
'      , v1.file_path'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3337) := ' , v1.file_desc'||wwv_flow.LF||
'      , v1.file_size'||wwv_flow.LF||
'      , v1.local_size'||wwv_flow.LF||
'      from blog_v_all_files v1'||wwv_flow.LF||
'      wher';
wwv_flow_imp.g_varchar2_table(3338) := 'e 1 = 1'||wwv_flow.LF||
'        and v1.apex$row_sync_timestamp > l_row_timestamp'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ';
wwv_flow_imp.g_varchar2_table(3339) := '''Processing file: %s'', c1.file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get file from object storage'||wwv_flow.LF||
'      get_object('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3340) := '    p_file_path         => c1.file_path'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      , p';
wwv_flow_imp.g_varchar2_table(3341) := '_content_type      => l_mime_type'||wwv_flow.LF||
'      , p_blob_content      => l_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      -- sa';
wwv_flow_imp.g_varchar2_table(3342) := 've file to collection if it already exists in database'||wwv_flow.LF||
'      -- we prompt user to confirm file overw';
wwv_flow_imp.g_varchar2_table(3343) := 'rite'||wwv_flow.LF||
'      -- and show file information e.g. name and possible description from collection'||wwv_flow.LF||
'      -- ';
wwv_flow_imp.g_varchar2_table(3344) := 'then if user confirms, we can overwrite file using data stored in collection'||wwv_flow.LF||
'      if c1.local_size ';
wwv_flow_imp.g_varchar2_table(3345) := '> 0'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        apex_collection.add_member('||wwv_flow.LF||
'          p_collection_name => p_collection_name';
wwv_flow_imp.g_varchar2_table(3346) := ''||wwv_flow.LF||
'        , p_c001            => c1.file_path'||wwv_flow.LF||
'        , p_c002            => c1.file_desc'||wwv_flow.LF||
'        , p';
wwv_flow_imp.g_varchar2_table(3347) := '_c003            => l_mime_type'||wwv_flow.LF||
'        , p_n001            => c1.file_size'||wwv_flow.LF||
'        , p_blob001     ';
wwv_flow_imp.g_varchar2_table(3348) := '    => l_blob_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_exists := true;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- if file not';
wwv_flow_imp.g_varchar2_table(3349) := ' already exists in database update blob'||wwv_flow.LF||
'        update blog_files'||wwv_flow.LF||
'          set blob_content = l_blo';
wwv_flow_imp.g_varchar2_table(3350) := 'b_content'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and id = c1.id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3351) := '-- if any of files didn''t exists, delete collection'||wwv_flow.LF||
'    if not l_file_exists'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_col';
wwv_flow_imp.g_varchar2_table(3352) := 'lection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sync_from_object_storage;'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3353) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3354) := '------------------------------------------------------'||wwv_flow.LF||
'  function get_namespace('||wwv_flow.LF||
'    p_client_reques';
wwv_flow_imp.g_varchar2_table(3355) := 't_id in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_params        apex_exec.t_parameters;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3356) := '   l_response_body clob;'||wwv_flow.LF||
'    l_namespace     varchar2(256);'||wwv_flow.LF||
'    l_error_code    varchar2(2000);'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3357) := 'l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'  -- fetch object storage namespace'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.add_param';
wwv_flow_imp.g_varchar2_table(3358) := 'eter( l_params, ''opc-client-request-id'', p_client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.execute_rest_source('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3359) := '      p_static_id           => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_static_id => ''get_nam';
wwv_flow_imp.g_varchar2_table(3360) := 'espace'''||wwv_flow.LF||
'    , p_parameters          => l_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body := apex_exec.get_paramet';
wwv_flow_imp.g_varchar2_table(3361) := 'er_clob( l_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Fetch object storage namespace returns:';
wwv_flow_imp.g_varchar2_table(3362) := ' %s'', l_response_body );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check reponse status'||wwv_flow.LF||
'    if not apex_web_service.g_status_code = 20';
wwv_flow_imp.g_varchar2_table(3363) := '0'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      process_headers('||wwv_flow.LF||
'        p_is_error => true'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Err';
wwv_flow_imp.g_varchar2_table(3364) := 'or on get_namespace.'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_body, l_error_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3365) := '    apex_error.add_error('||wwv_flow.LF||
'        p_message           => coalesce( l_error_mesg, apex_web_service.g_';
wwv_flow_imp.g_varchar2_table(3366) := 'reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end';
wwv_flow_imp.g_varchar2_table(3367) := ' if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_namespace := trim( both ''"'' from l_response_body );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return namespace'||wwv_flow.LF||
'    return ';
wwv_flow_imp.g_varchar2_table(3368) := 'l_namespace;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_namespace;'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3369) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(3370) := 'Global procedures and functions'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3371) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  func';
wwv_flow_imp.g_varchar2_table(3372) := 'tion get_param_value('||wwv_flow.LF||
'    p_param_name in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return param';
wwv_flow_imp.g_varchar2_table(3373) := '_t( p_param_name );'||wwv_flow.LF||
'  end get_param_value;'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3374) := '-----------------------'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3375) := '----'||wwv_flow.LF||
'  procedure set_object_storage('||wwv_flow.LF||
'    p_bucket_name   in varchar2,'||wwv_flow.LF||
'    p_base_url      in varchar';
wwv_flow_imp.g_varchar2_table(3376) := '2,'||wwv_flow.LF||
'    p_build_status  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    c_bucket_url_template constant varchar2(64) := ''http';
wwv_flow_imp.g_varchar2_table(3377) := 's://%0.objectstorage.%1.oci.customer-oci.com/n/%0/b/%2/o/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_attributes   apex_t_varchar2;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3378) := '  l_base_url    varchar2(2000);'||wwv_flow.LF||
'    l_bucket_url  varchar2(2000);'||wwv_flow.LF||
'    l_region      varchar2(256);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3379) := '   l_namespace   varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Set object storage buid option %s sta';
wwv_flow_imp.g_varchar2_table(3380) := 'tus: %s'', param_t( ''build_option_name'' ), p_build_status );'||wwv_flow.LF||
'    -- Set build option status for the s';
wwv_flow_imp.g_varchar2_table(3381) := 'torage feature'||wwv_flow.LF||
'    blog_admin.update_feature('||wwv_flow.LF||
'      p_build_option_name => param_t( ''build_option_na';
wwv_flow_imp.g_varchar2_table(3382) := 'me'' )'||wwv_flow.LF||
'    , p_build_status      => p_build_status'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_build_status = apex_application_a';
wwv_flow_imp.g_varchar2_table(3383) := 'dmin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage bucket: %s'',';
wwv_flow_imp.g_varchar2_table(3384) := ' p_bucket_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''bucket_param_name'' ), p_buc';
wwv_flow_imp.g_varchar2_table(3385) := 'ket_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_region :='||wwv_flow.LF||
'        substr('||wwv_flow.LF||
'          param_t( ''base_url'' )'||wwv_flow.LF||
'        , instr( para';
wwv_flow_imp.g_varchar2_table(3386) := 'm_t( ''base_url'' ), ''.'', 1, 1 ) + 1'||wwv_flow.LF||
'        , instr( param_t( ''base_url'' ), ''.'', 1, 2 ) - 1 - instr( ';
wwv_flow_imp.g_varchar2_table(3387) := 'param_t( ''base_url'' ), ''.'', 1, 1 )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage reg';
wwv_flow_imp.g_varchar2_table(3388) := 'ion: %s'', l_region );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''region_param_name'' ), l';
wwv_flow_imp.g_varchar2_table(3389) := '_region );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_namespace := get_namespace;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage  namespa';
wwv_flow_imp.g_varchar2_table(3390) := 'ce: %s'', l_namespace );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''namespace_param_name''';
wwv_flow_imp.g_varchar2_table(3391) := ' ), l_namespace );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_bucket_url :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => c_bucke';
wwv_flow_imp.g_varchar2_table(3392) := 't_url_template'||wwv_flow.LF||
'        , p0 => l_namespace'||wwv_flow.LF||
'        , p1 => l_region'||wwv_flow.LF||
'        , p2 => p_bucket_name'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3393) := '      )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage bucket URL: %s'', l_bucket_url );'||wwv_flow.LF||
''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3394) := 'apex_string.plist_push( l_attributes, param_t( ''bucket_url_param_name'' ), l_bucket_url );'||wwv_flow.LF||
''||wwv_flow.LF||
'      blo';
wwv_flow_imp.g_varchar2_table(3395) := 'g_admin.set_attribute_value('||wwv_flow.LF||
'        p_attribute_list  => l_attributes'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_base_url :=';
wwv_flow_imp.g_varchar2_table(3396) := ' rtrim( p_base_url, ''/'' ) || ''/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage remote server %s: %s'',';
wwv_flow_imp.g_varchar2_table(3397) := ' param_t( ''remote_server_static_id'' ), l_base_url );'||wwv_flow.LF||
'      -- Set remote server URL'||wwv_flow.LF||
'      apex_appli';
wwv_flow_imp.g_varchar2_table(3398) := 'cation_admin.set_remote_server('||wwv_flow.LF||
'        p_static_id => param_t( ''remote_server_static_id'' )'||wwv_flow.LF||
'      , ';
wwv_flow_imp.g_varchar2_table(3399) := 'p_base_url  => l_base_url'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_object_storage;'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3400) := '-------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(3401) := '------------------------------------'||wwv_flow.LF||
'  procedure upload_object('||wwv_flow.LF||
'    p_file_names        in varchar2,';
wwv_flow_imp.g_varchar2_table(3402) := ''||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_cache_control     i';
wwv_flow_imp.g_varchar2_table(3403) := 'n varchar2 default null,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file    in';
wwv_flow_imp.g_varchar2_table(3404) := ' varchar2 default ''N'','||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_names   ';
wwv_flow_imp.g_varchar2_table(3405) := ' apex_t_varchar2;'||wwv_flow.LF||
'    l_file_name     varchar2(500);'||wwv_flow.LF||
'    l_mime_type     varchar2(500);'||wwv_flow.LF||
'    l_file_s';
wwv_flow_imp.g_varchar2_table(3406) := 'ize     pls_integer;'||wwv_flow.LF||
'    l_zip_dir       apex_zip.t_dir_entries;'||wwv_flow.LF||
'    l_zip_file_path varchar2(32767)';
wwv_flow_imp.g_varchar2_table(3407) := ';'||wwv_flow.LF||
'    l_unzipped      blob := empty_blob();'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_col';
wwv_flow_imp.g_varchar2_table(3408) := 'lection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3409) := '   -- get file names'||wwv_flow.LF||
'    l_file_names :='||wwv_flow.LF||
'      apex_string.split('||wwv_flow.LF||
'        p_str => p_file_names'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3410) := '  , p_sep => '':'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop file'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        files.filename'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3411) := '      , files.mime_type'||wwv_flow.LF||
'      , files.blob_content'||wwv_flow.LF||
'      from apex_application_temp_files files'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3412) := '  where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select 1'||wwv_flow.LF||
'        from table( l_file_names ) x1'||wwv_flow.LF||
'        where';
wwv_flow_imp.g_varchar2_table(3413) := ' 1 = 1'||wwv_flow.LF||
'          and x1.column_value = files.name'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Proces';
wwv_flow_imp.g_varchar2_table(3414) := 'sing file %s : %s'', c1.filename, c1.mime_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_extract = ''Y'''||wwv_flow.LF||
'      and c1.mime_type = ';
wwv_flow_imp.g_varchar2_table(3415) := '''application/zip'''||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_dir :='||wwv_flow.LF||
'          apex_zip.get_dir_entries('||wwv_flow.LF||
'            p';
wwv_flow_imp.g_varchar2_table(3416) := '_zipped_blob => c1.blob_content'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_file_path := l_zip_dir.first;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3417) := '        while l_zip_file_path is not null'||wwv_flow.LF||
'        loop'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_unzipped :='||wwv_flow.LF||
'            apex_zip';
wwv_flow_imp.g_varchar2_table(3418) := '.get_file_content('||wwv_flow.LF||
'              p_zipped_blob => c1.blob_content'||wwv_flow.LF||
'            , p_dir_entry   => l_z';
wwv_flow_imp.g_varchar2_table(3419) := 'ip_dir( l_zip_file_path )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_mime_type := blog_mime.get_mime_typ';
wwv_flow_imp.g_varchar2_table(3420) := 'e( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_file_size := dbms_lob.getlength( l_unzipped );'||wwv_flow.LF||
''||wwv_flow.LF||
'          upload_';
wwv_flow_imp.g_varchar2_table(3421) := 'to_bucket('||wwv_flow.LF||
'            p_file_name         => l_zip_file_path'||wwv_flow.LF||
'          , p_dir               => p_d';
wwv_flow_imp.g_varchar2_table(3422) := 'ir'||wwv_flow.LF||
'          , p_mime_type         => l_mime_type'||wwv_flow.LF||
'          , p_file_size         => l_file_size'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3423) := '       , p_cache_control     => p_cache_control'||wwv_flow.LF||
'          , p_overwrite_file    => p_overwrite_file'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3424) := '          , p_collection_name   => p_collection_name'||wwv_flow.LF||
'          , p_blob_content      => l_unzipped'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3425) := '         , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'          );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_zip_file_path := l_z';
wwv_flow_imp.g_varchar2_table(3426) := 'ip_dir.next( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_size := dbms_lob.getl';
wwv_flow_imp.g_varchar2_table(3427) := 'ength( c1.blob_content );'||wwv_flow.LF||
''||wwv_flow.LF||
'        upload_to_bucket('||wwv_flow.LF||
'          p_file_name         => c1.filename'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3428) := '      , p_dir               => p_dir'||wwv_flow.LF||
'        , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'        , p_file_';
wwv_flow_imp.g_varchar2_table(3429) := 'size         => l_file_size'||wwv_flow.LF||
'        , p_cache_control     => p_cache_control'||wwv_flow.LF||
'        , p_overwrite_f';
wwv_flow_imp.g_varchar2_table(3430) := 'ile    => p_overwrite_file'||wwv_flow.LF||
'        , p_collection_name   => p_collection_name'||wwv_flow.LF||
'        , p_blob_conte';
wwv_flow_imp.g_varchar2_table(3431) := 'nt      => c1.blob_content'||wwv_flow.LF||
'        , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      en';
wwv_flow_imp.g_varchar2_table(3432) := 'd if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_object;'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3433) := '-----------------------'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3434) := '----'||wwv_flow.LF||
'  procedure file_sync('||wwv_flow.LF||
'    p_action            in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2';
wwv_flow_imp.g_varchar2_table(3435) := ','||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''File sync';
wwv_flow_imp.g_varchar2_table(3436) := ' action is: %s'', p_action );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then';
wwv_flow_imp.g_varchar2_table(3437) := ''||wwv_flow.LF||
'      apex_collection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    case p_action'||wwv_flow.LF||
'    wh';
wwv_flow_imp.g_varchar2_table(3438) := 'en ''META'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_rest_source_sync.synchronize_data('||wwv_flow.LF||
'        p_module_static_id  => par';
wwv_flow_imp.g_varchar2_table(3439) := 'am_t( ''module_static_id'' )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    when ''DB'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sync_from_object_storage('||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3440) := ' p_collection_name   => p_collection_name'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(3441) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    when ''OCI'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sync_from_database('||wwv_flow.LF||
'        p_collection_name   => p_collection_na';
wwv_flow_imp.g_varchar2_table(3442) := 'me'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end file_sync;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(3443) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(3444) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure replace_object('||wwv_flow.LF||
'    p_collecti';
wwv_flow_imp.g_varchar2_table(3445) := 'on_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1';
wwv_flow_imp.g_varchar2_table(3446) := ' in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        c001    as file_path'||wwv_flow.LF||
'      , c002    as file_desc'||wwv_flow.LF||
'      , c003    as mime_';
wwv_flow_imp.g_varchar2_table(3447) := 'type'||wwv_flow.LF||
'      , c004    as cache_control'||wwv_flow.LF||
'      , n001    as file_size'||wwv_flow.LF||
'      , blob001 as blob_content'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3448) := '     from apex_collections'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and collection_name = p_collection_name'||wwv_flow.LF||
'    ) l';
wwv_flow_imp.g_varchar2_table(3449) := 'oop'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_bucket('||wwv_flow.LF||
'        p_file_name         => c1.file_path'||wwv_flow.LF||
'      , p_dir              ';
wwv_flow_imp.g_varchar2_table(3450) := ' => null'||wwv_flow.LF||
'      , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'      , p_file_size         => c1.file_size'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3451) := '   , p_cache_control     => c1.cache_control'||wwv_flow.LF||
'      , p_overwrite_file    => ''Y'''||wwv_flow.LF||
'      , p_collection';
wwv_flow_imp.g_varchar2_table(3452) := '_name   => p_collection_name'||wwv_flow.LF||
'      , p_blob_content      => c1.blob_content'||wwv_flow.LF||
'      , p_client_request';
wwv_flow_imp.g_varchar2_table(3453) := '_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_coll';
wwv_flow_imp.g_varchar2_table(3454) := 'ection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3455) := 'end replace_object;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3456) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure downlo';
wwv_flow_imp.g_varchar2_table(3457) := 'ad_selected_objects('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 defaul';
wwv_flow_imp.g_varchar2_table(3458) := 't null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_name     varchar2(256);'||wwv_flow.LF||
'    l_content_type  varchar2(256);'||wwv_flow.LF||
'    l_blob_con';
wwv_flow_imp.g_varchar2_table(3459) := 'tent  blob;'||wwv_flow.LF||
'    l_zip_file      blob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.file_path'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3460) := '  , t1.file_name'||wwv_flow.LF||
'      , t1.etag'||wwv_flow.LF||
'      , count(1) over() as num_rows'||wwv_flow.LF||
'      from blog_v_all_files t1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3461) := '      where 1 = 1'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'          from apex_collections x1'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3462) := '  where 1 = 1'||wwv_flow.LF||
'            and x1.collection_name = p_collection_name'||wwv_flow.LF||
'            and x1.n001 = t1.id';
wwv_flow_imp.g_varchar2_table(3463) := ''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
'      -- get file from object storage'||wwv_flow.LF||
'      get_object('||wwv_flow.LF||
'        p_file_path   ';
wwv_flow_imp.g_varchar2_table(3464) := '      => c1.file_path'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      , p_content_type     ';
wwv_flow_imp.g_varchar2_table(3465) := ' => l_content_type'||wwv_flow.LF||
'      , p_blob_content      => l_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if not apex_error.h';
wwv_flow_imp.g_varchar2_table(3466) := 'ave_errors_occurred'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- add files to zip if more than 1 is selected'||wwv_flow.LF||
'        if c1.';
wwv_flow_imp.g_varchar2_table(3467) := 'num_rows = 1'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          l_file_name := c1.file_name;'||wwv_flow.LF||
'        else'||wwv_flow.LF||
'          apex_zip.add';
wwv_flow_imp.g_varchar2_table(3468) := '_file('||wwv_flow.LF||
'            p_zipped_blob => l_zip_file'||wwv_flow.LF||
'          , p_file_name   => c1.file_path'||wwv_flow.LF||
'          ,';
wwv_flow_imp.g_varchar2_table(3469) := ' p_content     => l_blob_content'||wwv_flow.LF||
'          );'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- exit from loop ';
wwv_flow_imp.g_varchar2_table(3470) := 'if error have occured'||wwv_flow.LF||
'        exit;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if we have zip'||wwv_flow.LF||
'    if l_zip';
wwv_flow_imp.g_varchar2_table(3471) := '_file is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_zip.finish('||wwv_flow.LF||
'        p_zipped_blob => l_zip_file'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3472) := '   if not apex_error.have_errors_occurred'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_blob_content := l_zip_file;'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3473) := 'l_content_type := ''application/zip'';'||wwv_flow.LF||
'        l_file_name := blog_file.get_zip_name;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3474) := '    end if;'||wwv_flow.LF||
'    -- if no error download file/zip'||wwv_flow.LF||
'    if not apex_error.have_errors_occurred'||wwv_flow.LF||
'    then';
wwv_flow_imp.g_varchar2_table(3475) := ''||wwv_flow.LF||
'      apex_http.download('||wwv_flow.LF||
'        p_blob          => l_blob_content'||wwv_flow.LF||
'      , p_content_type  => l_co';
wwv_flow_imp.g_varchar2_table(3476) := 'ntent_type'||wwv_flow.LF||
'      , p_filename      => l_file_name'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_selected_obje';
wwv_flow_imp.g_varchar2_table(3477) := 'cts;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(3478) := '------------------------------------------------------------------'||wwv_flow.LF||
'  procedure rename_object('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(3479) := 'old_file_path     in varchar2,'||wwv_flow.LF||
'    p_old_if_match      in varchar2,'||wwv_flow.LF||
'    p_new_file_path     in varch';
wwv_flow_imp.g_varchar2_table(3480) := 'ar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_error_code    varchar2(2000);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3481) := '   l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_response_body clob;'||wwv_flow.LF||
'    l_params        apex_exec.t_paramet';
wwv_flow_imp.g_varchar2_table(3482) := 'ers;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Object for rename: %s - etag: %s'', p_old_file_path, p_old_if_mat';
wwv_flow_imp.g_varchar2_table(3483) := 'ch );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''bucketName'', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_exec.add';
wwv_flow_imp.g_varchar2_table(3484) := '_parameter( l_params, ''namespace'', param_t( ''namespace'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ';
wwv_flow_imp.g_varchar2_table(3485) := '''sourceName'', p_old_file_path );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''srcObjIfMatchETag'', p_old_i';
wwv_flow_imp.g_varchar2_table(3486) := 'f_match );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''newName'', p_new_file_path );'||wwv_flow.LF||
'    apex_exec.add_pa';
wwv_flow_imp.g_varchar2_table(3487) := 'rameter( l_params, ''opc-client-request-id'', p_client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.execute_rest_sourc';
wwv_flow_imp.g_varchar2_table(3488) := 'e('||wwv_flow.LF||
'      p_static_id           => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_static_id => ''rena';
wwv_flow_imp.g_varchar2_table(3489) := 'me_object'''||wwv_flow.LF||
'    , p_parameters          => l_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body := apex_exec.get_para';
wwv_flow_imp.g_varchar2_table(3490) := 'meter_clob( l_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- debug request heade';
wwv_flow_imp.g_varchar2_table(3491) := 'rs if error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'      p_is_error => not apex_web_service.g_status_code = 200'||wwv_flow.LF||
'    );';
wwv_flow_imp.g_varchar2_table(3492) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check request status'||wwv_flow.LF||
'    if apex_web_service.g_status_code = 200'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug';
wwv_flow_imp.g_varchar2_table(3493) := '.info( ''File %s renamed to %s'', p_old_file_path, p_new_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_jso';
wwv_flow_imp.g_varchar2_table(3494) := 'n( l_response_body, l_error_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error ('||wwv_flow.LF||
'        p_message   ';
wwv_flow_imp.g_varchar2_table(3495) := '        => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  =>';
wwv_flow_imp.g_varchar2_table(3496) := ' apex_error.c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rename_object;'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(3497) := '-------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(3498) := '------------------------------------------'||wwv_flow.LF||
'  procedure delete_object('||wwv_flow.LF||
'    p_file_path         in var';
wwv_flow_imp.g_varchar2_table(3499) := 'char2,'||wwv_flow.LF||
'    p_if_match          in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  a';
wwv_flow_imp.g_varchar2_table(3500) := 's'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    delete_bucket_object('||wwv_flow.LF||
'      p_file_path         => p_file_path'||wwv_flow.LF||
'    , p_if_match      ';
wwv_flow_imp.g_varchar2_table(3501) := '    => p_if_match'||wwv_flow.LF||
'    , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_object;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(3502) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(3503) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure delete_selected_objects('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(3504) := '_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_obj_';
wwv_flow_imp.g_varchar2_table(3505) := 'idx pls_integer := 1;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        file_path'||wwv_flow.LF||
'      , etag'||wwv_flow.LF||
'      from';
wwv_flow_imp.g_varchar2_table(3506) := ' blog_v_all_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'          from apex_co';
wwv_flow_imp.g_varchar2_table(3507) := 'llections x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.collection_name = p_collection_name'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3508) := '  and x1.n001 = t1.id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      delete_bucket_object('||wwv_flow.LF||
'        p_file_path         ';
wwv_flow_imp.g_varchar2_table(3509) := '=> c1.file_path'||wwv_flow.LF||
'      , p_if_match          => c1.etag'||wwv_flow.LF||
'      , p_client_request_id => p_client_reque';
wwv_flow_imp.g_varchar2_table(3510) := 'st_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_selected_objects;'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(3511) := '------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3512) := '-----------------------'||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3513) := '------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3514) := '-----------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- initialize parameters'||wwv_flow.LF||
'  apex_debug.info( ''----- Initialize package BLOG_OCI_O';
wwv_flow_imp.g_varchar2_table(3515) := 'S -----'' );'||wwv_flow.LF||
'  init_params;'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3516) := '-------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_O';
wwv_flow_imp.g_varchar2_table(3517) := 'CI_OS";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_XML"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(3518) := '-----------------------------------'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3519) := '----------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3520) := '--------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3521) := '-------------'||wwv_flow.LF||
'  c_mime_xml  constant varchar2(40)     := ''application/xml'';'||wwv_flow.LF||
'  c_char_set  constant v';
wwv_flow_imp.g_varchar2_table(3522) := 'archar2(5)      := ''UTF-8'';'||wwv_flow.LF||
'  c_headers   constant apex_t_varchar2  := apex_t_varchar2( ''Cache-Contr';
wwv_flow_imp.g_varchar2_table(3523) := 'ol'', ''Content-Disposition'', ''Last-Modified'' );'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3524) := '---------------------------'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3525) := '--------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3526) := '-------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3527) := '------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(3528) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and';
wwv_flow_imp.g_varchar2_table(3529) := ' procedures'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3530) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure rss('||wwv_flow.LF||
'    p_app';
wwv_flow_imp.g_varchar2_table(3531) := '_name  in varchar2,'||wwv_flow.LF||
'    p_app_desc  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           xmltype;'||wwv_flow.LF||
'    l_rss     ';
wwv_flow_imp.g_varchar2_table(3532) := '      blob;'||wwv_flow.LF||
'    l_lang          varchar2(256);'||wwv_flow.LF||
'    l_app_id        varchar2(256);'||wwv_flow.LF||
'    l_rss_url     ';
wwv_flow_imp.g_varchar2_table(3533) := '  varchar2(4000);'||wwv_flow.LF||
'    l_xsl_url       varchar2(4000);'||wwv_flow.LF||
'    l_home_url      varchar2(4000);'||wwv_flow.LF||
'    l_app_';
wwv_flow_imp.g_varchar2_table(3534) := 'name      varchar2(4000);'||wwv_flow.LF||
'    l_app_desc      varchar2(4000);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3535) := ' l_last_modified varchar2(256);'||wwv_flow.LF||
'    l_max_published timestamp;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_rss_version   constant varchar';
wwv_flow_imp.g_varchar2_table(3536) := '2(5)  := ''2.0'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_lang := apex_application.g_browser_language;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- RSS feed URL'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3537) := '  l_rss_url   := blog_url.get_rss;'||wwv_flow.LF||
'    -- blog name'||wwv_flow.LF||
'    l_app_name := coalesce('||wwv_flow.LF||
'       p_app_name'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3538) := '    ,blog_util.get_attribute_value( ''P0_BLOG_APP_NAME'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- rss feed description'||wwv_flow.LF||
'    l_ap';
wwv_flow_imp.g_varchar2_table(3539) := 'p_desc  := coalesce('||wwv_flow.LF||
'       p_app_desc'||wwv_flow.LF||
'      ,blog_util.get_attribute_value( ''P0_BLOG_APP_DESC'' )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3540) := '  );'||wwv_flow.LF||
'    -- blog home page absulute URL'||wwv_flow.LF||
'    l_home_url  := blog_url.get_tab('||wwv_flow.LF||
'       p_page       => ';
wwv_flow_imp.g_varchar2_table(3541) := '''HOME'''||wwv_flow.LF||
'      ,p_canonical  => ''YES'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- rss transformations (XSLT)'||wwv_flow.LF||
'    l_xsl_url := blog_u';
wwv_flow_imp.g_varchar2_table(3542) := 'rl.get_rss_xsl;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate RSS'||wwv_flow.LF||
'    select xmlserialize('||wwv_flow.LF||
'      content xmlconcat('||wwv_flow.LF||
'        case ';
wwv_flow_imp.g_varchar2_table(3543) := 'when l_xsl_url is not null'||wwv_flow.LF||
'          then xmlpi( "xml-stylesheet",'||wwv_flow.LF||
'            apex_string.format('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3544) := '              p_message => ''type="text/xsl" href="%s" media="screen"'''||wwv_flow.LF||
'              ,p0 => l_xsl_url';
wwv_flow_imp.g_varchar2_table(3545) := ''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        end,'||wwv_flow.LF||
'        xmlelement('||wwv_flow.LF||
'          "rss", xmlattributes('||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3546) := '     l_rss_version                              as "version"'||wwv_flow.LF||
'            ,''http://purl.org/dc/elemen';
wwv_flow_imp.g_varchar2_table(3547) := 'ts/1.1/''         as "xmlns:dc"'||wwv_flow.LF||
'            ,''http://purl.org/rss/1.0/modules/content/'' as "xmlns:con';
wwv_flow_imp.g_varchar2_table(3548) := 'tent"'||wwv_flow.LF||
'            ,''http://www.w3.org/2005/Atom''              as "xmlns:atom"'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3549) := ',xmlelement('||wwv_flow.LF||
'            "channel"'||wwv_flow.LF||
'            ,xmlelement('||wwv_flow.LF||
'              "atom:link"'||wwv_flow.LF||
'              ';
wwv_flow_imp.g_varchar2_table(3550) := ',xmlattributes('||wwv_flow.LF||
'                ''self''                as "rel"'||wwv_flow.LF||
'                ,l_rss_url           ';
wwv_flow_imp.g_varchar2_table(3551) := ' as "href"'||wwv_flow.LF||
'                ,blog_util.g_mime_rss as "type"'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3552) := ' ,xmlforest('||wwv_flow.LF||
'              l_app_name  as "title"'||wwv_flow.LF||
'              ,l_home_url as "link"'||wwv_flow.LF||
'              ';
wwv_flow_imp.g_varchar2_table(3553) := ',l_app_desc as "description"'||wwv_flow.LF||
'              ,l_lang     as "language"'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmla';
wwv_flow_imp.g_varchar2_table(3554) := 'gg('||wwv_flow.LF||
'              xmlelement('||wwv_flow.LF||
'                "item"'||wwv_flow.LF||
'                ,xmlelement( "title",          ';
wwv_flow_imp.g_varchar2_table(3555) := ' posts.post_title )'||wwv_flow.LF||
'                ,xmlelement( "dc:creator",      posts.blogger_name )'||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3556) := '     ,xmlelement( "category",        posts.category_title )'||wwv_flow.LF||
'                ,xmlelement( "link",    ';
wwv_flow_imp.g_varchar2_table(3557) := '        posts.absolute_url )'||wwv_flow.LF||
'                ,xmlelement( "description",     posts.post_desc )'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3558) := '           ,xmlelement( "content:encoded", xmlcdata( posts.body_html ) )'||wwv_flow.LF||
'                ,xmlelement';
wwv_flow_imp.g_varchar2_table(3559) := '( "pubDate",'||wwv_flow.LF||
'                  to_char('||wwv_flow.LF||
'                    sys_extract_utc( posts.published_on )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3560) := '                  ,blog_util.g_rfc_2822_date'||wwv_flow.LF||
'                    ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3561) := '          )'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'                ,xmlelement( "guid", xmlattributes( ''false'' as "isPerm';
wwv_flow_imp.g_varchar2_table(3562) := 'aLink" ), posts.post_id )'||wwv_flow.LF||
'              ) order by posts.published_on desc'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          )';
wwv_flow_imp.g_varchar2_table(3563) := ''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,max( posts.published';
wwv_flow_imp.g_varchar2_table(3564) := '_on ) as max_published'||wwv_flow.LF||
'    into l_rss, l_max_published'||wwv_flow.LF||
'    from blog_v_posts_last20 posts'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3565) := ' l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog';
wwv_flow_imp.g_varchar2_table(3566) := '_util.get_attribute_value( ''G_MAX_AGE_RSS'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_last_modified :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3567) := '       sys_extract_utc( l_max_published )'||wwv_flow.LF||
'        ,blog_util.g_rfc_2822_date'||wwv_flow.LF||
'        ,blog_util.g_nl';
wwv_flow_imp.g_varchar2_table(3568) := 's_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_rss'||wwv_flow.LF||
'      ,p_mi';
wwv_flow_imp.g_varchar2_table(3569) := 'me_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_va';
wwv_flow_imp.g_varchar2_table(3570) := 'rchar2( l_cache_control, ''inline; filename="rss.xml"'', l_last_modified  )'||wwv_flow.LF||
'      ,p_charset        =>';
wwv_flow_imp.g_varchar2_table(3571) := ' c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3572) := '  p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subp';
wwv_flow_imp.g_varchar2_table(3573) := 'rogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 )';
wwv_flow_imp.g_varchar2_table(3574) := ';'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rss;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3575) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure a';
wwv_flow_imp.g_varchar2_table(3576) := 'tom('||wwv_flow.LF||
'    p_app_name  in varchar2,'||wwv_flow.LF||
'    p_app_desc  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           xmltype;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3577) := '    l_atom          blob;'||wwv_flow.LF||
'    l_app_id        varchar2(256);'||wwv_flow.LF||
'    l_atom_url      varchar2(4000);'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3578) := ' l_home_url      varchar2(4000);'||wwv_flow.LF||
'    l_app_name      varchar2(4000);'||wwv_flow.LF||
'    l_app_desc      varchar2(40';
wwv_flow_imp.g_varchar2_table(3579) := '00);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'    l_last_modified varchar2(256);'||wwv_flow.LF||
'    l_max_published times';
wwv_flow_imp.g_varchar2_table(3580) := 'tamp;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- atom feed URL'||wwv_flow.LF||
'    l_atom_url   := blog_url.get_atom;'||wwv_flow.LF||
'    -- blog name'||wwv_flow.LF||
'    l_ap';
wwv_flow_imp.g_varchar2_table(3581) := 'p_name := coalesce('||wwv_flow.LF||
'       p_app_name'||wwv_flow.LF||
'      ,blog_util.get_attribute_value( ''P0_BLOG_APP_NAME'' )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3582) := ' );'||wwv_flow.LF||
'    -- atom feed description'||wwv_flow.LF||
'    l_app_desc  := coalesce('||wwv_flow.LF||
'       p_app_desc'||wwv_flow.LF||
'      ,blog_util.get';
wwv_flow_imp.g_varchar2_table(3583) := '_attribute_value( ''P0_BLOG_APP_DESC'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- blog home page absulute URL'||wwv_flow.LF||
'    l_home_url  := ';
wwv_flow_imp.g_varchar2_table(3584) := 'blog_url.get_tab('||wwv_flow.LF||
'       p_page       => ''HOME'''||wwv_flow.LF||
'      ,p_canonical  => ''YES'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate';
wwv_flow_imp.g_varchar2_table(3585) := ' atom feed'||wwv_flow.LF||
'    select xmlserialize( content'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "feed", xmlattributes('||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3586) := '   ''http://www.w3.org/2005/Atom'' as "xmlns"'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlelement( "link"'||wwv_flow.LF||
'          ,xmlattr';
wwv_flow_imp.g_varchar2_table(3587) := 'ibutes('||wwv_flow.LF||
'            ''self''                  as "rel"'||wwv_flow.LF||
'            ,l_atom_url             as "href"'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3588) := '           ,blog_util.g_mime_atom  as "type"'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlforest('||wwv_flow.LF||
'          l_a';
wwv_flow_imp.g_varchar2_table(3589) := 'pp_name  as "title"'||wwv_flow.LF||
'          ,l_app_desc as "subtitle"'||wwv_flow.LF||
'          ,l_atom_url as "id"'||wwv_flow.LF||
'          ,to_';
wwv_flow_imp.g_varchar2_table(3590) := 'char('||wwv_flow.LF||
'            sys_extract_utc( max( posts.published_on ) )'||wwv_flow.LF||
'            ,blog_util.g_iso_8601_dat';
wwv_flow_imp.g_varchar2_table(3591) := 'e'||wwv_flow.LF||
'            ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'          )           as "updated"'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlag';
wwv_flow_imp.g_varchar2_table(3592) := 'g('||wwv_flow.LF||
'          xmlelement( "entry"'||wwv_flow.LF||
'            ,xmlelement( "title", posts.post_title )'||wwv_flow.LF||
'            ,x';
wwv_flow_imp.g_varchar2_table(3593) := 'mlelement( "author"'||wwv_flow.LF||
'              ,xmlelement( "name", posts.blogger_name )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3594) := '  ,xmlelement( "category"'||wwv_flow.LF||
'              ,xmlattributes('||wwv_flow.LF||
'                posts.category_title  as "la';
wwv_flow_imp.g_varchar2_table(3595) := 'bel"'||wwv_flow.LF||
'                ,posts.category_title as "term"'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmle';
wwv_flow_imp.g_varchar2_table(3596) := 'lement( "link"'||wwv_flow.LF||
'              ,xmlattributes( posts.absolute_url as "href" )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3597) := '  ,xmlelement( "summary", posts.post_desc )'||wwv_flow.LF||
'            ,xmlelement( "content"'||wwv_flow.LF||
'              ,xmlatt';
wwv_flow_imp.g_varchar2_table(3598) := 'ributes( ''html'' as "type" )'||wwv_flow.LF||
'              ,xmlcdata( posts.body_html )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xm';
wwv_flow_imp.g_varchar2_table(3599) := 'lelement( "updated",'||wwv_flow.LF||
'              to_char('||wwv_flow.LF||
'                sys_extract_utc( posts.published_on )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3600) := '              ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'                ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3601) := '            )'||wwv_flow.LF||
'            ,xmlelement( "id",  posts.absolute_url )'||wwv_flow.LF||
'          ) order by posts.publis';
wwv_flow_imp.g_varchar2_table(3602) := 'hed_on desc'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,max( post';
wwv_flow_imp.g_varchar2_table(3603) := 's.published_on ) as max_published'||wwv_flow.LF||
'    into l_atom, l_max_published'||wwv_flow.LF||
'    from blog_v_posts_last20 post';
wwv_flow_imp.g_varchar2_table(3604) := 's'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3605) := ' ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_RSS'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_last_modified :='||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3606) := ' to_char('||wwv_flow.LF||
'         sys_extract_utc( l_max_published )'||wwv_flow.LF||
'        ,blog_util.g_rfc_2822_date'||wwv_flow.LF||
'        ,bl';
wwv_flow_imp.g_varchar2_table(3607) := 'og_util.g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_ato';
wwv_flow_imp.g_varchar2_table(3608) := 'm'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values ';
wwv_flow_imp.g_varchar2_table(3609) := ' => apex_t_varchar2( l_cache_control, ''inline; filename="atom.xml"'', l_last_modified  )'||wwv_flow.LF||
'      ,p_cha';
wwv_flow_imp.g_varchar2_table(3610) := 'rset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debu';
wwv_flow_imp.g_varchar2_table(3611) := 'g.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_c';
wwv_flow_imp.g_varchar2_table(3612) := 'all_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_htt';
wwv_flow_imp.g_varchar2_table(3613) := 'p_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end atom;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3614) := '--------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3615) := '-'||wwv_flow.LF||
'  procedure rss_xsl('||wwv_flow.LF||
'    p_css_file in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           xmltype;'||wwv_flow.LF||
'    l_xsl   ';
wwv_flow_imp.g_varchar2_table(3616) := '        blob;'||wwv_flow.LF||
'    l_css_url       varchar2(1024);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    --';
wwv_flow_imp.g_varchar2_table(3617) := ' Generate relaive URL for CSS file'||wwv_flow.LF||
'    if p_css_file not like ''http%'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_css_url := ap';
wwv_flow_imp.g_varchar2_table(3618) := 'ex_util.host_url( ''APEX_PATH'' );'||wwv_flow.LF||
'      l_css_url := substr( l_css_url, instr( l_css_url, ''/'', 1, 3 )';
wwv_flow_imp.g_varchar2_table(3619) := ' );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_css_url := l_css_url || p_css_file;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_xml :='||wwv_flow.LF||
'      xmltype('||wwv_flow.LF||
'        apex';
wwv_flow_imp.g_varchar2_table(3620) := '_string.format('||wwv_flow.LF||
'          p_message => '''||wwv_flow.LF||
'            <xsl:stylesheet version="1.0" xmlns:xsl="http:/';
wwv_flow_imp.g_varchar2_table(3621) := '/www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://pu';
wwv_flow_imp.g_varchar2_table(3622) := 'rl.org/rss/1.0/modules/content/">'||wwv_flow.LF||
'              <!-- This causes the HTML doctype (<!doctype hmlt>) ';
wwv_flow_imp.g_varchar2_table(3623) := 'to be rendered. -->'||wwv_flow.LF||
'              <xsl:output method="html" doctype-system="about:legacy-compat" ind';
wwv_flow_imp.g_varchar2_table(3624) := 'ent="yes" />'||wwv_flow.LF||
'              <!-- Start matching at the Channel node within the XML RSS feed. -->'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3625) := '          <xsl:template match="/rss/channel">'||wwv_flow.LF||
'                <html lang="%s">'||wwv_flow.LF||
'                <head';
wwv_flow_imp.g_varchar2_table(3626) := '>'||wwv_flow.LF||
'                  <meta name="viewport" content="width=device-width, initial-scale=1.0" />'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3627) := '           <title>'||wwv_flow.LF||
'                    <xsl:value-of select="title" />'||wwv_flow.LF||
'                  </title>'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3628) := '                <link rel="stylesheet" type="text/css" href="%s" />'||wwv_flow.LF||
'                </head>'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3629) := '        <body>'||wwv_flow.LF||
'                  <h1><a class="blog-rss--title" href="{ link }"><xsl:value-of select';
wwv_flow_imp.g_varchar2_table(3630) := '="title" /></a></h1>'||wwv_flow.LF||
'                  <h2 class="blog-rss--description"><xsl:value-of select="descr';
wwv_flow_imp.g_varchar2_table(3631) := 'iption" /></h2>'||wwv_flow.LF||
'                  <xsl:for-each select="./item">'||wwv_flow.LF||
'                    <article class=';
wwv_flow_imp.g_varchar2_table(3632) := '"blog-rss--post">'||wwv_flow.LF||
'                      <header>'||wwv_flow.LF||
'                        <h3 class="blog-rss--postHe';
wwv_flow_imp.g_varchar2_table(3633) := 'ader"><a href="{ link }"><xsl:value-of select="title" /></a></h3>'||wwv_flow.LF||
'                      </header>'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3634) := '                    <p class="blog-rss--postBody"><xsl:value-of select="description" /></p>'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3635) := '            </article>'||wwv_flow.LF||
'                  </xsl:for-each>'||wwv_flow.LF||
'                </body>'||wwv_flow.LF||
'                </h';
wwv_flow_imp.g_varchar2_table(3636) := 'tml>'||wwv_flow.LF||
'              </xsl:template>'||wwv_flow.LF||
'            </xsl:stylesheet>'''||wwv_flow.LF||
'          ,p0 => apex_application.';
wwv_flow_imp.g_varchar2_table(3637) := 'g_browser_language'||wwv_flow.LF||
'          ,p1 => l_css_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xmlserialize';
wwv_flow_imp.g_varchar2_table(3638) := '('||wwv_flow.LF||
'        content l_xml as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'      ) xsl'||wwv_flow.LF||
'    into l_xsl'||wwv_flow.LF||
'    f';
wwv_flow_imp.g_varchar2_table(3639) := 'rom dual'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3640) := '        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_RSS_XSL'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.dow';
wwv_flow_imp.g_varchar2_table(3641) := 'nload_file('||wwv_flow.LF||
'       p_blob_content   => l_xsl'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_n';
wwv_flow_imp.g_varchar2_table(3642) := 'ames   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="';
wwv_flow_imp.g_varchar2_table(3643) := 'rss.xsl"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  whe';
wwv_flow_imp.g_varchar2_table(3644) := 'n others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stac';
wwv_flow_imp.g_varchar2_table(3645) := 'k.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http';
wwv_flow_imp.g_varchar2_table(3646) := ' error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rss_xsl;'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(3647) := '-----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(3648) := '----------------------------------'||wwv_flow.LF||
'  procedure sitemap_index('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(3649) := '_app_page_id   in varchar2,'||wwv_flow.LF||
'    p_process_name  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url           varchar2(40';
wwv_flow_imp.g_varchar2_table(3650) := '00);'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'    l_build_option  constant varch';
wwv_flow_imp.g_varchar2_table(3651) := 'ar2(256) := ''BLOG_FEATURE_SITEMAP'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get url to call sitemaps process'||wwv_flow.LF||
'    l_url := bl';
wwv_flow_imp.g_varchar2_table(3652) := 'og_url.get_process;'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "sitemapindex",'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3653) := '     xmlattributes( ''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns" ),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3654) := 'xmlagg('||wwv_flow.LF||
'            xmlelement( "sitemap"'||wwv_flow.LF||
'              ,xmlelement( "loc", l_url || t1.process_name';
wwv_flow_imp.g_varchar2_table(3655) := ''||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by t1.execution_sequence'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as';
wwv_flow_imp.g_varchar2_table(3656) := ' blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from apex_application_page_proc t';
wwv_flow_imp.g_varchar2_table(3657) := '1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and t1.process_name != p_process_name'||wwv_flow.LF||
'      and t1.application_id = p_app_id';
wwv_flow_imp.g_varchar2_table(3658) := ''||wwv_flow.LF||
'      and t1.page_id = p_app_page_id'||wwv_flow.LF||
'      and t1.build_option = l_build_option'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_';
wwv_flow_imp.g_varchar2_table(3659) := 'control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get';
wwv_flow_imp.g_varchar2_table(3660) := '_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_co';
wwv_flow_imp.g_varchar2_table(3661) := 'ntent   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p';
wwv_flow_imp.g_varchar2_table(3662) := '_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-index.xml"'', null )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3663) := '      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3664) := '   apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subp';
wwv_flow_imp.g_varchar2_table(3665) := 'rogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_ut';
wwv_flow_imp.g_varchar2_table(3666) := 'il.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_index;'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(3667) := '-----------------------------------------'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3668) := '----------------------'||wwv_flow.LF||
'  procedure sitemap_main('||wwv_flow.LF||
'    p_app_id      in varchar2,'||wwv_flow.LF||
'    p_page_group  in';
wwv_flow_imp.g_varchar2_table(3669) := ' varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml   blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlseria';
wwv_flow_imp.g_varchar2_table(3670) := 'lize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        xmlattributes( ''http://www.sitemaps.org/s';
wwv_flow_imp.g_varchar2_table(3671) := 'chemas/sitemap/0.9'' as "xmlns" ),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3672) := '      ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_url.get_tab('||wwv_flow.LF||
'                   p_page       => v1.pa';
wwv_flow_imp.g_varchar2_table(3673) := 'ge_alias'||wwv_flow.LF||
'                  ,p_canonical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) or';
wwv_flow_imp.g_varchar2_table(3674) := 'der by v1.page_id'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3675) := '  )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from apex_application_pages v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.application_id = ';
wwv_flow_imp.g_varchar2_table(3676) := 'p_app_id'||wwv_flow.LF||
'      and v1.page_group = p_page_group'||wwv_flow.LF||
'      and case'||wwv_flow.LF||
'        when v1.build_option is null'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3677) := '        then apex_application_admin.c_build_option_status_include'||wwv_flow.LF||
'        else'||wwv_flow.LF||
'          apex_applic';
wwv_flow_imp.g_varchar2_table(3678) := 'ation_admin.get_build_option_status('||wwv_flow.LF||
'             p_application_id    => p_app_id'||wwv_flow.LF||
'            ,p_bui';
wwv_flow_imp.g_varchar2_table(3679) := 'ld_option_name => v1.build_option'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      end = apex_application_admin.c_build_option_stat';
wwv_flow_imp.g_varchar2_table(3680) := 'us_include'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s';
wwv_flow_imp.g_varchar2_table(3681) := ''''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.d';
wwv_flow_imp.g_varchar2_table(3682) := 'ownload_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header';
wwv_flow_imp.g_varchar2_table(3683) := '_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename';
wwv_flow_imp.g_varchar2_table(3684) := '="sitemap-main.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exce';
wwv_flow_imp.g_varchar2_table(3685) := 'ption'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => ut';
wwv_flow_imp.g_varchar2_table(3686) := 'l_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(3687) := '- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_main;'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(3688) := '---------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(3689) := '--------------------------------------------------'||wwv_flow.LF||
'  procedure sitemap_posts'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml         ';
wwv_flow_imp.g_varchar2_table(3690) := '  blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmleleme';
wwv_flow_imp.g_varchar2_table(3691) := 'nt('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"';
wwv_flow_imp.g_varchar2_table(3692) := '),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3693) := '           blog_url.get_post('||wwv_flow.LF||
'                   p_post_id    => posts.post_id'||wwv_flow.LF||
'                  ,p_';
wwv_flow_imp.g_varchar2_table(3694) := 'canonical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3695) := '        to_char('||wwv_flow.LF||
'                  sys_extract_utc('||wwv_flow.LF||
'                    greatest( posts.published_on';
wwv_flow_imp.g_varchar2_table(3696) := ', posts.changed_on )'||wwv_flow.LF||
'                  )'||wwv_flow.LF||
'                  ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'              ';
wwv_flow_imp.g_varchar2_table(3697) := '  )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by posts.published_on desc'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3698) := '   as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from blog_v_posts posts'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3699) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 =';
wwv_flow_imp.g_varchar2_table(3700) := '> blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3701) := '      p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_h';
wwv_flow_imp.g_varchar2_table(3702) := 'eaders'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-posts';
wwv_flow_imp.g_varchar2_table(3703) := '.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when o';
wwv_flow_imp.g_varchar2_table(3704) := 'thers'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.c';
wwv_flow_imp.g_varchar2_table(3705) := 'oncatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http er';
wwv_flow_imp.g_varchar2_table(3706) := 'ror'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_posts;'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(3707) := '--------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(3708) := '-------------------------------------'||wwv_flow.LF||
'  procedure sitemap_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3709) := '    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3710) := '    "urlset",'||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3711) := '   ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'             ';
wwv_flow_imp.g_varchar2_table(3712) := '   blog_url.get_category('||wwv_flow.LF||
'                   p_category_id  => cat.category_id'||wwv_flow.LF||
'                  ,p_';
wwv_flow_imp.g_varchar2_table(3713) := 'canonical    => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3714) := '          to_char('||wwv_flow.LF||
'                  sys_extract_utc( cat.changed_on )'||wwv_flow.LF||
'                  ,blog_util.';
wwv_flow_imp.g_varchar2_table(3715) := 'g_iso_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by cat.display_seq desc'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3716) := '    )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    f';
wwv_flow_imp.g_varchar2_table(3717) := 'rom blog_v_categories cat'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message';
wwv_flow_imp.g_varchar2_table(3718) := ' => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3719) := '    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3720) := '      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''i';
wwv_flow_imp.g_varchar2_table(3721) := 'nline; filename="sitemap-categories.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  --';
wwv_flow_imp.g_varchar2_table(3722) := ' handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error';
wwv_flow_imp.g_varchar2_table(3723) := ': %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => ';
wwv_flow_imp.g_varchar2_table(3724) := 'sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end site';
wwv_flow_imp.g_varchar2_table(3725) := 'map_categories;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(3726) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure sitemap_ar';
wwv_flow_imp.g_varchar2_table(3727) := 'chives'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlseri';
wwv_flow_imp.g_varchar2_table(3728) := 'alize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/s';
wwv_flow_imp.g_varchar2_table(3729) := 'chemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(3730) := '     ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_url.get_archive('||wwv_flow.LF||
'                   p_archive_id => ar';
wwv_flow_imp.g_varchar2_table(3731) := 'c.archive_year'||wwv_flow.LF||
'                  ,p_canonical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3732) := '    ,xmlelement( "lastmod",'||wwv_flow.LF||
'                to_char('||wwv_flow.LF||
'                  sys_extract_utc( arc.changed_';
wwv_flow_imp.g_varchar2_table(3733) := 'on )'||wwv_flow.LF||
'                  ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) or';
wwv_flow_imp.g_varchar2_table(3734) := 'der by arc.archive_year desc'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent ';
wwv_flow_imp.g_varchar2_table(3735) := 'size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from blog_v_archive_year arc'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      a';
wwv_flow_imp.g_varchar2_table(3736) := 'pex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ';
wwv_flow_imp.g_varchar2_table(3737) := '''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3738) := '     ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  =>';
wwv_flow_imp.g_varchar2_table(3739) := ' apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-archives.xml"'', null )'||wwv_flow.LF||
'      ,p_charse';
wwv_flow_imp.g_varchar2_table(3740) := 't        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.e';
wwv_flow_imp.g_varchar2_table(3741) := 'rror('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call';
wwv_flow_imp.g_varchar2_table(3742) := '_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_e';
wwv_flow_imp.g_varchar2_table(3743) := 'rror( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_archives;'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3744) := '-----------------------------'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3745) := '----------'||wwv_flow.LF||
'  procedure sitemap_tags'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256)';
wwv_flow_imp.g_varchar2_table(3746) := ';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        xmlattribut';
wwv_flow_imp.g_varchar2_table(3747) := 'es(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3748) := '  xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_url.get_tag('||wwv_flow.LF||
'            ';
wwv_flow_imp.g_varchar2_table(3749) := '       p_tag_id     => tags.tag_id'||wwv_flow.LF||
'                  ,p_canonical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3750) := '        )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'                to_char('||wwv_flow.LF||
'                  sys_extra';
wwv_flow_imp.g_varchar2_table(3751) := 'ct_utc( tags.changed_on )'||wwv_flow.LF||
'                  ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3752) := '   )'||wwv_flow.LF||
'            ) order by tags.changed_on'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_c';
wwv_flow_imp.g_varchar2_table(3753) := 'har_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from blog_v_tags tags'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :=';
wwv_flow_imp.g_varchar2_table(3754) := ''||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute';
wwv_flow_imp.g_varchar2_table(3755) := '_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   =>';
wwv_flow_imp.g_varchar2_table(3756) := ' l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_va';
wwv_flow_imp.g_varchar2_table(3757) := 'lues  => apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-tags.xml"'', null )'||wwv_flow.LF||
'      ,p_ch';
wwv_flow_imp.g_varchar2_table(3758) := 'arset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_deb';
wwv_flow_imp.g_varchar2_table(3759) := 'ug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_';
wwv_flow_imp.g_varchar2_table(3760) := 'call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_ht';
wwv_flow_imp.g_varchar2_table(3761) := 'tp_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_tags;'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3762) := '-----------------------------'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3763) := '----------'||wwv_flow.LF||
'end "BLOG_XML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_AI"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(3764) := '-----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(3765) := '----------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(3766) := '--------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3767) := '-------------------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3768) := '  param_t str_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(3769) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedure';
wwv_flow_imp.g_varchar2_table(3770) := 's and functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(3771) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure init_param';
wwv_flow_imp.g_varchar2_table(3772) := 's'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set valus for session'||wwv_flow.LF||
'    param_t( ''lang_ai_static_id'' ) := ''BLOG_LANGUAGE_AI';
wwv_flow_imp.g_varchar2_table(3773) := ''';'||wwv_flow.LF||
'    param_t( ''gen_ai_static_id'' ) := ''BLOG_OPEN_AI_API'';'||wwv_flow.LF||
'    param_t( ''gen_ai_credential_static_i';
wwv_flow_imp.g_varchar2_table(3774) := 'd'' ) := ''BLOG_OPEN_AI_API_KEY'';'||wwv_flow.LF||
'    param_t( ''lang_ai_build_option'' ) := ''BLOG_FEATURE_LANGUAGE_AI'';';
wwv_flow_imp.g_varchar2_table(3775) := ''||wwv_flow.LF||
'    param_t( ''gen_ai_build_option'' ) := ''BLOG_FEATURE_GENERATIVE_AI'';'||wwv_flow.LF||
'    param_t( ''gen_ai_generate';
wwv_flow_imp.g_varchar2_table(3776) := '_msg'' ) := ''BLOG_AI_GENERATE_MESSAGE'';'||wwv_flow.LF||
'    param_t( ''gen_ai_generate_prompt_msg'' ) := ''BLOG_AI_GENER';
wwv_flow_imp.g_varchar2_table(3777) := 'ATE_PROMPT'';'||wwv_flow.LF||
'    param_t( ''lang_ai_compartment_param_name'') := ''G_OCI_LANG_AI_COMPARTMENT_OCID'';'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3778) := ' param_t( ''lang_ai_compartment_ocid'' ) := blog_util.get_attribute_value( param_t( ''lang_ai_compartme';
wwv_flow_imp.g_varchar2_table(3779) := 'nt_param_name'' ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Debug parameters'||wwv_flow.LF||
'    apex_debug.info( ''Language AI remote server static ';
wwv_flow_imp.g_varchar2_table(3780) := 'id: %s'', param_t( ''lang_ai_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI service static id: %s';
wwv_flow_imp.g_varchar2_table(3781) := ''', param_t( ''gen_ai_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI credential static id: %s'', p';
wwv_flow_imp.g_varchar2_table(3782) := 'aram_t( ''gen_ai_credential_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Language AI build option name: %s'',';
wwv_flow_imp.g_varchar2_table(3783) := ' param_t( ''lang_ai_build_option'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI build option name: %s'', pa';
wwv_flow_imp.g_varchar2_table(3784) := 'ram_t( ''gen_ai_build_option'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI generate message: %s'', param_t';
wwv_flow_imp.g_varchar2_table(3785) := '( ''gen_ai_generate_msg'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI generate prompt message: %s'', param';
wwv_flow_imp.g_varchar2_table(3786) := '_t( ''gen_ai_generate_prompt_msg'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Language AI comparment parameter name : ';
wwv_flow_imp.g_varchar2_table(3787) := '%s'', param_t( ''lang_ai_compartment_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Language AI comparment OCI';
wwv_flow_imp.g_varchar2_table(3788) := 'D : %s'', param_t( ''lang_ai_compartment_ocid'') );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end init_params;'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(3789) := '-------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3790) := '------------------------------'||wwv_flow.LF||
'  procedure get_sentiments'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_compartnet_id varchar2(256);'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3791) := '  l_document      clob;'||wwv_flow.LF||
'    l_params        apex_exec.t_parameters;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Loop through com';
wwv_flow_imp.g_varchar2_table(3792) := 'ments that have not yet been analyzed'||wwv_flow.LF||
'    for c1 in ('||wwv_flow.LF||
'      with q1 as('||wwv_flow.LF||
'        select'||wwv_flow.LF||
'          id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3793) := '        , v1.body_html'||wwv_flow.LF||
'        , mod( rownum, floor( count(1) over() / 5 ) ) as batch_group'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3794) := 'from blog_v_all_comments v1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and sentiment is null'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      select';
wwv_flow_imp.g_varchar2_table(3795) := ''||wwv_flow.LF||
'        json_arrayagg('||wwv_flow.LF||
'          json_object('||wwv_flow.LF||
'            ''key''   is blog_util.int_to_vc2( q1.id ),';
wwv_flow_imp.g_varchar2_table(3796) := ''||wwv_flow.LF||
'            ''text''  is blog_comment.plain_text( q1.body_html )'||wwv_flow.LF||
'          ) returning clob'||wwv_flow.LF||
'        )';
wwv_flow_imp.g_varchar2_table(3797) := ' as document'||wwv_flow.LF||
'      from q1'||wwv_flow.LF||
'      group by'||wwv_flow.LF||
'        q1.batch_group'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Set attributes';
wwv_flow_imp.g_varchar2_table(3798) := ' for the language AI request'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params, ''compartmentId'', param_t( ''lan';
wwv_flow_imp.g_varchar2_table(3799) := 'g_ai_compartment_ocid'') );'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params, ''documents'', c1.document );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3800) := '  apex_exec.add_parameter( l_params, ''level'', ''SENTENCE'' );'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params,';
wwv_flow_imp.g_varchar2_table(3801) := ' ''languageCode'', ''en'' );'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params, ''batchDocumentService'', ''batchDete';
wwv_flow_imp.g_varchar2_table(3802) := 'ctLanguageSentiments'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Call language AI to analyze sentiment'||wwv_flow.LF||
'      apex_exec.execute_res';
wwv_flow_imp.g_varchar2_table(3803) := 't_source('||wwv_flow.LF||
'        p_static_id           => param_t( ''lang_ai_module_static_id'' ),'||wwv_flow.LF||
'        p_operatio';
wwv_flow_imp.g_varchar2_table(3804) := 'n_static_id => ''batch_document'','||wwv_flow.LF||
'        p_parameters          => l_params'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Retrie';
wwv_flow_imp.g_varchar2_table(3805) := 've response body'||wwv_flow.LF||
'      l_document := apex_exec.get_parameter_clob( l_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3806) := '   -- Insert response JSON into the database'||wwv_flow.LF||
'      merge_sentiment('||wwv_flow.LF||
'        p_language  => ''en'''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3807) := '  , p_documents => l_document'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      dbms_session.sleep( 1 );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_sen';
wwv_flow_imp.g_varchar2_table(3808) := 'timents;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(3809) := '----------------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and proce';
wwv_flow_imp.g_varchar2_table(3810) := 'dures'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(3811) := '-------------------------------------------------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3812) := 'p_param_name in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return param_t( p_param_name );'||wwv_flow.LF||
'  end ';
wwv_flow_imp.g_varchar2_table(3813) := 'get_param_value;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(3814) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure set_lang_';
wwv_flow_imp.g_varchar2_table(3815) := 'ai('||wwv_flow.LF||
'    p_compartment_id  in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_build_status    in v';
wwv_flow_imp.g_varchar2_table(3816) := 'archar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_attributes  apex_t_varchar2;'||wwv_flow.LF||
'    l_base_url    varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    a';
wwv_flow_imp.g_varchar2_table(3817) := 'pex_debug.info( ''Set buid option %s status: %s'', param_t( ''lang_ai_build_option'' ), p_build_status )';
wwv_flow_imp.g_varchar2_table(3818) := ';'||wwv_flow.LF||
'    -- Set build option status for the language AI feature'||wwv_flow.LF||
'    blog_admin.update_feature('||wwv_flow.LF||
'      p_';
wwv_flow_imp.g_varchar2_table(3819) := 'build_option_name => param_t( ''lang_ai_build_option'' )'||wwv_flow.LF||
'    , p_build_status      => p_build_status'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3820) := '   );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- If build option status is INCLUDE'||wwv_flow.LF||
'    if p_build_status = apex_application_admin.c_bui';
wwv_flow_imp.g_varchar2_table(3821) := 'ld_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set compartment OCID: %s'', p_compartment_';
wwv_flow_imp.g_varchar2_table(3822) := 'id );'||wwv_flow.LF||
'      -- Set attribute name and value'||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''la';
wwv_flow_imp.g_varchar2_table(3823) := 'ng_ai_compartment_param_name'' ), p_compartment_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Update attribute'||wwv_flow.LF||
'      blog_admin.set';
wwv_flow_imp.g_varchar2_table(3824) := '_attribute_value('||wwv_flow.LF||
'        p_attribute_list => l_attributes'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_base_url := rtrim( p_ba';
wwv_flow_imp.g_varchar2_table(3825) := 'se_url, ''/'' ) || ''/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set remote server %s: %s'', param_t( ''lang_ai_static_i';
wwv_flow_imp.g_varchar2_table(3826) := 'd'' ), l_base_url );'||wwv_flow.LF||
'      -- Set remote server URL'||wwv_flow.LF||
'      apex_application_admin.set_remote_server('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3827) := '       p_static_id => param_t( ''lang_ai_static_id'' )'||wwv_flow.LF||
'      , p_base_url  => l_base_url'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3828) := ' end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_lang_ai;'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3829) := '---------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedu';
wwv_flow_imp.g_varchar2_table(3830) := 're set_gen_ai('||wwv_flow.LF||
'    p_build_status    in varchar2,'||wwv_flow.LF||
'    p_api_key         in varchar2,'||wwv_flow.LF||
'    p_base_url ';
wwv_flow_imp.g_varchar2_table(3831) := '       in varchar2,'||wwv_flow.LF||
'    p_ai_model_name   in varchar2,'||wwv_flow.LF||
'    p_ai_http_headers in varchar2,'||wwv_flow.LF||
'    p_ai_a';
wwv_flow_imp.g_varchar2_table(3832) := 'ttributes   in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_base_url    varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Se';
wwv_flow_imp.g_varchar2_table(3833) := 't buid option %s status: %s'', param_t( ''gen_ai_build_option'' ), p_build_status );'||wwv_flow.LF||
'    -- Set build o';
wwv_flow_imp.g_varchar2_table(3834) := 'ption status for the generative AI feature'||wwv_flow.LF||
'    blog_admin.update_feature('||wwv_flow.LF||
'      p_build_option_name ';
wwv_flow_imp.g_varchar2_table(3835) := '=> param_t( ''gen_ai_build_option'' )'||wwv_flow.LF||
'    , p_build_status      => p_build_status'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_bui';
wwv_flow_imp.g_varchar2_table(3836) := 'ld_status = apex_application_admin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- Update credential';
wwv_flow_imp.g_varchar2_table(3837) := ' if new API key is provided'||wwv_flow.LF||
'      if p_api_key is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_credential.set_pe';
wwv_flow_imp.g_varchar2_table(3838) := 'rsistent_credentials('||wwv_flow.LF||
'          p_credential_static_id  => param_t( ''gen_ai_credential_static_id'' )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3839) := '        , p_key   => ''Authorization'''||wwv_flow.LF||
'        , p_value =>'||wwv_flow.LF||
'            apex_string.format('||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3840) := '    p_message => ''Bearer %s'''||wwv_flow.LF||
'            , p0 => p_api_key'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3841) := '     l_base_url := rtrim( p_base_url, ''/'' ) || ''/'';'||wwv_flow.LF||
'      -- Update remote server'||wwv_flow.LF||
'      apex_applica';
wwv_flow_imp.g_varchar2_table(3842) := 'tion_admin.set_remote_server('||wwv_flow.LF||
'        p_static_id       => param_t( ''gen_ai_static_id'' )'||wwv_flow.LF||
'      , p_b';
wwv_flow_imp.g_varchar2_table(3843) := 'ase_url        => p_base_url'||wwv_flow.LF||
'      , p_ai_model_name   => p_ai_model_name'||wwv_flow.LF||
'      , p_ai_http_headers ';
wwv_flow_imp.g_varchar2_table(3844) := '=> p_ai_http_headers'||wwv_flow.LF||
'      , p_ai_attributes   => p_ai_attributes'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_g';
wwv_flow_imp.g_varchar2_table(3845) := 'en_ai;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(3846) := '--------------------------------------------------------------------'||wwv_flow.LF||
'  procedure gen_ai_chat('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(3847) := 'post          in varchar2,'||wwv_flow.LF||
'    p_system_prompt in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_messages  apex_ai.t_chat_m';
wwv_flow_imp.g_varchar2_table(3848) := 'essages := apex_ai.c_chat_messages;'||wwv_flow.LF||
'    l_response  clob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Prepare user message for A';
wwv_flow_imp.g_varchar2_table(3849) := 'I chat'||wwv_flow.LF||
'    l_messages(1).chat_role := ''user'';'||wwv_flow.LF||
'    l_messages(1).message :='||wwv_flow.LF||
'      apex_lang.get_messa';
wwv_flow_imp.g_varchar2_table(3850) := 'ge('||wwv_flow.LF||
'        p_name    => param_t( ''gen_ai_generate_msg'' )'||wwv_flow.LF||
'      , p_params  =>'||wwv_flow.LF||
'          apex_t_varc';
wwv_flow_imp.g_varchar2_table(3851) := 'har2 ('||wwv_flow.LF||
'            ''post'''||wwv_flow.LF||
'          , substr( apex_escape.striphtml( p_post ), 1, 32000 )'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3852) := ')'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Generate AI response using AI service'||wwv_flow.LF||
'    l_response :='||wwv_flow.LF||
'      apex_ai.chat('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3853) := '        p_service_static_id => param_t( ''gen_ai_static_id'' )'||wwv_flow.LF||
'      , p_messages          => l_messag';
wwv_flow_imp.g_varchar2_table(3854) := 'es'||wwv_flow.LF||
'      , p_prompt            =>'||wwv_flow.LF||
'          apex_lang.get_message('||wwv_flow.LF||
'            p_name => param_t( ''g';
wwv_flow_imp.g_varchar2_table(3855) := 'en_ai_generate_prompt_msg'' )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      , p_system_prompt     =>'||wwv_flow.LF||
'          apex_lang.get_mess';
wwv_flow_imp.g_varchar2_table(3856) := 'age('||wwv_flow.LF||
'            p_name => p_system_prompt'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''AI generated ';
wwv_flow_imp.g_varchar2_table(3857) := 'content: %s'', l_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Write HTTP JSON header and response'||wwv_flow.LF||
'    apex_plugin_util.print_j';
wwv_flow_imp.g_varchar2_table(3858) := 'son_http_header;'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write( ''response'', l_response );'||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(3859) := 'json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end gen_ai_chat;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3860) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3861) := 'procedure merge_sentiment('||wwv_flow.LF||
'    p_language  in varchar2,'||wwv_flow.LF||
'    p_documents in clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_comme';
wwv_flow_imp.g_varchar2_table(3862) := 'nt_id      number;'||wwv_flow.LF||
'    l_sentiment_json  varchar2(32700);'||wwv_flow.LF||
'    l_json_documents  json_array_t;'||wwv_flow.LF||
'    l_';
wwv_flow_imp.g_varchar2_table(3863) := 'json_document   json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Input JSON document: %s'', p_documents ';
wwv_flow_imp.g_varchar2_table(3864) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON document'||wwv_flow.LF||
'    l_json_document := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    -- Ret';
wwv_flow_imp.g_varchar2_table(3865) := 'rieve the "documents" array'||wwv_flow.LF||
'    l_json_documents := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(3866) := '- Loop through each document in the array'||wwv_flow.LF||
'    for i in 0 .. l_json_documents.get_size() - 1 loop'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3867) := '    -- Extract document details'||wwv_flow.LF||
'      l_json_document := json_object_t( l_json_documents.get(i) );'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3868) := '     l_comment_id := to_number( l_json_document.get_string( ''key'' ) );'||wwv_flow.LF||
'      l_sentiment_json := l_j';
wwv_flow_imp.g_varchar2_table(3869) := 'son_document.stringify();'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Merge sentiment data into the database'||wwv_flow.LF||
'      merge into blog_com';
wwv_flow_imp.g_varchar2_table(3870) := 'ment_sentiments t1'||wwv_flow.LF||
'      using dual on ( t1.comment_id = l_comment_id )'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3871) := '        insert( comment_id, original_language, sentiment_json )'||wwv_flow.LF||
'        values( l_comment_id, p_lang';
wwv_flow_imp.g_varchar2_table(3872) := 'uage, l_sentiment_json )'||wwv_flow.LF||
'      when matched then'||wwv_flow.LF||
'        update set sentiment_json = l_sentiment_jso';
wwv_flow_imp.g_varchar2_table(3873) := 'n;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end merge_sentiment;'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3874) := '----------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3875) := '---'||wwv_flow.LF||
'  procedure get_lang_code('||wwv_flow.LF||
'    p_documents in clob,'||wwv_flow.LF||
'    p_lang_code out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as';
wwv_flow_imp.g_varchar2_table(3876) := ''||wwv_flow.LF||
'    l_temp_score      number;'||wwv_flow.LF||
'    l_score           number := -999;'||wwv_flow.LF||
'    l_json_documents  json_arra';
wwv_flow_imp.g_varchar2_table(3877) := 'y_t;'||wwv_flow.LF||
'    l_json_document   json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Input JSON document: %s'', p';
wwv_flow_imp.g_varchar2_table(3878) := '_documents );'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_lang_code := ''en''; -- Default language code'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON document'||wwv_flow.LF||
'    l_j';
wwv_flow_imp.g_varchar2_table(3879) := 'son_document := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    -- Retrieve the "documents" array'||wwv_flow.LF||
'    l_json';
wwv_flow_imp.g_varchar2_table(3880) := '_documents := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
'    -- Extract the first document'||wwv_flow.LF||
'    l_json';
wwv_flow_imp.g_varchar2_table(3881) := '_document := json_object_t( l_json_documents.get(0) );'||wwv_flow.LF||
'    -- Retrieve the "languages" array'||wwv_flow.LF||
'    l_j';
wwv_flow_imp.g_varchar2_table(3882) := 'son_documents := l_json_document.get_array( ''languages'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Loop through languages to find th';
wwv_flow_imp.g_varchar2_table(3883) := 'e highest score'||wwv_flow.LF||
'    for i in 0 .. l_json_documents.get_size() - 1 loop'||wwv_flow.LF||
'      l_json_document := json';
wwv_flow_imp.g_varchar2_table(3884) := '_object_t( l_json_documents.get(i) );'||wwv_flow.LF||
'      l_temp_score := l_json_document.get_number( ''score'' );'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3885) := '     if l_temp_score > l_score then'||wwv_flow.LF||
'        l_score := l_temp_score;'||wwv_flow.LF||
'        p_lang_code := l_json_d';
wwv_flow_imp.g_varchar2_table(3886) := 'ocument.get_string( ''code'' );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_lang_code;'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(3887) := '------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(3888) := '-----------------------------------------'||wwv_flow.LF||
'  procedure get_translation('||wwv_flow.LF||
'    p_documents   in clob,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3889) := '  p_translation out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json_documents  json_array_t;'||wwv_flow.LF||
'    l_json_document   j';
wwv_flow_imp.g_varchar2_table(3890) := 'son_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Input JSON: %s'', p_documents );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON docu';
wwv_flow_imp.g_varchar2_table(3891) := 'ment'||wwv_flow.LF||
'    l_json_document := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    -- Retrieve the "documents" arra';
wwv_flow_imp.g_varchar2_table(3892) := 'y'||wwv_flow.LF||
'    l_json_documents := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
'    -- Extract the translated te';
wwv_flow_imp.g_varchar2_table(3893) := 'xt from the first document'||wwv_flow.LF||
'    l_json_document := json_object_t( l_json_documents.get(0) );'||wwv_flow.LF||
'    p_tr';
wwv_flow_imp.g_varchar2_table(3894) := 'anslation := l_json_document.get_string( ''translatedText'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_translation;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(3895) := '-----------------------------------------------------------------'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(3896) := '----------------------------------------------'||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(3897) := '-----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(3898) := '----------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- initialize parameters'||wwv_flow.LF||
'  apex_debug.info( ''----- Initia';
wwv_flow_imp.g_varchar2_table(3899) := 'lize package BLOG_AI -----'' );'||wwv_flow.LF||
'  init_params;'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3900) := '--------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3901) := '-------'||wwv_flow.LF||
'end "BLOG_AI";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- DDL for Foreign Keys'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_CO';
wwv_flow_imp.g_varchar2_table(3902) := 'MMENTS_FK1" FOREIGN KEY ("POST_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_POSTS" ("ID") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMME';
wwv_flow_imp.g_varchar2_table(3903) := 'NTS" ADD CONSTRAINT "BLOG_COMMENTS_FK2" FOREIGN KEY ("PARENT_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_COMMENTS" ("ID"';
wwv_flow_imp.g_varchar2_table(3904) := ') ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMMENT_FLAGS" ADD CONSTRAINT "BLOG_COMMENT_FLAGS_FK1" FOREIGN KEY ("COM';
wwv_flow_imp.g_varchar2_table(3905) := 'MENT_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_COMMENTS" ("ID") ON DELETE CASCADE ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMMENT_SE';
wwv_flow_imp.g_varchar2_table(3906) := 'NTIMENTS" ADD CONSTRAINT "BLOG_COMMENT_SENTIMENTS_FK1" FOREIGN KEY ("COMMENT_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG';
wwv_flow_imp.g_varchar2_table(3907) := '_COMMENTS" ("ID") ON DELETE CASCADE ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMMENT_SUBSCRIBERS" ADD CONSTRAINT "B';
wwv_flow_imp.g_varchar2_table(3908) := 'LOG_COMMENT_SUBSCRIBERS_FK1" FOREIGN KEY ("POST_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_POSTS" ("ID") ON DELETE CASC';
wwv_flow_imp.g_varchar2_table(3909) := 'ADE ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_COMMENT_SUBSCRIBERS" ADD CONSTRAINT "BLOG_COMMENT_SUBSCRIBERS_FK2" FOR';
wwv_flow_imp.g_varchar2_table(3910) := 'EIGN KEY ("EMAIL_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_SUBSCRIBERS_EMAIL" ("ID") ON DELETE CASCADE ENABLE;'||wwv_flow.LF||
'ALTER T';
wwv_flow_imp.g_varchar2_table(3911) := 'ABLE "BLOG_FEATURES" ADD CONSTRAINT "BLOG_FEATURES_FK1" FOREIGN KEY ("BUILD_OPTION_PARENT")'||wwv_flow.LF||
'  REFERE';
wwv_flow_imp.g_varchar2_table(3912) := 'NCES "BLOG_FEATURES" ("BUILD_OPTION_NAME") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_FEATURES" ADD CONSTRAINT "BLOG_';
wwv_flow_imp.g_varchar2_table(3913) := 'FEATURES_FK2" FOREIGN KEY ("REF_BUILD_OPTION_NAME")'||wwv_flow.LF||
'  REFERENCES "BLOG_FEATURES" ("BUILD_OPTION_NAME';
wwv_flow_imp.g_varchar2_table(3914) := '") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_INIT_ITEMS" ADD CONSTRAINT "BLOG_INIT_ITEMS_FK1" FOREIGN KEY ("ITEM_NAM';
wwv_flow_imp.g_varchar2_table(3915) := 'E")'||wwv_flow.LF||
'  REFERENCES "BLOG_SETTINGS" ("ATTRIBUTE_NAME") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT ';
wwv_flow_imp.g_varchar2_table(3916) := '"BLOG_LINKS_FK1" FOREIGN KEY ("LINK_GROUP_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_LINK_GROUPS" ("ID") ON DELETE CASC';
wwv_flow_imp.g_varchar2_table(3917) := 'ADE ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK1" FOREIGN KEY ("BLOGGER_ID")'||wwv_flow.LF||
'  RE';
wwv_flow_imp.g_varchar2_table(3918) := 'FERENCES "BLOG_BLOGGERS" ("ID") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK2" FOR';
wwv_flow_imp.g_varchar2_table(3919) := 'EIGN KEY ("CATEGORY_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_CATEGORIES" ("ID") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_POST_TAGS" ';
wwv_flow_imp.g_varchar2_table(3920) := 'ADD CONSTRAINT "BLOG_POST_TAGS_FK1" FOREIGN KEY ("POST_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_POSTS" ("ID") ON DELE';
wwv_flow_imp.g_varchar2_table(3921) := 'TE CASCADE ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_POST_TAGS" ADD CONSTRAINT "BLOG_POST_TAGS_FK2" FOREIGN KEY ("TA';
wwv_flow_imp.g_varchar2_table(3922) := 'G_ID")'||wwv_flow.LF||
'  REFERENCES "BLOG_TAGS" ("ID") ENABLE;'||wwv_flow.LF||
'ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETT';
wwv_flow_imp.g_varchar2_table(3923) := 'INGS_FK1" FOREIGN KEY ("BUILD_OPTION_NAME")'||wwv_flow.LF||
'  REFERENCES "BLOG_FEATURES" ("BUILD_OPTION_NAME") ENABL';
wwv_flow_imp.g_varchar2_table(3924) := 'E;'||wwv_flow.LF||
'-- DDL for foreign key indexes'||wwv_flow.LF||
'CREATE INDEX "BLOG_COMMENTS_IX1" ON "BLOG_COMMENTS" ("POST_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3925) := 'CREATE INDEX "BLOG_COMMENTS_IX2" ON "BLOG_COMMENTS" ("PARENT_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_COMMENT_SUBSC';
wwv_flow_imp.g_varchar2_table(3926) := 'RIBERS_IX1" ON "BLOG_COMMENT_SUBSCRIBERS" ("EMAIL_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_FEATURES_IX1" ON "BLOG_F';
wwv_flow_imp.g_varchar2_table(3927) := 'EATURES" ("BUILD_OPTION_PARENT")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_FEATURES_IX2" ON "BLOG_FEATURES" ("REF_BUILD_O';
wwv_flow_imp.g_varchar2_table(3928) := 'PTION_NAME")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_INIT_ITEMS_IX1" ON "BLOG_INIT_ITEMS" ("ITEM_NAME")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX ';
wwv_flow_imp.g_varchar2_table(3929) := '"BLOG_POSTS_IX1" ON "BLOG_POSTS" ("BLOGGER_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_POSTS_IX2" ON "BLOG_POSTS" ("CA';
wwv_flow_imp.g_varchar2_table(3930) := 'TEGORY_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_POST_TAGS_IX1" ON "BLOG_POST_TAGS" ("TAG_ID")'||wwv_flow.LF||
';'||wwv_flow.LF||
'CREATE INDEX "BLOG_';
wwv_flow_imp.g_varchar2_table(3931) := 'SETTINGS_IX1" ON "BLOG_SETTINGS" ("BUILD_OPTION_NAME")'||wwv_flow.LF||
';'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(115343135841750502)
,p_install_id=>wwv_flow_imp.id(114152993306634160)
,p_name=>'Database objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260125232659Z')
);
wwv_flow_imp.component_end;
end;
/
