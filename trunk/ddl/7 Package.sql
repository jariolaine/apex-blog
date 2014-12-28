CREATE OR REPLACE PACKAGE  "BLOG_XML" 
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
  FUNCTION show_entry(
    p_build_option_id         IN VARCHAR2,
    p_authorization_scheme_id IN VARCHAR2,
    p_condition_type_code     IN VARCHAR2,
    p_condition_expression1   IN VARCHAR2,
    p_condition_expression2   IN VARCHAR2
  ) RETURN VARCHAR2;
--------------------------------------------------------------------------------
  PROCEDURE rss(
    p_app_alias IN VARCHAR2,
    p_blog_name IN VARCHAR2,
    p_base_url  IN VARCHAR2
  );
--------------------------------------------------------------------------------
  PROCEDURE sitemap(
    p_app_id    IN NUMBER,
    p_app_alias IN VARCHAR2,
    p_base_url  IN VARCHAR2,
    p_tab_list  IN VARCHAR2
  );
--------------------------------------------------------------------------------
END "BLOG_XML";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_XML" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION show_entry(
    p_build_option_id         IN VARCHAR2,
    p_authorization_scheme_id IN VARCHAR2,
    p_condition_type_code     IN VARCHAR2,
    p_condition_expression1   IN VARCHAR2,
    p_condition_expression2   IN VARCHAR2
  ) RETURN VARCHAR2
  AS
    l_retval  BOOLEAN;
  BEGIN
    l_retval := apex_plugin_util.is_component_used (
      p_build_option_id         => p_build_option_id,
      p_authorization_scheme_id => p_authorization_scheme_id,
      p_condition_type          => p_condition_type_code,
      p_condition_expression1   => p_condition_expression1,
      p_condition_expression2   => p_condition_expression2
    );
    RETURN apex_debug.tochar(l_retval);
  END show_entry;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE rss(
    p_app_alias IN VARCHAR2,
    p_blog_name IN VARCHAR2,
    p_base_url  IN VARCHAR2
  )
  AS
    l_xml         BLOB;
    l_url         VARCHAR2(255);
    l_rss_desc    VARCHAR2(255);
    l_rss_url     VARCHAR2(255);
    l_home_url    VARCHAR2(255);
    l_article_url VARCHAR2(255);
    l_webmaster   VARCHAR2(255);
    l_rss_lang    VARCHAR2(5);

    c_version     CONSTANT VARCHAR2(5) := '2.0';

  BEGIN

    l_rss_lang    := apex_application.g_browser_language;
    l_rss_desc    := apex_plugin_util.replace_substitutions(apex_lang.message('RSS_DESCRIPTION'));
    
    l_url         := 'f?p=' || p_app_alias || ':';
    l_rss_url     := p_base_url || l_url || 'RSS';
    l_home_url    := p_base_url || l_url || 'HOME';
    l_article_url := l_url || 'READ:0::::ARTICLE:';

    SELECT xmlelement("rss", xmlattributes(c_version AS "version", 'http://www.w3.org/2005/Atom' AS "xmlns:atom", 'http://purl.org/dc/elements/1.1/' AS "xmlns:dc"),
      xmlelement("channel",
        xmlelement("atom:link", xmlattributes(l_rss_url AS "href", 'self' AS "rel", 'application/rss+xml' AS "type")),
        xmlforest(
          p_blog_name AS "title"
          ,l_home_url AS "link"
          ,l_rss_desc AS "description"
          ,l_rss_lang AS "language"
        ),
        xmlagg(
          xmlelement("item",
            xmlelement("title", l.rss_title),
            xmlelement("dc:creator", l.posted_by),
            xmlelement("category", l.rss_category),
            xmlelement("link", p_base_url || apex_util.prepare_url(l_article_url || l.article_id, NULL, 'PUBLIC_BOOKMARK')),
            xmlelement("description", l.rss_description),
            xmlelement("pubDate", l.rss_pubdate),
            xmlelement("guid", xmlattributes('false' AS "isPermaLink"), l.rss_guid)
          ) ORDER BY created_on DESC
        )
      )
    ).getblobval(nls_charset_id('AL32UTF8'))
    INTO l_xml
    FROM blog_article_last20 l
    ;
    owa_util.mime_header('application/rss+xml', TRUE);
    wpg_docload.download_file(l_xml);
    apex_application.stop_apex_engine;

  END rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE sitemap(
    p_app_id    IN NUMBER,
    p_app_alias IN VARCHAR2,
    p_base_url  IN VARCHAR2,
    p_tab_list  IN VARCHAR2
  )
  AS
    l_xml             BLOB;
    l_article_url     VARCHAR2(255);
    l_category_url    VARCHAR2(255);
  BEGIN

    l_article_url   := 'f?p=' || p_app_alias || ':READ:0::::ARTICLE:';
    l_category_url  := 'f?p=' || p_app_alias || ':READCAT:0::::CATEGORY:';

    WITH article_cat AS(
      SELECT category_id,
        MAX(changed_on) AS changed_on
      FROM blog_v$article b
      GROUP BY category_id
    ), sitemap_query AS (
      SELECT 1 AS grp,
        ROW_NUMBER() OVER(ORDER BY e.display_sequence) AS rnum,
        apex_plugin_util.replace_substitutions(e.entry_target) AS url,
        (SELECT MAX(changed_on) FROM article_cat) AS lastmod
      FROM APEX_APPLICATION_LIST_ENTRIES e
      WHERE e.application_id = p_app_id
        AND e.list_name      = p_tab_list
        AND
          blog_xml.show_entry(
            (SELECT o.build_option_id FROM apex_application_build_options o WHERE o.build_option_name = e.build_option),
            e.authorization_scheme_id,
            e.condition_type_code,
            e.condition_expression1,
            e.condition_expression2
           ) = 'true'
      UNION ALL
      SELECT 2 AS grp,
        ROW_NUMBER() OVER(ORDER BY a.created_on) AS rnum,
        apex_util.prepare_url(l_article_url || a.article_id, NULL, 'PUBLIC_BOOKMARK') AS url,
        a.changed_on AS lastmod
      FROM blog_v$article a
      UNION ALL
      SELECT 3 AS grp,
        ROW_NUMBER() OVER(ORDER BY c.category_seq) AS rnum,
        apex_util.prepare_url(l_category_url || c.category_id, NULL, 'PUBLIC_BOOKMARK') AS url,
        a.changed_on AS lastmod
      FROM blog_category c
      JOIN article_cat a
        ON c.category_id = a.category_id
       AND c.active = 'Y'
    )
    SELECT XMLElement("urlset", XMLAttributes('http://www.sitemaps.org/schemas/sitemap/0.9' AS "xmlns"),
        (
          XMLAgg(
              XMLElement("url"
              ,XMLElement("loc", p_base_url || url)
              ,XMLElement("lastmod", TO_CHAR(lastmod, 'YYYY-MM-DD'))
              ,XMLElement("changefreq", 'monthly')
              ,XMLElement("priority", '0.5')
            ) ORDER BY grp,rnum
          )
        )
      ).getblobval(nls_charset_id('AL32UTF8'))
    INTO l_xml
    FROM sitemap_query
    ;

    owa_util.mime_header('application/xml', TRUE);
    wpg_docload.download_file(l_xml);
    apex_application.stop_apex_engine;

  END sitemap;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_XML";
/

CREATE OR REPLACE PACKAGE  "BLOG_UTIL" 
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
  FUNCTION init_session (
    p_app_id          IN NUMBER,
    p_session_id      IN NUMBER
  ) RETURN NUMBER;
--------------------------------------------------------------------------------
  FUNCTION get_param_value (
    p_param_id        IN VARCHAR2
  ) RETURN VARCHAR2;
