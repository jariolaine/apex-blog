--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_POSTS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POSTS_TRG"
after
insert or
update on blog_posts
for each row
declare
  l_update boolean;
begin

  if inserting
  then

    insert into blog_post_uds( post_id )
      values ( :new.id )
    ;

  elsif updating
  then

    l_update :=
      case
        when :new.category_id != :old.category_id
        then true
        when upper( :new.title ) != upper( :old.title )
        then true
        when upper( :new.post_desc ) != upper( :old.post_desc )
        then true
        when dbms_lob.compare( :new.body_html, :old.body_html ) != 0
        then true
        else false
      end
    ;

    if l_update
    then
      update blog_post_uds t1
        set dummy = dummy
      where 1 = 1
      and t1.post_id  = :new.id
      ;
    end if;

  end if;

end;
/
