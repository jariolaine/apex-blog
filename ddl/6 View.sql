--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_param_app
  NOLOGGING
  CACHE
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
with i as (
 SELECT a.application_id
  ,a.item_name AS param_id
FROM apex_application_items a
union all
 SELECT b.application_id
  ,b.item_name AS param_id
FROM apex_application_page_items b
)
select i.application_id
  ,i.param_id
FROM i
WHERE EXISTS (SELECT 1 FROM blog_param p WHERE p.param_id = i.param_id)
ORDER BY 1,2
/
ALTER TABLE BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_PK PRIMARY KEY (APPLICATION_ID, PARAM_ID)
/
alter materialized view blog_param_app compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_comment_log
  NOLOGGING
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
SELECT a.article_id,
  COUNT(c.article_id) AS total_comment_count,
  SUM(CASE WHEN c.moderated = 'Y' AND c.active = 'Y' THEN 1 ELSE 0 END) AS comment_count,
  MAX(CASE WHEN c.moderated = 'Y' AND c.active = 'Y' THEN c.created_on END) AS last_comment,
  SUM(CASE WHEN c.moderated = 'Y' THEN 1 ELSE 0 END) AS moderated_comment_count,
  MAX(CASE WHEN c.moderated = 'Y' THEN c.created_on END) AS last_moderated_comment,
  SUM(CASE WHEN c.active = 'Y' THEN 1 ELSE 0 END) AS active_comment_count,
  MAX(CASE WHEN c.active = 'Y' THEN c.created_on END) AS last_active_comment
FROM blog_article a
LEFT JOIN blog_comment c on a.article_id = c.article_id
GROUP BY a.article_id
ORDER BY a.article_id;
/
ALTER TABLE BLOG_COMMENT_LOG ADD CONSTRAINT BLOG_COMMENT_LOG_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY TOTAL_COMMENT_COUNT NOT NULL
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY COMMENT_COUNT NOT NULL
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY MODERATED_COMMENT_COUNT NOT NULL
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY ACTIVE_COMMENT_COUNT NOT NULL
/
alter materialized view blog_comment_log compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$articles
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
  ,a.hashtags
  ,a.article_text
  ,a.active
  ,a.created_on
  ,a.changed_on
  ,a.year_month_num
  ,d.comment_count
  ,(SELECT apex_lang.message('TEXT_POSTED_ON') FROM DUAL) AS created_on_txt
  ,(SELECT apex_lang.message('TEXT_POSTED_BY') FROM DUAL) AS posted_by_txt
  ,(SELECT apex_lang.message('TEXT_CATEGORY') FROM DUAL) AS category_txt
  ,(SELECT apex_lang.message('TEXT_VIEW_COMMENTS') FROM DUAL) AS view_comment
  ,(SELECT apex_lang.message('TEXT_POST_COMMENT') FROM DUAL) AS post_comment
FROM blog_article a
  JOIN blog_author b ON a.author_id = b.author_id
  JOIN blog_category c ON a.category_id = c.category_id
  JOIN blog_comment_log d ON a.article_id = d.article_id
WHERE a.active = 'Y'
  AND b.active = 'Y'
  AND c.active = 'Y'
  AND a.valid_from <= SYSDATE
WITH READ ONLY CONSTRAINT blog_v$articles_ro
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_archive_lov
  NOLOGGING
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
WITH qry AS(
  SELECT a.year_month_num
    ,TRUNC(a.created_on,'MM') AS year_month
    ,COUNT(1) AS article_count
  FROM blog_v$articles a
  GROUP BY a.year_month_num,
    TRUNC(a.created_on,'MM')
)
SELECT qry.year_month_num
  ,qry.year_month
  ,qry.article_count
  ,row_number() over(order by qry.year_month desc) as lov_seq
FROM qry
/
ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT BLOG_ARCHIVE_LOV_PK PRIMARY KEY (YEAR_MONTH_NUM)
/
ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT  BLOG_ARCHIVE_LOV_UK1 UNIQUE (YEAR_MONTH)
/
ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT  BLOG_ARCHIVE_LOV_UK2 UNIQUE (LOV_SEQ)
/
ALTER TABLE BLOG_ARCHIVE_LOV MODIFY YEAR_MONTH NOT NULL
/
ALTER TABLE BLOG_ARCHIVE_LOV MODIFY ARTICLE_COUNT NOT NULL
/
ALTER TABLE BLOG_ARCHIVE_LOV MODIFY LOV_SEQ NOT NULL
/
alter materialized view blog_archive_lov compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_article_top20
  NOLOGGING
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS 
WITH qry AS (
  SELECT /*+ FIRST_ROWS(20) */
    ROW_NUMBER() OVER(ORDER BY l.view_count DESC) AS rn,
    a.article_id,
    a.article_title,
    l.view_count,
    l.last_view,
    a.created_on,
    SUM(l.view_count) OVER() AS total_views
  FROM blog_v$articles a
  JOIN blog_article_log l
  ON a.article_id = l.article_id
  WHERE l.view_count > 0
)
SELECT
  qry.article_id,
  apex_escape.html(qry.article_title) AS article_title,
  qry.view_count,
  qry.last_view,
  (qry.view_count / qry.total_views) * 100 AS view_pct,
  qry.created_on,
  qry.rn AS top_article_seq
