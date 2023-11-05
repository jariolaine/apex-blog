--------------------------------------------------------
--  DDL for View BLOG_V_TAGS
--------------------------------------------------------
create or replace force view blog_v_tags as
select
   v1.tag_id            as tag_id
  ,v1.tag               as tag
  ,v1.tag_url           as tag_url
  ,count( 1 )           as posts_count
-- if tag is changed, trigger tickles text index and post changes
  ,max( v2.changed_on ) as changed_on
  ,width_bucket(
     count( 1 )
    ,min( count( 1 ) ) over()
    ,max( count( 1 ) ) over()
    ,7
  )                     as tag_bucket
  ,feat.show_post_count as show_post_count
  ,case feat.show_post_count
    when 'INCLUDE' then count(1)
  end                   as list_badge
from blog_v_post_tags v1
join blog_v_posts v2 on v1.post_id = v2.post_id
-- Get feature tag post count status
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
