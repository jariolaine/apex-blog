--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_APEX
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS_APEX" ("POST_ID", "CATEGORY_ID", "BLOGGER_ID", "BLOGGER_NAME", "POST_TITLE", "CATEGORY_TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "PUBLISHED_ON", "CHANGED_ON", "ARCHIVE_YEAR_MONTH", "ARCHIVE_YEAR", "CATEGORY_SEQ", "POST_URL", "TAGS_HTML1", "TAGS_HTML2", "TXT_POSTED_BY", "TXT_POSTED_ON", "TXT_CATEGORY", "TXT_TAGS", "TXT_READ_MORE") AS
  select
   v1.post_id             as post_id
  ,v1.category_id         as category_id
  ,v1.blogger_id          as blogger_id
  ,v1.blogger_name        as blogger_name
  ,v1.post_title          as post_title
  ,v1.category_title      as category_title
  ,v1.post_desc           as post_desc
  ,v1.first_paragraph     as first_paragraph
  ,v1.body_html           as body_html
  ,v1.published_on        as published_on
  ,v1.changed_on          as changed_on
  ,v1.archive_year_month  as archive_year_month
  ,v1.archive_year        as archive_year
  ,v1.category_seq        as category_seq
  ,v1.post_url            as post_url
  ,v1.tags_html1          as tags_html1
  ,v1.tags_html2          as tags_html2
  -- text, label etc. for APEX reports
  ,txt.posted_by          as txt_posted_by
  ,txt.posted_on          as txt_posted_on
  ,txt.category           as txt_category
  ,case
    when v1.tags_html1 is not null
    then txt.tags
  end                     as txt_tags
  ,txt.read_more          as txt_read_more
from blog_v_posts v1
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
