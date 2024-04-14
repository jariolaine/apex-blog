--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINK_GROUPS
--------------------------------------------------------
create or replace force view blog_v_all_link_groups as
select
   t1.id                  as id
  ,t1.row_version         as row_version
  ,t1.created_on          as created_on
  ,lower( t1.created_by ) as created_by
  ,t1.changed_on          as changed_on
  ,lower (t1.changed_by ) as changed_by
  ,t1.is_active           as is_active
  ,t1.display_seq         as display_seq
  ,t1.title               as title
  ,t1.title_unique        as title_unique
  ,t1.notes               as notes
  ,(
    select
      count(1) as cnt
    from blog_links lkp
    where lkp.link_group_id = t1.id
  )                       as link_count
from blog_link_groups t1
where 1 = 1
/