FROM qry
WHERE qry.rn <= 20
ORDER BY qry.rn
/
ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_UK1 UNIQUE (TOP_ARTICLE_SEQ)
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY ARTICLE_TITLE NOT NULL
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY LAST_VIEW NOT NULL
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY VIEW_PCT NOT NULL
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY TOP_ARTICLE_SEQ NOT NULL
/
alter materialized view blog_article_top20 compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_article_last20
  NOLOGGING
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
WITH qry AS (
  SELECT /*+ FIRST_ROWS(20) */
    ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn,
    a.article_id,
    a.article_title,
    a.description,
    a.author_name,
    a.category_name,
    a.keywords,
    a.hashtags,
    a.created_on
  FROM blog_v$articles a
)
SELECT
  qry.article_id,
  apex_escape.html(qry.article_title) AS article_title,
  apex_escape.html(qry.description)   AS description,
  qry.author_name                     AS posted_by,
  apex_escape.html(qry.category_name) AS category_name,
  qry.created_on,
  qry.article_title                   AS rss_title,
  qry.description                     AS rss_description,
  qry.category_name                   AS rss_category,
  qry.keywords,
  qry.hashtags,
  to_char(sys_extract_utc(cast(qry.created_on as timestamp)), 'Dy, DD Mon YYYY HH24:MI:SS "GMT"', 'NLS_DATE_LANGUAGE=ENGLISH') AS rss_pubdate,
  qry.article_id || to_char(sys_extract_utc(cast(qry.created_on as timestamp)), 'JHH24MISS') AS rss_guid,
  rn AS latest_article_seq
FROM qry
WHERE qry.rn <= 20
ORDER BY qry.rn
/
ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_UK1 UNIQUE (LATEST_ARTICLE_SEQ)
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY ARTICLE_TITLE NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY DESCRIPTION NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY CATEGORY_NAME NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY RSS_PUBDATE NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY RSS_GUID NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY LATEST_ARTICLE_SEQ NOT NULL
/
alter materialized view blog_article_last20 compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$activity_log
AS 
  SELECT
    activity_date ,
    activity_type,
    apex_session_id,
    ip_address,
    related_id,
    user_id,
    latitude,
    longitude,
    country_code,
    country_region,
    country_city,
    http_user_agent,
    http_referer,
    search_type,
    search_criteria,
	additional_info
FROM blog_activity_log1
UNION ALL
SELECT
    activity_date,
    activity_type,
    apex_session_id,
    ip_address,
    related_id,
    user_id,
    latitude,
    longitude,
    country_code,
    country_region,
    country_city,
    http_user_agent,
    http_referer,
    search_type,
    search_criteria,
	additional_info
FROM blog_activity_log2
WITH READ ONLY CONSTRAINT blog_v$activity_log_ro
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$activity
AS 
  SELECT l.activity_date
  ,l.activity_type
  ,l.apex_session_id
  ,l.ip_address
  ,l.related_id
  ,(SELECT a.article_title FROM blog_article a WHERE a.article_id = l.related_id) AS article_title
  ,(SELECT category_name FROM blog_category b WHERE b.category_id = l.related_id) AS category_name
  ,l.user_id
  ,u.email
  ,u.nick_name
  ,u.website
  ,l.latitude
  ,l.longitude
  ,l.country_code
  ,c.country_name
  ,l.country_region
  ,l.country_city
  ,n.http_user_agent
  ,l.http_referer
  ,l.search_type
  ,l.search_criteria
  ,l.additional_info
  ,(select apex_lang.message('TITLE_ARTICLE_LINK') from dual) AS article_link_title
  ,(select apex_lang.message('TITLE_USER_LINK') from dual) AS user_link_title
  ,(select apex_lang.message('TITLE_SESSION_LINK') from dual) AS session_link_title
