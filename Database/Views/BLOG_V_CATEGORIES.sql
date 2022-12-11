--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_CATEGORIES" ("CATEGORY_ID", "CATEGORY_TITLE", "DISPLAY_SEQ", "POSTS_COUNT", "CHANGED_ON", "CATEGORY_URL", "SHOW_POST_COUNT") AS
  select
   v1.category_id       as category_id
  ,v1.category_title    as category_title
  ,v1.category_seq      as display_seq
  ,count( v1.post_id )  as posts_count
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_category(
    p_category_id => v1.category_id
  )                     as category_url
  ,feat.show_post_count as show_post_count
from blog_v_posts v1
cross join(
  select
    apex_util.get_build_option_status(
       p_application_id     => sys_context( 'APEX$SESSION', 'APP_ID' )
      ,p_build_option_name  => 'BLOG_FEATURE_CATEGORY_POST_COUNT'
    ) as show_post_count
  from dual
) feat
where 1 = 1
group by v1.category_id
  ,v1.category_title
  ,v1.category_seq
  ,feat.show_post_count
with read only
/
