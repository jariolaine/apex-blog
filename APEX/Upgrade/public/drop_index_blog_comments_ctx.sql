--------------------------------------------------------
--  Drop index BLOG_COMMENTS_CTX
--------------------------------------------------------
declare
  index_not_exists exception;
  pragma exception_init ( index_not_exists, -01418 );
begin
  execute immediate 'drop index blog_comments_ctx force';
exception when index_not_exists then
  null;
end;
/
--------------------------------------------------------
--  Drop text index BLOG_COMMENTS_CTX preferences
--------------------------------------------------------
declare
  ctx_ddl_error exception;
  pragma exception_init ( ctx_ddl_error, -20000 );
begin
  ctx_ddl.drop_preference( 'BLOG_COMMENTS_UDS' );
exception when ctx_ddl_error then
  null;
end;
/
