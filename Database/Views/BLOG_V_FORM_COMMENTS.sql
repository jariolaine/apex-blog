--------------------------------------------------------
--  DDL for View BLOG_V_FORM_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_form_comments as
select
  t1.id
, t1.row_version
, t1.is_active
, t1.post_id
, t1.parent_id
, t1.body_html
, t1.comment_by
, (
    select
      lkp.sentiment_json.documentSentiment
    from blog_comment_sentiments lkp
    where 1 = 1
      and lkp.comment_id = t1.id
  ) as sentiment
, (
    select lkp.title
    from blog_posts lkp
    where 1 = 1
      and lkp.id = t1.post_id
  ) as post_title
, (
    select
      lkp.comment_status_code
    from blog_v_all_comments lkp
    where 1 = 1
      and lkp.id = t1.id
  ) as comment_status_code
from blog_comments t1
/
