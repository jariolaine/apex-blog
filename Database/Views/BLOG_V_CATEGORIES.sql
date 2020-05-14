--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
<<<<<<< HEAD

  CREATE OR REPLACE FORCE VIEW "BLOG_V_CATEGORIES" ("CATEGORY_ID", "CREATED_ON", "CATEGORY_TITLE", "DISPLAY_SEQ", "CATEGORY_URL", "POSTS_COUNT") AS
=======
CREATE OR REPLACE FORCE VIEW "BLOG_V_CATEGORIES" ("CATEGORY_ID", "CREATED_ON", "CATEGORY_TITLE", "DISPLAY_SEQ", "POSTS_COUNT") AS
>>>>>>> Development
  select
   t1.id            as category_id
  ,t1.created_on    as created_on
  ,t1.title         as category_title
  ,t1.display_seq   as display_seq
  ,blog_url.get_category(
     p_category_id => t1.id
   )                as category_url
  ,(
<<<<<<< HEAD
    select count(l1.id)
    from blog_posts l1
=======
    select count(1)
    from blog_v_posts l1
>>>>>>> Development
    where 1 = 1
    and l1.category_id = t1.id
   )                as posts_count
from blog_categories t1
where 1 = 1
and t1.is_active = 1
and exists (
  select 1
  from blog_v_posts x1
  where 1 = 1
  and x1.category_id  = t1.id
)
with read only
/
