--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_ITEN_INIT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_ITEN_INIT" ("APPLICATION_ID", "ITEM_NAME", "ITEM_VALUE") AS 
  with item as (
  select a.application_id
    ,a.item_name
  from apex_application_items a
  where 1 = 1
  union all
   select b.application_id
    ,b.item_name
  from apex_application_page_items b
  where 1 = 1
)
, apps as (
  select
    case t1.application_name
      when 'Blog Public Pages'
      then 'G_PUB_APP_ID'
      when 'Blog Administration'
      then 'G_ADMIN_APP_ID'
    end                           as item_name
    ,to_char( t1.application_id ) as item_value
  from apex_applications t1
  where 1 = 1
  and t1.application_group = blog_util.get_param_value( 'APP_GROUP' )
)
select i.application_id   as application_id
  ,i.item_name            as item_name
  ,p.param_value          as item_value
from item i
join blog_settings p
  on i.item_name = p.param_name
where 1 = 1
and p.param_value is not null

union all

select i.application_id
  ,p.item_name
  ,p.item_value
from item i
join apps p
  on i.item_name = p.item_name
where 1 = 1
with read only
;
