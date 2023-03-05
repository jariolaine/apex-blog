-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 22.2.2.20230305'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
