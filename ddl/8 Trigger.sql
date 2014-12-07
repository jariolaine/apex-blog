CREATE OR REPLACE TRIGGER  "BLOG_RESOURCE_TRG" before
INSERT OR
UPDATE ON BLOG_RESOURCE FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.LINK_ID IS NULL THEN
      :NEW.LINK_ID := blog_sgid;
    END IF;
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
  IF updating THEN
    :NEW.changed_on := SYSDATE;
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
END;
/
ALTER TRIGGER  "BLOG_RESOURCE_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_PARAM" before
INSERT OR
UPDATE ON "BLOG_PARAM" FOR EACH row
BEGIN
  IF inserting THEN
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER);
END;


/
ALTER TRIGGER  "BLOG_PARAM" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_LONG_TEXT_TRG" before
INSERT OR
UPDATE ON "BLOG_LONG_TEXT" FOR EACH row
BEGIN
  IF inserting THEN
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER);
END;


/
ALTER TRIGGER  "BLOG_LONG_TEXT_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_FILE_TRG" before
  INSERT OR
  UPDATE ON BLOG_FILE FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.FILE_ID IS NULL THEN
      :NEW.FILE_ID := blog_sgid;
    END IF;
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  :NEW.file_etag := :NEW.file_id || TO_CHAR(:NEW.changed_on, 'JHH24MISS');
  :NEW.file_modified_since := TO_CHAR(SYS_EXTRACT_UTC(CAST(:NEW.changed_on AS TIMESTAMP)), 'FMDy, DD Mon YYYY HH24:MI:SS "GMT"', 'NLS_DATE_LANGUAGE=ENGLISH');
END;


/
ALTER TRIGGER  "BLOG_FILE_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_FAQ_TRG" before
  INSERT OR
  UPDATE ON BLOG_FAQ FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.FAQ_ID IS NULL THEN
      :NEW.FAQ_ID := blog_sgid;
    END IF;
   :NEW.created_by := COALESCE(v('APP_USER'), USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'), USER);
END;


/
ALTER TRIGGER  "BLOG_FAQ_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_CONTACT_MESSAGE_TRG" before
  INSERT OR
  UPDATE ON BLOG_CONTACT_MESSAGE FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.CONTACT_ID IS NULL THEN
      :NEW.CONTACT_ID := blog_sgid;
    END IF;
   :NEW.created_by := COALESCE(v('APP_USER'), USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'), USER);
END;

/
ALTER TRIGGER  "BLOG_CONTACT_MESSAGE_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_USER_TRG" before
  INSERT OR
  UPDATE ON BLOG_COMMENT_USER FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.USER_ID IS NULL THEN
      :NEW.USER_ID := blog_sgid;
    END IF;
   :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  
  IF :NEW.BLOCKED = 'Y' THEN
    IF :NEW.BLOCKED_ON IS NULL THEN
      :NEW.BLOCKED_ON := SYSDATE;
    END IF;
  ELSE 
    :NEW.BLOCKED_ON := NULL;
  END IF;
  
END;
/
ALTER TRIGGER  "BLOG_COMMENT_USER_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_TRG" before
  INSERT OR
  UPDATE ON BLOG_COMMENT FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.comment_id IS NULL THEN
      :NEW.comment_id := blog_sgid;
    END IF;
    :NEW.created_by := COALESCE(v('APP_USER'), USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'), USER);
  
  IF :NEW.MODERATED = 'Y' THEN
    IF :NEW.MODERATED_ON IS NULL THEN
      :NEW.MODERATED_ON := SYSDATE;
    END IF;
  ELSE 
    :NEW.MODERATED_ON := NULL;
  END IF;
  
  IF :NEW.NOTIFY_EMAIL_SENT = 'Y' THEN
    IF :NEW.NOTIFY_EMAIL_SENT_ON IS NULL THEN
      :NEW.NOTIFY_EMAIL_SENT_ON := SYSDATE;
    END IF;
  ELSE 
    :NEW.NOTIFY_EMAIL_SENT_ON := NULL;
  END IF;
  
END;
/
ALTER TRIGGER  "BLOG_COMMENT_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_NOTIFY_TRG" before
  INSERT OR
  UPDATE ON BLOG_COMMENT_NOTIFY FOR EACH row
BEGIN
  IF inserting THEN
   :NEW.created_by := COALESCE(v('APP_USER'), USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'), USER);
END;


/
ALTER TRIGGER  "BLOG_COMMENT_NOTIFY_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_COMMENT_BLOCK_TRG" before
  INSERT OR
  UPDATE ON BLOG_COMMENT_BLOCK FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.BLOCK_ID IS NULL THEN
      :NEW.BLOCK_ID := blog_sgid;
    END IF;
   :NEW.created_by := COALESCE(v('APP_USER'), USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'), USER);
END;


/
ALTER TRIGGER  "BLOG_COMMENT_BLOCK_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_CATEGORY_TRG" before
INSERT OR
UPDATE ON BLOG_CATEGORY FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.category_id IS NULL THEN
      :NEW.category_id := blog_sgid;
    END IF;
   :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER); 
END;


/
ALTER TRIGGER  "BLOG_CATEGORY_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_AUTHOR_TRG" before
  INSERT OR
  UPDATE OR
  DELETE ON BLOG_AUTHOR FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.AUTHOR_ID IS NULL THEN
      -- Author is inserted to users table as blocked.
      -- Name who post comment can be then queried from one table.
      -- Also it prevent commenting using author email address.
      INSERT INTO blog_comment_user (email, nick_name, blocked, blocked_on, user_type)
      VALUES (:NEW.email, :NEW.author_name, 'Y', SYSDATE, 'A')
      RETURNING user_id INTO :NEW.author_id
      ;
    END IF;
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
  IF updating THEN
    :NEW.changed_on := SYSDATE;
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
    UPDATE blog_comment_user SET
      nick_name = :NEW.author_name,
      email     = :NEW.email
    WHERE user_id = :OLD.author_id
    ;
  END IF;
  IF deleting THEN
    DELETE FROM blog_comment_user
    WHERE user_id = :OLD.author_id
    ;
  END IF;
END;
/
ALTER TRIGGER  "BLOG_AUTHOR_TRG" ENABLE
/
CREATE OR REPLACE TRIGGER  "BLOG_ARTICLE_TRG" before
INSERT OR
UPDATE ON BLOG_ARTICLE FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.article_id IS NULL THEN
      :NEW.article_id := blog_sgid;
    END IF;
    :NEW.created_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.changed_on := SYSDATE;
  :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  -- Do calculations ready
  :NEW.year_month_num := TO_NUMBER(TO_CHAR(:NEW.created_on,'YYYYMM'));
  :NEW.article_length := COALESCE(dbms_lob.getlength(:NEW.article_text), 0);
END;
/
ALTER TRIGGER  "BLOG_ARTICLE_TRG" ENABLE
/
