--  Postupgrade
-- Update application version info
update blog_settings
  set attribute_value = 'Release 26.1.6.20261119'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
