--------------------------------------------------------
--  Update application version
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 21.2.20220424'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
