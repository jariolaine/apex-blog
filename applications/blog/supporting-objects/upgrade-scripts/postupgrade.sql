--  Postupgrade
-- Update version info
update blog_settings
  set attribute_value = 'Release 26.1.5.20261003'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
