--------------------------------------------------------
--  DDL for Type BLOG_T_POST
--------------------------------------------------------
CREATE OR REPLACE TYPE "BLOG_T_POST"
authid definer
as object(
  post_id     number(38,0),
  post_title  varchar2(256 char)
);
/
