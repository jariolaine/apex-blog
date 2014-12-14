--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_archive_lov
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
SELECT a.year_month_num
    ,TRUNC(a.created_on,'MM') AS year_month
    ,COUNT(1) AS article_count
  FROM blog_article a
  WHERE a.active = 'Y'
    AND a.valid_from <= SYSDATE
  GROUP BY a.year_month_num,
    TRUNC(a.created_on,'MM')
/
ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT BLOG_ARCHIVE_LOV_PK PRIMARY KEY (YEAR_MONTH_NUM)
/
ALTER TABLE BLOG_ARCHIVE_LOV ADD CONSTRAINT  BLOG_ARCHIVE_LOV_UK1 UNIQUE (YEAR_MONTH)
/
ALTER TABLE BLOG_ARCHIVE_LOV MODIFY YEAR_MONTH NOT NULL
/
ALTER TABLE BLOG_ARCHIVE_LOV MODIFY ARTICLE_COUNT NOT NULL
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_param_app
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
SELECT a.application_id
  ,a.item_name AS param_id
FROM apex_application_items a
WHERE EXISTS (SELECT 1 FROM blog_param p WHERE p.param_id = a.item_name)
/
ALTER TABLE BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_PK PRIMARY KEY (APPLICATION_ID, PARAM_ID)
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_comment_log
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
SELECT article_id,
  COUNT(1) as comment_count,
  MAX(created_on) as last_comment
FROM blog_comment
WHERE moderated = 'Y'
AND active = 'Y'
GROUP BY article_id
/
ALTER TABLE BLOG_COMMENT_LOG ADD CONSTRAINT BLOG_COMMENT_LOG_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY COMMENT_COUNT NOT NULL
/
ALTER TABLE BLOG_COMMENT_LOG MODIFY LAST_COMMENT NOT NULL
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_article_top20
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS 
WITH qry AS (
  SELECT /*+ FIRST_ROWS(20) */
    ROW_NUMBER() OVER(ORDER BY l.view_count DESC) AS top_article,
    a.article_id,
    a.article_title,
    l.view_count,
    l.last_view,
    a.created_on,
    SUM(l.view_count) OVER() AS total_views
  FROM blog_article a
  JOIN blog_article_log l
  ON a.article_id = l.article_id
  WHERE a.active = 'Y'
    AND a.valid_from <= SYSDATE
    AND l.view_count > 0
)
SELECT
  qry.article_id,
  qry.article_title,
  qry.view_count,
  qry.last_view,
  (qry.view_count / qry.total_views) * 100 AS view_pct,
  qry.created_on,
  qry.top_article
FROM qry
WHERE qry.top_article <= 20
/
ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_UK1 UNIQUE (TOP_ARTICLE)
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY LAST_VIEW NOT NULL
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY VIEW_PCT NOT NULL
/
ALTER TABLE BLOG_ARTICLE_TOP20 MODIFY TOP_ARTICLE NOT NULL
/
--------------------------------------------------------------
--------------------------------------------------------------
CREATE MATERIALIZED VIEW blog_article_last20
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
WITH qry AS (
  SELECT /*+ FIRST_ROWS(20) */
    ROW_NUMBER() OVER (ORDER BY a.created_on DESC) AS rn,
    a.article_id,
    APEX_ESCAPE.HTML(a.article_title) AS article_title,
    a.article_title                   AS rss_title,
    APEX_ESCAPE.HTML(a.description)   AS description,
    p.author_name                     AS posted_by,
    c.category_name,
    a.created_on
  FROM blog_article a
  JOIN blog_author p
  ON a.author_id = p.author_id
  JOIN blog_category c
  ON a.category_id = c.category_id
  WHERE a.active   = 'Y'
    AND a.valid_from <= SYSDATE
)
SELECT
  article_id,
  article_title,
  rss_title,
  description,
  posted_by,
  category_name,
  created_on
FROM qry
WHERE rn <= 20
/
ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY ARTICLE_TITLE NOT NULL
/
ALTER TABLE BLOG_ARTICLE_LAST20 MODIFY DESCRIPTION NOT NULL
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
  ,n.apex_session_id
  ,n.ip_address
  ,l.related_id
  ,l.user_id
  ,u.email
  ,u.nick_name
  ,u.website
  ,n.latitude
  ,n.longitude
  ,n.country_code
  ,c.country_name
  ,n.country_region
  ,n.country_city
  ,n.http_user_agent
  ,l.http_referer
  ,l.search_type
  ,l.search_criteria
  ,l.additional_info
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
CREATE OR REPLACE FORCE VIEW blog_v$article
AS 
  SELECT
  a.article_id
  ,c.category_id
  ,b.author_id
  ,a.created_on
  ,b.author_name
  ,a.article_title
  ,a.description
  ,c.category_name
  ,a.keywords
  ,a.article_text
  ,a.active
  ,a.year_month_num
  ,CASE WHEN d.comment_count IS NULL THEN
    0
  ELSE
    d.comment_count
  END AS comment_count
  ,(SELECT apex_lang.message('TEXT_POSTED_ON') FROM DUAL) AS created_on_txt
  ,(SELECT apex_lang.message('TEXT_BY') FROM DUAL) AS posted_by_txt
  ,(SELECT apex_lang.message('TEXT_CATEGORY') FROM DUAL) AS category_txt
  ,(SELECT apex_lang.message('TEXT_VIEW_COMMENTS') FROM DUAL) AS view_comment
  ,(SELECT apex_lang.message('TEXT_POST_COMMENT') FROM DUAL) AS post_comment
FROM blog_article a
  JOIN blog_author b ON a.author_id = b.author_id
  JOIN blog_category c ON a.category_id = c.category_id
  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id
WHERE a.active = 'Y'
  AND a.valid_from <= SYSDATE
WITH READ ONLY CONSTRAINT blog_v$article_ro
/
--------------------------------------------------------------
--------------------------------------------------------------

CREATE MATERIALIZED VIEW blog_article_hit20
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
  FROM blog_article a
  JOIN hit
  ON a.article_id = hit.article_id
  WHERE a.active  = 'Y'
    AND a.valid_from <= SYSDATE
)
SELECT
  qry.article_id,
  qry.article_title,
  qry.hit_ratio,
  qry.rn AS top_hit
FROM qry
WHERE qry.rn <= 20
/
ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_HIT20 MODIFY HIT_RATIO NOT NULL
/
--------------------------------------------------------------
--------------------------------------------------------------