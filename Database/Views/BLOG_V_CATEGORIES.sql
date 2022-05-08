--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_CATEGORIES" ("CATEGORY_ID", "CATEGORY_TITLE", "DISPLAY_SEQ", "POSTS_COUNT", "CHANGED_ON") AS
  select
   v1.category_id     as category_id
  ,v1.category_title  as category_title
  ,v1.category_seq    as display_seq
  ,count(v1.post_id)  as posts_count
  ,max(
    greatest(
       v1.published_on
      ,v1.changed_on
      ,v1.category_changed_on
    )
  )                   as changed_on
from blog_v_posts v1
where 1 = 1
group by v1.category_id
  ,v1.category_title
  ,v1.category_seq
with read only
/
