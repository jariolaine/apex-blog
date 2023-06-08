--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_CATEGORIES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"
after
update on blog_categories
for each row
begin

-- if category is changed, update blog_posts table text index column
  update blog_posts t1
    set ctx_search = ctx_search
  where 1 = 1
    and :new.title_unique != :old.title_unique
    and t1.category_id = :new.id
  ;

end;
/
