--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_UDS_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_UDS_POST_TAGS_TRG"
after
insert or
delete on blog_post_tags
for each row
begin

  if inserting
  then

    update blog_posts_uds t1
      set dummy = dummy
    where 1 = 1
    and t1.post_id = :new.post_id
    ;

  elsif deleting
  then

    update blog_posts_uds t1
      set dummy = dummy
    where 1 = 1
    and t1.post_id = :old.post_id
    ;

  end if;

end;
/
