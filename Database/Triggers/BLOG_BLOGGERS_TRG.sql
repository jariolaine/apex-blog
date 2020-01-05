--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger BLOG_BLOGGERS_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "BLOG_BLOGGERS_TRG"
for
insert or
update on blog_bloggers
compound trigger

  before each row is
  begin

    if inserting then

      if :new.id is null then
      -- Blogger is inserted to readers table.
      -- Posted by for comments can be then queried from one table.
        insert into blog_readers ( email, reader_name )
        values ( :new.email, :new.blogger_name )
        returning id into :new.id
        ;
      end if;

      :new.row_version  := coalesce( :new.row_version, 1 );
      :new.created_on   := coalesce( :new.created_on, localtimestamp );
      :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

    elsif updating then
      :new.row_version := :old.row_version + 1;
    end if;

    :new.changed_on := localtimestamp;
    :new.changed_by := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

  end before each row;


  after each row is
  begin

    if updating then

      update blog_readers
      set reader_name = :new.blogger_name
        ,email = :new.email
      where id = :new.id
      ;

    end if;

  end after each row;

end;
/
