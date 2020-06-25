--------------------------------------------------------
--  Drop Foreign Keys
--------------------------------------------------------
alter table blog_comments drop constraint blog_comments_fk1;
alter table blog_comments drop constraint blog_comments_fk2;
alter table blog_comment_flags drop constraint blog_comment_flags_fk1;
alter table blog_comment_subs drop constraint blog_comment_subs_fk1;
alter table blog_comment_subs drop constraint blog_comment_subs_fk2;
alter table blog_links drop constraint blog_links_fk1;
alter table blog_posts drop constraint blog_posts_fk1;
alter table blog_posts drop constraint blog_posts_fk2;
alter table blog_posts_uds drop constraint blog_posts_uds_fk1;
alter table blog_post_tags drop constraint blog_post_tags_fk1;
alter table blog_post_tags drop constraint blog_post_tags_fk2;
--------------------------------------------------------
--  Drop objects
--------------------------------------------------------
drop package blog_cm;
drop package blog_comm;
drop package blog_ctx;
drop package blog_html;
drop package blog_ords;
drop package blog_plugin;
drop package blog_url;
drop package blog_util;
drop package blog_xml;
drop sequence blog_seq;
drop table blog_bloggers;
drop table blog_categories;
drop table blog_comments;
drop table blog_comment_flags;
drop table blog_comment_subs;
drop table blog_comment_subs_email;
drop table blog_features;
drop table blog_files;
drop table blog_init_items;
drop table blog_links;
drop table blog_link_groups;
drop table blog_ords_templates;
drop table blog_pages;
drop table blog_posts;
drop table blog_posts_uds;
drop table blog_post_preview;
drop table blog_post_tags;
drop table blog_settings;
drop table blog_tags;
drop view blog_v_all_categories;
drop view blog_v_all_comments;
drop view blog_v_all_features;
drop view blog_v_all_files;
drop view blog_v_all_links;
drop view blog_v_all_link_groups;
drop view blog_v_all_posts;
drop view blog_v_all_post_tags;
drop view blog_v_all_settings;
drop view blog_v_all_tags;
drop view blog_v_archive_year;
drop view blog_v_categories;
drop view blog_v_comments;
drop view blog_v_files;
drop view blog_v_init_items;
drop view blog_v_links;
drop view blog_v_link_groups;
drop view blog_v_posts;
drop view blog_v_posts_last20;
drop view blog_v_post_tags;
drop view blog_v_rep_post_by_status;
drop view blog_v_tags;
drop view blog_v_temp_files;
