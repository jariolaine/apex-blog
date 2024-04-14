--------------------------------------------------------
--  DDL for View BLOG_V_INIT_ITEMS
--------------------------------------------------------
create or replace force view blog_v_init_items as
select
  i.application_id  as application_id
, i.item_name       as item_name
, s.attribute_value as attribute_value
, v( i.item_name )  as session_value
from blog_init_items i
join blog_settings s
  on i.item_name = s.attribute_name
where 1 = 1
and i.is_active = 1
with read only
/
