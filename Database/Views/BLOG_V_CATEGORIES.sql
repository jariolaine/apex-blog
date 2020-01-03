--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_CATEGORIES" ("CATEGORY_ID", "CREATED_ON", "CATEGORY_TITLE", "DISPLAY_SEQ") AS 
  select 
   t1.id            as category_id
  ,t1.created_on    as created_on
  ,t1.title         as category_title
  ,t1.display_seq   as display_seq
from blog_categories t1
where 1 = 1
and t1.is_active = 1
and exists (
  select 1
  from blog_posts x1
  where 1 = 1
  and x1.is_active  = 1
  and x1.valid_from  <= localtimestamp
  and x1.category_id  = t1.id
)
with read only
;
