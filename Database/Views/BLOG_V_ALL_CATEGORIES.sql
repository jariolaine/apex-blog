--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_ALL_CATEGORIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_ALL_CATEGORIES" ("CATEGORY_ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "CATEGORY_TITLE", "TITLE_UNIQUE", "POSTS_COUNT", "ALLOWED_ROW_OPERATION") AS 
  select 
   t1.id            as category_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_active     as is_active
  ,t1.display_seq   as display_seq
  ,t1.title         as category_title
  ,t1.title_unique  as title_unique
  ,(
    select count(l1.id) 
    from blog_posts l1 
    where 1 = 1
    and l1.category_id = t1.id
   )                as posts_count
  ,case 
    when exists(
      select 1
      from blog_posts l2
      where 1 = 1
      and l2.category_id = t1.id
    )  
    then 'U'
    else 'UD'
  end as allowed_row_operation
from blog_categories t1
with read only

;
