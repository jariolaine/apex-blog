--------------------------------------------------------
--  DDL for View BLOG_V_ALL_LINKS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_LINKS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "LINK_GROUP_ID", "IS_ACTIVE", "LINK_GROUP_IS_ACTIVE", "DISPLAY_SEQ", "LINK_GROUP_DISPLAY_SEQ", "TITLE", "LINK_GROUP_TITLE", "LINK_DESC", "NOTES", "LINK_URL", "LINK_STATUS_CODE", "LINK_STATUS_ICON") AS
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t2.id                as link_group_id
  ,t1.is_active         as is_active
  ,t2.is_active         as link_group_is_active
  ,t1.display_seq       as display_seq
  ,t2.display_seq       as link_group_display_seq
  ,t1.title             as title
  ,t2.title             as link_group_title
  ,t1.link_desc         as link_desc
  ,t1.notes             as notes
  ,t1.link_url          as link_url
  ,case t2.is_active
    when 1 then
      case t1.is_active
        when 1
        then 'ENABLED'
        else 'DISABLED'
        end
    else 'GROUP_DISABLED'
  end                   as link_status_code
  ,case t1.is_active * t2.is_active
    when 1
    then 'fa-check-circle u-success-text'
    else 'fa-minus-circle u-danger-text'
  end                   as link_status_icon
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
/
