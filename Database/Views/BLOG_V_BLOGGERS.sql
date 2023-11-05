--------------------------------------------------------
--  DDL for View BLOG_V_BLOGGERS
--------------------------------------------------------
create or replace force view blog_v_bloggers as
select t1.id        as blogger_id
  ,t1.display_seq   as display_seq
  ,t1.blogger_name  as blogger_name
  ,t1.blogger_desc  as blogger_desc
from blog_bloggers t1
where 1 = 1
and t1.show_desc = 1
with read only
/
