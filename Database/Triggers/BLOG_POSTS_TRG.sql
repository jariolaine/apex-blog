--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_TRG"
before
insert or
update on blog_posts
for each row
begin

  if inserting then
    :new.id := coalesce( :new.id,
      to_number( to_char( sys_extract_utc( systimestamp ), 'YYYYMMDDHH24MISSFF6' ) )
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := localtimestamp;
    :new.created_by   := coalesce(
       sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );

  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.published_on := coalesce( :new.published_on, localtimestamp );

  :new.first_paragraph  := blog_cm.get_first_paragraph( :new.body_html );
  :new.year_month       := to_number( to_char( :new.published_on, 'YYYYMM' ));
  :new.body_length      := coalesce( sys.dbms_lob.getlength( :new.body_html ), 0 );

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
       sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );

end;
/
ALTER TRIGGER "BLOG_POSTS_TRG" ENABLE;
