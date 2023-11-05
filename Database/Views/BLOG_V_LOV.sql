--------------------------------------------------------
--  DDL for View BLOG_V_LOV
--------------------------------------------------------
create or replace force view blog_v_lov as
select
   t1.lov_name                              as lov_name
  ,t1.display_seq                           as display_seq
  ,t1.return_value                          as return_value
  ,t1.display_message                       as display_message
  ,apex_lang.message( t1.display_message )  as display_value
from blog_list_of_values t1
where 1 = 1
and t1.is_active = 1
with read only
/
