--  Patch 24.1.20241125 part 2
-- Update BLOG_COMMENTS comment preview
alter trigger blog_comments_trg disable;
update blog_comments
  set comment_preview = blog_comm.short_text( body_html )
;
alter table blog_comments modify comment_preview not null;
alter trigger blog_comments_trg enable;
-- Insert metadata
begin
-- Insert BLOG_FEATURES
  blog_install.features_ins( 1, 430, 'BLOG_FEATURE_COMMENT_VERIFY', 'BLOG_FEATURE_GROUP_COMMENTS' );
  blog_install.features_ins( 1, 450, 'BLOG_FEATURE_MODERATE_COMMENTS_AI', 'BLOG_FEATURE_GROUP_COMMENTS' );
-- Insert BLOG_SETTINGS
  blog_install.settings_ins( 1110, 1, 'G_OCI_OS_PROXY_URL', 'URL', 'INTERNAL' );
  blog_install.settings_ins( 1120, 1, 'G_OCI_OS_BUCKET_URL', 'URL', 'INTERNAL' );
  blog_install.settings_ins( 1130, 1, 'G_OCI_OS_NAMESPACE', 'STRING', 'INTERNAL' );
  blog_install.settings_ins( 1150, 1, 'G_OCI_OS_REGION', 'STRING', 'INTERNAL' );
  blog_install.settings_ins( 1160, 1, 'G_OCI_OS_BUCKET', 'STRING', 'INTERNAL' );
  blog_install.settings_ins( 1170, 1, 'G_OCI_LANG_AI_COMPARTMENT_OCID', 'STRING', 'INTERNAL' );
-- Insert BLOG_SETTING_FEATURES
  blog_install.setting_features_ins( 'G_MAX_AGE_DOWNLOAD', 'BLOG_FEATURE_OCI_OBJECT_STORAGE', 'EXCLUDE' );
  blog_install.setting_features_ins( 'G_MAX_AGE_FILE', 'BLOG_FEATURE_OCI_OBJECT_STORAGE', 'EXCLUDE' );
-- Insert BLOG_FEATURE_PARENTS
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_SEARCH_POSTS', 'BLOG_FEATURE_SEARCH' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_SEARCH_COMMENTS', 'BLOG_FEATURE_SEARCH' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_SEARCH_LINKS', 'BLOG_FEATURE_SEARCH' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_SEARCH_FILES', 'BLOG_FEATURE_SEARCH' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_CATEGORY_POST_COUNT', 'BLOG_FEATURE_CATEGORY' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_ARCHIVE_POST_COUNT', 'BLOG_FEATURE_ARCHIVE' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT', 'BLOG_FEATURE_TAG_CLOUD' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_SUBSCRIBE_COMMENTS', 'BLOG_FEATURE_ALLOW_COMMENTS' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_COMMENT_VERIFY', 'BLOG_FEATURE_ALLOW_COMMENTS' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_MODERATE_COMMENTS', 'BLOG_FEATURE_ALLOW_COMMENTS' );
  blog_install.feature_parents_ins( 1, 'BLOG_FEATURE_MODERATE_COMMENTS_AI', 'BLOG_FEATURE_MODERATE_COMMENTS' );
-- Insert BLOG_INIT_ITEMS
  blog_install.init_items_ins;
-- Insert patch version info to BLOG_SETTINGS
  blog_install.settings_ins( 10, 0, 'PATCH_20241125', 'STRING', 'INTERNAL','Patch 24.1.20241125' );
end;
/

