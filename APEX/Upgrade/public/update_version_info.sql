-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 23.1.2.20230826'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
