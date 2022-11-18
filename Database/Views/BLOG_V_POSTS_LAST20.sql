--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST20
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_LAST20" ("DISPLAY_SEQ", "POST_ID", "PUBLISHED_ON", "BLOGGER_NAME", "POST_TITLE", "POST_DESC", "CATEGORY_TITLE", "POST_URL") AS
  select
   v1.rn              as display_seq
  ,v1.post_id         as post_id
  ,v1.published_on    as published_on
  ,v1.blogger_name    as blogger_name
  ,v1.post_title      as post_title
  ,v1.post_desc       as post_desc
  ,v1.category_title  as category_title
  ,v1.post_url        as post_url
from blog_v_posts v1
where 1 = 1
and v1.rn <= 20
with read only
/
