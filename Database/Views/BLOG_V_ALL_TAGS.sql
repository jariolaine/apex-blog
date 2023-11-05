--------------------------------------------------------
--  DDL for View BLOG_V_ALL_TAGS
--------------------------------------------------------
create or replace force view blog_v_all_tags as
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.tag               as tag
  ,t1.tag_unique        as tag_unique
  ,t1.notes             as notes
  ,case t1.is_active
    when 1
      then c.txt_enabled
      else c.txt_disabled
  end                   as tag_status_text
  ,(
    select count(1)
    from blog_post_tags lkp
    where 1 = 1
    and lkp.tag_id = t1.id
   )                    as posts_count
  ,case
    when exists(
      select 1
      from blog_post_tags lkp
      where 1 = 1
      and lkp.tag_id = t1.id
    )
    then 'U'
    else 'UD'
  end                   as allowed_row_operation
from blog_tags t1
cross join (
  select
     apex_lang.message( 'BLOG_TXT_ENABLED' )    as txt_enabled
    ,apex_lang.message( 'BLOG_TXT_DISABLED' )   as txt_disabled
  from dual
) c
where 1 = 1
/
