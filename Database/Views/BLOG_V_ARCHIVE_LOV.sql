--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_LOV
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_LOV" ("YEAR_MONTH", "ARCHIVE_DATE", "POSTS_COUNT") AS
select t1.year_month              as year_month
  ,trunc( t1.published_on, 'MM' ) as archive_date
  ,count( t1.post_id )            as posts_count
from blog_v_posts t1
where 1 = 1
group by t1.year_month
  ,trunc( t1.published_on, 'MM' )
with read only
;
