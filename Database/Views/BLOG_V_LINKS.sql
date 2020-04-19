--------------------------------------------------------
--  DDL for View BLOG_V_LINKS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_LINKS" ("LINK_ID", "GROUP_ID", "GROUP_TITLE", "GROUP_DISPLAY_SEQ", "DISPLAY_SEQ", "LINK_TITLE", "LINK_DESC", "LINK_URL") AS
  select t1.id        as link_id
  ,t2.id              as group_id
  ,t2.title           as group_title
  ,t2.display_seq     as group_display_seq
  ,t1.display_seq     as display_seq
  ,t1.title           as link_title
  ,t1.link_desc       as link_desc
  ,t1.link_url        as link_url
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
and t1.is_active * t2.is_active > 0
with read only
;
