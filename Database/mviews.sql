-- create materialized views
-- materialized view blog_posts_last20
drop materialized view blog_posts_last20
/
create materialized view blog_posts_last20
nologging
pctfree 0
using no index
refresh on demand complete
as
with qry as (
  select /*+ FIRST_ROWS(20) */
     row_number() over ( order by t1.created_on desc ) as rn
    ,t1.post_id
    ,t1.post_title
    ,t1.post_desc
    ,t1.blogger_name
    ,t1.category_title
    ,t1.created_on
  from blog_v_posts t1
)
select
  qry.post_id                             as post_id,
  qry.created_on                          as created_on,
  qry.rn                                  as display_seq,
  qry.blogger_name                        as blogger_name,
  apex_escape.html( qry.post_title )      as post_title,
  apex_escape.html( qry.post_desc )       as post_desc,
  apex_escape.html( qry.category_title )  as category_title,

  qry.post_title                          as rss_title,
  qry.post_desc                           as rss_desc,
  qry.category_title                      as rss_category,
  to_char(
    sys_extract_utc( qry.created_on ),
    'Dy, DD Mon YYYY HH24:MI:SS "GMT"',
    'NLS_DATE_LANGUAGE=ENGLISH'
  )                                       as pubdate
from qry
where 1 = 1
and qry.rn <= 20
order by qry.rn
/
alter table blog_posts_last20
add constraint blog_posts_last20_pk
primary key ( post_id )
/
alter table blog_posts_last20 modify(
   display_seq    not null
  ,post_title     not null
  ,post_desc      not null
  ,category_title not null
  --,rss_title      not null
  --,rss_desc       not null
  --,rss_category   not null
  ,pubdate        not null
)
/

-- materialized view blog_archive_lov
drop materialized view blog_archive_lov
/
create materialized view blog_archive_lov
nologging
pctfree 0
using no index
refresh on demand complete
as
select t1.year_month
  ,count( t1.post_id ) as posts_count
from blog_v_posts t1
where 1 = 1
group by t1.year_month
order by 1
/
alter table blog_archive_lov
add constraint blog_archive_lov_pk
primary key(year_month)
/
alter table blog_archive_lov
modify posts_count not null
/

-- materialized view blog_items_init
drop materialized view blog_items_init
/
create materialized view blog_items_init
on prebuilt table
using no index
refresh on demand complete
as
with item as (
  select a.application_id
    ,a.item_name
  from apex_application_items a
  where 1 = 1
  union all
   select b.application_id
    ,b.item_name
  from apex_application_page_items b
  where 1 = 1
)
, apps as (
  select
    case t1.application_name
      when 'Blog Public Pages'
      then 'G_PUB_APP_ID'
      when 'Blog Administration'
      then 'G_ADMIN_APP_ID'
    end                           as item_name
    ,to_char( t1.application_id ) as item_value
  from apex_applications t1
  where 1 = 1
  and t1.application_group = blog_util.get_param_value( 'APP_GROUP' )
)
select i.application_id   as application_id
  ,i.item_name            as item_name
  ,p.param_value          as item_value
from item i
join blog_params p
  on i.item_name = p.param_name
where 1 = 1
and p.param_value is not null

union all

select i.application_id
  ,p.item_name
  ,p.item_value
from item i
join apps p
  on i.item_name = p.item_name
where 1 = 1
/

begin
  dbms_mview.refresh('BLOG_ITEMS_INIT', 'C');
end;
/
-- end materialized views
