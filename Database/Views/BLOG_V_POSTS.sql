--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
create or replace force view blog_v_posts as
with q1 as(
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
    ,t1.published_on    as published_on
    ,t1.ctx_search      as ctx_search
    ,t1.changed_on      as changed_on
    ,t1.archive_year    as archive_year
    ,t3.display_seq     as category_seq
  from blog_posts t1
  join blog_bloggers t2
    on t1.blogger_id  = t2.id
  join blog_categories t3
    on t1.category_id = t3.id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
    and t3.is_active = 1
    and t1.published_on <= current_timestamp
)
select
   q1.post_id         as post_id
  ,q1.category_id     as category_id
  ,q1.blogger_id      as blogger_id
  ,q1.blogger_name    as blogger_name
  ,q1.post_title      as post_title
  ,q1.category_title  as category_title
  ,q1.post_desc       as post_desc
  ,q1.first_paragraph as first_paragraph
  ,q1.body_html       as body_html
  ,q1.published_on    as published_on
  ,q1.ctx_search      as ctx_search
  ,q1.changed_on      as changed_on
  ,q1.archive_year    as archive_year
  ,q1.category_seq    as category_seq
-- Generate post URL
  ,blog_url.get_post(
    p_post_id => q1.post_id
  )                   as post_url
-- Generate category URL
  ,blog_url.get_category(
    p_category_id => q1.category_id
  )                   as category_url
-- Aggregate tag HTML for post
  ,(
    select
      xmlserialize(
        content xmlagg( lkp_tag.tag_html1 order by lkp_tag.display_seq ) as varchar2(4000)
      ) as tags_html
    from blog_v_post_tags lkp_tag
    where 1 = 1
      and lkp_tag.post_id = q1.post_id
  )                   as tags_html1
  ,(
    select
      xmlserialize(
        content xmlagg( lkp_tag.tag_html2 order by lkp_tag.display_seq )
      ) as tags_html
    from blog_v_post_tags lkp_tag
    where 1 = 1
      and lkp_tag.post_id = q1.post_id
  )                   as tags_html2
-- Fetch next post id and title
  ,(
    select
      json_object(
         'post_id'    : lkp_next.post_id
        ,'post_title' : lkp_next.post_title
      ) as post
    from q1 lkp_next
    where 1 = 1
      and lkp_next.published_on > q1.published_on
    order by lkp_next.published_on asc
    fetch first 1 rows only
  )                   as next_post
-- Fetch previous post id and title
  ,(
    select
      json_object(
         'post_id'    : lkp_prev.post_id
        ,'post_title' : lkp_prev.post_title
      ) as post
    from q1 lkp_prev
    where 1 = 1
      and lkp_prev.published_on < q1.published_on
    order by lkp_prev.published_on desc
    fetch first 1 rows only
  )                   as prev_post
from q1
where 1 = 1
with read only
/
