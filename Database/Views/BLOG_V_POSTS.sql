--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS" ("POST_ID", "CATEGORY_ID", "BLOGGER_ID", "BLOGGER_NAME", "POST_TITLE", "CATEGORY_TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "PUBLISHED_ON", "CHANGED_ON", "ARCHIVE_YEAR", "CATEGORY_SEQ", "POST_URL", "TAGS_HTML1", "TAGS_HTML2", "TXT_POSTED_BY", "TXT_POSTED_ON", "TXT_CATEGORY", "TXT_READ_MORE", "TXT_TAGS", "NEXT_POST", "PREV_POST") AS
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
    ,greatest(
       t1.published_on
      ,t1.changed_on
    )                   as changed_on
    ,t1.archive_year    as archive_year
    ,t3.display_seq     as category_seq
  -- Generate post URL
    ,blog_url.get_post(
      p_post_id => t1.id
    )                   as post_url
  -- Aggregate tag HTML for post
    ,(
      select
        xmlserialize(
          content xmlagg( lkp_tag.tag_html1 order by lkp_tag.display_seq )
        ) as tags_html
      from blog_v_post_tags lkp_tag
      where 1 = 1
        and lkp_tag.post_id = t1.id
    )                   as tags_html1
    ,(
      select
        xmlserialize(
          content xmlagg( lkp_tag.tag_html2 order by lkp_tag.display_seq )
        ) as tags_html
      from blog_v_post_tags lkp_tag
      where 1 = 1
        and lkp_tag.post_id = t1.id
    )                   as tags_html2
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
  ,q1.changed_on      as changed_on
  ,q1.archive_year    as archive_year
  ,q1.category_seq    as category_seq
  ,q1.post_url        as post_url
  ,q1.tags_html1      as tags_html1
  ,q1.tags_html2      as tags_html2
-- text, label etc. for APEX reports
  ,txt.posted_by      as txt_posted_by
  ,txt.posted_on      as txt_posted_on
  ,txt.category       as txt_category
  ,txt.read_more      as txt_read_more
  ,case
    when q1.tags_html1 is not null
    then txt.tags
  end                 as txt_tags
-- Fetch next post id and title
  ,(
    select
      blog_t_post(
         lkp_post.post_id
        ,lkp_post.post_title
      ) as post
    from q1 lkp_post
    where 1 = 1
      and lkp_post.published_on >= q1.published_on
      and lkp_post.post_id != q1.post_id
    order by lkp_post.published_on asc, lkp_post.post_id asc
    fetch first 1 rows only
  )                   as next_post
-- Fetch previous post id and title
  ,(
    select
      blog_t_post(
         lkp_post.post_id
        ,lkp_post.post_title
      ) as post
    from q1 lkp_post
    where 1 = 1
      and lkp_post.published_on <= q1.published_on
      and lkp_post.post_id != q1.post_id
    order by lkp_post.published_on desc, lkp_post.post_id desc
    fetch first 1 rows only
  )                   as prev_post
from q1
-- Fetch APEX messages
cross join(
  select
     apex_lang.message( 'BLOG_TXT_POSTED_BY' )  as posted_by
    ,apex_lang.message( 'BLOG_TXT_POSTED_ON' )  as posted_on
    ,apex_lang.message( 'BLOG_TXT_CATEGORY' )   as category
    ,apex_lang.message( 'BLOG_TXT_TAGS' )       as tags
    ,apex_lang.message( 'BLOG_TXT_READ_MORE' )  as read_more
  from dual
) txt
with read only
/