--------------------------------------------------------------------------------
  PROCEDURE set_items_from_param (
    p_app_id          IN NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE save_comment(
    p_user_id         IN OUT NOCOPY NUMBER,
    p_apex_session_id IN NUMBER,
    p_app_alias       IN VARCHAR2,
    p_base_url        IN VARCHAR2,
    p_blog_name       IN VARCHAR2,
    p_article_id      IN NUMBER,
    p_article_title   IN VARCHAR2,
    p_email           IN VARCHAR2,
    p_nick_name       IN VARCHAR2,
    p_website         IN VARCHAR2,
    p_followup        IN VARCHAR2,
    p_comment         IN VARCHAR2
  );
--------------------------------------------------------------------------------
  PROCEDURE save_contact (
    p_user_id         IN OUT NOCOPY NUMBER,
    p_apex_session_id IN NUMBER,
    p_email           IN VARCHAR2,
    p_nick_name       IN VARCHAR2,
    p_website         IN VARCHAR2,
    p_comment         IN VARCHAR2
  );
--------------------------------------------------------------------------------
  PROCEDURE notify_readers (
    p_comment_id      IN NUMBER,
    p_user_id         IN NUMBER,
    p_article_id      IN NUMBER,
    p_article_title   IN VARCHAR2,
    p_app_alias       IN VARCHAR2,
    p_base_url        IN VARCHAR2,
    p_blog_name       IN VARCHAR2
  );
--------------------------------------------------------------------------------
  PROCEDURE unsubscribe (
    p_value           IN OUT NOCOPY VARCHAR2,
    p_user_id         OUT NOCOPY NUMBER,
    p_article_id      OUT NOCOPY NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE download_file (
    p_file_name       IN VARCHAR2,
    p_session_id      IN NUMBER,
    p_user_id         IN VARCHAR2
  );
--------------------------------------------------------------------------------
  FUNCTION validate_email (
    p_email           IN VARCHAR2
  ) RETURN BOOLEAN;
--------------------------------------------------------------------------------
  PROCEDURE get_article_page_items (
    p_article_id      IN VARCHAR2,
    p_page_title      OUT NOCOPY VARCHAR2,
    p_region_title    OUT NOCOPY VARCHAR2,
    p_keywords        OUT NOCOPY VARCHAR2,
    p_description     OUT NOCOPY VARCHAR2,
    p_author_name     OUT NOCOPY VARCHAR2,
    p_rate            OUT NOCOPY NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE get_category_page_items (
    p_category_id     IN VARCHAR2,
    p_page_title      OUT NOCOPY VARCHAR2,
    p_region_title    OUT NOCOPY VARCHAR2,
    p_category_name   OUT NOCOPY VARCHAR2
  );
--------------------------------------------------------------------------------
END "BLOG_UTIL";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_UTIL" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables, procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  TYPE t_author IS RECORD (
    n_author_id     NUMBER(38),
    v_author_name   VARCHAR2(80),
    v_email         VARCHAR2(120),
    v_email_notify  VARCHAR2(1)
  );
  TYPE t_email  IS RECORD (
    v_from          VARCHAR2(120),
    v_subj          VARCHAR2(255),
    v_body          VARCHAR2(32700)
  );
  g_cookie_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), 12);
  g_watche_expires    CONSTANT DATE           := ADD_MONTHS(TRUNC(SYSDATE), -1);
  g_cookie_name       CONSTANT VARCHAR2(30)   := '__uid';
  g_cookie_version    CONSTANT VARCHAR2(30)   := '1.0';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_user_name (
    p_user_id IN NUMBER
  ) RETURN VARCHAR2
  AS
    l_user_name VARCHAR2(255);
  BEGIN
    SELECT nick_name
    INTO l_user_name
    FROM blog_comment_user
    WHERE user_id = p_user_id
    ;
    RETURN l_user_name;
  EXCEPTION WHEN
    NO_DATA_FOUND OR
    VALUE_ERROR OR
    INVALID_NUMBER
  THEN
    apex_debug.warn('blog_util.get_user_name(p_user_id => %s); error: %s', COALESCE(to_char(p_user_id), 'NULL'), sqlerrm);
    RETURN NULL;
  END get_user_name;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_article_author(
    p_article_id IN NUMBER
  ) RETURN t_author
  AS
    l_author  t_author;
  BEGIN
    SELECT u.author_id,
      author_name,
      email,
      email_notify
      INTO l_author
    FROM blog_author u
    WHERE u.active = 'Y'
      AND EXISTS(
      SELECT 1
      FROM blog_v$article a
      WHERE a.article_id = p_article_id
      AND a.author_id = u.author_id
    );
    RETURN l_author;
  EXCEPTION WHEN
    NO_DATA_FOUND OR
    VALUE_ERROR OR
    INVALID_NUMBER
  THEN
    apex_debug.warn('blog_util.get_author_record_by_article(p_article_id => %s); error: %s', coalesce(to_char(p_article_id), 'NULL'), sqlerrm);
    RETURN NULL;
  END get_article_author;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION raw_to_table(
    p_value     IN RAW,
    p_separator IN VARCHAR2 DEFAULT ':'
  ) RETURN apex_application_global.vc_arr2
  AS
    l_value VARCHAR2(32700);
  BEGIN
    l_value := sys.utl_raw.cast_to_varchar2(p_value);
    l_value := sys.utl_url.unescape(l_value);
    RETURN apex_util.string_to_table(l_value, COALESCE(p_separator, ':'));
  END raw_to_table;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE set_cookie(
    p_user_id IN NUMBER
  )
  AS
  BEGIN
    sys.owa_util.mime_header('text/html', FALSE);
    -- The first element in the table is the cookie version
    -- The second element in the table is the user id
    sys.owa_cookie.send(
      name    => blog_util.g_cookie_name,
      value   => sys.utl_raw.cast_to_raw(blog_util.g_cookie_version || ':' || p_user_id),
      expires => blog_util.g_cookie_expires
    );
    --sys.owa_util.http_header_close;
  END set_cookie;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_cookie
  RETURN NUMBER
  AS
    l_user_id     NUMBER(38,0);
    l_cookie_val  VARCHAR2(2000);
    l_cookie_vals apex_application_global.vc_arr2;
  BEGIN
    l_cookie_val := apex_authentication.get_login_username_cookie(blog_util.g_cookie_name);
    IF l_cookie_val IS NOT NULL THEN
      l_cookie_vals := blog_util.raw_to_table(l_cookie_val);
      -- The first element in the table is the cookie version
      IF l_cookie_vals(1) = blog_util.g_cookie_version THEN
        -- The second element in the table is the user id
        l_user_id := to_number(l_cookie_vals(2));
      END IF;
    END IF;
    RETURN l_user_id;
  EXCEPTION WHEN
    NO_DATA_FOUND OR
    INVALID_NUMBER OR
    VALUE_ERROR
  THEN
    apex_debug.warn('blog_util.get_cookie; error: %s', sqlerrm);
    RETURN NULL;
  END get_cookie;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_email_message (
    p_article_title IN VARCHAR2,
    p_article_url   IN VARCHAR2,
    p_blog_name     IN VARCHAR2,
    p_author_name   IN VARCHAR2,
    p_subj          IN VARCHAR2,
    p_body          IN VARCHAR2
  ) RETURN t_email
  AS
    TYPE tabtype IS TABLE OF VARCHAR2(255) INDEX BY VARCHAR2(40);
    l_arr   tabtype;
    l_key   VARCHAR2(40);
    l_email t_email;
  BEGIN
    l_email.v_subj            := apex_lang.message(p_subj);
    l_email.v_body            := apex_lang.message(p_body);
    l_arr('#BLOG_NAME#')      := p_blog_name;
    l_arr('#ARTICLE_TITLE#')  := p_article_title;
    l_arr('#AUTHOR_NAME#')    := p_author_name;
    l_arr('#ARTICLE_URL#')    := p_article_url;  
    l_key := l_arr.FIRST;
    -- Substitude message
    WHILE l_key IS NOT NULL LOOP
      l_email.v_subj := regexp_replace( l_email.v_subj, l_key, l_arr(l_key), 1, 0, 'i' );
      l_email.v_body := regexp_replace( l_email.v_body, l_key, l_arr(l_key), 1, 0, 'i' );
      l_key := l_arr.NEXT(l_key);
    END LOOP;
    /* Get blog email */
    l_email.v_from := blog_util.get_param_value('BLOG_EMAIL');
    --
    RETURN l_email;
  END get_email_message;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_article_url(
    p_article_id  IN NUMBER,
    p_app_alias   IN VARCHAR2,
    p_base_url    IN VARCHAR2 DEFAULT NULL
  ) RETURN VARCHAR2
  AS
    l_url VARCHAR2(2000);
  BEGIN
    l_url := 'f?p=' || p_app_alias || ':READ:0::::ARTICLE:' || p_article_id;
    l_url := apex_util.prepare_url(p_url => l_url, p_checksum_type => 'PUBLIC_BOOKMARK');
    l_url := p_base_url || l_url;
    RETURN l_url;
  END get_article_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_unsubscribe_url (
    p_user_id     IN NUMBER,
    p_article_id  IN NUMBER,
    p_app_alias   IN VARCHAR2,
    p_base_url    IN VARCHAR2,
    p_page_alias  IN VARCHAR2 DEFAULT 'UNSUBSCRIBE',
    p_session_id  IN NUMBER DEFAULT 0
  ) RETURN VARCHAR2
  AS
    l_url       VARCHAR2(2000);
    l_value     VARCHAR2(2000);
  BEGIN
    l_value := sys.utl_raw.cast_to_raw(p_user_id || ':' || p_article_id);
    l_url   := 'f?p=' || p_app_alias || ':UNSUBSCRIBE:' || p_session_id || '::::SUBSCRIBER_ID:' || l_value;
    l_url   := apex_util.prepare_url(p_url => l_url, p_checksum_type => 'PUBLIC_BOOKMARK');
    l_url   := p_base_url || l_url;
    RETURN l_url;
  END get_unsubscribe_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_user_attr(
    p_user_id     OUT NOCOPY NUMBER,
    p_email       IN VARCHAR2,
    p_nick_name   IN VARCHAR2,
    p_website     IN VARCHAR2
  )
  AS
  BEGIN
    BEGIN
      INSERT INTO blog_comment_user (email, nick_name, website)
        VALUES (p_email, p_nick_name, p_website)
      RETURNING user_id INTO p_user_id
      ;
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
      UPDATE blog_comment_user
        SET nick_name = p_nick_name,
          website = p_website
        WHERE email = p_email
      RETURNING user_id INTO p_user_id
      ;
    END;
  END save_user_attr;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_notify_user (
    p_user_id         IN NUMBER,
    p_article_id      IN NUMBER,
    p_followup        IN VARCHAR2
  )
  AS
  BEGIN
    MERGE INTO blog_comment_notify a
    USING (
      SELECT p_user_id AS user_id,
        p_article_id AS article_id,
        p_followup  AS followup_notify
      FROM DUAL
    ) b
    ON (a.user_id = b.user_id AND a.article_id = b.article_id)
    WHEN MATCHED THEN
      UPDATE SET a.followup_notify = b.followup_notify
    WHEN NOT MATCHED THEN
      INSERT (user_id, article_id, followup_notify)
      VALUES (b.user_id, b.article_id, b.followup_notify)
    ;
  END save_notify_user;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE notify_author (
    p_article_title IN VARCHAR2,
    p_article_url   IN VARCHAR2,
    p_blog_name     IN VARCHAR2,
    p_author_name   IN VARCHAR2,
    p_author_email  IN VARCHAR2
  )
  AS
    l_email t_email;
  BEGIN
    /* Get email subject and body to variable */
    l_email := blog_util.get_email_message(
      p_article_title => p_article_title,
      p_article_url   => p_article_url,
      p_blog_name     => p_blog_name,
      p_author_name   => p_author_name,
      p_subj          => 'NEW_COMMENT_EMAIL_SUBJ',
      p_body          => 'NEW_COMMENT_EMAIL_BODY'
    );
    /* Send mail to author */
    apex_mail.send (
      p_from => l_email.v_from,
      p_to   => p_author_email,
      p_subj => l_email.v_subj,
      p_body => l_email.v_body
    );
    /* we do have time wait email sending */
    --APEX_MAIL.PUSH_QUEUE;
  END notify_author;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  PROCEDURE raise_http_error(
    p_id          IN VARCHAR2,
    p_error_code  IN NUMBER DEFAULT 404,
    p_reason      IN VARCHAR2 DEFAULT 'Not Found'
  )
  AS
  BEGIN
    apex_debug.warn('HTTP %s %s id: %s', p_error_code, p_reason, coalesce(p_id, '(NULL)'));
    sys.owa_util.status_line(
      nstatus       => p_error_code,
      creason       => p_reason,
      bclose_header => true
    );
    apex_application.stop_apex_engine;
  END raise_http_error;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  PROCEDURE check_http410(
    p_id  IN VARCHAR2
  )
  AS
    l_count PLS_INTEGER;
  BEGIN
    SELECT COUNT(1)
    INTO l_count
    FROM blog_http410 c
    WHERE c.deleted_id = p_id
    ;
    blog_util.raise_http_error(p_id, 410, 'Gone');
  EXCEPTION WHEN 
    NO_DATA_FOUND
  THEN
    blog_util.raise_http_error(p_id);
  END check_http410;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION init_session (
    p_app_id      IN NUMBER,
    p_session_id  IN NUMBER
  ) RETURN NUMBER
  AS
    l_user_id     NUMBER(38);
    l_user_name   VARCHAR2(255);
  BEGIN
    blog_util.set_items_from_param(p_app_id);
    l_user_id := blog_util.get_cookie;
    IF l_user_id IS NOT NULL THEN
      l_user_name := blog_util.get_user_name(l_user_id);
      IF l_user_name IS NOT NULL THEN
        /* Set APP_USER */
        apex_custom_auth.set_user(upper(l_user_name));
      ELSE
        l_user_id := NULL;
      END IF;
    END IF;
    IF apex_authorization.is_authorized('LOGGING_ENABLED') THEN
      blog_log.write_activity_log(
        p_user_id       => l_user_id,
        p_session_id    => p_session_id,
        p_ip_address    => sys.owa_util.get_cgi_env('REMOTE_ADDR'),
        p_user_agent    => sys.owa_util.get_cgi_env('HTTP_USER_AGENT'),
        p_referer       => sys.owa_util.get_cgi_env('HTTP_REFERER'),
        p_activity_type => 'NEW_SESSION'
      );
    END IF;
    RETURN l_user_id;
  END init_session;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_param_value(
    p_param_id IN VARCHAR2
  ) RETURN VARCHAR2
  AS
    l_value VARCHAR2(4000);
  BEGIN
    SELECT param_value
    INTO l_value
    FROM blog_param
    WHERE param_id = p_param_id
    ;
    RETURN l_value;
  END get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE set_items_from_param(
    p_app_id IN NUMBER
  ) AS
  --PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    FOR c1 IN (
      SELECT
        p.param_id,
        p.param_value
      FROM blog_param p
      WHERE p.param_value IS NOT NULL
        AND EXISTS(
          SELECT 1
          FROM blog_param_app a
          WHERE a.application_id = p_app_id
          AND a.param_id = p.param_id
        )
    ) LOOP
      apex_util.set_session_state(c1.param_id, c1.param_value);
    END LOOP;
  END set_items_from_param;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_comment(
    p_user_id         IN OUT NOCOPY NUMBER,
    p_apex_session_id IN NUMBER,
    p_app_alias       IN VARCHAR2,
    p_base_url        IN VARCHAR2,
    p_blog_name       IN VARCHAR2,
    p_article_id      IN NUMBER,
    p_article_title   IN VARCHAR2,
    p_email           IN VARCHAR2,
    p_nick_name       IN VARCHAR2,
    p_website         IN VARCHAR2,
    p_followup        IN VARCHAR2,
    p_comment         IN VARCHAR2
  )
  AS
    l_article_url VARCHAR2(4000);
    l_comment_id  NUMBER(38);
    l_publish     VARCHAR2(1) := 'N';
    l_author      t_author;
  BEGIN
    /* Set APP_USER */
    apex_custom_auth.set_user(upper(p_nick_name));
    --
    /* Insert or update user */
    blog_util.save_user_attr(
      p_user_id     => p_user_id,
      p_email       => p_email,
      p_nick_name   => p_nick_name,
      p_website     => p_website
    );
    /* Save should user be notified when new comment is posted */
    blog_util.save_notify_user(
      p_user_id     => p_user_id,
      p_article_id  => p_article_id,
      p_followup    => p_followup
    );
    /* Set user id to cookie */
    blog_util.set_cookie(p_user_id);
    --
    /* Should author moderate comment before it is published */
    IF NOT apex_authorization.is_authorized('MODERATION_ENABLED') THEN
      l_publish := 'Y';
    END IF;
    --
    /* Inser comment to table */
    INSERT INTO blog_comment
    (user_id, apex_session_id, article_id, comment_text, moderated)
    VALUES
    (p_user_id, p_apex_session_id, p_article_id, p_comment , l_publish)
    RETURNING comment_id INTO l_comment_id
    ;
    --
    /* Update user id to activity log */
    UPDATE blog_activity_log
    SET user_id = p_user_id
    WHERE apex_session_id = p_apex_session_id
      AND user_id IS NULL
    ;
    --
    /* Send email about new comment to readers */
    IF apex_authorization.is_authorized('NOTIFICATION_EMAIL_ENABLED') THEN
      IF l_publish = 'Y' THEN
        blog_util.notify_readers (
          p_comment_id    => l_comment_id,
          p_user_id       => p_user_id,
          p_article_id    => p_article_id,
          p_article_title => p_article_title,
          p_app_alias     => p_app_alias,
          p_base_url      => p_base_url,
          p_blog_name     => p_blog_name
        );
      END IF;
    --
      /* Get author details for notification emails */
      l_author := blog_util.get_article_author(p_article_id);
      --
      /* Send email about new comment to author */
      /* If we have author email and author is active and like have notifications */
      IF  l_author.v_email IS NOT NULL AND l_author.v_email_notify = 'Y'
      THEN
        /* Get article url */
        l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);
        --
        blog_util.notify_author (
          p_article_title => p_article_title,
          p_article_url   => l_article_url,
          p_blog_name     => p_blog_name,
          p_author_name   => l_author.v_author_name,
          p_author_email  => l_author.v_email
        );
      END IF;
    END IF;
    /* Refresh comment log */
    dbms_mview.refresh('BLOG_COMMENT_LOG');
  END save_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_contact(
    p_user_id         IN OUT NOCOPY NUMBER,
    p_apex_session_id IN NUMBER,
    p_email           IN VARCHAR2,
    p_nick_name       IN VARCHAR2,
    p_website         IN VARCHAR2,
    p_comment         IN VARCHAR2
  )
  AS
  BEGIN
    /* Set APP_USER */
    apex_custom_auth.set_user(upper(p_nick_name));
    /* Insert or update user */
    blog_util.save_user_attr(
      p_user_id     => p_user_id,
      p_email       => p_email,
      p_nick_name   => p_nick_name,
      p_website     => p_website
    );
    /* Inser message to table */
    INSERT INTO blog_contact_message
    (user_id, apex_session_id, message)
    VALUES
    (p_user_id, p_apex_session_id, p_comment)
    ;
     /* Set user id to cookie */
    blog_util.set_cookie(p_user_id);
  END save_contact;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE notify_readers (
    p_comment_id    IN NUMBER,
    p_user_id       IN NUMBER,
    p_article_id    IN NUMBER,
    p_article_title IN VARCHAR2,
    p_app_alias     IN VARCHAR2,
    p_base_url      IN VARCHAR2,
    p_blog_name     IN VARCHAR2
  )
  AS
    l_article_url     VARCHAR2(2000);
    l_unsubscribe_url VARCHAR2(2000);
    l_user_email      t_email;
    l_email           t_email;
  BEGIN
    /* Get article url */
    l_article_url := blog_util.get_article_url(p_article_id, p_app_alias, p_base_url);
    /* Get email subject and body to variables */
    l_email := blog_util.get_email_message(
      p_article_title => p_article_title,
      p_article_url   => l_article_url,
      p_blog_name     => p_blog_name,
      p_author_name   => '#AUTHOR_NAME#',
      p_subj          => 'FOLLOWUP_EMAIL_SUBJ',
      p_body          => 'FOLLOWUP_EMAIL_BODY'
    );
    /* Loop trough all users that like have notification */
    FOR c1 IN (
      SELECT email,
        nick_name,
        user_id
      FROM blog_comment_user u
      WHERE u.user_id != p_user_id
        AND u.blocked = 'N'
        AND EXISTS(
          SELECT 1
          FROM blog_comment_notify n
          WHERE n.user_id = u.user_id
          AND n.article_id = p_article_id
          AND n.followup_notify = 'Y'
          AND n.changed_on > g_watche_expires
        )
        AND EXISTS(
          SELECT 1
          FROM blog_comment c
          WHERE c.article_id = p_article_id
          AND c.comment_id = p_comment_id
          AND c.active = 'Y'
          AND c.moderated = 'Y'
          AND c.notify_email_sent = 'N'
        )
    ) LOOP
      /* User specific unsubscribe url */
      l_unsubscribe_url := blog_util.get_unsubscribe_url(
        p_user_id     => c1.user_id,
        p_article_id  => p_article_id,
        p_app_alias   => p_app_alias,
        p_base_url    => p_base_url
      );
      /* Make user specific substitutions */
      l_user_email.v_subj := regexp_replace(l_email.v_subj, '#NICK_NAME#', c1.nick_name, 1, 0, 'i');
      l_user_email.v_body := regexp_replace(l_email.v_body, '#NICK_NAME#', c1.nick_name, 1, 0, 'i');
      l_user_email.v_body := regexp_replace(l_user_email.v_body, '#UNSUBSCRIBE_URL#', l_unsubscribe_url, 1, 0, 'i');
      /* Send mail to user */
      apex_mail.send (
        p_from => l_email.v_from,
        p_to   => c1.email,
        p_subj => l_user_email.v_subj,
        p_body => l_user_email.v_body
      );
    END LOOP;
    /* we do have time wait email sending */
    --APEX_MAIL.PUSH_QUEUE;
    UPDATE blog_comment
      SET notify_email_sent = 'Y'
    WHERE comment_id = p_comment_id
      AND active = 'Y'
      AND moderated = 'Y'
      AND notify_email_sent = 'N'
    ;
  END notify_readers;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE unsubscribe(
    p_value       IN OUT NOCOPY VARCHAR2,
    p_user_id     OUT NOCOPY NUMBER,
    p_article_id  OUT NOCOPY NUMBER
  )
  AS
    l_user_name VARCHAR2(255);
    l_arr       apex_application_global.vc_arr2;
  BEGIN
    l_arr         := blog_util.raw_to_table(p_value);
    p_value       := NULL;
    p_user_id     := l_arr(1);
    p_article_id  := l_arr(2);
    IF p_user_id IS NOT NULL THEN
      l_user_name := blog_util.get_user_name(p_user_id);
    END IF;
    IF p_user_id IS NOT NULL
    AND l_user_name IS NOT NULL
    AND p_article_id IS NOT NULL
    THEN
      /* Set APP_USER */
      apex_custom_auth.set_user(upper(l_user_name));
      blog_util.save_notify_user(
        p_user_id    => p_user_id,
        p_article_id => p_article_id,
        p_followup   => 'N'
      );
    ELSE
      blog_util.raise_http_error(p_value);
    END IF;
  EXCEPTION WHEN
    NO_DATA_FOUND OR
    INVALID_NUMBER OR
    VALUE_ERROR
  THEN
    blog_util.raise_http_error(p_value);
  END unsubscribe;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE download_file (
    p_file_name   IN VARCHAR2,
    p_session_id  IN NUMBER,
    p_user_id     IN VARCHAR2
  )
  AS
    l_file_name       VARCHAR2(2000);
    l_utc             TIMESTAMP;
    l_file_cached     BOOLEAN;
    l_file_rowtype    blog_file%ROWTYPE;
    l_arr             apex_application_global.vc_arr2;
    c_date_lang       CONSTANT VARCHAR2(255) := 'NLS_DATE_LANGUAGE=ENGLISH';
    c_date_format     CONSTANT VARCHAR2(255) := 'Dy, DD Mon YYYY HH24:MI:SS "GMT"';
    --SESSION_NOT_VALID EXCEPTION;
    FILE_NOT_ACTIVE   EXCEPTION;
    --PRAGMA EXCEPTION_INIT(SESSION_NOT_VALID, -20001);
    PRAGMA EXCEPTION_INIT(FILE_NOT_ACTIVE, -20002);
  BEGIN
    /*
    IF NOT apex_custom_auth.is_session_valid THEN
      apex_debug.warn('File download session is not valid: %s', p_session_id);
      raise_application_error(-20001, 'Unauthorized access - file will not be retrieved.');
    END IF;
    */
    l_file_cached := FALSE;
    l_arr := apex_util.string_to_table(p_file_name, '?');
    l_file_name := l_arr(1);
    l_utc := SYS_EXTRACT_UTC(SYSTIMESTAMP);
    SELECT *
    INTO l_file_rowtype
    FROM blog_file
    WHERE file_name = l_file_name
    ;
    IF NOT l_file_rowtype.active = 'Y' THEN
      raise_application_error(-20002, 'File is not available for download.');
    END IF;
    sys.owa_util.mime_header(COALESCE (l_file_rowtype.mime_type, 'application/octet'), FALSE);
    IF l_file_rowtype.file_type != 'FILE' THEN
      /* File type is not FILE, then use cache e.g. for images, css and JavaScript */
      /* Cache and ETag headers */
      sys.htp.p('Cache-Control: public, max-age=31536000');
      sys.htp.p('Date: '    || to_char(l_utc, c_date_format, c_date_lang));
      sys.htp.p('Expires: ' || to_char(l_utc + 365, c_date_format, c_date_lang));
      sys.htp.p('ETag: "'   || l_file_rowtype.file_etag || '"');
      /* Check if file is modified after last download */
      IF sys.owa_util.get_cgi_env('HTTP_IF_MODIFIED_SINCE') = l_file_rowtype.file_modified_since
      OR sys.owa_util.get_cgi_env('HTTP_IF_NONE_MATCH')  = l_file_rowtype.file_etag
      THEN
        sys.owa_util.status_line(
          nstatus       => 304,
          creason       => 'Not Modified',
          bclose_header => FALSE
        );
        l_file_cached := TRUE;
      ELSE
        sys.htp.p('Last-Modified : ' || l_file_rowtype.file_modified_since);
      END IF;
    ELSE
      IF apex_authorization.is_authorized('LOGGING_ENABLED') THEN
        /* Log file download */
        blog_log.write_file_log(l_file_rowtype.file_id);
        blog_log.write_activity_log(
          p_user_id       => p_user_id,
          p_session_id    => p_session_id,
          p_activity_type => 'DOWNLOAD',
          p_related_id    => l_file_rowtype.file_id
        );
      END IF;
      sys.htp.p('Content-Disposition: attachment; filename="' || l_file_rowtype.file_name || '"');
    END IF;
    IF NOT l_file_cached THEN
      sys.htp.p('Content-length: ' || l_file_rowtype.file_size);
      sys.wpg_docload.download_file(l_file_rowtype.blob_content);
    END IF;
    sys.owa_util.http_header_close;
    apex_application.stop_apex_engine;
  EXCEPTION WHEN 
    NO_DATA_FOUND
  THEN
    check_http410(l_file_name);
  WHEN
    VALUE_ERROR OR
    INVALID_NUMBER OR
    FILE_NOT_ACTIVE
  THEN
    blog_util.raise_http_error(l_file_name);
  END download_file;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION validate_email(
    p_email     IN VARCHAR2
  ) RETURN BOOLEAN
  AS
    l_is_valid    BOOLEAN := TRUE;
    l_dot_pos     SIMPLE_INTEGER := 0;
    l_at_pos      SIMPLE_INTEGER := 0;
    l_str_length  SIMPLE_INTEGER := 0;
  BEGIN
    IF p_email IS NOT NULL THEN
      l_dot_pos     := instr(p_email ,'.');
      l_at_pos      := instr(p_email ,'@');
      l_str_length  := LENGTH(p_email);
      IF (
        (l_dot_pos = 0)
        OR (l_at_pos = 0)
        --OR (l_dot_pos = l_at_pos - 1)
        OR (l_dot_pos = l_at_pos + 1)
        OR (l_at_pos = 1)
        OR (l_at_pos = l_str_length)
        OR (l_dot_pos = l_str_length)
        OR (l_str_length > 256)
      )
      THEN
        l_is_valid := FALSE;
      END IF;
      IF l_is_valid THEN
        l_is_valid := NOT instr(substr(p_email ,l_at_pos) ,'.') = 0;
      END IF;
    END IF;
    RETURN l_is_valid;
  END validate_email;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE get_article_page_items (
    p_article_id    IN VARCHAR2,
    p_page_title    OUT NOCOPY VARCHAR2,
    p_region_title  OUT NOCOPY VARCHAR2,
    p_keywords      OUT NOCOPY VARCHAR2,
    p_description   OUT NOCOPY VARCHAR2,
    p_author_name   OUT NOCOPY VARCHAR2,
    p_rate          OUT NOCOPY NUMBER    
  ) 
  AS
    l_article_id    NUMBER;
    l_category_name VARCHAR2(256);
  BEGIN
    /* Input parameter p_category_id is string because we handle invalid number exception */
    l_article_id := to_number(p_article_id);
    SELECT a.article_title,
      a.category_name,
      a.keywords,
      a.description,
      a.author_name,
      l.article_rate_int
    INTO p_page_title,
      l_category_name,
      p_keywords,
      p_description,
      p_author_name,
      p_rate
    FROM blog_v$article a
    LEFT JOIN blog_article_log l
    ON a.article_id = l.article_id
    WHERE a.article_id = l_article_id
    ;
    p_region_title  := apex_lang.message('REGION_TITLE_COMMENTS');
    p_keywords      := ltrim(trim(BOTH ',' FROM p_keywords) || ',' || l_category_name, ',');
    p_rate          := coalesce(p_rate, 0);
  EXCEPTION WHEN 
    NO_DATA_FOUND
  THEN
    check_http410(p_article_id);
  WHEN
    INVALID_NUMBER OR
    VALUE_ERROR
  THEN
    blog_util.raise_http_error(p_article_id);
  END get_article_page_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE get_category_page_items (
    p_category_id   IN VARCHAR2,
    p_page_title    OUT NOCOPY VARCHAR2,
    p_region_title  OUT NOCOPY VARCHAR2,
    p_category_name OUT NOCOPY VARCHAR2
  )
  AS
    l_category_id NUMBER;
  BEGIN
    /* Input parameter p_category_id is string because we handle invalid number exception */
    l_category_id := to_number(p_category_id);
    SELECT c.category_name
    INTO p_category_name
    FROM blog_category c
    WHERE c.category_id = l_category_id
    ;
    p_page_title    := apex_lang.message('PAGE_TITLE_CATEGORY', p_category_name);
    p_region_title  := apex_lang.message('REGION_TITLE_CATEGORY', apex_escape.html(p_category_name));
    p_category_name := p_category_name;
  EXCEPTION WHEN 
    NO_DATA_FOUND
  THEN
    check_http410(p_category_id);
  WHEN
    INVALID_NUMBER OR
    VALUE_ERROR
  THEN
    blog_util.raise_http_error(p_category_id);
  END get_category_page_items;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_UTIL";
