-- Jari Laine / 04.01.2015
-- Patch APEX Blogging Platform 2.9.0.2
--
-- Bug #8. https://sourceforge.net/p/apex-blog/tickets/8/
-- Bug #9. https://sourceforge.net/p/apex-blog/tickets/9/
-- Bug #11. https://sourceforge.net/p/apex-blog/tickets/11/
CREATE OR REPLACE TRIGGER blog_file_trg before
 INSERT OR
 UPDATE ON blog_file FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.file_id IS NULL THEN
      :NEW.file_id := blog_sgid;
    END IF;
    IF :NEW.created_by IS NULL THEN
      :NEW.created_by := COALESCE(v('APP_USER'),USER);
    END IF;
    IF :NEW.changed_by IS NULL THEN
      :NEW.changed_by := COALESCE(v('APP_USER'),USER);
    END IF;
  END IF;
  IF updating THEN
    :NEW.changed_on := SYSDATE;
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
  :NEW.file_etag := :NEW.file_id || TO_CHAR(SYS_EXTRACT_UTC(CAST(:NEW.changed_on AS TIMESTAMP)), 'JHH24MISS');
  :NEW.file_modified_since := TO_CHAR(SYS_EXTRACT_UTC(CAST(:NEW.changed_on AS TIMESTAMP)), 'Dy, DD Mon YYYY HH24:MI:SS "GMT"', 'NLS_DATE_LANGUAGE=ENGLISH');
  :NEW.file_size := COALESCE(dbms_lob.getlength(:NEW.blob_content), 0);
END;
/
ALTER TRIGGER blog_file_trg ENABLE
/
-- Rename table
CREATE TABLE BLOG_DELETED_ID
(	DELETED_ID VARCHAR2(256 CHAR) NOT NULL ENABLE, 
ID_SOURCE VARCHAR2(30 CHAR) NOT NULL ENABLE, 
DELETED_ON DATE DEFAULT SYSDATE NOT NULL ENABLE,
CONSTRAINT BLOG_DELETED_ID_PK PRIMARY KEY ("DELETED_ID"), 
CONSTRAINT BLOG_DELETED_ID_CK1 CHECK (ID_SOURCE IN('ARTICLE','CATEGORY')) ENABLE
)
/
INSERT INTO BLOG_DELETED_ID(DELETED_ID,ID_SOURCE,DELETED_ON)
SELECT DELETED_ID
  ,ID_SOURCE
  ,DELETED_ON
FROM BLOG_HTTP410
/
DROP TABLE BLOG_HTTP410
/
CREATE OR REPLACE TRIGGER blog_category_trg before
INSERT OR
UPDATE OR
DELETE ON blog_category FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.category_id IS NULL THEN
      :NEW.category_id := blog_sgid;
    END IF;
    IF :NEW.created_by IS NULL THEN
      :NEW.created_by := COALESCE(v('APP_USER'),USER);
    END IF;
    IF :NEW.changed_by IS NULL THEN
      :NEW.changed_by := COALESCE(v('APP_USER'),USER);
    END IF;
  END IF;
  IF updating THEN
    :NEW.changed_on := SYSDATE;
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
  IF deleting THEN
    INSERT INTO blog_deleted_id(deleted_id, id_source)
    VALUES (to_char(:OLD.category_id), 'CATEGORY');
  END IF;
END;
/
ALTER TRIGGER blog_category_trg ENABLE
/
CREATE OR REPLACE TRIGGER blog_article_trg before
INSERT OR
UPDATE OR
DELETE ON blog_article FOR EACH row
BEGIN
  IF inserting THEN
    IF :NEW.article_id IS NULL THEN
      :NEW.article_id := blog_sgid;
    END IF;
    IF :NEW.created_by IS NULL THEN
      :NEW.created_by := COALESCE(v('APP_USER'),USER);
    END IF;
    IF :NEW.changed_by IS NULL THEN
      :NEW.changed_by := COALESCE(v('APP_USER'),USER);
    END IF;
	:NEW.year_month_num := TO_NUMBER(TO_CHAR(:NEW.created_on,'YYYYMM'));
  END IF;
  IF updating THEN
    :NEW.changed_on := SYSDATE;
    :NEW.changed_by := COALESCE(v('APP_USER'),USER);
  END IF;
  IF deleting THEN
    INSERT INTO blog_deleted_id(deleted_id, id_source)
    VALUES (to_char(:OLD.article_id), 'ARTICLE');
  ELSE
    :NEW.article_length := COALESCE(dbms_lob.getlength(:NEW.article_text), 0);
  END IF;
END;
/
ALTER TRIGGER blog_article_trg ENABLE
/
-- Update schema version
update blog_param set param_value = 's2.9.0.3' where param_id = 'SCHEMA_VERSION'
/
