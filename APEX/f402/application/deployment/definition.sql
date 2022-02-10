prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 402
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(31706870664802069)
,p_include_in_export_yn=>'I'
,p_welcome_message=>'This application installer will guide you through the process of creating database objects and meta data necessary to run the APEX Blog application.'
,p_license_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>The MIT License (MIT)',
'',
'Copyright (c) 2021 Jari Laine',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy of',
'this software and associated documentation files (the "Software"), to deal in',
'the Software without restriction, including without limitation the rights to',
'use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of',
'the Software, and to permit persons to whom the Software is furnished to do so,',
'subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all',
'copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS',
'FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR',
'COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER',
'IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN',
'CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
'</pre>'))
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_install_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Blog supporting objects have been installed successfully.',
'',
'For login to Blog Administration Area, you must create APEX workspace user group "Bloggers" and assign APEX user to this group.'))
,p_install_failure_message=>'Installation of database objects and meta data has failed.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_tables',
'where 1 = 1',
'and table_name = ''BLOG_SETTINGS'''))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--------------------------------------------------------',
'--  Drop Foreign Keys',
'--------------------------------------------------------',
'alter table blog_comments drop constraint blog_comments_fk1;',
'alter table blog_comments drop constraint blog_comments_fk2;',
'alter table blog_comment_flags drop constraint blog_comment_flags_fk1;',
'alter table blog_comment_subscribers drop constraint blog_comment_subscribers_fk1;',
'alter table blog_comment_subscribers drop constraint blog_comment_subscribers_fk2;',
'alter table blog_init_items drop constraint blog_init_items_fk1;',
'alter table blog_links drop constraint blog_links_fk1;',
'alter table blog_posts drop constraint blog_posts_fk1;',
'alter table blog_posts drop constraint blog_posts_fk2;',
'alter table blog_post_tags drop constraint blog_post_tags_fk1;',
'alter table blog_post_tags drop constraint blog_post_tags_fk2;',
'alter table blog_post_uds drop constraint blog_post_uds_fk1;',
'--------------------------------------------------------',
'--  Drop objects',
'--------------------------------------------------------',
'drop package blog_cm;',
'drop package blog_comm;',
'drop package blog_ctx;',
'drop package blog_html;',
'drop package blog_plugin;',
'drop package blog_url;',
'drop package blog_util;',
'drop package blog_xml;',
'drop sequence blog_seq;',
'drop table blog_bloggers;',
'drop table blog_categories;',
'drop table blog_comments;',
'drop table blog_comment_flags;',
'drop table blog_comment_subscribers;',
'drop table blog_dynamic_content;',
'drop table blog_features;',
'drop table blog_files;',
'drop table blog_init_items;',
'drop table blog_links;',
'drop table blog_link_groups;',
'drop table blog_posts;',
'drop table blog_post_preview;',
'drop table blog_post_tags;',
'drop table blog_post_uds;',
'drop table blog_settings;',
'drop table blog_subscribers_email;',
'drop table blog_tags;',
'drop view blog_v_all_categories;',
'drop view blog_v_all_comments;',
'drop view blog_v_all_dynamic_content;',
'drop view blog_v_all_features;',
'drop view blog_v_all_files;',
'drop view blog_v_all_links;',
'drop view blog_v_all_link_groups;',
'drop view blog_v_all_posts;',
'drop view blog_v_all_post_tags;',
'drop view blog_v_all_settings;',
'drop view blog_v_all_tags;',
'drop view blog_v_archive_year;',
'drop view blog_v_bloggers;',
'drop view blog_v_categories;',
'drop view blog_v_comments;',
'drop view blog_v_dynamic_content;',
'drop view blog_v_files;',
'drop view blog_v_init_items;',
'drop view blog_v_links;',
'drop view blog_v_posts;',
'drop view blog_v_posts_last20;',
'drop view blog_v_post_tags;',
'drop view blog_v_tags;',
'--------------------------------------------------------',
'--  Drop text index section groups',
'--------------------------------------------------------',
'begin',
'ctx_ddl.drop_section_group( ''BLOG_POST_UDS_SG'' );',
'end;',
'/',
'--------------------------------------------------------',
'--  Drop text index preferences',
'--------------------------------------------------------',
'begin',
'ctx_ddl.drop_preference( ''BLOG_POST_UDS_DS'');',
'ctx_ddl.drop_preference( ''BLOG_POST_UDS_LX'');',
'end;',
'/',
''))
,p_required_free_kb=>200
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
wwv_flow_api.component_end;
end;
/
