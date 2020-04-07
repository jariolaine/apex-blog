--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POSTS" ("ID", "CATEGORY_ID", "BLOGGER_ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "BLOGGER_NAME", "CATEGORY_TITLE", "TITLE", "POST_DESC", "BODY_HTML", "BODY_LENGTH", "PUBLISHED_ON", "YEAR_MONTH", "NOTES", "POST_TAGS", "COMMENTS_COUNT", "POST_STATUS") AS 
  select
   t1.id            as id
  ,t1.category_id   as category_id
  ,t1.blogger_id    as blogger_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t3.blogger_name  as blogger_name
  ,t2.title         as category_title
  ,t1.title         as title
  ,t1.post_desc     as post_desc
  ,t1.body_html     as body_html
  ,t1.body_length   as body_length
  ,t1.published_on  as published_on
  ,t1.year_month    as year_month
  ,t1.notes         as notes
  ,(
    select listagg(tags.tag, ', ')  within group(order by tags.display_seq) as tags
    from blog_v_all_posts_tags tags
    where 1 = 1
    and tags.post_id = t1.id
  ) as post_tags
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
  ) as comments_count
  ,case 
    when t3.is_active = 0
    then 'BLOGGER_DISABLED'
    when t2.is_active = 0
    then 'CATEGORY_DISABLED'
    when t1.is_active = 0
    then 'DRAFT'
    when t1.published_on > localtimestamp
    then 'SCHEDULED'
    else 'PUBLISHED'
   end as post_status 
from blog_posts t1
join blog_categories t2 on t1.category_id = t2.id
join blog_bloggers t3 on t1.blogger_id = t3.id
where 1 = 1 
with read only
;
