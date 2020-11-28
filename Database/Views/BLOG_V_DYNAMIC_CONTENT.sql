--------------------------------------------------------
--  DDL for View BLOG_V_DYNAMIC_CONTENT
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_DYNAMIC_CONTENT" ("CONTENT_STATIC_ID", "CHANGED_ON", "DISPLAY_SEQ", "CONTENT_DESC", "CONTENT_HTML", "CONTENT_TYPE") AS
  select t1.content_static_id
  ,t1.changed_on
  ,t1.display_seq
  ,t1.content_desc
  ,t1.content_html
  ,t1.content_type
from blog_dynamic_content t1
where 1 = 1
and t1.is_active = 1
;
