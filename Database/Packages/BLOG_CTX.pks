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
