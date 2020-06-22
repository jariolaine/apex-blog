--------------------------------------------------------
--  DDL for Trigger BLOG_PAGES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_PAGES_TRG"
before
insert or
update on blog_pages
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
        :new.created_by
      , sys_context( 'APEX$SESSION', 'APP_USER' )
      , sys_context( 'USERENV','PROXY_USER' )
      , sys_context( 'USERENV','SESSION_USER' )
    );
  elsif updating then
    :new.row_version := coalesce(
        :new.row_version
      , coalesce( :old.row_version, 0 ) + 1
    );
  end if;

  :new.changed_on := coalesce( :new.changed_on, localtimestamp );
  :new.changed_by := coalesce(
      :new.changed_by
    , sys_context( 'APEX$SESSION', 'APP_USER' )
    , sys_context( 'USERENV','PROXY_USER' )
    , sys_context( 'USERENV','SESSION_USER' )
  );

end;
/
