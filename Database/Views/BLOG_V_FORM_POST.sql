--------------------------------------------------------
--  DDL for View BLOG_V_FORM_POST
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_FORM_POST" ("ID", "BLOGGER_ID", "CATEGORY_ID", "FIRST_PARAGRAPH", "IS_ACTIVE", "POST_DESC", "CATEGORY_TITLE", "TAGS", "PUBLISHED_ON", "TITLE", "BODY_HTML", "NOTES") AS
select
  t1.id               as id
  ,t1.blogger_id      as blogger_id
  ,t1.category_id     as category_id
  ,t1.first_paragraph as first_paragraph
  ,t1.is_active       as is_active
  ,t1.post_desc       as post_desc
  ,(
    select lkp.title
    from blog_categories lkp
    where 1 = 1
      and lkp.id = t1.category_id
  )                   as category_title
  ,(
    select
      listagg( lkp.tag, ',' )
        within group( order by lkp.display_seq )
    from blog_v_all_post_tags lkp
    where 1 = 1
      and lkp.post_id = t1.id
  )                   as tags
  ,t1.published_on    as published_on
  ,t1.title           as title
  ,t1.body_html       as body_html
  ,t1.notes           as notes
from blog_posts t1
where 1 = 1
/
