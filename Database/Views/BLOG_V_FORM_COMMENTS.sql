--------------------------------------------------------
--  DDL for View BLOG_V_FORM_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_form_comments as
select
  t1.id
  ,t1.row_version
  ,t1.is_active
  ,t1.post_id
  ,t1.parent_id
  ,(
    select lkp.title
    from blog_posts lkp
    where 1 = 1
      and lkp.id = t1.post_id
  )as post_title
  ,t1.body_html
  ,t1.comment_by
  ,case
    when (
      select count(1)
      from blog_comment_flags f11
      where f11.flag = 'MODERATE'
        and f11.comment_id = t1.id
    ) > 0
      then 'MODERATE'
    when t1.is_active = 1
      then 'ENABLED'
      else 'DISABLED'
  end as comment_status_code
from blog_comments t1
/
