--
--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,'BLOG_HELP_FEATURE_ALLOW_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_HELP_FEATURE_MODERATE_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_HELP_FEATURE_SUBSCRIBE_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','50','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_POST_PAGINATION');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','60','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_SEARCH_POSTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_LATEST_POSTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','100','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_CATEGORY');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','110','BLOG_FEATURE_CATEGORY_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_CATEGORY','BLOG_HELP_FEATURE_CATEGORY_POST_COUNT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','150','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_ARCHIVE');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','160','BLOG_FEATURE_ARCHIVE_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_ARCHIVE','BLOG_HELP_FEATURE_ARCHIVE_POST_COUNT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','200','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_RSS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','210','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_LINKS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','220','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_LINKS','BLOG_HELP_FEATURE_SEARCH_LINKS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','230','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_FILES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','240','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_FILES','BLOG_HELP_FEATURE_SEARCH_FILES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','250','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_ABOUT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','260','BLOG_FEATURE_MODAL_PAGES','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_MODAL_PAGES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','270','BLOG_FEATURE_SITEMAP','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_SITEMAP');
--
--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('20','1','G_PUB_APP_ID','STRING','INTERNAL',null,null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('30','0','G_APP_VERSION','STRING','INTERNAL',null,null,null,'Release 21.1.20220404');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('70','0','G_COMMENT_WATCH_MONTHS','INTEGER','INTERNAL',null,'1','6','1');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('130','0','G_APP_NAME','STRING','BLOG_SETTING_GROUP_GENERAL',null,null,null,'My Blog');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('140','0','G_APP_DESC','STRING','BLOG_SETTING_GROUP_GENERAL',null,null,null,'About Almost Everything');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('150','1','G_APP_EMAIL','EMAIL','BLOG_SETTING_GROUP_GENERAL',null,null,null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('160','0','G_APP_DATE_FORMAT','DATE_FORMAT','BLOG_SETTING_GROUP_UI',null,null,null,'fmDD Mon YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('170','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_SETTING_GROUP_UI',null,null,null,'fmDay, Month DD, YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('200','0','P1_REPORT_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS',null,'1','50','5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('210','0','P2_REPORT_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS',null,'1','50','10');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('230','0','G_LATEST_POST_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS',null,'1','20','5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('240','0','G_SEARCH_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS',null,'1','50','10');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('300','0','G_CANONICAL_URL','URL','BLOG_SETTING_GROUP_SEO','trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) )',null,null,apex_util.host_url());
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('310','1','G_RSS_URL','URL','BLOG_SETTING_GROUP_SEO',null,null,null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,attribute_group_message,post_expression,int_min,int_max,attribute_value) values ('320','1','G_RSS_XSL_URL','URL','BLOG_SETTING_GROUP_SEO',null,null,null,null);
--
--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items(is_active, application_id, item_name)
select 1              as is_active
  ,ai.application_id  as application_id
  ,ai.item_name       as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
  and ai.application_id = apex_application_install.get_application_id
  union all
select 1              as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
  and pi.application_id = apex_application_install.get_application_id
  union all
select 1              as is_active
  ,ai.application_id  as application_id
  ,ai.item_name       as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
  and ai.application_id = blog_util.get_attribute_value( 'G_ADMIN_APP_ID' )
  union all
select 1              as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
  and pi.application_id = blog_util.get_attribute_value( 'G_ADMIN_APP_ID' )
;

