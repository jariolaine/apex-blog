--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('30','0','G_ADMIN_APP_ID','STRING','INTERNAL',null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));
