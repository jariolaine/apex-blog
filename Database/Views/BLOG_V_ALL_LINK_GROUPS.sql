--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINK_GROUPS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_LINK_GROUPS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "DISPLAY_SEQ", "TITLE", "TITLE_UNIQUE", "NOTES", "STATUS_TEXT", "LINK_COUNT") AS
select
   t1.id                  as id
  ,t1.row_version         as row_version
  ,t1.created_on          as created_on
  ,lower( t1.created_by ) as created_by
  ,t1.changed_on          as changed_on
  ,lower (t1.changed_by ) as changed_by
  ,t1.is_active           as is_active
  ,t1.display_seq         as display_seq
  ,t1.title               as title
  ,t1.title_unique        as title_unique
  ,t1.notes               as notes
  ,case t1.is_active
    when 1
    then c.txt_enabled
    else c.txt_disabled
  end                     as status_text
  ,(
    select
      count(1) as cnt
    from blog_links lkp
    where lkp.link_group_id = t1.id
  )                       as link_count
from blog_link_groups t1
cross join (
  select
     apex_lang.message( 'BLOG_TXT_ENABLED' )  as txt_enabled
    ,apex_lang.message( 'BLOG_TXT_DISABLED' ) as txt_disabled
  from dual
) c
where 1 = 1
/
