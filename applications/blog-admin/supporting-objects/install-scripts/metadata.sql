begin
-- Inserting into BLOG_SETTINGS
blog_install.settings_merge('G_ADMIN_APP_ID',30,0,'STRING','INTERNAL',null,null,null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));
end;
/
