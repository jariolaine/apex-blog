--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_LAST10
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_POSTS_LAST10" ("POST_ID", "CREATED_ON", "DISPLAY_SEQ", "BLOGGER_NAME", "POST_TITLE", "POST_DESC", "CATEGORY_TITLE", "RSS_TITLE", "RSS_DESC", "RSS_CATEGORY", "PUBDATE") AS 
  with qry as (
  select /*+ FIRST_ROWS(10) */
     row_number() over ( order by t1.created_on desc ) as rn
    ,t1.post_id
    ,t1.post_title
    ,t1.post_desc
    ,t1.blogger_name
    ,t1.category_title
    ,t1.created_on
  from blog_v_posts t1
)
select
  qry.post_id                             as post_id,
  qry.created_on                          as created_on,
  qry.rn                                  as display_seq,
  qry.blogger_name                        as blogger_name,
  apex_escape.html( qry.post_title )      as post_title,
  apex_escape.html( qry.post_desc )       as post_desc,
  apex_escape.html( qry.category_title )  as category_title,

  qry.post_title                          as rss_title,
  qry.post_desc                           as rss_desc,
  qry.category_title                      as rss_category,
  to_char(
    sys_extract_utc( qry.created_on ),
    'Dy, DD Mon YYYY HH24:MI:SS "GMT"',
    'NLS_DATE_LANGUAGE=ENGLISH'
  )                                       as pubdate
from qry
where 1 = 1
and qry.rn <= 10
with read only
;
