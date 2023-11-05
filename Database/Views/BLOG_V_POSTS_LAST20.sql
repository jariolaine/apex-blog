--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST20
--------------------------------------------------------
create or replace force view blog_v_posts_last20 as
select
   rownum             as display_seq
  ,q1.post_id         as post_id
  ,q1.published_on    as published_on
  ,q1.blogger_name    as blogger_name
  ,q1.post_title      as post_title
  ,q1.post_desc       as post_desc
  ,q1.category_title  as category_title
  ,q1.post_url        as post_url
  ,apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => q1.post_id
  )                   as list_attr
from (
  select --+ first_rows(20)
     v1.post_id
    ,v1.published_on
    ,v1.blogger_name
    ,v1.post_title
    ,v1.post_desc
    ,v1.category_title
    ,v1.post_url
  from blog_v_posts v1
  order by v1.published_on desc
) q1
where 1 = 1
  and rownum <= 20
with read only
/
