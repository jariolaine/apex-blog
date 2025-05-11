begin
-- Inserting into BLOG_SETTINGS
blog_install.settings_ins(30,0,'G_ADMIN_APP_ID','STRING','INTERNAL',blog_util.int_to_vc2(apex_application_install.get_application_id),null,null);
end;
/
