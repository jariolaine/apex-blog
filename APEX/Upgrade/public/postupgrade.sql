-- Postupgrade
--------------------------------------------------------
-- Update version info
--------------------------------------------------------
update blog_settings
  set attribute_value = 'Release 24.1.0.20240714'
where 1 = 1
  and attribute_name = 'G_APP_VERSION'
;
--------------------------------------------------------
-- Update text messages
--------------------------------------------------------
begin
  blog_cm.update_text_messages;
end;
/
