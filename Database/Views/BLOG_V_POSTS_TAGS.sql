--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_TAGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_TAGS" ("POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG") AS 
  select t2.post_id  as post_id 
  ,t2.tag_id       as tag_id
  ,t2.display_seq  as display_seq
  ,t1.tag          as tag
from blog_tags t1
join blog_posts_tags t2 on t1.id = t2.tag_id
where 1 = 1
and t1.is_active * t2.is_active > 0
with read only
;
