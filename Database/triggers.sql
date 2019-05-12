drop sequence blog_seq
/
create sequence blog_seq
increment by 1 start with 100001
/

drop sequence blog_posts_seq
/
create sequence blog_posts_seq
increment by 1 start with 100001 nocache order
/

drop sequence blog_cats_seq
/
create sequence blog_cats_seq
increment by 1 start with 100001 nocache order
/

create or replace trigger blog_posts_trg
before
insert or
update on blog_posts
for each row
declare
begin

  if inserting then
    :new.id := coalesce(
       :new.id
      ,to_number( to_char( localtimestamp, 'YYYYMMDDHH24MI' ) || to_char( blog_posts_seq.nextval ) )
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

  if :new.valid_from is null then
    :new.valid_from := :new.created_on;
  end if;

  :new.year_month     := to_number( to_char( :new.created_on, 'YYYYMM' ));
  :new.body_length := coalesce( sys.dbms_lob.getlength( :new.body_html ), 0 );

end;
/

create or replace trigger blog_cats_trg
before
insert or
update on blog_cats
for each row
begin

  if inserting then
    :new.id  := coalesce(
      :new.id
      ,to_number( to_char( localtimestamp, 'YYYYMMDDHH24MI' ) || to_char( blog_cats_seq.nextval ) )
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/


create or replace trigger blog_comments_trg
before
insert or
update on blog_comments
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;
end;
/

create or replace trigger blog_files_trg
before
insert or
update on blog_files
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

  :new.file_size := coalesce( dbms_lob.getlength( :new.blob_content ), 0 );
	:new.etag :=
       to_char( :new.id )
    || to_char( sys_extract_utc( :new.changed_on ), 'YYYYMMDDHH24MISSFF6' )
  ;
  :new.modified :=
    to_char(
      sys_extract_utc( :new.changed_on )
      ,'fmDy, DD Mon YYYY HH24:MI:SS "GMT"'
      ,'NLS_DATE_LANGUAGE=ENGLISH'
    );

end;
/


create or replace trigger blog_params_trg
before
insert or
update on blog_params
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/


create or replace trigger blog_links_trg
before
insert or
update on blog_links
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/

create or replace trigger blog_links_grp_trg
before
insert or
update on blog_links_grp
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/

create or replace trigger blog_readers_trg
before
insert or
update on blog_readers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/

create or replace trigger blog_tags_trg
before
insert or
update on blog_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/

create or replace trigger blog_posts_tags_trg
before
insert or
update on blog_posts_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    :new.changed_on   := coalesce( :new.changed_on, localtimestamp );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
    :new.changed_on   := localtimestamp;
    :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
  end if;

end;
/

create or replace trigger blog_bloggers_trg
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
      :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
      :new.changed_by   := coalesce( :new.changed_by, sys_context( 'APEX$SESSION', 'APP_USER' ), user );
      :new.changed_on   := coalesce( :new.changed_on, localtimestamp );

    elsif updating then
      :new.row_version  := :old.row_version + 1;
      :new.changed_on   := localtimestamp;
      :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), user );
    end if;

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
