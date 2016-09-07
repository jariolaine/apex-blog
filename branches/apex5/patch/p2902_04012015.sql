-- Jari Laine / 04.01.2015
-- Patch APEX Blogging Platform 2.9.0.1
--
-- Remove constraints relating bugs:
-- Bug #4. https://sourceforge.net/p/apex-blog/tickets/4/
-- Bug #7. https://sourceforge.net/p/apex-blog/tickets/7/
begin
  for c1 in (
    select table_name
    ,constraint_name
    from sys.user_constraints
    where constraint_name in (
       'BLOG_ARTICLE_HIT20_FK1'
      ,'BLOG_ARTICLE_LAST20_FK1'
      ,'BLOG_ARTICLE_TOP20_FK1'
      ,'BLOG_COMMENT_LOG_FK1'
      ,'BLOG_FILE_LOG_CK2'
    )
  ) loop
    begin
      execute immediate 'alter table ' || c1.table_name || ' drop constraint ' || c1.constraint_name;
    exception when others then
      null;
    end;
  end loop;
end;
/
-- Bug #5. https://sourceforge.net/p/apex-blog/tickets/5/
alter table blog_faq modify active default 'Y'
/
-- Bug #6. https://sourceforge.net/p/apex-blog/tickets/6/
alter table blog_file_log modify click_count default 1
/
-- Bug #7. https://sourceforge.net/p/apex-blog/tickets/7/
alter table blog_file_log add constraint blog_file_log_ck2 check (click_count > 0)
/
-- Bug #10. https://sourceforge.net/p/apex-blog/tickets/10/
CREATE OR REPLACE TRIGGER blog_article_a_trg after
INSERT ON blog_article FOR EACH row
BEGIN
  INSERT INTO blog_article_log(article_id) VALUES(:NEW.article_id);
END;
/
ALTER TRIGGER blog_article_a_trg ENABLE
/
-- Upgrade APEX Blogging Platform to version 2.9.0.2
--
-- Store application versions and admin application id.
INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values ('G_BLOG_ADMIN_APP_ID','N','Blog admin application id','291','Only for developers.','NUMBER','N','INTERNAL',null,'A')
/
INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values ('ADMIN_VERSION','N','Blog admin application version id','a2.9.0.2','Used on future releases for upgrade. Only for developers.','TEXT','N','INTERNAL',null,'A')
/
INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) values ('READER_VERSION','N','Blog reader application version id','r2.9.0.2','Used on future releases for upgrade. Only for developers.','TEXT','N','INTERNAL',null,'A')
/
-- Google +1 and Share button.
INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) VALUES ('GOOGLE_PLUS_ONE_BTN_ENABLED','Y','Google +1 button','Y','If set to "<b>Yes</b>", Google +1 button is shown on article page.','YESNO','N','COMMENT',null,'B')
/
INSERT INTO BLOG_PARAM (PARAM_ID,EDITABLE,PARAM_NAME,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT,PARAM_USE_SKILL) VALUES ('GOOGLE_SHARE_BTN_ENABLED','Y','Google Share button','Y','If set to "<b>Yes</b>", Google Share button is shown on article page.','YESNO','N','COMMENT',null,'B')
/
-- Author Twitter account. Used on Twitter button
ALTER TABLE BLOG_AUTHOR ADD (TWITTER VARCHAR2(256 CHAR))
/
-- Author Twitter account.
CREATE OR REPLACE FORCE VIEW blog_v$article
AS
  SELECT a.article_id
  ,c.category_id
  ,b.author_id
  ,b.author_name
  ,b.twitter AS author_twitter
  ,a.article_title
  ,a.description
  ,c.category_name
  ,a.keywords
  ,a.hastags
  ,a.article_text
  ,a.active
  ,a.created_on
  ,a.changed_on
  ,a.year_month_num
  ,CASE WHEN d.comment_count IS NULL THEN
    0
  ELSE
    d.comment_count
  END AS comment_count
  ,(SELECT apex_lang.message('TEXT_POSTED_ON') FROM DUAL) AS created_on_txt
  ,(SELECT apex_lang.message('TEXT_POSTED_BY') FROM DUAL) AS posted_by_txt
  ,(SELECT apex_lang.message('TEXT_CATEGORY') FROM DUAL) AS category_txt
  ,(SELECT apex_lang.message('TEXT_VIEW_COMMENTS') FROM DUAL) AS view_comment
  ,(SELECT apex_lang.message('TEXT_POST_COMMENT') FROM DUAL) AS post_comment
FROM blog_article a
  JOIN blog_author b ON a.author_id = b.author_id
  JOIN blog_category c ON a.category_id = c.category_id
  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id
WHERE a.active = 'Y'
  AND b.active = 'Y'
  AND c.active = 'Y'
  AND a.valid_from <= SYSDATE
WITH READ ONLY CONSTRAINT blog_v$article_ro
/
-- Update schema version
update blog_param set param_value = 's2.9.0.2' where param_id = 'SCHEMA_VERSION'
/
-- Compile package blog_util
alter package blog_util compile;
/