/

CREATE OR REPLACE PACKAGE  "BLOG_PLUGIN" 
AUTHID DEFINER
AS
-------------------------------------------------------------------------------
  g_formatted_comment VARCHAR2(32700);
  g_question_answer   PLS_INTEGER;
-------------------------------------------------------------------------------
  FUNCTION render_comment_textarea(
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
  FUNCTION validate_comment_textarea(
    p_item   IN apex_plugin.t_page_item,
    p_plugin IN apex_plugin.t_plugin,
    p_value  IN VARCHAR2
  ) RETURN apex_plugin.t_page_item_validation_result;
--------------------------------------------------------------------------------
  FUNCTION feature_authorization (
    p_authorization in apex_plugin.t_authorization,
    p_plugin        in apex_plugin.t_plugin
  ) RETURN apex_plugin.t_authorization_exec_result;
--------------------------------------------------------------------------------
  FUNCTION render_math_question_field(
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
  FUNCTION ajax_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin
  ) RETURN apex_plugin.t_page_item_ajax_result;
--------------------------------------------------------------------------------
  FUNCTION validate_math_question_field(
    p_item   IN apex_plugin.t_page_item,
    p_plugin IN apex_plugin.t_plugin,
    p_value  IN VARCHAR2
  ) RETURN apex_plugin.t_page_item_validation_result;
--------------------------------------------------------------------------------
  FUNCTION render_simple_star_rating (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
  FUNCTION render_modal_confirm(
    p_dynamic_action IN apex_plugin.t_dynamic_action,
    p_plugin         IN apex_plugin.t_plugin
  ) RETURN apex_plugin.t_dynamic_action_render_result;
-------------------------------------------------------------------------------
  FUNCTION render_facebook_like_button (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
  FUNCTION render_twitter_button (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result;
-------------------------------------------------------------------------------
END "BLOG_PLUGIN";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_PLUGIN" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables, procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  g_whitelist_tags        CONSTANT VARCHAR2(200)  := '<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>';
  g_code_open             CONSTANT VARCHAR2(30)   := '<code>';
  g_code_close            CONSTANT VARCHAR2(30)   := '</code>';
  g_syntaxhighlight_open  CONSTANT VARCHAR2(100)  := '<pre class="brush:plain" style="background-color:#eeeeee;padding:2px;">';
  g_syntaxhighlight_close CONSTANT VARCHAR2(30)   := '</pre>';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION format_comment(
    p_comment         IN VARCHAR2,
    p_whitelist_tags  IN VARCHAR2
  ) RETURN VARCHAR2
  AS
    l_comment               VARCHAR2(32700);
    l_temp                  VARCHAR2(32700);
    l_len_s                 NUMBER := 0;
    l_len_e                 NUMBER := 0;
    l_count_open            SIMPLE_INTEGER := 0;
    l_count_close           SIMPLE_INTEGER := 0;
    l_start                 SIMPLE_INTEGER := 0;
    l_end                   SIMPLE_INTEGER := 0;
    l_comment_arr           apex_application_global.vc_arr2;
    l_code_arr              apex_application_global.vc_arr2;
  BEGIN
    l_len_s := LENGTH(g_code_open);
    l_len_e := LENGTH(g_code_close);
    /* Change all hash marks so we can escape those later*/
    l_comment := REPLACE(p_comment, '#', '$@#HASH#@$');
    /* escape comment html */
    l_comment := APEX_ESCAPE.HTML_WHITELIST (
      p_html            => l_comment,
      p_whitelist_tags  => p_whitelist_tags
    );
    /* Escape hash to e.g. prevent APEX substitutions */
    l_comment := REPLACE(l_comment, '$@#HASH#@$', '&#x23;');
    /* check code tag count */
    l_count_open  := regexp_count(l_comment, g_code_open);
    l_count_close := regexp_count(l_comment, g_code_close);
    /* Process code tags */
    IF l_count_open = l_count_close THEN
      /* Store text inside code tags to array while format rest of message*/
      FOR i IN 1 .. l_count_open
      LOOP
        l_start       := INSTR(l_comment, g_code_open);
        l_end         := INSTR(l_comment, g_code_close);
        l_code_arr(i) := g_syntaxhighlight_open
                      || SUBSTR(l_comment, l_start  + l_len_s, l_end - l_start - l_len_s)
                      || g_syntaxhighlight_close;
        l_comment     := SUBSTR(l_comment, 1, l_start -1)
                      || chr(10)
                      || '$@#' || i || '#@$'
                      || chr(10)
                      || SUBSTR(l_comment, l_end + l_len_e);
      END LOOP;
      /* Format message */
      l_comment_arr := APEX_UTIL.STRING_TO_TABLE(l_comment, chr(10));
      l_comment := NULL;
      FOR i IN 1 .. l_comment_arr.COUNT
      LOOP
        /* Remove empty lines and do not add extra tags for code */
        l_temp := TRIM(l_comment_arr(i));
        IF REGEXP_LIKE(l_temp, '^\$\@\#[0-9]+\#\@\$$') THEN
          l_comment := l_comment || l_temp;
        ELSIF l_temp IS NOT NULL THEN
          l_comment := l_comment || '<p>' || l_temp || '</p>';
        END IF;
      END LOOP;
      /* insert code tags back to comment */
      FOR i IN 1 .. l_code_arr.COUNT
      LOOP
        l_comment := REPLACE(l_comment, '$@#' || i || '#@$', l_code_arr(i));
      END LOOP;
    END IF;
    RETURN l_comment;
  END format_comment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION render_comment_textarea(
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result
  AS
    l_name        VARCHAR2(30);
    l_code        VARCHAR2(30);
    l_bold        VARCHAR2(30);
    l_italics     VARCHAR2(30);
    l_underline   VARCHAR2(30);
    l_styles      VARCHAR2(255);
    l_formatting  VARCHAR2(10);
    l_result      apex_plugin.t_page_item_render_result;
  BEGIN
    l_formatting := COALESCE(p_item.attribute_01, 'Y');
    IF p_is_readonly OR p_is_printer_friendly THEN
      -- emit hidden textarea if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_value,
        p_is_readonly => p_is_readonly,
        p_is_printer_friendly => p_is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    ELSE
      -- Because the page item saves state, we have to call get_input_name_for_page_item
      -- which generates the internal hidden p_arg_names textarea. It will also RETURN the
      -- HTML textarea name which we have to use when we render the HTML input textarea.
      l_name := apex_plugin.get_input_name_for_page_item(false);
      
      l_code      := apex_lang.lang('Code');
      l_bold      := apex_lang.lang('Bold');
      l_italics   := apex_lang.lang('Italics');
      l_underline := apex_lang.lang('Underline');
      IF l_formatting = 'Y' THEN
        sys.htp.p('<ul class="format-btn">');
        sys.htp.p(
          q'[<li><img onclick="addStyleTag('b',']' || p_item.name || q'[');" ]'
          || 'alt="' || l_bold  || '" '
          || 'title="' || l_bold  || '" '
          || 'src="' || p_plugin.file_prefix || q'[text-bold-20x22.png" /></li>]'
        );
        sys.htp.p(
          q'[<li><img onclick="addStyleTag('i',']' || p_item.name || q'[');" ]'
          || 'alt="' || l_italics ||'" '
          || 'title="' || l_italics ||'" '
          || 'src="' || p_plugin.file_prefix || q'[text-italics-20x22.png" /></li>]'
        );
        sys.htp.p(
          q'[<li><img onclick="addStyleTag('u',']' || p_item.name || q'[');" ]'
          || 'alt="' || l_underline || '" '
          || 'title="' || l_underline || '" '
          || 'src="' || p_plugin.file_prefix || q'[text-underline-20x22.png" /></li>]'
        );
        sys.htp.p(
          q'[<li><img onclick="addStyleTag('code',']' || p_item.name || q'[');" ]'
          || 'alt="' || l_code  || ' " '
          || 'title="' || l_code  || '" '
          || 'src="' || p_plugin.file_prefix || q'[code-20x22.png" /></li>]'
        );
        sys.htp.p('</ul>');
        sys.htp.p(
          '<div>'
          || APEX_ESCAPE.HTML (apex_lang.message('MSG_ALLOWED_HTML_TAGS'))
          || '</div>'
        );
      END IF;
      sys.htp.prn('<textarea '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'textarea')
        || 'cols="' || p_item.element_width ||'" '
        || 'rows="' || p_item.element_height ||'" '
        || 'maxlength="' || p_item.element_max_length || '">'
      );
      apex_plugin_util.print_escaped_value(p_value);
      sys.htp.p('</textarea>');
      -- Tell APEX that this textarea is navigable
      l_result.is_navigable := true;
    END IF;
    RETURN l_result;
  END render_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION validate_comment_textarea(
    p_item   IN apex_plugin.t_page_item,
    p_plugin IN apex_plugin.t_plugin,
    p_value  IN VARCHAR2
  ) RETURN apex_plugin.t_page_item_validation_result
  AS
    l_formatting  VARCHAR2(10);
    l_tmp_item    VARCHAR2(30);
    l_comment     XMLTYPE;
    l_is_valid    BOOLEAN;
    l_result      apex_plugin.t_page_item_validation_result;
    xml_parse_err EXCEPTION;
    PRAGMA EXCEPTION_INIT (xml_parse_err , -31011);
  BEGIN
    l_formatting := COALESCE(p_item.attribute_01, 'Y');
    l_tmp_item := p_item.attribute_02;
    blog_plugin.g_formatted_comment := p_value;
    /* Remove some ascii codes */
    FOR i IN 0 .. 31
    LOOP
      IF i != 10 THEN
        blog_plugin.g_formatted_comment := TRIM(REPLACE(blog_plugin.g_formatted_comment, chr(i)));
      END IF;
    END LOOP;
    IF blog_plugin.g_formatted_comment IS NULL THEN
      RETURN NULL;
    END IF;
    IF LENGTH(blog_plugin.g_formatted_comment) >= p_item.element_max_length THEN
      l_is_valid := FALSE;
      l_result.message := apex_lang.message('VALIDATION_COMMENT_LENGTH', p_item.plain_label, p_item.element_max_length);
    ELSE
      l_is_valid := TRUE;
    END IF;
    IF l_is_valid THEN
      /* Format value */
      IF l_formatting = 'Y' THEN
        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, g_whitelist_tags);
      ELSE
        blog_plugin.g_formatted_comment := blog_plugin.format_comment(blog_plugin.g_formatted_comment, NULL);
      END IF;
      /* Validate value html tags */
      BEGIN
        l_comment := xmlType.createXML(
            '<root><row>' 
          || blog_plugin.g_formatted_comment
          || '</row></root>'
        );
      EXCEPTION
      WHEN xml_parse_err THEN
        l_is_valid := FALSE;
        apex_debug.error('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
      WHEN OTHERS THEN
        apex_debug.error('%s : %s', sys.dbms_utility.format_error_backtrace, sqlerrm);
        l_is_valid := FALSE;
      END;
      IF NOT l_is_valid THEN
        l_is_valid := FALSE;
        l_result.message := apex_lang.message('VALIDATION_COMMENT_FORMAT', p_item.plain_label);
      END IF;
    END IF;
    RETURN l_result;
  END validate_comment_textarea;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION feature_authorization (
    p_authorization in apex_plugin.t_authorization,
    p_plugin        in apex_plugin.t_plugin
  ) RETURN apex_plugin.t_authorization_exec_result
  AS
    l_count         NUMBER;
    l_feature_name  VARCHAR(100);
    l_result        apex_plugin.t_authorization_exec_result; -- result object to RETURN
  BEGIN
    l_feature_name := p_authorization.attribute_01;
    SELECT COUNT(1)
    INTO l_count
    FROM blog_param c
    LEFT JOIN blog_param p ON c.param_parent = p.param_id
    WHERE c.param_id = l_feature_name
      AND c.param_value = 'Y' 
      AND CASE WHEN p.param_type = 'YESNO'
      THEN p.param_value ELSE 'Y' END = 'Y'
    ;
    l_result.is_authorized := l_count > 0;
    RETURN l_result;
END feature_authorization;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION render_math_question_field(
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result
  AS
    l_name        VARCHAR2(30);
    l_answer_item VARCHAR2(30);
    l_result      apex_plugin.t_page_item_render_result;
  BEGIN
    l_name        := apex_plugin.get_input_name_for_page_item(false);
    l_answer_item := p_item.attribute_01;
    
    IF p_is_readonly OR p_is_printer_friendly THEN
      -- emit hidden textarea if necessary
      apex_plugin_util.print_hidden_if_readonly (
        p_item_name => p_item.name,
        p_value => p_value,
        p_is_readonly => p_is_readonly,
        p_is_printer_friendly => p_is_printer_friendly
      );
      -- emit display span with the value
      apex_plugin_util.print_display_only (
        p_item_name => p_item.name,
        p_display_value => p_value,
        p_show_line_breaks => false,
        p_escape => true,
        p_attributes => p_item.element_attributes
      );
    ELSE
      sys.htp.p('<input type="text" '
        || 'size="' || p_item.element_width ||'" '
        || 'maxlength="' || p_item.element_max_length || '" '
        || apex_plugin_util.get_element_attributes(p_item, l_name, 'text_field')
        || 'value="" />'
      );
      apex_javascript.add_onload_code (
        p_code => 'apex.server.plugin("' || apex_plugin.get_ajax_identifier || '",{},{'
        || 'dataType:"html",'
        || 'success:function(data){'
        || '$("'
        || apex_plugin_util.page_item_names_to_jquery(p_item.name) 
        || '").before(data).siblings("label,br").remove()}'
        || '});'
      );
      -- Tell APEX that this textarea is navigable
      l_result.is_navigable := true;
    END IF;
    RETURN l_result;
  END render_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION ajax_math_question_field(
    p_item   in apex_plugin.t_page_item,
    p_plugin in apex_plugin.t_plugin
  ) RETURN apex_plugin.t_page_item_ajax_result
  AS
    l_tmp         VARCHAR2(255);
    l_answer_item VARCHAR2(30);
    l_min_1       PLS_INTEGER := 1;
    l_max_1       PLS_INTEGER := 1;
    l_min_2       PLS_INTEGER := 1;
    l_max_2       PLS_INTEGER := 1;
    l_arr         apex_application_global.vc_arr2;
    l_result      apex_plugin.t_page_item_ajax_result;
  BEGIN
    l_answer_item := p_item.attribute_01;
    l_min_1       := p_item.attribute_02;
    l_max_1       := p_item.attribute_03;
    l_min_2       := p_item.attribute_04;
    l_max_2       := p_item.attribute_05;
    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_1, l_max_1));
    l_arr(1)      := ROUND(sys.dbms_random.VALUE(l_min_2, l_max_2));
    FOR n IN 1 .. 2
    LOOP
      l_arr(n) := ROUND(sys.dbms_random.VALUE(1, 40));
      FOR i IN 1 .. LENGTH(l_arr(n))
      LOOP
        l_tmp := l_tmp || '&#' || ASCII(SUBSTR(l_arr(n), i, 1));
      END LOOP;
      IF n = 1 THEN
        l_tmp := l_tmp || '&nbsp;&#' || ASCII('+') || '&nbsp;';
      END IF;
    END LOOP;
    -- Write header for the output.
    sys.owa_util.mime_header('text/html', false);
    sys.htp.p('Cache-Control: no-cache');
    sys.htp.p('Pragma: no-cache');
    --sys.htp.p('X-Robots-Tag    noindex,follow');
    sys.owa_util.http_header_close;
    sys.htp.p('<p>' || apex_lang.message('MSG_MATH_QUESTION', '</p><span>' ||l_tmp || '&nbsp;&#' || ASCII('=') || '</span>'));
    /* set correct answer to item session state */
    apex_util.set_session_state(l_answer_item, TO_NUMBER(l_arr(1)) + TO_NUMBER(l_arr(2)));
    RETURN l_result;
  EXCEPTION WHEN OTHERS
  THEN
    sys.htp.prn(wwv_flow_lang.system_message('ajax_server_error'));
    RETURN l_result;
  END ajax_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION validate_math_question_field(
    p_item   IN apex_plugin.t_page_item,
    p_plugin IN apex_plugin.t_plugin,
    p_value  IN VARCHAR2
  ) RETURN apex_plugin.t_page_item_validation_result
  AS
    l_answer_item VARCHAR2(30);
    l_value       SIMPLE_INTEGER := 0;
    l_answer      SIMPLE_INTEGER := 0;
    l_is_valid    BOOLEAN;
    l_result      apex_plugin.t_page_item_validation_result;
  BEGIN
    l_answer_item := p_item.attribute_01;
    IF p_value IS NULL THEN
      RETURN NULL;
    END IF;
    BEGIN
      l_is_valid := TO_NUMBER(p_value) = nv(l_answer_item);
    EXCEPTION WHEN 
    VALUE_ERROR OR 
    INVALID_NUMBER
    THEN
      l_is_valid := FALSE;
    END;
    IF NOT l_is_valid THEN
      l_result.message := apex_lang.message('VALIDATION_MATH_QUESTION', p_item.plain_label);
    END IF;
    RETURN l_result;
  END validate_math_question_field;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION render_simple_star_rating (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result
  AS 
    l_result apex_plugin.t_page_item_render_result;
  BEGIN
    l_result.is_navigable := (p_is_readonly = false and p_is_printer_friendly = false);
    sys.htp.prn(
      '<div id="' || p_item.name || '" class="rating" data-val="' || p_value || '">'
      || '<ul>'
    );
    for i in 1 .. 5 loop
        sys.htp.prn(
          '<li id="' || p_item.name ||'_' || i || '" title="' || i || '" '
          || case when l_result.is_navigable then
            case when i <=  p_value then 'class="active enabled"' else 'class="enabled"' end
          else
            case when i <=  p_value then 'class="active"' end
          end
          || '/></li>'
        );
    end loop;
    sys.htp.prn('</ul>');
    if l_result.is_navigable then
      apex_javascript.add_onload_code (p_code => '$("'
        || apex_plugin_util.page_item_names_to_jquery(p_item.name) 
        || '").starRating();'
      );
      sys.htp.p(
        '<div id="' || p_item.name ||'_DIALOG" class="hideMe508">'
        || apex_lang.message('DIALOG_ARTICLE_RATED')
        || '</div>'
      );
      apex_javascript.add_library (
        p_name    => 'jquery.ui.button',
        p_check_to_add_minified    => true,
        p_directory => apex_application.g_image_prefix || 'libraries/jquery-ui/1.8.22/ui/minified/'
      );
    end if;
    sys.htp.p('</div>');
    RETURN l_result;
  END render_simple_star_rating;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION render_modal_confirm(
    p_dynamic_action IN apex_plugin.t_dynamic_action,
    p_plugin         IN apex_plugin.t_plugin
  ) RETURN apex_plugin.t_dynamic_action_render_result
  AS
    l_result apex_plugin.t_dynamic_action_render_result;
  BEGIN
    apex_javascript.add_inline_code (
      p_code => 'function net_webhop_dbswh_modal_confirm(){'
        || 'this.affectedElements.data("request",this.triggeringElement.id).dialog({'
        || 'modal:true,'
        || 'buttons:{'
        || '"' || apex_lang.lang('OK') || '":function(){$(this).dialog("close");apex.submit($(this).data("request"));},'
        || '"' || apex_lang.lang('Cancel') || '":function(){$(this).dialog("close")}'
        || '}})}'
      ,p_key  => 'net.webhop.dbswh.modal_confirm'
    );
    l_result.javascript_function := 'net_webhop_dbswh_modal_confirm';
    RETURN l_result;
  END render_modal_confirm;
--===============================================================================
-- Renders the Facebook "Like" button widget based on the configuration of the
-- page item.
--===============================================================================
  FUNCTION render_facebook_like_button (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result
  AS
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');
    
    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_like  varchar2(20)   := nvl(p_item.attribute_01, 'current_page');
    l_page_url     varchar2(4000) := p_item.attribute_02;
    l_custom_url   varchar2(4000) := p_item.attribute_03;
    l_layout_style varchar2(15)   := nvl(p_item.attribute_04, 'standard');
    l_show_faces   boolean        := (nvl(p_item.attribute_05, 'Y') = 'Y');
    l_width        number         := p_item.attribute_06;
    l_verb         varchar2(15)   := nvl(p_item.attribute_07, 'like');
    l_font         varchar2(15)   := p_item.attribute_08;
    l_color_scheme varchar2(15)   := nvl(p_item.attribute_09, 'light');
    
    l_url          varchar2(4000);
    l_height       number;
    l_result       apex_plugin.t_page_item_render_result;
  BEGIN
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        RETURN null;
    end if;
      
    -- Get the width and the height depending on the picked layout style
    if l_width is null then
        l_width := case l_layout_style
                     when 'standard'     then 450
                     when 'button_count' then 90
                     when 'box_count'    then 55
                   end;
    end if;
    
    l_height := case l_layout_style
                  when 'standard'     then case when l_show_faces then 80 else 35 end
                  when 'button_count' then 20
                  when 'box_count'    then 65
                end;

    -- Base URL for the "Like" widget.
    -- See http://developers.facebook.com/docs/reference/plugins/like
    -- for a documentation of the URL syntax
    l_url := '//www.facebook.com/plugins/like.php?href=';
    
    -- Generate the "Like" URL based on our URL to Like setting.
    -- Note: Always use session 0, otherwise Facebook will not be able to get the page.
    l_url := l_url||
             utl_url.escape (
                 url => case l_url_to_like
                          when 'current_page' then c_host||'f?p='||apex_application.g_flow_id||':'||apex_application.g_flow_step_id||':0'
                          when 'page_url'     then c_host||l_page_url
                          when 'custom_url'   then replace(l_custom_url, '#HOST#', c_host)
                          when 'value'        then replace(p_value, '#HOST#', c_host)
                        end,
                 escape_reserved_chars => true)||
             '&amp;';

    -- Add the display options for the "Like" button widget
    l_url := l_url||
             'layout='||l_layout_style||'&amp;'||
             case when l_layout_style = 'standard' then
                 'show_faces='||case when l_show_faces then 'true' else 'false' end||'&amp;'
             end||
             'width='||l_width||'&amp;'||
             'action='||l_verb||'&amp;'||
             case when l_font is not null then 'font='||l_font||'&amp;' end||
             'colorscheme='||l_color_scheme||'&amp;'||
             'height='||l_height;

    -- Output the Facebook Like button widget
    sys.htp.prn('<iframe src="'||l_url||'" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:'||l_width||'px; height:'||l_height||'px;" allowTransparency="true"></iframe>');

    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;

    RETURN l_result;
  END render_facebook_like_button;
--===============================================================================
-- Renders the Twitter button widget based on the configuration of the
-- page item.
--===============================================================================
  FUNCTION render_twitter_button (
    p_item                IN apex_plugin.t_page_item,
    p_plugin              IN apex_plugin.t_plugin,
    p_value               IN VARCHAR2,
    p_is_readonly         IN BOOLEAN,
    p_is_printer_friendly IN BOOLEAN
  ) RETURN apex_plugin.t_page_item_render_result
  AS
    c_host constant varchar2(4000) := apex_util.host_url('SCRIPT');
    
    -- It's better to have named variables instead of using the generic ones,
    -- makes the code more readable.
    -- We are using the same defaults for the required attributes as in the
    -- plug-in attribute configuration, because they can still be null.
    -- Note: Keep them in sync!
    l_url_to_like     varchar2(20)   := nvl(p_item.attribute_01, 'current_page');
    l_page_url        varchar2(4000) := p_item.attribute_02;
    l_custom_url      varchar2(4000) := p_item.attribute_03;
    l_layout_style    varchar2(15)   := nvl(p_item.attribute_04, 'vertical');
    l_tweet_text_type varchar2(10)   := nvl(p_item.attribute_05, 'page_title');
    l_custom_text     varchar2(140)  := sys.htf.escape_sc(p_item.attribute_06);
    l_follow1         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_07);
    l_follow2         varchar2(4000) := sys.htf.escape_sc(p_item.attribute_08);
    
    l_url             varchar2(4000);
    l_result          apex_plugin.t_page_item_render_result;
  BEGIN
    -- Don't show the widget if we are running in printer friendly mode
    if p_is_printer_friendly then
        RETURN null;
    end if;
    
    -- Generate the Tweet URL based on our URL setting.
    -- Note: Always use session 0, otherwise Twitter will always register a different URL.
    l_url := case l_url_to_like
               when 'current_page' then c_host||'f?p='||apex_application.g_flow_id||':'||apex_application.g_flow_step_id||':0'
               when 'page_url'     then c_host||l_page_url
               when 'custom_url'   then replace(l_custom_url, '#HOST#', c_host)
               when 'value'        then replace(p_value, '#HOST#', c_host)
             end;

    -- For a custom text we have to replace the #PAGE_TITLE# placeholder with the correct
    -- language dependent page title of the current page.
    if l_tweet_text_type = 'custom' then
        if instr(l_custom_text, '#PAGE_TITLE') > 0 then
            select replace(l_custom_text, '#PAGE_TITLE#', apex_application.do_substitutions(page_title, 'ESC'))
              into l_custom_text
              from apex_application_pages
             where application_id = nvl(apex_application.g_translated_flow_id, apex_application.g_flow_id)
               and page_id        = nvl(apex_application.g_translated_page_id, apex_application.g_flow_step_id);
        end if;
    end if;

    -- Output the Twitter button widget
    -- See http://twitter.com/about/resources/tweetbutton for syntax
    sys.htp.prn (
        '<a href="//twitter.com/share" class="twitter-share-button" data-url="'||sys.htf.escape_sc(l_url)||'" '||
        case when l_tweet_text_type = 'custom' then 'data-text="'||l_custom_text||'" ' end||
        'data-count="'||l_layout_style||'" '||
        case when l_follow1 is not null then 'data-via="'||l_follow1||'" ' end||
        case when l_follow2 is not null then 'data-related="'||l_follow2||'" ' end||
        '>Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>' );

    -- Tell APEX that this field is NOT navigable
    l_result.is_navigable := false;

    RETURN l_result;
  END render_twitter_button;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_PLUGIN";
/

CREATE OR REPLACE PACKAGE  "BLOG_LOG" 
AUTHID DEFINER
AS
-------------------------------------------------------------------------------
  FUNCTION apex_error_handler(
    p_error IN apex_error.t_error
  ) RETURN apex_error.t_error_result;
--------------------------------------------------------------------------------
  PROCEDURE write_activity_log(
    p_user_id         IN NUMBER,
    p_activity_type   IN VARCHAR2,
    p_session_id      IN NUMBER,
    p_related_id      IN NUMBER DEFAULT 0,
    p_ip_address      IN VARCHAR2 DEFAULT NULL,
    p_user_agent      IN VARCHAR2 DEFAULT NULL,
    p_referer         IN VARCHAR2 DEFAULT NULL,
    p_search_type     IN VARCHAR2 DEFAULT NULL,
    p_search          IN VARCHAR2 DEFAULT NULL,
    p_country_code    IN VARCHAR2 DEFAULT NULL,
    p_region          IN VARCHAR2 DEFAULT NULL,
    p_city            IN VARCHAR2 DEFAULT NULL,
    p_latitude        IN NUMBER DEFAULT NULL,
    p_longitude       IN NUMBER DEFAULT NULL,
    p_additional_info IN VARCHAR2 DEFAULT NULL
  );
--------------------------------------------------------------------------------
  PROCEDURE write_article_log(
    p_article_id      IN NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE rate_article(
    p_article_id      IN NUMBER,
    p_article_rate    IN OUT NOCOPY NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE write_category_log(
    p_category_id     IN NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE write_file_log(
    p_file_id         IN NUMBER
  );
--------------------------------------------------------------------------------
END "BLOG_LOG";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_LOG" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  INSERT_NULL_VALUE EXCEPTION;
  PARENT_NOT_FOUND  EXCEPTION;
  PRAGMA EXCEPTION_INIT(INSERT_NULL_VALUE, -1400);
  PRAGMA EXCEPTION_INIT(PARENT_NOT_FOUND, -2291);
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION apex_error_handler(
    p_error IN apex_error.t_error
  ) RETURN apex_error.t_error_result
  AS
    l_result          apex_error.t_error_result;
    l_error           apex_error.t_error;
    l_reference_id    PLS_INTEGER;
    l_constraint_name VARCHAR2(255);
    l_err_msg         VARCHAR2(32700);
  BEGIN
    l_result := apex_error.init_error_result ( p_error => p_error );
    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    IF p_error.is_internal_error THEN
      -- Access Denied errors raised by application or page authorization should
      -- still show up with the original error message
      IF NOT p_error.apex_error_code LIKE 'APEX.SESSION_STATE.%'
      AND NOT p_error.apex_error_code = 'APEX.AUTHORIZATION.ACCESS_DENIED'
      AND NOT p_error.apex_error_code = 'APEX.PAGE.DUPLICATE_SUBMIT'
      AND NOT p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
      AND NOT p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
      THEN
        -- log error for example with an autonomous transaction and return
        -- l_reference_id as reference#
        -- l_reference_id := log_error (
        --                       p_error => p_error );
        --
        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.
        -- log error to application debug information
        apex_debug.error(
          'Error handler: %s %s %s',
           p_error.apex_error_code,
           l_result.message,
           l_result.additional_info
        );
        l_result.message := apex_lang.message('GENERAL_ERROR');
        l_result.additional_info := NULL;
      END IF;
    ELSE
      /*
      -- Show the error as inline error
      l_result.display_location :=
      CASE
      WHEN l_result.display_location = apex_error.c_on_error_page THEN
        apex_error.c_inline_in_notification
      ELSE
        l_result.display_location
      END;
      */
      -- If it's a constraint violation like
      --
      --   -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated
      --   -) : transaction rolled back (-> can hide a deferred constraint)
      --   -) : check constraint violated
      --   -) : integrity constraint violated - parent key not found
      --   -) : integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from our constraint lookup configuration.
      -- If we don't find the constraint in our lookup table we fallback to
      -- the original ORA error message.
      IF p_error.ora_sqlcode IN (-1, -2091, -2290, -2291, -2292) THEN
        l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );
        l_err_msg := apex_lang.message(l_constraint_name);
        -- not every constraint has to be in our lookup table
        IF NOT l_err_msg = l_constraint_name THEN
          l_result.message := l_err_msg;
        END IF;
      END IF;
      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
      -- in a table trigger or in a PL/SQL package called by a process and we
      -- haven't found the error in our lookup table, then we just want to see
      -- the actual error text and not the full error stack with all the ORA error numbers.
      IF p_error.ora_sqlcode IS NOT NULL AND l_result.message = p_error.message THEN
        l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );
      END IF;
      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      IF l_result.page_item_name IS NULL AND l_result.column_alias IS NULL THEN
        apex_error.auto_set_associated_item ( p_error => p_error, p_error_result => l_result );
      END IF;
    END IF;
    RETURN l_result;
  END apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE write_activity_log(
    p_user_id         IN NUMBER,
    p_activity_type   IN VARCHAR2,
    p_session_id      IN NUMBER,
    p_related_id      IN NUMBER DEFAULT 0,
    p_ip_address      IN VARCHAR2 DEFAULT NULL,
    p_user_agent      IN VARCHAR2 DEFAULT NULL,
    p_referer         IN VARCHAR2 DEFAULT NULL,
    p_search_type     IN VARCHAR2 DEFAULT NULL,
    p_search          IN VARCHAR2 DEFAULT NULL,
    p_country_code    IN VARCHAR2 DEFAULT NULL,
    p_region          IN VARCHAR2 DEFAULT NULL,
    p_city            IN VARCHAR2 DEFAULT NULL,
    p_latitude        IN NUMBER DEFAULT NULL,
    p_longitude       IN NUMBER DEFAULT NULL,
    p_additional_info IN VARCHAR2 DEFAULT NULL
  )
  AS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    INSERT /*+ append */ INTO blog_activity_log (
      ACTIVITY_TYPE,
      APEX_SESSION_ID,
      IP_ADDRESS,
      RELATED_ID,
      USER_ID,
      LATITUDE,
      LONGITUDE,
      COUNTRY_CODE,
      COUNTRY_REGION,
      COUNTRY_CITY,
      HTTP_USER_AGENT,
      HTTP_REFERER,
      SEARCH_TYPE,
      SEARCH_CRITERIA,
      ADDITIONAL_INFO
    ) VALUES (
      p_activity_type,
      p_session_id,
      p_ip_address,
      p_related_id,
      p_user_id,
      p_latitude,
      p_longitude,
      p_country_code,
      p_region,
      p_city,
      p_user_agent,
      p_referer,
      p_search_type,
      p_search,
      p_additional_info
    );
    COMMIT;
  END write_activity_log;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE write_article_log(
    p_article_id  IN NUMBER
  )
  AS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    MERGE INTO blog_article_log a
    USING (SELECT p_article_id AS article_id FROM DUAL) b
    ON (a.article_id = b.article_id)
    WHEN MATCHED THEN
    UPDATE SET a.view_count = a.view_count + 1,
      a.last_view = SYSDATE
    WHEN NOT MATCHED THEN
    INSERT (article_id, view_count, last_view)
    VALUES (b.article_id, 1, SYSDATE)
    ;
    COMMIT;
  EXCEPTION WHEN 
  VALUE_ERROR OR
  INVALID_NUMBER OR
  PARENT_NOT_FOUND OR
  INSERT_NULL_VALUE
  THEN
      apex_debug.warn('blog_log.write_article_log(p_article_id => %s); error: %s', COALESCE(to_char(p_article_id), 'NULL'), sqlerrm);
  END write_article_log;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE rate_article(
    p_article_id    IN NUMBER,
    p_article_rate  IN OUT NOCOPY NUMBER
  )
  AS
    l_rate NUMBER;
  BEGIN
    UPDATE blog_article_log
      SET article_rate      = (article_rate * rate_click + p_article_rate) / (rate_click + 1),
          article_rate_int  = ROUND( (article_rate * rate_click + p_article_rate) / (rate_click + 1) ),
          rate_click        = rate_click + 1,
          last_rate         = SYSDATE
    WHERE article_id = p_article_id
    RETURNING article_rate_int INTO l_rate
    ;
    sys.htp.prn(l_rate);
  END rate_article;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE write_category_log(
    p_category_id  IN NUMBER
  )
  AS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    MERGE INTO blog_category_log a
    USING (SELECT p_category_id AS category_id FROM DUAL) b
    ON (a.category_id = b.category_id)
    WHEN MATCHED THEN
    UPDATE SET a.view_count = a.view_count + 1,
      a.last_view = SYSDATE
    WHEN NOT MATCHED THEN
    INSERT (category_id, view_count, last_view)
    VALUES (b.category_id, 1, SYSDATE)
    ;
    COMMIT;
  EXCEPTION WHEN
    VALUE_ERROR OR
    INVALID_NUMBER OR
    PARENT_NOT_FOUND OR
    INSERT_NULL_VALUE
  THEN
    apex_debug.warn('blog_log.write_category_log(p_category_id => %s); error: %s', COALESCE(to_char(p_category_id), 'NULL'), sqlerrm);
  END write_category_log;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE write_file_log(
    p_file_id  IN NUMBER
  )
  AS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    MERGE INTO blog_file_log a
    USING (SELECT p_file_id AS file_id FROM DUAL) b
    ON (a.file_id = b.file_id)
    WHEN MATCHED THEN
    UPDATE SET a.click_count = a.click_count + 1,
      last_click = SYSDATE
    WHEN NOT MATCHED THEN
    INSERT (file_id, click_count, last_click)
    VALUES (b.file_id, 1, SYSDATE)
    ;
    COMMIT;
  EXCEPTION WHEN
  VALUE_ERROR OR
  INVALID_NUMBER OR
  PARENT_NOT_FOUND OR
  INSERT_NULL_VALUE
  THEN
    apex_debug.warn('blog_log.write_file_log(p_file_id => %s); error: %s', COALESCE(to_char(p_file_id), 'NULL'), sqlerrm);
  END write_file_log;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_LOG";
/

CREATE OR REPLACE PACKAGE  "BLOG_JOB" 
AUTHID DEFINER
AS
-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE rotate_log;
--------------------------------------------------------------------------------
  PROCEDURE update_country;
--------------------------------------------------------------------------------
  PROCEDURE update_activity_logs;
--------------------------------------------------------------------------------
  PROCEDURE purge_preview;
--------------------------------------------------------------------------------
  PROCEDURE rotate_log_job(
    p_interval IN PLS_INTEGER DEFAULT NULL
  );
--------------------------------------------------------------------------------
  PROCEDURE update_country_job (
    p_drop_only BOOLEAN DEFAULT FALSE
  );
--------------------------------------------------------------------------------
  PROCEDURE update_activity_logs_job (
    p_drop_only BOOLEAN DEFAULT FALSE
  );
--------------------------------------------------------------------------------
  PROCEDURE purge_preview_job(
    p_drop_only BOOLEAN DEFAULT FALSE
  );
--------------------------------------------------------------------------------
END "BLOG_JOB";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_JOB" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables, procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE get_host_ip_info (
    p_ip            IN VARCHAR2,
    p_city          OUT NOCOPY VARCHAR2,
    p_country_code  OUT NOCOPY VARCHAR2
  )
  AS
    l_clob  CLOB;
    l_url   CONSTANT VARCHAR2(32000) := 'http://api.hostip.info/';
  BEGIN
    l_clob := apex_web_service.make_rest_request(
                p_url         => l_url,
                p_http_method => 'GET',
                p_parm_name   => apex_util.string_to_table('ip'),
                p_parm_value  => apex_util.string_to_table(p_ip)
              );
    BEGIN
      SELECT EXTRACTVALUE(VALUE(t), '//gml:name', 'xmlns:gml="http://www.opengis.net/gml"')  AS city,
        EXTRACTVALUE(VALUE(t), '//countryAbbrev', 'xmlns:gml="http://www.opengis.net/gml"')  AS countryAbbrev
      INTO p_city, p_country_code
      FROM TABLE(
        XMLSEQUENCE(
          XMLTYPE.CREATEXML(l_clob).EXTRACT(
            'HostipLookupResultSet/gml:featureMember/Hostip',
            'xmlns:gml="http://www.opengis.net/gml"'
          )
        )
      ) t;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      p_city          := NULL;
      p_country_code  := NULL;
    END;
 
  END get_host_ip_info;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE rotate_log
  AS
    l_new_tbl VARCHAR2(4000);
    l_log_tbl CHAR(1);
  BEGIN
  
    SELECT SUBSTR(table_name, -1) AS log_tbl
    INTO l_log_tbl
    FROM user_synonyms
    WHERE synonym_name = 'BLOG_ACTIVITY_LOG'
    ;
    
    IF l_log_tbl = '1' THEN
      l_new_tbl := '2';
    ELSIF l_log_tbl = '2' THEN
      l_new_tbl := '1';
    ELSE
      raise_application_error(-20001, 'Invalid log table.');
    END IF;
    
    EXECUTE IMMEDIATE 'TRUNCATE TABLE BLOG_ACTIVITY_LOG' || l_new_tbl;
    
    EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM BLOG_ACTIVITY_LOG FOR BLOG_ACTIVITY_LOG' || l_new_tbl;
  
  END rotate_log;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE update_country
  AS
    l_city    VARCHAR2(2000);
    l_code    VARCHAR2(2000);
    l_count   NUMBER;
  BEGIN
  
    /* Get distinct ip addreses where is no country information. */
    FOR c1 IN(
      SELECT DISTINCT ip_address
      FROM blog_activity_log
      WHERE activity_type = 'NEW_SESSION'
      AND country_code IS NULL
    ) LOOP
    
      l_count := 0;
      l_city  := NULL;
      l_code  := NULL;
      
      /* Check from logs if ip address already have country information from previous visit */
      BEGIN
        WITH qry AS (
          SELECT
            ROW_NUMBER() OVER(ORDER BY activity_date DESC) AS rn,
            country_city,
            country_code
          FROM blog_v$activity_log
          WHERE activity_type = 'NEW_SESSION'
          AND ip_address = c1.ip_address
          AND country_code IS NOT NULL
        )
        SELECT
          country_city,
          country_code
        INTO l_city, l_code
        FROM qry
        WHERE rn = 1
        ;
      /* If no previous visit get country info from hostip.info */
      EXCEPTION WHEN NO_DATA_FOUND THEN    
        get_host_ip_info(
          p_ip            => c1.ip_address,
          p_city          => l_city,
          p_country_code  => l_code
        );
      END;
      
      l_city  := COALESCE(l_city, '(unknown city)');
      l_code  := COALESCE(l_code, 'XX');
      
      /* Update activity log if country code exists in BLOG_COUNTRY table */
      UPDATE blog_activity_log
      SET country_city  = l_city,
        country_code    = l_code
      WHERE activity_type = 'NEW_SESSION'
        AND ip_address  = c1.ip_address
        AND country_code IS NULL
        AND EXISTS (
          SELECT 1
          FROM blog_country c
          WHERE c.country_code = l_code
        )
      ;
      l_count := SQL%ROWCOUNT;
      
      /* If no rows updated, country code is unknown */
      IF l_count = 0 THEN
        l_code := 'XX';    
        UPDATE blog_activity_log
        SET country_city  = l_city,
          country_code    = l_code
        WHERE activity_type = 'NEW_SESSION'
          AND ip_address  = c1.ip_address
          AND country_code IS NULL
          ;
        l_count := SQL%ROWCOUNT;
      END IF;
      
      /* Update total visitors from country */
      UPDATE blog_country
      SET visit_count = visit_count + l_count
      WHERE country_code = l_code
      ;
      
    END LOOP;
    
  END update_country;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE update_activity_logs
  AS
  BEGIN
    dbms_mview.refresh('BLOG_ARTICLE_HIT20,BLOG_ARTICLE_TOP20');
  END update_activity_logs;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE purge_preview
  AS
  BEGIN
    /* Delete from blog_article_preview rows where session is expired */
    DELETE FROM blog_article_preview p
    WHERE NOT EXISTS (
      SELECT 1 FROM apex_workspace_sessions s
      WHERE s.apex_session_id = p.apex_session_id
    );
  END purge_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE rotate_log_job(
    p_interval IN PLS_INTEGER DEFAULT NULL
  )
  AS
    l_interval        SIMPLE_INTEGER := 0;
    c_job             CONSTANT VARCHAR2(30) := 'BLOG_ROTATE_LOG';
    job_not_exists    EXCEPTION;
    PRAGMA            EXCEPTION_INIT(job_not_exists, -27475);
  BEGIN
    BEGIN
      sys.dbms_scheduler.drop_job(c_job);
    EXCEPTION WHEN job_not_exists THEN
      NULL;
    END;
    
    IF p_interval IS NULL THEN
      l_interval := blog_util.get_param_value('LOG_ROTATE_DAY');
    ELSE
      l_interval := p_interval;
    END IF;
    IF l_interval > 0 THEN
      sys.dbms_scheduler.create_job(
        job_name        => c_job,
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'blog_job.rotate_log',
        start_date      => TRUNC(SYSTIMESTAMP),
        enabled         => TRUE,
        repeat_interval => 'FREQ=DAILY;INTERVAL=' || l_interval,
        comments        => 'Rotate blog activity logs'
      );
    END IF;
  END rotate_log_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE update_country_job (
    p_drop_only BOOLEAN DEFAULT FALSE
  )
  AS
    c_job                 CONSTANT VARCHAR2(30) := 'BLOG_UPDATE_COUNTRY';
    job_not_exists        EXCEPTION;
    PRAGMA                EXCEPTION_INIT(job_not_exists, -27475);
  BEGIN
    BEGIN
      sys.dbms_scheduler.drop_job(c_job);
    EXCEPTION WHEN job_not_exists THEN
      NULL;
    END;
    
    IF NOT p_drop_only THEN
      sys.dbms_scheduler.create_job(
        job_name        => c_job,
        job_type        =>'STORED_PROCEDURE',
        job_action      => 'blog_job.update_country',
        start_date      => TRUNC(SYSTIMESTAMP, 'HH'),
        repeat_interval => 'FREQ=MINUTELY;BYMINUTE=5,15,25,35,45,55',
        enabled         => TRUE,
        comments        => 'Update blog visitors country'
      );
    END IF;
  END update_country_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE update_activity_logs_job (
    p_drop_only BOOLEAN DEFAULT FALSE
  )
  AS
    c_job          CONSTANT VARCHAR2(30) := 'BLOG_UPDATE_ACTIVITY_LOGS';
    job_not_exists EXCEPTION;
    PRAGMA         EXCEPTION_INIT(job_not_exists, -27475);
  BEGIN
    BEGIN
      sys.dbms_scheduler.drop_job(c_job);
    EXCEPTION WHEN job_not_exists THEN
      NULL;
    END;
    
    IF NOT p_drop_only THEN
      sys.dbms_scheduler.create_job(
        job_name        => c_job,
        job_type        =>'STORED_PROCEDURE',
        job_action      => 'blog_job.update_activity_logs',
        start_date      => TRUNC(SYSTIMESTAMP, 'HH'),
        repeat_interval => 'FREQ=HOURLY;BYMINUTE=10',
        enabled         => TRUE,
        comments        => 'Update blog statistic log mviews'
      );
    END IF;
  END update_activity_logs_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE purge_preview_job(
    p_drop_only BOOLEAN DEFAULT FALSE
  )
  AS
    c_job           CONSTANT VARCHAR2(30) := 'BLOG_PURGE_PREVIEW';
    job_not_exists  EXCEPTION;
    PRAGMA          EXCEPTION_INIT(job_not_exists, -27475);
  BEGIN
    BEGIN
      sys.dbms_scheduler.drop_job(c_job);
    EXCEPTION WHEN job_not_exists THEN
      NULL;
    END;
    IF NOT p_drop_only THEN
      sys.dbms_scheduler.create_job(
        job_name        => c_job,
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'blog_job.purge_preview',
        start_date      => TRUNC(SYSTIMESTAMP, 'HH'),
        repeat_interval => 'FREQ=DAILY',
        enabled         => TRUE,
        comments        => 'Purge blog article preview table'
      );
    END IF;
  END purge_preview_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_JOB";
