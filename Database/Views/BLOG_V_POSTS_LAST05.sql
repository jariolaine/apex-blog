--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST05
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_LAST05" ("POST_ID", "DISPLAY_SEQ", "POST_TITLE", "POST_URL") AS 
  select v1.post_id                               as post_id
  ,v1.display_seq                               as display_seq
  ,apex_escape.html( v1.post_title )            as post_title
  ,blog_url.get_post( p_post_id => v1.post_id ) as post_url
from blog_v_posts_last20 v1
where 1 = 1
and v1.display_seq <= 5
with read only
;
