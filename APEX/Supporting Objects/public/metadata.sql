--------------------------------------------------------
--  Update BLOG_SETTINGS
--------------------------------------------------------
update blog_settings
  set attribute_value = to_char(apex_application_install.get_application_id, 'fm99999999999999999999999999999999999999')
  where 1 = 1
  and attribute_name = 'G_PUB_APP_ID'
;

--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items(is_active, application_id, item_name)
select 1 as is_active
  ,ai.application_id  as application_id
  ,ai.item_name           as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
and ai.application_id = apex_application_install.get_application_id
  union all
select 1 as is_active
  ,pi.application_id  as application_id
  ,pi.item_name           as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
and pi.application_id = apex_application_install.get_application_id
;