/

CREATE OR REPLACE PACKAGE  "BLOG_INSTALL" 
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
  i sys.dbms_sql.varchar2_table;
  e sys.dbms_sql.varchar2_table;
  b BLOB;
--------------------------------------------------------------------------------
  PROCEDURE update_param_data(
    p_theme_path    IN VARCHAR2 DEFAULT NULL
  );
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE set_jobs;
--------------------------------------------------------------------------------
  PROCEDURE remove_jobs;
--------------------------------------------------------------------------------
  FUNCTION varchar2_to_blob(
    p_varchar2_tab IN sys.dbms_sql.varchar2_table
  ) RETURN BLOB;
--------------------------------------------------------------------------------
END "BLOG_INSTALL";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_INSTALL" 
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE update_param_data(
    p_theme_path    IN VARCHAR2 DEFAULT NULL
  )
  AS
    l_app_id    NUMBER;
    l_app_alias VARCHAR2(2000);
    l_base_url  VARCHAR2(2000);
  BEGIN
    l_base_url := apex_util.host_url('SCRIPT');
    SELECT application_id
    INTO l_app_id
    FROM apex_application_substitutions
    WHERE substitution_string = 'SCHEMA_VERSION'
      AND substitution_value = (select blog_util.get_param_value('SCHEMA_VERSION') from dual)
    ;
    SELECT alias
    INTO l_app_alias
    FROM apex_applications
    WHERE application_id = l_app_id
    ;
    UPDATE blog_param
    SET param_value = TO_CHAR(l_app_id)
    WHERE param_id  = 'G_BLOG_READER_APP_ID'
    ;
    UPDATE blog_param
    SET param_value = coalesce(p_theme_path,'f?p=' || TO_CHAR(l_app_id) || ':DOWNLOAD:0:')
    WHERE param_id  = 'G_THEME_PATH'
    ;
    UPDATE blog_param
    SET param_value = l_base_url || 'f?p=' || l_app_alias || ':RSS'
    WHERE param_id  = 'G_RSS_FEED_URL'
    ;
    UPDATE blog_param
    SET param_value = l_base_url
    WHERE param_id  = 'G_BASE_URL'
    ;
    dbms_mview.refresh('BLOG_PARAM_APP','C');
  END update_param_data;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE set_jobs
  AS
  BEGIN
    blog_job.update_country_job;
    blog_job.rotate_log_job;
    blog_job.update_activity_logs_job;
    blog_job.purge_preview_job;
  END set_jobs;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE remove_jobs
  AS
  BEGIN
    blog_job.update_country_job(TRUE);
    blog_job.rotate_log_job(0);
    blog_job.update_activity_logs_job(TRUE);
    blog_job.purge_preview_job(TRUE);
  END remove_jobs;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION varchar2_to_blob(
    p_varchar2_tab IN sys.dbms_sql.varchar2_table
  ) RETURN BLOB
  AS
    l_blob BLOB;
    l_size NUMBER;
  BEGIN
    dbms_lob.createtemporary(l_blob, true, dbms_lob.session);
    FOR i IN 1 .. p_varchar2_tab.count
    LOOP
      l_size := length(p_varchar2_tab(i)) / 2;
      dbms_lob.writeappend(l_blob, l_size, hextoraw(p_varchar2_tab(i)));
    END LOOP;
    RETURN l_blob;
  EXCEPTION WHEN OTHERS THEN
    dbms_lob.close(l_blob);
    RETURN NULL;
  END varchar2_to_blob;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_INSTALL";
