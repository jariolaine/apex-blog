--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS"
AS
select
   t1.id              as post_id
  ,t3.id              as category_id
  ,t2.id              as blogger_id
  ,t2.blogger_name    as blogger_name
  ,t1.title           as post_title
  ,t3.title           as category_title
  ,t1.post_desc       as post_desc
  ,t1.first_paragraph as first_paragraph
  ,t1.body_html       as body_html
  ,t1.created_on      as created_on
  ,t1.year_month      as year_month
  ,(
    select count( l1.id )
    from blog_comments l1
    where 1 = 1
    and l1.is_active = 1
    and l1.post_id  = t1.id
  ) as comments_count
  ,(
    select
      apex_lang.lang(
        'Continue reading'
      )
    from dual
  ) as read_more_txt
  ,(
    select
      apex_lang.lang(
        'Posted on'
      )
    from dual
  ) as posted_on_txt
  ,(
    select
      apex_lang.lang(
        'Posted by'
      )
    from dual
  ) as posted_by_txt
  ,(
    select
      apex_lang.lang(
        'Category'
      )
    from dual
  ) as category_txt
  ,(
    select
      apex_lang.lang(
        'Tags'
      )
    from dual
  ) as tags_txt
from blog_posts       t1
join blog_bloggers    t2 on t1.blogger_id  = t2.id
join blog_categories  t3 on t1.category_id = t3.id
where 1 = 1
and t1.valid_from <= localtimestamp
and t1.is_active * t2.is_active * t3.is_active > 0
with read only
;
