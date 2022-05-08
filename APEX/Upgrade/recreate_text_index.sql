--  Recreate text index
--------------------------------------------------------
create index blog_post_uds_ctx on blog_post_uds (dummy)
indextype is ctxsys.context parameters (
  'datastore      blog_post_uds_ds
   lexer          blog_post_uds_lx
   section group  ctxsys.auto_section_group
   stoplist       ctxsys.empty_stoplist
   filter         ctxsys.null_filter
   sync           (on commit)'
);
