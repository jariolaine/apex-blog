-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 22.2.0.20221123'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
