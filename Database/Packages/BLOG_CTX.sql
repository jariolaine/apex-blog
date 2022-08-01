create or replace package "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedures and functions for Oracle text
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 22.06.2020 - Created
--    Jari Laine 30.04.2022 - Changed procedure generate_post_datastore to use XML functions
--    Jari Laine 02.05.2022 - Improved text search query function get_post_search returns
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


create or replace package body "BLOG_CTX"
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
-- none
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
  begin

    select
      xmlserialize( content
        xmlconcat(
           xmlelement( "title", v1.title )
          ,xmlelement( "category", v1.category_title )
          ,xmlelement( "description", v1.post_desc )
          ,case
            when v1.visible_tags is not null
              then xmlelement( "tags", v1.visible_tags )
          end
        )
      ) || '<body>' || v1.body_html || '</body>'
    into tlob
    from blog_v_all_posts v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_search(
    p_search in varchar2
  ) return varchar2
  as
    c_xml constant varchar2(32767)
      := '<query><textquery><progression>'
      ||    '<seq>#NORMAL#</seq>'
      ||    '<seq>#WILDCARD#</seq>'
      ||    '<seq>#FUZZY#</seq>'
      || '</progression></textquery></query>'
    ;

    l_search    varchar2(32767);
    l_tokens    apex_t_varchar2;

    function generate_query(
      p_feature in varchar2,
      p_combine in varchar2 default null
    ) return varchar2
    as
      l_token   varchar2(32767);
      l_query   varchar2(32767);
    begin

      for i in 1 .. l_tokens.count
      loop

        l_token := trim( l_tokens(i) );

        if l_token is not null
        then

            l_query :=
              apex_string.format(
                p_message =>
                  case p_feature
                  when 'FUZZY' then '%s fuzzy({%s}, 55, 500) %s '
                  when 'WILDCARD' then '%s {%s}%% %s '
                  else '%s {%s} %s ' end
                ,p0 => l_query
                ,p1 => l_token
                ,p2 => case p_combine when 'OR' then 'or' else 'and' end
              )
            ;

        end if;

      end loop;

      if p_combine = 'AND' then
          l_query := substr( l_query, 1, length( l_query ) - 5 );
      else
          l_query := substr( l_query, 1, length( l_query ) - 4 );
      end if;

      return trim( l_query );

    end generate_query;

  begin

    if substr( p_search, 1, 8 ) = 'ORATEXT:'
    then
      l_search := substr( p_search, 9 );
    else

      -- remove special characters; irrelevant for full text search
      l_search := trim( regexp_replace( lower( p_search ), '[<>{}/()*%&!$?.:,;\+#]' ) );

      if l_search is not null
      then

        l_tokens := apex_string.split( l_search, ' ' );

        l_search := c_xml;
        l_search := replace( l_search, '#NORMAL#', generate_query( 'NORMAL' ) );
        l_search := replace( l_search, '#WILDCARD#', generate_query( 'WILDCARD' ) );
        l_search := replace( l_search, '#FUZZY#', generate_query( 'FUZZY' ) );

      end if;

    end if;

    return l_search;

  end get_post_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
