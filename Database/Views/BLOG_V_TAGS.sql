--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_TAGS" ("TAG_ID", "TAG", "POSTS_COUNT", "CHANGED_ON") AS
  select
   t1.id                as tag_id
  ,t1.tag               as tag
  ,count(v1.post_id)    as posts_count
  ,max(
    greatest(
       t1.changed_on
      ,t2.changed_on
      ,v1.published_on
      ,v1.changed_on
      ,v1.category_changed_on
    )
  )                     as changed_on
from blog_tags t1
join blog_post_tags t2 on t1.id = t2.tag_id
join blog_v_posts   v1 on t2.post_id = v1.post_id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
group by t1.id
  ,t1.tag
with read only
/
