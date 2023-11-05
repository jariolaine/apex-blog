--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
create or replace force view blog_v_archive_year as
select
   v1.archive_year      as archive_year
  ,count(1)             as post_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_archive(
    p_archive_id => v1.archive_year
  )                     as archive_url
  ,feat.show_post_count as show_post_count
  ,case feat.show_post_count
    when 'INCLUDE' then count(1)
  end                   as list_badge
  ,apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => v1.archive_year
  )                     as list_attr
from blog_v_posts v1
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_ARCHIVE_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.archive_year
  ,feat.show_post_count
with read only
/
