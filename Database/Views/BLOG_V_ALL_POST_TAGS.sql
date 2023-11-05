--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POST_TAGS
--------------------------------------------------------
create or replace force view blog_v_all_post_tags as
select
   t1.id                        as id
  ,t1.row_version               as row_version
  ,t1.created_on                as created_on
  ,lower(t1.created_by)         as created_by
  ,t1.changed_on                as changed_on
  ,lower(t1.changed_by)         as changed_by
  ,t1.is_active                 as is_active
  ,t1.post_id                   as post_id
  ,t1.tag_id                    as tag_id
  ,t1.display_seq               as display_seq
  ,(
    select lkp.tag
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag
  ,(
    select lkp.is_active
    from blog_tags lkp
    where 1 = 1
    and lkp.id = t1.tag_id
  )                             as tag_is_active
from blog_post_tags t1
where 1 = 1
/
