--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_LOV
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR_MONTH" ("ARCHIVE_YEAR_MONTH", "ARCHIVE_DATE", "POST_COUNT") AS
select t1.archive_year_month      as archive_year_month
  ,trunc( t1.published_on, 'MM' ) as archive_date
  ,count( t1.post_id )            as post_count
from blog_v_posts t1
where 1 = 1
group by t1.archive_year_month
  ,trunc( t1.published_on, 'MM' )
with read only
;
