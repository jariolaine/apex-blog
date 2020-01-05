--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_TRG
--------------------------------------------------------

CREATE OR REPLACE TRIGGER "BLOG_POSTS_TRG"
before
insert or
update on blog_posts
for each row
declare
begin

  if inserting then
    :new.id := coalesce(
       :new.id
      ,to_number(to_char(sys_extract_utc(systimestamp), 'YYYYMMDDHH24MISS') || lpad(blog_posts_seq.nextval,4,0))
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

  if :new.valid_from is null then
    :new.valid_from := :new.created_on;
  end if;

  :new.year_month  := to_number( to_char( :new.created_on, 'YYYYMM' ));
  :new.body_length := coalesce( sys.dbms_lob.getlength( :new.body_html ), 0 );

end;
/
