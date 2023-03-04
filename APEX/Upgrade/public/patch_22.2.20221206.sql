--  Patch 22.2.20221206
--------------------------------------------------------
--  Insert to BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items ( is_active, application_id, item_name )
  values( 1, apex_application_install.get_application_id, 'G_LATEST_POST_ROWS' );
--------------------------------------------------------
--  Modify table BLOG_LINKS
--------------------------------------------------------
alter table blog_links add external_link number(1,0);
alter table blog_links add target_blank number(1,0);
update blog_links set external_link = 0;
update blog_links set target_blank = 0;
alter table blog_links add constraint blog_links_ck4 check( external_link in( 0, 1 ) );
alter table blog_links add constraint blog_links_ck5 check( target_blank in( 0, 1 ) );
alter table blog_links modify external_link not null;
alter table blog_links modify target_blank not null;
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20221206','STRING','INTERNAL','Patch 22.2.20221206')
;
