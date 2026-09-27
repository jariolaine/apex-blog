prompt --application/deployment/install/upgrade_patch_24_2_20250701_part_1
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 24.2.20250701 part 1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '--  Patch 24.2.20250701 part 1'||wwv_flow.LF||
'-- Rename table BLOG_COMMENTS constraints'||wwv_flow.LF||
'alter table blog_comments r';
wwv_flow_imp.g_varchar2_table(2) := 'ename constraint blog_comment_ck1 to blog_comments_ck1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'alter table blog_comments rename constraint';
wwv_flow_imp.g_varchar2_table(3) := ' blog_comment_ck2 to blog_comments_ck2'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Alter table BLOG_FILES'||wwv_flow.LF||
'alter table blog_files rename col';
wwv_flow_imp.g_varchar2_table(4) := 'umn file_name to file_path'||wwv_flow.LF||
'/'||wwv_flow.LF||
'alter table blog_files modify blob_content null'||wwv_flow.LF||
'/'||wwv_flow.LF||
'alter table blog_file';
wwv_flow_imp.g_varchar2_table(5) := 's add('||wwv_flow.LF||
'  md5 varchar2( 256 char )'||wwv_flow.LF||
', etag varchar2( 256 char )'||wwv_flow.LF||
', apex$sync_step_static_id varchar2( 2';
wwv_flow_imp.g_varchar2_table(6) := '55 byte )'||wwv_flow.LF||
', apex$row_sync_timestamp timestamp with time zone'||wwv_flow.LF||
', file_dir  varchar2(260 char) generate';
wwv_flow_imp.g_varchar2_table(7) := 'd always as ( ''/'' || substr( file_path, 1, instr( file_path, ''/'', - 1 ) ) ) virtual not null'||wwv_flow.LF||
', file_';
wwv_flow_imp.g_varchar2_table(8) := 'name varchar2(260 char) generated always as ( substr( file_path, instr( file_path, ''/'', - 1 ) + 1 ) ';
wwv_flow_imp.g_varchar2_table(9) := ') virtual not null'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Alter table BLOG_FEATURES'||wwv_flow.LF||
'alter table blog_features add('||wwv_flow.LF||
'  ref_build_optio';
wwv_flow_imp.g_varchar2_table(10) := 'n_name varchar2( 256 char )'||wwv_flow.LF||
', ref_build_option_status varchar2( 10 char )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'alter table blog_featu';
wwv_flow_imp.g_varchar2_table(11) := 'res add constraint blog_features_fk2 foreign key( ref_build_option_name )'||wwv_flow.LF||
'references blog_features( ';
wwv_flow_imp.g_varchar2_table(12) := 'build_option_name ) enable'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Alter table BLOG_SETTINGS'||wwv_flow.LF||
'alter table blog_settings add('||wwv_flow.LF||
'  build_opt';
wwv_flow_imp.g_varchar2_table(13) := 'ion_name varchar2( 256 char )'||wwv_flow.LF||
', build_option_status varchar2( 10 char )'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'alter table blog_setting';
wwv_flow_imp.g_varchar2_table(14) := 's add constraint blog_settings_fk1 foreign key( build_option_name )'||wwv_flow.LF||
'references blog_features( build_';
wwv_flow_imp.g_varchar2_table(15) := 'option_name ) enable'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Alter table BLOG_POSTS'||wwv_flow.LF||
'alter table blog_posts modify post_desc varchar2(40';
wwv_flow_imp.g_varchar2_table(16) := '00 byte)'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Alter table BLOG_COMMENTS'||wwv_flow.LF||
'alter table blog_comments add( comment_preview varchar2(4000';
wwv_flow_imp.g_varchar2_table(17) := ' byte) )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Create table BLOG_COMMENT_SENTIMENTS'||wwv_flow.LF||
'create table blog_comment_sentiments('||wwv_flow.LF||
'  id number';
wwv_flow_imp.g_varchar2_table(18) := '( 38, 0 ) not null,'||wwv_flow.LF||
'  row_version number( 38, 0 ) not null,'||wwv_flow.LF||
'  created_on timestamp( 6 ) with local t';
wwv_flow_imp.g_varchar2_table(19) := 'ime zone not null,'||wwv_flow.LF||
'  created_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  changed_on timestamp( 6 ) with loca';
wwv_flow_imp.g_varchar2_table(20) := 'l time zone not null,'||wwv_flow.LF||
'  changed_by varchar2( 256 char ) not null,'||wwv_flow.LF||
'  comment_id number( 38, 0 ) not n';
wwv_flow_imp.g_varchar2_table(21) := 'ull,'||wwv_flow.LF||
'  original_language varchar2( 6 char ) not null,'||wwv_flow.LF||
'  sentiment_json varchar2(4000 byte) not null,';
wwv_flow_imp.g_varchar2_table(22) := ''||wwv_flow.LF||
'  constraint blog_comment_sentiments_pk primary key( id ),'||wwv_flow.LF||
'  constraint blog_comment_sentiments_uk1';
wwv_flow_imp.g_varchar2_table(23) := ' unique( comment_id ),'||wwv_flow.LF||
'  constraint blog_comment_sentiments_ck1 check( row_version > 0 ),'||wwv_flow.LF||
'  constrai';
wwv_flow_imp.g_varchar2_table(24) := 'nt blog_comment_sentiments_ck2 check( sentiment_json is json ),'||wwv_flow.LF||
'  constraint blog_comment_sentiments';
wwv_flow_imp.g_varchar2_table(25) := '_fk1 foreign key( comment_id ) references blog_comments(id) on delete cascade'||wwv_flow.LF||
')'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- Create indexes ';
wwv_flow_imp.g_varchar2_table(26) := 'for foreign key columns'||wwv_flow.LF||
'create index blog_comments_ix1 on blog_comments( post_id )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index bl';
wwv_flow_imp.g_varchar2_table(27) := 'og_comments_ix2 on blog_comments( parent_id )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_comment_subscribers_ix1 on blog_co';
wwv_flow_imp.g_varchar2_table(28) := 'mment_subscribers( email_id )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_features_ix1 on blog_features( build_option_parent';
wwv_flow_imp.g_varchar2_table(29) := ' )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_features_ix2 on blog_features( ref_build_option_name )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_in';
wwv_flow_imp.g_varchar2_table(30) := 'it_items_ix1 on blog_init_items( item_name )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_posts_ix1 on blog_posts( blogger_id';
wwv_flow_imp.g_varchar2_table(31) := ' )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_posts_ix2 on blog_posts( category_id )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_post_tags_ix1 on b';
wwv_flow_imp.g_varchar2_table(32) := 'log_post_tags( tag_id )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create index blog_settings_ix1 on blog_settings( build_option_name )'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(33) := 'Drop renamed packages'||wwv_flow.LF||
'drop package blog_cm'||wwv_flow.LF||
'/'||wwv_flow.LF||
'drop package blog_comm'||wwv_flow.LF||
'/';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(149055008806170771)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Patch 24.2.20250701 part 1'
,p_sequence=>40
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20250701'))
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260125233144Z')
);
wwv_flow_imp.component_end;
end;
/
