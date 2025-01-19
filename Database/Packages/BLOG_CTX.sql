create or replace package "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures for Oracle Text operations, including
--    the generation of text datastores for posts and comments.
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  22.06.2020   Jari Laine     Created package.
--  30.04.2022   Jari Laine     Updated procedure generate_post_datastore to utilize XML functions.
--  02.05.2022   Jari Laine     Improved function get_post_search to enhance text search query handling.
--  25.11.2022   Jari Laine     Updated procedure generate_post_datastore to remove HTML tags from post body.
--  17.07.2024   Jari Laine     Removed obsolete function get_post_search.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure generate_post_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  );
--------------------------------------------------------------------------------
  procedure generate_comment_datastore(
    rid   in rowid,
    tlob  in out nocopy clob
  );
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
end "BLOG_CTX";
/
