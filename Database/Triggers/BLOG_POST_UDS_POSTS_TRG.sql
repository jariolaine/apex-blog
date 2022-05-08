--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_POSTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POSTS_TRG"
after
insert or
update on blog_posts
for each row
begin

  if inserting
  then

    insert into blog_post_uds( post_id )
      values ( :new.id )
    ;

  elsif updating
  then

    update blog_post_uds t1
      set dummy = dummy
    where 1 = 1
    and t1.post_id  = :new.id
    ;

  end if;

end;
/
