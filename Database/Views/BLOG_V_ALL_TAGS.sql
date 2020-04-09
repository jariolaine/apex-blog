--------------------------------------------------------
--  DDL for View BLOG_V_ALL_TAGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_TAGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "TAG", "TAG_UNIQUE", "NOTES", "POSTS_COUNT", "ALLOWED_ROW_OPERATION") AS 
  select t1.id      as id
  ,t1.row_version as row_version
  ,t1.created_on  as created_on
  ,t1.created_by  as created_by
  ,t1.changed_on  as changed_on
  ,t1.changed_by  as changed_by
  ,t1.is_active   as is_active
  ,t1.tag         as tag
  ,t1.tag_unique  as tag_unique
  ,t1.notes       as notes
  ,(
    select count(l1.id) 
    from blog_posts_tags l1 
    where 1 = 1
    and l1.tag_id = t1.id
   )                as posts_count
  ,case
    when exists(
      select 1
      from blog_posts_tags l2
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
