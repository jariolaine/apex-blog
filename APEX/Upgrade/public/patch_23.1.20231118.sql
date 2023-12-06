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
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20231118','STRING','INTERNAL','Patch 23.1.20231118')
;