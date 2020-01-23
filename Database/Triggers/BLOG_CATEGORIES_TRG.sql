--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger BLOG_CATS_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "BLOG_CATEGORIES_TRG"
before
insert or
update on BLOG_CATEGORIES
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV','SESSION_USER') );

end;
/
