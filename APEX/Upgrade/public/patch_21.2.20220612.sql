--  Patch 21.2.20220612
--------------------------------------------------------
-- Drop obsolete columns
--------------------------------------------------------
alter table blog_features drop column help_message;
alter table blog_settings drop column post_expression;
alter table blog_list_of_values drop column notes;
alter table blog_subscribers_email drop column notes;
-------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20220612','STRING','INTERNAL','Patch 21.2.20220612')
;
