--  Patch 24.1.20241125 part 2
--------------------------------------------------------
--  Insert BLOG_SETTING_FEATURES
--------------------------------------------------------
insert into blog_setting_features(attribute_name, build_option_name, build_option_status)
  values('G_MAX_AGE_DOWNLOAD', 'BLOG_FEATURE_OCI_OBJECT_STORAGE', 'EXCLUDE')
;
insert into blog_setting_features(attribute_name, build_option_name, build_option_status)
  values('G_MAX_AGE_FILE', 'BLOG_FEATURE_OCI_OBJECT_STORAGE', 'EXCLUDE')
;
--------------------------------------------------------
--  Insert BLOG_FEATURE_PARENTS
--------------------------------------------------------
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_SEARCH_POSTS', 'BLOG_FEATURE_SEARCH')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_SEARCH_COMMENTS', 'BLOG_FEATURE_SEARCH')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_SEARCH_LINKS', 'BLOG_FEATURE_SEARCH')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_SEARCH_FILES', 'BLOG_FEATURE_SEARCH')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_CATEGORY_POST_COUNT', 'BLOG_FEATURE_CATEGORY')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_ARCHIVE_POST_COUNT', 'BLOG_FEATURE_ARCHIVE')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT', 'BLOG_FEATURE_TAG_CLOUD')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_MODERATE_COMMENTS', 'BLOG_FEATURE_ALLOW_COMMENTS')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_SUBSCRIBE_COMMENTS', 'BLOG_FEATURE_ALLOW_COMMENTS')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_COMMENT_VERIFY', 'BLOG_FEATURE_ALLOW_COMMENTS')
;
insert into blog_feature_parents(is_active, build_option_name, build_option_parent)
  values('1', 'BLOG_FEATURE_MODERATE_COMMENTS_AI', 'BLOG_FEATURE_ALLOW_COMMENTS')
;
--------------------------------------------------------
--  Update BLOG_COMMENTS comment preview
--------------------------------------------------------
alter trigger blog_comments_trg disable
;
update blog_comments
  set comment_preview = blog_comm.short_text( body_html )
;
alter table blog_comments modify comment_preview not null
;
alter trigger blog_comments_trg enable
;
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20241125','STRING','INTERNAL','Patch 24.1.20241125')
;
