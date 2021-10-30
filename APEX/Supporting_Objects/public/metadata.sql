--
--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('0','40','BLOG_FEATURE_EMAIL_VALIDATION_API','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','50','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_MISC',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','60','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','100','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','110','BLOG_FEATURE_CATEGORY_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_CATEGORY',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','150','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','160','BLOG_FEATURE_ARCHIVE_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_ARCHIVE',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','200','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','210','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','220','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_LINKS',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','230','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','240','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_FILES',null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','250','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','260','BLOG_FEATURE_MODAL_PAGES','BLOG_FEATURE_GROUP_MISC',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('0','270','BLOG_FEATURE_SITEMAP','BLOG_FEATURE_GROUP_MISC',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','1010','BLOG_ADM_FEATURE_APEX_AUTH','BLOG_FEATURE_GROUP_AUTH',null,null);
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','1020','BLOG_ADM_FEATURE_GOOGLE_AUTH','BLOG_FEATURE_GROUP_AUTH',null,null);
--
--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('20','1','G_PUB_APP_ID','STRING','INTERNAL',null,null,null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('30','0','G_APP_VERSION','STRING','INTERNAL',null,null,null,null,'Release 4.4.20211030');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('40','0','G_ADMIN_APP_AUTHZ_GROUP','STRING','INTERNAL',null,null,null,null,'Bloggers');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('50','1','G_RSS_XSL_CSS_URL','STRING','INTERNAL',null,null,null,null,'css/rss-xsl.css');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('60','1','G_SITEMAP_URL','URL','INTERNAL',null,null,null,null,apex_util.host_url('SCRIPT') || 'f?p=' || blog_util.int_to_vc2(apex_application_install.get_application_id) || ':pgm::application_process=sitemap-index.xml');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('70','0','G_COMMENT_WATCH_MONTHS','INTEGER','INTERNAL',null,'1','6',null,'1');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('120','0','G_LATEST_POST_ROWS','INTEGER','BLOG_PAR_GROUP_UI',null,'1','20',null,'5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('130','0','G_APP_NAME','STRING','BLOG_PAR_GROUP_GENERAL',null,null,null,null,'My Blog');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('140','0','G_APP_DESC','STRING','BLOG_PAR_GROUP_GENERAL',null,null,null,null,'About Almost Everything');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('150','1','G_APP_EMAIL','EMAIL','BLOG_PAR_GROUP_GENERAL',null,null,null,null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('160','0','G_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI',null,null,null,null,'fmDD Mon YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('170','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI',null,null,null,null,'fmDay, Month DD, YYYY');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('180','0','P1_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50',null,'5');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('200','0','P2_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50',null,'10');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('210','0','G_SEARCH_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS',null,'1','50',null,'10');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('220','0','G_CANONICAL_URL','URL','BLOG_PAR_GROUP_SEO','trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) )',null,null,null,apex_util.host_url());
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('230','1','G_RSS_URL','URL','BLOG_PAR_GROUP_SEO',null,null,null,null,apex_util.host_url('SCRIPT') || 'f?p=' || blog_util.int_to_vc2(apex_application_install.get_application_id) || ':pgm::application_process%3Drss.xml');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,post_expression,int_min,int_max,help_message,attribute_value) values ('240','1','G_RSS_XSL_URL','URL','BLOG_PAR_GROUP_SEO',null,null,null,null,apex_util.host_url('SCRIPT') || 'f?p=' || blog_util.int_to_vc2(apex_application_install.get_application_id) || ':pgm::application_process%3Drss.xsl');
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

