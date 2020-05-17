--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value) values ('30','0','G_PUB_APP_ID','STRING','INTERNAL',to_char(apex_application_install.get_application_id, blog_util.g_number_format));

--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items
select ai.application_id  as application_id
  ,ai.item_name           as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
and ai.application_id = apex_application_install.get_application_id

  union all

select pi.application_id  as application_id
  ,pi.item_name           as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
and pi.application_id = apex_application_install.get_application_id
;
