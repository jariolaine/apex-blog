-- DDL for Foreign Keys
alter table blog_comments add constraint blog_comments_fk1 foreign key (post_id)
  references blog_posts (id) enable
/
alter table blog_comments add constraint blog_comments_fk2 foreign key (parent_id)
  references blog_comments (id) enable
/
alter table blog_comment_flags add constraint blog_comment_flags_fk1 foreign key (comment_id)
  references blog_comments (id) on delete cascade enable
/
alter table blog_comment_sentiments add constraint blog_comment_sentiments_fk1 foreign key (comment_id)
  references blog_comments (id) on delete cascade enable
/
alter table blog_comment_subscribers add constraint blog_comment_subscribers_fk1 foreign key (post_id)
  references blog_posts (id) on delete cascade enable
/
alter table blog_comment_subscribers add constraint blog_comment_subscribers_fk2 foreign key (email_id)
  references blog_subscribers_email (id) on delete cascade enable
/
alter table blog_features add constraint blog_features_fk1 foreign key (build_option_parent)
  references blog_features (build_option_name) enable
/
alter table blog_features add constraint blog_features_fk2 foreign key (ref_build_option_name)
  references blog_features (build_option_name) enable
/
alter table blog_init_items add constraint blog_init_items_fk1 foreign key (item_name)
  references blog_settings (attribute_name) enable
/
alter table blog_links add constraint blog_links_fk1 foreign key (link_group_id)
  references blog_link_groups (id) on delete cascade enable
/
alter table blog_posts add constraint blog_posts_fk1 foreign key (blogger_id)
  references blog_bloggers (id) enable
/
alter table blog_posts add constraint blog_posts_fk2 foreign key (category_id)
  references blog_categories (id) enable
/
alter table blog_post_tags add constraint blog_post_tags_fk1 foreign key (post_id)
  references blog_posts (id) on delete cascade enable
/
alter table blog_post_tags add constraint blog_post_tags_fk2 foreign key (tag_id)
  references blog_tags (id) enable
/
alter table blog_settings add constraint blog_settings_fk1 foreign key (build_option_name)
  references blog_features (build_option_name) enable
/
