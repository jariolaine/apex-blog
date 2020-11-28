--------------------------------------------------------
--  DDL for View BLOG_V_REP_APP_LINKS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_REP_APP_LINKS" ("DISPLAY_SEQ", "LIST_LABEL", "LIST_LINK", "LIST_ICON") AS
  select 1 as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_HOME'
  ) as list_label
  ,blog_url.get_tab(
     p_app_id       => blog_util.get_attribute_value( 'G_PUB_APP_ID' )
    ,p_app_page_id  => 'home'
    ,p_canonical    => 'YES'
  ) as list_link
  ,'fa-home' as list_icon
from dual
union all
select 2 as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_SITEMAP'
  ) as list_label
  ,blog_url.get_tab(
     p_app_id       => blog_util.get_attribute_value( 'G_PUB_APP_ID' )
    ,p_app_page_id  => 'home'
    ,p_request      => 'application_process=sitemapindex.xml'
    ,p_canonical    => 'YES'
  ) as list_link
  ,'fa-sitemap' as list_icon
from dual
union all
select 3 as display_seq
  ,apex_lang.message(
    'BLOG_PUB_APP_LINK_RSS'
  ) as list_label
  ,blog_url.get_tab(
     p_app_id       => blog_util.get_attribute_value( 'G_PUB_APP_ID' )
    ,p_app_page_id  => 'home'
    ,p_request      => 'application_process=rss.xml'
    ,p_canonical    => 'YES'
  ) as list_link
  ,'fa-rss' as list_icon
from dual
/
