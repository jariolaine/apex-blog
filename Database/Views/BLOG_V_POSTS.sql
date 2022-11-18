--------------------------------------------------------
--  DDL for View BLOG_V_POSTS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POSTS" ("POST_ID", "CATEGORY_ID", "BLOGGER_ID", "BLOGGER_NAME", "POST_TITLE", "CATEGORY_TITLE", "POST_DESC", "FIRST_PARAGRAPH", "BODY_HTML", "PUBLISHED_ON", "CHANGED_ON", "ARCHIVE_YEAR_MONTH", "ARCHIVE_YEAR", "CATEGORY_SEQ", "RN", "POST_URL", "TAGS_HTML1", "TAGS_HTML2") AS
  select
   t1.id                                                as post_id
  ,t3.id                                                as category_id
  ,t2.id                                                as blogger_id
  ,t2.blogger_name                                      as blogger_name
  ,t1.title                                             as post_title
  ,t3.title                                             as category_title
  ,t1.post_desc                                         as post_desc
  ,t1.first_paragraph                                   as first_paragraph
  ,t1.body_html                                         as body_html
  ,t1.published_on                                      as published_on
  ,greatest(
     t1.published_on
    ,t1.changed_on
    ,t2.changed_on
  )                                                     as changed_on
  ,t1.archive_year_month                                as archive_year_month
  ,t1.archive_year                                      as archive_year
  ,t3.display_seq                                       as category_seq
  -- for view BLOG_V_POSTS_LAST20
  ,row_number() over ( order by t1.published_on desc )  as rn
  -- generate post URL
  ,blog_url.get_post(
     p_post_id => t1.id
  )                                                     as post_url
  -- post tags link HTML 1
  ,(
    select
      listagg(
        xmlserialize( content
          xmlelement( "a"
            ,xmlattributes(
              blog_url.get_tag(
                 p_tag_id => lkp.tag_id
              )                                                 as "href"
              ,'margin-bottom-md margin-left-sm z-search--tags' as "class"
            )
            ,lkp.tag
          )
        )
        ,','
      ) within group( order by lkp.display_seq )
    from blog_v_post_tags lkp
    where 1 = 1
      and lkp.post_id = t1.id
  )                                                     as tags_html1
  -- post tags link HTML 2
  ,(
    select
      xmlserialize( content
        xmlagg(
          xmlelement( "a"
            ,xmlattributes(
              blog_url.get_tag(
                p_tag_id => lkp.tag_id
              )                                                                           as "href"
              ,'t-Button t-Button--icon t-Button--noUI t-Button--iconLeft margin-top-md'  as "class"
            )
            ,xmlelement( "span"
              ,xmlattributes(
                't-Icon fa fa-tag'                                                        as "class"
                ,'true'                                                                   as "aria-hidden"
              )
            )
            ,xmlelement( "span"
              ,xmlattributes(
                't-Button-label'                                                          as "class"
              )
              ,lkp.tag
            )
          ) order by lkp.display_seq
        )
      )
    from blog_v_post_tags lkp
    where 1 = 1
      and lkp.post_id = t1.id
  )                                                     as tags_html2
from blog_posts t1
join blog_bloggers t2
  on t1.blogger_id  = t2.id
join blog_categories t3
  on t1.category_id = t3.id
where 1 = 1
  and t1.is_active = 1
  and t2.is_active = 1
  and t3.is_active = 1
  and t1.published_on <= current_timestamp
with read only
/
