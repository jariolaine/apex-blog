CREATE MATERIALIZED VIEW blog_param_app
  BUILD IMMEDIATE
  USING NO INDEX
  REFRESH COMPLETE ON DEMAND
AS
SELECT a.application_id
  ,a.item_name AS param_name
FROM apex_application_items a
WHERE EXISTS (SELECT 1 FROM blog_param p WHERE p.param_name = a.item_name)
/
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
ALTER TABLE BLOG_ARTICLE_HIT20 ADD CONSTRAINT BLOG_ARTICLE_HIT20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_LAST20 ADD CONSTRAINT BLOG_ARTICLE_LAST20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_ARTICLE_TOP20 ADD CONSTRAINT BLOG_ARTICLE_TOP20_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_COMMENT_LOG ADD CONSTRAINT BLOG_COMMENT_LOG_PK PRIMARY KEY (ARTICLE_ID)
/
ALTER TABLE BLOG_PARAM_APP ADD CONSTRAINT BLOG_PARAM_APP_PK PRIMARY KEY (APPLICATION_ID, PARAM_NAME)
/