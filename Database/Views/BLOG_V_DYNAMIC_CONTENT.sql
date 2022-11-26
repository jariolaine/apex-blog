--------------------------------------------------------
--  DDL for View BLOG_V_DYNAMIC_CONTENT
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_DYNAMIC_CONTENT" ("CONTENT_ID", "CONTENT_TYPE", "CHANGED_ON", "DISPLAY_SEQ", "SHOW_CHANGED_ON", "CONTENT_DESC", "CONTENT_HTML", "CONTENT_URL") AS
  select
   t1.id              as content_id
  ,t1.content_type    as content_type
  ,t1.changed_on      as changed_on
  ,t1.display_seq     as display_seq
  ,t1.show_changed_on as show_changed_on
  ,t1.content_desc    as content_desc
  ,t1.content_html    as content_html
  ,blog_url.get_dynamic_page(
    p_content_id => t1.id
  )                   as content_url
from blog_dynamic_content t1
where 1 = 1
and t1.is_active = 1
with read only
/
