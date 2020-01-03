--------------------------------------------------------
--  File created - Friday-January-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_V_COMMENTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_040000"."BLOG_V_COMMENTS" ("COMMENT_ID", "POST_ID", "PARENT_ID", "COMMENT_ON", "CREATED_ON", "COMMENT_BY", "COMMENT_BODY", "ACTIONS") AS 
  with q1 as(
  select
     apex_lang.lang( 'Reply' )    as reply_txt
    ,apex_lang.lang( 'Comment' )  as comment_txt
  from dual
)
select
   t1.id                          as comment_id
  ,t1.post_id                     as post_id
  ,t1.parent_id                   as parent_id
  ,connect_by_root t1.created_on  as comment_on
  ,t1.created_on                  as created_on
  ,t2.reader_name                 as comment_by
  ,t1.body_html                   as comment_body
  ,case
    when t1.parent_id is not null
    then q1.reply_txt
    else q1.comment_txt
   end                            as actions
from blog_comments t1
join blog_readers t2
  on t1.reader_id = t2.id
cross join q1
where 1 = 1
start with t1.parent_id is null
and t1.is_active * t2.is_active > 0
connect by prior t1.id = t1.parent_id
with read only
;
