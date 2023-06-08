--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"
after
update on blog_tags
for each row
begin

  if :new.tag_unique != :old.tag_unique
  or :new.is_active != :old.is_active
  then

  -- if tag is changed, update blog_posts table text index column
    update blog_posts t1
      set ctx_search = ctx_search
    where 1 = 1
    and exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
        and x1.post_id = t1.id
        and x1.tag_id  = :new.id
      )
    ;

  end if;

end;
/
