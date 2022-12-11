--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_TAGS" ("TAG_ID", "TAG", "TAG_URL", "POSTS_COUNT", "CHANGED_ON", "TAG_BUCKET", "SHOW_POST_COUNT") AS
  select
   v1.tag_id            as tag_id
  ,v1.tag               as tag
  ,v1.tag_url           as tag_url
  ,count( v1.post_id )  as posts_count
  ,max(
    greatest(
       v1.changed_on
      ,v2.changed_on
    )
  )                     as changed_on
  ,width_bucket(
     count( v1.post_id )
    ,min( count( v1.post_id ) ) over()
    ,max( count( v1.post_id ) ) over()
    ,7
  )                     as tag_bucket
  ,feat.show_post_count as show_post_count
from blog_v_post_tags v1
join blog_v_posts v2 on v1.post_id = v2.post_id
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.tag_id
  ,v1.tag
  ,v1.tag_url
  ,feat.show_post_count
with read only
/
