--------------------------------------------------------
--  DDL for View BLOG_V_REP_POST_BY_STATUS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_REP_POST_BY_STATUS" ("APPLICATION_ID", "NUM_POSTS", "POST_STATUS") AS
  with apex_lov as(
  select v1.application_id
    ,v1.return_value
    ,v1.display_value
  from apex_application_lov_entries v1
  where 1 = 1
  and v1.list_of_values_name = 'POST_STATUS'
), blog_data as(
  select v1.post_status
    ,count(1) as num_posts
  from blog_v_all_posts v1
  where 1 = 1
  group by v1.post_status
)
select q2.application_id
  ,q1.num_posts
  ,case
    when q2.return_value is null
    then q1.post_status
    else q2.display_value
   end as post_status
from blog_data q1
join apex_lov q2 on q1.post_status = q2.return_value
with read only
/
