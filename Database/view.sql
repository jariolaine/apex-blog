-- view blog_v_comments
create or replace view blog_v_comments
as
with q1 as(
  select
     apex_lang.message( 'BLOG_REPLY' )    as reply_txt
    ,apex_lang.message( 'BLOG_COMMENT' )  as comment_txt
  from dual
)
select
   t1.id                          as comment_id
  ,t1.post_id                     as post_id
  ,t1.parent_id                   as parent_id
  ,connect_by_root t1.created_on  as comment_on
  ,t1.created_on                  as created_on
  ,t2.reader_name                 as comment_by
  ,t1.body_html                   as comment_body
  ,case
    when t1.parent_id is not null
    then q1.reply_txt
    else q1.comment_txt
   end                            as actions
from blog_comments t1
join blog_readers t2
  on t1.reader_id = t2.id
cross join q1
where 1 = 1
start with t1.parent_id is null
  and t1.is_disabled = 0
  and t2.is_disabled = 0
connect by prior t1.id = t1.parent_id
with read only
/

-- view blog_v_links
create or replace view blog_v_links
as
select
   t2.title           as group_title
  ,t2.display_seq     as group_display_seq
  ,t1.display_seq     as display_seq
  ,t1.title           as link_title
  ,t1.link_desc       as link_desc
  ,t1.link_url        as link_url
from blog_links t1
join blog_links_grp t2
  on t1.link_grp_id = t2.id
where 1 = 1
and t1.is_disabled = 0
and t2.is_disabled = 0
with read only
/

-- view blog_v_all_links
create or replace view blog_v_all_links
as
select
   t1.id            as link_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_disabled   as is_disabled
  ,t1.display_seq   as display_seq
  ,t1.title         as link_title
  ,t1.link_desc     as link_desc
  ,t1.link_url      as link_url

  ,t2.id            as grp_id
  ,t2.row_version   as grp_row_version
  ,t2.created_on    as grp_created_on
  ,t2.created_by    as grp_created_by
  ,t2.changed_on    as grp_changed_on
  ,t2.changed_by    as grp_changed_by
  ,t2.is_disabled   as grp_is_disabled
  ,t2.display_seq   as grp_display_seq
  ,t2.title         as grp_title
  ,t2.title_unique  as grp_title_unique
from blog_links t1
join blog_links_grp t2
  on t1.link_grp_id = t2.id
where 1 = 1
with read only
/

-- view blog_v_categories
create or replace view blog_v_categories
as
select
   t1.id            as category_id
  ,t1.created_on    as created_on
  ,t1.title         as category_title
  ,t1.display_seq   as display_seq
from blog_cats t1
where 1 = 1
and t1.is_disabled = 0
and exists (
  select 1
  from blog_posts x1
  where 1 = 1
  and x1.is_disabled  = 0
  and x1.valid_from  <= localtimestamp
  and x1.category_id  = t1.id
)
with read only
/

create or replace view blog_v_all_categories
as
select
   t1.id            as category_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_disabled   as is_disabled
  ,t1.display_seq   as display_seq
  ,t1.title         as category_title
  ,t1.title_unique  as title_unique
  ,(
    select count(id)
    from blog_posts l1
    where 1 = 1
    and l1.category_id = t1.id
   )                as posts_count
from blog_cats t1
with read only
/

create or replace view blog_v_posts as
select
   t1.id              as post_id
  ,t3.id              as category_id
  ,t2.id              as blogger_id
  ,t2.blogger_name    as blogger_name
  ,t1.title           as post_title
  ,t3.title           as category_title
  ,t1.post_desc       as post_desc
  ,t1.first_paragraph as first_paragraph
  ,t1.body_html       as body_html
  ,t1.created_on      as created_on
  ,t1.year_month      as year_month
  ,(
    select count( l1.id )
    from blog_comments l1
    where 1 = 1
    and l1.is_disabled = 0
    and l1.post_id  = t1.id
  ) as comments_count
  ,(
    select
      apex_lang.message(
        'BLOG_READ_MORE'
      )
    from dual
  ) as read_more_txt
  ,(
    select
      apex_lang.message(
        'BLOG_POSTED_ON'
      )
    from dual
  ) as posted_on_txt
  ,(
    select
      apex_lang.message(
        'BLOG_POSTED_BY'
      )
    from dual
  ) as posted_by_txt
  ,(
    select
      apex_lang.message(
        'BLOG_CATEGORY'
      )
    from dual
  ) as category_txt
  ,(
    select
      apex_lang.message(
        'BLOG_TAGS'
      )
    from dual
  ) as tags_txt
