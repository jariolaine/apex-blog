REM INSERTING into BLOG_PARAM
SET DEFINE OFF;
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('BLOG_EMAIL','Y','Sender of notification emails','blog@blogexample.org','Email address witch is used notification emails from field.','TEXT','Y','EMAIL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('COMMENT_VERIFY_QUESTION','Y','Math question to verify comment is not posted by bot','Y',null,'YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('FOLLOWUP_EMAIL_BODY','Y','Followup email message body','Hi #NICK_NAME#,

You have chosen to receive follow up notification if new comment is posted to article "#ARTICLE_TITLE#".
To follow up the article new comment(s), please go to:
#ARTICLE_URL#

If you wish not get notification email in future please go to:
#UNSUBSCRIBE_URL#

Best regards,
#BLOG_NAME#
',null,'TEXTAREA','Y','EMAIL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('FOLLOWUP_EMAIL_SUBJ','Y','Followup email message subject','New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.',null,'TEXT','Y','EMAIL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_ARTICLE_ROWS','Y','Article per pagination page','3',null,'NUMBER','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_BASE_URL','Y','Canonical URL','http://vbox-apex/apex/',null,'TEXT','N','SEO',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_BING_WEBMASTER_META','Y','Bing webmaster tools verification meta tag',null,null,'TEXT','Y','SEO',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_BLOG_DESCRIPTION','Y','Blog short description','Blogging about all stuff',null,'TEXT','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_BLOG_NAME','Y','Blog name','My Blog',null,'TEXT','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_BLOG_READER_APP_ID','N','Blog reader application id','290','Used for query blog reader application alias. Only for developers.','NUMBER','N','INTERNAL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_COMMENT_ROWS','Y','Comments per pagination page','10',null,'NUMBER','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_DATE_FORMAT','Y','Date format','fmDD Mon YYYY','Blog reader date format.','TEXT','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_GOOGLE_ANALYTICS_TRACING_CODE','Y','Google Analytics tracking ID',null,null,'TEXTAREA','Y','SEO',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_GOOGLE_WEBMASTER_META','Y','Google webmaster tools verification meta tag',null,null,'TEXT','Y','SEO',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_RSS_FEED_URL','Y','RSS feed URL','f?p=DEV_BLOG:RSS:0',null,'TEXT','Y','RSS','SHOW_RSS_FEED');
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('G_THEME_PATH','Y','HTTP server folder where theme is located','/b/t/',null,'TEXT','N','UI',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('LOGGING_ENABLED','Y','Log activity','Y','If set "<b>Yes</b>", new sessions, article access, category access and users search are logged. Setting this to "<b>No</b>" <u>may</u> increase performance.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('LOG_ROTATE_DAY','N','Rotate log after days','14','Logs rotate interval for application logs. Nothing to do with APEX engine logs. In future release this might be controlled by author. Currently only developer can change this attribute and it do affect only when blog is installed. Changing this already installed blog don''t have any affects.','NUMBER','N','INTERNAL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('RSS_DESCRIPTION','Y','RSS feed description','My Blog most recent articles',null,'TEXT','Y','RSS','SHOW_RSS_FEED');
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_ABOUT_PAGE','Y','Show about page/tab','Y','If set to "<b>Yes</b>", about page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_AUTHOR_PAGE','Y','Show authors tab/page','Y','If set to "<b>Yes</b>", authors page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_BLOG_DESCRIPTION','Y','Show blog description below blog name','Y',null,'YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_BLOG_REPORT','Y','Show list of other blogs in resource page','Y',null,'YESNO','N','AUTH','SHOW_RESOURCE_PAGE');
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_CONTACT_PAGE','Y','Show contact form tab/page','Y','If set to "<b>Yes</b>", contact form page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_DISCLAIMER_PAGE','Y','Show disclaimer page/tab','Y','If set to "<b>Yes</b>", disclaimer page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_FAQ_PAGE','Y','Show frequently asked questions tab/page','Y','If set to "<b>Yes</b>", FAQ page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_FILE_PAGE','Y','Show files tab/page','Y','If set to "<b>Yes</b>", files page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_FOOTER','Y','Show footer text','Y',null,'YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_RESOURCE_PAGE','Y','Show resources page/tab','Y','If set to "<b>Yes</b>", resources page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_RESOURCE_REPORT','Y','Show list of useful links in resource page','Y',null,'YESNO','N','AUTH','SHOW_RESOURCE_PAGE');
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_RSS_FEED','Y','Publish RSS feed','Y','If set "<b>Yes</b>", sitemap is published on URL &G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:RSS. Also RSS feed is shown in blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SHOW_VISITOR_PAGE','Y','Show visitor page/tab','Y','If set to "<b>Yes</b>", visitors map page can be accessed from blog reader.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('ALLOW_COMMENT','Y','Allow users post comments to articles','Y','If set "<b>Yes</b>", readers can post comments to any article.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('NEW_COMMENT_EMAIL_BODY','Y','Notify author for new comment email message body','Hi #AUTHOR_NAME#,

New comment is posted to article "#ARTICLE_TITLE#".
#ARTICLE_URL#

Best regards,
#BLOG_NAME#
',null,'TEXTAREA','Y','EMAIL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('NEW_COMMENT_EMAIL_SUBJ','Y','Notify author for new comment email message subject','New comment on #BLOG_NAME# article: #ARTICLE_TITLE#.',null,'TEXT','Y','EMAIL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SCHEMA_VERSION','N','Blog engine version id','2.9.0.1','Used on future releases for upgrade. Only for developers.','TEXT','N','INTERNAL',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('SITEMAP_ENABLED','Y','Publish sitemap','Y','If set "<b>Yes</b>", sitemap is published on URL &G_BASE_URL.f?p=&G_BLOG_READER_APP_ALIAS.:SITEMAP.','YESNO','N','AUTH',null);
Insert into BLOG_PARAM (PARAM_NAME,EDITABLE,PARAM_DESC,PARAM_VALUE,PARAM_HELP,PARAM_TYPE,PARAM_NULLABLE,PARAM_GROUP,PARAM_PARENT) values ('MODERATION_ENABLED','Y','All comments must be moderated by the blog author','N','If set "<b>Yes</b>", all comments must be moderated and approved by blog author(s).','YESNO','N','AUTH',null);
