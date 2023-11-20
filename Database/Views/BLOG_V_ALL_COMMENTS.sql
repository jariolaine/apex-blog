--------------------------------------------------------
--  DDL for View BLOG_V_ALL_COMMENTS
--------------------------------------------------------
create or replace force view blog_v_all_comments as
with q1 as(
  select
     t1.id
    ,t1.row_version
    ,t1.created_on
    ,t1.created_by
    ,t1.changed_on
    ,t1.changed_by
    ,t1.is_active
    ,t2.id as post_id
    ,t1.parent_id
    ,t2.title as post_title
    ,t1.body_html
    ,t1.comment_by
    ,t1.ctx_search
    ,t1.rowid as ctx_rid
    ,apex_escape.striphtml(
      p_string => t1.body_html
    ) as ctx_search_text
    ,case
      when exists(
        select 1
        from blog_comment_flags f11
        where f11.flag = 'MODERATE'
          and f11.comment_id = t1.id
      )
        then 'MODERATE'
      when t1.is_active = 1
        then 'ENABLED'
        else 'DISABLED'
    end as comment_status_code
    -- because issue: column single-row subquery returns more than one row
    -- and APEX IR not use LOV in detail view
    ,case
      when exists(
        select 1
        from blog_comment_flags f11
        where f11.flag = 'MODERATE'
          and f11.comment_id = t1.id
      )
        then (
          select
            lov1.display_value
          from blog_v_lov lov1
          where lov1.lov_name = 'COMMENT_STATUS'
            and lov1.return_value = 'MODERATE'
        )
      when t1.is_active = 1
        then (
          select
            lov1.display_value
          from blog_v_lov lov1
          where lov1.lov_name = 'COMMENT_STATUS'
            and lov1.return_value = 'ENABLED'
        )
        else (
          select
            lov1.display_value
          from blog_v_lov lov1
          where lov1.lov_name = 'COMMENT_STATUS'
            and lov1.return_value = 'DISABLED'
        )
    end as comment_status_text
    ,case
      when exists(
        select 1
        from blog_comment_flags f12
        where f12.flag = 'NEW'
          and f12.comment_id = t1.id
      )
        then 'NEW'
      when exists(
        select 1
        from blog_comment_flags f13
        where f13.flag = 'UNREAD'
          and f13.comment_id = t1.id
      )
        then 'UNREAD'
      when t1.parent_id is not null
        then 'REPLY'
        else 'READ'
    end as comment_flag_code
    -- because issue: column single-row subquery returns more than one row
    -- and APEX IR not use LOV in detail view
    ,case
      when exists(
        select 1
        from blog_comment_flags f12
        where f12.flag = 'NEW'
          and f12.comment_id = t1.id
      )
        then (
          select
            lov2.display_value
          from blog_v_lov lov2
          where lov2.lov_name = 'COMMENT_FLAG'
            and lov2.return_value = 'NEW'
        )
      when exists(
        select 1
        from blog_comment_flags f13
        where f13.flag = 'UNREAD'
          and f13.comment_id = t1.id
      )
        then (
          select
            lov2.display_value
          from blog_v_lov lov2
          where lov2.lov_name = 'COMMENT_FLAG'
            and lov2.return_value = 'UNREAD'
        )
      when t1.parent_id is not null
        then (
          select
            lov2.display_value
          from blog_v_lov lov2
          where lov2.lov_name = 'COMMENT_FLAG'
            and lov2.return_value = 'REPLY'
        )
        else (
          select
            lov2.display_value
          from blog_v_lov lov2
          where lov2.lov_name = 'COMMENT_FLAG'
            and lov2.return_value = 'READ'
        )
    end as comment_flag_text
  from blog_comments t1
  join blog_posts t2 on  t1.post_id = t2.id
)
select
   q1.id                  as id
  ,q1.row_version         as row_version
  ,q1.created_on          as created_on
  ,lower( q1.created_by ) as created_by
  ,q1.changed_on          as changed_on
  ,lower( q1.changed_by ) as changed_by
  ,q1.is_active           as is_active
  ,q1.post_id             as post_id
  ,q1.parent_id           as parent_id
  ,q1.post_title          as post_title
  ,q1.body_html           as body_html
  ,q1.comment_by          as comment_by
  ,q1.ctx_search          as ctx_search
  ,q1.rowid               as ctx_rid
  ,q1.comment_status_code as comment_status_code
  ,q1.comment_flag_code   as comment_flag_code
  ,case
    when q1.comment_flag_code in( 'NEW', 'UNREAD' )
      then 'true'
      else 'false'
  end                     as data_unread
/*
-- because issue: column single-row subquery returns more than one row
  ,(
    select
      lov1.display_value
    from blog_v_lov lov1
    where lov1.lov_name = 'COMMENT_STATUS'
      and lov1.return_value = q1.comment_status_code
  )                       as comment_status_text
*/
  ,q1.comment_status_text as comment_status_text
/*
-- because issue: column single-row subquery returns more than one row
  ,(
    select
      lov2.display_value
    from blog_v_lov lov2
    where lov2.lov_name = 'COMMENT_FLAG'
      and lov2.return_value = q1.comment_flag_code
  )                       as comment_flag_text
*/
  ,q1.comment_flag_text   as comment_flag_text
  ,case q1.comment_status_code
    when 'MODERATE'
      then 'fa-exclamation-circle u-warning-text'
    when 'ENABLED'
      then 'fa-check-circle u-success-text'
      else 'fa-minus-circle u-danger-text'
  end                     as comment_status_icon
  ,case q1.comment_flag_code
    when 'REPLY'
      then 'fa-send-o'
    when 'NEW'
      then 'fa-envelope-arrow-down'
    when 'UNREAD'
      then 'fa-envelope-o'
      else 'fa-envelope-open-o'
  end                     as comment_flag_icon
  ,substr( q1.ctx_search_text, 1 , 128 )
  || case when length( q1.ctx_search_text ) > 128
    then ' ...'
  end                     as search_desc
  ,xmlserialize( content
    xmlforest(
      q1.comment_by       as "commented_by"
      ,q1.ctx_search_text as "comment"
    )
  )                       as ctx_datastore
from q1
where 1 = 1
/