/

CREATE OR REPLACE PACKAGE  "BLOG_ADMIN_APP" 
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
  PROCEDURE refresh_article_mview;
--------------------------------------------------------------------------------
  FUNCTION get_collection_name RETURN VARCHAR2;
--------------------------------------------------------------------------------
  PROCEDURE print_article_from_collection;
--------------------------------------------------------------------------------
  PROCEDURE table_to_collection (
    p_table       IN APEX_APPLICATION_GLOBAL.VC_ARR2
  );
--------------------------------------------------------------------------------
  PROCEDURE article_to_collection (
    p_article_id  IN NUMBER
  );
--------------------------------------------------------------------------------
  PROCEDURE save_article_text (
    p_article_id      IN NUMBER,
    p_success_message IN OUT NOCOPY VARCHAR2,
    p_message         IN VARCHAR DEFAULT 'Action Processed.'
  );
--------------------------------------------------------------------------------
  PROCEDURE save_article_preview (
    p_article_id      IN NUMBER,
    p_author_id       IN NUMBER,
    p_category_id     IN NUMBER,
    p_article_title   IN VARCHAR2,
    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2
  );
--------------------------------------------------------------------------------  
  PROCEDURE create_new_category(
    p_category_name IN VARCHAR2
  );
--------------------------------------------------------------------------------
  PROCEDURE cleanup_category_sequence;
