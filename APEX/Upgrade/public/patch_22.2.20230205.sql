--  Patch 22.2.20230205
--------------------------------------------------------
--  Drop trigger BLOG_POST_UDS_POSTS_TRG
--------------------------------------------------------
drop trigger blog_post_uds_posts_trg;
--------------------------------------------------------
--  Drop table BLOG_POST_UDS
--------------------------------------------------------
drop table blog_post_uds;
--------------------------------------------------------
--  Drop text index preferences
--------------------------------------------------------
begin
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_DS' );
  ctx_ddl.drop_preference( 'BLOG_POST_UDS_LX' );
end;
/
--------------------------------------------------------
--  Create trigger BLOG_POST_UDS_POST_TAGS_TRG
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

    if deleting
    then

      apex_string.push( t_post_id, :old.post_id );

    else

      update blog_posts t1
        set title = title
      where 1 = 1
        and t1.id = :new.post_id
      ;

    end if;

  end after each row;

  after statement is
  begin

    update blog_posts t1
      set title = title
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
--------------------------------------------------------
--  Alter trigger BLOG_POST_UDS_CATEGORIES_TRG
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
--------------------------------------------------------
--  Alter trigger BLOG_POST_UDS_TAGS_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"
after
update on blog_tags
for each row
begin

  if :new.tag != :old.tag
  or :new.is_active != :old.is_active
  then

    update blog_posts t1
      set title = title
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
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20230205','STRING','INTERNAL','Patch 22.2.20230205')
;
