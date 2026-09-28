prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 402
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
wwv_flow_imp.g_varchar2_table(1) := '-- Drop Foreign Keys'||wwv_flow.LF||
'alter table blog_comments drop constraint blog_comments_fk1;'||wwv_flow.LF||
'alter table blog_c';
wwv_flow_imp.g_varchar2_table(2) := 'omments drop constraint blog_comments_fk2;'||wwv_flow.LF||
'alter table blog_comment_flags drop constraint blog_comme';
wwv_flow_imp.g_varchar2_table(3) := 'nt_flags_fk1;'||wwv_flow.LF||
'alter table blog_comment_sentiments drop constraint blog_comment_sentiments_fk1;'||wwv_flow.LF||
'alter';
wwv_flow_imp.g_varchar2_table(4) := ' table blog_comment_subscribers drop constraint blog_comment_subscribers_fk1;'||wwv_flow.LF||
'alter table blog_comme';
wwv_flow_imp.g_varchar2_table(5) := 'nt_subscribers drop constraint blog_comment_subscribers_fk2;'||wwv_flow.LF||
'alter table blog_features drop constrai';
wwv_flow_imp.g_varchar2_table(6) := 'nt blog_features_fk1;'||wwv_flow.LF||
'alter table blog_features drop constraint blog_features_fk2;'||wwv_flow.LF||
'alter table blog_';
wwv_flow_imp.g_varchar2_table(7) := 'init_items drop constraint blog_init_items_fk1;'||wwv_flow.LF||
'alter table blog_links drop constraint blog_links_fk';
wwv_flow_imp.g_varchar2_table(8) := '1;'||wwv_flow.LF||
'alter table blog_posts drop constraint blog_posts_fk1;'||wwv_flow.LF||
'alter table blog_posts drop constraint blo';
wwv_flow_imp.g_varchar2_table(9) := 'g_posts_fk2;'||wwv_flow.LF||
'alter table blog_post_tags drop constraint blog_post_tags_fk1;'||wwv_flow.LF||
'alter table blog_post_ta';
wwv_flow_imp.g_varchar2_table(10) := 'gs drop constraint blog_post_tags_fk2;'||wwv_flow.LF||
'alter table blog_settings drop constraint blog_settings_fk1;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(11) := '-- Drop objects'||wwv_flow.LF||
'drop package blog_admin;'||wwv_flow.LF||
'drop package blog_ai;'||wwv_flow.LF||
'drop package blog_comment;'||wwv_flow.LF||
'drop packa';
wwv_flow_imp.g_varchar2_table(12) := 'ge blog_ctx;'||wwv_flow.LF||
'drop package blog_file;'||wwv_flow.LF||
'drop package blog_html;'||wwv_flow.LF||
'drop package blog_install;'||wwv_flow.LF||
'drop package';
wwv_flow_imp.g_varchar2_table(13) := ' blog_mime;'||wwv_flow.LF||
'drop package blog_oci_os;'||wwv_flow.LF||
'drop package blog_plugin;'||wwv_flow.LF||
'drop package blog_url;'||wwv_flow.LF||
'drop package ';
wwv_flow_imp.g_varchar2_table(14) := 'blog_util;'||wwv_flow.LF||
'drop package blog_xml;'||wwv_flow.LF||
'drop sequence blog_seq;'||wwv_flow.LF||
'drop table blog_bloggers;'||wwv_flow.LF||
'drop table blog_';
wwv_flow_imp.g_varchar2_table(15) := 'categories;'||wwv_flow.LF||
'drop table blog_comments;'||wwv_flow.LF||
'drop table blog_comment_flags;'||wwv_flow.LF||
'drop table blog_comment_sentime';
wwv_flow_imp.g_varchar2_table(16) := 'nts;'||wwv_flow.LF||
'drop table blog_comment_subscribers;'||wwv_flow.LF||
'drop table blog_dynamic_content;'||wwv_flow.LF||
'drop table blog_features;';
wwv_flow_imp.g_varchar2_table(17) := ''||wwv_flow.LF||
'drop table blog_files;'||wwv_flow.LF||
'drop table blog_init_items;'||wwv_flow.LF||
'drop table blog_links;'||wwv_flow.LF||
'drop table blog_link_grou';
wwv_flow_imp.g_varchar2_table(18) := 'ps;'||wwv_flow.LF||
'drop table blog_list_of_values;'||wwv_flow.LF||
'drop table blog_posts;'||wwv_flow.LF||
'drop table blog_post_tags;'||wwv_flow.LF||
'drop table blo';
wwv_flow_imp.g_varchar2_table(19) := 'g_settings;'||wwv_flow.LF||
'drop table blog_subscribers_email;'||wwv_flow.LF||
'drop table blog_tags;'||wwv_flow.LF||
'drop view blog_v_all_categories';
wwv_flow_imp.g_varchar2_table(20) := ';'||wwv_flow.LF||
'drop view blog_v_all_comments;'||wwv_flow.LF||
'drop view blog_v_all_dynamic_content;'||wwv_flow.LF||
'drop view blog_v_all_files;'||wwv_flow.LF||
'd';
wwv_flow_imp.g_varchar2_table(21) := 'rop view blog_v_all_links;'||wwv_flow.LF||
'drop view blog_v_all_link_groups;'||wwv_flow.LF||
'drop view blog_v_all_posts;'||wwv_flow.LF||
'drop view b';
wwv_flow_imp.g_varchar2_table(22) := 'log_v_all_post_tags;'||wwv_flow.LF||
'drop view blog_v_all_tags;'||wwv_flow.LF||
'drop view blog_v_archive_year;'||wwv_flow.LF||
'drop view blog_v_blog';
wwv_flow_imp.g_varchar2_table(23) := 'gers;'||wwv_flow.LF||
'drop view blog_v_categories;'||wwv_flow.LF||
'drop view blog_v_comments;'||wwv_flow.LF||
'drop view blog_v_dynamic_content;'||wwv_flow.LF||
'drop';
wwv_flow_imp.g_varchar2_table(24) := ' view blog_v_features;'||wwv_flow.LF||
'drop view blog_v_files;'||wwv_flow.LF||
'drop view blog_v_form_comments;'||wwv_flow.LF||
'drop view blog_v_form';
wwv_flow_imp.g_varchar2_table(25) := '_posts;'||wwv_flow.LF||
'drop view blog_v_init_items;'||wwv_flow.LF||
'drop view blog_v_links;'||wwv_flow.LF||
'drop view blog_v_lov;'||wwv_flow.LF||
'drop view blog_v_';
wwv_flow_imp.g_varchar2_table(26) := 'posts;'||wwv_flow.LF||
'drop view blog_v_posts_last20;'||wwv_flow.LF||
'drop view blog_v_post_tags;'||wwv_flow.LF||
'drop view blog_v_settings;'||wwv_flow.LF||
'drop vi';
wwv_flow_imp.g_varchar2_table(27) := 'ew blog_v_tags;'||wwv_flow.LF||
'drop view blog_v_version;'||wwv_flow.LF||
'-- Drop text index preferences'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'  ctx_ddl_error exc';
wwv_flow_imp.g_varchar2_table(28) := 'eption;'||wwv_flow.LF||
'  pragma exception_init ( ctx_ddl_error, -20000 );'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop_preference';
wwv_flow_imp.g_varchar2_table(29) := '( ''BLOG_COMMENTS_UDS'' );'||wwv_flow.LF||
'    exception when ctx_ddl_error then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop';
wwv_flow_imp.g_varchar2_table(30) := '_preference( ''BLOG_POSTS_UDS'' );'||wwv_flow.LF||
'    exception when ctx_ddl_error then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/';
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(114152993306634160)
,p_welcome_message=>'This application installer will guide you through the process of creating database objects and metadata necessary to run the application.'
,p_license_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Please read license from',
'',
'https://raw.githubusercontent.com/jariolaine/apex-blog/master/LICENSE.txt'))
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_install_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Supporting objects have been installed successfully.',
'',
'For login to blog administration application, you must create APEX workspace user group called "Bloggers" and assign APEX user to this group.'))
,p_install_failure_message=>'Installation of database objects and meta data has failed.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_views',
'where 1 = 1',
'and view_name = ''BLOG_V_VERSION'''))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_required_free_kb=>200
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_last_updated_on=>wwv_flow_imp.dz('20260928174102Z')
);
wwv_flow_imp.component_end;
end;
/
