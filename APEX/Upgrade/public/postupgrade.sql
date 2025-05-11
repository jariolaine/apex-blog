-- Postupgrade
-- Update version info
update blog_settings
  set attribute_value = 'Release 24.2.0.20250511'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
