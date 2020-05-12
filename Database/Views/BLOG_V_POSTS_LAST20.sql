--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST20
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_LAST20" ("DISPLAY_SEQ", "POST_ID", "PUBLISHED_ON", "BLOGGER_NAME", "POST_TITLE", "POST_DESC", "CATEGORY_TITLE") AS
  with qry as (
  select
     row_number() over ( order by t1.published_on desc ) as rn
    ,t1.post_id
    ,t1.post_title
    ,t1.post_desc
    ,t1.blogger_name
    ,t1.category_title
    ,t1.published_on
  from blog_v_posts t1
)
select qry.rn         as display_seq
  ,qry.post_id        as post_id
  ,qry.published_on   as published_on
  ,qry.blogger_name   as blogger_name
  ,qry.post_title     as post_title
  ,qry.post_desc      as post_desc
  ,qry.category_title as category_title
from qry
where 1 = 1
and qry.rn <= 20
with read only
/
