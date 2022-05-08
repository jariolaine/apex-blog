--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR" ("ARCHIVE_YEAR", "POST_COUNT", "CHANGED_ON") AS
select
   v1.archive_year      as archive_year
  ,count( v1.post_id )  as post_count
  ,max(
    greatest(
       v1.published_on
      ,v1.changed_on
      ,v1.category_changed_on
    )
  )                     as changed_on
from blog_v_posts v1
where 1 = 1
group by v1.archive_year
with read only
/
