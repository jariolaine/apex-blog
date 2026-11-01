-- DDL for foreign key indexes
create index blog_comments_ix1 on blog_comments (post_id)
/
create index blog_comments_ix2 on blog_comments (parent_id)
/
create index blog_comment_subscribers_ix1 on blog_comment_subscribers (email_id)
/
create index blog_features_ix1 on blog_features (build_option_parent)
/
create index blog_features_ix2 on blog_features (ref_build_option_name)
/
create index blog_init_items_ix1 on blog_init_items (item_name)
/
create index blog_posts_ix1 on blog_posts (blogger_id)
/
create index blog_posts_ix2 on blog_posts (category_id)
/
create index blog_post_tags_ix1 on blog_post_tags (tag_id)
/
create index blog_settings_ix1 on blog_settings (build_option_name)
/
