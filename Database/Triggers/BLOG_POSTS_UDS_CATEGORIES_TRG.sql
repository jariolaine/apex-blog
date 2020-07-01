--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_UDS_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_UDS_CATEGORIES_TRG"
after
update on blog_categories
for each row
begin

  if :new.title_unique != :old.title_unique
  then

    update blog_posts_uds t1
      set dummy = dummy
    where 1 = 1
    and exists(
      select 1
      from blog_posts x1
      where 1 = 1
        and x1.category_id = :new.id
        and x1.id = t1.post_id
    )
    ;

  end if;

end;
/
