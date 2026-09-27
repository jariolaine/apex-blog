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
'alter table blog';
wwv_flow_imp.g_varchar2_table(2) := '_comments drop constraint blog_comments_fk2;'||wwv_flow.LF||
'alter table blog_comment_flags drop constraint blog_co';
wwv_flow_imp.g_varchar2_table(3) := 'mment_flags_fk1;'||wwv_flow.LF||
'alter table blog_comment_sentiments drop constraint blog_comment_sentiments_fk1;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(4) := 'alter table blog_comment_subscribers drop constraint blog_comment_subscribers_fk1;'||wwv_flow.LF||
'alter table blog';
wwv_flow_imp.g_varchar2_table(5) := '_comment_subscribers drop constraint blog_comment_subscribers_fk2;'||wwv_flow.LF||
'alter table blog_features drop c';
wwv_flow_imp.g_varchar2_table(6) := 'onstraint blog_features_fk1;'||wwv_flow.LF||
'alter table blog_features drop constraint blog_features_fk2;'||wwv_flow.LF||
'alter ta';
wwv_flow_imp.g_varchar2_table(7) := 'ble blog_init_items drop constraint blog_init_items_fk1;'||wwv_flow.LF||
'alter table blog_links drop constraint blo';
wwv_flow_imp.g_varchar2_table(8) := 'g_links_fk1;'||wwv_flow.LF||
'alter table blog_posts drop constraint blog_posts_fk1;'||wwv_flow.LF||
'alter table blog_posts drop co';
wwv_flow_imp.g_varchar2_table(9) := 'nstraint blog_posts_fk2;'||wwv_flow.LF||
'alter table blog_post_tags drop constraint blog_post_tags_fk1;'||wwv_flow.LF||
'alter tabl';
wwv_flow_imp.g_varchar2_table(10) := 'e blog_post_tags drop constraint blog_post_tags_fk2;'||wwv_flow.LF||
'alter table blog_settings drop constraint blog';
wwv_flow_imp.g_varchar2_table(11) := '_settings_fk1;'||wwv_flow.LF||
'-- Drop objects'||wwv_flow.LF||
'drop package blog_admin;'||wwv_flow.LF||
'drop package blog_ai;'||wwv_flow.LF||
'drop package blog_';
wwv_flow_imp.g_varchar2_table(12) := 'comment;'||wwv_flow.LF||
'drop package blog_ctx;'||wwv_flow.LF||
'drop package blog_file;'||wwv_flow.LF||
'drop package blog_html;'||wwv_flow.LF||
'drop package blo';
wwv_flow_imp.g_varchar2_table(13) := 'g_install;'||wwv_flow.LF||
'drop package blog_mime;'||wwv_flow.LF||
'drop package blog_oci_os;'||wwv_flow.LF||
'drop package blog_plugin;'||wwv_flow.LF||
'drop pack';
wwv_flow_imp.g_varchar2_table(14) := 'age blog_url;'||wwv_flow.LF||
'drop package blog_util;'||wwv_flow.LF||
'drop package blog_xml;'||wwv_flow.LF||
'drop sequence blog_seq;'||wwv_flow.LF||
'drop table ';
wwv_flow_imp.g_varchar2_table(15) := 'blog_bloggers;'||wwv_flow.LF||
'drop table blog_categories;'||wwv_flow.LF||
'drop table blog_comments;'||wwv_flow.LF||
'drop table blog_comment_flag';
wwv_flow_imp.g_varchar2_table(16) := 's;'||wwv_flow.LF||
'drop table blog_comment_sentiments;'||wwv_flow.LF||
'drop table blog_comment_subscribers;'||wwv_flow.LF||
'drop table blog_dynam';
wwv_flow_imp.g_varchar2_table(17) := 'ic_content;'||wwv_flow.LF||
'drop table blog_features;'||wwv_flow.LF||
'drop table blog_files;'||wwv_flow.LF||
'drop table blog_init_items;'||wwv_flow.LF||
'drop ta';
wwv_flow_imp.g_varchar2_table(18) := 'ble blog_links;'||wwv_flow.LF||
'drop table blog_link_groups;'||wwv_flow.LF||
'drop table blog_list_of_values;'||wwv_flow.LF||
'drop table blog_post';
wwv_flow_imp.g_varchar2_table(19) := 's;'||wwv_flow.LF||
'drop table blog_post_tags;'||wwv_flow.LF||
'drop table blog_settings;'||wwv_flow.LF||
'drop table blog_subscribers_email;'||wwv_flow.LF||
'drop ';
wwv_flow_imp.g_varchar2_table(20) := 'table blog_tags;'||wwv_flow.LF||
'drop view blog_v_all_categories;'||wwv_flow.LF||
'drop view blog_v_all_comments;'||wwv_flow.LF||
'drop view blog_v';
wwv_flow_imp.g_varchar2_table(21) := '_all_dynamic_content;'||wwv_flow.LF||
'drop view blog_v_all_files;'||wwv_flow.LF||
'drop view blog_v_all_links;'||wwv_flow.LF||
'drop view blog_v_al';
wwv_flow_imp.g_varchar2_table(22) := 'l_link_groups;'||wwv_flow.LF||
'drop view blog_v_all_posts;'||wwv_flow.LF||
'drop view blog_v_all_post_tags;'||wwv_flow.LF||
'drop view blog_v_all_t';
wwv_flow_imp.g_varchar2_table(23) := 'ags;'||wwv_flow.LF||
'drop view blog_v_archive_year;'||wwv_flow.LF||
'drop view blog_v_bloggers;'||wwv_flow.LF||
'drop view blog_v_categories;'||wwv_flow.LF||
'drop';
wwv_flow_imp.g_varchar2_table(24) := ' view blog_v_comments;'||wwv_flow.LF||
'drop view blog_v_dynamic_content;'||wwv_flow.LF||
'drop view blog_v_features;'||wwv_flow.LF||
'drop view blo';
wwv_flow_imp.g_varchar2_table(25) := 'g_v_files;'||wwv_flow.LF||
'drop view blog_v_form_comments;'||wwv_flow.LF||
'drop view blog_v_form_posts;'||wwv_flow.LF||
'drop view blog_v_init_ite';
wwv_flow_imp.g_varchar2_table(26) := 'ms;'||wwv_flow.LF||
'drop view blog_v_links;'||wwv_flow.LF||
'drop view blog_v_lov;'||wwv_flow.LF||
'drop view blog_v_posts;'||wwv_flow.LF||
'drop view blog_v_posts';
wwv_flow_imp.g_varchar2_table(27) := '_last20;'||wwv_flow.LF||
'drop view blog_v_post_tags;'||wwv_flow.LF||
'drop view blog_v_settings;'||wwv_flow.LF||
'drop view blog_v_tags;'||wwv_flow.LF||
'drop view';
wwv_flow_imp.g_varchar2_table(28) := ' blog_v_version;'||wwv_flow.LF||
'-- Drop text index preferences'||wwv_flow.LF||
'declare'||wwv_flow.LF||
'  ctx_ddl_error exception;'||wwv_flow.LF||
'  pragma exce';
wwv_flow_imp.g_varchar2_table(29) := 'ption_init ( ctx_ddl_error, -20000 );'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop_preference( ''BLOG_COMMENTS_U';
wwv_flow_imp.g_varchar2_table(30) := 'DS'' );'||wwv_flow.LF||
'    exception when ctx_ddl_error then null;'||wwv_flow.LF||
'  end;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    ctx_ddl.drop_preference( ''';
wwv_flow_imp.g_varchar2_table(31) := 'BLOG_POSTS_UDS'' );'||wwv_flow.LF||
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
,p_last_updated_on=>wwv_flow_imp.dz('20260125232735Z')
);
wwv_flow_imp.component_end;
end;
/
