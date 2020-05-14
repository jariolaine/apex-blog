--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_TAGS" ("TAG_ID", "TAG") AS
  select t1.id  as tag_id
  ,t1.tag     as tag
from blog_tags t1
where 1 = 1
and t1.is_active = 1
with read only
/
