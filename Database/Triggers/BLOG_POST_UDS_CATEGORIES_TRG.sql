--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"
after
update on blog_categories
for each row
begin

  -- if category change update post user datastore table
  if :new.title != :old.title
  then

    update blog_posts t1
      set title = title
    where 1 = 1
      and t1.category_id = :new.id
    ;

  end if;

end;
/
