--------------------------------------------------------
--  DDL for View BLOG_V_INIT_ITEMS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_INIT_ITEMS" ("APPLICATION_ID", "ITEM_NAME", "ITEM_VALUE") AS
  select i.application_id as application_id
  ,i.item_name          as item_name
  ,s.attribute_value    as item_value
from blog_init_items i
join blog_settings s
  on i.item_name = s.attribute_name
;