FROM blog_v$activity_log l
JOIN blog_v$activity_log n
  ON l.apex_session_id = n.apex_session_id
 AND n.activity_type = 'NEW_SESSION'
LEFT JOIN blog_country c 
  ON n.country_code = c.country_code
LEFT JOIN blog_comment_user u
  ON l.user_id = u.user_id
WITH READ ONLY CONSTRAINT blog_v$activity_ro
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_article_hit20
  NOLOGGING
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
WITH al AS (
  SELECT l.related_id AS article_id,
    TRUNC(l.activity_date) AS activity_date,
    COUNT(1) AS view_count
  FROM blog_v$activity_log l
  WHERE l.activity_type = 'READ'
  GROUP BY l.related_id,TRUNC(l.activity_date)
), hit AS (
  SELECT al.article_id,
    SUM(al.view_count) / COUNT(1) AS hit_ratio
  FROM al
  GROUP BY al.article_id
), qry AS (
  SELECT /*+ FIRST_ROWS(20) */
    ROW_NUMBER() OVER(ORDER BY hit.hit_ratio DESC) AS rn,
    a.article_id,
    a.article_title,
    hit.hit_ratio
  FROM blog_v$articles a
  JOIN hit
  ON a.article_id = hit.article_id
)
SELECT
  qry.article_id
  ,apex_escape.html(qry.article_title) AS article_title
  ,qry.hit_ratio
  ,qry.rn AS top_hit_seq
FROM qry
WHERE qry.rn <= 20
ORDER BY qry.rn
/
ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_UK1 UNIQUE (TOP_HIT_SEQ)
/
ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY ARTICLE_TITLE NOT NULL
/
ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY HIT_RATIO NOT NULL
/
ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY TOP_HIT_SEQ NOT NULL
/
alter materialized view blog_article_hit20 compile
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$all_articles AS
  SELECT a.created_on
  ,a.created_by
  ,a.changed_on
  ,a.changed_by
  ,a.article_id
  ,a.article_title
  ,CASE WHEN LENGTH(a.article_text) > 256 THEN
    SUBSTR(a.article_text, 1, INSTR(a.article_text, ' ', 256)) || ' ...'
  ELSE
    a.article_text
  END AS article_text_short
  ,a.article_text
  ,a.active
  ,a.description
  ,a.article_length
  ,b.author_id
  ,b.author_name
  ,a.keywords
  ,c.category_id
  ,c.category_name
  ,c.active AS category_active
  ,a.valid_from
  ,COALESCE(e.total_comment_count, 0) AS total_comment_count
  ,COALESCE(e.comment_count, 0) AS visible_comment_count
  ,COALESCE(e.moderated_comment_count, 0) AS moderated_comment_count
  ,COALESCE(e.active_comment_count, 0) AS active_comment_count
  ,e.last_comment
  ,d.view_count
  ,d.last_view
  ,d.rate_click
  ,d.article_rate
  ,d.last_rate
  ,CASE WHEN a.active = 'Y' AND a.valid_from <= SYSDATE THEN
    'target="_blank" title="' || (select APEX_LANG.MESSAGE('TITLE_ARTICLE_LINK') from dual) || '"'
   ELSE 'class="unwrap"' END AS link_attr
  ,(select apex_lang.message('TITLE_EDIT_LINK') from dual) AS edit_link_title
  ,(select apex_lang.message('TITLE_CATEGORY_LINK') from dual) AS category_link_title
  ,(select apex_lang.message('TITLE_COMMENT_LINK') from dual) AS comment_link_title
FROM blog_article a
JOIN blog_author b
  ON a.author_id = b.author_id
JOIN blog_category c
  ON a.category_id = c.category_id
LEFT JOIN blog_article_log d
  ON a.article_id = d.article_id
LEFT JOIN blog_comment_log e
  ON a.article_id = e.article_id
