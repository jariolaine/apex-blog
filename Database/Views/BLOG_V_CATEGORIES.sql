--------------------------------------------------------
--  DDL for View BLOG_V_CATEGORIES
--------------------------------------------------------
create or replace force view blog_v_categories as
select
   v1.category_id       as category_id
  ,v1.category_title    as category_title
  ,v1.category_seq      as display_seq
  ,count(1)             as posts_count
-- if category is changed, trigger tickles text index and post changes
  ,max( v1.changed_on ) as changed_on
  ,blog_url.get_category(
    p_category_id => v1.category_id
  )                     as category_url
  ,feat.show_post_count as show_post_count
  ,case feat.show_post_count
    when 'INCLUDE' then count(1)
  end                   as list_badge
  ,apex_string.format(
    p_message => 'data-item-id="%s"'
    ,p0 => v1.category_id
  )                     as list_attr
from blog_v_posts v1
cross join(
  select
    apex_application_admin.get_build_option_status(
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