--------------------------------------------------------------------------------
  PROCEDURE cleanup_faq_sequence;
--------------------------------------------------------------------------------
  PROCEDURE cleanup_author_sequence;
--------------------------------------------------------------------------------
  PROCEDURE cleanup_resource_sequence;
--------------------------------------------------------------------------------
  FUNCTION get_next_category_seq RETURN NUMBER;
--------------------------------------------------------------------------------
  FUNCTION get_next_author_seq RETURN NUMBER;
--------------------------------------------------------------------------------
  FUNCTION get_next_faq_seq RETURN NUMBER;
--------------------------------------------------------------------------------
  FUNCTION get_next_resource_seq (
    p_link_type IN VARCHAR2
  ) RETURN NUMBER;
--------------------------------------------------------------------------------
  FUNCTION display_param_value_item (
    p_param_id        IN VARCHAR2,
    p_param_type      IN VARCHAR2,
    p_param_nullable  IN VARCHAR2
  ) RETURN BOOLEAN;
--------------------------------------------------------------------------------
  FUNCTION set_param_value_item (
    p_param_id          IN VARCHAR2,
    p_yesno             IN VARCHAR2,
    p_text_null         IN VARCHAR2,
    p_number_null       IN VARCHAR2,
    p_number_not_null   IN VARCHAR2,
    p_text_not_null     IN VARCHAR2,
    p_textarea_null     IN VARCHAR2,
    p_textarea_not_null IN VARCHAR2
  ) RETURN VARCHAR2;
