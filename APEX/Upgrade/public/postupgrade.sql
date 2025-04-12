-- Postupgrade
--------------------------------------------------------
-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 24.1.7.20250412'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
