--------------------------------------------------------
--  DDL for View BLOG_V_LINKS
--------------------------------------------------------
create or replace force view blog_v_links as
select
   t1.id          as link_id
  ,t2.id          as group_id
  ,t2.title       as group_title
  ,t2.display_seq as group_display_seq
  ,t1.display_seq as display_seq
  ,t1.title       as link_title
  ,t1.link_desc   as link_desc
  ,t1.link_url    as link_url
  ,case external_link + target_blank
    when 2
    then 'target="_blank" rel="external"'
    when 1
    then
      case external_link
      when 1
      then 'rel="external"'
      else 'target="_blank"'
    end
  end as link_attr
from blog_links t1
join blog_link_groups t2
  on t1.link_group_id = t2.id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
with read only
/
