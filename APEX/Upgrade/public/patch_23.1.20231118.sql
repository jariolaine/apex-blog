--  Patch 23.1.20231118
--------------------------------------------------------
--  Insert metadata
--------------------------------------------------------
insert into blog_features (is_active, display_seq, build_option_name, build_option_group)
  values ('1', '440', 'BLOG_FEATURE_ATOM', 'BLOG_FEATURE_GROUP_MISC');
--------------------------------------------------------
--  Drop obsolete type
--------------------------------------------------------
drop type blog_t_post;