--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR" ("ARCHIVE_YEAR", "POST_COUNT") AS
select t1.archive_year  as archive_year
  ,count( t1.post_id )  as post_count
from blog_v_posts t1
where 1 = 1
group by t1.archive_year
with read only
/
