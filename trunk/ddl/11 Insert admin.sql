REM INSERTING into BLOG_AUTHOR
SET DEFINE OFF;
INSERT INTO blog_author(
  email
  ,user_name
  ,passwd
  ,author_name
  ,author_seq
) VALUES (
  'admin@axample.org'
  ,'ADMIN'
  ,blog_pw_hash('ADMIN','admin')
  ,'Administrator'
  ,1
);