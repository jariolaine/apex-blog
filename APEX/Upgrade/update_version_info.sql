--------------------------------------------------------
--  Update application version
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 22.1.2.20220730'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
