--------------------------------------------------------
--  Create text index preferences
--------------------------------------------------------
declare
  l_schema varchar2(256);
begin

  l_schema := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  ctx_ddl.create_preference(
     preference_name  => 'BLOG_POST_UDS_DS'
    ,object_name      => 'USER_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_DS'
    ,attribute_name   => 'PROCEDURE'
    ,attribute_value  => l_schema || '.BLOG_CTX.GENERATE_POST_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_DS'
    ,attribute_name   => 'OUTPUT_TYPE'
    ,attribute_value  => 'CLOB'
  );

  ctx_ddl.create_preference(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,object_name      => 'BASIC_LEXER'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'MIXED_CASE'
    ,attribute_value  => 'NO'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'BASE_LETTER'
    ,attribute_value  => 'YES'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'BASE_LETTER_TYPE'
    ,attribute_value  => 'GENERIC'
  );

end;
/
--------------------------------------------------------
--  Create text index
--------------------------------------------------------
create index blog_posts_ctx on blog_posts(title)
indextype is ctxsys.context parameters(
  'datastore      blog_post_uds_ds
   lexer          blog_post_uds_lx
   section group  ctxsys.auto_section_group
   stoplist       ctxsys.empty_stoplist
   filter         ctxsys.null_filter
   sync           (on commit)'
);
