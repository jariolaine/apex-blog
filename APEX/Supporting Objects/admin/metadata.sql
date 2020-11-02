--------------------------------------------------------
--  Inserting into BLOG_PAGES
--------------------------------------------------------
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','10','Home','HOME',null,'TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','20','Links','LINKS','BLOG_FEATURE_LINKS','TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','30','Files','REPOSITORY','BLOG_FEATURE_FILES','TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','40','About','ABOUT','BLOG_FEATURE_ABOUT','TAB');

--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('0','40','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_POST');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','50','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','60','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','70','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','90','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','100','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','110','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','120','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','130','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_SEARCH');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group) values ('1','140','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_SEARCH');

--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('10','0','APP_GROUP','STRING','INTERNAL',null,null,null,'BLOG_040000','BLOG_040000');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('40','0','G_LATEST_POST_ROWS','INTEGER','BLOG_PAR_GROUP_UI',null,'1','20','5','5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('50','0','G_COMMENT_WATCH_MONTHS','INTEGER','INTERNAL',null,'1','6','1','1');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('100','0','G_APP_NAME','STRING','BLOG_PAR_GROUP_GENERAL',null,null,null,'My Blog','My Blog');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('110','0','G_APP_DESC','STRING','BLOG_PAR_GROUP_GENERAL',null,null,null,'About Almost Everything','About Almost Everything');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('120','1','G_APP_EMAIL','EMAIL','BLOG_PAR_GROUP_GENERAL',null,null,null,null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('140','0','G_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI',null,null,null,'fmDD Mon YYYY','fmDD Mon YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('150','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI',null,null,null,'fmDay, Month DD, YYYY','fmDay, Month DD, YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('160','0','P1_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50','5','5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('160','0','G_ARCHIVE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI',null,null,null,'fmMonth, YYYY','fmMonth, YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('170','0','P2_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50','10','10');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('180','0','G_SEARCH_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50','10','10');
-- modify
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('30','1','G_ADMIN_APP_ID','STRING','INTERNAL',null,null,null,null,to_char(apex_application_install.get_application_id, 'fm99999999999999999999999999999999999999'));
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('190','0','CANONICAL_URL','URL','BLOG_PAR_GROUP_SEO','trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) )',null,null,'<url>',apex_util.host_url());
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('210','1','G_RSS_XSL_URL','URL','BLOG_PAR_GROUP_SEO',null,null,null,'<url>/home?request=application_process=rss.xsl',apex_util.host_url('SCRIPT') || '/home?request=application_process=rss.xsl');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,example_value,attribute_value) values ('200','1','G_RSS_URL','URL','BLOG_PAR_GROUP_SEO',null,null,null,'<url>/home?request=application_process=rss.xml',apex_util.host_url('SCRIPT') || '/home?request=application_process=rss.xml');

--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items(is_active, application_id, item_name)
select 1 as is_active
  ,ai.application_id  as application_id
  ,ai.item_name       as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
and ai.application_id = apex_application_install.get_application_id
  union all
select 1 as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
and pi.application_id = apex_application_install.get_application_id
;
