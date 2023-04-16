--------------------------------------------------------
--  DDL for View BLOG_V_ALL_CATEGORIES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_CATEGORIES" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "TITLE", "TITLE_UNIQUE", "NOTES", "CATEGORY_STATUS_TEXT", "POSTS_COUNT", "ALLOWED_ROW_OPERATION") AS
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.display_seq       as display_seq
  ,t1.title             as title
  ,t1.title_unique      as title_unique
  ,t1.notes             as notes
  ,(
    select lkp.display_value
    from blog_v_lov lkp
    where lkp.lov_name = 'IS_ACTIVE'
      and to_number( lkp.return_value ) = t1.is_active
  )                     as category_status_text
  ,(
    select count(1)
    from blog_posts lkp
    where lkp.category_id = t1.id
   )                    as posts_count
  ,case
    when exists(
      select 1
      from blog_posts lkp
      where lkp.category_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_categories t1
where 1 = 1
/
