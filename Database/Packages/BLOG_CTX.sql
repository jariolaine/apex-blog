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
--    Jari Laine 25.11.2022 - Changed generate_post_datastore remove HTML from post body
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid       in rowid,
    tlob      in out nocopy clob
  );
--------------------------------------------------------------------------------
  procedure generate_comment_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
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
      ctx_datastore
    into tlob
    from blog_v_all_posts v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_post_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_comment_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  )
  as
  begin

    select
      ctx_datastore
    into tlob
    from blog_v_all_comments v1
    where 1 = 1
      and v1.ctx_rid = rid
    ;

  end generate_comment_datastore;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_post_search(
    p_search in varchar2
  ) return varchar2
  as
    l_xml varchar2(32767)
      := '<query><textquery><progression>'
      ||    '<seq>#NORMAL#</seq>'
      ||    '<seq>#WILDCARD#</seq>'
      ||    '<seq>#FUZZY#</seq>'
      || '</progression></textquery></query>'
    ;

    l_search    varchar2(32767);
    l_tokens    apex_t_varchar2;

    function generate_query(
      p_feature in varchar2
    ) return varchar2
    as
      l_token       varchar2(32767);
      l_query       varchar2(32767);
      l_within      apex_t_varchar2;
    begin

      for i in 1 .. l_tokens.count
      loop

        l_token := trim( l_tokens(i) );

        if l_token = 'or'
        then

          l_query := rtrim( l_query, 'and' );
          l_query := rtrim( l_query, 'or' );
          l_query := l_query || 'or';

        elsif l_token is not null
        and l_token not in( 'and', ':' )
        then

          l_within := apex_string.split( l_token, ':' );

          if l_within.count() = 2
          then
            l_query :=
              apex_string.format(
                p_message =>
                  case p_feature
                    when 'FUZZY'    then ' %s fuzzy({%s}) within {%s} and'
                    when 'WILDCARD' then ' %s {%s}%% within {%s} and'
                                    else ' %s {%s} within {%s} and'
                  end
                ,p0 => l_query
                ,p1 => l_within(2)
                ,p2 => l_within(1)
              )
            ;
          else
            l_query :=
              apex_string.format(
                p_message =>
                  case p_feature
                  when 'FUZZY' then ' %s fuzzy({%s}) and'
                  when 'WILDCARD' then ' %s {%s}%% and'
                  else ' %s {%s} and' end
                ,p0 => l_query
                ,p1 => l_token
              )
            ;
          end if;

        end if;

      end loop;

      l_query := rtrim( l_query, 'and' );
      l_query := rtrim( l_query, 'or' );

      return trim( l_query );

    end generate_query;

  begin

    if substr( p_search, 1, 8 ) = 'ORATEXT:'
    then
      l_search := trim( substr( apex_escape.striphtml( p_search ), 9 ) );
    else

      apex_debug.info(
        p_message => 'User search string: %s'
        ,p0 => p_search
      );

      -- remove special characters; irrelevant for full text search
      l_search := apex_escape.striphtml( p_search );
      l_search := regexp_replace( l_search, '[<>{}/()*%&!$?.,;\+#]', ' ');
      l_search := regexp_replace( l_search, '(^[:]+|[:]+$|\s+[:]+|[:]+\s+|[:][:]+)', ' ' );
      l_search := trim( lower( l_search ) );

      apex_debug.info(
        p_message => 'User search string after cleanup: %s'
        ,p0 => l_search
      );

      l_tokens := apex_string.split( l_search, ' ' );

      l_search := generate_query( 'NORMAL' );

      if l_search is not null
      then
        l_search := replace( l_xml, '#NORMAL#', l_search );
        l_search := replace( l_search, '#WILDCARD#', generate_query( 'WILDCARD' ) );
        l_search := replace( l_search, '#FUZZY#', generate_query( 'FUZZY' ) );
      end if;

    end if;

    l_search :=
      case when l_search is null
        then '{ }'
        else l_search
      end
    ;

    apex_debug.info(
      p_message => 'Function get_post_search returns: %s'
      ,p0 => l_search
    );

    return l_search;

  end get_post_search;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CTX";
/
