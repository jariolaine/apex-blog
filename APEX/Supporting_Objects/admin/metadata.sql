--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,install_value,attribute_value) values ('10','1','G_ADMIN_APP_ID','STRING','INTERNAL',null,null,null,null,'blog_util.int_to_vc2(apex_application_install.get_application_id)',blog_util.int_to_vc2(apex_application_install.get_application_id));

