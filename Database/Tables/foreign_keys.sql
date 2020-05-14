--------------------------------------------------------
--  DDL for Foreign Keys
--------------------------------------------------------
alter table blog_comment_subs add constraint blog_comment_subs_fk1 foreign key( post_id )
	 references blog_posts( id ) on delete cascade
/
alter table blog_comment_subs add constraint blog_comment_subs_fk2 foreign key( email_id )
	 references blog_comment_subs_email( id ) on delete cascade
/
alter table blog_comment_flags add constraint blog_comment_flags_fk1 foreign key( comment_id )
	 references blog_comments( id ) on delete cascade
/
alter table blog_post_tags add constraint blog_post_tags_fk2 foreign key( tag_id )
	 references blog_tags( id )
/
alter table blog_post_tags add constraint blog_post_tags_fk1 foreign key( post_id )
	 references blog_posts( id ) on delete cascade
/
alter table blog_posts add constraint blog_posts_fk2 foreign key( category_id )
	 references blog_categories( id )
/
alter table blog_posts add constraint blog_posts_fk1 foreign key( blogger_id )
	 references blog_bloggers( id )
/
alter table blog_comments add constraint blog_comments_fk1 foreign key( post_id )
	 references blog_posts( id ) on delete cascade
/
alter table blog_comments add constraint blog_comments_fk2 foreign key( parent_id )
	 references blog_comments( id ) on delete set null
/
alter table blog_links add constraint blog_links_fk1 foreign key( link_group_id )
	 references blog_link_groups( id ) on delete cascade
/
