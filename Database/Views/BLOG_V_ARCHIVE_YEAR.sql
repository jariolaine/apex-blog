--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR" ("ARCHIVE_YEAR", "POST_COUNT", "CHANGED_ON", "ARCHIVE_URL") AS
select
   v1.archive_year      as archive_year
  ,count( v1.post_id )  as post_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_archive(
    p_archive_id => v1.archive_year
  )                     as archive_url
from blog_v_posts v1
where 1 = 1
group by v1.archive_year
with read only
/
