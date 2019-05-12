create index blog_posts_ix1
  on blog_posts(category_id, blogger_id, is_disabled, valid_from)
/

create index blog_posts_ctx
  on blog_posts ( body_html )
  indextype is ctxsys.context
  parameters ( 'filter ctxsys.null_filter section group ctxsys.html_section_group sync (on commit)' )
/

create index blog_comments_ix1
  on blog_comments(reader_id, post_id)
/

create index blog_links_ix1
  on blog_links(link_grp_id)
/
