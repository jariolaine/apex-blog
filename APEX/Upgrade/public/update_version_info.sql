-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 23.1.0.20230611'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
