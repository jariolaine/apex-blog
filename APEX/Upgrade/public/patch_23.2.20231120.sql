--  Patch 23.2.20231120
--------------------------------------------------------
--  Insert and update metadata
--------------------------------------------------------
update blog_features set display_seq = '180' where build_option_name = 'BLOG_FEATURE_SEARCH_FILES';
update blog_features set display_seq = '170' where build_option_name = 'BLOG_FEATURE_SEARCH_LINKS';
insert into blog_features (is_active, display_seq, build_option_name, build_option_group, build_option_parent)
  VALUES ('1', '160', 'BLOG_FEATURE_SEARCH_COMMENTS', 'BLOG_FEATURE_GROUP_PAGE', 'BLOG_FEATURE_SEARCH');