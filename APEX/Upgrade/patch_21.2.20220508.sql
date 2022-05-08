--  Patch 21.2.20220508
--------------------------------------------------------
--  Update metadata
--------------------------------------------------------
update blog_features
  set display_seq = 290
where build_option_name = 'BLOG_FEATURE_RSS'
;
--------------------------------------------------------
--  Insert metadata
--------------------------------------------------------
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,help_message)
  values(1,270,'BLOG_FEATURE_TAG_CLOUD','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_HELP_FEATURE_TAG_CLOUD');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message)
  values(1,280,'BLOG_FEATURE_TAG_CLOUD_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_TAG_CLOUD','BLOG_HELP_FEATURE_TAG_CLOUD_POST_COUNT');
--------------------------------------------------------
--  Drop index BLOG_POST_UDS_CTX
--------------------------------------------------------
-- Index is recreated after packages and views are recreated
drop index blog_post_uds_ctx force;
-- Drop text index section groups
begin
  ctx_ddl.drop_section_group( 'BLOG_POST_UDS_SG' );
end;
/
-------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20220508','STRING','INTERNAL','Patch 21.2.20220508')
;
