--------------------------------------------------------
--  DDL for View BLOG_V_ALL_DYNAMIC_CONTENT
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_DYNAMIC_CONTENT" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "CONTENT_TYPE", "DISPLAY_SEQ", "SHOW_CHANGED_ON", "CONTENT_DESC", "CONTENT_HTML") AS
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.content_type      as content_type
  ,t1.display_seq       as display_seq
  ,t1.show_changed_on   as show_changed_on
  ,t1.content_desc      as content_desc
  ,t1.content_html      as content_html
from blog_dynamic_content t1
where 1 = 1
/
