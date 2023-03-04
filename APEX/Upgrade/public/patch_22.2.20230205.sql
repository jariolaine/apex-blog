--  Patch 22.2.20230205
--------------------------------------------------------
--  Drop trigger BLOG_POST_UDS_POSTS_TRG
--------------------------------------------------------
drop trigger blog_post_uds_posts_trg;
--------------------------------------------------------
--  Drop table BLOG_POST_UDS
--------------------------------------------------------
drop table blog_post_uds;
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20230205','STRING','INTERNAL','Patch 22.2.20230205')
;
