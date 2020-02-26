--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINK_GROUPS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_LINK_GROUPS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "TITLE", "NOTES", "TITLE_UNIQUE", "LINK_COUNT") AS 
  select t1.id
  ,t1.row_version
  ,t1.created_on
  ,t1.created_by
  ,t1.changed_on
  ,t1.changed_by
  ,t1.is_active
  ,t1.display_seq
  ,t1.title
  ,t1.notes
  ,t1.title_unique
  ,(
    select count(l1.id) 
    from blog_links l1 
    where 1 = 1
    and l1.link_group_id = t1.id
   ) as link_count
from blog_link_groups t1
where 1 = 1
with read only
;
