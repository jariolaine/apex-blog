--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_COMMENTS" ("COMMENT_ID", "POST_ID", "PARENT_ID", "CREATED_ON", "COMMENT_BY", "COMMENT_BODY", "USER_ICON", "ICON_MODIFIER") AS 
  select
   t1.id as comment_id
  ,t1.post_id as post_id
  ,t1.parent_id as parent_id
  ,t1.created_on as created_on
  ,t2.reader_name as comment_by
  ,t1.body_html as comment_body
  ,apex_string.get_initials(t2.reader_name) as user_icon
  ,'u-color-' || ora_hash(t2.reader_name, 45) as icon_modifier
from blog_comments t1
join blog_readers t2
  on t1.reader_id = t2.id
where 1 = 1
with read only
;
