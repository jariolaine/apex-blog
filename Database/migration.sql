-- inserting blog_files
insert into blog_040000.blog_files(
   is_disabled
  ,is_download
  ,file_path
  ,file_name
  ,mime_type
  ,file_size
  ,file_charset
  ,blob_content
  ,file_desc
  ,etag
  ,modified
)
select
   case when active = 'Y' then 0 else 1 end as is_disabled
  ,case when file_type = 'FILE' then 1 else 0 end as is_download
  ,'/' as file_path
  ,file_name
  ,mime_type
  ,file_size
  ,dad_charset
  ,blob_content
  ,description
  ,file_etag
  ,file_modified_since
from blog_030100.blog_file
where 1 = 1
order by file_id
/

-- insering blog_readers
insert into blog_040000.blog_readers(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,reader_name
  ,email
)
select user_id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as changed_tz
  ,changed_by
  ,case when blocked = 'Y' then 1 else 0 end as is_disabled
  ,nick_name as name
  ,'noreply.user_' || rownum || '@example.com' as user_email
from blog_030100.blog_comment_user t1
where 1 = 1
order by user_id
/

-- inserting blog_bloggers
insert into blog_040000.blog_bloggers
(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,is_admin
  ,display_seq
  ,blogger_name
  ,username
  ,passwd
  ,email
  ,bio
)
select
   author_id as id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,changed_by
  ,0 as is_disabled
  ,1 as is_admin
  ,author_seq as display_seq
  ,author_name as name
  ,upper(user_name) as username
  ,passwd
  ,lower(email) as email
  ,bio
from blog_030100.blog_author
where 1 = 1
order by author_id
/

-- inserting blog_cats
alter trigger blog_040000.blog_cats_trg disable
/
insert into blog_040000.blog_cats(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,display_seq
  ,title
)
select
  category_id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,changed_by
  ,case when active = 'Y' then 0 else 1 end as is_disabled
  ,category_seq
  ,category_name
from blog_030100.blog_category
where 1 = 1
order by category_id
/

-- inserting blog_posts
insert into blog_040000.blog_posts
(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,blogger_id
  ,category_id
  ,valid_from
  ,title
  ,post_desc
  ,body_html
  ,first_paragraph
  ,body_length
  ,year_month
)
select
  article_id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as changed_tz
  ,changed_by
  ,case when active = 'Y' then 0 else 1 end as is_disabled
  ,author_id
  ,category_id
  ,from_tz(cast(valid_from as timestamp), 'Europe/Amsterdam') as valid_tz
  ,trim(article_title) as title
  ,description
  ,article_text
  ,blog_040000.blog_cm.get_first_paragraph(substr(article_text,1,4000)) as first_p
  ,article_length
  ,year_month_num
from blog_030100.blog_article
where 1 = 1
order by article_id
/

-- inserting tags
begin
  for c1 in(
    select article_id
      ,rtrim(ltrim(trim(keywords) || ',' || trim(hashtags), ','), ',') as article_tag
    from blog_030100.blog_article
  ) loop
    blog_040000.blog_cm.add_post_tags(c1.article_id,c1.article_tag,',');
  end loop;
end;
/

-- inserting blog_comments
insert into blog_040000.blog_comments(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,reader_id
  ,post_id
  ,parent_id
  ,body_html
)
select
   comment_id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as changed_tz
  ,changed_by
  ,case when active = 'Y' then 0 else 1 end as is_disabled
  ,user_id
  ,article_id
  ,parent_id
  ,comment_text
from blog_030100.blog_comment t1
where 1 = 1
order by comment_id
/

-- inserting blog_links_grp
insert into blog_040000.blog_links_grp( title, is_disabled, display_seq )
with q1 as(
  select distinct link_type
  from blog_030100.blog_resource
)
select decode( link_type, 'BLOG', 'Blogroll', 'RESOURCE', 'Useful Links') as title
  ,0 as is_disabled
  ,rownum * 10 as resource_grp_seq
from q1
order by 1
/

-- inserting blog_links
insert into blog_040000.blog_links(
   id
  ,row_version
  ,created_on
  ,created_by
  ,changed_on
  ,changed_by
  ,is_disabled
  ,display_seq
  ,link_grp_id
  ,title
  ,link_desc
  ,link_url
)
select link_id
  ,1 as row_version
  ,from_tz(cast(created_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,created_by
  ,from_tz(cast(changed_on as timestamp), 'Europe/Amsterdam') as created_tz
  ,changed_by
  ,case when active = 'Y' then 0 else 1 end as is_disabled
  ,link_seq
  ,(
    select id
    from blog_040000.blog_links_grp
    where 1 = 1
    and decode( link_type, 'BLOG', 'Blogroll', 'RESOURCE', 'Useful Links') = title
   ) as link_grp_id
  ,replace(link_title, '&#39;', '''') as resource_title
  ,replace(trim(regexp_replace(link_text, '<[^>]+>', NULL)), '&#39;', '''') as resource_desc
  ,link_url
from blog_030100.blog_resource
/

begin
  dbms_mview.refresh('BLOG_ARCHIVE_LOV,BLOG_ITEM_INIT,BLOG_POSTS_LAST20', 'CCC');
end;
/
