create or replace package "BLOG_CTX"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package contains procedures for Oracle Text operations, including
--    the generation of text datastores for posts and comments.
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
