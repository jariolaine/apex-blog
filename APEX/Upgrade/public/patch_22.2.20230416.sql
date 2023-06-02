--  Patch 22.2.20230416
--------------------------------------------------------
--  Alter table BLOG_CATEGORIES
--------------------------------------------------------
alter table blog_categories drop constraint blog_categories_uk1;
alter table blog_categories drop constraint blog_categories_uk2;
alter table blog_categories add constraint blog_categories_uk1 unique( title_unique );
--------------------------------------------------------
--  Alter table BLOG_TAGS
--------------------------------------------------------
alter table blog_tags drop constraint blog_tags_uk1;
alter table blog_tags drop constraint blog_tags_uk2;
alter table blog_tags add constraint blog_tags_uk1 unique( tag_unique );
--------------------------------------------------------
--  Update table BLOG_LIST_OF_VALUES
--------------------------------------------------------
update blog_list_of_values
set display_message = 'BLOG_LOV_LINK_STATUS_GROUP_DISABLED'
where 1 = 1
and display_message = 'BLOG_LOV_LINK_STATUS_LABEL_DISABLED'
;
update blog_list_of_values
set display_message = 'BLOG_TXT_DISABLED'
where 1 = 1
and display_message in(
  'BLOG_LOV_COMMENT_STATUS_DISABLED'
  ,'BLOG_LOV_IS_ACTIVE_DISABLED'
  ,'BLOG_LOV_LINK_STATUS_DISABLED'
);
update blog_list_of_values
set display_message = 'BLOG_TXT_ENABLED'
where 1 = 1
and display_message in(
  'BLOG_LOV_COMMENT_STATUS_ENABLED'
  ,'BLOG_LOV_IS_ACTIVE_ENABLED'
  ,'BLOG_LOV_LINK_STATUS_ENABLED'
);
--------------------------------------------------------
--  Drop renamed views
--------------------------------------------------------
drop view blog_v_all_features;
drop view blog_v_all_settings;
--------------------------------------------------------
--  Drop obsolete table BLOG_POST_PREVIEW
--------------------------------------------------------
drop table blog_post_preview;
--------------------------------------------------------
--  Alter table BLOG_POSTS
--------------------------------------------------------
alter table blog_posts rename column post_txt_search to ctx_search;
--------------------------------------------------------
--  Alter table BLOG_COMMENTS
--------------------------------------------------------
alter table blog_comments add ctx_search char( 1 byte );
alter trigger blog_comments_trg disable;
update blog_comments
  set ctx_search = 'X'
;
alter trigger blog_comments_trg enable;
alter table blog_comments modify ctx_search not null;
--------------------------------------------------------
--  Drop obsolete text index preferences
--------------------------------------------------------
begin
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_DS' );
end;
/
begin
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_LX' );
end;
/
--------------------------------------------------------
--  Truncate table BLOG_FEATURES and reinsert metadata
--------------------------------------------------------
truncate table blog_features;
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','110','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','120','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','130','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','140','BLOG_FEATURE_SEARCH','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','150','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_SEARCH');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','160','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_SEARCH');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','179','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_SEARCH');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','220','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','230','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','240','BLOG_FEATURE_CATEGORY_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_CATEGORY');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','250','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','260','BLOG_FEATURE_ARCHIVE_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_ARCHIVE');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','270','BLOG_FEATURE_TAG_CLOUD','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','280','BLOG_FEATURE_TAG_CLOUD_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_TAG_CLOUD');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','290','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','310','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','320','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','330','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','410','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_MISC',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','420','BLOG_FEATURE_MODAL_PAGES','BLOG_FEATURE_GROUP_MISC',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','430','BLOG_FEATURE_SITEMAP','BLOG_FEATURE_GROUP_MISC',null);
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20230416','STRING','INTERNAL','Patch 22.2.20230416')
;
