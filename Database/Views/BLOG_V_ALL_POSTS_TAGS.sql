--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS_TAGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POSTS_TAGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG") DEFAULT COLLATION "USING_NLS_COMP" AS
  select 
   t2.id                        as id
  ,t2.row_version               as row_version
  ,t2.created_on                as created_on
  ,lower(t2.created_by)         as created_by
  ,t2.changed_on                as changed_on
  ,lower(t2.changed_by)         as changed_by
  ,t1.is_active * t2.is_active  as is_active
  ,t2.post_id                   as post_id 
  ,t2.tag_id                    as tag_id
  ,t2.display_seq               as display_seq
  ,t1.tag                       as tag
from blog_tags t1
join blog_posts_tags t2 on t1.id = t2.tag_id
where 1 = 1 
;
