--------------------------------------------------------
--  DDL for View BLOG_V_LINK_GROUPS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_LINK_GROUPS" ( "GROUP_ID", "GROUP_TITLE", "GROUP_DISPLAY_SEQ") AS
  select t1.id        as group_id
  ,t1.title           as group_title
  ,t1.display_seq     as group_display_seq
from blog_link_groups t1
where 1 = 1
and t1.is_active = 1
and exists(
  select 1
  from blog_links x1
  where 1 = 1
  and x1.is_active = 1
  and x1.link_group_id = t1.id
)
with read only
;
