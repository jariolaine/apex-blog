--------------------------------------------------------
--  DDL for View BLOG_V_ALL_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_POSTS" ("ID", "CATEGORY_ID", "BLOGGER_ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "BLOGGER_NAME", "BLOGGER_EMAIL", "CATEGORY_TITLE", "TITLE", "POST_DESC", "BODY_HTML", "BODY_LENGTH", "PUBLISHED_ON", "NOTES", "CTX_RID", "CTX_SEARCH", "PUBLISHED_DISPLAY", "TAG_ID", "POST_TAGS", "VISIBLE_TAGS", "HIDDEN_TAGS", "COMMENTS_COUNT", "PUBLISHED_COMMENTS_COUNT", "UNREAD_COMMENTS_COUNT", "MODERATE_COMMENTS_COUNT", "DISABLED_COMMENTS_COUNT", "POST_STATUS") AS
select
   t1.id                as id
  ,t1.category_id       as category_id
  ,t1.blogger_id        as blogger_id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t3.blogger_name      as blogger_name
  ,t3.email             as blogger_email
  ,t2.title             as category_title
  ,t1.title             as title
  ,t1.post_desc         as post_desc
  ,t1.body_html         as body_html
  ,t1.body_length       as body_length
  ,t1.published_on      as published_on
  ,t1.notes             as notes
  ,t4.rowid             as ctx_rid
  ,t4.dummy             as ctx_search
  ,case t1.is_active * t2.is_active * t3.is_active
    when 1
    then t1.published_on
   end                  as published_display
   ,(
     select listagg( tags.tag_id, ':' )  within group( order by tags.display_seq )
     from blog_v_all_post_tags tags
     where 1 = 1
     and tags.post_id = t1.id
   )                     as tag_id
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
  )                     as post_tags
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
    and tags.is_active = 1
  )                     as visible_tags
  ,(
    select listagg( tags.tag, ', ' )  within group( order by tags.display_seq )
    from blog_v_all_post_tags tags
    where 1 = 1
    and tags.post_id = t1.id
    and tags.is_active = 0
  )                     as hidden_tags
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
  )                     as comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.is_active = 1
    and co.post_id  = t1.id
  )                     as published_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'UNREAD'
      and x1.comment_id = co.id
    )
  )                     as unread_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                     as moderate_comments_count
  ,(
    select count( co.id )
    from blog_comments co
    where 1 = 1
    and co.post_id  = t1.id
    and co.is_active = 0
    and not exists(
      select 1
      from blog_comment_flags x1
      where 1 = 1
      and x1.flag = 'MODERATE'
      and x1.comment_id = co.id
    )
  )                     as disabled_comments_count
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
  end                  as post_status
from blog_posts t1
join blog_categories t2
  on t1.category_id = t2.id
join blog_bloggers t3
  on t1.blogger_id = t3.id
join blog_post_uds t4
  on t1.id = t4.post_id
where 1 = 1
/
