--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_COMMENTS" ("COMMENT_ID", "POST_ID", "PARENT_ID", "CREATED_ON", "COMMENT_BY", "COMMENT_BODY", "USER_ICON", "ICON_MODIFIER") AS
  select
   t1.id          as comment_id
  ,t1.post_id     as post_id
  ,t1.parent_id   as parent_id
  ,t1.created_on  as created_on
  ,t1.comment_by  as comment_by
  ,t1.body_html   as comment_body
  ,apex_string.get_initials(
    p_str => t1.comment_by
  )               as user_icon
  ,apex_string.format(
     p_message => 'u-color-%s'
    ,p0 => ora_hash( lower( t1.comment_by ), 44 ) + 1
  )               as icon_modifier
from blog_comments t1
where 1 = 1
  and t1.is_active = 1
  and not exists(
    select 1
    from blog_comment_flags x1
    where 1 = 1
      and x1.comment_id = t1.id
      and x1.flag = 'MODERATE'
  )
with read only
/
