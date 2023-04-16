--------------------------------------------------------
--  Create text index preferences for index BLOG_POSTS_CTX
--------------------------------------------------------
begin

  ctx_ddl.create_preference(
     preference_name  => 'BLOG_POSTS_UDS'
    ,object_name      => 'USER_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_UDS'
    ,attribute_name   => 'OUTPUT_TYPE'
    ,attribute_value  => 'CLOB'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_UDS'
    ,attribute_name   => 'PROCEDURE'
    ,attribute_value  =>
      apex_string.format(
        p_message => '%s.BLOG_CTX.GENERATE_POST_DATASTORE'
        ,p0 => sys_context( 'USERENV', 'CURRENT_SCHEMA' )
      )
  );

end;
/
--------------------------------------------------------
--  Create text index BLOG_POSTS_CTX
--------------------------------------------------------
create index blog_posts_ctx on blog_posts( ctx_search )
indextype is ctxsys.context parameters(
  'datastore      blog_posts_uds
   lexer          ctxsys.default_lexer
   section group  ctxsys.auto_section_group
   stoplist       ctxsys.empty_stoplist
   filter         ctxsys.null_filter
   sync           (on commit)'
);
