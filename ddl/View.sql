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
/
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
/
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
  ,(SELECT apex_lang.lang('Posted on') FROM DUAL) AS created_on_txt
  ,(SELECT apex_lang.lang('by') FROM DUAL) AS posted_by_txt
  ,(SELECT apex_lang.lang('Category') FROM DUAL) AS category_txt
  ,(SELECT apex_lang.lang('View Comments') FROM DUAL) AS view_comment
  ,(SELECT apex_lang.lang('Post a Comment') FROM DUAL) AS post_comment
FROM blog_article a
  JOIN blog_author b ON a.author_id = b.author_id
  JOIN blog_category c ON a.category_id = c.category_id
  LEFT JOIN blog_comment_log d ON a.article_id = d.article_id
WHERE a.active = 'Y'
  AND a.valid_from <= SYSDATE
/
