--------------------------------------------------------
--  DDL for Materialized View BLOG_ITEMS_INIT
--------------------------------------------------------
create materialized view blog_items_init
on prebuilt table
with reduced precision
as
with apps as (
  select t1.application_id
    ,t1.substitution_string as item_name
    ,to_char( t1.application_id ) as item_value
  from apex_application_substitutions t1
  where 1 = 1
  and t1.substitution_string in( 'G_PUB_APP_ID', 'G_ADMIN_APP_ID' )
  and t1.substitution_value = 'YES'
  and exists(
    select 1
    from apex_applications x1
    where 1 = 1
    and x1.application_id = t1.application_id
    and x1.owner = sys_context('USERENV', 'CURRENT_SCHEMA')
    and x1.application_group = blog_util.get_attribute_value( 'APP_GROUP' )
  )
), items as (
  select ai.application_id
    ,ai.item_name
  from apex_application_items ai
  where 1 = 1
  and exists(
    select 1
    from apps
    where 1 = 1
    and apps.application_id = ai.application_id
  )
  union all
   select pi.application_id
    ,pi.item_name
  from apex_application_page_items pi
  where 1 = 1
  and exists(
    select 1
    from apps
    where 1 = 1
    and apps.application_id = pi.application_id
  )
)
select i.application_id   as application_id
  ,i.item_name            as item_name
  ,s.attribute_value      as item_value
from items i
join blog_settings s
  on i.item_name = s.attribute_name
where 1 = 1
and s.attribute_value is not null
union all
select items.application_id
  ,apps.item_name
  ,cast( apps.item_value as varchar2( 4000 char ) ) as item_value
from apps
join items on apps.item_name = items.item_name
where 1 = 1
/
begin
  dbms_mview.refresh('BLOG_ITEMS_INIT', 'C');
end;
/
