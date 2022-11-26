--------------------------------------------------------
--  DDL for View BLOG_V_ARCHIVE_YEAR
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ARCHIVE_YEAR" ("ARCHIVE_YEAR", "POST_COUNT", "CHANGED_ON", "ARCHIVE_URL", "SHOW_POST_COUNT") AS
select
   v1.archive_year      as archive_year
  ,count( v1.post_id )  as post_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_archive(
    p_archive_id => v1.archive_year
  )                     as archive_url
  ,feat.show_post_count as show_post_count
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
