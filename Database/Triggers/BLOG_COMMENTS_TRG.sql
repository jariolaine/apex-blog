--------------------------------------------------------
--  DDL for Trigger BLOG_COMMENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENTS_TRG"
before
insert or
update on blog_comments
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := localtimestamp;
    :new.created_by   := coalesce(
       sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV','PROXY_USER' )
      ,sys_context( 'USERENV','SESSION_USER' )
    );

    if blog_globals.get_comment_var is not null
    then
      :new.body_html := blog_globals.get_comment_var;
    end if;

  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV','PROXY_USER' )
    ,sys_context( 'USERENV','SESSION_USER' )
  );

end;
/
ALTER TRIGGER "BLOG_COMMENTS_TRG" ENABLE;
