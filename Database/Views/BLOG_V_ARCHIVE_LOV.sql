--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_LOV
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_LOV"
AS
select t1.year_month
  ,count( t1.post_id ) as posts_count
from blog_v_posts t1
where 1 = 1
group by t1.year_month
with read only
;