WITH READ ONLY CONSTRAINT blog_v$all_articles_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$all_comments AS
  SELECT c.comment_id
  ,u.user_id
  ,c.article_id
  ,c.apex_session_id
  ,a.article_title
  ,u.nick_name
  ,u.email
  ,CASE WHEN o.author_id = u.user_id THEN
		o.email_notify
	ELSE
		COALESCE(n.followup_notify, 'N') 
	END AS followup_notify
  ,c.comment_text
  ,CASE WHEN c.moderated = 'N' THEN
     'N'
   ELSE
     c.active
   END AS active
  ,c.moderated
  ,c.moderated_on
  ,c.notify_email_sent
  ,c.notify_email_sent_on
  ,c.parent_id
  ,c.created_on
  ,c.created_by
  ,c.changed_on
  ,c.changed_by
  ,CASE WHEN c.moderated = 'Y' THEN
     c.comment_id
   END AS reply_comment_id
  ,CASE WHEN c.moderated = 'Y' THEN
     c.article_id
   END AS reply_article_id
  ,(select apex_lang.message('TITLE_REPLY_LINK') from dual) AS reply_link_title
  ,(select apex_lang.message('TITLE_EDIT_LINK') from dual) AS edit_link_title
  ,(select apex_lang.message('TITLE_ARTICLE_LINK') from dual) AS article_link_title
  ,(select apex_lang.message('TITLE_USER_LINK') from dual) AS user_link_title
  ,(select apex_lang.message('TITLE_SESSION_LINK') from dual) AS session_link_title
FROM blog_comment c
INNER JOIN blog_article a
  ON c.article_id = a.article_id
INNER JOIN blog_comment_user u
  ON c.user_id = u.user_id
LEFT JOIN blog_comment_notify n
  ON c.user_id = n.user_id
 AND c.article_id = n.article_id
LEFT JOIN blog_author o
  ON u.user_id = o.author_id
WITH READ ONLY CONSTRAINT blog_v$all_comments_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$all_categories as
WITH cat_stat AS (
  SELECT ba.category_id,
    COUNT(1) AS article_count,
    SUM(case when active = 'Y' then 1 end) as active_article_count
  FROM blog_article ba
  GROUP BY ba.category_id
)
SELECT 
   c.category_id
  ,c.category_name
  ,c.active
  ,c.category_seq
  ,c.created_on
  ,c.created_by
  ,c.changed_on
  ,c.changed_by
  ,coalesce(a.article_count, 0) AS article_count
  ,coalesce(a.active_article_count, 0 ) AS active_article_count
  ,coalesce(b.view_count,0 ) AS view_count
  ,b.last_view
  ,(select apex_lang.message('TITLE_EDIT_LINK') from dual) AS edit_link_title
FROM blog_category c
LEFT JOIN blog_category_log b
  ON c.category_id = b.category_id
LEFT JOIN cat_stat a
  ON c.category_id = a.category_id
WITH READ ONLY CONSTRAINT blog_v$all_categories_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$categories as
SELECT c.category_id
  ,apex_escape.html(c.category_name) AS category_name_esc
  ,c.category_name
  ,c.category_seq
FROM blog_category c
WHERE c.active = 'Y'
AND EXISTS(
  SELECT 1 
  FROM blog_article a
  WHERE a.category_id = c.category_id
    AND a.active = 'Y'
)
WITH READ ONLY CONSTRAINT blog_v$categories_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$comments as
  SELECT c.comment_id
    ,c.article_id
    ,c.created_on
    ,b.nick_name AS posted_by
    ,c.comment_text
    ,(SELECT APEX_LANG.message('TEXT_POSTED_ON') FROM DUAL) AS created_txt
    ,(SELECT APEX_LANG.message('TEXT_POSTED_BY') FROM DUAL) AS posted_by_txt
  FROM blog_comment c
  JOIN blog_comment_user b
    ON c.user_id = b.user_id
  WHERE c.moderated = 'Y'
    AND c.active = 'Y'
WITH READ ONLY CONSTRAINT blog_v$comments_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$files as
SELECT f.file_id
  ,f.created_on
  ,f.file_type
  ,f.file_name
  ,f.description
  ,f.file_size
  ,(select apex_lang.message('DOWNLOAD_LINK_TITLE') from dual) AS link_title
FROM blog_file f
WHERE f.active = 'Y'
WITH READ ONLY CONSTRAINT blog_v$files_ro
;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW blog_v$all_files as
SELECT
   f.file_id
  ,f.created_on
  ,f.created_by
  ,f.changed_on
  ,f.changed_by
  ,f.active
  ,f.file_name
  ,f.mime_type
  ,f.file_size
  ,f.dad_charset
  ,f.file_type
  ,f.description
  ,CASE WHEN f.file_type = 'FILE' THEN
     coalesce(l.click_count, 0)
   END AS click_count
  ,CASE WHEN f.file_type = 'FILE' THEN
     l.last_click
   END AS last_click
  ,(select apex_lang.message('TITLE_EDIT_LINK') from dual) AS edit_link_title
FROM blog_file f
LEFT JOIN blog_file_log l
  ON f.file_id = l.file_id
WITH READ ONLY CONSTRAINT blog_v$all_files_ro
;
--------------------------------------------------------------
--------------------------------------------------------------