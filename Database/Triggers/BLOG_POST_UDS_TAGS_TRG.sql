--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"
after
update on blog_tags
for each row
declare
  l_update boolean;
begin

  l_update :=
    case
      when :new.tag_unique != :old.tag_unique
      then true
      when :new.is_active != :old.is_active
      then true
      else false
    end
  ;

  if l_update
  then
    update blog_post_uds t1
      set dummy = dummy
    where 1 = 1
    and exists(
      select 1
      from blog_post_tags x1
      where 1 = 1
        and x1.post_id = t1.post_id
        and x1.tag_id  = :new.id
      )
    ;
  end if;

end;
/
