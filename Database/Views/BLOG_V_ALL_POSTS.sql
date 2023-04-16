--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POSTS" ("ID", "CATEGORY_ID", "BLOGGER_ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "BLOGGER_NAME", "BLOGGER_EMAIL", "CATEGORY_TITLE", "TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "BODY_LENGTH", "PUBLISHED_ON", "NOTES", "PUBLISHED_DISPLAY", "POST_STATUS_CODE", "CTX_SEARCH", "CTX_RID", "POST_STATUS_ICON", "TAG_ID", "VISIBLE_TAGS", "HIDDEN_TAGS", "COMMENTS_CNT", "PUBLISHED_COMMENTS_CNT", "UNREAD_COMMENTS_CNT", "MODERATE_COMMENTS_CNT", "DISABLED_COMMENTS_CNT", "POST_STATUS_TXT", "TAGS_HTML", "SEARCH_DESC") AS
with q1 as(
  select
     t1.id              as id
    ,t1.category_id     as category_id
    ,t1.blogger_id      as blogger_id
    ,t1.row_version     as row_version
    ,t1.created_on      as created_on
    ,t1.created_by      as created_by
    ,t1.changed_on      as changed_on
    ,t1.changed_by      as changed_by
    ,t3.blogger_name    as blogger_name
    ,t3.email           as blogger_email
    ,t2.title           as category_title
    ,t1.title           as title
    ,t1.post_desc       as post_desc
    ,t1.first_paragraph as first_paragraph
    ,t1.body_html       as body_html
    ,t1.body_length     as body_length
    ,t1.published_on    as published_on
    ,t1.notes           as notes
    ,t1.ctx_search      as ctx_search
    ,t1.rowid           as ctx_rid
    ,case t1.is_active * t2.is_active * t3.is_active
      when 1
      then t1.published_on
     end                as published_display
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
    end                 as post_status_code
  from blog_posts t1
  join blog_categories t2
    on t1.category_id = t2.id
  join blog_bloggers t3
    on t1.blogger_id = t3.id
  where 1 = 1
)
select
   q1.id                  as id
  ,q1.category_id         as category_id
  ,q1.blogger_id          as blogger_id
  ,q1.row_version         as row_version
  ,q1.created_on          as created_on
  ,lower( q1.created_by ) as created_by
  ,q1.changed_on          as changed_on
  ,lower( q1.changed_by ) as changed_by
  ,q1.blogger_name        as blogger_name
  ,q1.blogger_email       as blogger_email
  ,q1.category_title      as category_title
  ,q1.title               as title
  ,q1.post_desc           as post_desc
  ,q1.first_paragraph     as first_paragraph
  ,q1.body_html           as body_html
  ,q1.body_length         as body_length
  ,q1.published_on        as published_on
  ,q1.notes               as notes
  ,q1.published_display   as published_display
  ,q1.post_status_code    as post_status_code
  ,q1.ctx_search          as ctx_search
  ,q1.ctx_rid             as ctx_rid
  ,case q1.post_status_code
    when 'BLOGGER_DISABLED' then 'fa-stop-circle u-danger-text'
    when 'CATEGORY_DISABLED'then 'fa-minus-circle u-danger-text'
    when 'DRAFT'            then 'fa-pause-circle u-warning-text'
    when 'SCHEDULED'        then 'fa-clock-o u-info-text'
    when 'PUBLISHED'        then 'fa-check-circle u-success-text'
                            else 'fa-question-circle'
   end                    as post_status_icon
  ,(
     select
      listagg( tags.tag_id, ':' )  within group( order by tags.display_seq ) as tag_ids
     from blog_v_all_post_tags tags
     where 1 = 1
     and tags.post_id = q1.id
   )                      as tag_id
  ,(
    select
      listagg( tags.tag, ', ' )  within group( order by tags.display_seq ) as tags
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = q1.id
    and tags.is_active * tags.tag_is_active = 1
  )                       as visible_tags
  ,(
    select
      listagg( tags.tag, ', ' )  within group( order by tags.display_seq ) as tags
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = q1.id
    and tags.is_active * tags.tag_is_active = 0
  )                       as hidden_tags
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
  )                       as comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.is_active = 1
    and co.post_id  = q1.id
  )                       as published_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag in( 'NEW', 'UNREAD' )
      and x1.comment_id = co.id
    )
  )                       as unread_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                       as moderate_comments_cnt
  ,(
    select
      count(1) as cnt
    from blog_comments co
    where 1 = 1
    and co.post_id  = q1.id
    and co.is_active = 0
    and not exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                       as disabled_comments_cnt
  ,(
    select
      lov.display_value
    from blog_v_lov lov
    where 1 = 1
      and lov.lov_name = 'POST_STATUS'
      and lov.return_value = q1.post_status_code
  )                       as post_status_txt
-- Post tags for admin app page 11 IR detail view
  ,(
    select
      xmlserialize(
        content xmlagg( lkp1.tag_html3 order by lkp1.display_seq )
      )
    from blog_v_post_tags lkp1
    where 1 = 1
      and lkp1.post_id = q1.id
  )                       as tags_html
  ,apex_escape.striphtml(
    p_string => q1.first_paragraph
  )                       as search_desc
from q1
where 1 = 1
/
