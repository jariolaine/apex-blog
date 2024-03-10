--------------------------------------------------------
--  DDL for View BLOG_V_ALL_COMMENTS_FORM
--------------------------------------------------------
create or replace force view blog_v_all_comments_form as
select
  t1.id
  ,t1.row_version
  ,t1.created_on
  ,t1.created_by
  ,t1.changed_on
  ,t1.changed_by
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
  ,t1.ctx_search
  ,t1.rowid as ctx_rid
  ,apex_escape.striphtml(
    p_string => t1.body_html
  ) as ctx_search_text
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
  ,case
    when (
      select count(1)
      from blog_comment_flags f12
      where f12.flag = 'NEW'
        and f12.comment_id = t1.id
    ) > 0
      then 'NEW'
    when (
      select count(1)
      from blog_comment_flags f13
      where f13.flag = 'UNREAD'
        and f13.comment_id = t1.id
    ) > 0
      then 'UNREAD'
    when t1.parent_id is not null
      then 'REPLY'
      else 'READ'
  end as comment_flag_code
from blog_comments t1
/
