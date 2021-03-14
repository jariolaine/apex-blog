--------------------------------------------------------
--  DDL for View BLOG_V_REP_APP_LINKS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_REP_APP_LINKS" ("DISPLAY_SEQ", "LIST_LABEL", "LIST_LINK", "LIST_ICON") AS
  select 1          as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_HOME'
  )                 as list_label
  ,blog_url.get_tab(
     p_app_id       => attribute_value
    ,p_app_page_id  => 'home'
    ,p_canonical    => 'YES'
  )                 as list_link
  ,'fa-home'        as list_icon
from blog_settings
where 1 = 1
and attribute_name = 'G_PUB_APP_ID'
union all
select 2            as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_SITEMAP'
  )                 as list_label
  ,attribute_value  as list_link
  ,'fa-sitemap'     as list_icon
from blog_settings
where 1 = 1
and attribute_name = 'G_SITEMAP_URL'
union all
select 3            as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_RSS'
  )                 as list_label
  ,attribute_value  as list_link
  ,'fa-rss'         as list_icon
from blog_settings
where 1 = 1
and attribute_name = 'G_RSS_URL'
with read only
/
