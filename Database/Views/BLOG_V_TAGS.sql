--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
create or replace force view blog_v_tags as
with q1 as(
  select
    v1.tag_id
  , v1.tag
  , v1.tag_url
  -- if tag is changed, trigger tickles text index and post changes
  , max( v2.changed_on ) as changed_on
  , count( 1 ) as posts_count
  from blog_v_post_tags v1
  join blog_v_posts v2 on v1.post_id = v2.post_id
  group by
    v1.tag_id
  , v1.tag
  , v1.tag_url
)
select
  q1.tag_id             as tag_id
, q1.tag                as tag
, q1.tag_url            as tag_url
, q1.posts_count        as posts_count
, q1.changed_on         as changed_on
, width_bucket(
    q1.posts_count
  , min( q1.posts_count ) over()
  , max( q1.posts_count ) over()
  , 7
  )                     as tag_bucket
, feat.show_post_count  as show_post_count
, case feat.show_post_count
    when 'INCLUDE' then q1.posts_count
  end                   as list_badge
-- Get feature tag post count status
from q1
cross join(
  select
    apex_application_admin.get_build_option_status(
      p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
    , p_build_option_name  => 'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
with read only
/
