--------------------------------------------------------
--  DDL for View BLOG_V_POSTS_TAGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_POST_TAGS" ("POST_ID", "TAG_ID", "DISPLAY_SEQ", "TAG", "CHANGED_ON", "TAG_URL", "TAG_HTML1", "TAG_HTML2", "TAG_HTML3") AS
  select
   q1.post_id                         as post_id
  ,q1.tag_id                          as tag_id
  ,q1.display_seq                     as display_seq
  ,q1.tag                             as tag
  ,q1.changed_on                      as changed_on
  ,q1.tag_url                         as tag_url
  -- Generate HTML for tags used in APEX reports
  ,xmlelement( "a"
    ,xmlattributes(
      q1.tag_url        as "href"
      ,'z-search--tags' as "class"
    )
    ,q1.tag
  )                                   as tag_html1
  ,xmlelement( "a"
    ,xmlattributes(
       q1.tag_url       as "href"
      ,q1.tag_class     as "class"
      ,'tag'            as "rel"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                   as tag_html2
  ,xmlelement( "span"
    ,xmlattributes(
      q1.tag_class      as "class"
      ,'tag'            as "rel"
    )
    ,q1.tag_icon
    ,q1.tag_label
  )                                    as tag_html3
from (
  select
     t2.post_id                                                                   as post_id
    ,t2.tag_id                                                                    as tag_id
    ,t2.display_seq                                                               as display_seq
    ,t1.tag                                                                       as tag
    ,greatest(
       t1.changed_on
      ,t2.changed_on
    )                                                                             as changed_on
    ,blog_url.get_tag(
      p_tag_id => t1.id
    )                                                                             as tag_url
    ,'t-Button t-Button--icon t-Button--large t-Button--noUI t-Button--iconLeft'  as tag_class
    ,xmlelement( "span"
      ,xmlattributes(
        't-Icon fa fa-tag'  as "class"
        ,'true'             as "aria-hidden"
      )
    )                                                                             as tag_icon
    ,xmlelement( "span"
      ,xmlattributes(
        't-Button-label'    as "class"
      )
      ,t1.tag
    )                                                                             as tag_label
  from blog_tags t1
  join blog_post_tags t2 on t1.id = t2.tag_id
  where 1 = 1
    and t1.is_active = 1
    and t2.is_active = 1
) q1
with read only
/
