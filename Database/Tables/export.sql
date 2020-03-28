--------------------------------------------------------
--  File created - Wednesday-February-26-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BLOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 103279 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BLOG_POSTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BLOG_POSTS_SEQ"  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 15 NOCACHE  ORDER  CYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table BLOG_BLOGGERS
--------------------------------------------------------

  CREATE TABLE "BLOG_BLOGGERS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"IS_ADMIN" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"BLOGGER_NAME" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"USERNAME" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"PASSWD" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"EMAIL" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"BIO" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "BLOG_CATEGORIES"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"TITLE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"TITLE_UNIQUE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP" GENERATED ALWAYS AS (UPPER("TITLE")) VIRTUAL ,
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_COMMENTS
--------------------------------------------------------

  CREATE TABLE "BLOG_COMMENTS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"READER_ID" NUMBER(38,0),
	"POST_ID" NUMBER(38,0),
	"PARENT_ID" NUMBER(38,0),
	"BODY_HTML" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_FILES
--------------------------------------------------------

  CREATE TABLE "BLOG_FILES"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"IS_DOWNLOAD" NUMBER(1,0),
	"FILE_PATH" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"FILE_NAME" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"MIME_TYPE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"BLOB_CONTENT" BLOB,
	"FILE_SIZE" NUMBER(38,0),
	"FILE_CHARSET" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"FILE_DESC" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"FILE_LOCATION" VARCHAR2(512 CHAR) COLLATE "USING_NLS_COMP" GENERATED ALWAYS AS ("FILE_PATH"||"FILE_NAME") VIRTUAL ,
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_LINK_GROUPS
--------------------------------------------------------

  CREATE TABLE "BLOG_LINK_GROUPS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"TITLE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"TITLE_UNIQUE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP" GENERATED ALWAYS AS (UPPER("TITLE")) VIRTUAL ,
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_LINKS
--------------------------------------------------------

  CREATE TABLE "BLOG_LINKS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"LINK_GROUP_ID" NUMBER,
	"TITLE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"LINK_DESC" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"LINK_URL" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_POST_PREVIEW
