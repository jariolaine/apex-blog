--  Patch 22.2.20221124
--------------------------------------------------------
-- Insert to BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items( is_active, application_id, item_name )
  values( 1, apex_application_install.get_application_id, 'G_LATEST_POST_ROWS' );
--------------------------------------------------------
--  Rebuild post text index because changes on package BLOG_CTX
--------------------------------------------------------
alter index blog_post_uds_ctx rebuild;
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20221124','STRING','INTERNAL','Patch 22.2.20221124')
;
