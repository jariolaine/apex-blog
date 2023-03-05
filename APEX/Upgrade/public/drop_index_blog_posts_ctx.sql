--------------------------------------------------------
--  Drop index BLOG_POST_UDS_CTX
--------------------------------------------------------
declare
  index_not_exists exception;
  pragma exception_init ( index_not_exists, -01418 );
begin
  execute immediate 'drop index blog_posts_ctx force';
exception when index_not_exists then
  null;
end;
/
--------------------------------------------------------
--  Drop text index preferences
--------------------------------------------------------
declare
  ctx_ddl_error exception;
  pragma exception_init ( ctx_ddl_error, -20000 );
begin
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_DS' );
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_LX' );
exception when ctx_ddl_error then
  null;
end;
/
