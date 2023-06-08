--------------------------------------------------------
--  DDL for Trigger BLOG_POST_UDS_POST_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POST_TAGS_TRG"
for
insert or
update or
delete on blog_post_tags
compound trigger

  t_post_id apex_t_number;

  after each row is
  begin

    -- if tag is removed from post, save post id for after statement handling
    if deleting
    then

      apex_string.push( t_post_id, :old.post_id );

    else

    -- if updating or inserting post tag, update blog_posts table text index column
      update blog_posts t1
        set ctx_search = ctx_search
      where 1 = 1
        and t1.id = :new.post_id
      ;

    end if;

  end after each row;

  after statement is
  begin

    -- handle removed tags and update blog_posts table text index column
    update blog_posts t1
      set ctx_search = ctx_search
    where 1 = 1
      and exists(
        select 1
        from table( t_post_id ) x1
        where 1 = 1
          and x1.column_value = t1.id
      )
    ;

  end after statement;

end;
/
