--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_TAGS
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_TAGS"
AS
select t1.id    as tag_id
  ,t1.row_version as row_version
  ,t1.created_on  as created_on
  ,t1.created_by  as created_by
  ,t1.changed_on  as changed_on
  ,t1.changed_by  as changed_by
  ,t1.tag         as tag
  ,t1.is_active   as is_active
  ,(
    select count(l1.id)
    from blog_post_tags l1
    where 1 = 1
    and l1.tag_id = t1.id
   )                as posts_count
  ,case
    when exists(
      select 1
      from blog_post_tags l2
      where 1 = 1
      and l2.tag_id = t1.id
    )
    then 'U'
    else 'UD'
  end as allowed_row_operation
from blog_tags t1
where 1 = 1
with read only
;
