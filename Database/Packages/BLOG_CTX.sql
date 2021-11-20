CREATE OR REPLACE package  "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions Oracle text
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.06.2020 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid       in rowid,
    tlob      in out nocopy clob
  );
--------------------------------------------------------------------------------
  function get_post_search(
    p_search  in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_CTX";
/


CREATE OR REPLACE package body "BLOG_CTX"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- None
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  )
  as
    l_row blog_v_all_posts%rowtype;
  begin

    select *
    into l_row
    from blog_v_all_posts
    where 1 = 1
    and ctx_rid = rid
    ;

    tlob :=
      '<POST_TITLE>' || l_row.title || '</POST_TITLE>'
      || '<POST_CATEGORY>' || l_row.category_title || '</POST_CATEGORY>'
      || '<POST_DESCRIPTION>' || l_row.post_desc || '</POST_DESCRIPTION>'
      || '<POST_BODY>' || l_row.body_html || '</POST_BODY>'
      || '<POST_TAGS>' || l_row.visible_tags || '</POST_TAGS>'
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_search(
    p_search in varchar2
  ) return varchar2
  as
    c_xml constant varchar2(32767)  := '<query><textquery><progression>'
                                    ||    '<seq>  #SEARCH#  </seq>'
                                    ||    '<seq> ?#SEARCH#  </seq>'
                                    ||    '<seq>  #SEARCH#% </seq>'
                                    ||    '<seq> %#SEARCH#% </seq>'
                                    || '</progression></textquery></query>';
    l_search varchar2(32767) := p_search;
  begin

    -- remove special characters; irrelevant for full text search
    l_search := regexp_replace( l_search, '[<>{}/()*%&!$?.:,;\+#]', '' );

    return replace( c_xml, '#SEARCH#', l_search );

  end get_post_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
