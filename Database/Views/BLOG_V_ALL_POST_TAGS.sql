--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POST_TAGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_ALL_POST_TAGS" ("POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG") AS 
  select t2.post_id  as post_id 
  ,t2.tag_id       as tag_id
  ,t2.display_seq  as display_seq
  ,t1.tag          as tag
from blog_tags t1
join blog_post_tags t2 on t1.id = t2.tag_id
where 1 = 1 WITH READ ONLY
;