from blog_posts     t1
join blog_bloggers  t2 on t1.blogger_id   = t2.id
join blog_cats      t3 on t1.category_id  = t3.id
where 1 = 1
and t1.valid_from <= localtimestamp
and t1.is_disabled = 0
and t2.is_disabled = 0
and t3.is_disabled = 0
with read only
/

-- view blog_v_all_posts
create or replace view blog_v_all_posts
as
select
   t1.id            as id
  ,t1.category_id   as category_id
  ,t1.blogger_id    as blogger_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.created_by    as created_by
  ,t1.changed_on    as changed_on
  ,t1.changed_by    as changed_by
  ,t1.is_disabled   as is_disabled
  ,t3.blogger_name  as blogger_name
  ,t2.title         as category_title
  ,t1.title         as title
  ,t1.post_desc     as post_desc
  ,t1.body_html     as body_html
  ,t1.body_length   as body_length
  ,t1.valid_from    as valid_from
  ,t1.year_month    as year_month
  ,(
    select listagg(lkp.tag, ', ')  within group(order by lkp.display_seq) as tags
    from blog_v_all_posts_tags lkp
    where 1 = 1
    and lkp.post_id = t1.id
  ) as post_tags
  ,(
    select count( lkp.id )
    from blog_comments lkp
    where 1 = 1
    and lkp.post_id  = t1.id
  ) as comments_count
  ,case
    when t3.is_disabled = 1
    then 'BLOGGER_DISABLED'
    when t2.is_disabled = 1
    then 'CATEGORY_DISABLED'
    when t1.is_disabled = 1
    then 'DISABLED'
    when t1.valid_from > localtimestamp
    then 'SCHEDULED'
    else 'ENABLED'
   end as post_status
from blog_posts t1
join blog_cats t2 on t1.category_id = t2.id
join blog_bloggers t3 on t1.blogger_id = t3.id
where 1 = 1
with read only
/

-- view blog_apex_build_options
create or replace view blog_apex_build_options
as
select build_option_id
  ,application_id
  ,feature_identifier
  ,build_option_name
  ,apex_lang.message(
    p_name => build_option_name
  ) as feature_name
  ,case
  when build_option_status = 'Include'
    then msg.feature_enabled
  when build_option_status = 'Exclude'
    then msg.feature_disabled
  end as status
  ,apex_lang.message(
    p_name => build_option_name || '_DESC'
  ) as feature_desc
  ,last_updated_on as last_updated
  ,lower( last_updated_by ) as last_updated_by
  ,case
  when build_option_status = 'Include'
    then msg.feature_enabled
  when build_option_status = 'Exclude'
    then msg.feature_disabled
  end as current_status
  ,apex_item.hidden( 1, build_option_id )
  || apex_item.switch (
     p_idx        => 2
    ,p_value      => build_option_status
    ,p_on_value   => 'Include'
    ,p_on_label   => msg.feature_enabled
    ,p_off_value  => 'Exclude'
    ,p_off_label  => msg.feature_disabled
    ,p_item_id    => 'BO_OPT_' || rownum
    ,p_attributes => 'style="white-space:pre;display:inline-flex;"'
    ,p_item_label => (
      case
      when build_option_status = 'Include' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_ENABLED'
          ,p0 => apex_escape.html( build_option_name )
        )
      when build_option_status = 'Exclude' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_DISABLED'
          ,p0 => apex_escape.html( build_option_name )
        )
      end
    )
  ) as switch_html
  ,case
  when build_option_status = 'Include'
    then 'u-success-text'
  when build_option_status = 'Exclude'
    then 'u-danger-text'
  end as current_status_css_class
from apex_application_build_options
cross join (
  select apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.ENABLED' ) feature_enabled
    ,apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.DISABLED' ) feature_disabled
  from dual
) msg
where 1 = 1
and build_option_name like 'BLOG\_FEATURE\_%' escape '\'
--'
/


create or replace view blog_v_posts_tags
as
select t2.post_id  as post_id
  ,t2.tag_id       as tag_id
  ,t2.display_seq  as display_seq
  ,t1.tag          as tag
from blog_tags t1
join blog_posts_tags t2 on t1.id = t2.tag_id
where 1 = 1
and t1.is_disabled = 0
and t2.is_disabled = 0
with read only
/


create or replace view blog_v_all_posts_tags
as
select t2.post_id  as post_id
  ,t2.tag_id       as tag_id
  ,t2.display_seq  as display_seq
  ,t1.tag          as tag
from blog_tags t1
join blog_posts_tags t2 on t1.id = t2.tag_id
where 1 = 1
with read only
/
