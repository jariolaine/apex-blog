--  Postupgrade
-- Update version info
update blog_settings
  set attribute_value = 'Release 24.2.11.20260126'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
