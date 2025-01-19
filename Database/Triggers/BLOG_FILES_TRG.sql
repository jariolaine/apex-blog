--------------------------------------------------------
--  DDL for Trigger BLOG_FILES_TRG
--------------------------------------------------------
CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FILES_TRG"
before
insert or
update on blog_files
for each row
begin

  if inserting then

    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce(
      :new.created_by
      ,sys_context( 'APEX$SESSION', 'APP_USER' )
      ,sys_context( 'USERENV', 'PROXY_USER' )
      ,sys_context( 'USERENV', 'SESSION_USER' )
    );

    :new.is_active    := coalesce( :new.is_active, 1 );
    :new.is_download  := coalesce( :new.is_download, 0 );

    :new.mime_type    := coalesce( :new.mime_type, blog_mime.get_mime_type( :new.file_name ) );

  elsif updating then
    :new.row_version := :old.row_version + 1;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce(
     sys_context( 'APEX$SESSION', 'APP_USER' )
    ,sys_context( 'USERENV', 'PROXY_USER' )
    ,sys_context( 'USERENV', 'SESSION_USER' )
  );

  :new.file_size := coalesce( :new.file_size, coalesce( sys.dbms_lob.getlength( :new.blob_content ), 0 ) );

end;
/