--------------------------------------------------------

  CREATE TABLE "BLOG_POST_PREVIEW"
   (	"ID" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT localtimestamp,
	"POST_TITLE" VARCHAR2(128 CHAR) COLLATE "USING_NLS_COMP",
	"CATEGORY_TITLE" VARCHAR2(128 CHAR) COLLATE "USING_NLS_COMP",
	"BODY_HTML" CLOB COLLATE "USING_NLS_COMP",
	"TAGS" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_POSTS
--------------------------------------------------------

  CREATE TABLE "BLOG_POSTS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"BLOGGER_ID" NUMBER(38,0),
	"CATEGORY_ID" NUMBER(38,0),
	"TITLE" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"POST_DESC" VARCHAR2(1024 CHAR) COLLATE "USING_NLS_COMP",
	"BODY_HTML" CLOB COLLATE "USING_NLS_COMP",
	"FIRST_PARAGRAPH" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"VALID_FROM" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"BODY_LENGTH" NUMBER(38,0),
	"YEAR_MONTH" NUMBER(6,0),
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_POSTS_TAGS
--------------------------------------------------------

  CREATE TABLE "BLOG_POSTS_TAGS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"POST_ID" NUMBER(38,0),
	"TAG_ID" NUMBER(38,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_READERS
--------------------------------------------------------

  CREATE TABLE "BLOG_READERS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"READER_NAME" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"EMAIL" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_SETTINGS
--------------------------------------------------------

  CREATE TABLE "BLOG_SETTINGS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_NULLABLE" NUMBER(1,0),
	"DISPLAY_SEQ" NUMBER(10,0),
	"PARAM_NAME" VARCHAR2(64 CHAR) COLLATE "USING_NLS_COMP",
	"DATA_TYPE" VARCHAR2(64 CHAR) COLLATE "USING_NLS_COMP",
	"GROUP_NAME" VARCHAR2(64 CHAR) COLLATE "USING_NLS_COMP",
	"PARAM_VALUE" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"PARENT_NAME" VARCHAR2(64 CHAR) COLLATE "USING_NLS_COMP",
	"VALIDATION_EXP" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP",
	"PROCESS_EXP" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Table BLOG_TAGS
--------------------------------------------------------

  CREATE TABLE "BLOG_TAGS"
   (	"ID" NUMBER(38,0),
	"ROW_VERSION" NUMBER(38,0),
	"CREATED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CREATED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"CHANGED_ON" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"CHANGED_BY" VARCHAR2(256 CHAR) COLLATE "USING_NLS_COMP",
	"IS_ACTIVE" NUMBER(1,0),
	"TAG" VARCHAR2(64 CHAR) COLLATE "USING_NLS_COMP",
	"NOTES" VARCHAR2(4000 CHAR) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" ;
--------------------------------------------------------
--  DDL for Index BLOG_BLOGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_BLOGGERS_PK" ON "BLOG_BLOGGERS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_BLOGGERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_BLOGGERS_UK1" ON "BLOG_BLOGGERS" ("BLOGGER_NAME")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_BLOGGERS_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_BLOGGERS_UK2" ON "BLOG_BLOGGERS" ("USERNAME")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_CATEGORIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_CATEGORIES_PK" ON "BLOG_CATEGORIES" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_CATEGORIES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_CATEGORIES_UK1" ON "BLOG_CATEGORIES" ("TITLE_UNIQUE")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_COMMENTS_IX1
--------------------------------------------------------

  CREATE INDEX "BLOG_COMMENTS_IX1" ON "BLOG_COMMENTS" ("READER_ID", "IS_ACTIVE")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_COMMENTS_IX2
--------------------------------------------------------

  CREATE INDEX "BLOG_COMMENTS_IX2" ON "BLOG_COMMENTS" ("POST_ID", "IS_ACTIVE")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_COMMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_COMMENTS_PK" ON "BLOG_COMMENTS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_FILES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_FILES_PK" ON "BLOG_FILES" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_FILES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_FILES_UK1" ON "BLOG_FILES" ("FILE_LOCATION")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_FILES_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_FILES_UK2" ON "BLOG_FILES" ("FILE_NAME", "FILE_PATH")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LINKS_GRP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_LINKS_GRP_PK" ON "BLOG_LINK_GROUPS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LINK_GROUPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_LINK_GROUPS_UK1" ON "BLOG_LINK_GROUPS" ("TITLE_UNIQUE")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LINK_GROUPS_IX1
--------------------------------------------------------

  CREATE INDEX "BLOG_LINK_GROUPS_IX1" ON "BLOG_LINK_GROUPS" ("IS_ACTIVE", "DISPLAY_SEQ")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LINKS_IX1
--------------------------------------------------------

  CREATE INDEX "BLOG_LINKS_IX1" ON "BLOG_LINKS" ("LINK_GROUP_ID", "IS_ACTIVE", "DISPLAY_SEQ")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LINKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_LINKS_PK" ON "BLOG_LINKS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POST_PREVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_POST_PREVIEW_PK" ON "BLOG_POST_PREVIEW" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_CTX
--------------------------------------------------------

  CREATE INDEX "BLOG_POSTS_CTX" ON "BLOG_POSTS" ("BODY_HTML")
   INDEXTYPE IS "CTXSYS"."CONTEXT"  PARAMETERS ('filter ctxsys.null_filter section group ctxsys.html_section_group sync (on commit)');
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_POSTS_PK" ON "BLOG_POSTS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_IX1
--------------------------------------------------------

  CREATE INDEX "BLOG_POSTS_IX1" ON "BLOG_POSTS" ("CATEGORY_ID", "BLOGGER_ID", "IS_ACTIVE", "YEAR_MONTH")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_IX2
--------------------------------------------------------

  CREATE INDEX "BLOG_POSTS_IX2" ON "BLOG_POSTS" ("VALID_FROM" DESC)
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_TAGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_POSTS_TAGS_PK" ON "BLOG_POSTS_TAGS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_TAGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_POSTS_TAGS_UK1" ON "BLOG_POSTS_TAGS" ("POST_ID", "TAG_ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_TAGS_IX2
--------------------------------------------------------

  CREATE INDEX "BLOG_POSTS_TAGS_IX2" ON "BLOG_POSTS_TAGS" ("TAG_ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_POSTS_TAGS_IX1
--------------------------------------------------------

  CREATE INDEX "BLOG_POSTS_TAGS_IX1" ON "BLOG_POSTS_TAGS" ("POST_ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_READERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_READERS_UK1" ON "BLOG_READERS" ("READER_NAME")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_READERS_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_READERS_UK2" ON "BLOG_READERS" ("EMAIL")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_READERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_READERS_PK" ON "BLOG_READERS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_PARAMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_PARAMS_PK" ON "BLOG_SETTINGS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_PARAMS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_PARAMS_UK1" ON "BLOG_SETTINGS" ("PARAM_NAME")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_TAGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_TAGS_PK" ON "BLOG_TAGS" ("ID")
  ;
--------------------------------------------------------
--  DDL for Index BLOG_TAGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_TAGS_UK1" ON "BLOG_TAGS" ("TAG")
  ;
--------------------------------------------------------
--  DDL for Trigger BLOG_BLOGGERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_BLOGGERS_TRG"
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
ALTER TRIGGER "BLOG_BLOGGERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_CATEGORIES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_CATEGORIES_TRG" before
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
ALTER TRIGGER "BLOG_CATEGORIES_TRG" ENABLE;
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
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context('APEX$SESSION', 'APP_USER'), sys_context('USERENV', 'SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_COMMENTS_TRG" ENABLE;
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
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV', 'SESSION_USER') );

  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.file_path := blog_cm.prepare_file_path(:new.file_path);

  :new.file_size := coalesce( dbms_lob.getlength( :new.blob_content ), 0 );

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV', 'SESSION_USER') );

end;
/
ALTER TRIGGER "BLOG_FILES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_LINK_GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINK_GROUPS_TRG" before
insert or
update on BLOG_LINK_GROUPS
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_LINK_GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_LINKS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINKS_TRG"
before
insert or
update on blog_links
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_LINKS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_POSTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_TRG"
before
insert or
update on blog_posts
for each row
declare
begin

  if inserting then
    :new.id := coalesce( :new.id,
      to_number(to_char(sys_extract_utc(systimestamp), 'YYYYMMDDHH24MISS') || lpad(blog_posts_seq.nextval,4,0))
    );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  if :new.valid_from is null then
    :new.valid_from := localtimestamp;
  end if;

  :new.changed_on := localtimestamp;
  :new.changed_by := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

  :new.first_paragraph  := blog_cm.get_first_paragraph( :new.body_html );
  :new.year_month       := to_number( to_char( :new.valid_from, 'YYYYMM' ));
  :new.body_length      := coalesce( sys.dbms_lob.getlength( :new.body_html ), 0 );

end;
/
ALTER TRIGGER "BLOG_POSTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_POST_TAGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_TAGS_TRG" before
insert or
update on "BLOG_POSTS_TAGS"
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_POST_TAGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_READERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_READERS_TRG"
before
insert or
update on blog_readers
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_READERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SETTINGS_TRG" before
insert or
update on blog_settings
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BLOG_TAGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_TAGS_TRG"
before
insert or
update on blog_tags
for each row
begin

  if inserting then
    :new.id           := coalesce( :new.id, blog_seq.nextval );
    :new.row_version  := coalesce( :new.row_version, 1 );
    :new.created_on   := coalesce( :new.created_on, localtimestamp );
    :new.created_by   := coalesce( :new.created_by, sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );
  elsif updating then
    :new.row_version  := :old.row_version + 1;
  end if;

  :new.changed_on   := localtimestamp;
  :new.changed_by   := coalesce( sys_context( 'APEX$SESSION', 'APP_USER' ), sys_context('USERENV','SESSION_USER') );

end;

/
ALTER TRIGGER "BLOG_TAGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Package BLOG_CM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BLOG_CM"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Content management API
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 10.01.2020 - Added procedure merge_files and file_upload
--    jari Laine 12.01.2020 - Added function prepare_file_path
--
--  TO DO: (search from body TODO#x)
--    #1 - check constraint name that raised dup_val_on_index error
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Called from: admin app pages 14
  function get_category_seq
  return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 18
  function get_link_seq(
    p_link_group_id in number
  ) return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 20
  function get_link_grp_seq
  return number;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_post_tags(
    p_post_id     in number,
    p_sep         in varchar2 default ','
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_category_title(
    p_category_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 17
  function get_link_group_title(
    p_link_group_id in number
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: trigger blog_posts_trg
  function get_first_paragraph(
    p_body_html   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  function get_post_is_active(
    p_request     in varchar2,
    p_is_active   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: trigger blog_files_trg and procedure blog_cm.file_upload
  function prepare_file_path(
    p_file_path   in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: admin app page 22 branch condition
  function file_upload(
    p_file_name   in varchar2,
    p_file_path   in varchar2,
    p_unzip       in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  -- Called from: admin app page 23 and procedure blog_cm.file_upload
  procedure merge_files;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_category(
    p_title       in varchar2,
    p_hash        in varchar2,
    p_category_id out nocopy number
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure add_post_tags(
    p_post_id     in number,
    p_tags        in varchar2,
    p_sep         in varchar2 default ','
  );
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  -- obsolete
  -- page process is commented out
  procedure remove_unused_tags;
--------------------------------------------------------------------------------
  -- Called from: admin app pages 12
  procedure save_post_preview(
    p_id            in number,
    p_tags          in varchar2,
    p_post_title      in varchar2,
    p_category_title  in varchar2,
    p_body_html       in clob
  );
--------------------------------------------------------------------------------
  -- Called from:
  -- not ready
  procedure purge_post_preview;
--------------------------------------------------------------------------------
  -- Called from:
  -- not ready
  procedure purge_post_preview_job(
    p_drop_job    in boolean default false
  );
--------------------------------------------------------------------------------
end "BLOG_CM";

/
-- Unable to render SYNONYM DDL for object PUBLIC.DBMS_LOB with DBMS_METADATA attempting internal generator.
CREATE PUBLIC SYNONYM DBMS_LOB FOR SYS.DBMS_LOB
--------------------------------------------------------
--  Constraints for Table BLOG_BLOGGERS
--------------------------------------------------------

  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("IS_ADMIN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("BLOGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" MODIFY ("PASSWD" NOT NULL ENABLE);
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_CK3" CHECK (is_admin in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_CK4" CHECK (display_seq > 0) ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_UK1" UNIQUE ("BLOGGER_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_UK2" UNIQUE ("USERNAME")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_CK2" CHECK (is_active in(0 ,1)) ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" MODIFY ("TITLE_UNIQUE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORIES" ADD CONSTRAINT "BLOG_CATEGORIES_UK1" UNIQUE ("TITLE_UNIQUE")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_CATEGORIES" ADD CONSTRAINT "BLOG_CATEGORIES_CK2" CHECK (is_active in(0 ,1)) ENABLE;
  ALTER TABLE "BLOG_CATEGORIES" ADD CONSTRAINT "BLOG_CATEGORIES_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_CATEGORIES" ADD CONSTRAINT "BLOG_CATEGORIES_CK3" CHECK (display_seq > 0) ENABLE;
  ALTER TABLE "BLOG_CATEGORIES" ADD CONSTRAINT "BLOG_CATEGORIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_COMMENTS
--------------------------------------------------------

  ALTER TABLE "BLOG_COMMENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("READER_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("POST_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" MODIFY ("BODY_HTML" NOT NULL ENABLE);
  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENT_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENT_CK2" CHECK (is_active in(0 ,1)) ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_FILES
--------------------------------------------------------

  ALTER TABLE "BLOG_FILES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("IS_DOWNLOAD" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("MIME_TYPE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("BLOB_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" MODIFY ("FILE_SIZE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_CK3" CHECK (is_download in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_CK4" CHECK (file_size > 0) ENABLE;
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_FILES" MODIFY ("FILE_LOCATION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_CK2" CHECK (is_active in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_FILES" MODIFY ("FILE_PATH" NOT NULL ENABLE);
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_UK2" UNIQUE ("FILE_NAME", "FILE_PATH")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_FILES" ADD CONSTRAINT "BLOG_FILES_UK1" UNIQUE ("FILE_LOCATION")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_LINK_GROUPS
--------------------------------------------------------

  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" ADD CONSTRAINT "BLOG_LINK_GROUPS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_LINK_GROUPS" ADD CONSTRAINT "BLOG_LINK_GROUPS_CK3" CHECK (display_seq > 0) ENABLE;
  ALTER TABLE "BLOG_LINK_GROUPS" ADD CONSTRAINT "BLOG_LINK_GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX (CREATE UNIQUE INDEX "BLOG_LINKS_GRP_PK" ON "BLOG_LINK_GROUPS" ("ID")
  )  ENABLE;
  ALTER TABLE "BLOG_LINK_GROUPS" ADD CONSTRAINT "BLOG_LINK_GROUPS_CK2" CHECK (is_active in(0 ,1)) ENABLE;
  ALTER TABLE "BLOG_LINK_GROUPS" MODIFY ("TITLE_UNIQUE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINK_GROUPS" ADD CONSTRAINT "BLOG_LINK_GROUPS_UK1" UNIQUE ("TITLE_UNIQUE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_LINKS
--------------------------------------------------------

  ALTER TABLE "BLOG_LINKS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("LINK_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("LINK_DESC" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" MODIFY ("LINK_URL" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_CK2" CHECK (is_active in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_CK3" CHECK (display_seq > 0) ENABLE;
  ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_POST_PREVIEW
--------------------------------------------------------

  ALTER TABLE "BLOG_POST_PREVIEW" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST_PREVIEW" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST_PREVIEW" ADD CONSTRAINT "BLOG_POST_PREVIEW_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_POSTS
--------------------------------------------------------

  ALTER TABLE "BLOG_POSTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("BLOGGER_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("POST_DESC" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("BODY_HTML" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("FIRST_PARAGRAPH" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("VALID_FROM" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("BODY_LENGTH" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" MODIFY ("YEAR_MONTH" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_CK3" CHECK (body_length > 0) ENABLE;
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_CK2" CHECK (is_active in(0 ,1)) ENABLE;
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_CK4" CHECK (year_month between 190001 and 999912) ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_POSTS_TAGS
--------------------------------------------------------

  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("POST_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" MODIFY ("TAG_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_CK3" CHECK (display_seq > 0) ENABLE;
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_UK1" UNIQUE ("POST_ID", "TAG_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_CK2" CHECK (is_active in(0, 1)) ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_READERS
--------------------------------------------------------

  ALTER TABLE "BLOG_READERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" MODIFY ("READER_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_READERS" ADD CONSTRAINT "BLOG_READERS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_READERS" ADD CONSTRAINT "BLOG_READERS_CK2" CHECK (is_active in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_READERS" ADD CONSTRAINT "BLOG_READERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_READERS" ADD CONSTRAINT "BLOG_READERS_UK1" UNIQUE ("READER_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_READERS" ADD CONSTRAINT "BLOG_READERS_UK2" UNIQUE ("EMAIL")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_SETTINGS
--------------------------------------------------------

  ALTER TABLE "BLOG_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("IS_NULLABLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("DISPLAY_SEQ" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("PARAM_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("DATA_TYPE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK01" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK02" CHECK (is_nullable in(0, 1)) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK06" CHECK (group_name in('UI', 'SEO', 'RSS', 'COMMENTS','INTERNAL')) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK05" CHECK (data_type in('BOOLEAN', 'INTEGER', 'STRING', 'TEXT')) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK07" CHECK (
    (is_nullable = 1) or
    (is_nullable = 0 and param_value is not null)
  ) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK08" CHECK (
    (data_type != 'BOOLEAN') or
    (data_type = 'BOOLEAN' and is_nullable = 0 and round(to_number(param_name)) in(0, 1))
  ) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK09" CHECK (
    (data_type != 'INTEGER') or
    (data_type = 'INTEGER' and param_value = round(to_number(param_value)))
  ) ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_PK" PRIMARY KEY ("ID")
  USING INDEX (CREATE UNIQUE INDEX "BLOG_PARAMS_PK" ON "BLOG_SETTINGS" ("ID")
  )  ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_UK1" UNIQUE ("PARAM_NAME")
  USING INDEX (CREATE UNIQUE INDEX "BLOG_PARAMS_UK1" ON "BLOG_SETTINGS" ("PARAM_NAME")
  )  ENABLE;
  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_CK03" CHECK (display_seq >= 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_TAGS
--------------------------------------------------------

  ALTER TABLE "BLOG_TAGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("ROW_VERSION" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("CHANGED_ON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("CHANGED_BY" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("IS_ACTIVE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" MODIFY ("TAG" NOT NULL ENABLE);
  ALTER TABLE "BLOG_TAGS" ADD CONSTRAINT "BLOG_TAGS_CK2" CHECK (is_active in(0 ,1)) ENABLE;
  ALTER TABLE "BLOG_TAGS" ADD CONSTRAINT "BLOG_TAGS_CK1" CHECK (row_version > 0) ENABLE;
  ALTER TABLE "BLOG_TAGS" ADD CONSTRAINT "BLOG_TAGS_CK3" CHECK (tag = trim (tag)) ENABLE;
  ALTER TABLE "BLOG_TAGS" ADD CONSTRAINT "BLOG_TAGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_TAGS" ADD CONSTRAINT "BLOG_TAGS_UK1" UNIQUE ("TAG")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_BLOGGERS
--------------------------------------------------------

  ALTER TABLE "BLOG_BLOGGERS" ADD CONSTRAINT "BLOG_BLOGGERS_FK1" FOREIGN KEY ("ID")
	  REFERENCES "BLOG_READERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_COMMENTS
--------------------------------------------------------

  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_FK1" FOREIGN KEY ("READER_ID")
	  REFERENCES "BLOG_READERS" ("ID") ENABLE;
  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_FK2" FOREIGN KEY ("POST_ID")
	  REFERENCES "BLOG_POSTS" ("ID") ENABLE;
  ALTER TABLE "BLOG_COMMENTS" ADD CONSTRAINT "BLOG_COMMENTS_FK3" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "BLOG_COMMENTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_LINKS
--------------------------------------------------------

  ALTER TABLE "BLOG_LINKS" ADD CONSTRAINT "BLOG_LINKS_FK1" FOREIGN KEY ("LINK_GROUP_ID")
	  REFERENCES "BLOG_LINK_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_POSTS
--------------------------------------------------------

  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK1" FOREIGN KEY ("BLOGGER_ID")
	  REFERENCES "BLOG_BLOGGERS" ("ID") ENABLE;
  ALTER TABLE "BLOG_POSTS" ADD CONSTRAINT "BLOG_POSTS_FK2" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "BLOG_CATEGORIES" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_POSTS_TAGS
--------------------------------------------------------

  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_FK1" FOREIGN KEY ("POST_ID")
	  REFERENCES "BLOG_POSTS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BLOG_POSTS_TAGS" ADD CONSTRAINT "BLOG_POSTS_TAGS_FK2" FOREIGN KEY ("TAG_ID")
	  REFERENCES "BLOG_TAGS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_SETTINGS
--------------------------------------------------------

  ALTER TABLE "BLOG_SETTINGS" ADD CONSTRAINT "BLOG_SETTINGS_FK1" FOREIGN KEY ("PARENT_NAME")
	  REFERENCES "BLOG_SETTINGS" ("PARAM_NAME") ENABLE;
