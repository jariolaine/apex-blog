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
  function generate_search(
    p_search  in varchar2,
    p_feature in varchar2,
    p_combine in varchar2
  ) return varchar2
  as
    l_query        varchar2(32767);
    l_clean_token  varchar2(1000);
    l_tokens       apex_application_global.vc_arr2;
  begin

    l_tokens := apex_util.string_to_table( p_search, ' ' );

    for i in 1..l_tokens.count
    loop
      -- remove special characters; irrelevant for full text search
      l_clean_token := lower( regexp_replace( l_tokens( i ), '[<>{}/()*%&!$?.:,;\+#]', '' ) );

      if ltrim( rtrim( l_clean_token ) ) is not null
      then
        if p_feature = 'FUZZY'
        then
          l_query := l_query || 'FUZZY({' || l_clean_token || '}, 50, 500) ';
        elsif p_feature = 'WILDCARD_RIGHT'
        then
          l_query := l_query || l_clean_token || '% ';
        else
          l_query := l_query || '{' || l_clean_token || '} ';
        end if;
        if p_combine = 'OR'
        then
          l_query := l_query || ' or ';
        else
          l_query := l_query || ' and ';
        end if;
      end if;

    end loop;

    if p_combine = 'AND'
    then
      l_query := substr( l_query, 1, length( l_query ) - 5 );
    else
      l_query := substr( l_query, 1, length( l_query ) - 4 );
    end if;

    return ltrim( rtrim( l_query ));

  end generate_search;
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
      || '<POST_TAGS>' || l_row.visible_tags|| '</POST_TAGS>'
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_search(
    p_search in varchar2
  ) return varchar2
  as
    c_xml constant varchar2(32767) := '<query><textquery><progression>' ||
                                        '<seq>  #SEARCH#  </seq>' ||
                                        '<seq> ?#SEARCH#  </seq>' ||
                                        '<seq>  #SEARCH#% </seq>' ||
                                        '<seq> %#SEARCH#% </seq>' ||
                                      '</progression></textquery></query>';
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
