--------------------------------------------------------
--  DDL for View BLOG_V_ALL_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_all_comments as
select
   v1.id                  as id
  ,v1.row_version         as row_version
  ,v1.created_on          as created_on
  ,lower( v1.created_by ) as created_by
  ,v1.changed_on          as changed_on
  ,lower( v1.changed_by ) as changed_by
  ,v1.is_active           as is_active
  ,v1.post_id             as post_id
  ,v1.parent_id           as parent_id
  ,v1.post_title          as post_title
  ,v1.body_html           as body_html
  ,v1.comment_by          as comment_by
  ,v1.ctx_search          as ctx_search
  ,v1.ctx_rid             as ctx_rid
  ,v1.comment_status_code as comment_status_code
  ,v1.comment_flag_code   as comment_flag_code
  ,case
    when v1.comment_flag_code in( 'NEW', 'UNREAD' )
      then 'true'
      else 'false'
  end                     as data_unread
  ,(
    select
      lov1.display_value
    from blog_v_lov lov1
    where lov1.lov_name = 'COMMENT_STATUS'
      and lov1.return_value = v1.comment_status_code
  )                       as comment_status_text
  ,(
    select
      lov2.display_value
    from blog_v_lov lov2
    where lov2.lov_name = 'COMMENT_FLAG'
      and lov2.return_value = v1.comment_flag_code
  )                       as comment_flag_text
  ,case v1.comment_status_code
    when 'MODERATE'
      then 'fa-exclamation-circle u-warning-text'
    when 'ENABLED'
      then 'fa-check-circle u-success-text'
      else 'fa-minus-circle u-danger-text'
  end                     as comment_status_icon
  ,case v1.comment_flag_code
    when 'REPLY'
      then 'fa-send-o'
    when 'NEW'
      then 'fa-envelope-arrow-down'
    when 'UNREAD'
      then 'fa-envelope-o'
      else 'fa-envelope-open-o'
  end                     as comment_flag_icon
  ,substr( v1.ctx_search_text, 1 , 128 )
  || case when length( v1.ctx_search_text ) > 128
    then ' ...'
  end                     as search_desc
  ,xmlserialize( content
    xmlforest(
      v1.comment_by       as "commented_by"
      ,v1.ctx_search_text as "comment"
    )
  )                       as ctx_datastore
from blog_v_all_comments_form v1
where 1 = 1
/