--------------------------------------------------------------------------------
  FUNCTION login(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
  ) RETURN BOOLEAN;
--------------------------------------------------------------------------------
  FUNCTION check_password(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
  ) RETURN BOOLEAN;
--------------------------------------------------------------------------------
  PROCEDURE post_login;
--------------------------------------------------------------------------------
  FUNCTION is_developer RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
  PROCEDURE get_apex_lang_message (
    p_application_id        IN NUMBER,
    p_translation_entry_id  IN NUMBER,
    p_translatable_message  OUT NOCOPY VARCHAR2,
    p_language_code         OUT NOCOPY VARCHAR2,
    p_message_text          OUT NOCOPY VARCHAR2,
    p_md5                   OUT NOCOPY VARCHAR2
   );
--------------------------------------------------------------------------------
  PROCEDURE upd_apex_lang_message (
    p_application_id        IN NUMBER,
    p_translation_entry_id  IN NUMBER,
    p_translatable_message  IN VARCHAR2,
    p_language_code         IN VARCHAR2,
    p_message_text          IN VARCHAR2,
    p_md5                   IN VARCHAR2,
    p_success_message       OUT NOCOPY VARCHAR2
   );
--------------------------------------------------------------------------------  
END "BLOG_ADMIN_APP";
/
CREATE OR REPLACE PACKAGE BODY  "BLOG_ADMIN_APP" 
AS
--------------------------------------------------------------------------------
  -- Private constants and functions
  g_article_text_collection CONSTANT VARCHAR2(80) := 'ARTICLE_TEXT_COLLECTION';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION build_apex_lang_message_md5 (
    p_translation_entry_id  IN NUMBER,
    p_translatable_message  IN VARCHAR2,
    p_language_code         IN VARCHAR2,
    p_message_text          IN VARCHAR2,
    p_col_sep   IN VARCHAR2 DEFAULT '|'
  ) RETURN VARCHAR2
  AS
  BEGIN
    RETURN sys.utl_raw.cast_to_raw(sys.dbms_obfuscation_toolkit.md5(input_string => 
      p_translation_entry_id || p_col_sep ||
      p_translatable_message || p_col_sep ||
      p_language_code || p_col_sep ||
      p_message_text || p_col_sep ||
      ''
    ));
  END build_apex_lang_message_md5;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE refresh_article_mview
  AS
  BEGIN
    dbms_mview.refresh('BLOG_ARCHIVE_LOV,BLOG_ARTICLE_HIT20,BLOG_ARTICLE_LAST20,BLOG_ARTICLE_TOP20','CCCC');
  END refresh_article_mview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION table_to_clob (
    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2
  ) RETURN CLOB
  AS
    l_len   SIMPLE_INTEGER := 0;
    l_data  CLOB;
  BEGIN

    l_len := p_table.COUNT;

    IF l_len = 0
    OR COALESCE(LENGTH(p_table(1)), 0) = 0
    THEN
      RETURN EMPTY_CLOB();
    END IF;

    dbms_lob.createtemporary(
      lob_loc => l_data,
      cache   => TRUE,
      dur     => dbms_lob.session
    );
    dbms_lob.open(l_data, dbms_lob.lob_readwrite);

    FOR i IN 1 .. l_len
    LOOP
      dbms_lob.writeappend(
        lob_loc => l_data,
        amount  => LENGTH(p_table(i)),
        buffer  => p_table(i)
      );
    END LOOP;
    dbms_lob.close(l_data);
    RETURN l_data;
  END table_to_clob;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE print_clob(
    p_clob IN CLOB
  )
  AS
    l_length      SIMPLE_INTEGER := 0;
    l_clob_len    SIMPLE_INTEGER := 0;
    l_offset      SIMPLE_INTEGER := 1;
    l_byte_len    SIMPLE_INTEGER := 0;
    l_temp        VARCHAR2(32767);
  BEGIN
  --
    l_length    := COALESCE(dbms_lob.getlength(p_clob), 0);
    l_clob_len  := l_length;
    l_byte_len  := 30000;
    --
    IF l_length < l_byte_len THEN
      sys.htp.prn(p_clob);
    ELSE
    --
      WHILE l_offset < l_length AND l_byte_len > 0
      LOOP
        /* Get 30k cut */
        l_temp := sys.dbms_lob.substr(p_clob,l_byte_len,l_offset);
        --
        /* Print HTML */
        sys.htp.prn(l_temp);
        --
        /* set the start position for the next cut */
        l_offset := l_offset + l_byte_len;
        --
        /* set the end position if less than 32k */
        l_clob_len := l_clob_len - l_byte_len;
        IF l_clob_len < l_byte_len THEN
          l_byte_len := l_clob_len;
        END IF;
      END LOOP;
    --
    END IF;
  END print_clob;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_collection_name RETURN VARCHAR2
  AS
  BEGIN
    RETURN g_article_text_collection;
  END;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE print_article_from_collection
  AS
    l_clob CLOB;
  BEGIN
    SELECT clob001
    INTO l_clob
    FROM apex_collections
    WHERE collection_name = g_article_text_collection
    AND seq_id = 1
    ;
    print_clob(l_clob);
  END print_article_from_collection ;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE table_to_collection (
    p_table IN APEX_APPLICATION_GLOBAL.VC_ARR2
  )
  AS
  BEGIN
    apex_collection.create_or_truncate_collection(g_article_text_collection);
    apex_collection.add_member(
      p_collection_name => g_article_text_collection,
      p_clob001         => table_to_clob(p_table)
    );
  END table_to_collection;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE article_to_collection (
    p_article_id IN NUMBER
  )
  AS
    l_clob CLOB;
  BEGIN
    apex_collection.create_or_truncate_collection(g_article_text_collection);
    BEGIN
      SELECT article_text
      INTO l_clob
      FROM blog_article
      WHERE article_id = p_article_id
      ;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      l_clob := NULL;
    END;
    apex_collection.add_member(
      p_collection_name => g_article_text_collection,
      p_clob001 => l_clob
    );
  END article_to_collection;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_article_text (
    p_article_id      IN NUMBER,
    p_success_message IN OUT NOCOPY VARCHAR2,
    p_message         IN VARCHAR DEFAULT 'Action Processed.'
  )
  AS
  BEGIN
    MERGE INTO blog_article a
    USING (
      SELECT p_article_id AS article_id,
        clob001
      FROM apex_collections
      WHERE collection_name = g_article_text_collection
        AND seq_id  = 1
    ) b
    ON (a.article_id = b.article_id)
    WHEN MATCHED THEN
    UPDATE SET a.article_text = b.clob001
    WHERE sys.dbms_lob.compare(a.article_text, b.clob001) != 0
      OR sys.dbms_lob.compare(a.article_text, b.clob001) IS NULL
    ;
    IF SQL%ROWCOUNT > 0 THEN
      p_success_message := COALESCE(p_success_message, p_message);
    END IF;

  END save_article_text;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE save_article_preview (
    p_article_id      IN NUMBER,
    p_author_id       IN NUMBER,
    p_category_id     IN NUMBER,
    p_article_title   IN VARCHAR2,
    p_article_text    IN APEX_APPLICATION_GLOBAL.VC_ARR2
  )
  AS
  BEGIN
    /* Hopefully we can someday share collections between applications */
    blog_admin_app.table_to_collection (p_article_text);
    MERGE INTO blog_article_preview a
    USING (
      SELECT p_article_id AS article_id,
        p_author_id       AS author_id,
        p_category_id     AS category_id,
        p_article_title   AS article_title,
        clob001           AS article_text
      FROM apex_collections
      WHERE collection_name = g_article_text_collection
        AND seq_id  = 1
    ) b
    ON (a.apex_session_id = b.article_id)
    WHEN MATCHED THEN
    UPDATE SET a.article_text = b.article_text,
      a.author_id             = b.author_id,
      a.category_id           = b.category_id,
      a.article_title         = b.article_title
    WHEN NOT MATCHED THEN
    INSERT (apex_session_id, author_id, category_id, article_title, article_text)
    VALUES (b.article_id, b.author_id, b.category_id, b.article_title, b.article_text)
    ;
  END save_article_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE create_new_category(
    p_category_name IN VARCHAR2
  )
  AS
    l_category_id NUMBER;
  BEGIN
    INSERT INTO blog_category (category_name, category_seq)
    VALUES(p_category_name, blog_admin_app.get_next_category_seq)
    RETURNING category_id INTO l_category_id;
    sys.htp.prn(l_category_id);
  EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
    sys.htp.prn(apex_lang.message('MSG_CATEGORY_EXISTS'));
  END create_new_category;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE cleanup_category_sequence
  AS
  BEGIN
    MERGE INTO blog_category a
    USING (
      SELECT c.category_id,
        ROW_NUMBER() OVER(ORDER BY c.category_seq) * 10 AS new_seq
      FROM blog_category c
    ) b
    ON (a.category_id = b.category_id)
    WHEN MATCHED THEN UPDATE 
    SET a.category_seq = b.new_seq
    ;
  END cleanup_category_sequence;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE cleanup_faq_sequence
  AS
  BEGIN
    MERGE INTO blog_faq a
    USING (
      SELECT c.faq_id,
        ROW_NUMBER() OVER(ORDER BY c.faq_seq) * 10 AS new_seq
      FROM blog_faq c
    ) b
    ON (a.faq_id = b.faq_id)
    WHEN MATCHED THEN UPDATE 
    SET a.faq_seq = b.new_seq
    ;
  END cleanup_faq_sequence;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE cleanup_author_sequence
  AS
  BEGIN
    MERGE INTO blog_author a
    USING (
      SELECT c.author_id,
        ROW_NUMBER() OVER(ORDER BY c.author_seq) * 10 AS new_seq
      FROM blog_author c
    ) b
    ON (a.author_id = b.author_id)
    WHEN MATCHED THEN UPDATE 
    SET a.author_seq = b.new_seq
    ;
  END cleanup_author_sequence;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE cleanup_resource_sequence
  AS
  BEGIN
    MERGE INTO blog_resource a
    USING (
      SELECT c.link_id,
        ROW_NUMBER() OVER(PARTITION BY c.link_type ORDER BY c.link_seq) * 10 AS new_seq
      FROM blog_resource c
    ) b
    ON (a.link_id = b.link_id)
    WHEN MATCHED THEN UPDATE 
    SET a.link_seq = b.new_seq
    ;
  END cleanup_resource_sequence;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_next_category_seq RETURN NUMBER
  AS
    l_max  NUMBER;
  BEGIN
    SELECT CEIL(COALESCE(MAX(category_seq) + 1, 1) / 10) * 10
    INTO l_max
    FROM blog_category
    ;
    RETURN l_max;
  END get_next_category_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_next_author_seq RETURN NUMBER
  AS
    l_max  NUMBER;
  BEGIN
    SELECT CEIL(COALESCE(MAX(author_seq) + 1, 1) / 10) * 10
    INTO l_max
    FROM blog_author
    ;
    RETURN l_max;
  END get_next_author_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_next_faq_seq RETURN NUMBER
  AS
    l_max  NUMBER;
  BEGIN
    SELECT CEIL(COALESCE(MAX(faq_seq) + 1, 1) / 10) * 10
    INTO l_max
    FROM blog_faq
    ;
    RETURN l_max;
  END get_next_faq_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_next_resource_seq (
    p_link_type IN VARCHAR2
  ) RETURN NUMBER
  AS
    l_max  NUMBER;
  BEGIN
    SELECT CEIL(COALESCE(MAX(link_seq) + 1, 1) / 10) * 10
    INTO l_max
    FROM blog_resource
    WHERE link_type = p_link_type
    ;
    RETURN l_max;
  END get_next_resource_seq;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION display_param_value_item (
    p_param_id        IN VARCHAR2,
    p_param_type      IN VARCHAR2,
    p_param_nullable  IN VARCHAR2
  ) RETURN BOOLEAN
  AS
    l_num SIMPLE_INTEGER := 0;
  BEGIN
    BEGIN
      SELECT 1
      INTO l_num
      FROM blog_param
      WHERE param_id = p_param_id
      AND param_type = p_param_type
      AND param_nullable = p_param_nullable
      ;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
    END;
    RETURN TRUE;
  END display_param_value_item;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION set_param_value_item (
    p_param_id          IN VARCHAR2,
    p_yesno             IN VARCHAR2,
    p_text_null         IN VARCHAR2,
    p_number_null       IN VARCHAR2,
    p_number_not_null   IN VARCHAR2,
    p_text_not_null     IN VARCHAR2,
    p_textarea_null     IN VARCHAR2,
    p_textarea_not_null IN VARCHAR2
  ) RETURN VARCHAR2
  AS
    l_value VARCHAR2(32700);
  BEGIN
    SELECT CASE
      WHEN param_type = 'YESNO' THEN
        p_yesno
      WHEN param_type = 'TEXT' AND param_nullable = 'Y' THEN
        p_text_null
      WHEN param_type = 'TEXT' AND param_nullable = 'N' THEN
        p_text_not_null
      WHEN param_type = 'NUMBER' AND param_nullable = 'Y' THEN
        p_number_null
      WHEN param_type = 'NUMBER' AND param_nullable = 'N' THEN
        p_number_not_null
      WHEN param_type = 'TEXTAREA' AND param_nullable = 'Y' THEN
        p_textarea_null
      WHEN param_type = 'TEXTAREA' AND param_nullable = 'N' THEN
        p_textarea_not_null
    END AS param_value
    INTO l_value
    FROM blog_param
    WHERE param_id = p_param_id
    ;
    RETURN l_value;
  END set_param_value_item;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION login(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
  ) RETURN BOOLEAN
  AS
    AUTH_SUCCESS            CONSTANT INTEGER      := 0;
    AUTH_UNKNOWN_USER       CONSTANT INTEGER      := 1;
    AUTH_ACCOUNT_LOCKED     CONSTANT INTEGER      := 2;
    AUTH_ACCOUNT_EXPIRED    CONSTANT INTEGER      := 3;
    AUTH_PASSWORD_INCORRECT CONSTANT INTEGER      := 4;
    AUTH_PASSWORD_FIRST_USE CONSTANT INTEGER      := 5;
    AUTH_ATTEMPTS_EXCEEDED  CONSTANT INTEGER      := 6;
    AUTH_INTERNAL_ERROR     CONSTANT INTEGER      := 7;
    l_password              VARCHAR2(4000);
    l_stored_password       VARCHAR2(4000);
  BEGIN
    -- First, check to see if the user is in the user table and have password
    BEGIN
      SELECT passwd
      INTO l_stored_password
      FROM blog_author
      WHERE user_name = p_username
      AND active = 'Y'
      AND passwd IS NOT NULL
      ;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_UNKNOWN_USER);
      RETURN FALSE;
    END;
    -- Apply the custom hash function to the password
    l_password := blog_pw_hash(p_username, p_password);
    -- Compare them to see if they are the same and return either TRUE or FALSE
    IF l_password = l_stored_password THEN
      APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_SUCCESS);
      RETURN TRUE;
    END IF;
    APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_PASSWORD_INCORRECT);
    RETURN FALSE;
  END login;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION check_password (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2
  ) RETURN BOOLEAN
  AS
    l_password              VARCHAR2(4000);
    l_stored_password       VARCHAR2(4000);
  BEGIN
    -- First, check to see if the user is in the user table and have password
    BEGIN
      SELECT passwd
      INTO l_stored_password
      FROM blog_author
      WHERE user_name = p_username
      AND active = 'Y'
      AND passwd IS NOT NULL
      ;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
    END;
    -- Apply the custom hash function to the password
    l_password := blog_pw_hash(p_username, p_password);
    -- Compare them to see if they are the same and return either TRUE or FALSE
    IF l_password = l_stored_password THEN
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END check_password;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE post_login
  AS
    l_app_user  VARCHAR2(255);
    l_author_id NUMBER;
    l_app_id    NUMBER;
    l_reader_id NUMBER;
  BEGIN
    l_app_user  := v('APP_USER');
    l_app_id    := nv('APP_ID');
    SELECT author_id
      INTO l_author_id
      FROM blog_author
     WHERE user_name = l_app_user
      AND active = 'Y'
      AND passwd IS NOT NULL
    ;
    blog_util.set_items_from_param(l_app_id);
    apex_util.set_session_state('G_AUTHOR_ID', l_author_id);
    apex_util.set_session_state('G_DATE_TIME_FORMAT', COALESCE(apex_util.get_preference('DATE_TIME_FORMAT', l_app_user), 'DD Mon YYYY HH24:MI:SS'));
    IF apex_util.get_preference('SHOW_HELP', l_app_user) IS NULL THEN
      apex_util.set_preference(
        p_preference => 'SHOW_HELP',
        p_value => 'Y',
        p_user => l_app_user
      );
    END IF;
    l_reader_id := nv('G_BLOG_READER_APP_ID');
    FOR c1 IN (
      SELECT alias
      FROM apex_applications
      WHERE application_id = l_reader_id
    ) LOOP
      apex_util.set_session_state('G_BLOG_READER_APP_ALIAS', c1.alias);
    END LOOP;
  END post_login;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION is_developer RETURN PLS_INTEGER
  AS
  BEGIN
    RETURN CASE WHEN apex_authorization.is_authorized('IS_DEVELOPER') THEN 1 ELSE 0 END;
  END ;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE get_apex_lang_message (
    p_application_id        IN NUMBER,
    p_translation_entry_id  IN NUMBER,
    p_translatable_message  OUT NOCOPY VARCHAR2,
    p_language_code         OUT NOCOPY VARCHAR2,
    p_message_text          OUT NOCOPY VARCHAR2,
    p_md5                   OUT NOCOPY VARCHAR2
   )
   AS
   BEGIN
    FOR c1 IN (
      SELECT translation_entry_id
        ,translatable_message
        ,language_code
        ,message_text
      FROM apex_application_translations
      WHERE application_id = p_application_id
        AND translation_entry_id = p_translation_entry_id
    ) LOOP
      p_translatable_message := c1.translatable_message;
      p_language_code := c1.language_code;
      p_message_text := c1.message_text;
      p_md5 := build_apex_lang_message_md5 (
          c1.translation_entry_id,
          c1.translatable_message,
          c1.language_code,
          c1.message_text 
      );
    END LOOP;
  END get_apex_lang_message;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  PROCEDURE upd_apex_lang_message (
    p_application_id        IN NUMBER,
    p_translation_entry_id  IN NUMBER,
    p_translatable_message  IN VARCHAR2,
    p_language_code         IN VARCHAR2,
    p_message_text          IN VARCHAR2,
    p_md5                   IN VARCHAR2,
    p_success_message       OUT NOCOPY VARCHAR2
  )
  AS
    l_input_md5 varchar2(32676);
    l_table_md5 varchar2(32676);
  BEGIN
    l_input_md5 := build_apex_lang_message_md5 (
        p_translation_entry_id,
        p_translatable_message,
        p_language_code,
        p_message_text 
     );
    IF p_md5 IS NOT NULL THEN
      FOR c1 IN (
        SELECT translation_entry_id
          ,translatable_message
          ,language_code
          ,message_text
        FROM apex_application_translations
        WHERE application_id = p_application_id
        AND translation_entry_id = p_translation_entry_id
      ) LOOP
          l_table_md5 := build_apex_lang_message_md5 (
              c1.translation_entry_id,
              c1.translatable_message,
              c1.language_code,
              c1.message_text 
           );
      END LOOP;
    END IF;
    IF l_table_md5 != p_md5 THEN
      raise_application_error (-20001, apex_lang.message('MSG_LOST_UPDATE', l_table_md5, p_md5));
    ELSIF p_md5       IS NOT NULL
    AND   l_table_md5 IS NOT NULL
    AND   l_table_md5 = p_md5
    AND   l_input_md5 != p_md5
    THEN
      apex_lang.update_message(
        p_id => p_translation_entry_id,
        p_message_text => p_message_text
      );
      p_success_message := apex_lang.message('MSG_ACTION_PROCESSED');
    END IF;
  END upd_apex_lang_message;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
END "BLOG_ADMIN_APP";
/

