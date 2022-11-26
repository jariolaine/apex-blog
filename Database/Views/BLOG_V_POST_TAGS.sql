--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POST_TAGS" ("POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG", "CHANGED_ON", "TAG_URL") AS
  select
   t2.post_id     as post_id
  ,t2.tag_id      as tag_id
  ,t2.display_seq as display_seq
  ,t1.tag         as tag
  ,greatest(
     t1.changed_on
    ,t2.changed_on
  )               as changed_on
  ,blog_url.get_tag(
    p_tag_id => t1.id
  )               as tag_url
from blog_tags t1
join blog_post_tags t2 on t1.id = t2.tag_id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
with read only
/
